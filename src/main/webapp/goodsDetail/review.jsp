<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.wishJam.review.*"%>
<jsp:useBean id="rdao" class="com.wishJam.review.ReviewDAO"></jsp:useBean>

<%
DecimalFormat df = new DecimalFormat("#.##");

String s_idx_s = request.getParameter("s_idx");
int s_idx = 0;
if (s_idx_s != null)
	s_idx = Integer.parseInt(s_idx_s);

int rSize = 5;
int pageSize = 5;

String rp_s = request.getParameter("rp");
if (rp_s == null || rp_s.equals("")) {
	rp_s = "1";
}
int rp = Integer.parseInt(rp_s);

ArrayList<ReviewDTO> rlist = rdao.viewReview(s_idx, rp, rSize);
ArrayList<ReviewDTO> ilist = rdao.viewImgReview(s_idx);

int totalCnt = 0;
int tiCnt = 0;
if (rlist != null) {
	totalCnt = rdao.countReview(s_idx);
}
if (ilist != null) {
	tiCnt = rdao.countimgReview(s_idx);
}

int totalPage = (totalCnt / rSize) + 1;
if (totalCnt % rSize == 0) {
	totalPage--;
}

int tiPage = tiCnt / rSize + 1;
int total_s = rdao.sumRstar(s_idx);
double avg_s = (double) total_s / totalCnt;

int nowGroup = rp / pageSize;
if (rp % pageSize == 0) {
	nowGroup--;
}
%>
<script>
	function moreImgOpen(t) {
		var imgbox = t.nextElementSibling;
		var farr = t.nextElementSibling.nextElementSibling;

		if (imgbox.style.display == "none") {
			console.log('1');
			imgbox.style.display = "flex";
			farr.style.display = "inline-block";
			window.scrollBy(0,200);
			t.innerHTML = '<span class="material-symbols-outlined">keyboard_arrow_up</span>';
		} else {
			console.log('2');
			imgbox.style.display = "none";
			farr.style.display = "none";
			window.scrollBy(0,-200);
			t.innerHTML = '<span class="material-symbols-outlined">keyboard_arrow_down</span>';
		}
	}
	
	function scrollImgbox(t){
		var imgbox = t.previousElementSibling;		
		var barrow = t.nextElementSibling;
		var farrow = t.previousElementSibling;	;
		
		if(t.id=="forarrow"){
			var imgb = t.previousElementSibling.firstElementChild;
			var ccnt = imgb.childElementCount;
			
			if(ccnt==4){
				imgb.classList.add("move1");
				barrow.style.display="inline-block";
				t.style.display="none";
				t.previousElementSibling.style.left="30px";
			} else if(ccnt==5){
				imgb.classList.add("move2");
				barrow.style.display="inline-block";
				t.style.display="none";
				t.previousElementSibling.style.left="30px";
			}
		} else if(t.id=="backarrow"){
			var imgb = t.previousElementSibling.previousElementSibling.firstElementChild;
			farrow.style.display="inline-block";
			t.style.display="none";
			t.previousElementSibling.previousElementSibling.style.left="0px";
			imgb.className="moreImg fbox move3";
		}
	}
