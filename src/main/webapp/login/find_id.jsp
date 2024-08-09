<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<meta charset="UTF-8">
<title>위시잼 - 아이디찾기</title>
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
    
    .find_title{
      width: 12%;
      padding-top: 12px;
      text-align: left;
    }
    
    .find_val{
      width: 70%;
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
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="find_wrap">
	<div class="find_box">
		<h2 style="color:#ff4900;">아이디 찾기</h2>
		<div class="find_in_box">
			<div class="find_title">
				<label>이름</label>
			</div>
			<div class="find_val">
				<input type="text" class="find_input" name="user_name" value="이름을 입력해주세요" onfocus="this.value='';">
			</div>
		</div>
		<div class="find_in_box">
			<div class="find_title">
				<label>휴대폰</label>
			</div>
			<div class="find_val">
				<input type="text" class="find_input" name="user_tel" value="번호를 입력해주세요" onfocus="this.value='';">
			</div>
		</div>
		<div style="margin:20px 100px 0px 100px;">
			<input type="button" class="find_send" value="인증번호 받기">
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>