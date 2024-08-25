<%@ page import="java.util.List"%>
<%@page import="com.allgoods.wishJam.AllgoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="mdao" class="com.manage.wishJam.manageDTO" />
<jsp:useBean id="bdao" class="com.manage.wishJam.BannerDAO" />
<jsp:useBean id="dao" class="com.allgoods.wishJam.AllgoodsDAO" />
<jsp:useBean id="jdto" class="com.allgoods.wishJam.AllgoodsDTO" />
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
	margin-bottom:60px;
}

.item {
	width: 223px;
	height: 380px;
	position: relative;
	border-radius: 20px;
	
}

.inner {
	width: 100%;
	font-family: 'Pretendard-Regular';
	height: 140px;
	background-color: #F0F1F4;
	position: absolute;
	border-radius: 0 0 20px 20px;
	position: absolute;
	bottom: 0;
	padding-top: 10px;
}

.inner div {
	margin-bottom: 10px;
	margin-left: 6px;
}

.img img {
	width: 100%;
	height: 240px;
	object-fit: cover;
	border-radius: 20px 20px 0 0;
}

.price {
	font-family: 'Pretendard-Regular';
	font-weight: 700;
}

.writer {
	font-size: 14px;
	color: #747474;
}

.discount {
	display: inline;
	font-weight: bold;
	color: #ff4900;
}

section a {
	text-dwishration: none;
	color: black;
}

.bestWriter {
	width: 90%;
	margin: 50px auto;
	height: 280px;
	background: #F0F1F4;
	border-radius: 15px;
	position: relative;
}

article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}

.resquick_content {
	font-family: 'Cafe24Ohsquareair';
	font-size: 13px;
	padding: 0;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	margin-top: 60px;
	margin-bottom: 500px;
	height:600px;
}

.resquick_service {
	margin-top: 60px;
}	

a, a:hover, a:focus, a:active, a:link {
	text-dwishration: none;
	color: inherit;
	font-size: 16px;
}

.resquick_content h2 {
	font-family: 'Cafe24Ohsquareair';
	margin-bottom: 80px;
	font-size: 24px;
	color: black;
}

.resquick_content {
	letter-spacing: -1px;
	width: 1200px;
	height: 300px;
	background: #fff;
	text-align: center;
	color: black;
	padding: 30px 0;
	display: block;
	border-radius: 20px;
	box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.09);
	margin:300px 0;
}

.resquick_content>h2 {
	font-size: 1.86rem;
	line-height: 2rem;
	font-weight: 600;
}

.resquick_content>p {
	margin: 8% 0 12%;
}

.resquick_content>a {
	border: 1.5px solid #ff4900;
	border-radius: 5px;
	 padding : 2% 10%;
	position: relative;
	z-index: 1;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-ms-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	color: #ff4900;
	padding: 2% 10%;
	  text-decoration: none;
}

.resquick_content>a:after {
	content: "";
	width: 0%;
	height: 100%;
	top: 0;
	position: absolute;
	left: 0;
	-webkit-transition: all 0.4s;
	-moz-transition: all 0.4s;
	-ms-transition: all 0.4s;
	-o-transition: all 0.4s;
	transition: all 0.4s;
	background: #ff4900;
}


.wish-card-wrap{
width:1200px;
heigth:600px;
margin-top:80px;

}

.resquick_content>a:hover {
	color: #fff;
}

.resquick_content>a:hover:after {
	width: 100%;
	z-index: -1;
}



.wish-card {
	overflow: hidden;
	border-radius: 20px;
	background-color: #fff;
	box-shadow: 0 2px 18px 0 rgba(0, 0, 0, 0.09);
}

.wish-card .img {
	position: relative;
}

.wish-card .img:before {
	content: '';
	display: block;
	padding-bottom: 72.1428%;
}

.wish-card .img img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	-o-object-fit: cover;
	object-fit: cover;
}

.wish-card .txt {
	display: flex;
	flex-direction: column;
	padding: 32px 0;
	text-align: center;
}

.wish-card .txt span {
	font-size: 16px;
	font-family: 'Pretendard-Regular';
}

.wish-card .txt strong {
	margin-top: 8px;
	font-weight: 700;
	font-size: 18px;
	font-family: 'Pretendard-Regular';
}

.wish-card-swiper .swiper-slide {
	width: calc(280px + 24px);
	padding: 0 12px;
	height:430px;
}

