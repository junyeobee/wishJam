<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<meta charset="UTF-8">
<title>위시잼 - 비밀번호찾기</title>
<style>
	.find_wrap {
      width: 500px;
      padding: 20px 0;
      margin: 0 auto;
      font-family: 'Cafe24Ohsquareair';
    }
    
    .find_box {
      width: 500px;
      border-radius: 10px;
      text-align: center;
      padding-top: 45px;
    }
    
    .find_in_box{
      display: inline-flex;
      width: 100%;
      padding: 10px 10px;
    }
    
    .find_ck_box{
      display: none;
      width: 100%;
      padding: 10px 10px;
    }
    
    .find_title{
      width: 12%;
      padding-top: 12px;
      text-align: left;
    }
    
    .find_val{
      width: 70%;
      height: 46px;
      border-radius: 4px;
    }
    
    .find_ckbtn{
      width: 18%;
      height: 46px;
      border-radius: 4px;
      padding: 0px 0px 1px 10px;
    }
    
    .find_input{
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
    
    .find_send{
      width: 160px;
      height: 50px;
      border: 2px solid #ff4900;
      border-radius: 10px;
      background: #fff;
      color: #ff4900;
      font-size: 18px;
      font-weight: 400;
      -webkit-appearance: none;
      cursor: pointer;
      font-family: 'Cafe24Ohsquareair';
    }
    
    .find_ck{
      width: 130px;
      height: 46px;
      border: 2px solid #ff4900;
      border-radius: 10px;
      background: #ff4900;
      color: #fff;
      font-size: 16px;
      font-weight: 400;
      -webkit-appearance: none;
      cursor: pointer;
      font-family: 'Cafe24Ohsquareair';
    }
</style>
<script>
let randomNumber;

   function find_ck() {
      randomNumber = Math.floor(Math.random() * 9000) + 1000;
      var user_id = document.getElementById("user_id");
      var user_tel = document.getElementById("user_tel");
      
      if(user_id.value != "" && user_tel.value != ""){
         alert(randomNumber);
         document.getElementById("ck_box").style.display = 'inline-flex';
      } else{
         alert("아이디 및 휴대폰번호를 입력해주세요.");
      }
   }
   
   function find_inv() {
      var find_pwdck = document.getElementById("find_pwdck");
      var find_invi = document.getElementById("find_invi");
      var user_telck = document.getElementById("user_telck");
      
      if(randomNumber == user_telck.value){
         alert("인증이 완료되었습니다.");
         find_pwdck.disabled = true;
         find_invi.disabled = true;
         user_telck.disabled = true;
         user_telck.remove();
         document.getElementById("fpwd_form").submit();
      } else{
         alert("인증에 실패하였습니다.")
      }
   }
</script>
</head>
<body>
<%@ include file="../header.jsp"%>
<div class="find_wrap">
	<div class="find_box">
		<h2 style="color:#ff4900;">비밀번호 찾기</h2>
		<form class="fpwd_form" id="fpwd_form" method="post" action="pwdFind_ok.jsp">
		<div class="find_in_box">
			<div class="find_title">
				<label>아이디</label>
			</div>
			<div class="find_val">
				<input type="text" class="find_input" id="user_id" name="user_id" placeholder="아이디를 입력해주세요" onfocus="this.placeholder='';">
			</div>
		</div>
		<div class="find_in_box">
			<div class="find_title">
				<label>휴대폰</label>
			</div>
			<div class="find_val">
				<input type="text" class="find_input" id="user_tel" name="user_tel" maxlength="13" placeholder="번호를 입력해주세요" onfocus="this.placeholder='';" onkeyup="autoHyphen(value)">
			</div>
		</div>
		<div class="find_ck_box" id="ck_box">
         <div class="find_title"></div>
         <div class="find_val">
            <input type="text" class="find_input" id="user_telck" name="user_telck" maxlength="4" placeholder="인증번호를 입력해주세요" onfocus="this.placeholder='';">
         </div>
         <div class="find_ckbtn">
         <button type="button" class="find_ck" id="find_invi" onclick="find_inv();">인증번호 확인</button>
         </div>
      	</div>	
		<div style="margin:20px 100px 0px 100px;">
			<button type="button" class="find_send" id="find_pwdck" onclick="find_ck();">인증번호 받기</button>
		</div>
		</form>
	</div>
</div>
<%@ include file="../footer.jsp" %>
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
       const PHONE_INPUT_BOX = document.querySelector('#user_tel');
       PHONE_INPUT_BOX.value = PHONE_NUMBER_WITH_HYPHEN;
       PHONE_INPUT_BOX.setAttribute('value', PHONE_NUMBER_WITH_HYPHEN);
     };
</script>