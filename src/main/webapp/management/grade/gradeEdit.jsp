<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="com.manage.wishJam.GradeDTO" %>
<jsp:useBean id = "gdao" class = "com.manage.wishJam.GradeDAO"/>
<%
	String idx = request.getParameter("idx");
	if(idx!=null){
		int g_idx = Integer.parseInt(idx);
		GradeDTO gdto = gdao.editGradeForm(g_idx);
		%>
			<style>
				.image-upload-container {
				    display: flex;
				    flex-direction: column;
				    align-items: center;
				}
				.image-preview {
				    width: 600px;
				    height: 100px;
				    border: 1px solid #ddd;
				    padding: 5px;
				    margin-bottom: 10px;
				    cursor: pointer;
				}
			</style>
			<script>
		    function imgedit(idx){
		    	window.open('uploadImage.jsp?idx='+idx, 'gradeChange', 'width=400,height=200');
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
			</script>
			<form action="gradeEdit_ok.jsp">
			<input type="hidden" name = "idx" value ="<%=idx%>"/>
			<div>
				<div>
					<label>제목:</label><input type="text" id = "g_name" name = "g_name" value="<%=gdto.getG_name()%>"/>
				</div>
				<div>
					<label>이미지</label>
					<img src="<%=gdto.getG_src()%>" alt="<%=idx%>gradeimage" onclick="imgedit('<%=gdto.getG_idx() %>');" id="previewImg" class="image-preview"/>
	                <input type="text" id="imagePath" name="imagePath" readonly="readonly" hidden="hidden">
				</div>
				<div>
					<label>요구포인트</label>
					<input type="number" name = "g_point" value="<%=gdto.getG_point()%>"/>
				</div>
				<div>
					<input type="button" value = "취소하기" onclick="window.close();"/> <input type="submit" value="수정하기"/>
				</div>
			</div>
			</form>
		<%
	}else{
		%>
		<script>
			window.alert('잘못된 접근입니다.');
			window.location.href='grade.jsp';
		</script>
		<%
	}
%>