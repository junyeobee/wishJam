<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.wishJam.bestseller.BestsellerDTO" %>
<%@ page import="com.wishJam.bestseller.BestsellerDAO" %>
<jsp:useBean id="dao" class="com.wishJam.bestseller.BestsellerDAO"></jsp:useBean>

<%
String nick=request.getParameter("nick");
System.out.println("이거"+nick);
List<BestsellerDTO> sellerproducts = dao.bestSellersOne(nick);



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/wishJam/css/allFonts.css">
<link rel="stylesheet" href="/wishJam/css/burger.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />

<style>
section {
	font-family: 'Pretendard-Regular';
	width: 960px;
	height: 1500px;
	margin: 0 auto;
}

article {
	margin-bottom: 50px;
}


h2 {
	font-family: 'Cafe24Ohsquare';
	margin-bottom: 50px;
}


.seller_pf_wrap {
	width: 150px;
	height: 40px;
	display: table;
	margin-left: 5px;
}

.seller_pf {
	width: 35px;
	height: 35px;
	border-radius: 50px;
	
}

h3 {
	font-family: 'Cafe24Ohsquare';
	display: table-cell;
	vertical-align: middle;
	    height: 15px;
    line-height: 15px;
}


.rank {
	width: 25px;
	height: 25px;
	background-color: black;
	border-radius: 3px;
	display: block;
	color: white;
	text-align: center;
	margin: 3px;
}

#seller_tg {
	width: 100%;
	display: flex;
	flex-wrap: wrap;
}

#seller_tg div {
	width: 120px;
	height: 35px;
	border: 1px solid gray;
	border-radius: 20px;
	margin-right: 7px;
	margin-bottom: 5px;
	text-align: center;
}


#selllist_wrap {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* 4열 설정 */
    gap: 16px; /* 각 아이템 간의 간격 설정 */
    margin-top: 20px; /* 상단 여백 설정 */
}


.img {
    cursor: pointer; /* 클릭할 수 있음을 나타내는 커서 */
}

.img img {
    width: 215px; /* 이미지가 아이템 크기에 맞게 조정 */
    height: 215px; /* 비율 유지 */
    border-radius: 20px;
}
.title{
font-family: 'Cafe24Ohsquareair';
text-align:center;
}


.container {
	width: 100%;
	display: flex;
	flex-wrap: wrap;
	padding-top: 15px;
	gap: 1.2rem !important;
	row-gap: 1.2rem !important;
	margin-bottom:50px;
}

.item {
	gap: 1.2rem !important;
	width: 223px;
	height: 340px;	
	position: relative;
	border-radius: 20px;
	box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.09);
}

.inner {
	width: 100%;
	font-family: 'Pretendard-Regular';
	height: 140px;
	background-color:#fff;
	position: absolute;
	border-radius: 0 0 20px 20px;
	position: absolute;
	bottom: 0;
	padding-top:10px;
}

.inner div {
	margin-bottom: 10px;
	margin-left:6px;
}


.img img {
	width: 100%;
	height: 240px;
	object-fit: cover;
	border-radius: 20px 20px 0 0;
	
}


.price{
font-family: 'Pretendard-Regular';
 font-weight: 700;
}

.writer {
	font-size: 14px;
	color: #747474;
}


.discount{
display:inline;
font-weight:bold;
color:orange;
}

</style>


</head>


<body>
	<Section>
		<article>
			<div class="seller_pf_wrap">
				<img src="/wishJam/img/seller.jpeg" class="seller_pf">
				
				<h3><%=nick%></h3> </div>
				<article class="sellList">
			
			<div class="custom-underline"></div>

			<div class="container">
				<%
				
				

					if (sellerproducts!=null && ! sellerproducts.isEmpty()) {
						for(BestsellerDTO goods :sellerproducts ){
							%>
							
							<div class="item">
								<div class="img" onclick="godetail('<%=goods.getS_idx()%>');">
									<img src="<%=goods.getS_img()%>" alt="썸네일">
								</div>

								<div class="inner">
									<div><%=goods.getS_title()%></div>
									<div><%=goods.getSg_price()%></div>
								</div>
							</div>
							<%
					}} else {
					
					%>
					<p>상품이 없습니다.
					<p>
				<%
					
				}
				
				%>
			</div>
		</article>
			
			
		</article>
	</Section>
</body>
</html>