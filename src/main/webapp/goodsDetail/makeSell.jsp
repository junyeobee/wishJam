<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.wishJam.category.CategoryDTO"%>
<%@ page import="com.wishJam.detail.DetailDTO"%>

<jsp:useBean id="idao" class="com.wishJam.detail.DetailImgDAO"
	scope="session"></jsp:useBean>
<jsp:useBean id="cdao" class="com.wishJam.detail.ColorDAO"></jsp:useBean>
<jsp:useBean id="cgdao" class="com.wishJam.category.CategoryDAO"
	scope="session"></jsp:useBean>
<jsp:useBean id="sdao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>

<%
int s_idx = sdao.getLastidx();

String[] place = {"연희동","공덕동","신수동","서교동","합정동","망원동"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="/wishJam/goodsDetail/Formake.css">
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<title>Insert title here</title>
<%@ include file="scriptDetail.jsp"%>
</head>
<%@ include file="/header.jsp"%>
<body onmousedown="outClick(event)">
	<section>
		<form name="makeSellfm" action="makeSell_ok.jsp" method="post"
			onsubmit="return checkAllform(event)">
			<input type="hidden" name="s_idx" value="<%=s_idx%>"> <input
				type="hidden" name="m_idx" value="<%=m_idx%>">
			<article class="settings">
				<ul>
					<li class="fbox thumbli">
						<div id="thumb_img" class="thumbs fbox"
							onclick="openImgpop(<%=s_idx%>,this.id)">
							<label>썸네일 이미지 등록</label>
						</div> <span style="font-size: 14px;">지나치게 선정적이거나 폭력적인 이미지 사용은
							지양해 주시길 바랍니다.</span> <input type="hidden" name="s_img">
					</li>
					<li class="cateli">
						<div class="catediv">
							<div class="catetitle">
								카테고리 선택<span class="necess">*</span>
							</div>
							<div class="catebs">
								<label>대분류</label>
								<div class="fbox makedb">
									<select name="c_big" onchange="select_bc(this)">
										<%
										ArrayList<CategoryDTO> blist = cgdao.list_bicC();

										for (int i = 0; i < blist.size(); i++) {
										%>
										<option value="<%=blist.get(i).getC_big()%>"><%=blist.get(i).getC_name()%></option>
										<%
										}
										%>
									</select><span class="material-symbols-rounded catedrop">arrow_drop_down</span>
								</div>
							</div>

							<div class="catebs">
								<label>소분류</label>
								<div class="fbox makedb">
									<%
									ArrayList<CategoryDTO> clist = cgdao.list_C();
									ArrayList<Integer> s_num = cgdao.S_num();

									int ccnt = 0;
									for (int i = 0; i < blist.size(); i++) {
									%>
									<select class="c_small" name="c_small"
										style="display: <%=i == 0 ? "inline-block" : "none"%>"
										onchange="select_cate(this)">
										<%
										for (int j = 0; j < s_num.get(i); j++) {
										%>
										<option id="<%=clist.get(ccnt).getC_hash()%>"
											value=<%=clist.get(ccnt).getC_idx()%>><%=clist.get(ccnt).getC_name()%></option>
										<%
										ccnt++;
										}
										%>
									</select>
									<%
									}
									%><span class="material-symbols-rounded catedrop">arrow_drop_down</span>
								</div>
							</div>
						</div> <input type="hidden" name="c_idx"
						value="<%=clist.get(0).getC_idx()%>">
					<li class="goodstitle fbox"><div>
							제목<span class="necess">*</span>
						</div> <input type="text" class="titleinput" name="s_title"></li>
					<li class="detailinfo fbox"><div class="detailsign">
							상세 설명<span class="necess">*</span>
						</div>
						<div class="editor">
							<div>
								<ul class="txtfunc">
									<li class="fontli"><div class="fbox makefont"><select id="f-size">
											<%
											for (int i = 8; i < 39; i++) {
												if(i==18){%>
												<option selected value="<%=i%>"><%=i%></option>
												<%
												}else{
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
											}}
											%>
									</select><span class="material-symbols-rounded fontdrop">arrow_drop_down</span></div>
									<input class="txtliinput" type="button" class="" value="FS" name="styleFS"
										onclick="styleSelected(this.value)"></li>
									<li><input class="txtliinput" type="button" value="B" name="styleB"
										onclick="styleSelected(this.value)"></li>
									<li><input class="txtliinput" type="button" value="I" name="styleI"
										onclick="styleSelected(this.value)"></li>
									<li><input class="txtliinput" type="button" value="UL" name="styleUL"
										onclick="styleSelected(this.value)"></li>
									<li><input class="txtliinput" type="button" value="C" name="styleC"
										onclick="openColorpicker(this.value)">
										<div class="cPalette" id="cw1" style="display: none;">
											<div class="fbox">
												<%
												int colorr[] = { 255, 255, 255, 200, 50, 125, 0, 150, 255, 60 };
												int colorg[] = { 20, 125, 240, 255, 200, 255, 50, 30, 100, 60 };
												int colorb[] = { 20, 0, 0, 0, 0, 255, 255, 255, 200, 60 };
												int colorl1[] = { 0, 0, 0, 10, 40, 25, 50, 25, 0, 48 };
												int colorl2[] = { 50, 25, 0, 0, 13, 0, 50, 45, 31, 48 };
												int colorl3[] = { 50, 50, 50, 50, 45, 0, 0, 0, 8, 48 };
												int colord1[] = { 70, 50, 50, 50, 20, 30, 0, 40, 20, 30 };
												int colord2[] = { 10, 25, 50, 50, 70, 60, 10, 5, 40, 30 };
												int colord3[] = { 10, 0, 0, 0, 0, 40, 60, 60, 50, 30 };

												for (int j = 0; j < colord1.length; j++) {
												%>
												<ul>
													<%
													for (int i = 2; i > 0; i--) {
													%>
													<li><input type="button" class="psqr"
														style="background-color: <%=cdao.colortoHex(colorr[j] - i * colord1[j], colorg[j] - i * colord2[j], colorb[j] - i * colord3[j])%>;"
														onclick="pickColor(this)"></li>
													<%
													}
													%>
													<%
													for (int i = 0; i < 5; i++) {
													%>
													<li><input type="button" class="psqr"
														style="background-color: <%=cdao.colortoHex(colorr[j] + i * colorl1[j], colorg[j] + i * colorl2[j], colorb[j] + i * colorl3[j])%>;"
														onclick="pickColor(this)"></li>
													<%
													}
													%>

												</ul>
												<%
												}
												%>
											</div>
										</div></li>
									<li><input  class="txtliinput" type="button" value="BC" name="styleBC"
										onclick="openColorpicker(this.value)">
										<div class="cPalette" id="cw2" style="display: none;">
											<div class="fbox">
												<%
												for (int j = 0; j < colord1.length; j++) {
												%>
												<ul>
													<%
													for (int i = 2; i > 0; i--) {
													%>
													<li><input type="button" class="psqr"
														style="background-color: <%=cdao.colortoHex(colorr[j] - i * colord1[j], colorg[j] - i * colord2[j], colorb[j] - i * colord3[j])%>;"
														onclick="pickColor(this)"></li>
													<%
													}
													%>
													<%
													for (int i = 0; i < 5; i++) {
													%>
													<li><input type="button" class="psqr"
														style="background-color: <%=cdao.colortoHex(colorr[j] + i * colorl1[j], colorg[j] + i * colorl2[j], colorb[j] + i * colorl3[j])%>;"
														onclick="pickColor(this)"></li>
													<%
													}
													%>

												</ul>
												<%
												}
												%>
											</div>
										</div></li>
									<li><input id="content_img" class="txtliinput" type="button" value="이미지"
										onclick="openImgpop(<%=s_idx%>,this.id)"></li>
								</ul>
							</div>
							<div class="editbox" onclick="boxclick()">
								<div class="txtbox" style="text-align: left; cursor: text;">
									<span id="txt" contenteditable="true" oninput="TXTtyping()"></span>
								</div>

							</div>
							<input type="hidden" name="s_content" value="">

						</div></li>
					<li class="sellperiod fbox">
						<div class="periodtitle">
							판매 기간<span class="necess">*</span>
						</div>
						<div class="fbox">
							<div class="selectperiod">
								<input type="radio" name="termbtn" value="every"
									onclick="addterm(this.value)" checked><label>상시
									판매</label> <input type="radio" name="termbtn" value="term"
									onclick="addterm(this.value)"><label>기간 판매</label>
							</div>
							<div id="duebox" style="display: none;">
								<div class="fbox fcenter" style="align-items:center;"><div class="maketerm"><select name="s_year" onchange="sellterm()">
									<%
									Calendar now = Calendar.getInstance();
									int y = now.get(Calendar.YEAR);
									int m = now.get(Calendar.MONTH) + 1;
									int d = now.get(Calendar.DATE);

									String ms = "";
									String ds = "";
									if (m < 10) {
										ms = "0" + m;
									} else {
										ms = m + "";
									}

									if (d < 10) {
										ds = "0" + d;
									} else {
										ds = d + "";
									}
									%>
									<option>2024</option>
								</select><span class="material-symbols-rounded termdrop">arrow_drop_down</span></div> <div class="maketerm"><select name="s_month" id="monthselect">
								
									<option selected value="<%=m%>"><%=m%></option>
								</select><span class="material-symbols-rounded termdrop">arrow_drop_down</span></div> <div class="maketerm"><select name="s_date" id="dayselect">
							
									<option selected value="<%=d%>"><%=d%></option>
								</select><span class="material-symbols-rounded termdrop">arrow_drop_down</span></div> ~ <div class="maketerm"><select name="e_year" id="yearselect2" onchange="sellterm()">
									<%
									for (int i = y; i < y + 10; i++) {
										if (i == y) {
									%>
									<option selected value="<%=i < 10 ? ("0" + i) : i%>"><%=i%></option>
									<%
									} else {
									%>
									<option value="<%=i < 10 ? ("0" + i) : i%>"><%=i%></option>
									<%
									}
									}
									%>
								</select><span class="material-symbols-rounded termdrop">arrow_drop_down</span></div><div class="maketerm"><select name="e_month" id="monthselect2"
									onchange="selectMM(this)">
									<%
									for (int i = 1; i <= 12; i++) {
										if (i == m) {
									%>
									<option selected value="<%=i < 10 ? ("0" + i) : i%>"><%=i%></option>
									<%
									} else {
									%>
									<option value="<%=i < 10 ? "0" + i : i%>"><%=i%></option>
									<%
									}
									}
									%>
								</select><span class="material-symbols-rounded termdrop">arrow_drop_down</span></div><div class="maketerm"><select name="e_date" id="dayselectM" onchange="selectD(this)">
									<%
									for (int i = 1; i <= 31; i++) {
										if (i == d + 1) {
									%>
									<option selected value="<%=i < 10 ? "0" + i : i%>"><%=i%></option>
									<%
									} else {
									%>
									<option value="<%=i < 10 ? ("0" + i) : i%>"><%=i%></option>
									<%
									}
									}
									%>
								</select><span class="material-symbols-rounded termdrop">arrow_drop_down</span></div>
							</div></div>
						</div> <input type="hidden" name="s_start" id="s_start"
						value="<%=y + "-" + ms + "-" + ds%>"> <input type="hidden"
						name="s_end" id="s_end"
						value="<%=(y + 99) + "-" + ms + "-" + ds%>">
					</li>
					<li class="sethash">
						<div class="fbox fcenter hashtitlebox">
							<div class="hashtitle">
								해시태그<span class="necess">*</span>
							</div>
							<div class="kwbox fbox" onclick="clickBox()">
								<div class="fbox" id="kw"></div>
								<div class="kweditbox" id="kweditbox" contenteditable="true"
									onkeypress="EnterforInput(event)"></div>
							</div>
						</div>
						<div class="fbox recommbox">
							<div>추천</div>
							<ul class="fbox fcenter" id="recomm">
								<%
								String kw[] = clist.get(0).getC_hash().split("#");
								for (int i = 1; i < kw.length; i++) {
								%>
								<li><input type="button" value="#<%=kw[i]%>"
									onclick="keySelect(this.value)"></li>
								<%
								}
								%>
							</ul>
						</div> <input type="hidden" name="s_hash" value=""> <input
						type="hidden" name="hashkw" value="<%=clist.get(0).getC_hash()%>">
					</li>
					<li class="optionselectbox fbox">
						<article id="optsbox">
							<div class="optionselecttitle">
								옵션 등록<span class="necess">*</span>
							</div>
							<div class="fbox optionselectopt">
								<span>대표 상품 선택</span> <input type="button" value="옵션 추가"
									onclick="addOpt(<%=s_idx%>)">
							</div>
							<div class="fbox optbox">
								<div class="fbox" style="align-items: center;">
									<input type="radio" name="select_main" selected class="main_op"
										onclick="selectMainopt(this)"> <input type="hidden"
										name="sg_main" value="0">
									<div id="option_img1" class="options fbox"
										onclick="openImgpop(<%=s_idx%>,this.id)">
										<label>이미지 등록</label>
									</div>
									<input type="hidden" id="sg_img1" name="sg_img" value="이미지없음">
									<div class="optinfobox">
										<ul class="fbox optinfos">
											<li><div>이름</div> <input type="text" name="sg_name"
												id="op_sg_name1" onchange="getoptInfo(this)"></li>
											<li><div>가격</div> <input type="number" name="sg_price"
												id="op_sg_price1" placeholder="원"
												onchange="getoptInfo(this)"></li>
											<li><div>판매 수량</div> <input type="number"
												name="sg_count" onchange="checkSgCount(this)"></li>
											<li><div>구매 제한</div> <input type="number"
												name="sg_limit" value="0" onchange="checkSgCount(this)"></li>

										</ul>
									</div>
								</div>
								<span class="material-symbols-outlined icons" id="delbtn1"
									onclick="deleteOpt(this)">close</span>
							</div>
						</article>
						<div style="text-align: left; margin-left: 5px; font-size: 15px;">대표
							상품으로 등록된 상품의 가격이 노출됩니다.</div>
					</li>
					<li class="howtradeway">
						<div>
							<div class="optionselecttitle">
								판매 방법<span class="necess">*</span>
							</div>
							<div class="tradecheckbox fbox">
								<div class="tradeselectway">
									<div class="tradelabel">
										<input type="checkbox" id="delivery" name="delivery" value="1"
											onchange="tradeway()">배송
									</div>
									<div class="tradelabel">
										<input type="checkbox" id="place" name="delivery" value="2"
											onclick="addPlace()" onchange="tradeway()">현장 거래
									</div>
									<input type="hidden" name="s_type" value="0">
								</div>
								<div id="addplace">
									<div class="tradewishplace fbox">
										<div>거래 희망 장소</div>
										<div class="maketd fbox">
											<select class="tradeselector" id="whereT"
												onchange="tradeTime()">
												<% for(int i=0; i<place.length;i++){ %>
												<option><%=place[i] %></option>
												
												<% }%>
											</select><span class="material-symbols-rounded tradedrop">arrow_drop_down</span>
										</div>
									</div>
									<div class="tradewishtime fbox">
										<div>거래 가능 시간</div>
										<div class="wishtimeselect fbox">
											<div class="wishtimes fbox">
												<div class="maketd fbox">
													<select class="tradeselector" name="apT"
														onchange="tradeTime()">
														<option value="오전">오전</option>
														<option value="오후">오후</option>
													</select><span class="material-symbols-rounded tradedrop">arrow_drop_down</span>
												</div>
												<div class="maketd fbox">
													<select class="tradeselector" name="whenT"
														onchange="tradeTime()">
														<%
														for (int i = 1; i <= 12; i++) {
														%>
														<option value="<%=i%>"><%=i%></option>
														<%
														}
														%>
													</select><span class="material-symbols-rounded tradedrop">arrow_drop_down</span>
												</div>
												시부터
											</div>
											<div class="wishtimes fbox">
												<div class="maketd fbox">
													<select class="tradeselector" name="apT2"
														oninput="tradeTime()">
														<option value="오전">오전</option>
														<option value="오후">오후</option>
													</select><span class="material-symbols-rounded tradedrop">arrow_drop_down</span>
												</div>
												<div class="maketd fbox">
													<select class="tradeselector" name="whenT2"
														oninput="tradeTime()">
														<%
														for (int i = 1; i <= 12; i++) {
														%>
														<option value="<%=i%>"><%=i%></option>
														<%
														}
														%>
													</select><span class="material-symbols-rounded tradedrop">arrow_drop_down</span>
												</div>
												시까지
											</div>
										</div>
										<input type="hidden" name="s_tradeT" id="s_tradeT" value="">
									</div>
								</div>

							</div>
						</div>
					</li>
					<li class="discntoptions">
						<div class="discntcheck fbox"><div class="discnttitle">상품 할인</div>
						<input type="checkbox" onclick = "addSale(this)"></div>
						<div class="saleboxes" id="saleboxes" style="display: none;">
								<div id="salebox" class="bordbox fbox">
								<div class="fbox">
									<input type="checkbox" name="allSale" onclick="selectThem()">
									<div class="allselect">전체 선택</div></div>
									<ul id="dislist">
										<li>
											<div class="bordbox">
												<ul class="fbox disinfos">
													<li><input type="checkbox" id="dcbox_ck1"
														onclick="selectIt(this)" name="discnt_box"><input
														type="hidden" name="sg_discnt" value="0"></li>
													<li id="op_sg_name1id"></li>
													<li id="op_sg_price1id"></li>
													<li id="op_sg_dcprice1id"></li>
												</ul>
											</div>
										</li>
									</ul>
									<div class="disratebox fbox">
										<div>할인률</div><div class="fbox makedr"><select name="select_discnt" onchange="selectDC(this)">
											<option value="10">10%</option>
											<option value="20">20%</option>
											<option value="30">30%</option>
											<option value="40">40%</option>
											<option value="50">50%</option>
										</select> <input type="hidden" name="s_discnt" value="0">
										<span class="material-symbols-rounded tradedrop">arrow_drop_down</span></div>
									</div>
								</div>
					</div>
			</article>
			<article class="buttonflex fbox">
				<div class="buttonbox">
					<input type="button" value="취소" onclick="window.close();">
					<input type="submit" value="등록하기">
				</div>
			</article>
		</form>
	</section>
</body>
</html>