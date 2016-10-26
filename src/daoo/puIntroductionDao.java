package daoo;

import java.util.List;

import entity.puIntroduction;

public interface puIntroductionDao {

	public List<puIntroduction> getAllPuIntro();
	public List<puIntroduction> getAllPuIntro(int currPage, int pageSize) ;//��ҳ
	public List<puIntroduction> getPuIntroByType(String type);
	public puIntroduction getPuIntroById(int tid);
	public List<puIntroduction> getSomePuIntro(int start,int number) ;
	public List<puIntroduction> getSelectPuIntro(String sql);
	public int Count(String sql);
	public List<puIntroduction> getPageIntro(String sql);
}
