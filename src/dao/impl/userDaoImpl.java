package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import daoo.userDao;
import entity.user;
import com.util.DBConnection;

public class userDaoImpl extends DBConnection implements userDao {

	public user isLogin(String username, String Upassword) {
		//取得连接
		Connection con = DBConnection.getConn();		 
		 user user = null;
		String sql = "select * from user where username = ? and Upassword = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;		
		try {						
	         ps = con.prepareStatement(sql);
			 ps.setString(1, username);
			 ps.setString(2, Upassword);
			 rs =  ps.executeQuery(); //将查询结果封装到结果集中
			 System.out.println("连接成功!");
			 if(rs.next()){ //将结果封装至实体类中
				 user = new user();
				 user.setUid(rs.getInt("uid"));
				 user.setUpassword(rs.getString("upassword"));
				 user.setUsername(rs.getString("username"));
				 user.setUemail(rs.getString("uemail"));			
			 }
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			this.closeAll(rs, con, ps); //释放连接
		}
		
		return user;
	}
	
	public boolean InsertUser(String username, String password, String email){
		Connection con=this.getConn();
		String sql="Insert into user(username,Upassword,Uemail) values(?,?,?)";
		PreparedStatement ps = null;
		//System.out.println("这里InsertUser()!"+username+password+email);
		boolean f = false;
		try {
			ps = con.prepareStatement(sql);	
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, email);	
			int a = ps.executeUpdate();
			f = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			this.closeAll(null, con, ps);
		   }
		return f;
      }
	
	
}
