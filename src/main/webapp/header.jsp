<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id = "maindao" class = "com.manage.wishJam.mainDAO"></jsp:useBean>
<link rel="stylesheet" href="/wishJam/css/headfoot.css" />
<%
	String m_nick = (String)session.getAttribute("m_nick");
	Integer m_idxObj = (Integer) session.getAttribute("m_idx");
	int m_idx = (m_idxObj != null) ? m_idxObj : 0;
	String src = maindao.getImgsrc(m_idx) != null ? maindao.getImgsrc(m_idx) : "";
%>
<style>
.wrap{

}
</style>
<header>
   <div class="top menu">
   <div class ="wrap">
      <label class="burger" for="burger">
        <input type="checkbox" id="burger">
        <span></span>
        <span></span>
        <span></span>
      </label>
      <a href="/wishJam/index.jsp">
         <img src="/wishJam/img/logo.png" alt="Wishgem Logo" class="logo">
      </a>
   </div>
   <div class="top center">
      <form action="">
         <input type="text" id="top_Search" class="search-bar"/> 
         <input type="button" value="검색" class="search-btn"/>
      </form>
   </div>
   <% if(m_nick==null){ %>
   <div class="top right notlogin">
      <a href="/wishJam/login/login.jsp">로그인</a> | 
      <a href="/wishJam/login/member.jsp">회원 가입</a>
   </div>
   <% 
	}else { %>
   <div class="top right login">
      <img src="<%=src %>" alt="profile" class="profile-icon"/>
      <label><%=m_nick %>님</label>
      <div class="funcBox">
         <ul>
            <li><a href="/wishJam/mypage/myPage.jsp">마이페이지</a></li>
            <li><a href="/wishJam/goodsDetail/makeSell.jsp">판매글 작성</a></li>
            <li><a href="/wishJam/login/logout.jsp">로그아웃</a></li>
         </ul>
      	</div>
      </div>
   </div>
   <% } %>
</header>
</html>