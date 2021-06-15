package src.myuser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import db.ConnectionPoolMgr2;

public class MyuserDAO {
	private ConnectionPoolMgr2 pool;

	public MyuserDAO() {
		pool = new ConnectionPoolMgr2();
	}

	public MyuserVO selectMyuser(String userid) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			conn = pool.getConnection();
			String sql = "select * from myuser\r\n" + "where userid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);

			MyuserVO vo = null;
			rs = ps.executeQuery();
			if (rs.next()) {
				int userNo = rs.getInt("userNo");
				String userId = rs.getString("userId");
				String userPwd = rs.getString("userPwd");
				String userName = rs.getString("userName");
				int userPhone = rs.getInt("userPhone");
				String userEmail = rs.getString("userEmail");
				Timestamp userJoin = rs.getTimestamp("userJoin");
				int userSub = rs.getInt("userSub");
				String userImgName = rs.getString("userImgName");
				int userImgSize = rs.getInt("userImgSize");
				String userImgOriName = rs.getString("userImgOriName");
				String userDelFalg = rs.getString("userDelFalg");

				vo = new MyuserVO(userNo, userId, userPwd, userName, userPhone, userEmail, userJoin, userSub, userImgName, userImgSize, userImgOriName, userDelFalg);
				
			}
			System.out.println("select 결과 = " + vo + "매개변수=" + userid);
			return vo;

		} finally {
			pool.dbClose(rs, ps, conn);
		}

	}

	public int insertMyuser(MyuserVO vo) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;

		try {
			conn = pool.getConnection();
			String sql = "insert into myuser(userno,userid, userpwd, username, userphone, useremail, userjoin, usersub, userImgName, userImgSize, userImgOriName) \r\n"
					+ "values(myuser_seq.nextval, ?, ?, ?, ?, ?, default,default, ?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getUserId());
			ps.setString(2, vo.getUserPwd());
			ps.setString(3, vo.getUserName());
			ps.setString(4, Integer.toString(vo.getUserPhone()));
			ps.setString(5, vo.getUserEmail());
			ps.setString(6, vo.getUserImgName());
			ps.setString(7, Long.toString(vo.getUserImgSize()));
			ps.setString(8, vo.getUserImgOriName());

			int cnt = ps.executeUpdate();
			System.out.println("insert 결과 = " + cnt + "매개변수=" + vo);
			return cnt;

		} finally {
			pool.dbClose(ps, conn);
		}
	}
}
