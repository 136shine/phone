package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entity.deIntroduction;
import entity.pics;
import com.util.DBConnection;

public class deIntroDaoImpl  extends DBConnection implements daoo.deIntroDao {

	
	public List<deIntroduction> getDeIntroByPuid(int puid) {
		Connection con = DBConnection.getConn(); 
		
		String sql = "select * from de_Instroduction where pu_id =? order by de_id;";
		List<deIntroduction> list = new ArrayList();
		PreparedStatement ps = null;
		
		ResultSet rs = null;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, puid);
		
			rs = ps.executeQuery();
			System.out.println("这里是deIntroDaoImpl中puid值为："+puid+sql);
			while(rs.next()){
				deIntroduction tp=new deIntroduction();//实体类封装数据
				tp.setDe_id(rs.getInt("de_id"));
				tp.setPu_id(rs.getInt("pu_id"));
				tp.setColor(rs.getString("color"));				
				tp.setStroe(rs.getString("store"));				
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
	
}
