<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wishJam.detail.DetailDTO"%>
<jsp:useBean id="ddao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>
<%
String sellidx_s = request.getParameter("s_idx");
Object m_idx_s = session.getAttribute("m_idx");

int m_idx=0;
if(m_idx_s!=null){
	m_idx=(Integer)m_idx_s;
}

int sellidx = 0;
if (sellidx_s != null) {
	sellidx = Integer.parseInt(sellidx_s);
}
DetailDTO ddto = ddao.viewSellDetail(sellidx);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.boximg {
	width: 100px;
	height: 100px;
	object-fit: cover;
}

.fbox {
	display: flex;
}

.lfloat {
	float: left;
}

.rfloat {
	float: right;
}

.fclear {
	clear: both;
}

ul {
	padding: 0;
	margin: 0px auto;
	list-style: none;
}

.reportpart {
	width: 100%;
	height: 50px;
	position: fixed;
	bottom: 0;
}

.ckbox div {
	display: inline-block;
	cursor: cursor;
}
</style>
<script>
	function checkLb(t) {
		var radiobtn = document.getElementsByName("reason");
		var rp_r = document.reportfm.rp_reason;
		var thisbtn = t.previousElementSibling;
		if(thisbtn.checked==false){
			thisbtn.checked=true;
			rp_r.value=t.innerText;
		}
		
		if(thisbtn.value=="5"){
			thisbtn.disabled=="abled";
		}
	}
	
	function checkVl(){
		var rp_r = document.reportfm.rp_reason;
		rp_r.value=document.getElementById("ta").value;
	}
</script>
</head>
<body>
	<section>
		<h2>신고하기</h2>
		<article>
			신고 게시글
			<div>
				<img src="../img/img1.jpg" class="boximg lfloat">
				<div>
					제목:<%=ddto.getS_title()%>
					<br> 판매자:<%=ddto.getM_nick()%>
				</div>
			</div>
		</article>
		
			<article class="fclear">
				신고 사유
				<div>
					<ul class="ckbox">
						<li><input type="radio" name="reason" value="1"><div
						 onclick="checkLb(this)">상품 정보 오류</div></li>
						<li><input type="radio" name="reason" value="2"><div
							 onclick="checkLb(this)">불법, 성인 이미지나 상품 게시</div></li>
						<li><input type="radio" name="reason" value="3"><div
							 onclick="checkLb(this)">입금 후 장기간 미배송</div></li>
						<li><input type="radio" name="reason" value="4"><div
							 onclick="checkLb(this)">심한 욕설이나 비방으로 인한 불쾌감 조성</div></li>
						<li><input type="radio" name="reason" value="5"><div
							 onclick="checkLb(this)">기타(직접 작성)</div></li>
						<li><textarea id="ta" disabled placeholder="기타 신고 사유 작성" onchange="checkVl()"></textarea></li>
					</ul>
				</div>
			</article>
		<form name="reportfm" action="report_ok.jsp">
			<div>
				<input type="hidden" name="s_idx" value="<%=sellidx %>">
				<input type="hidden" name="rp_reason" value="">
				<input type="hidden" name="reported" value="">
				<input type="hidden" name="reporter" value="">
			</div>
			<div class="reportpart">
				<ul>
					<li><input type="submit" value="신고하기"></li>
					<li><input type="reset" value="취소"></li>
				</ul>
			</div>
		</form>
	</section>
</body>
</html>