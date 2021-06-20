package vidcomment;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import db.ConnectionPoolMgr2;

public class VidCommentDAO {
	ConnectionPoolMgr2 pool;

	public VidCommentDAO() {
		pool= new ConnectionPoolMgr2();
	}

	public List<VidCommentVO> sellectComment(int vidNo,int vidComCnt, int vidComGroup) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<VidCommentVO> list = new ArrayList<VidCommentVO>();
		try {
			conn = pool.getConnection();


			String sql = "select * from\r\n"
					+ "(select rownum as rowcnt, ad.* from\r\n"
					+ "(select * from mycomment where vidno=? and comgroup=? order by comno)ad)\r\n"
					+ "where rowcnt>=? and rowcnt<?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vidNo);
			ps.setInt(2, vidComGroup);
			ps.setInt(3, vidComCnt);
			ps.setInt(4, vidComCnt+10);


			rs=ps.executeQuery();

			while(rs.next()) {
				VidCommentVO vcvo=new VidCommentVO();
				vcvo.setComNo(rs.getInt(2));
				vcvo.setComCon(rs.getString(3));
				vcvo.setComDate(rs.getTimestamp(4));
				vcvo.setComRe(rs.getInt(5));
				vcvo.setComLike(rs.getInt(6));
				vcvo.setComSec(rs.getInt(7));
				vcvo.setVidNo(rs.getInt(8));
				vcvo.setUserNo(rs.getInt(9));
				vcvo.setComStep(rs.getInt(10));
				vcvo.setComSort(rs.getInt(11));
				vcvo.setComGroup(rs.getInt(12));
				list.add(vcvo);
			}
			return list;

		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}

	public int insertComment(VidCommentVO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = pool.getConnection();

			String sql = "insert into mycomment values(mycomment_seq.nextval,?,default,default,default,default,?,?,default,default,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getComCon());
			ps.setInt(2, vo.getVidNo());
			ps.setInt(3, vo.getUserNo());
			ps.setInt(4, vo.getComGroup());

			int cnt = ps.executeUpdate();

			return cnt;


		}finally {
			pool.dbClose(ps, conn);
		}

	}
	
	public int deleteComment(int comNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = pool.getConnection();
			
			String sql = "delete from mycomment where comno=? or comgroup=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, comNo);
			ps.setInt(2, comNo);
			
			
			int cnt = ps.executeUpdate();
			
			return cnt;
			
			
		}finally {
			pool.dbClose(ps, conn);
		}
		
	}

}
