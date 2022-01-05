<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>길이 변환</title>
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
</head>
<body>
<%
	double number = (double)Integer.valueOf(request.getParameter("number"));
	String[] changeArr = request.getParameterValues("change");
	int idxLength = changeArr.length;
	double[] result = new double[idxLength];
	
	for(int i = 0; i < idxLength; i++) {
		switch (changeArr[i]) {
		case "in":
			result[i] = number / 2.54;
			break;
		case "yd":
			result[i] = number / 91.44;
			break;
		case "ft":
			result[i] = number / 30.48;
			break;
		case "m":
			result[i] = number / 100;
		}
	}
%>
	<div class="container">
		<h1>길이 변환 결과</h1>
		<h4><%= number %>cm</h4><hr>
		<h4>
			<% for(int i = 0; i < idxLength; i++) {
				out.print(result[i] + changeArr[i] + "<br>");
			}
			%>
			
		</h4>
	</div>
</body>
</html>