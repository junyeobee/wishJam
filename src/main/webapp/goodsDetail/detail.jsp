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
if (sddto == null) {
%>
<script>
			window.alert('존재하지 않거나 삭제된 게시물입니다.');
			location.href='/wishJam/';
		</script>
<%
} else {

ArrayList<S_goodsDTO> sglist = sgdao.viewGoods(sellidx);
ArrayList<String> cates = ddao.getCategoryName(sellidx);
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
		if (m_idx == 0) {
	%>
	<script>
				var logcheck = window.confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?');
				
				if(logcheck){
					location.href='/wishJam/login/login.jsp';
				} else {
					window.alert('찜이 취소되었습니다.');
				}
			</script>
	<%
	} else {
	boolean addf = jdao.addJjim(jjdto);
	boolean incf = jdao.incrementJjim(sellidx);
	%>
	<script>
				window.location.reload();
			</script>
	<%
	}
	}
	%>
	<section class="bodyroll">
		<section class="option">
			<div class="optionblank"></div>
			<div class="option_article">
				<article>
					<form name="option">
						<%
						for (int i = 0; i < sglist.size(); i++) {
						%>
						<div class="fclear oneopt">
							<img class="boximg lfloat" src="<%=sglist.get(i).getSg_img()%>" alt="상품 이미지">
							<div id="sg_idx<%=i%>_name" style="font-size: 20px;"><%=sglist.get(i).getSg_name()!=null?sglist.get(i).getSg_name():"상품 이름"%></div>
							<div class="fbox" style="justify-content: space-evenly;">
								<div class="disbox"
									style="display:<%=sglist.get(i).getSg_discnt() == 1 ? "block" : "none"%>">할인중</div>
								<div class="fbox" style="align-items: center;">
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
							<div class="cals fbox">
								<input type="button" name="sg_idx<%=i%>" class="mbtn" disabled
									onclick="minusBtn(this,<%=sglist.get(i).getSg_idx()%>,<%=sglist.get(i).getSg_limit()%>)">
								<input type="text" name="sg_idx<%=i%>" class="countinput"
									value="0"> <input type="button" name="sg_idx<%=i%>"
									class="pbtn"
									onclick="plusBtn(this,<%=sglist.get(i).getSg_idx()%>,<%=sglist.get(i).getSg_limit()%>)">
							</div>
							<div class="cntbox">
								<div class="sellcnt">
									전체 수량:
									<%=sglist.get(i).getSg_count()%>개
								</div>
								<div class="limcnt">
									1인 구매 제한:
									<%=sglist.get(i).getSg_limit() > 0 ? sglist.get(i).getSg_limit() + "개" : "없음"%></div>
							</div>
							<div class="alertcnt">전체 수량은 처음 등록된 수량입니다.</div>

						</div>
						<%
						}
						%>
					</form>
				</article>
				<article class="fclear buybtn">
					<form name="option_table" action="addCart_ok.jsp"
						onsubmit="return moveCartit();">
						<div id="option_table"></div>
						<div>총 상품 금액</div>
						<div id="totalprice">0원</div>
						<ul class="fbox">
							<li class="btnli"><input type="submit" value="장바구니"></li>
							<li class="btnli"><input type="button" value="구매하기"
								onclick="Buyit()"></li>
						</ul>
						<input type="hidden" name="s_idx" value="<%=sellidx%>">
					</form>
				</article>
			</div>
		</section>
		<div class="headInfo" id="scrollH1">
			<div>
				<div class="titles"><%=sddto.getS_title()!=null?sddto.getS_title():"제목"%></div>
				<div class="catelist fbox">
					<div class="catetitle">카테고리</div>
					<%
						if(cates!=null){
						 for(int i=0; i<cates.size();i++){%>
						<div class="cateone"><%=cates.get(i) %></div>
						<% if(i<cates.size()-1){ %>
						<span class="material-symbols-rounded">chevron_right</span>
					<%}}}%>
				</div>
				<div>
					<img src="<%=sddto.getS_img()%>" alt="썸네일 이미지">
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

						if(sddto.getS_start()!=null && sddto.getS_end()!=null){
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
						}}
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
 }else {
 %>
 <div></div>
 <% }%>
						</td>
					</tr>
					<% if(sddto.getS_type() == 2||sddto.getS_type() ==3){
						String trader[] = sddto.getS_tradeT().split(","); 	
					%>
					<tr>
						<th>판매 정보</th>
						<td colspan="3">
						<Div class="fbox tinfo">
						<div class="tplace"><%=trader[0] %></div>
						<div class="fbox ttimes">
							<div class="ttime">
								<span style="margin-right: 10px;"><%=trader[1] %></span><span><%=trader[2] %>시</span>
							</div>
							~
							<div class="ttime">
								<span style="margin-right: 10px;"><%=trader[3] %></span><span><%=trader[4] %>시</span>
							</div>
						</div></Div>
						</td>
					</tr>
					<% }%>
				</table>

			</div>
		</div>
		<article class="reportbtn fullsize" id="scrollH2">
			<input type="button" value="상품에 문제가 있나요?" class="rpbtn"
				onclick="openReport(<%=sellidx%>, <%=m_idx%>)">
		</article>
		<article class="detailnav fullsize" id="scrollH3">
			<div class="emptybox"></div>
			<ul class="fbox">
				<li class="btnli btninfo" id="btninfo">상세정보</li>
				<li class="btnli btnrev" id="btnrev">리뷰</li>
			</ul>
		</article>
		<section class="explain fullsize" id="explain">
			<article>
				<div class="contentbox"><%=sddto.getS_content()!=null?sddto.getS_content():"게시글 내용"%></div>
			</article>
			<article>
				<div>
					<ul class="fbox fcenter hashli">
						<%
						if (sddto.getS_hash() != null&&sddto.getS_hash().contains("#")) {
							String hash_arr[] = (sddto.getS_hash()).split("#");
							for (int i = 1; i < hash_arr.length; i++) {
						%>
						<li>#<%=hash_arr[i]%></li>
						<%
						}
						}else {
						%>
						<li>#추천 키워드</li>
						<%} %>
					</ul>
				</div>
			</article>

			<article>
				<form name="likefm"
					<%=isFav == true ? "onsubmit='return false;'" : ""%>>
					<div class="profilebox">
						<img src="<%=sddto.getM_img()%>" alt="작성자 이미지" class="pfimg pointerC"
							onclick="goprofilepage();">
						<div class="profbox">
							<span class="pointerC proftxt" onclick="goprofilepage()"><%=sddto.getM_nick()!=null?sddto.getM_nick():"작성자 닉네임"%></span>
						</div>
						<input type="hidden" name="s_idx" value="<%=sellidx%>"> <input
							type="hidden" name="m_idx" value="<%=m_idx%>"> <input
							type="hidden" name="favorite" value="1"> <input
							type="submit"
							class="jjimbtn pointerC <%=isFav == true ? "twoheart" : "oneheart"%> likesb"
							value="">
					</div>
				</form>
			</article>

		</section>
		<%@ include file="review.jsp"%>
	</section>
	<%@ include file="../footer.jsp"%>
