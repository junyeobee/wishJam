<%@page import="com.member.wishJam.MemberDTO"%>
<%@page
	import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
<%@ page import="javax.servlet.*"%>
<%@ page import ="com.mypage.wishJam.MypageDTO" %>
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
	width: 370px;
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
	width: 370px;
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
	width: 370px;
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
	width: 370px;
	height: 120px;
}

	.error-text {
      color: red;
      font-size: 12px;
      font-family: 'Pretendard-Regular';
	}
</style>

<script>
function validatePasswords() {
    // 비밀번호와 비밀번호 확인 필드 가져오기
    const password = document.getElementById('m_pwd').value;
    const passwordConfirm = document.getElementById('m_pwd_confirm').value;
    const errorMessageElement = document.getElementById('error_message');

    // 오류 메시지 초기화
    errorMessageElement.textContent = '';

    // 비밀번호가 비어 있는지 확인
    if (password === '') {
        errorMessageElement.textContent = '비밀번호를 입력하세요.';
        return false;
    }

    // 비밀번호 확인이 비밀번호와 일치하는지 확인
    if (password !== passwordConfirm) {
        errorMessageElement.textContent = '비밀번호가 일치하지 않습니다.';
        return false;
    }

    // 유효성 검사가 통과되면 성공 메시지 출력 (또는 다음 단계로 진행)
    alert('비밀번호가 확인되었습니다.');
    return true;
}
</script>

<script>
	
	var inputpwd = document.getElementById("m_pwd");
	var altpwd = document.getElementById("alt_pwd");
	

	
	inputpwd.addEventListener('keyup', ()=>{
		if(inputpwd.value.trim() != "" && !isPwd(inputpwd.value)) {
			altpwd.innerText = "비밀번호는 8자리 이상 20자리 이하의 영문/숫자/특수문자 조합으로 입력해주세요.";
			altpwd.classList.add("error-text"); 
			altpwd.classList.remove("info-text"); 
		}else if(isPwd(inputpwd.value)) {
			altpwd.innerText = "올바른 비밀번호 형식입니다.";
			altpwd.classList.add("info-text"); 
			altpwd.classList.remove("error-text"); 
		}else {
			altpwd.innerText = " ";
			altpwd.classList.add("info-text"); 
			altpwd.classList.remove("error-text"); 
		}
	});	
</script>

</head>

<Script>
  //프로필 사진 변경 팝업
  function modifyImg() {
      window.open('ImgUpload.jsp', 'ImgUpload', 'width=400,height=400');
  }
  
  function validatePasswords() {
	    // 비밀번호와 비밀번호 확인 필드 가져오기
	    const password = document.getElementById('m_pwd').value;
	    const passwordConfirm = document.getElementById('m_pwd_confirm').value;
	    const errorMessageElement = document.getElementById('error_message');

	    // 오류 메시지 초기화
	    errorMessageElement.textContent = '';

	    // 비밀번호가 비어 있는지 확인
	    if (password === '') {
	        errorMessageElement.textContent = '비밀번호를 입력하세요.';
	        return false;
	    }

	    // 비밀번호 확인이 비밀번호와 일치하는지 확인
	    if (password !== passwordConfirm) {
	        errorMessageElement.textContent = '비밀번호가 일치하지 않습니다.';
	        return false;
	    }

	    // 유효성 검사가 통과되면 성공 메시지 출력 (또는 다음 단계로 진행)
	    alert('비밀번호가 확인되었습니다.');
	    return true;
	}
</Script>

<body>
	<%@ include file="/header.jsp"%>
	
	<%




if (m_idx != 0) {
	
	MypageDTO mmdto = new MypageDTO();
	mmdto= mdao.memberGet(m_idx);
	
%>
	<section>
		<form name="mypageedit" action="mypageEdit_ok.jsp">
			<div class="title">
				<h2>내 정보 수정하기</h2>
			</div>
			<article id="article_edit">
				
				<div class="edit_item label">프로필 사진</div>
				<div class="profileimg ">
					<span class="edit">변경하기</span> <img src="<%=src%>" alt="mypageImg" onclick="modifyImg()">
				</div>

			</article>
			
				<article id="article_edit2">

				<div class="edit_item label">아이디</div>
				<div class="input_wrap">
					<div class="edit_item">
						<div class="introduce">
							<input type="text" name="m_id" value="<%=mmdto.getM_id() %>"  disabled>
						</div>
					</div>
						
				</div>
			</article>
			
<article id="article_edit2">
    <div class="edit_item label">비밀번호</div>
    <div class="input_wrap">
        <div class="edit_item">
            <div class="introduce">
                <input type="text" name="m_pwd" id="m_pwd" value="<%=mmdto.getM_pwd()%>">
            </div>
        </div>
    </div>
</article>

<article id="article_edit2">
    <div class="edit_item label">비밀번호 확인</div>
    <div class="input_wrap">
        <div class="edit_item">
            <div class="introduce">
                <input type="password" name="m_pwd_confirm" id="m_pwd_confirm" value="<%=mmdto.getM_pwd()%>"> 
            </div>
        </div>
    </div>
</article>
			
			
			
			<article id="article_edit2">
				<div class="edit_item label">닉네임</div>
				<div class="input_wrap">
					<div class="edit_item">
						<div class="nickname">
							<input type="text" name="m_nick" value="<%=mmdto.getM_nick() %>">
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
							<input type="text" name="profile" value="<%=mmdto.getProfile()%>">
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
							<input type="text" name="m_tel" value="<%=mmdto.getM_tel()%>">
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
							<input type="text" name="m_email" value="<%=mmdto.getM_email()%>">
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
<input type="text" name="m_addr" value="<%=mmdto.getM_addr()%>">
						</div>
					</div>
				</div>
			</article>
			<article id="article_edit4">
				<div>
					<input type="submit" name="bt_save" value="저장하기" id="bt" onclick="validatePasswords()">
					<div id="error_message" style="color: red;"></div>
				</div>
			</article>
	</form>
	</section>
<%} %>
</body>
</html>