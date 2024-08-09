<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/wishJam/css/headfoot.css" />
<%
	
%>
<header>
	<div id = "top_menu">
		<label class="burger" for="burger">
		  <input type="checkbox" id="burger">
		  <span></span>
		  <span></span>
		  <span></span>
		</label>
	</div>
	<div id = "top_left">
		<a href="index.jsp">메인</a>
	</div>
	<div id = "top_center">
		<form action="">
			<input type="text" id = "top_Search"/> <input type="button" value="검색" />
		</form>
	</div>
	<div id = "top_right">
		<a href="login/login.jsp">로그인</a> | <a href="login/member.jsp">회원 가입</a>
	</div>
</header>
</html>