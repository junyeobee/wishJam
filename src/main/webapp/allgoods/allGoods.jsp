<%@page import="com.allgoods.wishJam.AllgoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.*"%>
<%@ page import="com.allgoods.wishJam.AllgoodsDTO"%>
<jsp:useBean id="gdao" class="com.allgoods.wishJam.AllgoodsDAO"></jsp:useBean>

<%
List<AllgoodsDTO> productList = gdao.allGoods();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/allFonts.css" />
<link rel="stylesheet" href="/wishJam/css/burger.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<meta charset="UTF-8">
<style>
section {
	font-family: 'Pretendard-Regular';
	width: 960px;
	height: 2000px;
	border: 1px solid black;
	margin: 0 auto;
}

#filter {
	float: right;
}

.container {
	width: 100%;
	display: flex;
	flex-wrap: wrap;
	border: 2px solid red;
padding-top: 30px;
		gap:1.2rem !important;
	row-gap: 1.2rem !important;

}

.item {
	width: 223px;
	height: 380px;
	
	
	border: 1px solid blue;
	position: relative;
	border-radius: 20px;
}

.inner {
	width: 100%;
	height: 140px;
	border: 1px solid red;
	position: absolute;
	bottom: 0;
}

.inner div {
	margin-bottom: 4px;
}

#select_2 {
	width: 130px;
	height: 50px;
}

.img img {
	width: 100%;
	height: 240px;
	object-fit: cover;
	border-radius: 20px 20px 0 0;
}

.heart {
	width: 32px;
	height: 30px;
	position: absolute;
	right: 0;
	bottom: 0;
	display: block;
}

.discount {
	color: #FF4900;
}

.writer {
	font-size: 14px;
	color: #747474;
}
</style>

<script>
//찜하기 버튼
function jjim(productId){

	var jjimbt=document.getElementById("jjimimg_"+productId);
	var on = "heart.png";
	var off = "heart_gray.png";
	

if(jjimbt.src.endsWith(off)){
jjimbt.src="/wishJam/img/"+on;
}else{
	jjimbt.src="/wishJam/img/"+off;
}

}
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>
		<h2>전체 상품</h2>
		<article>
			<div id="filter">
				<select name="select2" id="select_2">
					<option value="all">인기순</option>
					<option value="all">최신순</option>
				</select>
			</div>
		</article>
		<div class="container">
			<%
			for (AllgoodsDTO products : productList) {
			%>
			<div class="item ">
				<div class="img"
					onclick="location.href='/wishJam/goodsDetail/detail.jsp'">
					<img src="<%=products.getThumbnail_url()%>" alt="썸네일">
				</div>
				<div class="inner">
					<div class="writer"><%=products.getSeller()%></div>
					<div><%=products.getName()%></div>
					<div><%=products.getPrice()%></div>
					<span class="heart" onclick="jjim(<%=products.getIdx()%>);"><img
						src="/wishJam/img/heart_gray.png"
						id="jjimimg_<%=products.getIdx()%>"></span>
				</div>

			</div>

			<%
			}
			%>
		</div>
	</section>
</body>
</html>