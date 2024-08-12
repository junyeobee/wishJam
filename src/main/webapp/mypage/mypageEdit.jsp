<%@page
	import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="javax.servlet.*"%>

<jsp:useBean id="mdto" class="com.mypage.wishJam.MypageDTO" scope="session" />
<jsp:useBean id="mdao" class="com.mypage.wishJam.MypageDAO" scope="session" />




</script>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/allFonts.css" />
<link rel="stylesheet" href="/wishJam/css/burger.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
section {
	width: 940px;
	margin: 0 auto;
	font-family: 'Cafe24Ohsquareair';
}

.profileimg {
	position: relative;
	width: 80px;
	height: 80px;
}

.profileimg:hover { 
.edit { opacity:0.8;
	transition: 0.3s;
}

}
.profileimg img {
	width: 80px;
	height: 80px;
	border-radius: 100px;
	background-color: gray;
	text-align: center;
}

#article_edit {
	width: 100%;
	height: 130px;
	display: flex;
	flex-wrap: wrap;
}

#article_edit2 {
	width: 100%;
	height: 130px;
	display: flex;
	flex-wrap: wrap;
}

#article_edit3 {
	width: 100%;
	height: 150px;
	display: flex;
	flex-wrap: wrap;
	margin-bottom: 40px;
}

#article_edit4 {
	width: 100%;
	height: 150px;
	position: relative;
}

#article_edit4 div {
	widht: 100px;
	height: 50px;
	position: absolute;
	right: 0;
	bottom: 0;
}

.edit_item {
	display: flex;
	height: 200px;
	position: relative;
}

.label {
	width: 120px;
	font-weight: 600;
}

.nickname input {
	width: 360px;
	height: 38px;
}

.limit {
	height: 15px;
	font-size: 14px;
	position: absolute;
	bottom: 0;
	right: 0;
}

.input_wrap {
	width: 370px;
	height: 70px;
	position: relative;
}

.input_wrap2 {
	width: 370px;
	height: 150px;
	position: relative;
}

.introduce input {
	width: 360px;
	height: 38px;
}

.title {
	width: 100%;
	margin-bottom: 100px;
}

.title h2 {
	color: black;

}

.addr input {
	width: 360px;
	height: 38px;
	
}

#bt {
	width: 100px;
	height: 40px;
}

.edit {
	width: 100%;
	height: 30px;
	z-index: 1;
	background-color: black;
	color: white;
	font-size: 13px;
	position: absolute;
	bottom: 0;
	text-align: center;
	border-radius: 0 0 100px 100px;
	vertical-align: center;
	opacity: 0;
	padding-top: 5px;
}

.introduce2 input {
	width: 360px;
	height: 120px;
}
</style>

<script>
	
</script>

</head>
<%
//로그인 세션 받아오기
String id = (String) session.getAttribute("userId"); //앞에 mypage에서 받은 userid 맞춰서

if (id != null) {
	mdto= mdao.memberGet(id);
	
%>
<Script>
  //프로필 사진 변경 팝업
  function modifyImg() {
      window.open('ImgUpload.jsp', 'ImgUpload', 'width=400,height=400');
  }
</Script>

<body>
	<%@ include file="../header.jsp"%>
	<section>
		<form name="mypageedit" action="mypageEdit_ok.jsp">
			<div class="title">
				<h2>내 정보 수정하기</h2>
			</div>
			<article id="article_edit">
				<%
                String path = request.getRealPath("/");
                mdto.setHomepath(path);
                File file = new File(mdto.getHomepath() + mdto.getUrl());
				File[] fileList = file.listFiles();
				String imgSrc = "/wishJam/img/member_profile/default.png";
                
				for (File f : fileList) {
	
                    if (f.isFile() && f.getName().startsWith(id)) {
                        imgSrc = "/wishJam/img/member_profile/" + f.getName();
                        break;
				}else {
                    imgSrc = "/wishJam/img/member_profile/default.png";
                }
            }
				%>
				<div class="edit_item label">프로필 사진</div>
				<div class="profileimg ">
					<span class="edit">변경하기</span> <img src="<%=imgSrc%>" alt="mypageImg" onclick="modifyImg()">
				</div>
<%} %>
			</article>
			<article id="article_edit2">
				<div class="edit_item label">닉네임</div>
				<div class="input_wrap">
					<div class="edit_item">
						<div class="nickname">
							<input type="text" name="m_nick" placeholder="<%=mdto.getM_nick() %>">
						</div>
					</div>
					<div class=" edit_item limit">0/10</div>
				</div>
			</article>
			
			<article id="article_edit3">

				<div class="edit_item label">소개글</div>
				<div class="input_wrap2">
					<div class="edit_item">
						<div class="introduce2">
							<input type="text" name="profile" placeholder="소개글을 작성해주세요.">
						</div>
					</div>

					<div class=" edit_item limit">0/100</div>

				</div>

			</article>
			
			
			<article id="article_edit2">

				<div class="edit_item label">전화번호</div>
				<div class="input_wrap">
					<div class="edit_item">
						<div class="introduce">
							<input type="text" name="m_tel" placeholder="'-'를 포함하여 입력해주세요.">
						</div>
					</div>
						<div class="edit_item limit">0/10</div>
				</div>
			</article>
				<article id="article_edit2">

				<div class="edit_item label">이메일</div>
				<div class="input_wrap">
					<div class="edit_item">
						<div class="introduce">
							<input type="text" name="m_email" placeholder="이메일을 입력해주세요.">
						</div>
					</div>
					<div class=" edit_item limit">0/10</div>
				</div>
			</article>
			<article id="article_edit2">

				<div class="edit_item label">주소 정보</div>
				<div class="input_wrap">
					<div class="edit_item">
						<div class="addr">
<input type="text" name="m_addr" placeholder="주소를 입력해주세요.">
						</div>
					</div>
				</div>
			</article>
			<article id="article_edit4">
				<div>
					<input type="submit" name="bt_save" value="저장하기" id="bt">
				</div>
			</article>
	</form>
	</section>

</body>
</html>