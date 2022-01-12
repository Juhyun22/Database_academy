package com.test.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService {
	private static MysqlService mysqlService = null;
	
	// 도메인 뒤에 접속할 database명까지 써준다. 
	private String url = "jdbc:mysql://localhost:3306/schema";
	private String id = "root";
	private String pw = "root";
	
	private Connection conn = null;
	private Statement statement;
	private ResultSet res;
	
	// Singleton 패턴: MysqlService 객체가 단 하나만 생성되도록 하는 패턴 
	public static MysqlService getInstance() {
		if (mysqlService == null) {
			mysqlService = new MysqlService();
		}
		return mysqlService;
	}
	
	public void connection() {
		// 1. 드라이버를 메모리에 
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			
			// 2. DB Connection
			conn = DriverManager.getConnection(url, id, pw);
			
			// 3. statement: DB와 쿼리를 실행하기 위한 준비 
			statement = conn.createStatement();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void disconnection() {
		try {
			statement.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet select(String query) throws SQLException {
		res = statement.executeQuery(query);
		return res;
	}
	
	public void update(String query) throws SQLException {
		statement.executeUpdate(query);
	}
}
