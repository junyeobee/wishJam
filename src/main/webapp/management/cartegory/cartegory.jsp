<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="com.wishJam.category.CategoryDTO"%>
<jsp:useBean id = "cdao" class = "com.manage.wishJam.M_CartegoryDAO"/>
<style>
.container {
	background-color: white;
	height: 100%;
}
.c_container {
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
	display: none; /* 기본적으로 숨김 */
	flex-wrap: wrap;
	position: relative;
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
</style>
<script>
function openSub(id) {
	// 모든 소분류 목록 숨기기
	document.querySelectorAll('.smallCategory').forEach(function(element) {
		element.style.display = 'none';
	});
	
	// 클릭된 대분류에 해당하는 소분류 목록 표시
	const smallCategory = document.getElementById('small_parent_' + id);
	smallCategory.style.display = 'block';
}
function editSub(idx) {
	window.location.href = "editcategory.jsp?idx=" + idx;
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
</script>
<div class="container">
	<div class="c_container">
	<%
		ArrayList<CategoryDTO> arr = cdao.getBigCategory();
		if (arr != null) {
			for (int i = 0; i < arr.size(); i++) {
				int big = arr.get(i).getC_big();
	%> 
		<div class="c_big">
			<img src="<%= arr.get(i).getC_img() %>" alt="img" onclick="openSub('<%= big %>')"/>
			<span class="c_name"><%= arr.get(i).getC_name() %></span>
		</div>
		<div class="smallCategory" id="small_parent_<%=big%>">
			<%
				ArrayList<CategoryDTO> arr2 = cdao.getSmallCategory(big);
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
	<button onclick="addCategory()">카테고리 추가</button>
	<div id="categoryForm">
	<h2>카테고리 추가</h2>
	<form action="addCategory.jsp" method="post">
		<label for="bigCategory">대분류</label>
		<select id="bigCategory" name="bigCategory" onchange="changeBig();">
        	<option value="">--대분류 선택--</option>
			<%
				if(arr!=null){
					for(CategoryDTO dto : arr){
						String cname = dto.getC_name();
						%>
							<option value="<%=dto.getC_idx()%>"><%=cname%></option>
						<%
					}
				}
			%>
		</select>
		<label for="smallCategory">소분류:</label>
		<input type="text" id="small_Category" name="smallCategory" disabled/>
		<label for="categoryName">카테고리 이름:</label>
		<input type="text" id="categoryName" name="categoryName" required="required"/>
		<label for="hashtags">해시태그:</label>
		<input type="text" id="hashtags" name="hashtags" required="required"/>
		<button type="submit" onsubmit="chk()">추가</button>
		</form>
	</div>
</div>
