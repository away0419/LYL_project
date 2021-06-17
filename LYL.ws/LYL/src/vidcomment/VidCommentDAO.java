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
	
	public List<VidCommentVO> sellectComment(int vidNo,int vidComCnt) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<VidCommentVO> list = new ArrayList<VidCommentVO>();
		try {
			conn = pool.getConnection();
			
			String sql = "select * from (select ROWNUM as rowcnt, a.* from mycomment a where vidno=? and comgroup is null)\r\n"
					+ "where rowcnt>=? and rowcnt<?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vidNo);
			ps.setInt(2, vidComCnt);
			ps.setInt(3, vidComCnt+10);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				VidCommentVO vcvo=new VidCommentVO();
				vcvo.setComNo(rs.getInt(2));
				vcvo.setComCon(rs.getString(3));
				vcvo.setComDate(rs.getTimestamp(4));
				vcvo.setComLike(rs.getInt(5));
				vcvo.setComSec(rs.getInt(6));
				vcvo.setVidNo(rs.getInt(7));
				vcvo.setUserNo(rs.getInt(8));
				vcvo.setComStep(rs.getInt(9));
				vcvo.setComSort(rs.getInt(10));
				vcvo.setComGroup(rs.getInt(11));
				list.add(vcvo);
			}
			return list;
		
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
	
	
}
