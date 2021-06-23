package src.aftervideo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr2;
import src.watchrecord.watchrecordVO;

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
	
	public int selectAftervideo(String videoNo, String userNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = pool.getConnection();
			String sql = "select count(*) from AFTERVIDEO where userNo=? and vidno=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userNo);
			ps.setString(2, videoNo);
			
			rs=ps.executeQuery();
			
			int cnt = 0;
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
			System.out.println("나중에볼동영상 insert 결과 vo="+cnt+"매개변수 ="+videoNo+userNo);
			return cnt;
			
		}finally{
			pool.dbClose(rs, ps, conn);
		}
	}
	
	public List<aftervideoVO> selectAllByUserNo(String userNo, int rowcnt) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<aftervideoVO> list =new ArrayList<aftervideoVO>();
		try {
			conn = pool.getConnection();
			
			String sql = "select * from \r\n"
					+ "(select  ad.*, rownum as rowcnt from\r\n"
					+ "(select * from AFTERVIDEO where userno=?)ad)\r\n"
					+ "where rowcnt>? and rowcnt<=?";
			
			
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, userNo);
			ps.setInt(2, rowcnt);
			ps.setInt(3, rowcnt+5);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				aftervideoVO vo = new aftervideoVO();
				vo.setUserNo(rs.getInt(1));
				vo.setVidNo(rs.getInt(2));
				list.add(vo);
			}
			return list;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}

	
	
}
