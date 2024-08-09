<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wishJam.bestseller.BestsellerDTO" %>
<%@ page import="java.util.*" %>

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
	font-family: 'Pretendard-Regular';
	width: 940px;
	height: 1500px;
	border: 1px solid black;
	margin: 0 auto;
}

article {
	margin-bottom: 50px;
}

article div {
	margin-right: 20px;
}


#selllist_wrap {
	width: 100%;
	height: 200px;
	border: 1px solid gray;
	display: flex;
}

.bw_item {
	width: 200px;
	height: 100%;
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

.hidden{
display:none;
}

   iframe {
        width: 100%;
        height:100%;
        border: none;
       overflow:hidden;
    }
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const dynamicLinks = document.querySelectorAll('.dynamic-link');
    dynamicLinks.forEach(link => {
        link.addEventListener('click', function(event) {
            event.preventDefault();
            const content = this.getAttribute('data-content');
            if (content) {
                loadContent(content);
            }
        });
    });
});

function loadContent(content) {
    const fileName = content + '.jsp';
    document.getElementById('contentFrame').src = fileName;
}
</script>
</head>


<body>
<%@include file="../header.jsp"%>
	
	<section id="main-content">

		<!-- 상단 태그 -->
		<h2>베스트 작가</h2>
		<article id="seller_tg">
			<div >작가이름</div>
			<div><a href="#" data-content="bestSeller_tag" class="dynamic-link">작가이름</a></div>
			<div>작가이름</div>
			<div>작가이름</div>
			<div>작가이름</div>
			<div>작가이름</div>
			<div>작가이름</div>
			<div>작가이름</div>
			<div>작가이름</div>
			<div>작가이름</div>
		</article>



  <iframe scrolling="no" id="contentFrame" src="test.jsp"></iframe>
	</section>
	



</body>
</html>