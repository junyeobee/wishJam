<%@page import="java.util.List"%>
<%@page import="com.allgoods.wishJam.AllgoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="mdao" class="com.manage.wishJam.manageDTO"/>
<jsp:useBean id="bdao" class="com.manage.wishJam.BannerDAO"/>
<jsp:useBean id="dao" class="com.allgoods.wishJam.AllgoodsDAO"/>
<jsp:useBean id="jdto" class="com.allgoods.wishJam.AllgoodsDTO"/>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/wishJam/css/burger.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<link rel="stylesheet" href="/wishJam/css/headfoot.css" />
<link rel="stylesheet" href="/wishJam/css/slide.css" />
<script src="slider.js" defer></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.container {
	width: 100%;
	display: flex;
	flex-wrap: wrap;
	padding-top: 30px;
	gap: 1.2rem !important;
	row-gap: 1.2rem !important;
}

.item {
	width: 223px;
	height: 380px;
	position: relative;
	border-radius: 20px;
	border: 1px solid #C4C4C4;
}

.inner {
	width: 100%;
	font-family: 'Pretendard-Regular';
	height: 140px;
	background-color:#F0F1F4;
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
    <%@ include file="header.jsp" %>
    <section>
        <article>
            <div class="slide slide_wrap">
                <%
                    ArrayList<String> arr = bdao.getBannerList();
                	if(arr!=null){
                		for(int i = 0; i < arr.size(); i++) {
                			%>
                				<div class="slide_item item<%=i%>">
                					<img src="<%=arr.get(i)%>" alt="" />
                				</div>
                			<%
                		}
                	}
                %>
            	      <div class="slide_prev_button slide_button">&lt;</div>
				      <div class="slide_next_button slide_button">&gt;</div>
				      <ul class="slide_pagination"></ul>
            </div>
        </article>
        <article>
            <h2>인기상품</h2>
            <div class="container">
            <%
            List<AllgoodsDTO> productList = dao.allGoods("인기순");
            if (productList == null || productList.isEmpty()) {
                out.println("상품이 없습니다.");
            } else {
                for (AllgoodsDTO products : productList) {
            %>
			<div class="item" >
			<div class="img" onclick="location.href='/wishJam/goodsDetail/detail.jsp'">
			<img src="<%=products.getS_img()%>" alt="썸네일">
			</div>
				<div class="inner"> 	
				<div class="writer"><%=products.getM_nick()%></div>
				<input type="hidden" name="s_title" value="<%=products.getS_title()%>"> <!-- 상품 제목 -->
            	<input type="hidden" name="productId" value="<%=products.getS_idx()%>"> <!-- 상품 ID -->
				<div name="s_title"><%=products.getS_title()%></div>
				<div class="price">
					
					
					<% 
					int dis=products.getS_discnt();
					
					if(dis>0){
		                  
		                 %><span class="discount"><%=dis +"%"%></span>
		                <%=(int)(products.getSg_price()*(1-(double)products.getS_discnt()/100)) %> <%
		               }else{%>
		                  <%=products.getSg_price() %>
		                  <% }%>
		               
		               </div>
				</div>
			</div>
			<%
			}}
			%>
		</div>
            <h2 id="test2">전체상품</h2>
                <div class="container">
            <%
            List<AllgoodsDTO> productList2 = dao.allGoods("최신순");
            if (productList2 == null || productList2.isEmpty()) {
                out.println("상품이 없습니다.");
            } else {
                for (AllgoodsDTO products : productList2) {
            %>
			<div class="item" >
			<div class="img" onclick="location.href='/wishJam/goodsDetail/detail.jsp'">
			<img src="<%=products.getS_img()%>" alt="썸네일">
			</div>
				<div class="inner"> 	
				<div class="writer"><%=products.getM_nick()%></div>
				<input type="hidden" name="s_title" value="<%=products.getS_title()%>"> <!-- 상품 제목 -->
            	<input type="hidden" name="productId" value="<%=products.getS_idx()%>"> <!-- 상품 ID -->
				<div name="s_title"><%=products.getS_title()%></div>
				<div class="price">
					
					
					<% 
					int dis=products.getS_discnt();
					
					if(dis>0){
		                  
		                 %><span class="discount"><%=dis +"%"%></span>
		                <%=(int)(products.getSg_price()*(1-(double)products.getS_discnt()/100)) %> <%
		               }else{%>
		                  <%=products.getSg_price() %>
		                  <% }%>
		               
		               </div>
				</div>
			</div>
			<%
			}}
			%>
		</div>
        </article>
    </section>
    <%@ include file="footer.jsp" %>
</body>
</html>
