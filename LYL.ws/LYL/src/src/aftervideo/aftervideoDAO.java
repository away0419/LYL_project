package src.aftervideo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.ConnectionPoolMgr2;

public class aftervideoDAO {
	private ConnectionPoolMgr2 pool;
	
	public aftervideoDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int insertAftervideo(String videoNo, String userNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = pool.getConnection();
			String sql = "insert into AFTERVIDEO(userNo, vidNo) values(?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userNo);
			ps.setString(2, videoNo);
			
			int cnt = ps.executeUpdate();
			
			System.out.println("나중에볼동영상 insert 결과 cnt="+cnt+"매개변수 ="+videoNo+userNo);
			return cnt;
			
		}finally{
			pool.dbClose(ps, conn);
		}
	}
	
	public int deleteAftervideo(String videoNo, String userNo) throws SQLException {
		Connection conn =null;
		PreparedStatement ps = null;
		
		try {
			conn =pool.getConnection();
			String sql = "delete AFTERVIDEO\r\n"
					+ "where userNo=? and vidno=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userNo);
			ps.setString(2, videoNo);
			
			int cnt = ps.executeUpdate();
			System.out.println("영상 저장 취소 결과 cnt = "+cnt+"매개변수 userNo="+userNo+"videoNo"+videoNo);
			return cnt;
			
		}finally {
			pool.dbClose(ps, conn);
		}
		
	}
}
