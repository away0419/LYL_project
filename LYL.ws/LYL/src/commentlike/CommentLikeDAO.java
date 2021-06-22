package commentlike;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.ConnectionPoolMgr2;
import vidcomment.VidCommentVO;

public class CommentLikeDAO {
	ConnectionPoolMgr2 pool;

	public CommentLikeDAO() {
		pool=new ConnectionPoolMgr2();
	}
	
	public int insertLike(int comNo, int userNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = pool.getConnection();

			String sql = "insert into commentlike values(?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, comNo);
			ps.setInt(2, userNo);

			int cnt = ps.executeUpdate();

			return cnt;


		}finally {
			pool.dbClose(ps, conn);
		}

	}
	
	public int deleteLike(int comNo, int userNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = pool.getConnection();
			
			String sql = "delete from commentlike where comno=? and userno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, comNo);
			ps.setInt(2, userNo);
			
			int cnt = ps.executeUpdate();
			
			return cnt;
			
			
		}finally {
			pool.dbClose(ps, conn);
		}
		
	}
	
	public int selectByUserNo(int comNo, int userNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = pool.getConnection();
			
			String sql = "select count(*) from commentlike where comno=? and userno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, comNo);
			ps.setInt(2, userNo);



			rs=ps.executeQuery();
			int cnt =0;
			while(rs.next()) {
				cnt = rs.getInt(1);
			}
		
			return cnt;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
}
