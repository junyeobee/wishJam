<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<meta charset="UTF-8">
<title>위시잼 - 회원가입</title>
<style>
	.join_wrap {
      width: 850px;
      padding: 20px 0;
      margin: 0 auto;
      font-family: 'Cafe24Ohsquareair';
    }
    
    .join_box {
      width: 850px;
      border-radius: 10px;
      text-align: center;
      padding-top: 45px;
    }
    
    .join_noti{
      color: #808080;
      margin: 30px 0px 10px 700px ;
    }
    
    .star_css{
  	  color: #ee6a7b;
    }
    
    .join_in_box{
      display: inline-flex;
      width: 100%;
      padding: 10px 10px;
    }
    
    .join_tel_ckbox{
      display: none;
      width: 100%;
      padding: 10px 10px;
    }
    
    .input_title{
      width: 15%;
      padding-top: 12px;
      text-align: left;
    }
    
    .input_val {
      width: 60%;
      height: 46px;
      border-radius: 4px;
      padding: 0px 11px 1px 15px;
    }
    
    .input_btn{
      padding: 0px 10px;
      width: 13%;
      height: 52px;
    }
    
    .join_input{
      width: 90%;
      height: 46px;
      border-radius: 4px;
      border: 1px solid rgb(221, 221, 221);
      font-weight: 400;
      font-size: 16px;
      line-height: 1.5;
      color: #808080;
      outline: none;
      box-sizing: border-box;
      padding: 0 20px;
    }
    
    .join_check{
      display: block;
      text-align: center;
      overflow: hidden;
      width: 100%;
      height: 52px;
      border-radius: 3px;
      color: #ff4900;
      background-color: #fff;
      border: 1px solid #ff4900;
    }
    
    .j_success{
      width: 300px;
      height: 55px;
      border: 1px solid #ff4900;
      border-radius: 10px;
      background: #ff4900;
      color: #fff;
      font-size: 18px;
      font-weight: 400;
      -webkit-appearance: none;
      cursor: pointer;
      font-family: 'Cafe24Ohsquareair';
    }
    
    .gender_css{
      display: flex;
      padding: 13px 0px 0px 11px;
      -webkit-box-pack: justify;
      flex-direction: row;
    }
    
    .join_gender{
      margin-left: 20px;
      margin-right: 20px;
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
	
	.checkbox_group {
	  text-align: left;
	  margin-top: 8px;
	  margin-left: 20px;
	  font-family: 'Pretendard-Regular';
	}
	
	.checkbox_top_line{
	  padding-bottom: 15px;
	}
	
	.checkbox_line {
	  padding-bottom: 8px;
	}
</style>
<script>
function check_id() {
    return new Promise((resolve, reject) => {
        let formData = new URLSearchParams();
        formData.append('m_id', document.getElementById("m_id").value);

        fetch('idCheck_ok.jsp', {
            method: 'POST',
            body: formData
        })
        .then(response => {
            if (response.ok) {
                return response.json(); 
            } else {
                throw new Error('Network response was not ok.');
            }
        })
        .then(data => {
            if (data.status === 'success') {
            	alert(data.message);
                resolve(); 
            } else {
                alert(data.message);
                reject(new Error(data.message)); 
            }
        })
        .catch(error => {
            console.error('Error:', error);
            reject(error); 
        });
    });
}

function check_email() {
	return new Promise((resolve, reject) => { 
		let eformData = new URLSearchParams();
		eformData.append('m_email', document.getElementById("m_email").value);

		fetch('emailCheck_ok.jsp',{
			method: 'POST',
			body: eformData
		})
		.then(response => {
			if (response.ok) {
                return response.json(); 
            } else {
                throw new Error('Network response was not ok.');
            }
		})
		.then(data => {
			if(data.status == 'success'){
				alert(data.message);
				resolve();
			} else{
				alert(data.message);
				reject(new Error(data.message)); 
			}
		})
		.catch(error => {
			console.error('Error:', error);
			reject(error); 
		});
	});
}

let randomNumber;

function send_tel() {
	randomNumber = Math.floor(Math.random() * 9000) + 1000;
	alert(randomNumber);
	var tel_ck = document.getElementById("tel_ckbox");
	tel_ck.style.display = 'inline-flex';
}

function send_ck() {
	var m_telck = document.getElementById("m_telck");
	var tel_send = document.getElementById("tel_send");
	var tel_cksend = document.getElementById("tel_cksend");
	
	if(randomNumber == m_telck.value){
		alert("인증이 완료되었습니다.");
		m_telck.disabled = true;
		tel_cksend.disabled = true;
		tel_send.disabled = true;
	} else {
		alert("인증에 실패하였습니다.");
	}
}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="join_wrap">
	<div class="join_box">
		<h2 style="color:#ff4900;">회 원 가 입</h2>
		<div class="join_noti">
			<span class="star_css">*</span>
			필수입력사항
		</div>
		<hr style="border: 2px solid #a9a9a9;width:850px;">
		<form class="join_form" id="join_form" action="memberJoin_ok.jsp">
		<div class="join_in_box">
			<div class="input_title">
				<label>아이디<span class="star_css">*</span></label>
			</div>
			<div class="input_val">
				<input type="text" class="join_input" id="m_id" name="m_id" value="" placeholder="아이디를 입력해주세요" onfocus="this.placeholder='';">
				<div class="input_alt_id" id="alt_id"></div>
			</div>
			<div class="input_btn">
				<button type="button" class="join_check" id="id_check" onclick="check_id();">중복확인</button>
			</div>
		</div>
		<div class="join_in_box">
			<div class="input_title">
				<label>비밀번호<span class="star_css">*</span></label>
			</div>
			<div class="input_val">
				<input type="password" class="join_input" id="m_pwd" name="m_pwd" value="" placeholder="비밀번호를 입력해주세요" onfocus="this.placeholder='';">
				<div class="input_alt_id" id="alt_pwd"></div>
			</div>
			<div class="input_btn"></div>
		</div>
		<div class="join_in_box">
			<div class="input_title">
				<label>비밀번호확인<span class="star_css">*</span></label>
			</div>
			<div class="input_val">
				<input type="password" class="join_input" id="m_ckpwd" name="m_ckpwd" value="" placeholder="비밀번호를 한번 더 입력해주세요" onfocus="this.placeholder='';">
			</div>
			<div class="input_btn"></div>
		</div>
		<div class="join_in_box">
			<div class="input_title">
				<label>이름<span class="star_css">*</span></label>
			</div>
			<div class="input_val">
				<input type="text" class="join_input" id="m_name" name="m_name" value="" placeholder="이름을 입력해주세요" onfocus="this.placeholder='';">
			</div>
			<div class="input_btn"></div>
		</div>
		<div class="join_in_box">
			<div class="input_title">
				<label>닉네임</label>
			</div>
			<div class="input_val">
				<input type="text" class="join_input" id="m_nick" name="m_nick" value="" placeholder="닉네임을 입력해주세요" onfocus="this.placeholder='';">
			</div>
			<div class="input_btn"></div>
		</div>
		<div class="join_in_box">
			<div class="input_title">
				<label>휴대폰<span class="star_css">*</span></label>
			</div>
			<div class="input_val">
				<input type="text" class="join_input" id="m_tel" name="m_tel" value="" maxlength="13" placeholder="번호를 입력해주세요" onfocus="this.placeholder='';" onkeyup="autoHyphen(value)">
			</div>
			<div class="input_btn">
				<button type="button" class="join_check" id="tel_send" onclick="send_tel();">인증번호 받기</button>
			</div>
		</div>
		<div class="join_tel_ckbox" id="tel_ckbox">
			<div class="input_title"></div>
			<div class="input_val">
				<input type="text" class="join_input" id="m_telck" name="m_telck" value="" maxlength="4" placeholder="인증번호를 입력해주세요" onfocus="this.placeholder='';">
			</div>
			<div class="input_btn">
				<button type="button" class="join_check" id="tel_cksend" onclick="send_ck();">인증번호 확인</button>
			</div>
		</div>
		<div class="join_in_box">
			<div class="input_title">
				<label>주소<span class="star_css">*</span></label>
			</div>
			<div class="input_val">
				<input type="text" class="join_input" id="m_addr" name="m_addr" value="" placeholder="주소를 입력해주세요" onfocus="this.placeholder='';">
			</div>
			<div class="input_btn"></div>
		</div>
		<div class="join_in_box">
			<div class="input_title">
				<label>이메일<span class="star_css">*</span></label>
			</div>
			<div class="input_val">
				<input type="text" class="join_input" id="m_email" name="m_email" placeholder="예시: wishjam@jam.com" onfocus="this.placeholder='';">
			</div>
			<div class="input_btn">
				<button type="button" class="join_check" id="email_check" onclick="check_email();">중복확인</button>
			</div>
		</div>
		<div class="join_in_box">
			<div class="input_title">
				<label>성별</label>
			</div>
			<div class="input_val">
			  <div class="gender_css">
				<input type="radio" class="join_gender" id="m_gender" name="m_gender" value="남성">남성
				<input type="radio" class="join_gender" id="m_gender" name="m_gender" value="여성">여성
			  </div>
			</div>
			<div class="input_btn"></div>
		</div>
		<div class="join_in_box">
			<div class="input_title">
				<label>생년월일</label>
			</div>
			<div class="input_val">
				<input type="text" class="join_input" id="m_brd" name="m_brd" value="" placeholder="예시: YYYY/MM/DD" onfocus="this.placeholder='';">
			</div>
			<div class="input_btn"></div>
		</div>
		<hr style="border: 1px solid #d3d3d3;width:850px;margin-left: 10px;">
		<div class="join_in_box">
			<div class="input_title">
				<label>이용약관동의<span class="star_css">*</span></label>
			</div>
			<!-- 수정부분 -->
			<div class="checkbox_group">
				<div class="checkbox_top_line" style="color: blue;">
			        <input type="checkbox" id="check_all" class="checkbox" onclick="noti_check();">
			        <label for="check_all">전체 동의</label>
			    </div>
			    <div class="checkbox_line">
			        <input type="checkbox" id="check_1" class="checkbox" onclick="noti_indicheck();">
			        <label for="check_1">만 14세 이상입니다 (필수)</label>
			    </div>
			    <div class="checkbox_line">
			        <input type="checkbox" id="check_2" class="checkbox" onclick="noti_indicheck();">
			        <label for="check_2">이용약관 동의 (필수)</label>
			    </div>
			    <div class="checkbox_line">
			        <input type="checkbox" id="check_3" class="checkbox" onclick="noti_indicheck();">
			        <label for="check_3">개인정보 수집·이용 동의 (필수)</label>
			    </div>
		    </div>
		    <!--  -->
		</div>
		<div style="margin:40px 275px 0px 275px;">
			<button type="button" class="j_success" id="join_confirm">가입하기</button>
		</div>
		</form>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
<script>
	// 아이디 정규식
	function isId(ivalue) {
		var regExp = /^[a-z][a-z0-9]{3,13}$/;
		
		return regExp.test(ivalue);
	}
	
	// 비밀번호 정규식
	function isPwd(pvalue) {
		var regExp = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/;
		
		return regExp.test(pvalue);
	}
	
	// 전화번호 정규식
	function isPhoneNumber(pnValue) {
		var cleanPhoneNumber = pnValue.replace(/-/g, '');
		var regExp = /^01(?:0|1|[6-9])(?:\d{7}|\d{8})$/;
	 
		return regExp.test(cleanPhoneNumber);
	}
	
	// 이메일 정규식
	function isEmail(eValue) {
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
		return regExp.test(eValue);
	}
</script>
<script>
	document.getElementById("join_confirm").addEventListener('click', () => {
		var id = document.getElementById("m_id").value;
		var pwd = document.getElementById("m_pwd").value;
		var ckpwd = document.getElementById("m_ckpwd").value;
		var name = document.getElementById("m_name").value;
		var tel = document.getElementById("m_tel").value;
		var addr = document.getElementById("m_addr").value;
		var email = document.getElementById("m_email").value;
		var allck = document.getElementById("check_all");
		var m_telck = document.getElementById("m_telck");

		if(id == "" || pwd == "" || name == "" || tel == "" || addr == "" || email == ""){
			window.alert("필수 입력사항을 모두 기입해주세요.");
		} else if(!isId(id)){
			window.alert("아이디 형식을 주의해서 입력해주세요.");
		} else if(pwd != ckpwd){
			window.alert("비밀번호가 일치하지 않습니다.");
		} else if(!isPwd(pwd)){
			window.alert("비밀번호 형식을 주의해서 입력해주세요.");
		} else if(!isPhoneNumber(tel)){
			window.alert("휴대폰 번호를 정확히 입력해주세요.");
		} else if(m_telck.disabled == false){
			window.alert("휴대폰 인증을 해주세요.");
		} else if(!isEmail(email)){
			window.alert("이메일 주소를 정확히 입력해주세요.");
		} else if(!allck.checked){
			window.alert("이용약관에 동의해주세요.");
		} else {
			/**이부분 수정: 아이디 & 이메일 중복체크 알람창 안뜨게하기*/
			// ID와 이메일 체크를 수행하고 폼 제출 결정
	        Promise.allSettled([check_id(), check_email()])
            .then(results => {
                let idError = false;
                let emailError = false;

                // 결과를 체크하고 각 상태에 따라 오류를 설정
                results.forEach((result, index) => {
                    if (result.status === 'rejected') {
                        if (index === 0) {
                            idError = true; // ID 체크가 실패한 경우
                        } else if (index === 1) {
                            emailError = true; // 이메일 체크가 실패한 경우
                        }
                    } else {
                        if (index === 0) {
                            idError = false; 
                        } else if (index === 1) {
                            emailError = false; 
                        }
                    }
                });

                if (idError && emailError) {
                    // ID와 이메일 체크 모두 실패한 경우
                    window.alert("아이디와 이메일 중복확인을 해주세요.");
                } else if (idError) {
                    // ID 체크 실패한 경우
                    window.alert("아이디 중복확인을 해주세요.");
                } else if (emailError) {
                    // 이메일 체크 실패한 경우
                    window.alert("이메일 중복확인을 해주세요.");
                } else {
                    // 두 체크 모두 성공적일 경우
                    document.getElementById("m_ckpwd").remove(); // 비밀번호 확인 요소 제거
                    document.getElementById("join_form").submit(); // 폼 제출
                }
               ////////////////////////////////
            }).catch(error => {
	            // 체크가 실패할 경우
	            console.error('Check failed:', error);
	        });
	    }
	});
</script>
<script>
	// 휴대전화 하이픈 자동생성
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
	var inputid = document.getElementById("m_id");
	var inputpwd = document.getElementById("m_pwd");
	var altid = document.getElementById("alt_id");
	var altpwd = document.getElementById("alt_pwd");
	
	// 아이디 유효성 검사
	inputid.addEventListener('keyup', ()=>{
		if(inputid.value.trim() != "" && !isId(inputid.value)) {
			altid.innerText = "4~20자의 영문/숫자 조합으로 입력해주세요.";
			altid.classList.add("error-text"); 
	        altid.classList.remove("info-text"); 
		}else if(isId(inputid.value)) {
			altid.innerText = "올바른 아이디 형식입니다.";
			altid.classList.add("info-text"); 
	        altid.classList.remove("error-text"); 
		}else {
			altid.innerText = " ";
			altid.classList.add("info-text"); 
	        altid.classList.remove("error-text"); 
		}
	});	
	
	// 비밀번호 유효성 검사
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
<script>
	// 전체동의 확인 후 개별동의
	function noti_check() {
		var allck = document.getElementById("check_all");
		var ck1 = document.getElementById("check_1");
		var ck2 = document.getElementById("check_2");
		var ck3 = document.getElementById("check_3");
		
		ck1.checked = allck.checked;
        ck2.checked = allck.checked;
        ck3.checked = allck.checked;
	}
	
	// 개별상태 확인 후 전체동의
	function noti_indicheck() {
        var allck = document.getElementById("check_all");
        var ck1 = document.getElementById("check_1");
        var ck2 = document.getElementById("check_2");
        var ck3 = document.getElementById("check_3");

        allck.checked = ck1.checked && ck2.checked && ck3.checked;
    }
</script>
