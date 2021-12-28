package com.test.ex;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex03")
public class GetMethodEx03 extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/plain");
		
		
		
	}
}
