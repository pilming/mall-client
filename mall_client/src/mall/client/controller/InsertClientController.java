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
	//�� c->v
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//���� �α��� �� ���¶�� �ٽ� �ε����� ����
		if(session.getAttribute("loginClient") != null) {
			response.sendRedirect("/IndexController");
		}
		
		//�α������� ���� ���¶�� ȸ������ view�� ������.
		request.getRequestDispatcher("/WEB-INF/view/client/insertClient.jsp").forward(request, response);
	}
	//action c-> m-> redirect ȸ������view���� ���� �����͸� ó��
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.clientDao = new ClientDao();
		
		//form���� ���� ������ client�Ű������� ����ϱ� ���ؼ� ���ο� ��ü ���� �� ���̴��� �����Ѵ�.
		Client client = new Client();
		client.setClientMail(request.getParameter("clientMail"));
		client.setClientPw(request.getParameter("clientPw"));
		
		//ȸ������ ��� �� �켱������ ������ �ߺ����� Ȯ���Ѵ�. �ߺ��� ��� �ٽ� insertClient.jsp�� ����
		String checkMail = this.clientDao.selectClientMail(client.getClientMail());
		System.out.println(checkMail);
		if(checkMail != null) {
			request.getRequestDispatcher("/WEB-INF/view/client/insertClient.jsp").forward(request, response);
			return;
		}
		//�ߺ��� ���̵� �ƴ϶�� ȸ������ ���� (�����ͺ��̽��� �߰�)
		this.clientDao.insertClient(client);
		
		response.sendRedirect(request.getContextPath()+"/IndexController");
	}

}
