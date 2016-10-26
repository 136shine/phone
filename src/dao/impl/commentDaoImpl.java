package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import daoo.commentDao;
import entity.puIntroduction;
import entity.userComment;
import com.util.DBConnection;

public class commentDaoImpl extends DBConnection implements commentDao {

	public boolean InsertComment(int pu_id, String username, String comment){
		Connection con = DBConnection.getConn(); 
		String sql="Insert into usercomment(pu_id,username,comment,commentDate) values(?,?,?,Now())";
		PreparedStatement ps = null;
		
		boolean f = false;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, pu_id);
			ps.setString(2, username);
			ps.setString(3, comment);
			
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
	
	public int Count(String sql){
		Connection con = this.getConn();
		
		java.sql.PreparedStatement ps = null;
		ResultSet rs = null; //�����
		try {
			ps = con.prepareStatement(sql);			
			rs = ps.executeQuery(); //��ѯ			
			if (rs.next()) {
				return rs.getInt("total");
			} 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			this.closeAll(rs, con, ps);
		}			
		return 0;
		
	}	
	
	public List<userComment> getPageCom(String sql) {
		System.out.println("������getPageCom����"+sql);
		Connection con = this.getConn();
		List<userComment> list = new ArrayList();
		PreparedStatement ps = null;
		ResultSet rs = null; //�����
		try {
			ps = con.prepareStatement(sql);	
			
			rs = ps.executeQuery(); //��ѯ
			
			while(rs.next()){ //�������ݿ���з�װ
				userComment userComment = new userComment(); //ʵ�����װ����
				
				userComment.setCid(rs.getInt("cid"));
				userComment.setPu_id(rs.getInt("pu_id"));
				userComment.setUsername(rs.getString("username"));
				userComment.setComment(rs.getString("comment"));
				userComment.setCommentDate(rs.getString("commentDate"));
															
				list.add(userComment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			this.closeAll(rs, con, ps);
		}
		return list;
	
	
	}
	
	
	
	
	
	
	/**
	 * ��ʱ��ݼ�����ȡ�����5������
	 */
public List<userComment> getFiveContent(int pu_id) {
		
		Connection con = this.getConn();		
		String sql = "select * from usercomment where pu_id=? order  by Cid desc limit 0,5;";
		
		List<userComment> list = new ArrayList();
		PreparedStatement ps = null;
		ResultSet rs = null; //�����
		try {
			ps = con.prepareStatement(sql);	
			ps.setInt(1, pu_id);
			rs = ps.executeQuery(); //��ѯ
			
			while(rs.next()){ //�������ݿ���з�װ
				userComment userComment = new userComment(); //ʵ�����װ����
				
				userComment.setCid(rs.getInt("cid"));
				userComment.setPu_id(rs.getInt("pu_id"));
				userComment.setUsername(rs.getString("username"));
				userComment.setComment(rs.getString("comment"));
				userComment.setCommentDate(rs.getString("commentDate"));
															
				list.add(userComment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			this.closeAll(rs, con, ps);
		}
		return list;
	} 
	
	
}
