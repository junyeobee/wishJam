<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdto" class="com.member.wishJam.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.member.wishJam.MemberDAO"></jsp:useBean>
<%
	int result = mdao.memberJoin(mdto);
	String msg = result>0?"회원가입을 축하합니다.":"회원가입에 실패하였습니다.";
%>
<script>
	window.alert('<%=msg%>');
	location.href='/wishJam/login/login.jsp';
</script>