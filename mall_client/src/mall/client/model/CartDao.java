package mall.client.model;

import java.util.*;
import java.sql.*;
import mall.client.commons.DBUtil;
import mall.client.vo.*;

public class CartDao {
	private DBUtil dbUtil;
	
	public List<Map<String, Object>> selectCartList(String clientMail) {
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		List<Map<String, Object>> returnList = new ArrayList<Map<String,Object>>();
		//SELECT c.cart_no, e.ebook_no, e.ebook_title, c.cart_date FROM cart c INNER JOIN ebook e ON c.ebook_no = e.ebook_no
		
		try {
			conn = this.dbUtil.getConnection();
			String sql = "SELECT c.cart_no cartNo, e.ebook_no ebookNo, e.ebook_title ebookTitle, c.cart_date cartDate FROM cart c INNER JOIN ebook e ON c.ebook_no = e.ebook_no WHERE client_mail = ?";		
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, clientMail);
			System.out.println(stmt + "<------CartDao에서 stmt");
			rs=stmt.executeQuery();
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
		System.out.println(returnList + "<------CartDao에서 returnList");
		return returnList;
	}
}
