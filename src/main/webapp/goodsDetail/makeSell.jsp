<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="idao" class="com.wishJam.detail.DetailImgDAO"
	scope="session"></jsp:useBean>

<%
int s_idx = Integer.parseInt(request.getParameter("s_idx"));
String g_name = "Gadget";
String imgsrc = idao.getHomePath() + idao.getEverypath() + "mapjpg.jpg";
String m_nick = "토마토";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<title>Insert title here</title>
<style>
body {
	width: 800px;
	margin: 0 auto;
	text-align: center;
}

.selectimg {
	width: 150px;
	height: 150px;
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

.fcenter {
	justify-content: center;
}

ul {
	text-decoration: none;
	list-style: none;
	padding: 0;
	margin: 0;
}

.txtfunc {
	display: flex;
}

.bordbox {
	border: 1px solid gray;
}

.editbox {
	border: 1px solid gray;
	padding: 15px;
	min-height: 100px;
	text-align: center;
}

.txtimg {
	width: 400px;
	object-fit: cover;
}

.txtimg:hover {
	cursor: pointer;
}

#txt:focus {
	outline: 0;
}

.editor {
	margin: 0 auto;
	width: 800px;
}

.optbox {
	justify-content: space-between;
	border: 1px solid gray;
}

.optbox:focus-within {
	background-color: #ffdbea;
}

<
.material-symbols-outlined {
	font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
}

.icons {
	font-size: 30px;
	color: gray;
	float: left;
}

.icons:hover {
	cursor: pointer;
}

.kwbox {
	width: 300px;
	padding: 3px;
	border: 1px solid black;
	text-align: left;
	height: 24px;
}

.kwbtn {
	padding: 2px;
	font-size: 13px;
	border-radius: 15px;
	cursor: pointer;
	border: 1px solid #D1D1D1;
	align-items: center;
	caret-color: transparent;
}

.kwicon {
	height: 15px;
	display: flex;
	font-size: 15px;
	border-radius: 10px;
	align-items: center;
}

.kwicon:hover {
	background-color: #D1D1D1;
}

.kweditbox:focus {
	outline: 0;
}

.contentImg {
	padding: 5px;
}

#colorWindow {
	position: fixed;
	margin-left: 25px;
	width: 280px;
	height: 190px;
	border-radius: 5px;
	border: 1px solid gray;
	background-color: white;
}

#colorWindow table {
	width: 250px;
	height: 180px;
	margin: 0px auto;
	padding-top: 10px;
}

#colorWindow td {
	border: 1px solid white;
}

#colorWindow td:hover {
	border: 1px solid #E0E0E0;
	box-shadow: 0 0 5px 2px #E0E0E0; 
	border-radius: 3px;
	cursor: pointer;
	
}

