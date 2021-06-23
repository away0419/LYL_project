package video;

import java.sql.SQLException;
import java.util.List;

public class VideoService {
	VideoDAO dao;

	public VideoService() {
		dao=new VideoDAO();
	}
	
	public List<VideoVO> videoThemaList(int theme) throws SQLException{
		List<VideoVO> list = dao.videoThemaList(theme);
		
		return list;
	}
	public VideoVO videoSelect(String vidno) throws SQLException {
		return dao.videoSelect(vidno);
	}
	
	public List<VideoVO> videoSearch(String vidTitle,int vidCnt) throws SQLException{
		List<VideoVO> list = dao.videoSearch(vidTitle, vidCnt);
		
		return list;
	}
	
	public int vidAllCnt() throws SQLException {
		return dao.vidAllCnt();
	}
	
	public int updateHits(int vidNo) throws SQLException {
		return dao.updateHits(vidNo);
	}
	public List<VideoVO> videoSelectByUserId(int userNo ,int vidCnt) throws SQLException{
		return dao.videoSelectByUserId(userNo, vidCnt);
	}
	public String selectVideoMostView() throws SQLException {
		return dao.selectVideoMostView();
	}
	public List<VideoVO> selectMyVideoMostView(String userNo) throws SQLException {
		return dao.selectMyVideoMostView(userNo);
	}
}
