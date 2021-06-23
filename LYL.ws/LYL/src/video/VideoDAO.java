package video;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

import db.ConnectionPoolMgr2;

public class VideoDAO {
	ConnectionPoolMgr2 pool;
		
	public VideoDAO(){
		pool= new ConnectionPoolMgr2();
	}
	
	public List<VideoVO> videoThemaList(int theme) throws SQLException{
		Connection conn =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<VideoVO> list = new ArrayList<VideoVO>();
		try {
			conn= pool.getConnection();
			
			String sql = "select * from\r\n"
					+ "(select ad.*,rownum as rowcnt from\r\n"
					+ "(select * from video where vidtheme=? order by  vidhits desc)ad)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, theme);
			
			rs=ps.executeQuery();
			
			
			
			
			while(rs.next()) {
				VideoVO vvo = new VideoVO();
				vvo.setVidNo(rs.getInt(1));
				vvo.setVidTitle(rs.getString(2));
				vvo.setVidHits(rs.getLong(3));
				vvo.setVidCom(rs.getInt(4));
				vvo.setVidurl(rs.getString(5));
				vvo.setVidLike(rs.getInt(6));
				vvo.setVidDate(rs.getTimestamp(7));
				vvo.setVidEx(rs.getString(8));
				vvo.setVidTheme(rs.getInt(9));
				vvo.setUserNo(rs.getInt(10));
				vvo.setVidThu(rs.getString(11));
				
				list.add(vvo);
				
			}
			return list;
		}finally {
			pool.dbClose(rs,ps,conn);
		}
	}
	
