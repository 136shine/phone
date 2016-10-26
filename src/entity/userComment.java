package entity;

public class userComment {

	private int Cid;
	private int pu_id;
	private String username;
	private String comment;
	private String commentDate;
	public int getCid() {
		return Cid;
	}
	public void setCid(int cid) {
		Cid = cid;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
	}
	public int getPu_id() {
		return pu_id;
	}
	public void setPu_id(int pu_id) {
		this.pu_id = pu_id;
	}
	
}
