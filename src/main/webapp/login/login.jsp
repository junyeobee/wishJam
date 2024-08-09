<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<meta charset="UTF-8">
<title>위시잼 - 로그인</title>
<style>
	.login_wrap {
      width: 600px;
      padding: 70px 0;
      margin: 0 auto;
    }
    
    .login_box {
      background: #fff0f5;
      width: 600px;
      border: 2px solid #fff0f5;
      border-radius: 10px;
      text-align: center;
      padding-top: 45px;
      font-family: 'Cafe24Ohsquareair';
    }
    
    .input_txt {
      color: #808080;
      background: #fff;
      border: 1px solid #ccc;
      font-size: 18px;
      font-weight: 600;
      height: 50px;
      width: 320px;
      padding: 0 20px;
      border-radius: 10px;
      -webkit-appearance: none;
    }
    
    .l_check{
      width: 360px;
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
    
    /* 버튼 스타일(흰색바탕 + 다홍색테두리) */
    .l_join{
      width: 360px;
      height: 55px;
      border: 1px solid #ff4900;
      border-radius: 10px;
      background: #fff;
      color: #ff4900;
      font-size: 18px;
      font-weight: 400;
      -webkit-appearance: none;
      cursor: pointer;
      font-family: 'Cafe24Ohsquareair';
    }
    
    .l_saveid{
    	text-align: left;
    	font-family: 'Cafe24Ohsquareair';
    }
    
    .login_noti {
      color: #777;
      font-size: 15px;
      letter-spacing: -0.5px;
      line-height: 180%;
      margin-top: 30px;
      padding-bottom: 40px;
      font-family: 'Cafe24Ohsquareair';
    }
    
    a {
      text-decoration: none;
      font-family: 'Cafe24Ohsquareair';
    }
    
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="login_wrap">
	<div class="login_box">
		<h2 style="color:#ff4900;">L O G I N</h2>
		<form class="login_form" action=login_ok.jsp">
		<div style="margin-top:50px;">
			<input type="text" class="input_txt" name="user_id" value="" placeholder="아이디를 입력해주세요" onfocus="this.placeholder='';">
		</div>
		<div style="margin-top:10px;">
			<input type="password" class="input_txt" name="user_pwd" value="" placeholder="비밀번호를 입력해주세요" onfocus="this.placeholder='';">
		</div>
		<div style="margin-top:10px;margin-right:130px;text-align:right;">
			<input type="checkbox" class="l_saveid" value="on"><span style="color: #696969;">로그인 상태 유지</span>
		</div>
		<div style="margin-top:25px;">
			<input type="submit" class="l_check" value="로그인">
		</div>
		</form>
		<div style="margin-top:10px;">
			<a href="member.jsp"><input type="button" class="l_join" value="회원가입"></a>
		</div>
		<div style="text-align:center; margin-top:15px; font-size:14px; ">
			<a href="find_id.jsp"><span style="color:#696969;">아이디 찾기</span></a>
			<span style="color:#696969; font-size:12px; vertical-align: 2px; margin:0 9px;">|</span>
			<a href="find_pwd.jsp"><span style="color:#696969;">비밀번호 찾기</span></a>
		</div>	
		<!-- 정책 -->
		<div class="login_noti">
			* 회원가입시 다양한 혜택을 누릴 수 있습니다 <br>
			* 하나의 휴대폰 번호로 하나의 계정만 생성할 수 있습니다 
		</div>
	</div>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>