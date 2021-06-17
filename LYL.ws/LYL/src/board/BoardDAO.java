package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import db.ConnectionPoolMgr2;
import oracle.jdbc.OracleResultSet;

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
	
	public int insertBoard(BoardVO vo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		OracleResultSet ors=null;

		try {
			//1,2 conn
			conn=pool.getConnection();
			System.out.println(vo.getBoCon());
			System.out.println(vo.getBoTitle());
			System.out.println(vo.getUserNo());
			System.out.println(vo.getUserNo2());
			//3 ps
			String sql="insert into myboard(bono, botitle, bocon, bodate, userno, userno2)"  //sql문 수정해야함 - 비밀글 여부추가, 답글은 일단X
					+ " values(myboard_seq.nextval, ?, ?, default, ?, ?);";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getBoTitle());
			ps.setString(2, vo.getBoCon());
			ps.setInt(3, vo.getUserNo());
			ps.setInt(4, vo.getUserNo2());
			
			//4 exec
			int cnt=ps.executeUpdate();
			System.out.println("글쓰기 결과, cnt="+cnt+", 매개변수 vo="+vo);

			return cnt;
		}finally {
			pool.dbClose(ps, conn);
		}
	}
	
	public BoardVO selectByNo(int boNo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		BoardVO vo = new BoardVO();
		try {
		 conn=pool.getConnection();
		 
		 String sql="select * from myboard where boNo=?";
		 ps=conn.prepareStatement(sql);
		 ps.setInt(1, boNo);
		 
		 rs=ps.executeQuery();
		 if(rs.next()) {
			 vo.setBoNo(boNo);
			 vo.setBoCon(rs.getString("boCon"));
			 vo.setBoTitle(rs.getString("boTitle"));
			 vo.setBoDate(rs.getTimestamp("boDate"));
		 }
		 System.out.println("글상세조회 결과, vo="+vo+", 매개변수 no="+boNo);
		 return vo;
		} finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
	public int updateReadCount(int no) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;

		try {
			conn=pool.getConnection();

			String sql="update myboard"
					+ " set boHits=boHits+1"
					+ " where no=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, no);

			int cnt=ps.executeUpdate();
			System.out.println("조회수 증가 결과 cnt="+cnt+", 매개변수 no="+no);

			return cnt;
		}finally {
			pool.dbClose(ps, conn);
		}
	}
	
	public int deleteBoard(int boNo) throws SQLException {
		Connection conn=null;
		PreparedStatement ps=null;
		
		try {
			conn=pool.getConnection();
			
			String sql="delete from myboard"
					+ " where boNo=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, boNo);
			
			int cnt=ps.executeUpdate();
			System.out.println("삭제 결과 조회 cnt="+cnt+", 매개변수 boNo="+boNo);
			
			return cnt;
		} finally {
			pool.dbClose(ps, conn);
		}
	}
}
