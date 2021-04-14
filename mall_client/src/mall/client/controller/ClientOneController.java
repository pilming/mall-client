package mall.client.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.ClientDao;
import mall.client.vo.Client;

@WebServlet("/ClientOneController")
public class ClientOneController extends HttpServlet {
	private ClientDao clientDao; 
	//회원정보 보여주기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//로그인 안했으면 인덱스 페이지로
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		System.out.println(((Client)(session.getAttribute("loginClient"))).getClientMail() + "<------ClientOneController에서 loginClient");
		
		String clientMail = ((Client)(session.getAttribute("loginClient"))).getClientMail();
		//dao호출
		this.clientDao = new ClientDao();
		
		//보여출 클라이언트 정보가 담겨있는 객체
		Client clientOne = this.clientDao.selectClientOne(clientMail);
		System.out.println(clientOne + "<------ClientOneController에서 clientOne");
		//세션에 저장
		request.setAttribute("clientOne", clientOne);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/client/clientOne.jsp");
		rd.forward(request, response);
			 
	}
	
	//회원정보 수정
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.clientDao = new ClientDao();
		//form으로 받은 데이터 수집, 데이터를 담을 객체생성
		String newPw = request.getParameter("newPw");
		Client client = new Client();
		client.setClientMail(request.getParameter("clientMail"));
		client.setClientPw(request.getParameter("currentPw"));
		
		
		//dao호출
		this.clientDao = new ClientDao();
		
		//아이디와 비밀번호 대조 후 다르면 기존페이지 유지
		if(this.clientDao.compareIdPw(client) == false) {
			response.sendRedirect(request.getContextPath()+"/ClientOneController");
			System.out.println("비밀번호가 틀렸습니다.");
			return;
		}
		
		//일치하면 비밀번호 변경
		this.clientDao.updateClientPw(client, newPw);
		System.out.println("비밀번호 변경 완료.");
		
		//완료후 다시 index페이지로
		response.sendRedirect(request.getContextPath()+"/IndexController");
		
	}

}
