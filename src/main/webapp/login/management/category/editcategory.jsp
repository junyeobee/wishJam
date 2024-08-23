<%@page import="java.util.ArrayList"%>
<%@page import="com.wishJam.category.CategoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id = "cdao" class = "com.manage.wishJam.M_CartegoryDAO"/>
<%
	String idx = request.getParameter("idx");
	ArrayList<CategoryDTO> arr = cdao.getBigCategory();
%>

<div id="categoryModal" class="modal2">
	<div class="modal-content">
		<div class="modal-top">
			<p>변경</p>
		</div>
		<form action="addCategory.jsp" name="dd" onsubmit="chk();">
			<div style="display: flex; justify-content: space-between;">
				<div>
					<input type="hidden" name="c_idx" value="<%=idx%>" />
					<ul class="d">
						<li><label for="bigCategory">대분류</label> <select
							id="bigCategory" name="bigCategory" onchange="changeBig();">
								<option value="">--대분류 선택--</option>
								<%
								if (arr != null) {
									for (CategoryDTO dto : arr) {
										String cname = dto.getC_name();
								%>
								<option value="<%=dto.getC_big()%>"><%=cname%></option>
								<%
								}
								}
								%>
						</select></li>
						<li><label for="smallCategory">소분류:</label> <input
							type="text" id="small_Category" name="smallCategory" disabled
							required="required" /></li>
						<li><label for="hashtags">해시태그:</label> <input type="text"
							id="hashtags" name="hashtags" required="required" /></li>
					</ul>
				</div>
				<div class="image-upload-container">
					<label for="imagePath">이미지</label> 
					<img src="/wishJam/img/banner/default.jpg" onclick="uploadImage()" id="previewImg" class="image-preview"> 
					<input type="text" id="imagePath" name="imagePath" readonly="readonly" hidden="hidden"> 
					<input type="button" onclick="uploadImage()" value="이미지 업로드">
				</div>
			</div>
			<div>
				<input type="submit" value="변경하기">
			</div>
		</form>
	</div>
</div>