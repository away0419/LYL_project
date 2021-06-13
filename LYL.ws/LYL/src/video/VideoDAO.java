package video;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

import db.ConnectionPoolMgr2;

public class VideoDAO {
	ConnectionPoolMgr2 pool;
		
	public VideoDAO(){
		pool= new ConnectionPoolMgr2();
	}
	
	public List<VideoVO> videoThemaList(int theme) throws SQLException{
		Connection conn =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<VideoVO> list = new ArrayList<VideoVO>();
		try {
			conn= pool.getConnection();
			
			String sql = "select * from video where vidtheme=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, theme);
			
			rs=ps.executeQuery();
			
			
			
			
			while(rs.next()) {
				VideoVO vvo = new VideoVO();
				vvo.setVidNo(rs.getInt(1));
				vvo.setVidTitle(rs.getString(2));
				vvo.setVidHits(rs.getInt(3));
				vvo.setVidCom(rs.getInt(4));
				vvo.setVidurl(rs.getString(5));
				vvo.setVidLike(rs.getInt(6));
				vvo.setVidDate(rs.getTimestamp(7));
				vvo.setVidEx(rs.getString(8));
				vvo.setVidTheme(rs.getInt(9));
				vvo.setUserNo(rs.getInt(10));
				vvo.setVidThu(rs.getString(11));
				
				list.add(vvo);
				
			}
			return list;
		}finally {
			pool.dbClose(rs,ps,conn);
		}
	}
}
