<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="com.manage.wishJam.M_CategoryDTO"%>
<jsp:useBean id = "cdao" class ="com.manage.wishJam.M_CartegoryDAO"/>
<%
	String idx_s = request.getParameter("idx");
	if(idx_s!=null){
		int idx = Integer.parseInt(idx_s);
		M_CategoryDTO cdto = cdao.editCart(idx);
		if(cdto!=null){
%>
<script>
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
function uploadImage(){
	window.open('uploadImage.jsp?idx=<%=idx%>', 'ImageUpload', 'width=400,height=200');
}
</script>
<style>
	/*이미지 사이즈조정*/
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
	.modal-content{
		display: flex;
	    justify-content: center;
	    align-items: center;
	    flex-direction: column;
	}
	.d li{
		text-decoration: none;
		list-style: none;
	}
	.d{
	padding-left: 0;
	}
</style>
<div id="categoryModal" class="modal2">
		<div class="modal-content">
			<h1>수정하기</h1>
			<form action="editcategory_ok.jsp" name = "dd" onsubmit="chk();">
			<div style = "display:flex; justify-content: space-between;">
				<div>
				<input type="hidden" name = "c_idx" value ="<%=idx%>"/>
				<input type="hidden" name = "c_small" value = "<%=cdto.getC_small() %>" />
				<ul class = "d">
				<li>
				<label for="bigCategory">대분류</label>
				<select id="bigCategory" name="bigCategory" onchange="changeBig();">
		        	<option value="">--대분류 선택--</option>
					<%
						ArrayList<M_CategoryDTO> arr = cdao.getBigCategory();
							for(M_CategoryDTO dto : arr){
								String cname = dto.getC_name();
								if(dto.getC_big()==cdto.getC_big()) {
								%>
									<option value="<%=dto.getC_big()%>" selected="selected"><%=cname%></option>
								<%
								}else{
								%>
									<option value="<%=dto.getC_big()%>"><%=cname%></option>
								<%
								}
						}
					%>
				</select>
				</li>
				<li>
				<label for="smallCategory">소분류</label>
				<input type="text" id="small_Category" name="smallCategory" required="required" value="<%=cdto.getC_name()%>"/>
				</li>
				<li>
				<label for="hashtags">해시태그</label>
				<input type="text" id="hashtags" name="hashtags" required="required" value="<%=cdto.getC_hash()%>"/>
				</li>
				</ul>
				</div>
				<div class="image-upload-container">
					<label for="imagePath">이미지</label>
				    <img src="<%=cdto.getC_img() %>" onclick="uploadImage()" id="previewImg" class="image-preview">
				    <input type="text" id="imagePath" name="imagePath" readonly="readonly" hidden="hidden" value = "<%=cdto.getC_img() %>">
				    <input type="button" onclick="uploadImage()" value="이미지 업로드">
				</div>
				</div>
				<div>
					<input type="submit" value="수정하기">
				</div>
			</form>
		</div>
	</div>
	<%}
}
%>