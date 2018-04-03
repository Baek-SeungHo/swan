package common;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	public static Connection getConnection() {
		Connection con = null;
		Properties prop = new Properties();
		
		String fileName = JDBCTemplate.class.getResource("/dbresource/driver.properties").getPath();
		
		System.out.println("fileName : " + fileName);
		System.out.println("url : " + JDBCTemplate.class.getResource("/").toString());
		
		try {
			prop.load(new FileReader(fileName));
			
			Class.forName(prop.getProperty("driver"));
			con = DriverManager.getConnection(
					prop.getProperty("url"),
					prop.getProperty("user"),
					prop.getProperty("passwd"));
			
			con.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void commit(Connection con) {
		try {
			if(con != null && !con.isClosed())
				con.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void rollback(Connection con) {
		try {
			if(con != null && !con.isClosed())
				con.rollback();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection con) {
		try {
			if(con != null && !con.isClosed())
				con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed())
				stmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed())
				rset.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
