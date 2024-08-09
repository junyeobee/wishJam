<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/wishJam/css/burger.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<link rel="stylesheet" href="/wishJam/css/headfoot.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
	<section>
		<article>
			<div>
				<h1 id = "test1">제목</h1>
			</div>
			<div id = "contentBox">배너들어갈곳</div>
		</article>
		<article>
			<h2>인기상품</h2>
			<div class = "listBox">
				<div class="list"><label id = "1">상품이미지</label></div>
				<div class="list"><a href="/wishJam/goodsDetail/detail.jsp">상품이미지</a></div>
				<div class="list">상품이미지</div>
				<div class="list">상품이미지</div>
			</div>
			<h2 id="test2">인기상품</h2>
			<div class="listBox">
				<div class="list">상품이미지</div>
				<div class="list">상품이미지</div>
				<div class="list">상품이미지</div>
				<div class="list">상품이미지</div>
			</div>
		</article>
	</section>
<%@ include file="footer.jsp" %>
</body>
</html>