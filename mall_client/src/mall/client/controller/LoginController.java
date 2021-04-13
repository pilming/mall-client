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
		if(returnClient != null) {
			session.setAttribute("loginClient", returnClient);
		}
		response.sendRedirect(request.getContextPath()+"/IndexController");
		
	}

}