</script>
<section class="review fullsize">
	<h2 class="th2">리뷰</h2>
	<%
	if (totalCnt == 0) {
	%>
	<div style="text-align: center; margin-bottom: 30px;">작성된 리뷰가
		없습니다.</div>
	<%
	} else {
	%>
	<article class="fbox">
		<ul class="fbox rvul">
			<li><div>
					<div class="totalrv">총 별점</div>
					<div class="totalrs"><%=totalCnt > 0 ? df.format(avg_s) : "별점 없음"%></div>
				</div></li>
			<li><div>
					<div class="totalrv">리뷰 수</div>
					<div class="totalrs"><%=totalCnt%>건
					</div>
				</div></li>
		</ul>
	</article>
	<section>
		<h2>
			<a name="reviewpage" class="revbox2"> 리뷰 보기</a>
		</h2>
		<article class="imgreview">
			<ul class="reviewul fbox">
				<%
				if (ilist != null) {

					for (int i = 0; i < (ilist.size() <= rSize ? ilist.size() : rSize); i++) {
						String gals[] = ilist.get(i).getR_img().split("\\*");
				%>
				<li><a href="#"><img src="<%=gals[0]%>"></a></li>
				<%
				if (rdao.countimgReview(s_idx) > rSize && i == rSize - 1) {
				%>
				<li class="moreArrow"><span class="material-symbols-outlined">arrow_forward_ios</span>
				</li>
				<%
				}
				}

				} else {
				%><li>리뷰 이미지 없음</li>
				<%
				}
				%>
			</ul>
		</article>
		<section class="fbox" style="flex-direction: column;">
			<%
			for (int i = 0; i < rlist.size(); i++) {
			%>
			<article class="reply">
				<div class="rebox fbox">
					<div class="fbox rebox2">
						<div class="fbox" style="height: 100%;">
							<div style="justify-content: center;">
								<img src="<%=rlist.get(i).getM_img()%>" class="smallimg">
							</div>
							<div style="margin:0 20px;">
								<div class="fbox">
									<span class="namebox"><%=rlist.get(i).getM_nick()%></span>
									<%
									for (int j = 0; j < rlist.get(i).getR_star(); j++) {
									%>
									<span class="material-symbols-outlined rstar">kid_star</span>
									<%
									}
									%>
								</div>
								<span style="font-size: 19px; padding: 0 10px;"><%=rlist.get(i).getR_content()%></span>
							</div>
						</div>
					</div>
					<div class="fbox" style="flex-direction: column;">
						<%
						String gal[] = rlist.get(i).getR_img().split("\\*");

						if (rlist.get(i).getR_img().equals(" ")) {
						%>
						<div class="rboximg rfloat"></div>
						<%
						} else{
						%>
						<img src="<%=gal[0]%>" class="rboximg rfloat">
						<%
						}
						%>
						<div class="fbox"
							style="margin-top: 5px; justify-content: right; font-size: 16px;"><%=rlist.get(i).getR_date()%></div>
					</div>
				</div>
				<%
				if (gal.length > 1) {
				%>
				<div class="moreimgbtn" onclick="moreImgOpen(this)">
					<span class="material-symbols-outlined">keyboard_arrow_down</span>
				</div>
				<div class="moreImgbox" style="display: none;">
					<div id="moreImg" class="moreImg fbox">

						<%
						

						if (rlist.get(i).getR_img() != null) {

						for (int j = 0; j < gal.length; j++) {
							if(!gal[j].equals(" ")){
						%>
						<img src="<%=gal[j]%>" class="moreboximg">
						<%
						}}}}
						%>
					</div>
				</div>
				<%
				if (gal.length > 3) {
				%>
				<span class="material-symbols-outlined forarrow" id="forarrow" onclick="scrollImgbox(this)">arrow_forward_ios</span>
				<span class="material-symbols-outlined backarrow" id="backarrow" onclick="scrollImgbox(this)">arrow_back_ios</span>
				<%
				}
				%>
			</article>
			<%
			}
			%>
		</section>
		<div class="fclear pageArrow fbox" style="text-align: center;">
			<%
			if (nowGroup != 0) {
			%>
			<span class="material-symbols-rounded pagenum"><a
				class="pageB"
				href="detail.jsp?s_idx=<%=s_idx%>&rp=<%=(nowGroup - 1) * pageSize + pageSize%>#reviewpage">arrow_back</a></span>
			<%
			}

			for (int i = nowGroup * pageSize + 1; i <= pageSize * nowGroup + pageSize; i++) {
			%>
			<span class="pagenum"><a class="<%=rp == i ? "pageA2" : "pageA"%>"
				href="detail.jsp?s_idx=<%=s_idx%>&rp=<%=i%>#reviewpage"><%=i%></a></span>
			<%
			if (i == totalPage) {
				break;
			}
			}

			if (nowGroup != (totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)) {
			%>
			<span class="material-symbols-rounded pagenum"><a
				class="pageB"
				href="detail.jsp?s_idx=<%=s_idx%>&rp=<%=(nowGroup + 1) * pageSize + 1%>#reviewpage">arrow_forward</a></span>
			<%
			}
			}
			%>
		</div>
	</section>
</section>
