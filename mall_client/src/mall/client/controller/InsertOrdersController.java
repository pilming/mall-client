package mall.client.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mall.client.model.CartDao;
import mall.client.model.OrdersDao;
import mall.client.vo.Client;
import mall.client.vo.Orders;

@WebServlet("/InsertOrdersController")
public class InsertOrdersController extends HttpServlet {
	private OrdersDao ordersDao;
	private CartDao cartDao;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션 받아오기
		HttpSession session = request.getSession();
		if(session.getAttribute("loginClient") == null) {
			response.sendRedirect(request.getContextPath()+"/IndexController");
			return;
		}
		//의존 객체 생성 후 주입
		this.ordersDao = new OrdersDao();
		this.cartDao = new CartDao();
		//request
		int ebookNo = Integer.parseInt(request.getParameter("ebookNo"));
		Client client = (Client)session.getAttribute("loginClient");
	
		String clientMail = client.getClientMail();
		int clientNo = client.getClientNo();
		Orders orders = new Orders();
		orders.setClientNo(clientNo);
		orders.setEbookNo(ebookNo);
		
		
		
		//dao
		//insert 후 delete되기전 db에 문제가 생기면? --> insert도 취소(롤백) --> 트랜잭션처리
		this.ordersDao.insertOrders(orders);
		this.cartDao.deleteCart(clientMail, ebookNo);
		
		
		response.sendRedirect(request.getContextPath()+"/OrdersListController");
		
	}

}
