<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.mypage.wishJam.MypageDAO"></jsp:useBean>
   
 <%
 String m_nick = request.getParameter("m_nick");
 m_nick = m_nick.replaceAll("\\s+","");
 boolean result = mdao.mynickCheck(m_nick);
 
 if(result){
	 %>
	 <script>
	 	window.alert('이미 존재하는 닉네임입니다.');
	 	location.href='/wishJam/mypage/nickCheck.jsp';
	 </script>
	 <%
 }else{
	 %>
	 <script>
	 	window.alert('사용할 수 있는 닉네임입니다.');
	 	location.href='/wishJam/mypage/nickCheck.jsp';
	 	opener.document.mypageedit.m_nick.value='<%=m_nick%>';
	 	window.self.close();
	 </script>
	 <%
 }
 
 
 %>