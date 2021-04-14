package mall.client.model;

import java.sql.*;
import mall.client.commons.DBUtil;
import mall.client.vo.*;

public class ClientDao {
	private DBUtil dbUtil;
	
	//ȸ������
	public int insertClient(Client client) {
		this.dbUtil = new DBUtil();
		int rowCnt = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			// 1.
			String sql = "INSERT INTO client(client_mail, client_pw, client_date) VALUES(?,PASSWORD(?),now())";
			// 2.
			conn = this.dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, client.getClientMail());
			stmt.setString(2, client.getClientPw());
			System.out.println(stmt+" <-- ClientDao���� insertClient()�� stmt");
			rowCnt = stmt.executeUpdate();

		} catch (Exception e){
			e.printStackTrace();
		} finally {
			this.dbUtil.close(conn, stmt, null);
		}
		
		return rowCnt;
	}
	//���� �ߺ��˻�
	public String selectClientMail(String clientMail) {
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//������ ����
		String returnClientMail = null;
		
		// DB ó��
		try {
			//db����
			conn = this.dbUtil.getConnection();
			
			// sql
			String sql = "SELECT client_mail FROM client WHERE client_mail = ?";		
			
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			System.out.println(stmt+" <-- ClientDao���� selectClientMail()�� stmt");
			rs=stmt.executeQuery();
			if(rs.next()) {
				returnClientMail = rs.getString("client_mail");
				System.out.println(returnClientMail+" <-- ClientDao���� selectClientMail()�� returnClientMail");
			}	
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			this.dbUtil.close(conn, stmt, rs);
		}	
		return returnClientMail;
	}
	public Client login(Client client) {
		this.dbUtil = new DBUtil();
		Client returnClient = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbUtil.getConnection();
			String sql = "SELECT client_mail clientMail FROM client WHERE client_mail = ? AND client_pw = PASSWORD(?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, client.getClientMail());
			stmt.setString(2, client.getClientPw());
			rs=stmt.executeQuery();
			if(rs.next()) {
				returnClient = new Client();
				returnClient.setClientMail(rs.getString("clientMail"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(conn, stmt, rs);
		}
		return returnClient;
	}
}
