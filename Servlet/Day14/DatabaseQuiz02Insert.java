package com.test.quiz;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/db/quiz02_insert")
public class DatabaseQuiz02Insert extends HttpServlet {
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 1. request parameter 꺼낸다. 
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		
		// 2. db 연결 
		MysqlService mysql = MysqlService.getInstance();
		mysql.connection();
		
		// 3. favorit_url 테이블에 insert
		String insertQuery = "insert into `favorit_url` (`name`, `url`) "
				+ "values('"+ name +"','"+ url + "');";
		
		try {
			mysql.update(insertQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 4. db 연결 끊기 
		mysql.disconnection();
		
		// 5. redirect - 즐겨찾기 목록 확인 -> quiz02.jsp
		response.sendRedirect("/lesson04/quiz02/quiz02.jsp");
		
	}
	
}
