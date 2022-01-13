<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.test.common.MysqlService" %>
<%@ page import="java.sql.ResultSet" %>
    
<%
	// db 연결 
	MysqlService mysql = MysqlService.getInstance();
	mysql.connection();
	
	// select query
	String sellerQuery = "select * from `seller`;";
	ResultSet result = mysql.select(sellerQuery);
%>

<div class="insert-box">
	<form method="post" action="/db/quiz03">
		<div class="m-5">
			<div class="display-3">
				물건 올리기 
			</div>
			<div class="product-information">
				<div class="d-flex mt-3">
					<select class="custom-select col-3 mr-5" id="select-seller">
						<option selected>-아이디 선택-</option>
						<% while(result.next()) { %>
						<option value="<%= result.getInt("id") %>>"><%= result.getString("nickname") %></option>
						<% }%>
					</select>
					<input type="text" class="form-control col-5 mr-5" name="title" placeholder="제목">
					<div class="input-group col-3">
					  <input type="text" class="form-control" name="price" placeholder="가격">
					  <div class="input-group-append">
					    <span class="input-group-text">원</span>
					  </div>
					</div>
				</div>
				<div class="discription-box mt-3">
					<textarea class="form-control" name="description" rows="10" cols="30"></textarea>
				</div>
				<div class="img-url input-group mt-3">
					  <div class="input-group-prepend">
					    <span class="input-group-text">이미지 url</span>
					  </div>
					  <input type="text" class="form-control" name="picture">
				</div>
			</div>
			<input type="submit" class="btn btn-light form-control mt-3" value="저장">
		</div>
	</form>
</div>
<%
	mysql.disconnection();
%>