	public VideoVO videoSelect(String vidno) throws SQLException {
		Connection conn =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn=pool.getConnection();
			String sql = "select * from video\r\n"
					+ "where vidno = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vidno);
			
			rs=ps.executeQuery();
			
			VideoVO vo = new VideoVO();
			if(rs.next()) {
				int vidNo = rs.getInt("vidNo");
				String vidTitle = rs.getString("vidTitle");
				long vidHits = rs.getLong("vidHits");
				int vidCom = rs.getInt("vidCom");
				String vidurl = rs.getString("vidurl");
				int vidLike = rs.getInt("vidLike");
				Timestamp vidDate = rs.getTimestamp("vidDate");
				String vidEx = rs.getString("vidEx");
				int vidTheme = rs.getInt("vidTheme");
				int userNo = rs.getInt("userNo");
				String vidThu = rs.getString("vidThu");
				
				vo.setVidNo(vidNo);
				vo.setVidTitle(vidTitle);
				vo.setVidHits(vidHits);
				vo.setVidCom(vidCom);
				vo.setVidurl(vidurl);
				vo.setVidLike(vidLike);
				vo.setVidDate(vidDate);
				vo.setVidEx(vidEx);
				vo.setVidTheme(vidTheme);
				vo.setUserNo(userNo);
				vo.setVidThu(vidThu);
				
			}
			System.out.println("select 결과 vo= "+vo+"매개변수 vidno="+vidno);
			return vo;
			
		}finally{
			pool.dbClose(rs, ps, conn);
		}
		
	}
	
	public List<VideoVO> videoSearch(String vidTitle,int vidCnt) throws SQLException{
		Connection conn =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<VideoVO> list = new ArrayList<VideoVO>();
		
		try {
			conn= pool.getConnection();
			
			String sql = "select * from \r\n"
					+ "(select  ad.*, rownum as rowcnt from \r\n"
					+ "(select * from video where vidtitle like '%'||?||'%' order by vidhits desc)ad)\r\n"
					+ " where rowcnt>=? and rowcnt<?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vidTitle);
			ps.setInt(2, vidCnt);
			ps.setInt(3, vidCnt+5);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				VideoVO vvo = new VideoVO();
				vvo.setVidNo(rs.getInt(1));
				vvo.setVidTitle(rs.getString(2));
				vvo.setVidHits(rs.getLong(3));
				vvo.setVidCom(rs.getInt(4));
				vvo.setVidurl(rs.getString(5));
				vvo.setVidLike(rs.getInt(6));
				vvo.setVidDate(rs.getTimestamp(7));
				vvo.setVidEx(rs.getString(8));
				vvo.setVidTheme(rs.getInt(9));
				vvo.setUserNo(rs.getInt(10));
				vvo.setVidThu(rs.getString(11));
				
				list.add(vvo);
				
			}
			return list;
		}finally {
			pool.dbClose(rs,ps,conn);
		}
	}
	public List<VideoVO> videoSelectByUserId(int userNo ,int vidCnt) throws SQLException{
		Connection conn =null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<VideoVO> list = new ArrayList<VideoVO>();
		
		try {
			conn= pool.getConnection();
			
			String sql = "select * from \r\n"
					+ "(select  ad.*, rownum as rowcnt from \r\n"
					+ "(select * from video where userno=? order by vidhits desc)ad)\r\n"
					+ " where rowcnt>? and rowcnt<=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userNo);
			ps.setInt(2, vidCnt);
			ps.setInt(3, vidCnt+4);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				VideoVO vvo = new VideoVO();
				vvo.setVidNo(rs.getInt(1));
				vvo.setVidTitle(rs.getString(2));
				vvo.setVidHits(rs.getLong(3));
				vvo.setVidCom(rs.getInt(4));
				vvo.setVidurl(rs.getString(5));
				vvo.setVidLike(rs.getInt(6));
				vvo.setVidDate(rs.getTimestamp(7));
				vvo.setVidEx(rs.getString(8));
				vvo.setVidTheme(rs.getInt(9));
				vvo.setUserNo(rs.getInt(10));
				vvo.setVidThu(rs.getString(11));
				
				list.add(vvo);
				
			}
			return list;
		}finally {
			pool.dbClose(rs,ps,conn);
		}
	}
	
	public int vidAllCnt() throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = pool.getConnection();
			
			String sql = "select count(*) from video";
			ps=conn.prepareStatement(sql);
			

			rs=ps.executeQuery();
			int cnt=0;
			while(rs.next()) {
				cnt=rs.getInt(1);
			}
			return cnt;
		
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
	public int updateHits(int vidNo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		
		
		try {
			conn = pool.getConnection();
			
			String sql = "update video set vidhits=vidhits+1 where vidno=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vidNo);
			
			int cnt = ps.executeUpdate();
			
			return cnt;
			
			
		}finally {
			pool.dbClose(ps, conn);
		}
	}
	
	public int insertVideo(VideoVO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			conn = pool.getConnection();
			
			String sql = "insert into video(vidNo, vidTitle, vidurl, vidEx, vidTheme, userNo, vidThu, vidName,vidSize, vidOriName) \r\n"
					+ "values(video_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, vo.getVidTitle());
			ps.setString(2, vo.getVidurl());
			ps.setString(3, vo.getVidEx());
			ps.setString(4, Integer.toString(vo.getVidTheme()));
			ps.setString(5, Integer.toString(vo.getUserNo()));
			ps.setString(6, vo.getVidThu());
			ps.setString(7, vo.getVidName());
			ps.setString(8, Long.toString(vo.getVidSize()));
			ps.setString(9, vo.getVidOriName());
			
			
			int cnt = ps.executeUpdate();
			System.out.println("인서트 결과 cnt="+cnt+"매개변수 vo ="+ vo);
			return cnt;
			
		}finally {
			pool.dbClose(ps, conn);
		}
	}
	
	public String selectVideoMostView() throws SQLException {
	      Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;
	      try {
	         conn = pool.getConnection();
	         
	         String sql = "select * from \r\n"
	               + "(select vidurl from video order by vidhits desc)\r\n"
	               + "where rownum <2";
	         ps = conn.prepareStatement(sql);
	         
	         rs= ps.executeQuery();
	         String vidurl = null;
	         if(rs.next()) {
	            vidurl = rs.getString(1);
	            
	         }
	         System.out.println("결과 값 vidurl="+vidurl);
	         return vidurl;
	   
	         
	      }finally {
	         pool.dbClose(rs, ps, conn);
	      }
	   }
	public List<VideoVO> selectMyVideoMostView(String userNo) throws SQLException {
	      Connection conn = null;
	      PreparedStatement ps = null;
	      ResultSet rs = null;
	      try {
	         conn = pool.getConnection();
	         
	         String sql = "select * from \r\n"
	               + "(select vidurl from video where userNo=? order by vidhits desc)\r\n"
	               + "where rownum <3";
	         ps = conn.prepareStatement(sql);
	         ps.setString(1, userNo);
	         
	         rs= ps.executeQuery();
	         
	         List<VideoVO> list = new ArrayList<VideoVO>();
	         while(rs.next()) {
	        	 VideoVO vvo = new VideoVO();
				 vvo.setVidurl(rs.getString(1));
				 
				 list.add(vvo);
	         }
	         System.out.println("결과 값 list="+list);
	         return list;
	         
	      }finally {
	         pool.dbClose(rs, ps, conn);
	      }
	   }
}






