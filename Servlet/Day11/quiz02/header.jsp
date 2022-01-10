<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<header>
	<div class="d-flex align-items-center h-100">
		<div class="col-2">
			<h2><a href="/lesson03/quiz02/list_template.jsp" class="text-success">Melong</a></h2>
		</div>
		<form method="get" action="/lesson03/quiz02/detail_template.jsp" class="col-10">
			<div class="d-flex">
				<input type="text" class="form-control col-5" name="search">
				<button type="submit" class="btn btn-success">검색</button>
			</div>
		</form>
	</div>
</header>