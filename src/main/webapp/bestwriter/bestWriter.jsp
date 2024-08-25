<%@page import="com.wishJam.bestseller.BestsellerDAO"%>
<%@page import="com.allgoods.wishJam.AllgoodsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wishJam.bestseller.BestsellerDTO"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="bdao" class="com.wishJam.bestseller.BestsellerDAO"></jsp:useBean>


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
	width: 960px;
	height: 1500px;
	margin: 0 auto;
}

article {
	margin-bottom: 50px;
}

#selllist_wrap {
	width: 100%;
	height: 200px;
	display: flex;
}

.bw_item {
	width: 200px;
	height: 100%;
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
	border: 1px solid #C4C4C4;
}

h3 {
	display: table-cell;
	vertical-align: middle;
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
	border: 1px solid #C4C4C4;
	border-radius: 20px;
	margin-right: 7px;
	margin-bottom: 5px;
	text-align: center;
	font-family: 'Cafe24Ohsquareair';
	cursor: pointer; /* 커서를 포인터로 변경 */
	transition: border-color 0.3s, color 0.3s; /* 부드러운 전환 효과 */
	line-height: 35px;
}

#seller_tg div:hover {
	border-color: #ff4900; /* 호버 시 테두리 색상 변경 */
	color: #ff4900; /* 호버 시 글자 색상 변경 */
}

.hidden {
	display: none;
}

iframe {
	width: 100%;
	height: 100%;
	border: none;
	overflow: hidden;
}

 .dynamic-link.active {
 	background-color: #ff4900; /* 클릭 시 배경 색상 */
	color: #fff; /* 클릭 시 글자 색상 */
	width:100%;
	height:100%;
	display: block;
	border-radius: 20px;
	
	
   }

</style>

<script>
	function sellerTag(nick) {
		document.getElementById('contentFrame').src = 'bestSeller_tag.jsp?nick='+ nick;
		
		 const links = document.querySelectorAll('.dynamic-link');
	        links.forEach(link => {
	            link.classList.remove('active'); // 모든 링크에서 'active' 클래스 제거
	        });

	        const currentLink = event.target; // 클릭된 링크
	        currentLink.classList.add('active'); // 클릭된 링크에 'active' 클래스 추가

	        // 추가적인 로직
	        console.log("Selected Nick: " + nick);
		
	}
</script>
</head>



<body>

	<%@include file="../header.jsp"%>

	<section id="main-content">
		<!-- 상단 태그 -->
		<h2>베스트 작가</h2>
		<article id="seller_tg">
			<%
			List<BestsellerDTO> goldsellers = bdao.goldSeller();
			if (goldsellers != null) {

				for (BestsellerDTO nicks : goldsellers) {
					System.out.println(nicks.getM_nick());
			%>

			<div>
				<a onclick="sellerTag('<%=nicks.getM_nick()%>')" class="dynamic-link"><%=nicks.getM_nick()%></a>
			</div>
			<%
			} 
			}
			%>
		</article>
		<iframe scrolling="no" id="contentFrame" src="test.jsp"></iframe>
	</section>




</body>
</html>