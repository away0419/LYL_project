package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr2;

public class BoardDAO {
	private ConnectionPoolMgr2 pool;
	
	public BoardDAO() {
		pool=new ConnectionPoolMgr2();
	}	
	
	public List<BoardVO> selectAllBoard() throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<BoardVO> list = new ArrayList<BoardVO>();
		try {
			conn=pool.getConnection();
			
			String sql="select * from myboard order by bomyno desc";
			ps=conn.prepareStatement(sql);
			
			rs=ps.executeQuery();
			while(rs.next()) {
				int boNo=rs.getInt("boNo");
				String boTitle=rs.getString("boTitle");
				String boCon=rs.getString("boCon");
				int boHits=rs.getInt("boHits");
				int boCom=rs.getInt("boCom");
				Timestamp boDate=rs.getTimestamp("boDate");
				int boSec=rs.getInt("boSec");
				int userNo=rs.getInt("userNo");
				int userNo2=rs.getInt("userNo2");
				int boMyNo=rs.getInt("boMyNo");
				int boStep=rs.getInt("boStep");
				int boSort=rs.getInt("boSort");
				int boGroupNo=rs.getInt("boGroupNo");
				
				BoardVO vo = new BoardVO(boNo, boTitle, boCon, boHits, boCom, boDate, boSec, userNo, userNo2, boMyNo, boStep, boSort, boGroupNo);
				list.add(vo);
			}
			
			return list;
		} finally {
			pool.dbClose(rs, ps, conn);
		}
		
	}
}
