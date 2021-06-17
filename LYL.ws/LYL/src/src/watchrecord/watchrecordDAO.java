package src.watchrecord;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import db.ConnectionPoolMgr2;

public class watchrecordDAO {
	private ConnectionPoolMgr2 pool;
	
	public watchrecordDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int insertWatchrecord(String userNo, String vidNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn= pool.getConnection();
			String sql = "insert into WATCHRECORD(userNo, vidNo) values(?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userNo);
			ps.setString(2, vidNo);
			
			int cnt = ps.executeUpdate();
			System.out.println("시청기록 insert 결과 = "+cnt+"매개변수 ="+userNo+vidNo);
			return cnt;
			
		}finally {
			pool.dbClose(ps, conn);
		}
	}
}
