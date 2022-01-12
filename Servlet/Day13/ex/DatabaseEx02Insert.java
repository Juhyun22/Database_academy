package com.test.ex;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/db/ex02_insert")
public class DatabaseEx02Insert extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 폼에 있는 값들을 꺼낸다(request parameter)
		String name = request.getParameter("name");
		String yyyymmdd = request.getParameter("yyyymmdd");
		String introduce = request.getParameter("introduce");
		String email = request.getParameter("email");
		
		// DB 연결 
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connection();
		
		// new_user 테이블에 insert 
		String insertQuery = "insert into `new_user` (`name`, `yyyymmdd`, `introduce`, `email`)"
				+ "values ('"+ name + "', '"+ yyyymmdd + "', '" 
				+ introduce + "', '" + email + "');";
		
		try {
			mysqlService.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// DB 연결 해제 
		mysqlService.disconnection();
		
		// 리다이렉트 (유저 목록 화면) 
		response.sendRedirect("/lesson04/ex02/ex02_1.jsp");
	}
}
