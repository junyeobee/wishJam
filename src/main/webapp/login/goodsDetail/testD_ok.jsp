<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String box1 = request.getParameter("box1");
	String box2 = request.getParameter("box2");
	String box3 = request.getParameter("box3");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=box1 %>
<%=box2 %>
<%=box3 %>
</body>
</html>