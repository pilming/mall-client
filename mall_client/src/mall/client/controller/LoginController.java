package mall.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.ClientDao;
import mall.client.vo.Client;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	
	private ClientDao clientDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//만약 로그인 한 상태라면 다시 인덱스로 보냄
		if(session.getAttribute("loginClient") != null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		
		//로그인하지 않은 상태라면 회원가입 view로 보낸다.
		request.getRequestDispatcher("/WEB-INF/view/client/loginClient.jsp").forward(request, response);
	}
	@Override //원래는 이게 생략 돼 있음
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 유효성 검사
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") != null) {
			response.sendRedirect(request.getContextPath()+"/IndexConreoller");
			return;
		}
		//----------------------------------------------------------------------
		
		request.setCharacterEncoding("utf-8");
		String ClientMail = request.getParameter("clientMail");
		String clientPw = request.getParameter("clientPw");
		Client client = new Client();
		client.setClientMail(ClientMail);
		client.setClientPw(clientPw);
		
		this.clientDao = new ClientDao();
		Client returnClient = this.clientDao.login(client);
		//로그인 성공하면 세션에 로그인 정보 기록
		if(returnClient != null) {
			session.setAttribute("loginClient", returnClient);
		}
		//여기선 넘겨줄 정보가 없기때문에 sendRedirect로 하던 RequestDispatcher로하던 상관없지만 굳이 RequestDispatcher로 할필요없으니.
		response.sendRedirect(request.getContextPath()+"/IndexController");
		
	}

}
