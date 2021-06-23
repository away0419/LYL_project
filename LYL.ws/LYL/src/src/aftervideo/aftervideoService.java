package src.aftervideo;

import java.sql.SQLException;
import java.util.List;

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
	public List<aftervideoVO> selectAllByUserNo(String userNo, int rowcnt) throws SQLException{
		return dao.selectAllByUserNo(userNo, rowcnt);
	}
}
