package mall.client.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import mall.client.commons.DBUtil;
import mall.client.vo.Orders;

public class OrdersDao {
	private DBUtil dbUtil;
	
	public List<Map<String,Object>> selectOrdersListByClient(int clientNo) {
		List<Map<String,Object>> returnList = new ArrayList<>();
		this.dbUtil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			//db연결
			conn = this.dbUtil.getConnection();
			//sql
			String sql = "SELECT o.orders_no ordersNo, o.ebook_no ebookNo, o.orders_date ordersDate, o.orders_state ordersState, e.ebook_title ebookTitle, e.ebook_price ebookPrice FROM orders o INNER JOIN ebook e ON o.ebook_no=e.ebook_no WHERE o.client_no=?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, clientNo);
			System.out.println(stmt + "<-- OrdersDao.selectOrdersListByClient 에서 stmt");
			rs = stmt.executeQuery();
			while(rs.next()) {
				System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
				Map<String, Object> map = new HashMap<>();
	            map.put("ordersNo", rs.getInt("ordersNo"));
	            map.put("ebookNo", rs.getInt("ebookNo"));
	            map.put("ordersDate", rs.getString("ordersDate"));
	            map.put("ordersState", rs.getString("ordersState"));
	            map.put("ebookTitle", rs.getString("ebookTitle"));
	            map.put("ebookPrice", rs.getInt("ebookPrice"));
				returnList.add(map);
			}
			
		} catch(Exception e) {
			
		} finally {
			this.dbUtil.close(conn, stmt, null);
		}
		System.out.println(returnList + "<-- OrdersDao.selectOrdersListByClient 에서 returnList");
		return returnList;
	}
	
	//주문 추가
	public void insertOrders(Orders orders ) {
		Connection conn = null;
		PreparedStatement stmt = null;
		this.dbUtil = new DBUtil();
		try {
			//db연결
			conn = this.dbUtil.getConnection();
			//sql
			String sql = "INSERT INTO orders(ebook_no, client_no, orders_date, orders_state) VALUE(?,?,now(),'주문완료')";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, orders.getEbookNo());
			stmt.setInt(2, orders.getClientNo());
			System.out.println(stmt + "<-- OrdersDao.insertOrders 에서 stmt");
			stmt.executeUpdate();
			
		} catch(Exception e) {
			//예외발생시 시스테믈 멈추고 함수(메서드)호출 스텍구조를 콘솔 출력한다.
			e.printStackTrace();
		} finally {
			this.dbUtil.close(conn, stmt, null);
		}
	}
}
