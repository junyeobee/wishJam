<%@page import="com.mypage.wishJam.MypageDAO"%>
<%@page import="com.member.wishJam.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.mypage.wishJam.MypageDTO"%>
<jsp:useBean id="mdto" class="com.mypage.wishJam.MypageDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.mypage.wishJam.MypageDAO"></jsp:useBean>



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
	width: 960px;
	margin: 0 auto;
	font-family: 'Cafe24Ohsquare';
	position:relative;
}

#mypage_section1 {
	font-family: 'Pretendard-Regular';
	width: 100%;
	height: 250px;
}

#mypage_wrap {
	font-family: 'Pretendard-Regular';
	width: 300px;
	height: 100px;
	margin: 0 auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

#mypage_wrap div {
	margin-bottom: 10px;

}


.profileimg img {
	width: 80px;
	height: 80px;
	border-radius: 100px;
	background-color: #C4C4C4;
	text-align: center;
}

.container {
	width: 100%;
	height: 380px;
	display: flex;
	overflow: hidden;
	padding:0 10px;
	gap: 1.2rem !important; 
}

.container1 {
	gap: 1.2rem !important;
	height: 360px;
}

.item {
	gap: 1.2rem !important;
	width: 210px;
	height: 340px;
	
	position: relative;
	border-radius: 20px;
	box-shadow: 0 2px 10px 0 rgba(0, 0, 0, 0.09);
}

.inner {
	width: 100%;
	height: 120px;
	background-color: #Fff;
	position: absolute;
	border-radius: 0 0 20px 20px;
	bottom: 0;
	font-family: 'Pretendard-Regular';
}

.inner div {
	margin: 10px 0 0 10px;
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
	font-family: 'Pretendard-Regular';
	height: 240px;
	background-color: #F0F1F4;
	text-align: center;
	border-radius: 10px;
	margin-bottom: 60px;
	margin-top: 63px;
	width: 990px;
	position: absolute;
    top: 9%;
    line-height:240px;
	
}

.nickname {
	font-weight: 600;
	font-size: 18px;
}

.introduce {
	font-weight: 500;
	font-size: 18px;
	line-height: 240px;
	width: 960px;
}

.edit {
	cursor: pointer;
	width: 8em;
	height: 30px;
	border: 1px solid lightgray;
	border-radius: 20px;
	font-size: 13px;
	color: gray;
	line-height: 30px;
	position: absolute;
	top: 8.7%;
}

.buylist {
	position: absolute;
	top: 44%;
	width: 960px;
	height: 500px;
	font-family: 'Cafe24Ohsquare';
}

.title {
	position: absolute;
	top: 0%;
	left: 0px;
}

.sellList {
	position: absolute;
	top: 25%;
	gap: 1.2rem !important;
	
}

.profilewrap {
	display: flex;
	flex-direction: column; 
	align-items: center; 
	justify-content: center; /* 수직 가운데 정렬 */
	text-align: center; /* 텍스트 가운데 정렬 */
	margin: 0 auto; /* 부모 요소의 가운데 정렬을 위해 자동 마진 */
	height: 100%; /* 부모 요소의 높이에 맞추기 위한 설정 */
	margin-top: 100px;
	
}

.custom-underline {
	width: 960px; /* 전체 너비 */
	height: 4px; /* 원하는 두께 */
	background-color: black; /* 원하는 색상 */
	margin: 20px 0; /* 위아래 여백 조정 */
}

.profile_item {
	height: 30px;
	width: 100px;
	text-align: center;
	cursor: pointer; /* 커서를 포인터로 변경 */
    transition: border-color 0.3s, color 0.3s; /* 부드러운 전환 효과 */
}


.profile_item:hover {
    border-color: #ff4900; /* 호버 시 테두리 색상 변경 */
    color: #ff4900; /* 호버 시 글자 색상 변경 */
}

.reviewbt{
	width: 210px;
    border: none;
    border-radius: 5px;
    height: 36px;
    border: 1px solid #ff4900;
    background-color: #Fff;
    color: #ff4900;
    transition: 0.5s;
    font-family: 'Pretendard-Regular';
    
}

.reviewbt:hover{
background-color:#ff4900;
color:#fff;
}

.buyitem_wrap{
    display: flex;
    flex-flow: column;
    align-items: center;
	heigth:390px;
}

</style>
</head>



