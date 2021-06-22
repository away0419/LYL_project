package src.myuser;

import java.sql.SQLException;

public class MyuserService {
	// 아이디 중복확인에 사용하는 상수
	public static final int USABLE_ID = 1; // 사용 가능한 아이디
	public static final int UNUSABLE_ID = 2; // 이미 존재하는 아이디

	// 로그인 처리에 사용하는 상수
	public static final int LOGIN_OK = 1; // 로그인 성공
	public static final int PWD_DISAGREE = 2; // 비밀번호 불일치
	public static final int ID_NONE = 3; // 아이디 존재하지 않음

	MyuserDAO userDao;

	public MyuserService() {
		userDao = new MyuserDAO();
	}

	public MyuserVO selectMyuser(String userid) throws SQLException {
		return userDao.selectMyuser(userid);
	}

	public int loginProc(String userid, String userpwd) throws SQLException {
		return userDao.loginProc(userid, userpwd);
	}
	public int insertMyuser(MyuserVO vo) throws SQLException {
		return userDao.insertMyuser(vo);
	}
	
	public int userUpdate(MyuserVO vo) throws SQLException {
		return userDao.userUpdate(vo);
	}
	public MyuserVO selectMyuserByVidNo(String vidno) throws SQLException {
		return userDao.selectMyuserByVidNo(vidno);
	}
	public int updateSubCnt(int userNo,int check) throws SQLException {
		return userDao.updateSubCnt(userNo, check);
	}
}
