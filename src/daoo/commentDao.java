package daoo;

import java.util.List;

import entity.userComment;

public interface commentDao {

	public boolean InsertComment(int pu_id, String username, String comment);
	public List<userComment> getFiveContent(int pu_id);
	public int Count(String sql);
	public List<userComment> getPageCom(String sql);
}
