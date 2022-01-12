package com.test.ex;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.common.MysqlService;

@WebServlet("/db/ex02_delete")
public class DatabaseEx02Delete extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 쿼리 파라미터 id 값을 얻는다.
		int id = Integer.valueOf(request.getParameter("id")); // 필수적으로 id값이 들어와야 함 
		
		// DB 연결 
		MysqlService mysql = MysqlService.getInstance();
		mysql.connection();
		
		// id값으로 delete query 실행
		String deleteQuery = "delete from `new_user` where `id` = " + id;
		
		try {
			mysql.update(deleteQuery);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// DB 연결 해제 
		mysql.disconnection();
		
		// 리다이렉트 => ex02_1.jsp (유저 목록 화면) 
		response.sendRedirect("/lesson04/ex02/ex02_1.jsp");
	}
}
