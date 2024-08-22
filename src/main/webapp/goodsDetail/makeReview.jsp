<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Object m_idx_s = session.getAttribute("m_idx");
Object s_idx_s = session.getAttribute("s_idx");

int m_idx = 0;
int s_idx = 0;

if(m_idx_s!=null){
	m_idx = (Integer)m_idx_s;
}
if(s_idx_s!=null){
	s_idx=(Integer)s_idx_s;
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>Insert title here</title>
<style>
.material-symbols-rounded {
  font-variation-settings:
  'FILL' 0,
  'wght' 350,
  'GRAD' 0,
  'opsz' 24
}

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 1,
  'wght' 400,
  'GRAD' 0,
  'opsz' 24
}

.starcolor {
	color: pink;
}

.stars {
	display: flex;
}

li {
	list-style: none;
}

.stars li:hover {
	cursor: pointer;
}

.review_img {
	width: 100px;
	height: 100px;
	border: 1px solid gray;
	border-radius: 10px;
	object-fit: cover;
}

.review_img:hover {
	cursor: pointer;
}

#rvImg{
	display: flex;
}
</style>
<script>
	function pickStar(t) {
		var sname = document.getElementsByName("star");
		var rstar = document.getElementById("r_star");
		var i = -1;

		for (var j = 0; j < sname.length; j++) {
			sname[j].className="material-symbols-rounded";
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
		} else if(document.makeReviewfm.r_content.value.length<10){
			window.alert('최소 10자 이상 작성해주세요.');
			return false;
		}
		
		
	}
</script>
</head>
<body>
	<section>
		<h2>리뷰 쓰기</h2>
		<article>
			<div>게시글 정보</div>
			<div class="display:flex;"></div>
		</article>
		<article>
			<form name="makeReviewfm" action="makeReview_ok.jsp" onsubmit="return checkAllfm()">
				<div>
					<span>상품은 만족하셨나요?</span>
					<div>
						<ul class="stars">
							<li><span class="material-symbols-rounded" name="star" onclick="pickStar(this)">kid_star</span></li>
							<li><span class="material-symbols-rounded" name="star" onclick="pickStar(this)">kid_star</span></li>
							<li><span class="material-symbols-rounded" name="star" onclick="pickStar(this)">kid_star</span></li>
							<li><span class="material-symbols-rounded" name="star" onclick="pickStar(this)">kid_star</span></li>
							<li><span class="material-symbols-rounded" name="star" onclick="pickStar(this)">kid_star</span></li>
						</ul>
						<input type="hidden" id="r_star" name="r_star" value="0">
					</div>
				</div>
				<div>
					<div>상품을 자랑해주세요</div>
					<textarea name="r_content" placeholder="리뷰를 작성해주세요."></textarea>
				</div>
				<div>
					<div>사진 첨부</div>
					<ul id="rvImg">
						<li><div class="review_img"
								onclick="openImgpop(<%=s_idx%>,<%=m_idx%>)"></div></li>

					</ul>
					<input type="hidden" name="r_img" id="r_img" value=" ">
					<div>최대 5장</div>
				</div>
				<div>
					<input type="submit" value="리뷰 등록">
				</div>
			</form>
		</article>
	</section>
</body>
</html>