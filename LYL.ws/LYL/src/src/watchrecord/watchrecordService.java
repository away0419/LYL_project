package src.watchrecord;

import java.sql.SQLException;

public class watchrecordService {
	private watchrecordDAO dao;
	
	public watchrecordService() {
		dao = new watchrecordDAO();
	}
	
	public int insertWatchrecord(String userNo, String vidNo) throws SQLException {
		return dao.insertWatchrecord(userNo, vidNo);
	}
}
