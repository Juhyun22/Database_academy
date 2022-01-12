<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 추가</title>
</head>
<body>
	<%-- 
		1) 유저 추가: ex02.jsp(폼화면) -> DatabaseEx02Insert.java(DB insert)  => 리다이렉트 ex02_1.jsp(유저목록) 
	 --%>
	 <form method="post" action="/db/ex02_insert">
	 	<p>
	 		<b>이름</b>
	 		<input type="text" name="name">
	 	</p>
	 	<p>
	 		<b>생년월일</b>
	 		<input type="text" name="yyyymmdd">
	 	</p>
	 	<p>
	 		<b>자기소개</b><br>
	 		<textarea name="introduce" rows="5" cols="50"></textarea>
	 	</p>
	 	<p>
	 		<b>이메일</b>
	 		<input type="text" name="email">
	 	</p>
	 	<p>
	 		<input type="submit" value="추가">
	 	</p>
	 </form>
</body>
</html>