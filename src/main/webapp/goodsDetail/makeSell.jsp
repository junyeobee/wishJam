<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.wishJam.category.CategoryDTO"%>
<%@ page import="com.wishJam.detail.DetailDTO"%>

<jsp:useBean id="idao" class="com.wishJam.detail.DetailImgDAO" scope="session"></jsp:useBean>
<jsp:useBean id="cdao" class="com.wishJam.detail.ColorDAO"></jsp:useBean>
<jsp:useBean id="cgdao" class="com.wishJam.category.CategoryDAO" scope="session"></jsp:useBean>
<jsp:useBean id="sdao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>

<%
int s_idx = sdao.getLastidx();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="/wishJam/goodsDetail/Formake.css">
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<title>Insert title here</title>
<%@ include file="scriptDetail.jsp"%>
</head>
<%@ include file="/header.jsp"%>
<body onmousedown="outClick(event)">
	<section>
		<form name="makeSellfm" action="makeSell_ok.jsp" method="post" onsubmit="return checkAllform(event)">
			<input type="hidden" name="s_idx" value="<%=s_idx%>">
			<input type="hidden" name="m_idx" value="<%=m_idx %>">
			<article class="settings">
				<ul>
					<li class="fbox thumbli">
						<div id="thumb_img" class="thumbs fbox"
							onclick="openImgpop(<%=s_idx%>,this.id)">
							<label>썸네일 이미지 등록</label>
						</div> <span style="font-size: 14px;">지나치게 선정적이거나 폭력적인 이미지 사용은 지양해 주시길 바랍니다.</span> <input
						type="hidden" name="s_img">
					</li>
					<li class="cateli">
					<div class="catediv">
							<div class="catetitle">카테고리 선택<span class="necess">*</span></div>
							<div class="catebs"><label>대분류</label> 
							<div class="fbox makedb"><select name="c_big"
								onchange="select_bc(this)">
								<%
								ArrayList<CategoryDTO> blist = cgdao.list_bicC();

								for (int i = 0; i < blist.size(); i++) {
								%>
								<option value="<%=blist.get(i).getC_big()%>"><%=blist.get(i).getC_name()%></option>
								<%
								}
								%>
							</select><span class="material-symbols-rounded catedrop">arrow_drop_down</span></div></div>
							<div class="catebs"><label>소분류</label><div class="fbox makedb">
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
							%><span class="material-symbols-rounded catedrop">arrow_drop_down</span></div></div>
						</div>
						<input type="hidden" name="c_idx"
						value="<%=clist.get(0).getC_idx()%>">
					<li>제목<input type="text" name="s_title">
					<li>상세 설명
						<div class="editor">
							<div>
								<ul class="txtfunc">
									<li><select id="f-size">
											<%
											for (int i = 8; i < 39; i++) {
											%>
											<option value="<%=i%>"><%=i%></option>
											<%
											}
											%>
									</select> <input type="button" value="FS" name="styleFS"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="B" name="styleB"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="I" name="styleI"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="UL" name="styleUL"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="C" name="styleC"
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
									<li><input type="button" value="BC" name="styleBC"
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
									<li><input id="content_img" type="button" value="이미지"
										onclick="openImgpop(<%=s_idx%>,this.id)"></li>
								</ul>
							</div>
							<div class="editbox" onclick="boxclick()">
								<div class="txtbox" style="text-align: left; cursor: text;">
									<span id="txt" contenteditable="true" oninput="TXTtyping()"></span>
								</div>

							</div>
							<input type="hidden" name="s_content" value="">

						</div>
					</li>
					<li>
						<div>
							<input type="radio" name="termbtn" value="every"
								onclick="addterm(this.value)" checked><label>상시
								판매</label> <input type="radio" name="termbtn" value="term"
								onclick="addterm(this.value)"><label>기간 판매</label>
						</div>
						<div id="duebox" class="fbox fcenter" style="display: none;">
							<select name="s_year" onchange="sellterm()">
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
							</select> <select name="s_month" id="monthselect">
								<%-- <%
								for (int i = 1; i <= 12; i++) {
									if (i == m) {
								%>
								<option selected value="<%=i < 10 ? ("0" + i) : i%>"><%=i%></option>
								<%
								} else {
								%>
								<option value="<%=i < 10 ? ("0" + i) : i%>"><%=i%></option>
								<%
								}
								}
								%> --%>
								<option selected value="<%=m%>"><%=m%></option>
							</select> <select name="s_date" id="dayselect">
								<%-- <%
								for (int i = 1; i <= 31; i++) {
									if (i == d) {
								%>
								<option selected value="<%=i < 10 ? ("0" + i) : i%>"><%=i%></option>
								<%
								} else {
								%>
								<option value="<%=i < 10 ? ("0" + i) : i%>"><%=i%></option>
								<%
								}
								}
								%> --%>
								<option selected value="<%=d%>"><%=d%></option>
							</select> ~ <select name="e_year" onchange="sellterm()">
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
							</select> <select name="e_month" id="monthselect2"
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
							</select> <select name="e_date" id="dayselectM" onchange="selectD(this)">
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
							</select>
						</div> <input type="hidden" name="s_start" id="s_start"
						value="<%=y + "-" + ms + "-" + ds%>"> <input type="hidden"
						name="s_end" id="s_end"
						value="<%=(y + 99) + "-" + ms + "-" + ds%>">
					</li>
					<li>
						<div class="fbox fcenter">
							해시태그
							<div class="kwbox fbox" onclick="clickBox()">
								<div class="fbox" id="kw"></div>
								<div class="kweditbox" id="kweditbox" contenteditable="true"
									onkeypress="EnterforInput(event)"></div>
							</div>
						</div>
						<div class="fbox" style="justify-content: center;">
							<span>추천</span>
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
					<li>
						<article id="optsbox">
							<div class="fbox" style="justify-content: space-between;">
								<span>대표 상품 선택</span><label>옵션 등록</label> <input type="button"
									value="옵션 추가" onclick="addOpt(<%=s_idx%>)">
							</div>
							<div class="fbox optbox">
								<div class="fbox">
									<input type="radio" name="select_main" class="main_op"
										onclick="selectMainopt(this)"> <input type="hidden"
										name="sg_main" value="0">
									<div id="option_img1" class="options fbox"
										onclick="openImgpop(<%=s_idx%>,this.id)">
										<label>이미지 등록</label>
									</div>
									<input type="hidden" id="sg_img1" name="sg_img" value="이미지없음">
									<div>
										<ul>
											<li>이름 <input type="text" name="sg_name"
												id="op_sg_name1" onchange="getoptInfo(this)"></li>
											<li>가격 <input type="number" name="sg_price"
												id="op_sg_price1" onchange="getoptInfo(this)">원
											</li>
											<li>
												<ul class="fbox">
													<li>판매 수량 <input type="number" name="sg_count" onchange="checkSgCount(this)"></li>
													<li>구매 제한 <input type="number" name="sg_limit" value="0" onchange="checkSgCount(this)"></li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
								<span class="material-symbols-outlined icons" id="delbtn1"
									onclick="deleteOpt(this)">close</span>
							</div>
						</article>
						<div style="text-align: left;">대표 상품으로 등록된 상품의 가격이 노출됩니다.</div>
					</li>
					<li>
						<div>
							판매 방법 <input type="checkbox" id="delivery" name="delivery"
								value="1" onchange="tradeway()">배송 <input
								type="checkbox" id="place" name="delivery" value="2"
								onclick="addPlace()" onchange="tradeway()">현장 거래 <input
								type="hidden" name="s_type" value="0">
							<div id="addplace" style="display: none;">
								<div>
									거래 희망 장소
									<div>
										<select id="whereT" onchange="tradeTime()">
											<option>물감동</option>
											<option>붓동</option>
											<option>도화지동</option>
											<option>연필동</option>
										</select>
									</div>
								</div>
								<div>
									거래 가능 시간
									<div>
										<ul>
											<li><select name="apT" onchange="tradeTime()">
													<option value="오전">오전</option>
													<option value="오후">오후</option>
											</select><select name="whenT" onchange="tradeTime()">
													<%
													for (int i = 1; i <= 12; i++) {
													%>
													<option value="<%=i%>"><%=i%></option>
													<%
													}
													%>
											</select>시부터
										</ul>
										<ul>
											<li><select name="apT2" oninput="tradeTime()">
													<option value="오전">오전</option>
													<option value="오후">오후</option>
											</select><select name="whenT2" oninput="tradeTime()">
													<%
													for (int i = 1; i <= 12; i++) {
													%>
													<option value="<%=i%>"><%=i%></option>
													<%
													}
													%>
											</select>시까지
										</ul>
									</div>
									<input type="hidden" name="s_tradeT" id="s_tradeT" value="">
								</div>
							</div>
						</div>
					<li>
						<div>추가 사항</div>
						<ul>
							<li><input type="checkbox" name="addsale"
								onclick="addSale()">할인 기능
								<div id="salebox" style="display: none;" class="bordbox">
									<input type="checkbox" name="allSale" onclick="selectThem()">전체
									선택
									<ul id="dislist">
										<li>
											<div class="bordbox">
												<ul class="fbox fcenter">
													<li><input type="checkbox" id="dcbox_ck1"
														onclick="selectIt(this)" name="discnt_box"><input
														type="hidden" name="sg_discnt" value="0"></li>
													<li name="op_sg_name1"></li>
													<li name="op_sg_price1"></li>
													<li name="op_sg_dcprice1"></li>
												</ul>
											</div>
										</li>
									</ul>
									<div>
										할인률 <select name="select_discnt" onchange="selectDC(this)">
											<option value="10">10%</option>
											<option value="20">20%</option>
											<option value="30">30%</option>
											<option value="40">40%</option>
											<option value="50">50%</option>
										</select> <input type="hidden" name="s_discnt" value="0">
									</div>


								</div></li>
						</ul>
					</li>
				</ul>
			</article>
			<article style="position: fixed; bottom: 0;">
				<table class="fbox fcenter">
					<tr>
						<td><input type="reset" value="취소"></td>
						<td><input type="submit" value="등록"></td>
					</tr>
				</table>
			</article>
		</form>
	</section>
</body>
</html>