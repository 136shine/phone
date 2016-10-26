package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import daoo.adminDao;
import daoo.userDao;
import entity.admin;
import entity.user;
import com.util.DBConnection;

public class adminDaoImpl extends DBConnection implements adminDao {
	
	
	public admin login(Connection con,admin admin) throws Exception{
		admin Admin=null;
		String sql = "select * from admin where adminName = ? and Apassword = ?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, admin.getAdminName());
		pstmt.setString(2, admin.getApassword());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			Admin=new admin();
			Admin.setA_id(rs.getInt("a_id"));
			Admin.setAdminName(rs.getString("adminName"));
			Admin.setApassword(rs.getString("apassword"));
			Admin.setAemail(rs.getString("aemail"));
			
		}
		return Admin;
	}
	
	
	public admin isLogin(String adminName, String Apassword) {
		//ȡ������
		Connection con = DBConnection.getConn();		 
		admin admin = null;
		String sql = "select * from admin where adminName = ? and Apassword = ?";
		PreparedStatement ps = null;
		ResultSet rs = null;		
		try {						
	         ps = con.prepareStatement(sql);
			 ps.setString(1, adminName);
			 ps.setString(2, Apassword);
			 rs =  ps.executeQuery(); //����ѯ�����װ���������
			 System.out.println("���ӳɹ�!");
			 if(rs.next()){ //�������װ��ʵ������
				 admin = new admin();
				 admin.setA_id(rs.getInt("a_id"));
				 admin.setAdminName(rs.getString("adminName"));
				 admin.setApassword(rs.getString("Apassword"));
				 admin.setAemail(rs.getString("Aemail"));		
			 }
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			this.closeAll(rs, con, ps); //�ͷ�����
		}
		
		return admin;
	}
}
