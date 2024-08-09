<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.*" %>
<%@ page import="com.wishJam.bestseller.BestsellerDTO" %>
<jsp:useBean id="bdao" class="com.wishJam.bestseller.BestsellerDAO"></jsp:useBean>
	
	<%
String sellers="yunna";
List<BestsellerDTO> bestseller= bdao.bestSeller(sellers);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
	font-family: 'Pretendard-Regular';
	width: 940px;
	height: 1500px;
	margin: 0 auto;
}


#selllist_wrap {
	width: 100%;
	height: 210px;
	border: 1px solid gray;
	display: flex;
}

.bw_item {
	width: 210px;
	height: 210px;
	border: 1px solid gray;
	background-image: url("/wishJam/img/img1.jpg");
	background-size: cover;
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
	border: 1px solid gray;
}

h3 {
	display: table-cell;
	vertical-align: middle;
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

.container {
	width: 100%;
	heigth: 540px;
	display: flex;
	
	gap: 1rem !important;
	row-gap: 1.2rem !important;
	overflow: hidden;
}

.item {
	width: 223px;
	height: 200px;
	border: 1px solid gray;
	position: relative;
	display: flex;
	border-radius: 20px;
}

.inner {
	width: 100%;
	height: 100px;
	border: 1px solid red;
	position: absolute;
	bottom: 0;
}

.img img {
	width: 100%;
	height: 200px;
	object-fit: cover;
	border-radius: 20px;
	position: relative;
}

.rank {
	width: 25px;
	height: 25px;
	background-color:gray;
	border-radius: 3px;
	display: block;
	color: white;
	text-align: center;
	margin: 3px;
	position:absolute;
	top:0;
	z-index:3;

}

.discount {
	color: #FF4900;
}

.writer {
	font-size: 14px;
	color: #747474;
}
</style>
</head>
<body>
	<section>

		<article>
			<div class="seller_pf_wrap">
				<img src="/wishJam/img/seller.jpeg" class="seller_pf">
				<h3><%= sellers %></h3>
			</div>

			<div id="selllist_wrap">
			
			    <div class="container">
				<%
				for (int i=0;i<bestseller.size();i++) {
					BestsellerDTO goods=bestseller.get(i);
				%>
				<div class="item">  
            <span class="rank"><%= i+1 %></span>
					<div class="img" onclick="location.href='/wishJam/goodsDetail/detail.jsp'">				
						<img src="<%=goods.getThumbnail_url()%>" alt="썸네일">
					</div>
				</div>
				   <% 
				}
				%>
			</div>
			

		</article>


	</section>

</body>
</html>