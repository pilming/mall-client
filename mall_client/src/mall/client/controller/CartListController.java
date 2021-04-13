package mall.client.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;
import mall.client.vo.*;

@WebServlet("/CartListController")
public class CartListController extends HttpServlet {
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
		//dao호출
		this.cartDao = new CartDao();
		//매개변수로 넘겨줄 현재 로그인한 clientmail
		String clientMail =  ((Client)(session.getAttribute("loginClient"))).getClientMail();
		
		//받아온 리스트 디버깅
		System.out.println(clientMail + "<------CartListController에서 clientMail");
		List<Map<String, Object>> cartList = this.cartDao.selectCartList(clientMail); //카드리스트를 불러옴	
		
		//forward
		//넘겨줄 리스트 저장
		request.setAttribute("cartList", cartList);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/cart/cartList.jsp");
		rd.forward(request, response);
	}
}