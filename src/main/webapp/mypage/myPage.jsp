<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.mypage.wishJam.MypageDTO"%>
<jsp:useBean id="mdto" class="com.mypage.wishJam.MypageDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.mypage.wishJam.MypageDAO"></jsp:useBean>
<%
//아이디 세션 받기
String id = "seller";

session.setAttribute("userId", id);

String path = request.getRealPath("/");
mdto.setHomepath(path);
File file = new File(mdto.getHomepath() + mdto.getUrl());
File[] fileList = file.listFiles();
String imgSrc = "/wishJam/img/member_profile/default.png";
System.out.println(mdto.getHomepath());

for (File f : fileList) {
	if (f.isFile() && f.getName().startsWith(id)) {
		imgSrc = "/wishJam/img/member_profile/" + f.getName();
		break;
	} else {
		imgSrc = "/wishJam/img/member_profile/default.png";
	}
}
System.out.println(imgSrc);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/wishJam/css/burger.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />


<style>
section {
	width: 940px;
	margin: 0 auto;
	font-family: 'Pretendard-Regular';
}

#mypage_section1 {
	width: 100%;
	height: 250px;
	border: 1px solid red;
}

#mypage_wrap {
	width: 300px;
	height: 100%;
	margin: 0 auto;
	border: 1px solid blue;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.profile_item {
	height: 20px;
	width: 100%;
	text-align: center;
}

.profileimg img {
	width: 80px;
	height: 80px;
	border-radius: 100px;
	background-color: gray;
	text-align: center;
	margin-top: 80px;
}

.container {
	width: 100%;
	heigth: 340px;
	display: flex;
	border: 2px solid red;
	gap: 1.2rem !important;
	row-gap: 1.2rem !important;
	overflow: hidden;
}

.item {
	width: 223px;
	height: 340px;
	border: 1px solid blue;
	position: relative;
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
	height: 240px;
	object-fit: cover;
	border-radius: 20px 20px 0 0;
}

.discount {
	color: #FF4900;
}

.writer {
	font-size: 14px;
	color: #747474;
}

#mypage_section2 {
	height: 200px;
	border: 1px solid red;
	text-align: center;
}

.nickname {
	font-weight: 600;
	font-size: 18px;
}

.introduce {
	font-weight: 500;
	font-size: 18px;
	margin-top: 10%;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<section>
		<h2>마이페이지</h2>
		<article id="mypage_section1">

			<div id="mypage_wrap">
				<div class="profile_item">등급</div>
				<div class="profileimg">
					<img src="<%=imgSrc%>">
				</div>
				<div class="profile_item nickname">닉네임</div>
				<div class="profile_item edit"
					onclick="location.href='/wishJam/mypage/mypageEdit.jsp'">정보
					수정하기</div>

			</div>

		</article>


		<article id="mypage_section2">
			<div class="introduce">소개글을 작성해주세요 !</div>

		</article>


		<article>
			<h3>판매내역</h3>
			<hr>

			<div class="container">
				<%
				List<MypageDTO> buylist = mdao.buyList();

				for (MypageDTO goods : buylist) {
				%>
				<div class="item">
					<div class="img"
						onclick="location.href='/wishJam/goodsDetail/detail.jsp'">
						<img src="<%=goods.getThumbnail_url()%>" alt="썸네일">
					</div>

					<div class="inner">
						<div><%=goods.getName()%></div>
						<div><%=goods.getPrice()%></div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</article>


		<article>
			<h3>구매내역</h3>
			<hr>
			<div id="celllist_wrap">
				<div class="mypage_item"></div>
				<div class="mypage_item"></div>
				<div class="mypage_item"></div>
				<div class="mypage_item rightbox"></div>
			</div>
		</article>

	</section>
</body>
</html>