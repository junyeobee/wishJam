<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.wishJam.detail.DetailDTO"%>
<%@ page import="com.wishJam.s_goods.S_goodsDTO"%>
<%@ page import="com.allgoods.wishJam.JjimDTO"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="ddao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>
<jsp:useBean id="sgdao" class="com.wishJam.s_goods.S_goodsDAO"></jsp:useBean>
<jsp:useBean id="jdao" class="com.allgoods.wishJam.JjimDAO"></jsp:useBean>

<%
String sellidx_s = request.getParameter("s_idx");
int sellidx = 0;
if (sellidx_s != null) {
	sellidx = Integer.parseInt(sellidx_s);
}

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
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" type="text/css"
	href="/wishJam/goodsDetail/Fordetail.css" />
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
</head>

<body>
<%@ include file="../header.jsp"%>

	<%
	boolean isFav = jdao.isthisJjim(sellidx, m_idx);

	String favorite = request.getParameter("favorite");
	JjimDTO jjdto = new JjimDTO();
	jjdto.setM_idx(m_idx);
	jjdto.setS_idx(sellidx);

	if (favorite != null && isFav == false) {
		boolean addf = jdao.addJjim(jjdto);
		boolean incf = jdao.incrementJjim(sellidx);
	}
	%>

	<section class="option">
		<div class="optionblank"></div>
		<div class="option_article">
			<article>
				<form name="option">
					<%
					for (int i = 0; i < sglist.size(); i++) {
					%>
					<div class="fclear">
						<img class="boximg lfloat" src="../img/img2.jpeg">
						<div id="sg_idx<%=i%>_name"><%=sglist.get(i).getSg_name()%></div>
						<div class="fbox" style="justify-content: space-evenly;">
							<div
								style="display:<%=sglist.get(i).getSg_discnt() == 1 ? "block" : "none"%>">할인중</div>
							<div class="fbox">
								<div class="detail_price"
									style="text-decoration:<%=sglist.get(i).getSg_discnt() == 1 ? "line-through" : "none"%>;"><%=sglist.get(i).getSg_price()%></div>
								<span class="material-symbols-outlined"
									style="display:<%=sglist.get(i).getSg_discnt() == 1 ? "block" : "none"%>;">trending_flat</span>
								<div id="sg_idx<%=i%>_p"
									style="display:<%=sglist.get(i).getSg_discnt() == 1 ? "block" : "none"%>;"><%=sglist.get(i).getSg_discnt() == 1
		? (int) (sglist.get(i).getSg_price() * (1 - (double) sddto.getS_discnt() / 100))
		: sglist.get(i).getSg_price()%></div>
							</div>
						</div>
						<input type="button" value="-" name="sg_idx<%=i%>"
							onclick="minusBtn(this,<%=sglist.get(i).getSg_idx()%>)">
						<input type="text" name="sg_idx<%=i%>" value="0"> <input
							type="button" value="+" name="sg_idx<%=i%>"
							onclick="plusBtn(this,<%=sglist.get(i).getSg_idx()%>)">
					</div>
					<%
					}
					%>
				</form>
			</article>
			<article class="fclear">
				<form name="option_table" action="addCart_ok.jsp">
					<div id="option_table"></div>
					<div>총 상품 금액</div>
					<div id="totalprice">0원</div>
					<ul class="fbox">
						<li class="btnli"><input type="submit" value="장바구니"></li>
						<li class="btnli"><input type="button" value="구매하기"
							onclick="window.alert('구매 완료!');"></li>
					</ul>
					<input type="hidden" name="s_idx" value="<%=sellidx%>">
				</form>
			</article>
		</div>
	</section>
	<div class="headInfo" id="scrollH1">
		<div>
			<div class="titles"><%=sddto.getS_title()%></div>
			<div>
				<img src="<%=sddto.getS_img()%>">
			</div>
			<table>
				<tr>
					<th>조회수</th>
					<td><%=sddto.getS_view()%></td>
					<th style="text-align: center;"><span
						class="material-symbols-rounded" style="color: #FF4900;">favorite</span></th>
					<td><%=sddto.getS_jjim()%></td>
				</tr>
				<tr>
					<th>판매 기간</th>
					<%
					Calendar now = Calendar.getInstance();
					int y = now.get(Calendar.YEAR);

					DateFormat datef = new SimpleDateFormat("yyyy-mm-dd");

					String tm_s = datef.format(sddto.getS_end());
					int tm = Integer.parseInt(tm_s.substring(0, 4));

					if (tm == y + 99) {
					%>
					<td colspan="3"><div>상시 판매</div></td>
					<%
					} else {
					%>
					<td colspan="3"><div
							style="display: flex; justify-content: space-between;"><%=sddto.getS_start()%><span>~</span><%=sddto.getS_end()%></div></td>
					<%
					}
					%>
				</tr>
				<tr>
					<th>판매 방법</th>
					<td colspan="3" class="tradeway">
						<%
						if (sddto.getS_type() == 1) {
						%>
						<div>배송 판매</div> <%
 } else if (sddto.getS_type() == 2) {
 %>
						<div>현장 판매</div> <%
 } else if (sddto.getS_type() == 3) {
 %>
						<div>배송 판매</div>
						<div>현장 판매</div> <%
 }
 %>
					</td>
				</tr>
			</table>

		</div>
	</div>
	<article class="reportbtn" id="scrollH2">
		<input type="button" value="상품에 문제가 있나요?" class="rpbtn"
			onclick="openReport(<%=sellidx%>, <%=m_idx%>)">
	</article>
	<article class="detailnav" id="scrollH3">
		<div class="emptybox"></div>
		<ul class="fbox">
			<li class="btnli btninfo" id="btninfo">상세정보</li>
			<li class="btnli btnrev" id="btnrev">리뷰</li>
		</ul>
	</article>
	<section class="explain" id="explain">
		<article>
			<div class="contentbox"><%=sddto.getS_content()%></div>
		</article>
		<article>
			<div>
				<ul class="fbox fcenter hashli">
					<%
					if (sddto.getS_hash() != null) {
						String hash_arr[] = (sddto.getS_hash()).split("#");
						for (int i = 1; i < hash_arr.length; i++) {
					%>
					<li>#<%=hash_arr[i]%></li>
					<%
					}
					}
					%>
				</ul>
			</div>
		</article>

		<article>
			<form name="likefm"
				<%=isFav == true ? "onsubmit='return false;'" : "onsubmit='window.location.reload();'"%>>
				<div class="profilebox">
					<img src="../img/img1.jpg" class="pfimg pointerC"
						onclick="goprofilepage();">
					<div class="profbox">
						<span class="pointerC proftxt" onclick="goprofilepage()"><%=sddto.getM_nick()%></span>
					</div>
					<input type="hidden" name="s_idx" value="<%=sellidx%>"> <input
						type="hidden" name="m_idx" value="<%=m_idx%>"> <input
						type="hidden" name="favorite" value="1"> <input
						type="submit"
						class="jjimbtn pointerC <%=isFav == true ? "twoheart" : "oneheart"%>"
						class="likesb" value="">
				</div>
			</form>
		</article>

	</section>
	<%@ include file="review.jsp"%>
	<%@ include file="../footer.jsp"%>
