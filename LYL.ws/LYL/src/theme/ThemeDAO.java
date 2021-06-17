package theme;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr2;

public class ThemeDAO {
	private ConnectionPoolMgr2 pool;

	ThemeDAO() {
		pool= new ConnectionPoolMgr2();
	}
	
	public List<ThemeVO> selectAllTheme() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<ThemeVO> list = new ArrayList<ThemeVO>();
		
		try {
			conn = pool.getConnection();
			
			String sql = "select * from theme order by thno";
			ps=conn.prepareStatement(sql);
			
			rs=ps.executeQuery();
			
			
			while(rs.next()) {
				ThemeVO tvo = new ThemeVO();
				tvo.setThNo(rs.getInt(1));
				tvo.setThName(rs.getString(2));
				list.add(tvo);
			}
		
			return list;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
		
	}
	public String themeName(int themeNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String themeName="";
		try {
			conn = pool.getConnection();
			
			String sql = "select * from theme where thno=? order by thno";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, themeNo);
			
			rs=ps.executeQuery();
			
			
			while(rs.next()) {
				themeName=rs.getString(2);
			}
		
			return themeName;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
	
}
