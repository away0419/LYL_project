package src.myuser;

import java.sql.SQLException;

public class MyuserService {
	MyuserDAO userDao;
	
	public MyuserService() {
		userDao = new MyuserDAO();
	}
	
	public MyuserVO selectMyuser(String userid) throws SQLException {
		return userDao.selectMyuser(userid);
	}
}
