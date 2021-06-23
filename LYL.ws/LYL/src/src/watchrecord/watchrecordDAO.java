package src.watchrecord;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr2;

public class watchrecordDAO {
	private ConnectionPoolMgr2 pool;
	
	public watchrecordDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public int insertWatchrecord(String userNo, String vidNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps2 = null;
		ResultSet rs = null;
		
		try {
			
			conn= pool.getConnection();
			String sql2 = "select * from WATCHRECORD where userNo=? and vidNo=?";
			ps = conn.prepareStatement(sql2);
			ps.setString(1, userNo);
			ps.setString(2, vidNo);
			rs = ps.executeQuery();
			int cnt2 = 0;
			
			while(rs.next()){
				cnt2++;
			}
			int cnt = 0;
			
			
			if(cnt2==0) {
				String sql = "insert into WATCHRECORD(userNo, vidNo) values(?, ?)";
				ps2 = conn.prepareStatement(sql);
				ps2.setString(1, userNo);
				ps2.setString(2, vidNo);
				cnt = ps2.executeUpdate();
				
				System.out.println("시청기록 insert 결과 = "+cnt+"매개변수 ="+userNo+vidNo);
				
			}else {
				String sql = "update WATCHRECORD set watchdate= sysdate where vidNo = ? and userNo = ?";
				ps2 = conn.prepareStatement(sql);
				ps2.setString(1, vidNo);
				ps2.setString(2, userNo);
				cnt = ps2.executeUpdate();
				System.out.println("시청기록 insert 결과 = "+cnt+"매개변수 ="+userNo+vidNo);
				
			}
			return cnt;
		}finally {
			if(ps2!=null)ps2.close();
			pool.dbClose(rs, ps, conn);
		}
	}
	public List<watchrecordVO> selectAllByUserNo(String userNo, int rowcnt) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<watchrecordVO> list =new ArrayList<watchrecordVO>();
		try {
			conn = pool.getConnection();
			
			String sql = "select * from \r\n"
					+ "(select  ad.*, rownum as rowcnt from\r\n"
					+ "(select * from WATCHRECORD where userno=? order by watchdate desc)ad)\r\n"
					+ "where rowcnt>? and rowcnt<=?";
			
			
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, userNo);
			ps.setInt(2, rowcnt);
			ps.setInt(3, rowcnt+5);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				watchrecordVO vo = new watchrecordVO();
				vo.setUserNo(rs.getInt(1));
				vo.setVidNo(rs.getInt(2));
				vo.setWatchDate(rs.getTimestamp(3));
				list.add(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
}
