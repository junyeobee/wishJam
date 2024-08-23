<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.member.wishJam.MemberDAO"></jsp:useBean>
<%
   request.setCharacterEncoding("utf-8");
   String userid = request.getParameter("user_id");
   String usertel = request.getParameter("user_tel");
   
   String m_pwd = mdao.pwdFind(userid, usertel);
   
   if(m_pwd != null){
      %>
      <script>
         window.alert('지정한 비밀번호는 <%=m_pwd%>입니다.');
         location.href='/wishJam/login/login.jsp';
      </script>
      <%
   } else{
      %>
      <script>
         window.alert('정보를 찾을 수 없습니다. 다시 입력해주세요.');
         location.href='/wishJam/login/login.jsp';
      </script>
      <%
   }
%>