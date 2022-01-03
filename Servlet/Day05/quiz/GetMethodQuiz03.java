package com.test.quiz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/quiz27")
public class GetMethodQuiz03 extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String address = request.getParameter("address");
		String payCard = request.getParameter("payCard");
		Integer price = Integer.valueOf(request.getParameter("price"));
		
		out.print("<html><head><title>주문 결과</title><body>");
		
		if (address.contains("서울시") == false) { // 주소가 서울시가 아닐때, 
			out.print("배달 불가 지역입니다.");
		} else if (payCard.contains("신한")){ // 카드가 신한일때! 
			out.print("결제 불가 카드 입니다.");
		} else {
			// 정상일 때 
			out.print(address + " <b>배달 준비중</b><br>" 
		              + "결제금액: " + price + "원");
		}
		
		out.print("</body></head></html>");
	}
}
