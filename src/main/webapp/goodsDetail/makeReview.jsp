<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wishJam.detail.DetailDTO"%>
<jsp:useBean id="mrdao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>

<%
String m_idx_s = request.getParameter("m_idx");
String s_idx_s = request.getParameter("s_idx");

int m_idx = 0;
int s_idx = 0;

if (m_idx_s != null) {
	m_idx = Integer.parseInt(m_idx_s);
}
if (s_idx_s != null) {
	s_idx = Integer.parseInt(s_idx_s);
}

DetailDTO mrdto = mrdao.viewSellDetail(s_idx);

if (mrdto==null) {
%>
<script>
		window.alert('삭제된 게시글이거나 없는 게시글입니다.');
		window.close();
	</script>
<%
} else if (mrdto.getS_stat() == 1) {
%>
<script>
	window.alert('삭제된 게시글이거나 없는 게시글입니다.');
	window.close();
</script>
<%
} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="/wishJam/goodsDetail/Forreview.css">
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<title>Insert title here</title>

<script>
	function pickStar(t) {
		var sname = document.getElementsByName("star");
		var rstar = document.getElementById("r_star");
		var i = -1;

		for (var j = 0; j < sname.length; j++) {
			sname[j].className="material-symbols-rounded starcolor";
		}
		do {
			i++;
			sname[i].className="material-symbols-outlined starcolor";
		} while (t != sname[i]);
		
		rstar.value=i+1;
	}
	
	function openImgpop(s_idx, m_idx){
		var rv = document.getElementById("rvImg");
		var cnt = rv.childElementCount;
		
		if(cnt<6){
			window.open('reviewImgUp.jsp?s_idx='+s_idx+'&m_idx='+m_idx+'&cnt='+cnt, 'reviewImgup','width=400, height=400');
		}else {
			window.alert('더이상 사진을 등록 할 수 없습니다!');
		}
	}
	
	function checkAllfm(){
		if(document.makeReviewfm.r_star.value<1){
			window.alert('별점을 선택해주세요.');
			return false;
		} else if(document.makeReviewfm.r_content.value==""){
			window.alert('리뷰 내용을 작성해주세요.');
			return false;
		}
	}
	
	function getContents(t){
		var contvalue=document.makeReviewfm.r_content;
		var rbox = document.getElementById("contentlabel");
		
		if(contvalue.value==""){
			rbox.style.display="none";
		}
		if(t.innerText==""){
			rbox.style.display="block";
		}
		
		contvalue.value=t.innerHTML;
	}
	
	function boxclick() {
		document.getElementById("txt").focus();
	}
</script>
</head>
<body>
	<section>
		<h2>리뷰 쓰기</h2>
		<article>
			<div class="fbox sinfo">
				<div>
					<img class="rvprof" src="<%=mrdto.getS_img()%>">
				</div>
				<div class="sinfo2">
					<div><%=mrdto.getS_title()%></div>
					<div style="text-align: end; font-size: 18px;"><%=mrdto.getM_nick() %></div>
				</div>
			</div>
			<div class="display:flex;"></div>
		</article>
		<article>
			<form name="makeReviewfm" action="makeReview_ok.jsp"
				onsubmit="return checkAllfm()">
				<div class="stf">
					<span style="font-size:25px;">상품은 만족하셨나요?</span>
					<div>
						<ul class="stars">
							<li><span class="material-symbols-rounded starcolor"
								name="star" onclick="pickStar(this)">kid_star</span></li>
							<li><span class="material-symbols-rounded starcolor"
								name="star" onclick="pickStar(this)">kid_star</span></li>
							<li><span class="material-symbols-rounded starcolor"
								name="star" onclick="pickStar(this)">kid_star</span></li>
							<li><span class="material-symbols-rounded starcolor"
								name="star" onclick="pickStar(this)">kid_star</span></li>
							<li><span class="material-symbols-rounded starcolor"
								name="star" onclick="pickStar(this)">kid_star</span></li>
						</ul>
						<input type="hidden" id="r_star" name="r_star" value="0">
					</div>
				</div>
				<div class="reviewbox">
					<div style="font-weight: bold;">상품을 자랑해주세요</div>
					<div class="contentbox" onclick="boxclick()">
					<div id="contentlabel">리뷰를 작성해주세요</div>
					<span class="txtbox" id="txt" contenteditable="true" oninput="getContents(this)"></span>
					</div>
					<input type="hidden" name="r_content">
				</div>
				<div class="imgbox">
					<div>사진 첨부</div>
					<span style="font-size:14px;">(최대 5장 첨부 가능)</span>
					<ul id="rvImg">
						<li><div class="review_img uploadbox"
								onclick="openImgpop(<%=s_idx%>,<%=m_idx%>)">
								<span class="material-symbols-rounded">add_photo_alternate</span>
								</div>
						</li>
					</ul>
					<input type="hidden" name="r_img" id="r_img" value=" ">
				</div>
				<div class="buttonbox">
					
						<input type="button" value="취소">
					
						<input type="submit" value="리뷰 등록">
				</div>
			</form>
		</article>
	</section>
</body>
</html>
<%
}
%>