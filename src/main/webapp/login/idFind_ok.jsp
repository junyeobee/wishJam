<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.member.wishJam.MemberDAO"></jsp:useBean>
<%
   request.setCharacterEncoding("utf-8");
   String username = request.getParameter("user_name");
   String usertel = request.getParameter("user_tel");
   
   String m_id = mdao.idFind(username, usertel);
   
   if(m_id != null){
      %>
      <script>
         window.alert('가입한 아이디는 <%=m_id%>입니다.');
         location.href='/wishJam/login/login.jsp';
      </script>
      <%
   } else{
      %>
      <script>
         window.alert('가입된 아이디가 없습니다. 회원가입을 해주세요.');
         location.href='/wishJam/login/login.jsp';
      </script>
      <%
   }
%>