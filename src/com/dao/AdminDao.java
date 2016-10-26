package com.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.admin;


public class AdminDao {

	public admin login(Connection con,admin admin) throws Exception{
		admin admin1=null;
		String sql="select * from admin where adminName=? and Apassword=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, admin.getAdminName());
		pstmt.setString(2, admin.getApassword());
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			admin1=new admin();
			admin1.setAdminName(rs.getString("adminName"));
			admin1.setApassword(rs.getString("apassword"));
		}
		return admin;
	}
}