@media ( min-width : 1904px) {
	.wish-product .wish-card-swiper .swiper-wrapper {
		justify-content: center;
	}
}

.wish-product .inner {
	overflow: hidden;
	margin: 0 -22px -18px;
	padding: 0 22px 18px;
}

.wish-activity .inner {
	overflow: hidden;
	margin: 0 -22px -18px;
	padding: 0 22px 18px;
}

.wish-purpose .inner {
	padding: 0 12px;
}

.wish-purpose .section {
	display: flex;
	flex-direction: column;
	align-items: center;
	max-width: 320px;
	margin: 0 auto;
	height: 280px;
	padding: 32px 12px;
	border-radius: 20px;
	background-color: #fff;
	box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.09);
	text-align: center;
}

.wish-purpose .section .icon {
	display: block;
	width: 102px;
	height: auto;
	margin-bottom: 0;
}

.wish-purpose .section .heading {
	font-size: 20px;
}

.wish-purpose .section p {
	margin-top: 16px;
	font-size: 16px;
}

.wish-purpose .section:nth-child(1) .icon {
	width: 114px;
}

.wish-purpose .section+.section {
	margin-top: 32px;
}

.wish-purpose .accordion {
	max-width: 320px;
	margin: 40px auto 0;
	border-radius: 10px;
	background-color: #fafafa;
}

.wish-purpose .accordion .toggle {
	display: flex;
	align-items: center;
	position: relative;
	width: 100%;
	height: 60px;
	padding: 0 22px;
	color: #969696;
	font-size: 16px;
	cursor: pointer;
}

.wish-purpose .accordion .toggle:before {
	content: '';
	width: 24px;
	height: 24px;
	margin: 2px 4px 0 0;
	background: url(./../img/esg/wish_purpose_accordion_toggle_info.png)
		no-repeat 0 0/100% 100%;
}

.wish-purpose .accordion .toggle:after {
	content: '';
	position: absolute;
	top: 50%;
	right: 22px;
	width: 24px;
	height: 24px;
	margin-top: -12px;
	background: url(./../img/esg/wish_purpose_accordion_toggle_chevron.png)
		no-repeat 0 0/100% 100%;
}

.wish-purpose .accordion .toggle.active:after {
	transform: rotate(180deg);
}

.wish-purpose .accordion .detail {
	display: none;
	padding: 0 42px 42px;
}

.wish-purpose .accordion .detail ul li {
	position: relative;
	margin-top: 8px;
	padding-left: 10px;
	color: #969696;
	font-size: 14px;
}

.wish-purpose .accordion .detail ul li:first-child {
	margin-top: 0;
}

.wish-purpose .accordion .detail ul li:before {
	content: '';
	position: absolute;
	top: 10px;
	left: 0;
	width: 4px;
	height: 4px;
	border-radius: 50%;
	background-color: currentColor;
}

 .wish-card-wrap {
            display: flex;          
            overflow: hidden;      
        }

        .wish-card-swiper {
            display: flex;          
            flex-direction: row;   
            width: 100%;           
        }

        .swiper-wrapper {
            display: flex;          
            transition: transform 0.3s ease; 
        }

        .swiper-slide {
            flex: 0 0 auto;        
            width: 300px;          
            margin-right: 20px;    
        }
</style>