.colorsqr {
	width: 20px;
	height: 20px;
	border-radius: 1px;
	margin-right: 20px;
	margin-left: 10px;
}
</style>
<%@ include file="scriptDetail.jsp"%>
</head>
<body>
	<section>
		<h2>게시글 작성</h2>

		<form name="makeSellfm" action="makeSell_ok.jsp">
			<input type="hidden" name="s_idx" value="<%=s_idx%>"> <input
				type="hidden" name="m_nick" value="<%=m_nick%>">
			<article>
				<ul>
					<li>섬네일 <img src="../img/img1.jpg" class="selectimg"></li>
					<li>카테고리 <select name="c_idx">
							<option value="1">팬시</option>
							<option value="2">문구</option>
							<option value="3">액세서리</option>
					</select>
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
									</select> <input type="button" value="FS"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="B"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="I"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="UL"
										onclick="styleSelected(this.value)"></li>
									<li>
										<div id="colorWindow">
											<table>
												<tr>
													<td><div class="fbox">
															<div class="colorsqr" style="background-color: #FF3A3D;"></div>
															<span>빨강</span>
														</div></td>
													<td><div class="fbox">
															<div class="colorsqr" style="background-color: #A74FF5;"></div>
															<span>보라</span>
														</div></td>
												</tr>
												<tr>
													<td><div class="fbox">
															<div class="colorsqr" style="background-color: #0063FF;"></div>
															<span>파랑</span>
														</div></td>
													<td><div class="fbox">
															<div class="colorsqr" style="background-color: #F088D0;"></div>
															<span>분홍</span>
														</div></td>
												</tr>
												<tr>
													<td><div class="fbox">
															<div class="colorsqr" style="background-color: #FFE63E;"></div>
															<span>노랑</span>
														</div></td>
													<td><div class="fbox">
															<div class="colorsqr" style="background-color: #4A9436;"></div>
															<span>초록</span>
														</div></td>
												</tr>
												<tr>
													<td><div class="fbox">
															<div class="colorsqr" style="background-color: black;"></div>
															<span>검정</span>
														</div></td>
													<td><div class="fbox">
															<div class="colorsqr" style="background-color: white; border: 1px solid #CFCFCF;"></div>
															<span>하양</span>
														</div></td>
												</tr>
											</table>
										</div> <input type="button" value="C"
										onclick="styleSelected(this.value)">
									</li>
									<li><input type="button" value="BC"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="이미지"
										onclick="openImgpop(<%=s_idx%>,'<%=m_nick%>')"></li>
								</ul>
							</div>
							<div class="editbox" onclick="boxclick()">
								<div style="text-align: left; cursor: text;">
									<span id="txt" contenteditable="true" onchange="TXTtyping()">
									</span>
								</div>

							</div>
							<input type="text" name="s_content" value="">
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
							</select> <select name="s_month" id="monthselect" onchange="selectM(this)">
								<%
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
								%>
							</select> <select name="s_date" id="dayselect" onchange="sellterm()">
								<%
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
								%>
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
						</div> <input type="text" name="s_start" id="s_start"
						value="<%=y + "-" + ms + "-" + ds%>"> <input type="text"
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
						<div>
							<ul class="fbox fcenter">
								<li>추천</li>
								<li><input type="button" value="#a"
									onclick="keySelect(this.value)"></li>
								<li><input type="button" value="#b"
									onclick="keySelect(this.value)"></li>
								<li><input type="button" value="#c"
									onclick="keySelect(this.value)"></li>
							</ul>
						</div> <input type="hidden" name="s_hash" value="">
					</li>
					<li>
						<article id="optsbox">
							옵션 등록 <input type="button" value="옵션 추가" onclick="addOpt()">
							<div class="fbox optbox">
								<div class="fbox">
									<img src="../img/img1.jpg" class="selectimg">
									<div>
										<ul>
											<li>이름 <input type="text" name="sg_name"
												id="op_sg_name1" onchange="getoptInfo(this)"></li>
											<li>가격 <input type="text" name="sg_price"
												id="op_sg_price1" onchange="getoptInfo(this)">원
											</li>
											<li>
												<ul class="fbox">
													<li>판매 수량 <input type="text" name="sg_count"></li>
													<li>구매 제한 <input type="text" name="sg_limit" value="0"></li>
												</ul>
											</li>
										</ul>
									</div>
								</div>
								<span class="material-symbols-outlined icons"
									onclick="deleteOpt(this)">close</span>
							</div>
						</article>
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
									<input type="hidden" name="s_trade" id="s_trade" value="">
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
													<li><input type="checkbox" name="sg_discnt" value="0"
														onclick="selectIt(this)"></li>
													<li name="op_sg_name1"></li>
													<li name="op_sg_price1"></li>
												</ul>
											</div>
										</li>
									</ul>
									<div>
										할인률 <select name="s_discnt">
											<option value="10">10%</option>
											<option value="20">20%</option>
											<option value="30">30%</option>
											<option value="40">40%</option>
											<option value="50">50%</option>
										</select>
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