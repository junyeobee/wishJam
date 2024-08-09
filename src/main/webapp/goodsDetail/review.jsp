<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h2><a name="reviewpage"> 리뷰 보기</a></h2>
		<article>
			<ul class="reviewul fbox">
				<li><a href="#"><img src="../img/img2.jpeg"></a></li>
				<li><a href="#"><img src="../img/img2.jpeg"></a></li>
				<li><a href="#"><img src="../img/img2.jpeg"></a></li>
				<li><a href="#"><img src="../img/img2.jpeg"></a></li>
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
		<section>
			<article>
				<div style="height: 100px;" class="lfloat">
					<div class="fbox">
						<img src="../img/img1.jpg" class="smallimg">
						<div>*****</div>
					</div>
					이것은 리뷰글!
					<div>ㄴ답글</div>
				</div>
				<img src="../img/img2.jpeg" class="boximg rfloat">
			</article>
			<article class="fclear">
				<div style="height: 100px;" class="lfloat">
					<div class="fbox">
						<img src="../img/img1.jpg" class="smallimg">
						<div>*****</div>
					</div>
					이것은 리뷰글!
					<div>ㄴ답글</div>
				</div>
				<img src="../img/img2.jpeg" class="boximg rfloat">
			</article>
		</section>
		<div class="fclear">
			더보기
		</div>
	</section>
</section>
