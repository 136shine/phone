package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import daoo.carDao;
import com.util.DBConnection;

public class carDaoImpl extends DBConnection implements carDao{

	public boolean InsertCar( int Uid,int pu_id){
		Connection con = DBConnection.getConn(); 
		String sql="Insert into car(Uid,pu_id) values(?,?)";
		System.out.println("’‚¿Ô «carDaoImpl.InsertCar()"+Uid+pu_id);
		PreparedStatement ps = null;
		
		boolean f = false;
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, Uid);
			ps.setInt(2, pu_id);
			
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
