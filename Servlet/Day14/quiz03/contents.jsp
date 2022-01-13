<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.test.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>
	
<%
	// connect db
	MysqlService mysql = MysqlService.getInstance();
	mysql.connection();
	
	// select query
	String query = "select A.nickname, B.title, B.description, B.price, B.picture from `seller` as A" 
			+ " join `used_goods` as B on A.id = B.sellerId order by B.id desc;";
	ResultSet result = mysql.select(query);
%>
<div class="contents">
	<% 
		while (result.next()) {	
	%>
	<div class="line d-flex">
		<div class="box1">
			<img src="<%= result.getString("picture") %>" alt="물품 사진" width="300px">
			<div>
				<h5 class="font-weight-bold mt-2"><%= result.getString("title") %></h5>
				<span class="text-secondary"><%= result.getString("price") %>원</span><br>
				<span class="nickname-text"><%= result.getString("nickname") %></span>
			</div>
		</div>
		<% result.next(); %>
		<div class="box2">
			<img src="<%= result.getString("picture") %>" alt="물품 사진" width="300px">
			<div>
				<h5 class="font-weight-bold mt-2"><%= result.getString("title") %></h5>
				<span class="text-secondary"><%= result.getString("price") %>원</span><br>
				<span class="nickname-text"><%= result.getString("nickname") %></span>
			</div>
		</div>
		<% result.next(); %>
		<div class="box3">
			<img src="<%= result.getString("picture") %>" alt="물품 사진" width="300px">
			<div>
				<h5 class="font-weight-bold mt-2"><%= result.getString("title") %></h5>
				<span class="text-secondary"><%= result.getString("price") %>원</span><br>
				<span class="nickname-text"><%= result.getString("nickname") %></span>
			</div>
		</div>
		<% result.next(); %>
	</div>
	<% 
		}
	
	// db 연결 끊기 
	mysql.disconnection();
	%>
</div>