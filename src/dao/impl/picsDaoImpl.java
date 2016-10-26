package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.pics;
import entity.puIntroduction;
import com.util.DBConnection;

public class picsDaoImpl extends DBConnection implements daoo.picsDao {

	
	
	public List<pics> getPicByPuid(int puid) {
		Connection con = DBConnection.getConn(); 
		
		String sql = "select * from pics where pu_id =? order by pu_id;";
		List<pics> list = new ArrayList();
		PreparedStatement ps = null;
		
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, puid);
		
			rs = ps.executeQuery();
			System.out.println("这里是getPicByPuid中puid值为："+puid+sql);
			while(rs.next()){
				pics tp=new pics();//实体类封装数据
			    tp.setPic_id(rs.getInt("pic_id"));
			    tp.setPu_id(rs.getInt("pu_id"));
			    tp.setPics(rs.getString("pics"));
			    tp.setType(rs.getString("type"));
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
