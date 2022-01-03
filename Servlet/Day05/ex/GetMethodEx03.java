package com.test.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex03")
public class GetMethodEx03 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		String userId = request.getParameter("user_id");
		String name = request.getParameter("name");
		// if문으로 request.getParameter("age")가 null인지 아닌지 확인해주는 것이 좋음
		Integer age = Integer.parseInt(request.getParameter("age"));
		
		PrintWriter out = response.getWriter();
//		out.println("userId: " + userId);
//		out.println("name: " + name);
//		out.println("age: " + age);
		
		// JSON(Javascript Object Notation)으로 response 구성하기 
		// {'user_id':"hyun", "name":"sjhyun", "age":22}
		
		out.print("{\"user_id\":\"" + userId + "\", " 
		+ "\"name\":\"" + name + "\", " + "\"age\":" + age + "}");
		
	}
}
