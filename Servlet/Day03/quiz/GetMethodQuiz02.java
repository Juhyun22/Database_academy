package com.test.quiz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/quiz02")
public class GetMethodQuiz02 extends HttpServlet {

	@Override 
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/json");
		
		PrintWriter out = response.getWriter();
		
		Integer number1 = Integer.valueOf(request.getParameter("number1"));
		Integer number2 = Integer.valueOf(request.getParameter("number2"));
		
		Integer addition = number1 + number2;
		Integer substraction = number1 - number2;
		Integer multiplication = number1 * number2;
		Integer division = number1 / number2;
		
		out.print("{\"addition\": " + addition 
				+ ", \"substraction\": " + substraction 
				+ ", \"multiplication\": " + multiplication 
				+ ", \"division\":" + division + "}");
		
		
	}
}
