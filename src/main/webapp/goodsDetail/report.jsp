<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wishJam.detail.DetailDTO"%>
<jsp:useBean id="ddao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>
<%
int sellidx = 1;
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

.ckbox label {
	cursor: cursor;
}
</style>
<script>
	function checkLb(t) {
		var radiobtn = document.getElementsByName("reason");
		var rp_r = document.reportfm.rp_reason;
		for (var i = 0; i < radiobtn.length; i++) {
			if (radiobtn[i].value == t.id) {
				radiobtn[i].checked = "checked";
				rp_r.value=t.innerText;
			}

			if (t.id == "5") {
				document.getElementById("ta").disabled = false;
			} else{
				document.getElementById("ta").disabled = true;
			}

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
						<li><input type="radio" name="reason" value="1"><label
							id="1" onclick="checkLb(this)">상품 정보 오류</label></li>
						<li><input type="radio" name="reason" value="2"><label
							id="2" onclick="checkLb(this)">불법, 성인 이미지나 상품 게시</label></li>
						<li><input type="radio" name="reason" value="3"><label
							id="3" onclick="checkLb(this)">입금 후 장기간 미배송</label></li>
						<li><input type="radio" name="reason" value="4"><label
							id="4" onclick="checkLb(this)">심한 욕설이나 비방으로 인한 불쾌감 조성</label></li>
						<li><input type="radio" name="reason" value="5"><label
							id="5" onclick="checkLb(this)">기타(직접 작성)</label></li>
						<li><textarea id="ta" disabled placeholder="기타 신고 사유 작성" onchange="checkVl()"></textarea></li>
					</ul>
				</div>
			</article>
		<form name="reportfm" action="report_ok.jsp">
			<div>
				<input type="hidden" name="s_idx" value="<%=sellidx %>">
				<input type="hidden" name="g_name" value="토마토">
				<input type="hidden" name="rp_reason" value="11">
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