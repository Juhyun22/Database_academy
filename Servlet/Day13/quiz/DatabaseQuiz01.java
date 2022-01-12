package com.test.quiz;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/db/quiz01")
public class DatabaseQuiz01 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/plain");
		
		// DB 연동 
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connection();
		
		// insert query
		// select query -> 처리(출력) 
		try {
			String insertQuery = "insert into `real_estate` (`realtorId`, `address`, `area`, `type`, `price`, `rentPrice`)"
				+ "values (3, '헤라펠리스 101동 5305호', 350, '매매', 1500000, null)";
		
			mysqlService.update(insertQuery);
			
			String selectQuery = "select * from `real_estate` order by `id` asc limit 10;";
			PrintWriter out = response.getWriter();
			
			ResultSet resultSet = mysqlService.select(selectQuery);
			
			while (resultSet.next()) {
				// 매물 주소, 면적, 타입 
				String address = resultSet.getString("address");
				int area = resultSet.getInt("area");
				String type = resultSet.getString("type");
				out.println("매물 주소 : " + address + ", 면적 : " + area + ", 타입 : " + type);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		}
		
		// DB연결 해제 
		mysqlService.disconnection();
	}
}
