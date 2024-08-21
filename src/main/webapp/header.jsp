<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/wishJam/css/headfoot.css" />
<%
   String m_nick = (String)session.getAttribute("m_nick");
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
   <% if(m_nick==null){
      %>
   <div id = "top_right">
      <a href="login/login.jsp">로그인</a> | <a href="login/member.jsp">회원 가입</a>
   </div>
   <% 
   } else{
      %>
    <div id = "top_right">
      <%=m_nick %>님 접속 | <a href="login/logout.jsp">로그아웃</a>
   </div>
   <%
   }%>
</header>

</html>