</body>

<script>
	function openReport(s_idx, m_idx) {
		window.open('/wishJam/goodsDetail/report.jsp?s_idx='+s_idx+'&m_idx='+m_idx, 'report',
		'width=600, height=700');
	}

	function deleteGd(t) {
		t.parentNode.remove();

		var amount = document.getElementsByName(t.id);
		var idx = t.id.slice(-1);
		var price = parseInt(document.getElementById(t.id + '_p').innerText);
		var hiddens = document.getElementById("subvalues"+idx);
		var mprice = parseInt(amount[1].value) * price;

		var totals = document.getElementById('totalprice');
		totals.innerHTML = parseInt(document.getElementById('totalprice').innerText)
				- mprice + '원';
		amount[1].value = '0';
		var btns = document.getElementsByName("sg_idx"+idx);
		btns[0].disabled=true;
		btns[2].disabled=false;
hiddens.remove();
	}

	function plusBtn(t,sgidx,lcnt) {
		var amount = document.getElementsByName(t.name);
		amount[1].value = parseInt(amount[1].value, 10) + 1;
		var price = parseInt(document.getElementById(t.name + '_p').innerText);

		var lname = document.getElementById(t.name + '_gname');
		var lamount = document.getElementById(t.name + '_amount');
		var lprice = document.getElementById(t.name + '_price');
		var gname = document.getElementById(t.name + '_name');
		
		var btnid = t.name.slice(-1);
		var minusbtn  = document.getElementsByName("sg_idx"+btnid);

		if(lcnt!=0&amount[1].value>lcnt){
			window.alert('1인 제한 수량 이상 구매할 수 없습니다.');
			amount[1].value-=1;
			t.disabled=true;
		}else{
			minusbtn[0].disabled=false;
		if (lname == null) {
			
			document.getElementById("option_table").innerHTML += '<div class="listable fbox"><table><tr><td id="'+t.name+'_gname">'
					+ gname.innerText
					+ '</td><td id="'+ t.name+'_price">'
					+ price
					+ '원</td><td id="'+t.name+'_amount">'
					+ amount[1].value
					+ '개</td></tr></table><span class="material-symbols-outlined kwicon" id="'
					+ t.name + '" onclick="deleteGd(this)" name="forfBuyit">close</span></div>';
		} else if (gname.innerText == lname.innerText) {
			lamount.innerHTML = amount[1].value + '개';
			lprice.innerHTML = price + '원';
		}

		var totals = document.getElementById('totalprice');
		totals.innerHTML = parseInt(document.getElementById('totalprice').innerText)
				+ price + '원';
		
		makeCartform(btnid, sgidx,amount[1].value);}
	}

	function minusBtn(t,sgidx,lcnt) {
		var amount = document.getElementsByName(t.name);

		var btnid = t.name.slice(-1);
		var plusbtn  = document.getElementsByName("sg_idx"+btnid);
		var totals = document.getElementById('totalprice');
		var price = parseInt(document.getElementById(t.name + '_p').innerText);
		var hiddens = document.getElementById("subvalues"+btnid);
		
		if (parseInt(amount[1].value, 10) > 0) {
			amount[1].value = parseInt(amount[1].value, 10) - 1;
			plusbtn[2].disabled=false;
			
			if(amount[1].value==0){
				t.disabled="true";
				totals.innerHTML = parseInt(document.getElementById('totalprice').innerText)
				- price + '원';

				hiddens.remove();
			} else{
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
						+ '" onclick="deleteGd(this)" name="forfBuyit">close</span></div>';
				makeCartform(btnid, sgidx,amount[1].value);
			} else if (gname.innerText == lname.innerText) {
				lamount.innerHTML = amount[1].value + '개';
				lprice.innerHTML = price + '원';
				makeCartform(btnid, sgidx,amount[1].value);
			}
		}
		if (parseInt(amount[1].value, 10) == 0) {
			var tlabel = document.getElementById(t.name);
			tlabel.parentNode.remove();
		}
		}
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
			var e_height = document.getElementById("explain");
			var sh1=document.getElementById("scrollH1");
			var sh2=document.getElementById("scrollH2");
			var sh3=document.getElementById("scrollH3");
			
		if(e.target.id=='btninfo'){
			var infoheight = sh1.getBoundingClientRect().height+sh2.getBoundingClientRect().height+10;
			window.scrollTo(0,infoheight);
		} else if(e.target.id=='btnrev'){

			var allheight = e_height.getBoundingClientRect().height+sh1.getBoundingClientRect().height+sh2.getBoundingClientRect().height+sh3.getBoundingClientRect().height+200;
			window.scrollTo(0,allheight);
		}
	})
	
	function goprofilepage() {
		location.href='/wishJam/mypage/myPage.jsp?ownerIdx=<%=sddto.getM_idx()%>';
	}
	
	function Buyit(){
		
		var tt = document.getElementsByName("forfBuyit");
		var result = document.getElementById("option_table");
		var tl = tt.length;
		
		var midx = <%=m_idx%>;
		if(midx==0){
			var gologin = confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?');
			
			if(gologin){
				location.href='/wishJam/login/login.jsp';
			} else {
				while(result.childElementCount!=0){
					tl-=1;
					deleteGd(tt[tl]);
				}
				
				if(result.childElementCount==0){
					window.alert('구매가 취소되었습니다.');
				} 
			}
		} else {
			window.alert('구매 페이지로 이동합니다.');
			
			var mid = document.option_table.m_idx;
			var sgid = document.option_table.sg_idx;
			var ctn = document.option_table.ct_count;
			var param="";
			if(mid.value!=""){
				param="m_idx="+mid.value+"&sg_idx="+sgid.value+"&ct_count="+ctn.value;
				console.log(mid.value);
			}else{
				for(var i=0; i<mid.length;i++){
					param+="m_idx="+mid[i].value+"&sg_idx="+sgid[i].value+"&ct_count="+ctn[i].value;
					if(i!=mid.length-1){
						param+="&";
					}
					}
				console.log(mid.length);
			}
			
		while(result.childElementCount!=0){
			tl-=1;
			deleteGd(tt[tl]);
		}
		
		location.href='buyit_ok.jsp?'+param;
		}
	}
	
	function moveCartit(){
		var ctcnt = document.getElementsByName("ct_count");
		var midx = <%=m_idx%>;

		 if(midx==0){
			var gologin = confirm('로그인이 필요한 서비스입니다. 로그인 하시겠습니까?');
			
			if(gologin){
				location.href='/wishJam/login/login.jsp';
				return false;
				} else {
					return false;
				}
			} else if(ctcnt.length==0){
			window.alert('장바구니에 담을 상품을 선택해주세요.');
			return false;
		}
		 
	}
</script>

</html>
<%
}
%>