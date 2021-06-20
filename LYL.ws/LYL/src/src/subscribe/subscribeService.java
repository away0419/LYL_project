package src.subscribe;

import java.sql.SQLException;

public class subscribeService {
	private subscribeDAO dao;
	
	
	public subscribeService() {
		dao = new subscribeDAO();
	}
	
	public int subscribe(String userNo2, String userNo ) throws SQLException {
		return dao.subscribe(userNo2, userNo);
	}
	public int dissubscribe(String userNo, String userNo2) throws SQLException {
		return dao.dissubscribe(userNo, userNo2);
	}
	public int selectSubscribe(String userNo2, String userNo ) throws SQLException {
		return dao.selectSubscribe(userNo2, userNo);
	}
}
