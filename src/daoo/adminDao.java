package daoo;

import java.sql.Connection;

import entity.admin;

public interface adminDao {
	public admin isLogin(String adminName, String Apassword);
	public admin login(Connection con,admin admin)throws Exception;
}
