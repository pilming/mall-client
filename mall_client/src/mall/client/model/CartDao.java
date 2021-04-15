package mall.client.model;

import java.util.*;
import java.sql.*;
import mall.client.commons.DBUtil;
import mall.client.vo.*;

public class CartDao {
	private DBUtil dbUtil;
	
	public boolean selectClientMail(Cart cart) {
		boolean flag = true; //중복없음
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbUtil.getConnection();
			//sql
			String sql = "SELECT * FROM cart WHERE client_mail = ? AND ebook_no = ?";		
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, cart.getClientMail());
			stmt.setInt(2, cart.getEbookNo());
			//디버깅
			System.out.println(stmt + "<------CartDao에서 stmt");
			rs=stmt.executeQuery();
			if(rs.next()) {
				flag = false; //중복있음.
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(conn, stmt, rs);
		}
		
		return flag;
	}
	
	public int insertCart(Cart cart) {
		int rowCnt = 0;
		
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			conn = this.dbUtil.getConnection();
			//sql
			String sql = "INSERT INTO cart(client_mail, ebook_no, cart_date) VALUE(?, ?, now())";		
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, cart.getClientMail());
			stmt.setInt(2, cart.getEbookNo());
			//디버깅
			System.out.println(stmt + "<------CartDao에서 insertCart() stmt");
			rowCnt = stmt.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(conn, stmt, null);
		}
		
		
		return rowCnt;
	}
	
	//로그인한 회원만의 장바구니를 보여줄것임
	public List<Map<String, Object>> selectCartList(String clientMail) {
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		//리턴할 리스트 추가 조인된 테이블을 사용할거라 map을 사용
		List<Map<String, Object>> returnList = new ArrayList<Map<String,Object>>();
		//SELECT c.cart_no, e.ebook_no, e.ebook_title, c.cart_date FROM cart c INNER JOIN ebook e ON c.ebook_no = e.ebook_no
		
		try {
			conn = this.dbUtil.getConnection();
			//sql
			String sql = "SELECT c.cart_no cartNo, e.ebook_no ebookNo, e.ebook_title ebookTitle, c.cart_date cartDate FROM cart c INNER JOIN ebook e ON c.ebook_no = e.ebook_no WHERE client_mail = ?";		
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			//디버깅
			System.out.println(stmt + "<------CartDao에서 stmt");
			rs=stmt.executeQuery();
			//리스트에 추가
			while(rs.next()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("cartNo", rs.getInt("cartNo"));
				map.put("ebookNo", rs.getInt("ebookNo"));
				map.put("ebookTitle", rs.getString("ebookTitle"));
				map.put("cartDate", rs.getString("cartDate"));
				returnList.add(map);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbUtil.close(conn, stmt, rs);
		}
		//리스트 디버깅
		System.out.println(returnList + "<------CartDao에서 returnList");
		//리턴
		return returnList;
	}
}
