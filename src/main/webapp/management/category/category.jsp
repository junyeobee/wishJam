<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="com.manage.wishJam.M_CategoryDTO"%>
<jsp:useBean id = "cdao" class = "com.manage.wishJam.M_CartegoryDAO"/>
<%
	int idx = cdao.getCIdx();
%>
<style>
.container {
	background-color: white;
	height: 99%;
    border: 1px solid #ccc;
}
.c_container {
	padding:10px;
	display: flex;
	flex-wrap: wrap;
}
.c_big {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin: 10px;
	cursor: pointer;
	text-align: center;
	position: relative;
}
.c_big img {
	width: 90%;
	height: 90%;
	border-radius: 50%;
	object-fit: cover;
}
.c_name {
	width: 100%;
	margin-top: 5px;
	font-size: 14px;
	color: black;
}
.smallCategory {
	display: none;
    position: absolute;
    top: 400px;
}
.c_small {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin: 10px;
	cursor: pointer;
	text-align: center;
	position: relative;
}
.c_small img {
	width: 90%;
	height: 90%;
	border-radius: 50%;
	object-fit: cover;
}
.topNavLink {
    display: flex;
}
.topNavLink a {
    padding: 10px 20px;
    text-decoration: none;
    color: #333;
    border: 1px solid #ccc;
    border-bottom: none;
    background-color: #f1f1f1;
    margin-right: 5px;
    cursor: pointer;
}
.topNavLink a.active {
    background-color: white;
    font-weight: bold;
    border-top: 2px solid #007bff;
    border-right: 2px solid #ccc;
    border-left: 2px solid #ccc;
    border-bottom: 1px solid white;
}
.topNav {
	border: 1px solid #ccc;
	height:100%;
	padding: 20px;
	margin-top: -1px;
	display: none;
}
.topNav.active {
	display: block;
	background-color:white;
}
.image-upload-container {
	width:100px;
	height:100px;
	border-radius: 50%;
}
#previewImg{
	width: 90%;
	height: 90%;
	border-radius: 50%;
	object-fit: cover;
}
.modal2{
	position: absolute;
    width: 1000px;
    display: none;
    z-index: 1000;
    top: 200;
    left: 300;
}
.modal-top{
	display: flex;
    justify-content: space-between;
    align-items: baseline;
    border-bottom: 1px solid;
    padding: 0 10;
}
.modal-content {
    background-color: #fefefe;
    margin: 15% auto;
    border: 1px solid #888;
    width: 80%;
    max-width: 600px;
    border-radius: 5px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.close {
    color: black;
    float: right;
    font-size: 28px;
    font-weight: bold;
}
.close:hover,
.close:focus {
    color: black;
    text-decoration: none;
    cursor: pointer;
}
.d li{
	list-style: none;
}
.d li input[type=text] {
	width:200px;
}
.d li input[type=text] {
	width:200px;
}
.btnBox{
	position: relative;
	display: flex;
	align-items: end;
	justify-content: flex-end;
}
</style>
<script>
function openSub(id) {
	// 모든 소분류 목록 숨기기
	document.querySelectorAll('.smallCategory').forEach(function(element) {
		element.style.display = 'none';
	});
	
	// 클릭된 대분류에 해당하는 소분류 목록 표시
	const smallCategory = document.getElementById('small_parent_' + id);
	smallCategory.style.display = 'flex';
}
function editSub(idx) {
	window.open("editcategory.jsp?idx="+idx, 'editCategory', 'width=330px,height=290px,top=400px,left=800px');
}
function changeBig(){
	var sel = document.getElementById('bigCategory').value;
	if(sel === ""){
		document.getElementById('small_Category').value = "";
		document.getElementById('small_Category').disabled=true;
	}
	else {
		document.getElementById('small_Category').disabled=false;
	}
}

function chk(){
	if(document.getElementById('small_Category').disabled){
		alert("소분류를 입력해야 합니다.");
		event.preventDefault();
	}
}

function uploadImage(){
	window.open('uploadImage.jsp?idx=<%=idx%>', 'ImageUpload', 'width=400,height=120,top=400px,left=400px');
}

function imgChange() {
    var imgpath = document.getElementById('imagePath').value;
    var previewImg = document.getElementById('previewImg');
    if (previewImg) {
        previewImg.src = imgpath;
    }
}

function setImagePath(value) {
    var input = document.getElementById('imagePath');
    input.value = value;
    imgChange();
}
//imgPath에 값이 들어오면 이벤트처리
document.addEventListener('DOMContentLoaded', (event) => {
    var inputElement = document.getElementById('imagePath');
    inputElement.addEventListener('input', imgChange);
});

function addCategory() {
	document.getElementById('categoryModal').style.display = 'block';
}

function closeModal() {
	document.getElementById('categoryModal').style.display = 'none';
	document.getElementById('previewImg').src = '/wishJam/img/banner/default.jpg';
	document.getElementById('small_Category').value = '';
	document.getElementById('small_Category').disabled=true;
	document.getElementById('hashtags').value = '';
	document.getElementById('bigCategory').selectedIndex = 0;
}

// 클릭 시 모달 닫기
window.onclick = function(event) {
    if (event.target == document.getElementById('categoryModal')) {
        closeModal();
    }
}
</script>
<div class="container">
<div style = "padding : 10px;">
	<h2>카테고리 관리</h2>
	<div class="btnBox">
		<button onclick="addCategory()">카테고리 추가</button>
	</div>
	<div><h3>대분류</h3></div>
	<div class="c_container">
	<%
		ArrayList<M_CategoryDTO> arr = cdao.getBigCategory();
		if (arr != null) {
			for (int i = 0; i < arr.size(); i++) {
				int big = arr.get(i).getC_big();
	%> 
		<div class="c_big">
			<img src="<%= arr.get(i).getC_img() %>" alt="img" onclick="openSub('<%= big %>')"/>
			<span class="c_name"><%= arr.get(i).getC_name() %></span>
		</div>
		<div class="smallCategory" id="small_parent_<%=big%>">
		<div><h3>소분류</h3></div>
			<%
				ArrayList<M_CategoryDTO> arr2 = cdao.getSmallCategory(big);
				if (arr2 != null) {
					for (int j = 0; j < arr2.size(); j++) {
			%>
			<div class="c_small" id="c_small<%= arr2.get(j).getC_idx() %>">
				<img src="<%= arr2.get(j).getC_img() %>" alt="img" onclick="editSub('<%= arr2.get(j).getC_idx() %>')"/>
				<span class="c_name"><%= arr2.get(j).getC_name() %></span>
			</div>
			<%
						}
					}
			%>
		</div>
		<%
				}
			}
		%>
	</div>
	<div id="categoryModal" class="modal2">
		<div class="modal-content">
			<div class="modal-top">
				<p>카테고리 추가</p>
				<span class="close" onclick="closeModal();">&times;</span>
			</div>
			<form action="addCategory.jsp" name = "dd" onsubmit="chk();">
			<div style = "display:flex; justify-content: space-between;">
				<div>
				<input type="hidden" name = "c_idx" value ="<%=idx%>"/>
				<ul class = "d">
				<li>
				<label for="bigCategory">대분류</label>
				<select id="bigCategory" name="bigCategory" onchange="changeBig();">
		        	<option value="">--대분류 선택--</option>
					<%
						if(arr!=null){
							for(M_CategoryDTO dto : arr){
								String cname = dto.getC_name();
								%>
									<option value="<%=dto.getC_big()%>"><%=cname%></option>
								<%
							}
						}
					%>
				</select>
				</li>
				<li>
				<label for="smallCategory">소분류:</label>
				<input type="text" id="small_Category" name="smallCategory" disabled required="required"/>
				</li>
				<li>
				<label for="hashtags">해시태그:</label>
				<input type="text" id="hashtags" name="hashtags" required="required"/>
				</li>
				</ul>
				</div>
				<div class="image-upload-container">
					<label for="imagePath">이미지</label>
				    <img src="/wishJam/img/category/category1.jpg" onclick="uploadImage()" id="previewImg" class="image-preview">
				    <input type="text" id="imagePath" name="imagePath" readonly="readonly" hidden="hidden">
				    <input type="button" onclick="uploadImage()" value="이미지 업로드">
				</div>
				</div>
				<div>
					<input type="submit" value="추가">
				</div>
			</form>
		</div>
	</div>
</div>
</div>