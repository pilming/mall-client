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
		//로그인 성공하면 세션에 로그인 정보 기록
		if(returnClient != null) {
			session.setAttribute("loginClient", returnClient);
		}
		//여기선 넘겨줄 정보가 없기때문에 sendRedirect로 하던 RequestDispatcher로하던 상관없지만 굳이 RequestDispatcher로 할필요없으니.
		response.sendRedirect(request.getContextPath()+"/IndexController");
		
	}

}
