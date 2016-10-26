package daoo;

import entity.user;

public interface userDao {

	public user isLogin(String username, String Upassword) ;
	public boolean InsertUser(String username, String password, String email);
}
