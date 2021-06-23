package src.watchrecord;

import java.sql.SQLException;
import java.util.List;

public class watchrecordService {
	private watchrecordDAO dao;
	
	public watchrecordService() {
		dao = new watchrecordDAO();
	}
	
	public int insertWatchrecord(String userNo, String vidNo) throws SQLException {
		return dao.insertWatchrecord(userNo, vidNo);
	}
	public List<watchrecordVO> selectAllByUserNo(String userNo,int cnt) throws SQLException{
		return dao.selectAllByUserNo(userNo, cnt);
	}
}
