<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.wishJam.category.CategoryDTO"%>

<script>
	function outClick(e) {
		var cw1 = document.getElementById("cw1");
		var cw2 = document.getElementById("cw2");

		if (cw1.style.display == "block") {
			if (e.target.className != "psqr") {
				cw1.style.display = "none";
			}
		} else if (cw2.style.display == "block") {
			if (e.target.className != "psqr") {
				cw2.style.display = "none";
			}
		}
	}

	function addSale(t) {
		var salebox = document.getElementById('saleboxes');
		var Dcgoods = document.getElementsByName("discnt_box");
		var dcr = document.makeSellfm.s_discnt;
		var selectdcr = document.makeSellfm.select_discnt;
			
		if (t.checked) {
			salebox.style.display = "block";
			
			getInfoforSale();
			dcr.value = selectdcr.options[selectdcr.selectedIndex].value;
		} else {
			salebox.style.display = "none";
			dcr.value = "0";

			for (var i = 0; i < Dcgoods.length; i++) {
				Dcgoods[i].checked = false;
				document.makeSellfm.allSale.checked = false;
			}
		}

	}
	
	function getInfoforSale(){
		var dbox = document.getElementsByName("discnt_box");
		console.log(dbox.length);
		for(var i=0; i<dbox.length; i++){
		
			var getname = dbox[i].parentElement.nextElementSibling;
			var getprice = getname.nextElementSibling;
			var namelabel = getname.id.substr(0,11);
			var pricelabel = getprice.id.substr(0,12);
			
			console.log(namelabel);
			
			var nametag = document.getElementById(namelabel);
			getname.innerText = nametag.value;
			
			var pricetag = document.getElementById(pricelabel);
			getprice.innerText = pricetag.value;

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

		var ad = arr[0] + st + arr[1];

		content.innerHTML = ad;
		document.makeSellfm.s_content.value = content.innerHTML;
	}

	function openColorpicker(v) {
		if (v == 'C') {
			var picker = document.getElementById("cw1");
			var otherp = document.getElementById("cw2");
		} else if (v == 'BC') {
			var picker = document.getElementById("cw2");
			var otherp = document.getElementById("cw1");
		}

		if (picker.style.display == "none") {
			picker.style.display = "block";
			otherp.style.display = "none";
		} else {
			picker.style.display = "none";
		}
	}

	function openImgpop(idx, tid) {
		if (tid == "content_img") {
			var cnt = document.getElementsByTagName("img").length + 1;
			window.open('sellImgUp.jsp?s_idx=' + idx + '&select_id=' + tid + '&imgcnt=' + cnt, 'sellImgUp',
					'width=400, height=300');
		} else {
			window.open('sellImgUp.jsp?s_idx=' + idx + '&select_id=' + tid, 'sellImgUp',
							'width=400, height=300');
		}
	}

	function selectThem() {
		var allSale = document.makeSellfm.allSale;
		var saleGoods = document.getElementsByName("discnt_box");
		var select_discnt = document.makeSellfm.select_discnt;
		var dcrate = parseInt(select_discnt.options[select_discnt.selectedIndex].value) / 100;

		if (allSale.checked) {
			for (var i = 0; i < saleGoods.length; i++) {
				saleGoods[i].checked = "checked";
				saleGoods[i].nextSibling.value = "1";

				var dcsib = parseInt(saleGoods[i].parentElement.nextElementSibling.nextElementSibling.innerText);
				var dcprice = dcsib - dcsib * dcrate;
				var dcli = saleGoods[i].parentElement.nextElementSibling.nextElementSibling.nextElementSibling;

				var arrow = document.createElement("span");
				arrow.className = "material-symbols-outlined";
				arrow.append(document.createTextNode("trending_flat"));

				saleGoods[i].parentElement.parentElement.insertBefore(arrow,
						dcli);
				dcli.innerHTML = dcprice;
			}

		} else {
			for (var i = 0; i < saleGoods.length; i++) {
				saleGoods[i].checked = false;
				saleGoods[i].nextSibling.value = "0";
				
				var dcli = saleGoods[i].parentElement.nextElementSibling.nextElementSibling.nextElementSibling;
				dcli.nextElementSibling.innerHTML = "";
				dcli.remove();
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

		fm.s_tradeT.value = fm.whereT.options[fm.whereT.selectedIndex].value
				+ "," + fm.apT.options[fm.apT.selectedIndex].value + ","
				+ fm.whenT.options[fm.whenT.selectedIndex].value + ","
				+ fm.apT2.options[fm.apT2.selectedIndex].value + ","
				+ fm.whenT2.options[fm.whenT2.selectedIndex].value;
	}

	function addOpt(sidx) {
		var optsbox = document.getElementById("optsbox");
		var dislist = document.getElementById("dislist");
		var cntid = optsbox.lastElementChild.lastElementChild.id;
		var cnt = parseInt(cntid.slice(-1)) + 1;

		makeOptbox(cnt, sidx);
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
		ul1.className = "fbox disinfos";
		bordbox.append(ul1);

		var li2 = document.createElement("li");
		var input1 = document.createElement("input");
		input1.name = "discnt_box";
		input1.id = "dcbox_ck" + cnt;
		input1.setAttribute("type", "checkbox");
		input1.setAttribute("onclick", "selectIt(this)");
		li2.append(input1);

		var input2 = document.createElement("input");
		input2.setAttribute("type", "hidden");
		input2.name = "sg_discnt";
		input2.value = "0";
		li2.append(input2);

		var li3 = document.createElement("li");
		li3.setAttribute("id", "op_sg_name" + cnt+"id");

		var li4 = document.createElement("li");
		li4.setAttribute("id", "op_sg_price" + cnt+"id");

		var li5 = document.createElement("li");
		li5.setAttribute("id", "op_sg_dcprice" + cnt+"id");

		ul1.append(li2, li3, li4, li5);
	}

	function makeOptbox(cnt, sidx) {
		var optbox = document.createElement("div");
		optbox.className = "fbox optbox";

		var div1 = document.createElement("div");
		div1.className = "fbox";
		div1.setAttribute("style","align-items:center;");
		optbox.append(div1);

		var input6 = document.createElement("input");
		input6.setAttribute("type", "radio");
		input6.name = "select_main";
		input6.className = "main_op";
		input6.setAttribute("onclick", "selectMainopt(this)");

		var input7 = document.createElement("input");
		input7.setAttribute("type", "hidden");
		input7.name = "sg_main";
		input7.value = "0";

		var div3 = document.createElement("div");
		div3.id = "option_img" + cnt;
		div3.className = "options fbox";
		div3.setAttribute("onclick", "openImgpop(" + sidx + ", this.id)");

		var input5 = document.createElement("input");
		input5.setAttribute("type", "hidden");
		input5.name = "sg_img"
		input5.id = "sg_img" + cnt;
		input5.value = "이미지없음";

		var label1 = document.createElement("label");
		label1.append(document.createTextNode("이미지 등록"));

		div3.append(label1);

		var div2 = document.createElement("div");
		div2.className="optinfobox";
		div1.append(input6, input7, div3, input5, div2);

		var ul1 = document.createElement("ul");
		ul1.className="fbox optinfos"
		div2.append(ul1);
		var li1 = document.createElement("li");
		var li2 = document.createElement("li");
		var li3 = document.createElement("li");

		var input1 = document.createElement("input");
		input1.setAttribute("type", "text");
		input1.name = "sg_name";
		input1.id = "op_sg_name" + cnt;
		input1.setAttribute("onchange", "getoptInfo(this)");

		var div4 = document.createElement("div");
		div4.append(document.createTextNode("이름"));
		
		li1.append(div4, input1);

		var input2 = document.createElement("input");
		input2.setAttribute("type", "number");
		input2.name = "sg_price";
		input2.id = "op_sg_price" + cnt;
		input2.setAttribute("onchange", "getoptInfo(this)");
		input2.placeholder="원";

		var div5 = document.createElement("div");
		div5.append(document.createTextNode("가격"));
		
		li2.append(div5, input2);

		var li4 = document.createElement("li");
		var input3 = document.createElement("input");
		input3.setAttribute("type", "number");
		input3.setAttribute("onchange", "checkSgCount(this)");
		input3.name = "sg_count";
		
		var div6 = document.createElement("div");
		div6.append(document.createTextNode("판매 수량"));

		li4.append(div6, input3);

		var li5 = document.createElement("li");
		var input4 = document.createElement("input");
		input4.setAttribute("type", "numer");
		input4.name = "sg_limit";
		input4.setAttribute("value", "0");
		input4.setAttribute("onchange", "checkSgCount(this)");

		var div7 = document.createElement("div");
		div7.append(document.createTextNode("구매 제한"));
		
		li5.append(div7, input4);

		ul1.append(li1, li2,li4, li5);

		var span1 = document.createElement("span");
		span1.className = "material-symbols-outlined icons";
		span1.setAttribute("onclick", "deleteOpt(this)");
		span1.append(document.createTextNode("close"));
		span1.id = "delbtn" + cnt;

		optbox.append(span1);

		var optsbox = document.getElementById("optsbox");
		optsbox.append(optbox);
	}

	function deleteOpt(t) {
		var cnt = document.getElementsByName("select_main").length;

		if (cnt > 1) {
			var num = t.id.slice(-1);
			var totalli = document.getElementById("dcbox_ck" + num).parentElement.parentElement.parentElement.parentElement;

			t.parentElement.remove();
			totalli.remove();
		} else {
			window.alert('최소 1개 이상의 상품을 등록해야 합니다.');
		}
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

		t.parentElement.remove();
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
		
		var nys = document.getElementById("yearselect2");
		var ny = parseInt(nys.options[nys.selectedIndex].value);

		if(ny==2024){
		if (om > nm) {
			window.alert('판매 시작 월 이후 날짜를 선택해주세요.');
			t.options[om-1].selected = true;
			nds.options[od].selected = true;
		}}

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

		var nys = document.getElementById("yearselect2");
		var ny = parseInt(nys.options[nys.selectedIndex].value);

		if(ny==2024){
		if (om == nm && od > nd) {
			window.alert('판매 시작 일 이후 날짜를 선택해주세요.');
			t.options[od].selected = true;
		}}

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

		fm.s_tradeT.value = fm.whereT.options[fm.whereT.selectedIndex].value
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
		if(t.name=="sg_price"){
			if(t.value<10){
				window.alert('100보다 큰 가격을 입력하세요.');
				t.focus();
			}
		}
	}

	function selectIt(t) {
		var dcli = t.parentElement.nextElementSibling.nextElementSibling.nextElementSibling;

		if (t.checked) {
			t.nextSibling.value = "1";

			var select_discnt = document.makeSellfm.select_discnt;
			var dcrate = parseInt(select_discnt.options[select_discnt.selectedIndex].value) / 100;

			var dcsib = parseInt(dcli.previousElementSibling.innerText);
			var dcprice = dcsib - dcsib * dcrate;

			var arrow = document.createElement("span");
			arrow.className = "material-symbols-outlined";
			arrow.append(document.createTextNode("trending_flat"));

			t.parentElement.parentElement.insertBefore(arrow, dcli);
			dcli.innerHTML = dcprice;
		} else if (t.checked == false) {
			t.nextSibling.value = "0";

			dcli.nextElementSibling.innerHTML = "";
			dcli.remove();
		}

	}

	function clickAllsb() {
		document.makeSellfm.submit();
		document.uploadfm.submit();
	}

	function boxclick() {
		document.getElementById("txt").focus();
	}

	function pickColor(t) {

		var s = document.getSelection();

		if (s.isCollapsed == false) {
			var selected = document.getSelection().toString();

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
			var cbox = t.parentElement.parentElement.parentElement.parentElement;

			if (cbox.id == "cw1") {
				var st = '<span style="color:#'+code+';">' + selected
						+ '</span>';
			} else if (cbox.id == "cw2") {
				var st = '<span style="background-color:#'+code+';">'
						+ selected + '</span>';
			}

			var ad = arr[0] + st + arr[1];

			content.innerHTML = ad;
			document.makeSellfm.s_content.value = content.innerHTML;
		}
	}

	function selectDC(t) {
		var dcr = document.makeSellfm.s_discnt;

		dcr.value = t.options[t.selectedIndex].value;
	}

	function selectMainopt(t) {
		var mains = document.makeSellfm.sg_main;

		for (var i = 0; i < mains.length; i++) {
			mains[i].value = "0";
		}

		t.nextSibling.value = "1";
	}

	function select_bc(t) {
		select_b = t.selectedIndex;

		var cs = document.makeSellfm.c_small;
		var catev = document.makeSellfm.c_idx;
		var kwv = document.makeSellfm.hashkw;
		var kwords = cs[select_b].options[cs[select_b].selectedIndex].id;

		for (var i = 0; i < cs.length; i++) {
			cs[i].style.display = "none";
		}

		cs[select_b].style.display = "inline-block";

		catev.value = cs[select_b].options[cs[select_b].selectedIndex].value;
		kwv.value = cs[select_b].options[cs[select_b].selectedIndex].id;

		var ul1 = document.getElementById("recomm");
		while (ul1.firstChild) {
			ul1.removeChild(ul1.firstChild);
		}

		var keys = kwords.split("#");

		for (var i = 1; i < keys.length; i++) {
			makeRecomm(keys[i]);
		}
	}

	function select_cate(t) {
		var catev = document.makeSellfm.c_idx;
		var kwv = document.makeSellfm.hashkw;
		var kwords = t.options[t.selectedIndex].id;

		catev.value = t.options[t.selectedIndex].value;
		kwv.value = kwords;

		var ul1 = document.getElementById("recomm");
		while (ul1.firstChild) {
			ul1.removeChild(ul1.firstChild);
		}

		var keys = kwords.split("#");

		for (var i = 1; i < keys.length; i++) {
			makeRecomm(keys[i]);
		}
	}

	function makeRecomm(k) {
		var ul1 = document.getElementById("recomm");

		var li1 = document.createElement("li");

		var input1 = document.createElement("input");
		input1.setAttribute("type", "button");
		input1.value = "#" + k;
		input1.setAttribute("onclick", "keySelect(this.value)");

		li1.append(input1);
		ul1.append(li1);
	}
	
	function checkSgCount(t){
		if(t.name=="sg_count"){
			var sglimit = document.makeSellfm.sg_limit;
			
			if(t.value<1){
				window.alert('최소 판매수량은 1입니다.');
				t.value=1;
				t.focus();
			} else if(t.value<sglimit.value){
				window.alert('판매수량은 1인 구매 제한 수량보다 적을 수 없습니다.');
				t.value=parseInt(t.value)+1;
				t.focus();
			}
		} else if(t.name=="sg_limit"){
			var sgcount = document.makeSellfm.sg_count;
			
			if(sgcount.value!=""&sgcount.value<t.value){
				window.alert('1인 구매 제한 수량은 판매 수량보다 많을 수 없습니다.');
				t.value-=1;
				t.focus();
			}
		}
	}

	function checkAllform(e){
		var fm = document.makeSellfm;
		
		var opname = fm.sg_name;
		var opprice = fm.sg_price;
		var opcount = fm.sg_count;
		var cnt = document.getElementById("optsbox").childElementCount;
		
			
		if(fm.s_img.value==""){
			window.alert('썸네일 이미지를 등록해주세요.');return false;
		} else if(fm.s_title.value==""){
			window.alert('제목을 등록해주세요.');return false;
		} else if(fm.s_content.value==""){
			window.alert('상품 설명을 등록해주세요.');return false;
		} else if(fm.s_type.value==0){
			window.alert('판매 방법을 선택해주세요.');return false;
		} else {
			if(cnt>3){
			for(var i=0; i<opname.length; i++){
				if(opname[i].value=="" ||opprice[i].value==""||opcount[i].value=="0"){
					window.alert('옵션 상품의 정보를 모두 등록해주세요.');return false;
				}}
			}else {
				if(opname.value=="" ||opprice.value==""||opcount.value=="0"){
					window.alert('옵션 상품의 정보를 모두 등록해주세요.');return false;
				}
			}
		}
	}
</script>