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

	.info-text {
      color: blue;
      font-size: 12px;
      font-family: 'Pretendard-Regular';
	}
	
	.error-text {
      color: red;
      font-size: 12px;
      font-family: 'Pretendard-Regular';
	}
	
	#bt{
	
	font-family: 'Pretendard-Regular';
	background:#ff4900;
	color:#fff;
	border:none;
	border-radius: 10px;
	
	}
	.nickname input {
    width: 200px; /* 입력 필드의 너비 조정 (필요 시 조정) */
    margin-right: 10px; /* 버튼과의 간격 조정 */
}

.nickname button {
    padding: 5px 10px; /* 버튼의 패딩 조정 */
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
  function modifyImg(i) {
      window.open('ImgUpload.jsp?idx='+i, 'ImgUpload', 'width=400,height=400');
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
  function imgChange() {
	    var imgpath = document.getElementById('imagePath').value;
	    var previewImg = document.getElementById('previewImg');
	    if (previewImg) {
	        previewImg.src = imgpath;
	    }
	}

	function setImagePath(value) {
	    var input = document.getElementById('imagePath');
	    input.value = value;
	    imgChange();
	}
	//imgPath에 값이 들어오면 이벤트처리
	document.addEventListener('DOMContentLoaded', (event) => {
	    var inputElement = document.getElementById('imagePath');
	    inputElement.addEventListener('input', imgChange);
	});
</Script>

<body>
	<%@ include file="/header.jsp" %>
	
	<%




if (m_idx != 0) {
	
	MypageDTO mmdto = new MypageDTO();
	mmdto= mdao.memberGet(m_idx);
	
%>
	<section>
		<form id="mypageedit" name="mypageedit" action="mypageEdit_ok.jsp?">
			<div class="title">
				<h2>내 정보 수정하기</h2>
			</div>
			<article id="article_edit">				    
				    
				<div class="edit_item label">프로필 사진</div>
				<div class="profileimg ">
					<span class="edit">변경하기</span> <img src="<%=src%>" alt="mypageImg" onclick="modifyImg('<%=m_idx%>')" id = "previewImg">
					<input type="text" id="imagePath" name="m_img" readonly="readonly" hidden="hidden">
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
                <input type="password" name="m_pwd" id="m_pwd" value="" placeholder="비밀번호를 입력하세요." onfocus="this.placeholder='';">
				 <div class="input_alt_pwd" id="alt_pwd"></div> 
            </div>     
           
        </div>
    </div>
</article>

<article id="article_edit2">
    <div class="edit_item label">비밀번호 확인</div>
    <div class="input_wrap">
        <div class="edit_item">
            <div class="introduce">
                <input type="password" name="m_pwd_confirm" id="m_pwd_confirm" > 
            </div>
        </div>
    </div>
</article>
			
			
			
			<article id="article_edit2">
				<div class="edit_item label">닉네임</div>
				<div class="input_wrap">
					<div class="edit_item">
						<div class="nickname">
							<input type="text" name="m_nick" value="<%=mmdto.getM_nick() %>"><button onclick="nickCheck()" id="bt"> 중복체크</button>
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
							<input type="text" id="m_tel" name="m_tel" maxlength="13" value="<%=mmdto.getM_tel()%>" onkeyup="autoHyphen(value);">
						</div>
					</div>
						
				</div>
			</article>
			
			
				<article id="article_edit2">

				<div class="edit_item label">이메일</div>
				<div class="input_wrap">
					<div class="edit_item">
						<div class="introduce">
							<input type="text" id="m_email" name="m_email" value="<%=mmdto.getM_email()%>">
							 <div class="input_alt_email" id="alt_email"></div> 
						</div>
					</div>
					
				</div>
			</article>
			<article id="article_edit2">

				<div class="edit_item label">주소 정보</div>
				<div class="input_wrap">
					<div class="edit_item">
						<div class="addr">
							<input type="text" id="m_addr" name="m_addr" value="<%=mmdto.getM_addr()%>">
						</div>
					</div>
				</div>
			</article>
			<article id="article_edit4">
				<div>
					<button id="bt" name="bt_save">저장하기</button>
				</div>
			</article>
	</form>
	</section>
<%
	} 
	%>
</body>
</html>
<script>
	const autoHyphen = (number) => {
	    number = number.replace(/[^0-9]/g, '');
	    let temp = '';
	    if (number.length < 4) {
	      temp = number;
	    } else if (number.length < 8) {
	      temp += number.substr(0, 3);
	      temp += '-';
	      temp += number.substr(3, 4);
	    } else if (number.length < 12) {
	      temp += number.substr(0, 3);
	      temp += '-';
	      temp += number.substr(3, 4);
	      temp += '-';
	      temp += number.substr(7);
	    }
	    const PHONE_NUMBER_WITH_HYPHEN = temp;
	    const PHONE_INPUT_BOX = document.querySelector('#m_tel');
	    PHONE_INPUT_BOX.value = PHONE_NUMBER_WITH_HYPHEN;
	    PHONE_INPUT_BOX.setAttribute('value', PHONE_NUMBER_WITH_HYPHEN);
	  };
</script>
<script>
	function isPwd(pvalue) {
		var regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
		
		return regExp.test(pvalue);
	}
	
	function isPhoneNumber(pnValue) {
		var cleanPhoneNumber = pnValue.replace(/-/g, '');
		var regExp = /^01(?:0|1|[6-9])(?:\d{7}|\d{8})$/;
	 
		return regExp.test(cleanPhoneNumber);
	}
	
	function isEmail(eValue) {
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
		return regExp.test(eValue);
	}
</script>
<script>
	var inputpwd = document.getElementById("m_pwd");
	var altpwd = document.getElementById("alt_pwd");
	var altemail = document.getElementById("alt_email");
	var inputemail = document.getElementById("m_email");
	
	inputpwd.addEventListener('keyup', ()=>{
		if(inputpwd.value.trim() != "" && !isPwd(inputpwd.value)){
			altpwd.innerText = "비밀번호는 8자리 이상 20자리 이하의 영문/숫자/특수문자 조합으로 입력해주세요.";
			altpwd.classList.add("error-text"); 
			altpwd.classList.remove("info-text"); 
		} else if(isPwd(inputpwd.value)){
			altpwd.innerText = "올바른 비밀번호 형식입니다.";
			altpwd.classList.add("info-text"); 
			altpwd.classList.remove("error-text"); 
		} else{
			altpwd.innerText = " ";
			altpwd.classList.add("info-text"); 
			altpwd.classList.remove("error-text");
		}
	});
	
	inputemail.addEventListener('keyup', ()=>{
		if(inputemail.value.trim()!="" && !isEmail(inputemail.value)){
			altemail.innerText = "올바른 이메일 형식을 입력해주세요.";
			altemail.classList.add("error-text"); 
			altemail.classList.remove("info-text"); 
		} else if(isEmail(inputemail.value)){
			altemail.innerText = "올바른 이메일 형식입니다.";
			altemail.classList.remove("error-text"); 
			altemail.classList.add("info-text"); 
		} else{
			altemail.innerText = "";
			altemail.classList.remove("error-text"); 
			altemail.classList.add("info-text"); 
		}
	}); 
</script>
<script>
function nickCheck(){
	window.open('nickCheck.jsp','nickCheck', 'width=500px,height=500px');
	event.preventDefault();
}
</script>
<script>
	document.getElementById("bt").addEventListener('click', (event)=>{
		var pwd = document.getElementById("m_pwd").value;
		var pwdcheck = document.getElementById("m_pwd_confirm").value;
		var tel = document.getElementById("m_tel").value;
		var email = document.getElementById("m_email").value;
		var addr = document.getElementById("m_addr").value;
		
		if(pwd == "" || tel == "" || email =="" || addr == ""){
			window.alert('입력사항을 모두 기입해주세요.');
		} else if(pwd !=pwdcheck){
			window.alert('비밀번호가 일치하지 않습니다.');
		} else if(!isPwd(pwd)){
			window.alert('비밀번호 형식을 지켜주세요.');
		} else if(!isPhoneNumber(tel)){
			window.alert('전화번호 형식을 지켜주세요.');
		} else if(!isEmail(email)){
			window.alert('이메일 형식을 지켜주세요.');
		} else{
			document.getElementById("m_pwd_confirm").remove();
			document.getElementById("mypageedit").submit();
		}
	}); 
</script>