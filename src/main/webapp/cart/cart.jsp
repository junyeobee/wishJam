<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.cart.wishJam.CartDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<jsp:useBean id="cdao" class="com.cart.wishJam.CartDAO"></jsp:useBean>

<%
	String user_id = (String) session.getAttribute("sid");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<meta charset="UTF-8">
<title>위시잼</title>
<style>
	.cart_wrap {
      width: 1230px;
      padding: 20px 0;
      margin: 0 auto;
      font-family: 'Cafe24Ohsquareair';
    }
    
    .cart_box {
      width: 1230px;
      border-radius: 10px;
      text-align: left;
      padding-top: 45px;
    }
    
    .cart_in_box{
      display: flex;
      width: 100%;
      padding: 10px 10px;
      justify-content: space-between;
    }
    
    .cart_detail {
      width: 900px;
      text-align: left;
      padding-top: 15px; 
    }
    
    .cart_cost {
	  position: relative;
	  width: 300px;
	  min-height: 942px;
    }
    
    .cost_title{
      position: sticky;
      top: 129px;
      z-index: 1;
    }
    
    .cart_dtop{
      font-family: 'Pretendard-Regular';
    }
    
    .detail_box{
      display: flex;
      -webkit-box-align: center;
      align-items: center;
      position: relative;
      padding: 20px 0px;
    }
    
    .detail_btn{
      margin-right: 10px;
    }
    
    .detail_img{
      margin-right: 10px;
    }
    
    .detail_alt{
      display: flex;
      flex-direction: column;
      width: 350px;
      margin-right: 20px;
      font-family: 'Pretendard-Regular';
    }
    
    .detail_count{
      display: inline-flex;
      flex-direction: row;
      -webkit-box-align: center;
      align-items: center;
      border: 1px solid rgb(221, 223, 225);
      width: 88px;
      border-radius: 3px;
      font-family: 'Pretendard-Regular';
    }
    
    .detail_cost{
      display: flex;
      flex-direction: column;
      width: 180px;
      text-align: right;
      word-break: break-all;
    }
    
    .detail_delbtn{
      width: 30px;
      height: 30px;
      margin-left: 30px;
      border: 1px solid #ff4900;
      background: #ff4900;
      color: #fff;
    }
    
    .count_css{
      display: inline-flex;
      width: 28px;
      height: 28px;
      border: none;
      text-align: center;
    }
    
    .detail_info{
      max-height: 54px;
      font-weight: 500;
      font-size: 16px;
      line-height: 22px;
      color: black;
    }
    
    .detail_altinfo{
      max-height: 38px;
      margin-top: 8px;
      font-size: 14px;
      line-height: 19px;
      color: rgb(153, 153, 153);
    }
    
    .detail_altcost{
      max-height: 38px;
      margin-top: 8px;
      font-size: 14px;
      line-height: 19px;
      color: rgb(153, 153, 153);
      text-decoration: line-through;
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
    
    /* 버튼 스타일(원있는거) */
    .cart_pay{
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
    
    .cart_noti{
      padding: 5px 0;
    }
    
    .noti_detail{
      padding-top: 4px;
      color: #666;
      font-size: 13px;
    }
    
    .test{
      padding-top: 20px;
      position: sticky;
    }
    
    .ckdel_btn{
      border: 1px solid #ff4900;
      background: #fff;
      color: #ff4900;
      font-size: 15px;
      font-family: 'Pretendard-Regular';
    }
</style>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="cart_wrap">
	<div class="cart_box">
	<form class="cart_form" action="" method="post">
		<h2>장 바 구 니</h2>
		<div class="cart_in_box">
			<div class="cart_detail">
				<div class="cart_dtop">
					<input type="checkbox" id="check_all" class="deetail_btn" onclick="goods_ck();"><span style="padding-left: 5px;">전체선택 |</span>
					<button class="ckdel_btn" id="ck_del" onclick="goods_ckdel();">선택삭제</button>
				</div>
				<hr>
				<div class="cart_dbottom">
					<div class="cart_detail">
						<ul style="list-style-type: none;">
							<!-- 이부분 반복 -->
							<%
							   List<CartDTO> clist = cdao.cartList(user_id);
							   int count = clist.size();
							   DecimalFormat formatter = new DecimalFormat("#,###");
							   Date today = new Date();
							   if(clist != null && !clist.isEmpty()){
								   for (int i = 0; i < clist.size(); i++) {
									   if((clist.get(i).getS_start().compareTo(today) <= 0 ) && (clist.get(i).getS_end().compareTo(today) >= 0) && clist.get(i).getSg_count() > 0){
							%>
							<li class="detail_box">
								<input type="checkbox" id="check_<%=i+1 %>" class="detail_btn" data-idx="<%=clist.get(i).getCt_idx() %>" checked="checked" onclick="goods_indick();">
								<a href="../goodsDetail/detail.jsp" class="detail_img"><img src="../img/profile.png" style="width: 100px;height: 100px;"></a>
								<div class="detail_alt">
									<a href="../goodsDetail/detail.jsp" class="detail_alt" style="text-decoration: none;">
										<span class="detail_info"><%=clist.get(i).getS_title() %></span>
										<span class="detail_altinfo"><%=clist.get(i).getSg_name() %></span>
									</a>
									<input type="hidden" name="product" value="<%=clist.get(i).getCt_idx()%>">
								</div>
								<div class="detail_count">
									<button class="count_css" data-idx="<%=clist.get(i).getCt_idx() %>" onclick="goods_minus(this);"><img src="../img/minus2.png" style="width: 8px;height: 8px;padding-top: 8px;padding-left: 3px;"></button>
									<div style="width: 35px; text-align: center;"><%=clist.get(i).getCt_count() %></div>
									<input type="hidden" id="p_count<%=clist.get(i).getCt_idx() %>" name="p_count" data-limit="<%=clist.get(i).getSg_limit() %>" value="<%=clist.get(i).getCt_count() %>">
									<button class="count_css" data-idx="<%=clist.get(i).getCt_idx() %>" onclick="goods_plus(this);"><img src="../img/plus.png" style="width: 8px;height: 8px;padding-top: 8px;padding-left: 4px;"></button>
								</div>
								<div class="detail_cost"> 
									<div class="detail_info"><%=formatter.format(clist.get(i).getCt_sale()) %>원</div>
									<input type="hidden" name="p_apay" value="<%=clist.get(i).getCt_sale() %>">
									<!-- 할인가격 없으면 생성x -->
									<% 
										if(clist.get(i).getCt_dispr() != 0){
									%>
									<div class="detail_altcost"><%=formatter.format(clist.get(i).getCt_price()) %>원</div>
									<input type="hidden" name="p_bpay" value="<%=clist.get(i).getCt_price() %>">
									<%
										}
									%>
								</div>
								<button class="detail_delbtn" id="detail_del<%=i+1 %>" data-idx="<%=clist.get(i).getCt_idx() %>" onclick="goods_del(this);">x</button>
							</li>
							<%
									   }
								   }
							   } else{
								   
							%>
							<li style="text-align: center;font-size: 20px;font-family: 'Pretendard-Regular';">장바구니가 비었습니다.</li>
							<%
							   }
							%>
						</ul>
					</div>
				</div>
				<!-- 품절상품 -->
				<% 
					int show = 0;
						if(clist != null && !clist.isEmpty()){
							for (int i = 0; i < clist.size(); i++) {
								if(!(clist.get(i).getS_start().compareTo(today) <= 0 && clist.get(i).getS_end().compareTo(today) >= 0)) show = 1;
							}
						}
						
				    if(show == 1) {
				%>
				<div class="cart_dbottom" style="padding-top: 100px;">
				<h4 style="color: #666;">품절 및 판매종료</h4>
				<hr>
					<div class="cart_detail">
						<ul style="list-style-type: none;">
							<!-- 이부분 반복 -->
							<%
								if(clist != null && !clist.isEmpty()){
									for (int i = 0; i < clist.size(); i++) {
										if(!(clist.get(i).getS_start().compareTo(today) <= 0 && clist.get(i).getS_end().compareTo(today) >= 0) || clist.get(i).getSg_count() <= 0){
							%>
							<li class="detail_box">
								<input type="checkbox" id="check_<%=i+1 %>" class="detail_btn" data-idx="<%=clist.get(i).getCt_idx() %>" onclick="goods_indick();">
								<a href="../goodsDetail/detail.jsp" class="detail_img"><img src="../img/profile.png" style="width: 100px;height: 100px;"></a>
								<div class="detail_alt">
									<a href="../goodsDetail/detail.jsp" class="detail_alt" style="text-decoration: none;">
										<span class="detail_info"><%=clist.get(i).getS_title() %></span>
										<span class="detail_altinfo"><%=clist.get(i).getSg_name() %></span>
									</a>
									<input type="hidden" name="product" value="<%=clist.get(i).getCt_idx()%>">
								</div>
								<div class="detail_count">
									<button class="count_css" disabled><img src="../img/minus.png" style="width: 10px;height: 10px;padding-top: 8px;padding-left: 3px;"></button>
									<div style="width: 35px; text-align: center; color: rgb(153, 153, 153);"><%=clist.get(i).getCt_count() %></div>
									<input type="hidden" name="p_count" value="<%=clist.get(i).getCt_count() %>">
									<button class="count_css" disabled><img src="../img/add.png" style="width: 8px;height: 8px;padding-top: 8px;padding-left: 4px;"></button>
								</div>
								<div class="detail_cost"> 
									<div class="detail_info"><%=formatter.format(clist.get(i).getCt_sale()) %>원</div>
									<input type="hidden" name="p_apay" value="<%=clist.get(i).getCt_sale() %>">
									<!-- 할인가격 없으면 생성x -->
									<% 
										if(clist.get(i).getCt_dispr() != 0){
									%>
									<div class="detail_altcost"><%=formatter.format(clist.get(i).getCt_price()) %>원</div>
									<input type="hidden" name="p_bpay" value="<%=clist.get(i).getCt_price() %>">
									<%
										}
									%>
								</div>
								<button class="detail_delbtn" id="detail_del<%=i+1 %>" data-idx="<%=clist.get(i).getCt_idx() %>" onclick="goods_del(this);">x</button>
							</li>
							<%
										}
									}
								}
							%>
						</ul>
					</div>
				</div>
				<%
				    }
				%>
			</div>
			<div class="cart_cost">
				<div class="cost_title">
					<div class="cost_box">
						<div class="cost_detail">
					  		<span class="cost_name">상품금액</span>
					  		<% 
					  		   int origin_sum = 0;
					  		   int sale_sum = 0;
					  		   int ship_sum = 0;
					  		   int gross_value = 0;
								if(clist != null && !clist.isEmpty()){
									for (int i = 0; i < clist.size(); i++) {
										if((clist.get(i).getS_start().compareTo(today) <= 0 ) && (clist.get(i).getS_end().compareTo(today) >= 0) && clist.get(i).getSg_count() > 0){
											origin_sum += (clist.get(i).getCt_price() * clist.get(i).getCt_count());
											sale_sum += (clist.get(i).getCt_dispr() * clist.get(i).getCt_count());
										}
									} 
									ship_sum = (origin_sum-sale_sum)>=80000?0:3000;
									gross_value = origin_sum - sale_sum + ship_sum;
								} else{
									ship_sum = (origin_sum-sale_sum)>=80000?0:3000;
								}
							%>
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
					  		<input type="hidden" name="p_ship" value="ship_sum">
					  			<span class="cost_alt">원</span>
					  		</span>
					  	</div>
					  	<hr>
					  	<div class="cost_detail">
					  		<span class="cost_name">결제예정금액</span>
					  		<span class="cost_money"><%= formatter.format(gross_value) %>
					  		<input type="hidden" name="p_fpay" value="gross_value">
					  			<span class="cost_alt">원</span>
					  		</span>
					  	</div>
					</div>
					<div style="margin-top:25px;">
						<input type="button" class="cart_pay" value="결제하기">
						<ul class="cart_noti">
							<li class="noti_detail">[주문완료]상태일 경우만 주문 취소가 가능합니다.</li>
							<li class="noti_detail">[마이페이지 > 구매내역 상세페이지]에서 취소하실 수 있습니다.</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</form>	
	</div>
</div>	
<%@ include file="../footer.jsp" %>
</body>
</html>
<script>
	function goods_ck() {
		var allck = document.getElementById("check_all");
		
		for (var i = 0; i < <%=count%>; i++) {
			var ck = document.getElementById("check_"+(i+1));
			ck.checked = allck.checked;
		}
	}
	
	function goods_indick() {
		var allck = document.getElementById("check_all");
		
		var allChecked = true;
		
		for (var i = 0; i < <%=count%>; i++) {
			var ck = document.getElementById("check_"+(i+1));
			
			if (!ck.checked) {
                allChecked = false; // 하나라도 체크되지 않으면 전체 체크가 아니라고 판단
                break;
            }
		}
		
		allck.checked = allChecked;
	}
</script>
<script>
	function goods_ckdel() {
		var selectedIds = [];
		
		// 선택된 체크박스의 ID를 수집
        for (var i = 1; i <= <%= count %>; i++) {
            var ck = document.getElementById("check_" + i);
            if (ck && ck.checked) {
            	var idx = ck.getAttribute("data-idx"); // 데이터 속성에서 ct_idx를 가져옴
                selectedIds.push(idx);
            }
        }
		
        if (selectedIds.length === 0) {
            alert("선택된 항목이 없습니다.");
            return;
        }
        
	     // AJAX 요청을 통해 서버로 삭제 요청 전송
	        var xhr = new XMLHttpRequest();
	        xhr.open("POST", "cartDel_ok.jsp", true);
	        xhr.setRequestHeader("Content-Type", "application/json");
	        xhr.onload = function() {
	            if (xhr.status === 200) {
	                // 성공적으로 삭제가 완료된 경우 페이지 새로고침 등 추가 작업
	                alert("선택된 항목이 삭제되었습니다.");
	                location.reload(); // 페이지 새로고침
	            } else {
	                alert("삭제 중 오류가 발생했습니다.");
	            }
	        };
	        xhr.send(JSON.stringify({ ctidx: selectedIds })); // 선택된 ID를 JSON 객체로 서버에 전송
	}
	
	function goods_del(button) {
		var ct_idx = button.getAttribute("data-idx");
		
		// AJAX 요청을 통해 서버로 삭제 요청 전송
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "cdtailDel_ok.jsp", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onload = function() {
            if (xhr.status === 200) {
                // 성공적으로 삭제가 완료된 경우 페이지 새로고침 등 추가 작업
                location.reload(); // 페이지 새로고침
            } else {
                alert("삭제 중 오류가 발생했습니다.");
            }
        };
        xhr.send(JSON.stringify({ "ctidx": ct_idx })); // 선택된 ID를 JSON 문자열로 서버에 전송
    
	}
	
	function goods_plus(pbutton) {
		var ct_idxplus = pbutton.getAttribute("data-idx");
		var limit = document.getElementById("p_count"+ct_idxplus).getAttribute("data-limit");
		var p_count = document.getElementById("p_count"+ct_idxplus).value;
		
		if(p_count < limit){
		var xhr = new XMLHttpRequest();
        xhr.open("POST", "countplus.jsp", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onload = function() {
            if (xhr.status === 200) {
                // 성공적으로 삭제가 완료된 경우 페이지 새로고침 등 추가 작업
                location.reload(); // 페이지 새로고침
            } else {
                alert("오류가 발생했습니다.");
            }
        };
        xhr.send(JSON.stringify({ "ct_idxplus": ct_idxplus })); // 선택된 ID를 JSON 문자열로 서버에 전송
		} else{
			alert("1인 구매개수를 초과하였습니다.");
		}
	}
	
	function goods_minus(mbutton) {
		var ct_idxminus = mbutton.getAttribute("data-idx");
		var p_count = document.getElementById("p_count"+ct_idxminus).value;
		
		if(p_count > 1){
		var xhr = new XMLHttpRequest();
        xhr.open("POST", "countminus.jsp", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onload = function() {
            if (xhr.status === 200) {
                // 성공적으로 삭제가 완료된 경우 페이지 새로고침 등 추가 작업
                location.reload(); // 페이지 새로고침
            } else {
                alert("오류가 발생했습니다.");
            }
        };
        xhr.send(JSON.stringify({ "ct_idxminus": ct_idxminus })); // 선택된 ID를 JSON 문자열로 서버에 전송
		} else if( p_count <= 1 ){
			alert("상품을 원하지 않는다면 장바구니에서 삭제해주세요.");
		}
	}
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