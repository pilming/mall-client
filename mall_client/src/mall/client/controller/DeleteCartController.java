package mall.client.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;
import mall.client.vo.Client;

@WebServlet("/DeleteCartController")
public class DeleteCartController extends HttpServlet {
	private CartDao cartDao; 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인 아니면 redirect
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		//세션으로 받은 아이디 디버깅
		System.out.println(((Client)(session.getAttribute("loginClient"))).getClientMail() + "<------CartListController에서 loginClient");
		//아이디 저장
		String clientMail =  ((Client)(session.getAttribute("loginClient"))).getClientMail();
		
		//받아온 데이터
		int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
		
		//dao호출
		this.cartDao = new CartDao();
		
		//삭제실행
		this.cartDao.deleteCart(clientMail, ebookNo);
		
		//리다이렉트
		response.sendRedirect(request.getContextPath()+"/CartListController");
		
	}
}
