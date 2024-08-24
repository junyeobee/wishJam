<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.pay.wishJam.PayDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<jsp:useBean id="pdao" class="com.pay.wishJam.PayDAO"></jsp:useBean>
<%
	String[] products = request.getParameterValues("product");
%>
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
	   width: 300px;
	   min-height: 942px;
     }
     
     .cost_title{
      position: sticky;
      top: 160px;
      z-index: 1;
    }
    
     .cost_box{
       padding: 19px 18px 18px 20px;
       border: 1px solid #f2f2f2;
       background-color: #fff0f5;
     }
     
     .cost_detail{
      display: flex;
      -webkit-box-pack: justify;
      justify-content: space-between;
      padding-top: 5px;
      padding-bottom: 20px;
    }
    
    .cost_name{
      width: 100px;
      font-size: 16px;
      line-height: 24px;
      white-space: nowrap;
    }
    
    .cost_money{
      font-size: 18px;
      line-height: 24px;
      text-align: right;
    }
    
    .cost_alt{
      padding-left: 2px;
      font-size: 16px;
      font-weight: normal;
      vertical-align: bottom;
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
       font-size: 17px;
       font-family: 'Pretendard-Regular';
     }
     
     .product_count{
       width: 100px;
       font-size: 17px;
       line-height: 22px;
       text-align: center;
       font-family: 'Pretendard-Regular';
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
  	 
  	 .shipin {
  	   color: #4d4d4d;
  	   padding-left: 10px;
  	   font-size: 15px;
       font-family: 'Pretendard-Regular';
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
	<form class="pay_form" id="pay_form" name="pay_form" action="/wishJam/" method="get">
	<h2>상품주문</h2>
	<div class="pay_box">
		<%
			List<PayDTO> plist;
			DecimalFormat formatter = new DecimalFormat("#,###");
			int origin_sum = 0;
	  		int sale_sum = 0;
	  		int ship_sum = 0;
	  		int gross_value = 0;
	  		String m_name = null;
	  		String m_tel = null;
	  		String m_email = null;
	  		String m_addr = null;
		%>
		<div class="pay_leftbox">
			<div class="pay_info">
				<h3>주문상품</h3>
				<hr style="border:1px solid; color:#a9a9a9;">
				<!-- 이부분 반복 -->
				<% 
				    if (products != null) {
				        for (String product : products) {
				            plist = pdao.payList(product);
				            if(plist != null && !plist.isEmpty()){
								   for (int i = 0; i < plist.size(); i++) {	   
									   m_name = plist.get(i).getM_name();
									   m_tel = plist.get(i).getM_tel();
									   m_email = plist.get(i).getM_email();
									   m_addr = plist.get(i).getM_addr();
									   origin_sum += (plist.get(i).getSg_price() * plist.get(i).getCt_count());
										if(plist.get(i).getSg_discnt() == 1){
											sale_sum += (plist.get(i).getSg_price() * plist.get(i).getS_discnt() * plist.get(i).getCt_count());
										}
				%>
				<div class="pay_product">
					<img src="<%=plist.get(i).getSg_img() %>" class="product_img">
					<span class="product_name"><%=plist.get(i).getSg_name() %></span>
					<span class="product_count"><%=plist.get(i).getCt_count() %> 개</span>
					<% 
						if(plist.get(i).getSg_discnt() == 1){
					%>
					<span class="product_cost"><%=formatter.format(plist.get(i).getSg_price()-(plist.get(i).getSg_price()*plist.get(i).getS_discnt())) %>원
					<%
						} else {
					%>
					<span class="product_cost"><%=formatter.format(plist.get(i).getSg_price()) %>원
					<%
						}
					%>
						<% 
							if(plist.get(i).getSg_discnt() == 1){
						%>
						<!-- 할인가격 없으면 생성x -->
						<span class="product_bcost"><%=formatter.format(plist.get(i).getSg_price()) %>원</span>
						<%
							}
						%>
					</span>
				</div>
				<%
								   }
								   ship_sum = (origin_sum-sale_sum)>=80000?0:3000;
								   gross_value = origin_sum - sale_sum + ship_sum;
				            } else{
				            	ship_sum = (origin_sum-sale_sum)>=80000?0:3000;
				            }
				        }
				    } else {
				        out.println("<p>error.</p>");
				    }
				%>
				<div class="pay_costdetail">
					<div>총 주문 금액
						<span><%= formatter.format(gross_value) %>원</span>
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
							<div class="user_info"><%= m_name %></div>
						</div>
					</div>
					<div class="user_box">
						<span class="u_title">휴대폰</span>
						<div class="lbox">
							<div class="user_info"><%= m_tel %></div>
						</div>
					</div>
					<div class="user_box">
						<span class="u_title">이메일</span>
						<div class="lbox">
							<div class="user_info"><%= m_email %></div>
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
							<div class="user_info" id="p_addr" ><%= m_addr %></div>
							<div style="padding-bottom: 25px;"></div>
							<button class="user_btn" onclick="upd_addr();">수정</button>
						</div>
					</div>
					<div class="user_box" style="padding-top: 25px;">
						<span class="u_title">배송 요청사항</span>
						<div class="lbox">
							<div class="user_info">
								<select class="shipin" id="shipinfo" style="width: 308px; height: 30px; border-radius: 3px; border: 2px solid #c0c0c0;">
									<option value="0"></option>							
									<option value="1">직접 입력하기</option>							
									<option value="2">문 앞에 놓아주세요</option>
									<option value="3">부재시 연락 부탁드려요</option>
									<option value="4">배송 전 미리 연락해주세요</option>
								</select>
							</div>
							<div style="padding-top: 10px">
								<input type="hidden" class="shipin" id="shipinfo_ins" style="width: 400px; height: 25px; border-radius: 3px; border: 2px solid #c0c0c0;">
							</div>
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
					<p><input type="checkbox" id="notick_1" name="noti_check"> 개인정보 수집∙이용 및 처리 동의</p>
					<p><input type="checkbox" id="notick_2" name="noti_check"> 환불규정</p>
				</div>
			</div>
		</div>
		<div class="pay_rightbox">
			<div class="cost_title">
				<div class="cost_box">
					<div class="cost_detail">
						<span class="cost_name">상품금액</span>
						<span class="cost_money"><%= formatter.format(origin_sum) %>
						  	<span class="cost_alt">원</span>
						</span>
					</div>
					<div class="cost_detail">
						<span class="cost_name">상품할인금액</span>
						<span class="cost_money">- <%= formatter.format(sale_sum) %>
						  	<span class="cost_alt">원</span>
						</span>
					</div>
					<div class="cost_detail">
						<span class="cost_name">배송비</span>
						<span class="cost_money">+ <%= formatter.format(ship_sum) %>
						  	<span class="cost_alt">원</span>
						</span>
					</div>
					<hr>
				    <div class="cost_detail">
				    	<span class="cost_name">결제예정금액</span>
				    	<span class="cost_money"><%= formatter.format(gross_value) %>
				    		<span class="cost_alt">원</span>
				    	</span>
				    </div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top:50px;">
		<button class="pay_btn" id="paybtn">결제하기</button>
	</div>
	</form>
</div>
<%@ include file="../footer.jsp" %>
</body>
</html>
<script>
	function upd_addr() {
		window.open('addrUpd.jsp','addrUpd','width=500,height=250,top=300,left=500');
		event.preventDefault();
	}	
</script>
<script>

	document.getElementById('shipinfo').addEventListener('change', function() {
	    var selectedValue = this.value;
	    if (selectedValue === '1') {	
	    	document.getElementById('shipinfo_ins').value = "";
	    	document.getElementById('shipinfo_ins').type = 'text';
	    } else{
	    	document.getElementById('shipinfo_ins').type = 'hidden';
	    	document.getElementById('shipinfo_ins').value = document.getElementById('shipinfo').options[selectedValue].text;
	    }
	});

	document.getElementById("paybtn").addEventListener('click', (event) => {
		var notick_1 = document.getElementById("notick_1");
		var notick_2 = document.getElementById("notick_2");
        var paybtns = document.getElementsByName("pay_code");
        var isSelected = false;

        for (var i = 0; i < paybtns.length; i++) {
            if (paybtns[i].checked) {
                isSelected = true;
                break;
            }
        }
        
		if(!isSelected) {
			window.alert("결제방법을 선택해주세요.");
			event.preventDefault();
		} else if(!notick_1.checked || !notick_2.checked){
			window.alert("개인정보 및 결제규정에 동의해주세요.");
			event.preventDefault();
		} else {
			window.alert("구매가 완료되었습니다.");
			document.getElementById("pay_form").submit();
		}
		
	});
</script>
<script>
// 스크롤 위치저장
window.addEventListener('scroll', () => {
    localStorage.setItem('scrollPosition', window.scrollY);
});

// 페이지 로드시 스크롤 위치 복원
window.addEventListener('load', () => {
    const scrollPosition = localStorage.getItem('scrollPosition');
    if (scrollPosition) {
        window.scrollTo(0, parseInt(scrollPosition, 10));
        localStorage.removeItem('scrollPosition');
    }
});
</script>