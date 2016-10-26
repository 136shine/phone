package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import com.model.PageBean;
import com.model.SupplyMan;

import com.util.StringUtil;

public class SupplyManDao {

	public ResultSet list(Connection con, PageBean pageBean, SupplyMan man)//分页显示所有信息
			throws Exception {
		String sql = "select * from pu_instroduction ";
		StringBuffer sb = new StringBuffer(sql);		
    if(man!=null){
	    	if (StringUtil.isNotEmpty(man.getPu_id() )) {
			sb.append(" and pu_instroduction.pu_id like '%" + man.getPu_id() + "%'");			
		    }
		    if (StringUtil.isNotEmpty(man.getName())) {
			sb.append(" and pu_instroduction.name like '%" + man.getName() + "%'");
		    }
		    if (StringUtil.isNotEmpty(man.getSystem() )) {
			sb.append(" and pu_instroduction.system like '%" + man.getSystem() + "%'");
		    }
		    if (StringUtil.isNotEmpty(man.getInternet())) {
			sb.append(" and pu_instroduction.internet like '%" + man.getInternet()+ "%'");
		    }
	   }

		if (pageBean != null) {
			sb.append(" limit " + pageBean.getStart() + ","
					+ pageBean.getRows());
		}
		String str=sb.toString().replaceFirst("and", "where");
		System.out.println(str);
		PreparedStatement pstmt = con.prepareStatement(str); //replaceFirst 替换字符串 将第一个and替换成where
		
		return pstmt.executeQuery();
	}

	public int Count(Connection con, SupplyMan man) throws Exception {
		StringBuffer sb = new StringBuffer(
				"select count(*) as total from pu_instroduction");
		if (StringUtil.isNotEmpty(man.getPu_id())) {
			sb.append(" and pu_instroduction.pu_id like '%" + man.getPu_id() + "%'");
		}		
		if (StringUtil.isNotEmpty(man.getName())) {
			sb.append(" and pu_instroduction.name like '%" + man.getName() + "%'");
		}
		if (StringUtil.isNotEmpty(man.getSystem())) {
			sb.append(" and pu_instroduction.system like '%" + man.getSystem() + "%'");
		}
		if (StringUtil.isNotEmpty(man.getInternet())) {
			sb.append(" and pu_instroduction.internet like '%" + man.getInternet() + "%'");
		}
		String str=sb.toString().replaceFirst("and", "where");
		
		PreparedStatement pstmt = con.prepareStatement(str);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			return rs.getInt("total");
		} else {
			return 0;
		}
	}

	public int delete(Connection con, String delIds) throws Exception {
		String sql = "delete from pu_instroduction where pu_id in(" + delIds + ")";
		PreparedStatement pstmt = con.prepareStatement(sql);
		System.out.println("这里是SupplyManDao.delete()");
		return pstmt.executeUpdate();
	}
	public int add(Connection con,SupplyMan sm)throws Exception{
		String sql="insert into pu_instroduction(name,pixel,ratio,system,pics,brand,type,internet,size,menu,afterSold ,version, runstore ) values(?,?,?,?,? ,?,?,?,?,? ,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, sm.getName());
		pstmt.setString(2, sm.getPixel());
		pstmt.setString(3, sm.getRatio());
		pstmt.setString(4, sm.getSystem());
		pstmt.setString(5, sm.getPics());
		pstmt.setString(6, sm.getBrand());
		pstmt.setString(7, sm.getType());
		pstmt.setString(8, sm.getInternet());
		pstmt.setString(9, sm.getSize());
		pstmt.setString(10, sm.getMenu());
		pstmt.setString(11, sm.getAfterSold());
		pstmt.setString(12, sm.getVersion());
		pstmt.setString(13, sm.getRunstore());
	
		return pstmt.executeUpdate();
	
	}
	public int modify(Connection con,SupplyMan sm)throws Exception{
		String sql="update pu_instroduction set  brand=?, name=?,runstore=?,system=? , pixel=?,ratio=?,internet=?, pics=?,type=?, size=?, version=?, menu=?, afterSold=? "
				+ "where pu_id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, sm.getBrand());
		pstmt.setString(2, sm.getName());
		
		pstmt.setString(3, sm.getRunstore());
		pstmt.setString(4, sm.getSystem());
		pstmt.setString(5, sm.getPixel());
		
		pstmt.setString(6, sm.getRatio());
		pstmt.setString(7, sm.getInternet());
		pstmt.setString(8, sm.getPics());
		
		pstmt.setString(9, sm.getType());
		pstmt.setString(10, sm.getSize());
		pstmt.setString(11, sm.getVersion());
		
		
		pstmt.setString(12, sm.getMenu());
		pstmt.setString(13, sm.getAfterSold());
		pstmt.setString(14, sm.getPu_id());
			
		return pstmt.executeUpdate();
	
	}
/*public boolean 	UniqueSupplyid(Connection con,SupplyMan sm)throws Exception{
	//有id的时候去除id情况

		String sql="select * from pu_instroduction where Pu_id in("+sm.getPu_id()+") ";
		System.out.println(sql);
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs=pstmt.executeQuery();
		System.out.println("这里是SupplyManDao.uniqueSuppplyid");
		return rs.next();
}
/*public boolean UniqueSupply(Connection con,SupplyMan sm)throws Exception{
	//无id则判断输入的getcode是不是存在如果存在
	//结果不为空
	String sql="select * from pu_instroduction where "+sm.getPu_id()+" in(select pu_id from pu_instroduction)";
	System.out.println(sql);
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs=pstmt.executeQuery();
	return rs.next();
	/*System.out.println(""+(null==pstmt.executeQuery()));
	return pstmt.executeQuery();
}
	public boolean getSupplyById(Connection con,String pu_id)throws Exception{
		String sql="select * from pu_Instroduction where pu_id=?";
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, pu_id);
		ResultSet rs=pstmt.executeQuery();
		if(rs.next()){
			return true;
		}else{
			return false;
		}
	}*/
}
