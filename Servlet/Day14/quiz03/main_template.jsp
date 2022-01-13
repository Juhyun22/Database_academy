<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hong당무 마켓</title>
	
	<!-- bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
	<style>
	header {height:100px; background-color:orange;}
	
	nav {height:50px; background-color:orange;}
	nav .nav-font {font-size:20px; font-weight:bold; color:white;}
	
	.contents .box1 {height:320px; width:350px; border:5px solid orange; 
	padding:20px; margin-top:20px; margin-right:30px;}
	.contents .box2 {height:320px; width:350px; border:5px solid orange; 
	padding:20px; margin-top:20px; margin-right:30px;}
	.contents .box3 {height:320px; width:350px; border:5px solid orange; 
	padding:20px; margin-top:20px;}
	.contents .nickname-text {color:orange;}
	
	footer {height:50px}
	
	a:hover {text-decoration:none}
	</style>
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"/>
		<jsp:include page="menu.jsp"/>
		<jsp:include page="contents.jsp"/>
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>