<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/wishJam/css/headfoot.css" />
<%
	String sname = (String)session.getAttribute("sname");
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
		<a href="/wishJam/index.jsp">메인</a>
	</div>
	<div id = "top_center">
		<form action="">
			<input type="text" id = "top_Search"/> <input type="button" value="검색" />
		</form>
	</div>
	<% if(sname==null){
      %>
	<div id = "top_right">
		<a href="login/login.jsp">로그인</a> | <a href="login/member.jsp">회원 가입</a>
	</div>
	<% 
   } else{
      %>
    <div id = "top_right">
		<%=sname %>님 접속 | <a href="login/logout.jsp">로그아웃</a>
	</div>
	<%
   }%>
</header>

</html>