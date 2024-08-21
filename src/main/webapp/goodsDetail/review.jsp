<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.wishJam.review.*"%>
<jsp:useBean id="rdao" class="com.wishJam.review.ReviewDAO"></jsp:useBean>

<%
DecimalFormat df = new DecimalFormat("#.##");

int s_idx = (Integer) session.getAttribute("s_idx");

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

int totalPage = totalCnt / rSize + 1;
int total_s = rdao.sumRstar(s_idx);
double avg_s = (double) total_s / totalCnt;

int nowGroup = rp / pageSize;
if (rp % pageSize == 0) {
	nowGroup--;
}

System.out.println(rlist.get(1).getR_img());
%>

<style>
h2 {
	text-align: center;
}

.th2 {
	margin: 20px auto;
	padding-bottom: 20px;
	width: 90%;
	border-bottom: 1px solid #BDBDBD;
	width: 90%;
}

.review {
	width: 630px;
	border: 1px solid gray;
}

.reviewul {
	justify-content: space-around;
}

.reviewul img {
	width: 100px;
	height: 100px;
	object-fit: cover;
}

.sleft {
	width: 100px;
}

.keyword a {
	text-decoration: none;
	border: 1px solid gray;
	padding: 5px;
	border-radius: 50px;
	margin-right: 20px;
}

.keyword a:hover {
	box-shadow: 0px 0px 10px 0px #BDBDBD;
}

.smallimg {
	width: 50px;
	height: 50px;
	object-fit: cover;
	border-radius: 50px;
}

.material-symbols-outlined {
	font-variation-settings: 'FILL' 100, 'wght' 400, 'GRAD' 0, 'opsz' 24
}

.rebox {
	padding: 5px 5px;
}

.rebox:hover {
	cursor: pointer;
	background-color: #D1E7FD;
}

.rstar {
	color: pink;
}

.reply {
	border-bottom: 1px solid #DBDBDB;
}

.totalrv {
	font-size: 23px;
	font-weight: bold;
}

.totalrs {
	font-size: 20px;
}

.rvul li {
	margin: 0 10px;
}

.pageA {
	text-decoration: none;
	color: black;
}

.moreArrow {
	align-items: center;
	display: flex;
}

.moreArrow:hover {
	cursor: pointer;
}

.moreImg {
	display: none;
	flex-wrap: nowrap;
	overflow:hidden;
}

.moreboximg {
	width: 180px;
	height: 180px;
	object-fit: cover;
	border-radius: 5px;
	
}

.rboximg {
	width: 120px;
	height: 120px;
	object-fit: cover;
	border-radius: 5px;
}
</style>
<script>
	function moreImgOpen(t){
		var imgbox = t.nextElementSibling;
		
		if(imgbox.style.display=="none"){
			imgbox.style.display="flex";
		} else{
			imgbox.style.display="none";
		}
	}
</script>
<section class="review">
	<h2 class="th2">리뷰</h2>
	<%
	if (rlist == null) {
	%>
	<div style="text-align: center; margin-bottom: 30px;">작성된 리뷰가 없습니다.</div>
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
			<a name="reviewpage"> 리뷰 보기</a>
		</h2>
		<article>
			<ul class="reviewul fbox">
				<%
				if (ilist != null) {

					for (int i = 0; i < rSize; i++) {
				%>
				<li><a href="#"><img src="<%=ilist.get(i).getR_img()%>"></a></li>
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
		<article>
			<table>
				<tr>
					<td>
						<h3 class="sleft">키워드</h3>
					</td>
					<td><ul class="fbox">
							<li class="keyword"><a href="#">#키워드</a></li>
							<li class="keyword"><a href="#">#키워드</a></li>
							<li class="keyword"><a href="#">#키워드</a></li>
							<li class="keyword"><a href="#">#키워드</a></li>
							<li class="keyword"><a href="#">#키워드</a></li>
						</ul></td>
			</table>
		</article>
		<section class="fbox" style="flex-direction: column;">
			<%
			for (int i = 0; i < totalCnt; i++) {
			%>
			<article class="reply">
				<div class="rebox fbox" style="justify-content: space-between;" onclick="moreImgOpen(this)">
					<div style="height: 100px; flex-direction: column;" class="fbox">
						<div class="fbox">
							<div>
								<img src="<%=rlist.get(i).getM_img()%>" class="smallimg">
							</div>
							<div>
								<div class="fbox">
									<%=rlist.get(i).getM_nick()%>
									<%
									for (int j = 0; j < rlist.get(i).getR_star(); j++) {
									%>
									<span class="material-symbols-outlined rstar">kid_star</span>
									<%
									}
									%>
								</div>
								<span><%=rlist.get(i).getR_content()%></span>
							</div>
						</div>
					</div>
					<div class="fbox" style="flex-direction: column;">
						<%
						if (rlist.get(i).getR_img() != null) {
							String gal[] = rlist.get(i).getR_img().split("\\*");
						%>
						<img src="<%=gal[0]%>" class="rboximg rfloat">
						<%
						}
						%>
						<div class="fbox" style="justify-content: right; font-size: 13px;"><%=rlist.get(i).getR_date()%></div>
					</div>
				</div>
 				<div id="moreImg" class="moreImg">
					<%
					if (rlist.get(i).getR_img() != null) {
						String gal[] = rlist.get(i).getR_img().split("\\*");
						for (int j = 0; j < gal.length; j++) {
					%>
					<img src="<%=gal[j]%>" class="moreboximg">
					<%
					}
					}
					%>
				</div>
			</article>
			<%
			}
			%>
		</section>
		<div class="fclear" style="text-align: center;">
			<%
			if (nowGroup != 0) {
			%>
			<span><a
				href="detail.jsp?s_idx=<%=s_idx%>&rp=<%=(nowGroup - 1) * pageSize + pageSize%>#reviewpage">[&lt;이전]</a></span>
			<%
			}

			for (int i = nowGroup * pageSize + 1; i <= pageSize * nowGroup + pageSize; i++) {
			%>
			<span><a class="pageA"
				href="detail.jsp?s_idx=<%=s_idx%>&rp=<%=i%>#reviewpage"
				style="color:<%=rp == i ? "blue" : "black"%>;">[<%=i%>]
			</a></span>
			<%
			if (i == totalPage) {
				break;
			}
			}

			if (nowGroup != (totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)) {
			%>
			<span><a
				href="detail.jsp?s_idx=<%=s_idx%>&rp=<%=(nowGroup + 1) * pageSize + 1%>#reviewpage">[다음&gt;]</a></span>
			<%
			}
			}
			%>
		</div>
	</section>
</section>
