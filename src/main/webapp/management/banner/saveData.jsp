<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String a = request.getParameter("title");
	String b = request.getParameter("imagePath");


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>제목 : <%=a %></h1>
	<h1>경로 : <%=b %></h1>
</body>
</html>