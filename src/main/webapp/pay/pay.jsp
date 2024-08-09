<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<meta charset="UTF-8">
<title>위시잼 - 결제</title>
<style>
	.pay_wrap {
      width: 1200px;
      padding: 20px 0;
      margin: 0 auto;
      text-align: center;
      font-family: 'Cafe24Ohsquareair';
    }
    
     .pay_box {
       display: flex;
       width: 100%;
       padding: 10px 10px;
       justify-content: space-between;
     }
     
     .pay_leftbox{
       width: 850px;
       text-align: left;
       padding-top: 34px;
     }
     
     .pay_rightbox{
       position: relative;
       width: 330px;
     }
     
     .cost_box{
       width: 310px;
       height: 550px;
       margin-top: 60px;
       margin-left: 10px;
       background-color: #fff0f5;
     }
     
     .pay_product{
       display: flex;
       flex-direction: row;
       -webkit-box-align: center;
       align-items: center;
       padding: 25px 0px;
       border-bottom: 1px solid rgb(244, 244, 244);
     }
     
     .pay_costdetail{
       padding-top: 20px;
       padding-right: 15px;
       font-size: 18px;
       font-weight: 600;
       font-family: 'Pretendard-Regular';
     }
     
     .pay_costdetail div{
       color: #ff4900;
       text-align: right;
     }
     
     .pay_costdetail span{
       color: #000000;
       padding-left: 100px;
     }
     
     .product_img{
       width: 85px;
       height: 85px;
     }
     
     .product_name{
       overflow: hidden;
       width: 550px;
       padding: 0px 20px;
     }
     
     .product_count{
       width: 100px;
       font-size: 15px;
       line-height: 22px;
       text-align: center;
     }
     
     .product_cost{
       display: block;
       font-weight: 700;
       font-size: 15px;
       color: rgb(51, 51, 51);
       line-height: 22px;
       word-break: break-all;
     }
     
     .product_bcost{
       display: block;
       font-size: 13px;
       line-height: 24px;
       color: rgb(181, 181, 181);
       word-break: break-all;
       text-decoration: line-through;
       text-align: right;
     }
     
     .pay_user{
       padding: 10px 0px;
     }
     
     .user_box{
       display: flex;
       -webkit-box-pack: justify;
       justify-content: space-between;
       padding: 8px 0px;
     }
     
     .u_title{
       display: inline-block;
       width: 160px;
       margin-right: 30px;
       font-weight: 600;
       font-size: 14px;
       padding-top: 5px;
       color: rgb(51, 51, 51);
     }
     
     .lbox{
       flex: 1 1 0%;
     }
     
     .user_info{
       display: inline-flex;
       -webkit-box-align: center;
       align-items: center;
       line-height: 24px;
       color: rgb(51, 51, 51);
       font-family: 'Pretendard-Regular';
     }
     
     .user_noti{
       font-size: 13px;
       line-height: 21px;
       color: #a9a9a9;
       font-family: 'Pretendard-Regular';
     }
     
     .user_btn{
       width: 45px;
       height: 30px;
       border: 1px solid #ff4900;
       border-radius: 5px;
       background: #fff;
       color: #ff4900;
       font-family: 'Pretendard-Regular';
     }
     
     .section_flex {
       display: flex; 
       justify-content: space-between; 
       background-color: #fff;
  	 }
  	 
     .payment_box input[type="radio"]{
       display:none;
     }
     
     .payment_box {
       text-align: center; 
       width: 25%; 
       cursor: pointer;
     }
     
     .payment_box div {
       padding:10px 0 15px 0;
     }
     
     .payment_box img {
       width: 60px; 
       text-align: center;
     }
     
     .payment_box p {
       text-align: center; 
       font-size: 14px;
       font-family: 'Pretendard-Regular';
     }
     
     .payment_box input[type="radio"]:checked + div{
   	   outline:1px solid #ff4b4b; 
   	   background-color:rgba(255, 75, 75, 0.1);
  	}
  	
  	.payment_noti{
  	   font-size: 13px;
       line-height: 21px;
       color: #808080;
       font-family: 'Pretendard-Regular';
  	}
  	
  	.pay_noti{
  	   padding-top: 10px;
  	   font-size: 14px;
       line-height: 21px;
       font-family: 'Pretendard-Regular';
  	}
  	
  	.pay_btn{
  	   width: 230px;
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
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="pay_wrap">
	<form class="pay_form" action="../mypage/myPage.jsp">
	<h2>상품주문</h2>
	<div class="pay_box">
		<div class="pay_leftbox">
			<div class="pay_info">
				<h3>주문상품</h3>
				<hr style="border:1px solid; color:#a9a9a9;">
				<!-- 이부분 반복 -->
				<div class="pay_product">
					<img src="../img/profile.png" class="product_img">
					<span class="product_name">상품명</span>
					<span class="product_count">1개</span>
					<span class="product_cost">2,000원
						<!-- 할인가격 없으면 생성x -->
						<span class="product_bcost">3,500원</span>
					</span>
				</div>
				<div class="pay_costdetail">
					<div>총 주문 금액
						<span>2,000원</span>
					</div>
				</div>
				<div style="padding-top: 60px;">
					<h3>구매자 정보</h3>
					<hr style="border:1px solid; color:#a9a9a9;">
				</div>
				<div class="pay_user">
					<div class="user_box">
						<span class="u_title">구매자이름</span>
						<div class="lbox">
							<div class="user_info">김수민</div>
						</div>
					</div>
					<div class="user_box">
						<span class="u_title">휴대폰</span>
						<div class="lbox">
							<div class="user_info">010-9377-7893</div>
						</div>
					</div>
					<div class="user_box">
						<span class="u_title">이메일</span>
						<div class="lbox">
							<div class="user_info">ksm7893@naver.com</div>
							<p class="user_noti">정보 변경은 [마이페이지 > 개인정보 수정] 메뉴를 이용해주세요.</p>
						</div>
					</div>
				</div>
				<div style="padding-top: 60px;">
					<h3>배송지 정보</h3>
					<hr style="border:1px solid; color:#a9a9a9;">
				</div>
				<div class="pay_user">
					<div class="user_box" style="border-bottom: 1px solid rgb(244, 244, 244); padding-bottom: 30px;">
						<span class="u_title">배송지</span>
						<div class="lbox">
							<div class="user_info">서울시 송파구 ~~블라블라</div>
							<div style="padding-bottom: 25px;"></div>
							<button class="user_btn">수정</button>
						</div>
					</div>
					<div class="user_box" style="padding-top: 25px;">
						<span class="u_title">배송 요청사항</span>
						<div class="lbox">
							<div class="user_info">
								<input type="text" style="width: 300px; height: 20px; border-radius: 3px; border: 2px solid #c0c0c0;">
							</div>
							<div style="padding-bottom: 25px;"></div>
							<button class="user_btn">입력</button>
						</div>
					</div>
				</div>
				<div style="padding-top: 60px;">
					<h3>결제수단</h3>
					<hr style="border:1px solid; color:#a9a9a9;">
				</div>
				<div class="pay_way">
					<div class="user_box">
						<span class="u_title">결제선택</span>
						<div class="lbox">
							<div class="section_flex" style="border:2px solid #ffe4e1; padding-bottom: 10px; padding-top: 10px;">
								<label class="payment_box">
									<input type="radio" name="pay_code" id="pay_card" value="신용카드" >
							        <div>
							        	<img id="pay_card_img" class="payment_img" src="../img/pay_card_off.png">
							            <p>신용카드</p>
							        </div>
								</label>
								<label class="payment_box">
									<input type="radio" name="pay_code" id="pay_phone" value="휴대폰결제" >
							        <div>
							        	<img id="pay_phone_img" class="payment_img" src="../img/pay_phone_off.png">
							            <p>휴대폰결제</p>
							        </div>
								</label>
								<label class="payment_box">
									<input type="radio" name="pay_code" id="pay_bank" value="무통장입금" >
							        <div>
							        	<img id="pay_bank_img" class="payment_img" src="../img/pay_bank_off.png">
							            <p>무통장입금</p>
							        </div>
								</label>
							</div>
							<div class="payment_noti" style="padding-top: 8px;">
								<p>* 무통장입금시 신청 후 3시간이 지나면 자동 취소됩니다</p>
								<p>* 1원 단위 정확한 금액을 입금시 결제가 완료됩니다</p>
							</div>
						</div>
					</div>
				</div>
				<div style="padding-top: 60px;">
					<h3>개인정보 및 결제동의</h3>
					<hr style="border:1px solid; color:#a9a9a9;">
				</div>
				<div class="pay_noti">
					<p><input type="checkbox" name="noti_check"> 개인정보 수집∙이용 및 처리 동의</p>
					<p><input type="checkbox" name="noti_check"> 환불규정</p>
				</div>
			</div>
		</div>
		<div class="pay_rightbox">
			<div class="cost_box">
				<p>test</p>
			</div>
		</div>
	</div>
	<div style="margin-top:50px;">
		<input type="submit" class="pay_btn" value="결제하기">
	</div>
	</form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>