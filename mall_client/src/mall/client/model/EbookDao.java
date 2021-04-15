package mall.client.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import mall.client.commons.DBUtil;
import mall.client.vo.Ebook;

public class EbookDao {
	private DBUtil dbutil;
	
	//책 상세보기 제공을 위한 메서드
	public Ebook selectEbookOne(int ebookNo) {
		this.dbutil = new DBUtil();
		Ebook returnEbook = null;
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = this.dbutil.getConnection();
			//sql
			String sql = "SELECT ebook_no ebookNo, ebook_isbn ebookISBN, category_name categoryName, ebook_title ebookTitle, ebook_author ebookAuthor, ebook_company ebookCompany, ebook_page_count ebookPageCount, ebook_price ebookPrice, ebook_img ebookImg, ebook_summary ebookSummary, ebook_date ebookDate,ebook_state ebookState FROM ebook WHERE ebook_no = ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, ebookNo);
			//디버깅
			System.out.println(sql + "<---EbookDao 에서 selectEbookOne의 stmt");
			rs = stmt.executeQuery();
			
			//리턴 할 ebook객체에 정보 저장
			if(rs.next()) {
				returnEbook = new Ebook();
				returnEbook.setEbookNo(rs.getInt("ebookNo"));
				returnEbook.setCategoryName(rs.getString("categoryName"));
				returnEbook.setEbookISBN(rs.getString("ebookISBN"));
				returnEbook.setEbookTitle(rs.getString("ebookTitle"));
				returnEbook.setEbookAuthor(rs.getString("ebookAuthor"));
				returnEbook.setEbookCompany(rs.getString("ebookCompany"));
				returnEbook.setEbookPageCount(rs.getInt("ebookPageCount"));
				returnEbook.setEbookPrice(rs.getInt("ebookPrice"));
				returnEbook.setEbookSummary(rs.getString("ebookSummary"));
				returnEbook.setEbookImg(rs.getString("ebookImg"));
				returnEbook.setEbookDate(rs.getString("ebookDate"));
				returnEbook.setEbookState(rs.getString("ebookState"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbutil.close(conn, stmt, rs);
		}
		//리턴
		return returnEbook;
		
	}
	
	public List<Ebook> selectEbookListByPage(int beginRow, int rowPerPage) {
		List<Ebook> list = new ArrayList<>();
		this.dbutil = new DBUtil();
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			conn = this.dbutil.getConnection();
			//sql
			String sql = "SELECT ebook_no ebookNo, ebook_title ebookTitle, ebook_price ebookPrice FROM ebook ORDER BY ebook_date DESC LIMIT ?, ?";
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, beginRow);
			stmt.setInt(2, rowPerPage);
			//디버깅
			System.out.println(sql + "<---EbookDao 에서 selectEbookListByPage의 stmt");
			
			rs = stmt.executeQuery();
			//반복문 돌면서 리스트에 ebook객체 정보담기
			while(rs.next()) {
				Ebook ebook = new Ebook();
				ebook.setEbookNo(rs.getInt("ebookNo"));
				ebook.setEbookTitle(rs.getString("ebookTitle"));
				ebook.setEbookPrice(rs.getInt("ebookPrice"));
				list.add(ebook);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			this.dbutil.close(conn, stmt, rs);
		}
		//리스트 리턴
		return list;
	}
}
