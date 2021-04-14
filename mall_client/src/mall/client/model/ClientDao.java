package mall.client.model;

import java.sql.*;
import mall.client.commons.DBUtil;
import mall.client.vo.*;

public class ClientDao {
	private DBUtil dbUtil;
	
	public Client selectClientOne(String clientMail) {
		
		//보여줄 클라이언트 정보를 담을 객체생성
		Client returnClient = new Client();
		
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			//sql
			String sql = "SELECT client_mail, client_pw, client_date FROM client WHERE client_mail = ?";
			//db처리
			conn = this.dbUtil.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			//디버깅
			System.out.println(stmt+" <-- ClientDao에서 selectClientOne()의 stmt");
			rs = stmt.executeQuery();
			if(rs.next()) {
				returnClient.setClientMail(rs.getString("client_mail"));
				returnClient.setClientPw(rs.getString("client_pw"));
				returnClient.setClientDate(rs.getString("client_date"));
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			this.dbUtil.close(conn, stmt, rs);
		}
		
		return returnClient;

	}
	//회워가입
	public int insertClient(Client client) {
		this.dbUtil = new DBUtil();
		int rowCnt = 0;
		Connection conn = null;
		PreparedStatement stmt = null;
		try {
			// sql
			String sql = "INSERT INTO client(client_mail, client_pw, client_date) VALUES(?,PASSWORD(?),now())";
			// db처리
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
	//중복체크
	public String selectClientMail(String clientMail) {
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		//리턴할 메일
		String returnClientMail = null;
		
		// DB처리
		try {
			//db접근
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
