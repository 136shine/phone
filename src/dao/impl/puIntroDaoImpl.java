package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConnection;
import entity.puIntroduction;

public class puIntroDaoImpl extends DBConnection implements daoo.puIntroductionDao {
	
	
	/**
	 * ��ѯ����������Ϣ
	 * @currPage ��ǰҳ��                                             
	 * @pagesize ÿҳ��ʾ��¼��                                   
	*/                                             
	public List<puIntroduction> getAllPuIntro(int currPage, int pageSize) {
		
		Connection con = this.getConn();
		
		String sql = "select * from pu_instroduction order by pu_id limit ?, ?";
		System.out.println("������getAllPuIntro");
		List<puIntroduction> list = new ArrayList();
		java.sql.PreparedStatement ps = null;
		ResultSet rs = null; //�����
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, (currPage - 1) * pageSize);
			ps.setInt(2, pageSize);
			rs = ps.executeQuery(); //��ѯ
			
			while(rs.next()){ //�������ݿ���з�װ
				puIntroduction tp = new puIntroduction(); //ʵ�����װ����
				tp.setPu_id(rs.getInt("pu_id"));
				tp.setName(rs.getString("name"));
				tp.setAfterSold(rs.getString("afterSold"));
				tp.setBrand(rs.getString("brand"));
				tp.setInternet(rs.getString("internet"));
				tp.setMenu(rs.getString("menu"));
				tp.setPixel(rs.getString("pixel"));
				tp.setRation(rs.getString("ratio"));
				tp.setSize(rs.getString("size"));
				tp.setSystem(rs.getString("system"));
				tp.setPics(rs.getString("pics"));
				tp.setVersion(rs.getString("version"));
				tp.setRunstore(rs.getString("runstore"));
				list.add(tp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			this.closeAll(rs, con, ps);
		}
		return list;
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
	
	
public List<puIntroduction> getAllPuIntro() {
		
		Connection con = this.getConn();
		
		String sql = "select * from pu_instroduction order by pu_id limit 0,8";
		
		List<puIntroduction> list = new ArrayList();
		java.sql.PreparedStatement ps = null;
		ResultSet rs = null; //�����
		try {
			ps = con.prepareStatement(sql);			
			rs = ps.executeQuery(); //��ѯ
			
			while(rs.next()){ //�������ݿ���з�װ
				puIntroduction tp = new puIntroduction(); //ʵ�����װ����
				tp.setPu_id(rs.getInt("pu_id"));
				tp.setName(rs.getString("name"));
				tp.setAfterSold(rs.getString("afterSold"));
				tp.setBrand(rs.getString("brand"));
				tp.setInternet(rs.getString("internet"));
				tp.setMenu(rs.getString("menu"));
				tp.setPixel(rs.getString("pixel"));
				tp.setRation(rs.getString("ratio"));
				tp.setSize(rs.getString("size"));
				tp.setSystem(rs.getString("system"));
				tp.setPics(rs.getString("pics"));
				tp.setVersion(rs.getString("version"));
				tp.setRunstore(rs.getString("runstore"));
				
				list.add(tp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			this.closeAll(rs, con, ps);
		}
		return list;
	}
public List<puIntroduction> getPageIntro(String sql) {
	
	Connection con = this.getConn();
	List<puIntroduction> list = new ArrayList();
	java.sql.PreparedStatement ps = null;
	ResultSet rs = null; //�����
	try {
		ps = con.prepareStatement(sql);			
		rs = ps.executeQuery(); //��ѯ
		
		while(rs.next()){                      //�������ݿ���з�װ
			puIntroduction tp = new puIntroduction(); //ʵ�����װ����
			tp.setPu_id(rs.getInt("pu_id"));
			tp.setName(rs.getString("name"));
			tp.setAfterSold(rs.getString("afterSold"));
			tp.setBrand(rs.getString("brand"));
			tp.setInternet(rs.getString("internet"));
			tp.setMenu(rs.getString("menu"));
			tp.setPixel(rs.getString("pixel"));
			tp.setRation(rs.getString("ratio"));
			tp.setSize(rs.getString("size"));
			tp.setSystem(rs.getString("system"));
			tp.setPics(rs.getString("pics"));
			tp.setVersion(rs.getString("version"));
			tp.setRunstore(rs.getString("runstore"));
			
			tp.setPrice(rs.getString("price"));
			list.add(tp);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally{
		this.closeAll(rs, con, ps);
	}
	return list;
}
public List<puIntroduction> getPuIntroByType(String type) {
	Connection con = DBConnection.getConn(); 
	
	String sql = "select * from pu_instroduction where type =? order by pu_id limit 0,3;";
	
	List<puIntroduction> list = new ArrayList();
	PreparedStatement ps = null;
	
	ResultSet rs = null;
	try {
		ps = con.prepareStatement(sql);
		ps.setString(1, type);
		////ps.setInt(2, currPage);
		//ps.setInt(3, pageSize);
		rs = ps.executeQuery();
		System.out.println("������getPuIntroByBrand��brandֵΪ��"+type+sql);
		while(rs.next()){
			
			puIntroduction tp = new puIntroduction(); //ʵ�����װ����
			tp.setPu_id(rs.getInt("pu_id"));
			tp.setName(rs.getString("name"));
			tp.setAfterSold(rs.getString("afterSold"));
			tp.setBrand(rs.getString("brand"));
			tp.setInternet(rs.getString("internet"));
			tp.setMenu(rs.getString("menu"));
			tp.setPixel(rs.getString("pixel"));
			tp.setRation(rs.getString("ratio"));
			tp.setSize(rs.getString("size"));
			tp.setSystem(rs.getString("system"));
			tp.setPics(rs.getString("pics"));
			tp.setType(rs.getInt("type"));
			tp.setVersion(rs.getString("version"));
			tp.setRunstore(rs.getString("runstore"));
			list.add(tp);
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally{
		this.closeAll(rs, con, ps);
	}
	
	return list;
}	


public puIntroduction getPuIntroById(int tid) {
	Connection con = this.getConn();
	puIntroduction tp = null;
	String sql = "select * from pu_instroduction where pu_id=?";
	java.sql.PreparedStatement ps = null;
	ResultSet rs = null;
	try {
		ps = con.prepareStatement(sql);
		ps.setInt(1, tid);
		rs = ps.executeQuery();
		
		if(rs.next()){
			tp = new puIntroduction();
			tp.setPu_id(rs.getInt("pu_id"));
			tp.setName(rs.getString("name"));
			tp.setAfterSold(rs.getString("afterSold"));
			tp.setBrand(rs.getString("brand"));
			tp.setInternet(rs.getString("internet"));
			tp.setMenu(rs.getString("menu"));
			tp.setPixel(rs.getString("pixel"));
			tp.setRation(rs.getString("ratio"));
			tp.setSize(rs.getString("size"));
			tp.setSystem(rs.getString("system"));
			tp.setPics(rs.getString("pics"));
			tp.setVersion(rs.getString("version"));
			tp.setRunstore(rs.getString("runstore"));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally{
		this.closeAll(rs, con, ps);
	}
	
	return tp;
}
public List<puIntroduction> getSomePuIntro(int start,int number) {
	
	Connection con = this.getConn();
	
	String sql = "select * from pu_instroduction order by pu_id limit ?,?";
	
	List<puIntroduction> list = new ArrayList();
	java.sql.PreparedStatement ps = null;
	ResultSet rs = null; //�����
	try {
		ps = con.prepareStatement(sql);	
		ps.setInt(1, start);
		ps.setInt(2, number);
		rs = ps.executeQuery(); //��ѯ
		
		while(rs.next()){ //�������ݿ���з�װ
			puIntroduction tp = new puIntroduction(); //ʵ�����װ����
			tp.setPu_id(rs.getInt("pu_id"));
			tp.setName(rs.getString("name"));
			tp.setAfterSold(rs.getString("afterSold"));
			tp.setBrand(rs.getString("brand"));
			tp.setInternet(rs.getString("internet"));
			tp.setMenu(rs.getString("menu"));
			tp.setPixel(rs.getString("pixel"));
			tp.setRation(rs.getString("ratio"));
			tp.setSize(rs.getString("size"));
			tp.setSystem(rs.getString("system"));
			tp.setPics(rs.getString("pics"));
			tp.setVersion(rs.getString("version"));
			tp.setRunstore(rs.getString("runstore"));
			
			list.add(tp);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally{
		this.closeAll(rs, con, ps);
	}
	return list;
}



public List<puIntroduction> getSelectPuIntro(String sql) {
	
	Connection con = this.getConn();		
	
	List<puIntroduction> list = new ArrayList();
	java.sql.PreparedStatement ps = null;
	ResultSet rs = null; //�����
	try {
		ps = con.prepareStatement(sql);			
		rs = ps.executeQuery(); //��ѯ
		
		while(rs.next()){ //�������ݿ���з�װ
			puIntroduction tp = new puIntroduction(); //ʵ�����װ����
			tp.setPu_id(rs.getInt("pu_id"));
			tp.setName(rs.getString("name"));
			tp.setAfterSold(rs.getString("afterSold"));
			tp.setBrand(rs.getString("brand"));
			tp.setInternet(rs.getString("internet"));
			tp.setMenu(rs.getString("menu"));
			tp.setPixel(rs.getString("pixel"));
			tp.setRation(rs.getString("ratio"));
			tp.setSize(rs.getString("size"));
			tp.setSystem(rs.getString("system"));
			tp.setPics(rs.getString("pics"));
			tp.setVersion(rs.getString("version"));
			tp.setRunstore(rs.getString("runstore"));
			
			list.add(tp);
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
