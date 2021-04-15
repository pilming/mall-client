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
		
		//보여줄 클라이언트 정보가 담겨있는 객체
		Client clientOne = this.clientDao.selectClientOne(clientMail);
		System.out.println(clientOne + "<------ClientOneController에서 clientOne");
		//request객체에 클라이언트 정보 저장
		request.setAttribute("clientOne", clientOne);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/client/clientOne.jsp");
		rd.forward(request, response);
			 
	}

}
