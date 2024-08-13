<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "cdao" class="com.wishJam.detail.ColorDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.co{
		width: 300px;
		height:300px;
		background-color: #<%=cdao.colortoHex(200, 120, 9)%>;
	}
</style>
</head>
<body>
	<input type="color">
	<div class="co"></div>
</body>
</html>