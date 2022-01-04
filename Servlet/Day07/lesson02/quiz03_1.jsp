<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>BMI 계산</title>
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
</head>
<body>
<%
	int height = Integer.valueOf(request.getParameter("height"));
	int weight = Integer.valueOf(request.getParameter("weight"));
	double bmi = weight / ((height / 100.0) * (height / 100.0));
	
	String result;
	if (bmi <= 20) {
			result = "저체중";
		} else if (bmi <=25) {
			result = "정상";
		} else if (bmi <=30) {
			result = "과체중";
		} else {
			result = "비만";
		}
%>

	<div class="container">
		<h1>BMI 측정 결과</h1>
		<div class="display-1">당신은 <span class="text-info"><%= result %></span>입니다.</div>
		<p>BMI 수치: <%= bmi %></p>
	</div>
</body>
</html>