<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wishJam.detail.DetailDTO"%>
<%@ page import="com.wishJam.s_goods.S_goodsDTO"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="ddao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>
<jsp:useBean id="sgdao" class="com.wishJam.s_goods.S_goodsDAO"></jsp:useBean>

<%
int sellidx = 1;
DetailDTO sddto = ddao.viewSellDetail(sellidx);
ArrayList<S_goodsDTO> sglist = sgdao.viewGoods(sellidx);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail page</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

</head>
<style>
body {
	width: 1000px;
	margin: 0px auto;
}

section {
	text-align: center;
}

.pfimg {
	height: 100px;
	width: 100px;
	border-radius: 50px;
	object-fit: cover;
	border-radius: 50px;
}

.option {
	position: sticky;
	position: -webkit-sticky;
	top: 0px;
	width: 350px;
	border: 1px solid gray;
	text-align: center;
	float: right;
}

.explain {
	width: 630px;
	border: 1px solid green;
}

.boximg {
	width: 100px;
	height: 100px;
	object-fit: cover;
}

.conimg {
	object-fit: contain;
	width: 630px;
}

.detail_price {
	text-align: right;
}

.listable {
	border: 1px solid pink;
	justify-content: space-between;
}

ul {
	padding: 0;
	margin: 0px auto;
	text-align: center;
	list-style: none;
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

.fcenter {
	justify-content: center;
}

.btnli {
	border: 1px solid gray;
	width: 49%;
}

.colortobox {
	background-color: pink;
}

.reportbtn {
	text-align: right;
}

.rpbtn {
	width: 50px;
	height: 25px;
	border-radius: 50px;
	background-color: red;
}

.detailnav {
	position: sticky;
	top: 0;
}

.kwicon {
	cursor: default;
}
</style>
<script>
	function openReport() {
		window.open('/wishJam/goodsDetail/report.jsp', 'report',
				'width=400, height=500');
	}

	function deleteGd(t) {
		t.parentNode.remove(t);

		var amount = document.getElementsByName(t.id);
		var price = parseInt(document.getElementById(t.id + '_p').innerText);

		var mprice = parseInt(amount[1].value) * price;

		var totals = document.getElementById('totalprice');
		totals.innerHTML = parseInt(document.getElementById('totalprice').innerText)
				- mprice + '원';
		amount[1].value = '0';
	}

	function plusBtn(t) {
		var amount = document.getElementsByName(t.name);
		amount[1].value = parseInt(amount[1].value, 10) + 1;
		console.log(t.name);
		var price = parseInt(document.getElementById(t.name + '_p').innerText);

		var lname = document.getElementById(t.name + '_gname');
		var lamount = document.getElementById(t.name + '_amount');
		var lprice = document.getElementById(t.name + '_price');
		var gname = document.getElementById(t.name + '_name');

		if (lname == null) {
			document.getElementById("option_table").innerHTML += '<div class="listable fbox"><table><tr><td id="'+t.name+'_gname">'
					+ gname.innerText
					+ '</td><td id="'+ t.name+'_price">'
					+ price
					+ '원</td><td id="'+t.name+'_amount">'
					+ amount[1].value
					+ '개</td></tr></table><span class="material-symbols-outlined kwicon" id="'
					+ t.name + '" onclick="deleteGd(this)">close</span></div>';
		} else if (gname.innerText == lname.innerText) {
			lamount.innerHTML = amount[1].value + '개';
			lprice.innerHTML = price + '원';
		}

		var totals = document.getElementById('totalprice');
		totals.innerHTML = parseInt(document.getElementById('totalprice').innerText)
				+ price + '원';
	}

	function minusBtn(t) {
		var amount = document.getElementsByName(t.name);
		if (parseInt(amount[1].value, 10) > 0) {
			amount[1].value = parseInt(amount[1].value, 10) - 1;

			var totals = document.getElementById('totalprice');
			var price = parseInt(document.getElementById(t.name + '_p').innerText);
			totals.innerHTML = parseInt(document.getElementById('totalprice').innerText)
					- price + '원';

			var lname = document.getElementById(t.name + '_gname');
			var lamount = document.getElementById(t.name + '_amount');
			var lprice = document.getElementById(t.name + '_price');
			var gname = document.getElementById(t.name + '_name');

			if (lname == null) {
				document.getElementById("option_table").innerHTML += '<div class="listable fbox"><table><tr><td id="'+t.name+'_gname">'
						+ gname.innerText
						+ '</td><td id="'+t.name+'_amount">'
						+ amount[1].value
						+ '개</td><td id="'+ t.name+ '_price">'
						+ price
						+ '원</td></tr></table><span class="material-symbols-outlined kwicon" id="'
						+ t.name
						+ '" onclick="deleteGd(this)">close</span></div>';
			} else if (gname.innerText == lname.innerText) {
				lamount.innerHTML = amount[1].value + '개';
				lprice.innerHTML = price + '원';
			}
		}
		if (parseInt(amount[1].value, 10) == 0) {
			var tlabel = document.getElementById(t.name);
			tlabel.parentNode.remove();
		}
	}
</script>
<body>

	<section class="option">
		<article>
			<form name="option">
				<%
				for (int i = 0; i < sglist.size(); i++) {
				%>
				<div class="fclear">
					<img class="boximg lfloat" src="../img/img2.jpeg">
					<div id="sg_idx<%=i%>_name"><%=sglist.get(i).getSg_name()%></div>
					<div class="detail_price" id="sg_idx<%=i%>_p"><%=sglist.get(i).getSg_price()%></div>
					<input type="button" value="-" name="sg_idx<%=i%>"
						onclick="minusBtn(this)"> <input type="text"
						name="sg_idx<%=i%>" value="0"> <input type="button"
						value="+" name="sg_idx<%=i%>" onclick="plusBtn(this)">
				</div>
				<%
				}
				%>
			</form>
		</article>
		<article class="fclear">
			<form name="option_table">
				<div id="option_table"></div>
				<div>총 상품 금액</div>
				<div id="totalprice">0원</div>
				<ul class="fbox">
					<li class="btnli"><a href="#">장바구니</a></li>
					<li class="btnli"><a href="#">구매하기</a></li>
				</ul>
			</form>
		</article>
	</section>
	<article class="detailnav">
		<div><%=sddto.getS_title()%></div>
		<ul class="fbox">
			<li class="btnli"><a href="#detailpage">상세정보</a></li>
			<li class="btnli"><a href="#reviewpage">리뷰</a></li>
		</ul>
	</article>
	<section class="explain">
		<a name="detailpage"></a>
		<article>
			<img src="../img/img2.jpeg" class="conimg">
			<div><%=sddto.getS_content()%></div>
			<img src="../img/img1.jpg" class="conimg">
		</article>
		<article>
			<div>
				<ul class="fbox fcenter">
					<%
					String hash_arr[] = (sddto.getS_hash()).split("#");
					for (int i = 1; i < hash_arr.length; i++) {
					%>

					<li>#<%=hash_arr[i]%></li>

					<%
					}
					%>
				</ul>
			</div>
		</article>

		<article>
			<div style="background-image: linear-gradient(white 30%, pink 30%);">
				<img src="../img/img1.jpg" class="pfimg">
				<div><%=sddto.getM_nick()%></div>
				<div><%=sddto.getG_name()%></div>
				<input type="button" value="찜">
			</div>
		</article>
		<article class="reportbtn">
			<input type="button" value="신고" class="rpbtn" onclick="openReport()">
		</article>

	</section>
	<%@ include file="review.jsp"%>
</body>
</html>