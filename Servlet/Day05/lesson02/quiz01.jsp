<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>  
<%@ page import="java.util.Arrays" %>  
<%@ page import="java.util.Calendar" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Quiz01</title>
</head>
<body>
<%!
	// 1. 1부터 n까지 합 
	public int getSum(int num) {
		int sum = 0;
		for (int i = 1; i <= num; i++) {
			sum += i;
		}
		return sum;
	}
%>

	<h1>1부터 50까지의 합은 <%= getSum(50) %>입니다.</h1>
	
<% 
	// 2. 점수 평균 
	int[] scores = {80, 90, 100, 95, 80};
	int sum = 0;
	for (int i = 0; i < scores.length; i++) {
		sum += scores[i];
	}
	double avg = (double)sum / scores.length;
%>

	<h1>평균 점수는 <%= avg %>입니다.</h1>
	

<%
	// 3. 채점 결과 
	List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
	sum = 0;
	for (int i = 0; i < scoreList.size(); i++) {
		if (scoreList.get(i).equals("O")) {
			sum += 100 / scoreList.size();
		}
	}
%>

	<h1>채점 결과는 <%= sum %>점 입니다.</h1>
	
<%
	Calendar now = Calendar.getInstance();
	String birthDay = "20010820";
	int birthYear = Integer.valueOf(birthDay.substring(0, 4));
	int year = now.get(Calendar.YEAR);
	int age = year - birthYear + 1;
	
	// 안에서 브라우저에 출력하는 법!!! 
	// out.print(year);
%>

	<h1><%= birthDay %>의 나이는 <%= age %>세 입니다.</h1>
</body>
</html>