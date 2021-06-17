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
	
}
