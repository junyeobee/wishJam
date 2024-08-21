<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id = "maindao" class = "com.manage.wishJam.mainDAO"/>
<link rel="stylesheet" href="/wishJam/css/headfoot.css" />
<%
	String m_nick = (String)session.getAttribute("m_nick");
	Integer m_idxObj = (Integer) session.getAttribute("m_idx");
	int m_idx = (m_idxObj != null) ? m_idxObj : 0;
	String src = maindao.getImgsrc(m_idx) != null ? maindao.getImgsrc(m_idx) : "";
%>
<style>
#funcBox ul li{
	list-style: none;
	float:left;
	width:100px;
	position:relative;
}
#funcBox a{
	text-decoration: none;
}
#funcBox {
	width:170px;
	height:50px;
	background: #ccc;
	color:black;
	line-height: 50px; 
	margin:0 auto;
	text-align: center;
}
#top_right img{
	width: 50px;
	height: 50px;
	border-radius: 50%;
}
</style>
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
      <a href="/wishJam/login/login.jsp">로그인</a> | <a href="/wishJam/login/member.jsp">회원 가입</a>
   </div>
   <% 
   } else{
      %>
      
    <div id = "top_right">
      <img src="<%=src %>" alt="profile" />
      <label><%=m_nick %>님</label>
      
      <div id = "funcBox">
      <ul>
      	<li><a href="/wishJam/mypage/myPage.jsp">마이페이지</a></li>
      	<li></li>
      	<li><a href="/wishJam/login/logout.jsp">로그아웃</a></li>
      </ul>
      </div>
   </div>
   <%
   }%>
</header>

</html>