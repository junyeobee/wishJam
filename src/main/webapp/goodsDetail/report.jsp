<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wishJam.detail.DetailDTO"%>
<jsp:useBean id="ddao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>
<%
String sellidx_s = request.getParameter("s_idx");
String m_idx_s = request.getParameter("m_idx");

int m_idx = 0;
if (m_idx_s != null) {
	m_idx = Integer.parseInt(m_idx_s);
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
<link rel="stylesheet" href="/wishJam/goodsDetail/Forreport.css">
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<title>Insert title here</title>

<script>
	function checkLb(t) {
		var rp_r = document.reportfm.rp_reason;
		var thisbtn = t.previousElementSibling;
		var txt = document.getElementById("txt");
		var tbox = document.getElementById("textbox");

		if (thisbtn.value == "5") {
			thisbtn.checked = true;
			txt.contentEditable = true;
			tbox.style.backgroundColor = "white";
			
			if(txt.innerText.length>0){
				rp_r.value=txt.innerText;
			} else{
				rp_r.value = "5";
			}
		} else {
			thisbtn.checked = true;
			txt.contentEditable = false;
			tbox.style.backgroundColor = "#F2F2F2";
			rp_r.value = t.innerText;
		}
	}

	function checkRb(t) {
		var rp_r = document.reportfm.rp_reason;
		var thisbtn = t.nextElementSibling;
		var txt = document.getElementById("txt");
		var tbox = document.getElementById("textbox");

		if (t.value == "5") {
			txt.contentEditable = true;
			tbox.style.backgroundColor = "white";
			
			if(txt.innerText.length>0){
				rp_r.value=txt.innerText;
			} else{
				rp_r.value = "5";
			}
		} else {
			t.checked = true;
			txt.contentEditable = false;
			tbox.style.backgroundColor = "#F2F2F2";
			rp_r.value = thisbtn.innerText;
		}
	}

	function noreason() {
		var ckbtn = document.getElementsByName("reason");
		var reasonbox = document.reportfm.rp_reason;

		if (reasonbox.value == "") {
			window.alert('신고 사유를 선택하거나 작성해주세요.');
			return false;
		} else if (reasonbox.value == "5") {
			window.alert('신고 사유를 선택하거나 작성해주세요.');
			return false;
		} else if (ckbtn[4].checked &reasonbox.value.length < 10) {
			window.alert('신고 사유는 최소 10자 이상 작성해주세요.');
			return false;
		}
	}

	function getContents(t) {
		var rp_r = document.reportfm.rp_reason;
		var rr = document.getElementsByName("reason");
		var rbox = document.getElementById("contentlabel");

		if (rr[4].checked) {
			rp_r.value = t.innerHTML;
			rbox.style.display = "none";
		}

		if (t.innerText == "") {
			rbox.style.display = "block";
		}
		
		rp_r.value=t.innerText;
	}

	function boxclick() {
		document.getElementById("txt").focus();
	}
	
</script>
</head>
<body>
	<section>
		<h2>신고하기</h2>
		<article class="rpinfo">
			<span class="rtitle">신고 게시글</span>
			
			<div class="fbox infobox">
				<div class="rpimgbox">
					<img src="../img/img1.jpg" class="boximg">
				</div>

				<div class="sinfo2">
					<div><%=ddto.getS_title()%></div>
					<div style="text-align: end; font-size: 18px;">
						판매자:
						<%=ddto.getM_nick()%></div>
				</div>
			</div>
		</article>

		<article class="fclear rsbox">
			<div class="rpselect">신고 사유</div>
			<div>
				<ul class="ckbox fbox">
					<li><input type="radio" name="reason" value="1"
						onclick="checkRb(this)">
						<div onclick="checkLb(this)">상품 정보 오류</div></li>
					<li><input type="radio" name="reason" value="2"
						onclick="checkRb(this)">
						<div onclick="checkLb(this)">불법, 성인 이미지나 상품 게시</div></li>
					<li><input type="radio" name="reason" value="3"
						onclick="checkRb(this)">
						<div onclick="checkLb(this)">입금 후 장기간 미배송</div></li>
					<li><input type="radio" name="reason" value="4"
						onclick="checkRb(this)">
						<div onclick="checkLb(this)">심한 욕설이나 비방으로 인한 불쾌감 조성</div></li>
					<li><input type="radio" name="reason" value="5"
						onclick="checkRb(this)">
						<div onclick="checkLb(this)">기타</div></li>
					<li><div class="reviewbox">
							<div class="contentbox" id="textbox" onclick="boxclick()">
								<div id="contentlabel">신고 사유에 개인정보가 포함되지 않도록 유의 바랍니다.</div>
								<span class="txtbox" id="txt" contenteditable="false"
									oninput="getContents(this)"></span>
							
							</div>
						</div></li>
				</ul>
			</div>
		</article>
		<form name="reportfm" action="report_ok.jsp"
			onsubmit="return noreason()">
			<div>
				<input type="hidden" name="s_idx" value="<%=sellidx%>"> <input
					type="hidden" name="rp_reason"> <input type="hidden"
					name="reported" value="<%=ddto.getM_idx()%>"> <input
					type="hidden" name="reporter" value="<%=m_idx%>">
			</div>
			<div class="buttonbox">
				<input type="button" value="취소" onclick="window.close();">
				<input type="submit" value="신고하기">
			</div>
		</form>
	</section>
</body>
</html>