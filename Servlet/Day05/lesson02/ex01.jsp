<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>JSP</title>
</head>
<body>
	<!-- HTML의 주석: 소스보기에서 보인다. -->
	<%-- JSP의 주석: 소스보기에서 안보인다. --%>
	
	<h1>JSP 예제</h1>
	
<%
	// 자바 문법 시작
	// scriptlet
	int sum = 0;
	for (int i = 1; i <= 10; i++) {
		sum += i;
	}
%>

	<strong>합계:</strong>
	<input type="text" value="<%= sum %>">
	
<%! 
	// 선언문 - 클래스 같은 느낌 
	
	// field
	private int num = 100;
	
	// method
	public String getHelloWorld() {
		return "Hello World!!";
	}
%>

	<br><br>
	<%= getHelloWorld() %>
	<br>
	<%= num + 200 %>
</body>
</html>