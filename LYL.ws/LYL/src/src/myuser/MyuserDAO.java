package src.myuser;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.ConnectionPoolMgr2;

public class MyuserDAO {
	private ConnectionPoolMgr2 pool;
	
	MyuserDAO() {
		pool= new ConnectionPoolMgr2();
	}
	
	
	public MyuserDAO selectMyuser() {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = pool.getConnection();
		}finally{
			
		}
		
	}
}
