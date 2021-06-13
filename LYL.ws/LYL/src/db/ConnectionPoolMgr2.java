package db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ConnectionPoolMgr2 {
	DataSource ds;
	
	public ConnectionPoolMgr2() {
		Context ctx;
		
		try {
			ctx=new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracledb");
			//ds=(DataSource)ctx.lookup("java:comp/env/jdbc/oracledb1");
		}catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() throws SQLException {
		Connection conn = ds.getConnection();
		System.out.println("db연결, conn = "+conn);		
		return conn;
	}
	
	
	public void dbClose(PreparedStatement ps, Connection conn) throws SQLException {
		if(ps!=null) ps.close();
		if(conn!=null) conn.close();		
	}
	
	public void dbClose(ResultSet rs,PreparedStatement ps, Connection conn) throws SQLException {
		if(rs!=null) rs.close();
		if(ps!=null) ps.close();
		if(conn!=null) conn.close();		
	}
}
