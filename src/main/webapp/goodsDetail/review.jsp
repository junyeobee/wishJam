<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.wishJam.review.*"%>
<jsp:useBean id="rdao" class="com.wishJam.review.ReviewDAO"></jsp:useBean>

<%
ArrayList<ReviewDTO> rlist = rdao.viewReview();

if (rlist.size() == 0) {
	System.out.println("d");
} else {
	for (int i = 0; i < rlist.size(); i++) {
		System.out.println(rlist.get(i).getM_idx());
	}
}
%>

<style>
.review {
	width: 630px;
	border: 1px solid gray;
}

.reviewul img {
	width: 100px;
	height: 100px;
	object-fit: cover;
	margin-right: 50px;
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
	border-bottom: 1px solid #DBDBDB;
}

.rebox:hover {
	cursor: pointer;
	background-color: #D1E7FD;
}

.rstar {
	color: pink;
}
</style>
<section class="review">
	<h2>리뷰</h2>
	<article>
		<ul class="fbox">
			<li><div>
					총 별점
					<div>*****</div>
				</div></li>
			<li><div>
					리뷰 수
					<div>11건</div>
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
				for (int i = 0; i < rlist.size(); i++) {
				%>
				<li><a href="#"><img src="<%=rlist.get(i).getR_img()%>"></a></li>
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
			for (int i = 0; i < rlist.size(); i++) {
			%>
			<article>
				<div class="rebox fbox" style="justify-content: space-between;">
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
						<img src="<%=rlist.get(i).getR_img()%>" class="boximg rfloat">
						<div class="fbox" style="justify-content: right; font-size: 13px;"><%=rlist.get(i).getR_date()%></div>
					</div>
				</div>
			</article>
			<%
			}
			%>
		</section>
		<div class="fclear">더보기</div>
	</section>
</section>
