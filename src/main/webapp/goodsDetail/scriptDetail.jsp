<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			var fsize = document.getElementById("f-size");
			var selectsize = fsize.options[fsize.options.selectedIndex].value;
			var st = '<span style="font-size: '+selectsize+'px">' + selected
					+ '</span>';
		} else if (v == 'B') {
			var st = '<span><b>' + selected + '</b></span>';
		} else if (v == 'I') {
			var st = '<span><i>' + selected + '</i></span>';
		} else if (v == 'UL') {
			var st = '<span><u>' + selected + '</u></span>';
		}
		/* else if (v == 'C') {
			var st = '<span style="color: '+pickfc+';">' + selected + '</span>';
		} else if (v == 'BC') {
			var st = '<span style="background-color: pink;">' + selected
					+ '</span>';
		} */

		var ad = arr[0] + st + arr[1];

		content.innerHTML = ad;
	}

	function openColorpicker(v) {
		if (v == 'C') {
			var picker = document.getElementById("cw1");
		} else if (v == 'BC') {
			var picker = document.getElementById("cw2");
		}

		if (picker.style.display == "none") {
			picker.style.display = "block";
		} else {
			picker.style.display = "none";
		}
	}

	function openImgpop(idx, nick) {
		window.open('sellImgUp.jsp?s_idx=' + idx + '&m_nick=' + nick,
				'sellImgUp', 'width=700, height=600');
	}

	function selectThem() {
		var allSale = document.makeSellfm.allSale;
		var saleGoods = document.getElementsByName("sg_discnt");

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
		var dislist = document.getElementById("dislist");
		var cnt = optsbox.childElementCount;

		makeOptbox(cnt);
		makeListbox(cnt);
	}

	function makeListbox(cnt) {
		var dislist = document.getElementById("dislist");
		var li1 = document.createElement("li");
		dislist.append(li1);

		var bordbox = document.createElement("div");
		bordbox.className = "bordbox";
		li1.append(bordbox);

		var ul1 = document.createElement("ul");
		ul1.className = "fbox fcenter";
		bordbox.append(ul1);

		var li2 = document.createElement("li");
		var input1 = document.createElement("input");
		input1.setAttribute("type", "checkbox");
		input1.name = "sg_discnt";
		input1.value = "1";
		input1.setAttribute("onclick", "selectIt(this)");
		li2.append(input1);

		var li3 = document.createElement("li");
		li3.setAttribute("name", "op_sg_name" + cnt);

		var li4 = document.createElement("li");
		li4.setAttribute("name", "op_sg_price" + cnt);

		ul1.append(li2, li3, li4);
	}

	function makeOptbox(cnt) {
		var optbox = document.createElement("div");
		optbox.className = "fbox optbox";

		var div1 = document.createElement("div");
		div1.className = "fbox";
		optbox.append(div1);

		var img1 = document.createElement("img");
		img1.src = "../img/img1.jpg";
		img1.className = "selectimg";
		var div2 = document.createElement("div");
		div1.append(img1, div2);

		var ul1 = document.createElement("ul");
		div2.append(ul1);
		var li1 = document.createElement("li");
		var li2 = document.createElement("li");
		var li3 = document.createElement("li");

		var input1 = document.createElement("input");
		input1.setAttribute("type", "text");
		input1.name = "sg_name";
		input1.id = "op_sg_name" + cnt;
		input1.setAttribute("onchange", "getoptInfo(this)");

		li1.append(document.createTextNode("이름"), input1);

		var input2 = document.createElement("input");
		input2.setAttribute("type", "text");
		input2.name = "sg_price";
		input2.id = "op_sg_price" + cnt;
		input2.setAttribute("onchange", "getoptInfo(this)");

		li2.append(document.createTextNode("가격"), input2, document
				.createTextNode("원"));

		var ul2 = document.createElement("ul");
		ul2.className = "fbox";
		li3.append(ul2);

		var li4 = document.createElement("li");
		var input3 = document.createElement("input");
		input3.setAttribute("type", "text");
		input3.name = "sg_count";

		li4.append(document.createTextNode("판매 수량"), input3);

		var li5 = document.createElement("li");
		var input4 = document.createElement("input");
		input4.setAttribute("type", "text");
		input4.name = "sg_limit";
		input4.setAttribute("value", "0");

		li5.append(document.createTextNode("구매 제한"), input4);

		ul2.append(li4, li5);

		ul1.append(li1, li2, li3);

		var span1 = document.createElement("span");
		span1.className = "material-symbols-outlined icons";
		span1.setAttribute("onclick", "deleteOpt(this)");
		span1.append(document.createTextNode("close"));

		optbox.append(span1);

		var optsbox = document.getElementById("optsbox");
		optsbox.append(optbox);
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
			var kwords = document.makeSellfm.s_hash;
			kwords.value += v;
		}
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
		var shash = document.makeSellfm.s_hash;

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

		if (vapT == vapT2) {
			if (vwhenT > vwhenT2) {
				fm.whenT2.options[fm.whenT.selectedIndex + 1].selected = "true";
			}
		} else if (vapT == "오후" && vapT2 == "오전") {
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
			s_type.value = "3";
		} else if (delivery[0].checked == true && delivery[1].checked == false) {
			s_type.value = "1";
		} else if (delivery[0].checked == false && delivery[1].checked == true) {
			s_type.value = "2";
		} else {
			s_type.value = "0";
		}
	}

	function TXTtyping() {
		var content = document.makeSellfm.s_content;
		var txt = document.getElementById("txt");
		content.value = txt.innerHTML;
	}

	function getoptInfo(t) {
		var cnt = document.getElementById("dislist").childElementCount;

		if ((t.id).indexOf("sg_name")) {
			var nametag = document.getElementsByName(t.id);

			nametag[0].innerText = t.value;
		} else if ((t.id).indexOf("sg_price")) {
			var pricetag = document.getElementsByName(t.id);

			pricetag[0].innerText = t.value;
		}
	}

	function selectIt(t) {
		if (t.checked) {
			t.value = "1";
		} else if (t.checked == false) {
			t.value = "0";
		}
	}

	function clickAllsb() {
		document.makeSellfm.submit();
		document.uploadfm.submit();
	}

	function boxclick() {
		document.getElementById("txt").focus();
	}

	function pickColorforC(t) {
		var selected = document.getSelection().toString();
		var s = document.getSelection();

		var c = t.style.backgroundColor;
		var rgb = c.replace(/[^%,.\d]/g, "").split(",");

		var code = "";
		rgb.forEach(function(str, hex) {
			hex = parseInt(str).toString(16);

			if (hex.length == 1) {
				hex = "0" + hex;
			}

			code += hex + "";
		});

		var content = document.getElementById("txt");
		var arr = (content.innerHTML).split(selected);

		var st = '<span style="color:#'+code+';">' + selected + '</span>';

		var ad = arr[0] + st + arr[1];

		content.innerHTML = ad;
	}
	
	function pickColorforBC(t) {
		var selected = document.getSelection().toString();
		var s = document.getSelection();

		var c = t.style.backgroundColor;
		var rgb = c.replace(/[^%,.\d]/g, "").split(",");

		var code = "";
		rgb.forEach(function(str, hex) {
			hex = parseInt(str).toString(16);

			if (hex.length == 1) {
				hex = "0" + hex;
			}

			code += hex + "";
		});

		var content = document.getElementById("txt");
		var arr = (content.innerHTML).split(selected);

		var st = '<span style="background-color:#'+code+';">' + selected + '</span>';

		var ad = arr[0] + st + arr[1];

		content.innerHTML = ad;
	}
</script>