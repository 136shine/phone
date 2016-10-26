package daoo;

import java.util.List;

import entity.deIntroduction;

public interface deIntroDao {
	public List<deIntroduction> getDeIntroByPuid(int puid);

}
