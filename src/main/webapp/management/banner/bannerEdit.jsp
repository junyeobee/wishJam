<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="com.manage.wishJam.BannerDTO" %>
<jsp:useBean id = "bdao" class = "com.manage.wishJam.BannerDAO"/>
<%
	String idx = request.getParameter("idx");
	if(idx!=null){
		int b_idx = Integer.parseInt(idx);
		BannerDTO bdto = bdao.editBannerForm(b_idx);

    	String msg = "없음";
    	if(!(bdto.getB_link() == null)) msg = bdto.getB_link();
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
.delbtn{
    background-color: #e74a3b;
    border: none;
    width: 80px;
    height: 30px;
    border-radius: 3px;
    color: #EFEFEF;
}
.okbtn{
    background-color: #009000;
    border: none;
    width: 80px;
    height: 30px;
    border-radius: 3px;
    color: #EFEFEF;
}
.btnBox{
    position: relative;
    display: flex;
    justify-content: center;
    margin-top: 30px;
}
/* 추가된 중앙 정렬을 위한 스타일 */
.container {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}
</style>
	<script>
    function imgedit(idx){
    	window.open('uploadImage.jsp?idx='+idx, 'bannerChange', 'width=400,height=200');
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
		<form action="bannerEdit_ok.jsp">
		<input type="hidden" name = "idx" value ="<%=idx%>"/>
		<div class ="container">
			<h3>배너 수정하기</h3>
			<div>
				<label>제목:</label><input type="text" id = "b_name" name = "b_name" value="<%=bdto.getB_name()%>"/>
			</div>
			<div>
				<p style="text-align: center;">이미지</p>
				<img src="<%=bdto.getB_src()%>" alt="<%=idx%>bannerimage" onclick="imgedit('<%=bdto.getB_idx() %>');" id="previewImg" class="image-preview"/>
	               <input type="text" id="imagePath" name="imagePath" readonly="readonly" hidden="hidden">
			</div>
			<div>
				<label>배너 노출 기간</label>
				<input type="date" name = "b_sdate" value="<%=bdto.getB_sdate()%>"/> ~ <input type="date" name = "b_edate" value="<%=bdto.getB_edate()%>"/>
			</div>
			<div>
				<label>공지사항 링크</label>
				<input type="text" value="<%=msg%>"/>
			</div>
			<div class = "btnBox">
				<input class = "delbtn" type="button" value = "취소하기" onclick="window.close();"/> <input class = "okbtn" type="submit" value="수정하기"/>
			</div>
		</div>
		</form>
		<%
	}else{
		%>
		<script>
			window.alert('잘못된 접근입니다.');
			window.location.href='banner.jsp';
		</script>
		<%
	}
%>