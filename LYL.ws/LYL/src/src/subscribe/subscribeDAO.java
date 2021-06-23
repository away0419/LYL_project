package src.subscribe;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.ConnectionPoolMgr2;

public class subscribeDAO {
	private ConnectionPoolMgr2 pool;
	
	public subscribeDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int subscribe(String userNo2, String userNo ) throws SQLException {
		//userNo2 크리에이터
		Connection conn =null;
		PreparedStatement ps = null;
		
		try {
			conn= pool.getConnection();
			String sql = "insert into SUBSCRIB(userNo2, userNo) values(?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userNo2);
			ps.setString(2, userNo);
			
			int cnt = ps.executeUpdate();
			System.out.println("구독 결과 = "+cnt+"매개변수 userNo2(크리에이터)="+userNo2+"userNo 구독하려는사람"+userNo);
			return cnt;
		}finally{
			pool.dbClose(ps, conn);
		}
	}
	
	public int dissubscribe(String userNo, String userNo2) throws SQLException {
		Connection conn =null;
		PreparedStatement ps = null;
		
		try {
			conn =pool.getConnection();
			String sql = "delete subscrib\r\n"
					+ "where userno=? and userno2=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userNo);
			ps.setString(2, userNo2);
			
			int cnt = ps.executeUpdate();
			System.out.println("구독 취소 결과 cnt = "+cnt+"매개변수 userNo="+userNo+"userNo2"+userNo2);
			return cnt;
			
		}finally {
			pool.dbClose(ps, conn);
		}
		
	}
	public int selectSubscribe(String userNo2, String userNo ) throws SQLException {
		//userNo2 크리에이터
		Connection conn =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		
		try {
			conn= pool.getConnection();
			String sql = "select count(*) from subscrib where userno=? and userno2=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userNo);
			ps.setString(2, userNo2);
			
			int cnt = 0;
			rs = ps.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
			System.out.println("구독 결과 = "+cnt+"매개변수 userNo2(크리에이터)="+userNo2+"userNo 구독하려는사람"+userNo);
			return cnt;
		}finally{
			pool.dbClose(rs, ps, conn);
		}
	}
	
	
	
}