<body>

	<%@ include file="/header.jsp"%>
	<Script>
		//현재 로그인 한 상태로 왔는지 체크하는 로직입니다. 헤더에서 받은 m_idx값이 만약 0이라면(헤더에서 세션이 없으면 0으로 세팅되도록 설정되어있습니다.) 해당 페이지 사용못하도록 구현했습니다
		//윤나님 파이팅하세용 
		var m_idx = <%=m_idx%>;
		if (m_idx === 0) {
			//alert('로그인을 하세요');
			// window.history.back();
		}

		function godetail(i) {
			window.location.href = '/wishJam/goodsDetail/detail.jsp?s_idx=' + i
		}
	</script>

	<section>
		<article id="mypage_section1">
			<div id="mypage_wrap">

				<%
				String ownerIdxParam = request.getParameter("ownerIdx");
				int ownerId;

				MypageDTO mmdto = new MypageDTO();

				if (ownerIdxParam != null) {
					ownerId = Integer.parseInt(ownerIdxParam);

					mmdto = mdao.memberGet(ownerId);
				%>
				<div class="profilewrap">
					<div class="profileimg">

						<img src="<%=src%>">
					</div>
					<div class="profile_item"><%=mmdto.getM_grade()%></div>
					<div class="profile_item nickname"><%=mmdto.getM_nick()%></div>
				</div>

				<article id="mypage_section2">

					<div class="introduce"><%=mmdto.getProfile()%></div>

				</article>


				<%
				} else {
				ownerId = m_idx;
				System.out.println("ownerId가 null이어서 m_idx 값을 사용합니다: " + ownerId);
				}

				if (mmdto == null) {
				// mmdto가 null인 경우 처리
				out.println("사용자 정보를 찾을 수 없습니다.");
				} else {

				if (m_idx == 0 || m_idx != ownerId) { //로그인한 m_idx != 마이페이지 주인m_idx	 다름

					mmdto = mdao.memberGet(ownerId);
					mmdto = mdao.mypageOwner(ownerId);
				%>

				<h2 class="title">
					<%=mmdto.getM_nick()%>의 위시잼💎
				</h2>
				<%
				} else if (m_idx != 0 && m_idx == ownerId) { // 로그인한 m_idx = 마이페이지 주인 m_idx 같음

				mmdto = mdao.memberGet(ownerId);
			
				%>
				<h2 class="title">마이페이지</h2>

				<div class="profilewrap">
					<div class="profileimg">

						<img src="<%=src%>">
					</div>
					<div class="profile_item"><%=mmdto.getM_grade()%></div>
					<div class="profile_item nickname"><%=mmdto.getM_nick()%></div>
				</div>

				<div class="profile_item edit" onclick="location.href='/wishJam/mypage/mypageEdit.jsp'">수정하기   ></div>



				<article id="mypage_section2">
					<%if(mmdto.getProfile() ==null ) { 
					
					
					%> <p>자기소개가 없습니다.<p> <%}else{ %>
					<div class="introduce"><%=mmdto.getProfile()%></div> <%} %>

				</article>
			<article class="buylist">
			<h3>구매내역</h3>
			<div class="custom-underline"></div>

			<div class="container">
				<%
				int idx = m_idx != 0 ? 0 : m_idx;
				ArrayList<MypageDTO> buylist = mdao.buyList_front(m_idx);
				for (MypageDTO goods : buylist) {

					if (goods == null) {
				%>
				<p>구매 내역이 없습니다.
				<p>
					<%
					} else {
					%>
				<div class="buyitem_wrap">
				<div class="item">
					<div class="img" onclick="window.open('/wishJam/mypage/buyList.jsp?s_idx=<%=goods.getS_idx()%>','buylist','width=920px,height=700px,top=460,left=320')";>
						<img src="<%=goods.getS_img()%>" alt="썸네일">
					</div>
					<div class="inner">
						<div><%=goods.getS_title()%></div>
						<div><%=goods.getSg_price()%></div>
					</div>
				</div>
				<div>
					<input type="button" value="리뷰 작성하기" class="reviewbt" onclick="window.open('/wishJam/goodsDetail/makeReview.jsp?s_idx=<%=goods.getS_idx()%>&m_idx=<%=m_idx %>','review','width=620px,height=700px,top=460,left=520')";/>
				</div>
				</div>
				<%
				}
				}
				%>
			</div>
		</article>
		

				<%
				}
				}
				%>



			</div>
		</article>



		<article class="sellList">
			<h3>판매내역</h3>
			<div class="custom-underline"></div>

			<div class="container">
				<%
				int idx = m_idx != 0 ? 0 : m_idx;
				ArrayList<MypageDTO> buylist = mdao.buyList(ownerId);
				for (MypageDTO goods : buylist) {

					if (goods == null) {
				%>
				<p>판매 내역이 없습니다.
				<p>
					<%
					} else {
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
				}
				}
				%>
			</div>
		</article>
	</section>
</body>
</html>