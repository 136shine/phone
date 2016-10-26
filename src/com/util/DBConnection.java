package com.util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * ����������
 * @author Administrator
 *
 */
public class DBConnection {
	//����
	public static final String DRIVER = "com.mysql.jdbc.Driver";
	//URL
	public static final String URL = "jdbc:mysql://localhost:3306/phone?useUnicode=true&characterEncoding=utf-8";
	//�û���
	public static final String USERNAME = "root";
	//����
	public static final String PASS = "vicky";
	
	/**
	 * �õ�����public static Connection getConn() 
	 * @return
	 
	*/

	public static Connection getConn() {
		Connection con = null;
		try {
			Class.forName(DRIVER);
			con = DriverManager.getConnection(URL, USERNAME, PASS);
			System.out.println("�������ݿ����ӳɹ�!");			
		      
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
	
	/**
	 * �ͷ���Դ
	 */
	public void closeAll(ResultSet rs, Connection con, PreparedStatement ps){
		try{
			if(rs != null){
				rs.close();
			}
			if(ps != null){
				ps.close();
			}
			if(con != null){
				con.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public void closeCon(Connection con) throws Exception{
		if(con!=null){
			con.close();
		}
	}
}
