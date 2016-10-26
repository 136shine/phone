package daoo;

import java.util.List;

import entity.pics;

public interface picsDao {
	public List<pics> getPicByPuid(int puid);
}
