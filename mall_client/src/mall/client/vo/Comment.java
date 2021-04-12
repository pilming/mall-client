package mall.client.vo;

public class Comment {
	private int comment_no;
	private int notice_no;
	private String  manager_id;
	private String comment_content;
	private String comment_date;
	public int getComment_no() {
		return comment_no;
	}
	public void setComment_no(int comment_no) {
		this.comment_no = comment_no;
	}
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public String getComment_date() {
		return comment_date;
	}
	public void setComment_date(String comment_date) {
		this.comment_date = comment_date;
	}
	@Override
	public String toString() {
		return "Comment [comment_no=" + comment_no + ", notice_no=" + notice_no + ", manager_id=" + manager_id
				+ ", comment_content=" + comment_content + ", comment_date=" + comment_date + "]";
	}
	
	
}
