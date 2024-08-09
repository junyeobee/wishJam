<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	int s_idx = 1;
	String g_name = "Gadget";
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
	width: 600px;
}

#uploadImg[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
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
</style>
<script>
	function addSale() {
		var salebtn = document.makeSellfm.addsale;
		var salebox = document.getElementById('salebox');

		if (salebtn.checked) {
			salebox.style.display = "block";
		} else {
			salebox.style.display = "none";
		}

	}

	function addterm(v) {
		var duebox = document.getElementById("duebox");

		var fm = document.makeSellfm;
		var end = document.makeSellfm.s_end;

		if (v == "term") {
			end.value = fm.e_year.options[fm.e_year.selectedIndex].value + "-"
					+ fm.e_month.options[fm.e_month.selectedIndex].value + "-"
					+ fm.e_date.options[fm.e_date.selectedIndex].value;

			duebox.style.display = "block";
		} else if (v == "every") {
			end.value = (parseInt(fm.e_year.options[fm.e_year.selectedIndex].value) + 99)
					+ "-"
					+ fm.e_month.options[fm.e_month.selectedIndex].value
					+ "-"
					+ fm.e_date.options[fm.e_date.selectedIndex - 1].value;

			duebox.style.display = "none";
		}
	}

	function setTerm() {
		var start = document.makeSellfm.s_start;
		var end = document.makeSellfm.s_end;
		nowdate = new Date();
		var y = nowdate.getFullYear();
		var m = nowdate.getMonth() + 1;
		var d = nowdate.getDate();
		if (m < 10) {
			var ms = '0' + m;
		}
		if (d < 10) {
			var ds = '0' + d;
		}
		start.value = y + "-" + ms + "-" + ds;
		end.value = (y + 99) + "-" + ms + "-" + ds;
	}

	function styleSelected(v) {
		var selected = document.getSelection().toString();
		var s = document.getSelection();

		var content = document.getElementById("txt");
		var arr = (content.innerHTML).split(selected);
		if (v == 'FS') {
			var st = '<span style="font-size: 11px">' + selected + '</span>';
		} else if (v == 'B') {
			var st = '<span><b>' + selected + '</b></span>';
		} else if (v == 'I') {
			var st = '<span><i>' + selected + '</i></span>';
		} else if (v == 'UL') {
			var st = '<span><u>' + selected + '</u></span>';
		} else if (v == 'C') {
			var st = '<span style="color: red;">' + selected + '</span>';
		} else if (v == 'BC') {
			var st = '<span style="background-color: pink;">' + selected
					+ '</span>';
		}

		var ad = arr[0] + st + arr[1];

		content.innerHTML = ad;
	}

	function upImage(v) {
		var file = document.getElementById("uploadImg").files[0];
		var reader = new FileReader();

		reader.onload = function(e) {
			var page = document.getElementById("page");
			var content = document.getElementById("txt");

			content.innerHTML += '<div><img class="txtimg" src="'+reader.result+'"></div>';
		}

		reader.readAsDataURL(file);
	}

	function selectThem() {
		var allSale = document.makeSellfm.allSale;
		var saleGoods = document.makeSellfm.saleGoods;

		if (allSale.checked) {
			for (var i = 0; i < saleGoods.length; i++) {
				saleGoods[i].checked = "checked";
			}
		} else {
			for (var i = 0; i < saleGoods.length; i++) {
				saleGoods[i].checked = false;
			}
		}
	}

	function addPlace() {
		var placeCk = document.getElementById("place");
		var placediv = document.getElementById("addplace");

		if (placeCk.checked) {
			placediv.style.display = "block";
		} else {
			placediv.style.display = "none";
		}

		var fm = document.makeSellfm;

		fm.s_trade.value = fm.whereT.options[fm.whereT.selectedIndex].value
				+ "," + fm.apT.options[fm.apT.selectedIndex].value + ","
				+ fm.whenT.options[fm.whenT.selectedIndex].value + ","
				+ fm.apT2.options[fm.apT2.selectedIndex].value + ","
				+ fm.whenT2.options[fm.whenT2.selectedIndex].value;
	}

	function addOpt() {
		var optsbox = document.getElementById("optsbox");

		optsbox.innerHTML += '<div class="fbox optbox" style="justify-content: space-between; border: 1px solid gray;"><div class="fbox"><img src="../img/img1.jpg" class="selectimg"><div><ul><li>이름 <input type="text" name="sg_name"></li><li>가격 <input type="text" name="sg_price">원</li><li><ul class="fbox"><li>판매 수량 <input type="text" name="sg_count"></li><li>구매 제한 <input type="text" name="sg_limit" value="0"></li></ul></li></ul></div></div><span class="material-symbols-outlined icons" onclick="deleteOpt(this)">close</span></div>';
	}

	function deleteOpt(t) {
		t.parentNode.remove();
	}

	function keySelect(v) {
		var kword = document.getElementById("kw");

		if ((kword.innerHTML).indexOf(v) == -1) {
			kword.innerHTML += '<div class="fbox kwbtn"><span class="kword">'
					+ v
					+ '</span> <span class="material-symbols-outlined kwicon" onclick="deletekw(this)">close</span></div>';
		}

		var kwords = document.makeSellfm.s_hash;
		kwords.value += v;
	}

	function clickBox() {
		var kwedit = document.getElementById("kweditbox");

		kwedit.focus();
		kwedit.contentEditable = 'true';
	}

	function EnterforInput(e) {
		var kwedit = document.getElementById("kweditbox");
		var kword = document.getElementById("kw");

		if (e.keyCode == 13) {
			if (kwedit.innerText != '') {
				kword.innerHTML += '<div class="fbox kwbtn"><span class="kword">#'
						+ kwedit.innerText
						+ '</span><span class="material-symbols-outlined kwicon" onclick="deletekw(this)">close</span></div>';

				var kwords = document.makeSellfm.s_hash;
				kwords.value += '#' + kwedit.innerText;

				kwedit.innerHTML = '';
				kwedit.blur();
			} else {
				kwedit.contentEditable = 'false';
			}
		}
	}

	function EnterforBr(e) {
		var kwedit = document.getElementById("kweditbox");
		if (e.keyCode == 13) {
			kwedit.focus();
		}
	}

	function deletekw(t) {
		t.parentNode.remove();
	}

	function selectM(t) {
		var m = parseInt(t.options[t.selectedIndex].value);

		var lastday = 0;
		switch (m) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			lastday = 31;
			break;
		case 2:
			lastday = 29;
			break;
		default:
			lastday = 30;
			break;
		}

		var dayselect = document.getElementById("dayselect");
		dayselect.innerHTML = '';

		for (var i = 1; i <= lastday; i++) {
			if (i < 10) {
				var j = '0' + i;
			}
			dayselect.innerHTML += '<option value='+j+'>' + i + '</option>';
		}

		var fm = document.makeSellfm;
		var start = document.makeSellfm.s_start;
		var end = document.makeSellfm.s_end;

		start.value = fm.s_year.options[fm.s_year.selectedIndex].value + "-"
				+ fm.s_month.options[fm.s_month.selectedIndex].value + "-"
				+ fm.s_date.options[fm.s_date.selectedIndex].value;
		end.value = fm.e_year.options[fm.e_year.selectedIndex].value + "-"
				+ fm.e_month.options[fm.e_month.selectedIndex].value + "-"
				+ fm.e_date.options[fm.e_date.selectedIndex].value;
	}

	function selectMM(t) {
		var m = parseInt(t.options[t.selectedIndex].value);

		var lastday = 0;
		switch (m) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			lastday = 31;
			break;
		case 2:
			lastday = 29;
			break;
		default:
			lastday = 30;
			break;
		}

		var dayselect = document.getElementById("dayselectM");
		dayselect.innerHTML = '';

		for (var i = 1; i <= lastday; i++) {
			if (i < 10) {
				var j = '0' + i;
			}
			dayselect.innerHTML += '<option value='+j+'>' + i + '</option>';
		}

		var oms = document.getElementById("monthselect");
		var om = parseInt(oms.options[oms.selectedIndex].value);
		var nm = parseInt(t.options[t.selectedIndex].value);

		var ods = document.getElementById("dayselect");
		var nds = document.getElementById("dayselectM");
		var od = parseInt(ods.options[ods.selectedIndex].value);

		if (om > nm) {
			window.alert('판매 시작 월 이후 숫자를 선택해주세요.');
			t.options[oms.selectedIndex].selected = true;
			nds.options[ods.selectedIndex + 1].selected = true;
		}

		var fm = document.makeSellfm;
		var start = document.makeSellfm.s_start;
		var end = document.makeSellfm.s_end;

		start.value = fm.s_year.options[fm.s_year.selectedIndex].value + "-"
				+ fm.s_month.options[fm.s_month.selectedIndex].value + "-"
				+ fm.s_date.options[fm.s_date.selectedIndex].value;
		end.value = fm.e_year.options[fm.e_year.selectedIndex].value + "-"
				+ fm.e_month.options[fm.e_month.selectedIndex].value + "-"
				+ fm.e_date.options[fm.e_date.selectedIndex].value;
	}

	function selectD(t) {
		var oms = document.getElementById("monthselect");
		var nms = document.getElementById("monthselect2")
		var om = parseInt(oms.options[oms.selectedIndex].value);
		var nm = parseInt(nms.options[nms.selectedIndex].value);

		var ods = document.getElementById("dayselect");
		var od = parseInt(ods.options[ods.selectedIndex].value);
		var nd = parseInt(t.options[t.selectedIndex].value);

		if (om == nm && od > nd) {
			window.alert('판매 시작 일 이후 숫자를 선택해주세요.');
			t.options[ods.selectedIndex + 1].selected = true;
		}

		var fm = document.makeSellfm;
		var start = document.makeSellfm.s_start;
		var end = document.makeSellfm.s_end;

		start.value = fm.s_year.options[fm.s_year.selectedIndex].value + "-"
				+ fm.s_month.options[fm.s_month.selectedIndex].value + "-"
				+ fm.s_date.options[fm.s_date.selectedIndex].value;
		end.value = fm.e_year.options[fm.e_year.selectedIndex].value + "-"
				+ fm.e_month.options[fm.e_month.selectedIndex].value + "-"
				+ fm.e_date.options[fm.e_date.selectedIndex].value;

	}

	function sellterm() {
		var fm = document.makeSellfm;
		var start = document.makeSellfm.s_start;
		var end = document.makeSellfm.s_end;

		start.value = fm.s_year.options[fm.s_year.selectedIndex].value + "-"
				+ fm.s_month.options[fm.s_month.selectedIndex].value + "-"
				+ fm.s_date.options[fm.s_date.selectedIndex].value;
		end.value = fm.e_year.options[fm.e_year.selectedIndex].value + "-"
				+ fm.e_month.options[fm.e_month.selectedIndex].value + "-"
				+ fm.e_date.options[fm.e_date.selectedIndex].value;
	}

	function tradeTime() {
		var fm = document.makeSellfm;

		var vapT = fm.apT.options[fm.apT.selectedIndex].value;
		var vwhenT = parseInt(fm.whenT.options[fm.whenT.selectedIndex].value);
		var vapT2 = fm.apT2.options[fm.apT2.selectedIndex].value;
		var vwhenT2 = parseInt(fm.whenT2.options[fm.whenT2.selectedIndex].value);
		console.log(vwhenT + "/" + vwhenT2);
		if (vapT == vapT2) {
			if (vwhenT > vwhenT2) {

				window.alert('이후 시간을 선택해주세요.');
				fm.whenT2.options[fm.whenT.selectedIndex + 1].selected = "true";
			}
		} else if (vapT == "오후" && vapT2 == "오전") {
			window.alert('마감 시간이 시작 시간보다 늦습니다.');
			fm.apT2.options[fm.apT.selectedIndex].selected = "true";
		}

		fm.s_trade.value = fm.whereT.options[fm.whereT.selectedIndex].value
				+ "," + fm.apT.options[fm.apT.selectedIndex].value + ","
				+ fm.whenT.options[fm.whenT.selectedIndex].value + ","
				+ fm.apT2.options[fm.apT2.selectedIndex].value + ","
				+ fm.whenT2.options[fm.whenT2.selectedIndex].value;
	}

	function tradeway() {
		var delivery = document.makeSellfm.delivery;
		var s_type = document.makeSellfm.s_type;
		
		if (delivery[0].checked == true && delivery[1].checked == true) {
			s_type.value="3";
		} else if (delivery[0].checked == true && delivery[1].checked == false) {
			s_type.value="1";
		} else if (delivery[0].checked == false && delivery[1].checked == true) {
			s_type.value="2";
		} else {
			s_type.value="0";
		}
	}
	
	function TXTtyping() {
		var content = document.makeSellfm.s_content;
		var txt = document.getElementById("txt");
		content.value=txt.innerHTML;
	}
