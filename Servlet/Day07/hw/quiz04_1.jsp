<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>계산기</title>
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
</head>
<body>
<%
	int number1 = Integer.valueOf(request.getParameter("number1"));
	int number2 = Integer.valueOf(request.getParameter("number2"));
	String numSentence = request.getParameter("calculate");
	int result;
	
	if (numSentence.equals("+")) {
		result = number1 + number2;
	} else if (numSentence.equals("-")) {
		result = number1 - number2;
	} else if (numSentence.equals("*")) {
		result = number1 * number2;
		numSentence = "X";
	} else {
		result = number1 / number2;
	}
%>
	<div class="container">
		<h1>계산 결과</h1>
		<div class="display-2"><%= number1 %> <%= numSentence %> <%= number2 %> = <span class="text-info"><%= result %></span></div>
	</div>
</body>
</html>
