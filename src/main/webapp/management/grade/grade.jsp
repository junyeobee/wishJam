<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import = "com.manage.wishJam.GradeDTO" %>
<jsp:useBean id = "gdao" class = "com.manage.wishJam.GradeDAO"/>
<%
	int idx = gdao.getGIdx()+1;
	String cp_s = request.getParameter("cp");
	if(cp_s==null||cp_s.equals("")){
		cp_s="1";
	}
	int cp = Integer.parseInt(cp_s);
	int totalcnt = gdao.getTotalcnt();
	int listsize = 10;
	int pagesize = 5;
	
	int totalpage = (totalcnt/listsize)+1;
	if(totalcnt%listsize == 0)totalpage--;
	
	int usrgroup=cp/pagesize;
	if(cp%pagesize==0)usrgroup--;
%>
<script>
function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("topNav");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
        tabcontent[i].classList.remove("active");
    }
    tablinks = document.getElementsByClassName("topNavLink")[0].getElementsByTagName("a");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].classList.remove("active");
    }

    document.getElementById(tabName).style.display = "block";
    document.getElementById(tabName).classList.add("active");

    evt.currentTarget.classList.add("active");
}
function gradeEdit(i){
	window.open('gradeEdit.jsp?idx='+i, 'gradeIconChange', 'width=500,height=400,top=360,left=560');
}
function deleteData() {
    var confirmDelete = confirm('정말 삭제하시겠습니까?');
    if (confirmDelete) {
        var table = document.getElementById('gradetable').getElementsByTagName('tbody')[0];
        var rows = table.rows;
        var selectedIds = [];
        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];
            var checkbox = row.cells[4].getElementsByTagName('input')[0];

            if (checkbox.checked) {
                var idCell = row.cells[0];
                selectedIds.push(idCell.innerText.trim());
            }
        }
        if (selectedIds.length > 0) {
            var form = document.createElement('form');
            form.method = 'post';
            form.action = 'gradeDelete.jsp';
            for (var i = 0; i < selectedIds.length; i++) {
                var input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'g_idx_' + i;
                input.value = selectedIds[i];
                form.appendChild(input);
            }
            document.body.appendChild(form);
            form.submit();
        } else {
            alert('삭제할 항목을 선택해주세요.');
        }
    }
}

function editIcon(i){
	window.open('gradeIcon.jsp?idx='+i+'', 'ImageUpload', 'width=400,height=120,top=400px,left=800px');
}
</script>
<style>
.container {
   position: relative;
   width: 100%;
   height:calc(100% - 10vh);
   margin: auto;
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
.gradetable {
    width: 100%;
    border-collapse: collapse;
}
.gradetable th, .gradetable td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: center;
}
.gradetable th {
    background-color: #f2f2f2;
}
.btnbox{
	display: flex;
    justify-content: end;
    padding: 10px;
}
.btnbox input{
	width: 70px;
    height: 30px;
    background-color: #e74a3b;
    border: none;
    color: white;
    border-radius: 3px;
}
.geditform{
    width: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    margin: 0 auto;
}
.form-group{
	margin:30px;
}
.image-upload-container{
    display: flex;
    flex-direction: column;
    align-items: center;
}
.delbtn{
	background-color: #e74a3b;
    border: none;
    width: 80px;
    height: 30px;
    border-radius: 3px;
    color: white;
    font-weight: bold;
}
.okbtn{
	background-color: #1cc88a;
    border: none;
    width: 80px;
    height: 30px;
    border-radius: 3px;
    color: white;
    font-weight: bold;
}
</style>
<div class="container">
    <div class="topNavLink">	<!-- topNavLink에 있는 a링크중 active인 친구가 선택될시에 해당 topNav내용 출력 -->
        <a onclick="openTab(event, 'grade')" class = "active">전체 등급</a>
        <a onclick="openTab(event, 'gradeAdd')">등급 추가</a>
    </div>
	<div id="grade" class="topNav active" style="padding : 10px">
		<h2>회원등급</h2>
		<form action="grade_ok.jsp" method="post">
		    <div class ="btnbox">
		    	<input type="button" value = "삭제하기" onclick="deleteData();"/>
    		</div>
			<table class = "gradetable" id = "gradetable">
				<thead>
					<tr>
						<th>번호</th>
						<th>등급</th>
						<th>이미지</th>
						<th>요구포인트</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody>
					<%
					ArrayList<GradeDTO> arr = gdao.getGradelist();
					if (arr != null&&arr.size()>0) {
						for (int i = 0; i < arr.size(); i++) {
							GradeDTO dto = arr.get(i);
					%>
						<tr>
							<td onclick="gradeEdit(<%=dto.getG_idx()%>);"><%=dto.getG_idx() %></td>
							<td onclick="gradeEdit(<%=dto.getG_idx()%>);"><%=dto.getG_name()%></td>
							<td><img src="<%=dto.getG_src() %>" alt="image" width="50px" height="50px" onclick="editIcon('<%=dto.getG_idx() %>');" /></td>
							<td><%=dto.getG_point()%></td>
							<td><input type="checkbox" name="chkbox"></td>
						</tr>
					<%
						}
					} else {
					%>
						<tr>
							<td colspan="5"><label>등급을 설정해주세요</label></td>
						</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</form>
	</div>
		<script>
		//팝업창으로 이미지 업로드
        function uploadImage() {
            window.open('uploadImage.jsp?idx=<%=idx%>', 'ImageUpload', 'width=400,height=120,top=400px,left=800px');
        }
		//imgPath의 경로를 previewImg에 기입해 화면에 출력되는 이미지의 링크를 바꿔서 이미지 변경 
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
    	function navigateTo(page) {
    	    window.location.href = 'grade.jsp?cp=' + page;
    	}
    </script>
	<div id = "gradeAdd" class = "topNav" style="padding : 10px">
		<div class="geditform">
		<form action="gradeUpload.jsp">
			<h2>등급 추가하기</h2>
	    	<input type="hidden" name = "idx" value="<%=idx%>"/>
	        <div class="form-group">
	            <label for="title">등급명</label>
	            <input type="text" id="title" name="g_name" required="required" placeholder="등급 이름">
	        </div>
	        <div class="form-group">
	            <label for="imagePath">등급 아이콘</label><br />
	            <div class="image-upload-container">
	                <img src="/wishJam/img/grade/default.jpg" onclick="uploadImage()" id="previewImg" class="image-preview">
	                <input type="text" id="imagePath" name="imagePath" readonly="readonly" hidden="hidden">
	                <button type="button" onclick="uploadImage()">이미지 업로드</button>
	            </div>
	        </div>
	        <div class="form-group">
	            <label>요구 포인트</label>
	            <input type="number" id = "g_point" name = "g_point"/>
	        </div>
	        <div class="form-actions">
	            <input class ="delbtn" type="reset" value="재작성">
	            <input class ="okbtn" type="submit" value="등록하기">
	        </div>
	    </form>
	    </div>
	</div>
</div>