</script>
</head>
<body>
	<section>
		<h2>게시글 작성</h2>

		<form name="makeSellfm" action="makeSell_ok.jsp">
		<input type="hidden" name="s_idx" value="<%=s_idx %>">
		<input type="hidden" name="m_nick" value="인뿌삐">
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
									<li><input type="button" value="FS"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="B"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="I"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="UL"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="C"
										onclick="styleSelected(this.value)"></li>
									<li><input type="button" value="BC"
										onclick="styleSelected(this.value)"></li>
									<li>
										<!-- <input type="file" id="uploadImg" accept="image/*"
										onChange="upImage(this.value)"> --> <input type="button"
										value="이미지">
									</li>
								</ul>
							</div>
							<div class="editbox">
								<div style="text-align: left; cursor: text;">
									<span id="txt" contenteditable="true" oninput="TXTtyping()"></span>
								</div>
								<input type="hidden" name="s_content" value="">
							</div>
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
								}
								if (d < 10) {
									ds = "0" + d;
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
								<div class="fbox" id="kw">
									<div class="fbox kwbtn">
										<span class="kword">#키워드</span> <span
											class="material-symbols-outlined kwicon"
											onclick="deletekw(this)">close</span>
									</div>
									<div class="fbox kwbtn">
										<span class="kword">#팬시</span> <span
											class="material-symbols-outlined kwicon"
											onclick="deletekw(this)">close</span>
									</div>
								</div>
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
						</div> <input type="text" name="s_hash" value="#키워드#팬시">
					</li>
					<li>
						<article id="optsbox">
							옵션 등록 <input type="button" value="옵션 추가" onclick="addOpt()">
							<div class="fbox optbox"
								style="justify-content: space-between; border: 1px solid gray;">
								<div class="fbox">
									<img src="../img/img1.jpg" class="selectimg">
									<div>
										<ul>
											<li>이름 <input type="text" name="sg_name"></li>
											<li>가격 <input type="text" name="sg_price">원
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
											<li><select name="apT2" onchange="tradeTime()">
													<option value="오전">오전</option>
													<option value="오후">오후</option>
											</select><select name="whenT2" onchange="tradeTime()">
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
									<input type="text" name="s_trade" id="s_trade" value="">
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
									<ul>
										<li><div class="bordbox">
												<ul class="fbox fcenter">
													<li><input type="checkbox" name="sg_discnt" value="1"></li>
													<li>이름</li>
													<li>가격</li>
												</ul>
											</div></li>
										<li><div class="bordbox">
												<ul class="fbox fcenter">
													<li><input type="checkbox" name="sg_discnt" value="2"></li>
													<li>이름</li>
													<li>가격</li>
												</ul>
											</div></li>
										<li>
											<div>
												할인률 <select name="s_discnt">
													<option value="10">10%</option>
													<option value="20">20%</option>
													<option value="30">30%</option>
													<option value="40">40%</option>
													<option value="50">50%</option>
												</select>
											</div>
										</li>
									</ul>
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
				</table>
			</article>
		</form>
	</section>
</body>
</html>