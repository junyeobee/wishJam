<%@page import="com.member.wishJam.MemberDTO"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<jsp:useBean id="mdao" class="com.member.wishJam.MemberDAO"></jsp:useBean>
<%
   String userid = request.getParameter("user_id");
   String userpwd = request.getParameter("user_pwd");
   
   boolean keepLogIn = request.getParameter("keepLogIn") != null; 
   
   int result = mdao.loginCheck(userid, userpwd);
   
   if(result==mdao.LOGIN_OK){
     Map<String, Object> userInfoMap = mdao.getUserInfo(userid);
      session.setAttribute("sid", userid);
      if (userInfoMap != null) {
           session.setAttribute("m_idx", userInfoMap.get("m_idx"));
           session.setAttribute("m_nick", userInfoMap.get("m_nick"));
       }
      
      if (keepLogIn) {
          session.setMaxInactiveInterval(7 * 24 * 60 * 60);
      } else {
          session.setMaxInactiveInterval(30 * 60); 
      }

      if (keepLogIn) {
          Cookie userCookie = new Cookie("user_id", userid);
          userCookie.setMaxAge(7 * 24 * 60 * 60); 
          response.addCookie(userCookie);
      } else {
          Cookie userCookie = new Cookie("user_id", "");
          userCookie.setMaxAge(0);
          response.addCookie(userCookie);
      }
      %>
      <script>
         window.alert('<%=userInfoMap.get("m_nick")%>님 환영합니다!');
         location.href='/wishJam';
         window.self.close();
      </script>
      <%
   } else if(result==mdao.NOT_ID){
      %>
          <script>
             window.alert('잘못된 아이디 및 비밀번호입니다.');
             location.href='/wishJam/login/login.jsp';
          </script> 
      <%
   } else if(result==mdao.NOT_PWD){
      %>
         <script>
            window.alert('잘못된 아이디 및 비밀번호입니다.');
            location.href='/wishJam/login/login.jsp';
         </script> 
      <%
   } else if(result==mdao.MANAGE){
	   Map<String, Object> userInfoMap = mdao.getUserInfo(userid);
	      session.setAttribute("sid", userid);
	      if (userInfoMap != null) {
	           session.setAttribute("m_idx", userInfoMap.get("m_idx"));
	           session.setAttribute("m_nick", userInfoMap.get("m_nick"));
	       }
	      
	      if (keepLogIn) {
	          session.setMaxInactiveInterval(7 * 24 * 60 * 60);
	      } else {
	          session.setMaxInactiveInterval(30 * 60); 
	      }
	      
	      %>
	      <script>
	         window.alert('<%=userInfoMap.get("m_nick")%>님 환영합니다!');
	         location.href='/wishJam/management/managePage.jsp';
	         window.self.close();
	      </script>
	      <%
   }else{
      %>
            <script>
            window.alert('고객센터로 연락바랍니다.');
            location.href='/wishJam/login/login.jsp';
         </script> 
      <%
   }
%>