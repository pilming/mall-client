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


@WebServlet("/InsertClientController")
public class InsertClientController extends HttpServlet {
	private ClientDao clientDao;
	//폼 c->v
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//만약 로그인 한 상태라면 다시 인덱스로 보냄
		if(session.getAttribute("loginClient") != null) {
			response.sendRedirect("/IndexController");
		}
		
		//로그인하지 않은 상태라면 회원가입 view로 보낸다.
		request.getRequestDispatcher("/WEB-INF/view/client/insertClient.jsp").forward(request, response);
	}
	//action c-> m-> redirect 회원가입view에서 받은 데이터를 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.clientDao = new ClientDao();
		
		//form으로 받은 정보를 client매개변수로 사용하기 위해서 새로운 객체 생성 후 데이터를 저장한다.
		Client client = new Client();
		client.setClientMail(request.getParameter("clientMail"));
		client.setClientPw(request.getParameter("clientPw"));
		
		//회원으로 등록 전 우선적으로 메일이 중복인지 확인한다. 중복일 경우 다시 insertClient.jsp로 복귀
		String checkMail = this.clientDao.selectClientMail(client.getClientMail());
		System.out.println(checkMail);
		if(checkMail != null) {
			request.getRequestDispatcher("/WEB-INF/view/client/insertClient.jsp").forward(request, response);
			return;
		}
		//중복된 아이디가 아니라면 회원가입 진행 (데이터베이스에 추가)
		this.clientDao.insertClient(client);
		
		response.sendRedirect(request.getContextPath()+"/IndexController");
	}

}
