package src.aftervideo;

import java.sql.SQLException;

public class aftervideoService {
	private aftervideoDAO dao;
	
	public aftervideoService() {
		dao = new aftervideoDAO();
	}
	
	public int aftervideo(String videoNo, String userNo) throws SQLException {
		return dao.insertAftervideo(videoNo, userNo);
	}
	public int deleteAftervideo(String videoNo, String userNo) throws SQLException {
		return dao.deleteAftervideo(videoNo, userNo);
	}
	public int selectAftervideo(String videoNo, String userNo) throws SQLException {
		return dao.selectAftervideo(videoNo, userNo);
	}
}
