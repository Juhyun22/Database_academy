package com.test.quiz;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/db/quiz02_delete")
public class DatabaseQuiz02Delete extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int id = Integer.valueOf(request.getParameter("id"));
		
		// connect db
		MysqlService mysql = MysqlService.getInstance();
		mysql.connection();
		
		String deleteQyery = "delete from `favorit_url` where `id` = " + id;
		
		try {
			mysql.update(deleteQyery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// disconnect
		mysql.disconnection();
		
		// next page -> quiz02.jsp
		response.sendRedirect("/lesson04/quiz02/quiz02.jsp");
	}
}