</head>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<article>
			<div class="slide slide_wrap">
				<%
				ArrayList<String> arr = bdao.getBannerList();
				if (arr != null) {
					for (int i = 0; i < arr.size(); i++) {
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
			<h2>
				<a href="/wishJam/allgoods/allGoods.jsp?sortOrder=popular">인기상품</a>
			</h2>
			<div class="container">
				<%
				List<AllgoodsDTO> productList = dao.allGoods("인기순");
				if (productList == null || productList.isEmpty()) {
					out.println("상품이 없습니다.");
				} else {
					for (AllgoodsDTO products : productList) {
				%>
				<div class="item">
					<div class="img"
						onclick="location.href='/wishJam/goodsDetail/detail.jsp?s_idx='+<%=products.getS_idx()%>">
						<img src="<%=products.getS_img()%>" alt="썸네일">
					</div>
					<div class="inner">
						<div class="writer"><%=products.getM_nick()%></div>
						<input type="hidden" name="s_title"
							value="<%=products.getS_title()%>">
						<!-- 상품 제목 -->
						<input type="hidden" name="productId"
							value="<%=products.getS_idx()%>">
						<!-- 상품 ID -->
						<div name="s_title"><%=products.getS_title()%></div>
						<div class="price">


							<%
							int dis = products.getS_discnt();

							if (dis > 0) {
							%><span class="discount"><%=dis + "%"%></span>
							<%=(int) (products.getSg_price() * (1 - (double) products.getS_discnt() / 100))%>
							<%
							} else {
							%>
							<%=products.getSg_price()%>
							<%
							}
							%>

						</div>
					</div>
				</div>
				<%
				}
				}
				%>
			</div>
			<h2 id="test2">
				<a href="/wishJam/allgoods/allGoods.jsp?sortOrder=latest">최신순</a>
			</h2>
			<div class="container">
				<%
				List<AllgoodsDTO> productList2 = dao.allGoods("최신순");
				if (productList2 == null || productList2.isEmpty()) {
					out.println("상품이 없습니다.");
				} else {
					for (AllgoodsDTO products : productList2) {
				%>
				<div class="item">
					<div class="img"
						onclick="location.href='/wishJam/goodsDetail/detail.jsp?s_idx='+<%=products.getS_idx()%>">
						<img src="<%=products.getS_img()%>" alt="썸네일">
					</div>
					<div class="inner">
						<div class="writer"><%=products.getM_nick()%></div>
						<input type="hidden" name="s_title"
							value="<%=products.getS_title()%>">
						<!-- 상품 제목 -->
						<input type="hidden" name="productId"
							value="<%=products.getS_idx()%>">
						<!-- 상품 ID -->
						<div name="s_title"><%=products.getS_title()%></div>
						<div class="price">

							<%
							int dis = products.getS_discnt();

							if (dis > 0) {
							%><span class="discount"><%=dis + "%"%></span>
							<%=(int) (products.getSg_price() * (1 - (double) products.getS_discnt() / 100))%>
							<%
							} else {
							%>
							<%=products.getSg_price()%>
							<%
							}
							%>
						</div>

					</div>
				</div>
				<%
				}
				}
				%>
			</div>
	</article>



			<article class="resquick_content resquick_service">
				<h2>위시잼의 인기 베스트작가 작품들을 소개합니다🧡</h2>

				<a href="/wishJam/bestwriter/bestWriter.jsp">구경하러 가기 ></a>
			</article>

	







<div class="wish-card-wrap">
		<div class="wish-card-swiper swiper-initialized swiper-horizontal swiper-pointer-events swiper-backface-hidden">
			<ul class="swiper-wrapper" id="swiper-wrapper-99cd55f6df77898a" aria-live="polite"
				style="transform: translate3d(100px, 0px, 0px); transition-duration: 0ms;">
				<li class="swiper-slide swiper-slide-active" role="group"
					aria-label="1 / 3">
					<div class="wish-card">
						<div class="img">
							<img
								src="https://www.woowayouths.com/assets/img/esg/eco_activity_01.png"
								alt="">
						</div>
						<p class="txt">
							<span>판매자가 원하는 시간에 <br>거래 예약하고
							</span> <strong>직접 거래할 수 있어요</strong>
						</p>
					</div>
				</li>
				<li class="swiper-slide swiper-slide-next" role="group"
					aria-label="2 / 3">
					<div class="wish-card">
						<div class="img">
							<img
								src="https://static.jejuair.net/cms/images/event_scrn/20240625151251671.jpg"
								alt="">
						</div>
						<p class="txt">
							<span>내가 원하는 상품을 <br>직접 생산, 판매할 수 있는
							</span> <strong>특별한 위시잼</strong>
						</p>
					</div>
				</li>
				<li class="swiper-slide" role="group" aria-label="3 / 3">
					<div class="wish-card">
						<div class="img">
							<img
								src="https://web-resource.tamburins.com/store/exhibition/30bda177-a8aa-4fad-a2f2-fdeba340b361/popup_balm_01.jpg"
								alt="">
						</div>
						<p class="txt">
							<span>인기있는 작가들의<br>굿즈들
							</span> <strong>팝업스토어 지원까지</strong>
						</p>
					</div>
				</li>
			</ul>
			<span class="swiper-notification" aria-live="assertive"
				aria-atomic="true"></span>
		</div>
                </div>
            </div>
            </section>
            
		<%@ include file="footer.jsp"%>
</body>
</html>