</body>

<script>
	function openReport(s_idx, m_idx) {
		window.open('/wishJam/goodsDetail/report.jsp?s_idx='+s_idx+'&m_idx='+m_idx, 'report',
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

	function plusBtn(t,sgidx) {
		var amount = document.getElementsByName(t.name);
		amount[1].value = parseInt(amount[1].value, 10) + 1;
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
		
		var num = t.name.slice(-1);
		makeCartform(num, sgidx,amount[1].value);
	}

	function minusBtn(t,sgidx) {
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
		
		var num = t.name.slice(-1);
		makeCartform(num, sgidx,amount[1].value);
	}
	
	function makeCartform(num, sgidx,amount){
		var ot = document.option_table;
		var optnum = document.option.childElementCount;
		var optbox = document.getElementById("subvalues"+num);
		if(optbox!=null){optbox.remove();}
		
		var div1 = document.createElement("div");
		div1.id="subvalues"+num;
		
			var input1 = document.createElement("input");
			var input2 = document.createElement("input");
			var input3 = document.createElement("input");
			
			input1.setAttribute("type","hidden");
			input2.setAttribute("type","hidden");
			input3.setAttribute("type","hidden");
			
			input1.name="m_idx";
			input2.name="sg_idx";
			input3.name="ct_count";
			
			input1.value="<%=m_idx%>";
			input2.value=sgidx;
			input3.value=amount;
			
			
			div1.append(input1,input2,input3);
			ot.append(div1);
	}
	
	window.addEventListener('click',(e)=>{
		if(e.target.id=='btninfo'){
			window.scrollTo(0,0);
		} else if(e.target.id=='btnrev'){
			var e_height = document.getElementById("explain");
			var sh1=document.getElementById("scrollH1");
			var sh2=document.getElementById("scrollH2");
			var sh3=document.getElementById("scrollH3");
			
			var allheight = e_height.getBoundingClientRect().height+sh1.getBoundingClientRect().height+sh2.getBoundingClientRect().height+sh3.getBoundingClientRect().height;
			window.scrollTo(0,allheight);
		}
	})
	
	function goprofilepage() {
		location.href='/wishJam/mypage/myPage.jsp';
	}
</script>

</html>