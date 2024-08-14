<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import = "com.manage.wishJam.GradeDTO" %>
<jsp:useBean id = "gdao" class = "com.manage.wishJam.GradeDAO"/>
<link rel="stylesheet" href="/wishJam/css/reports.css">
<%
	String cp_s = request.getParameter("cp");
	if(cp_s==null||cp_s.equals("")){
		cp_s="1";
	}
	int cp = Integer.parseInt(cp_s);
	
	//총 게시물수
	int totalcnt = gdao.getTotalcnt();
	//한번에 보여줄 리스트 수
	int listsize = 10;
	//페이지수
	int pagesize = 5;
	
	//사용자 현재위치
	//int cp=1;
	
	int totalpage = (totalcnt/listsize)+1;
	if(totalcnt%listsize == 0)totalpage--;
	
	int usrgroup=cp/pagesize;
	if(cp%pagesize==0)usrgroup--;
%>
<script>
function deleteData() {
    // 확인 대화 상자 표시
    var confirmDelete = confirm('정말 삭제하시겠습니까?');
    if (confirmDelete) {
    	//bannerTable tbody 선택
        var table = document.getElementById('gradetable').getElementsByTagName('tbody')[0];
        var rows = table.rows;
        var selectedIds = [];

        //체크박스 선택된 행 
        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];
            var checkbox = row.cells[4].getElementsByTagName('input')[0];

            if (checkbox.checked) {
                var idCell = row.cells[0];
                selectedIds.push(idCell.innerText.trim());
            }
        }

        // 선택된 ID가 있는 경우에만 요청 전송
        if (selectedIds.length > 0) {
            var form = document.createElement('form');
            form.method = 'post';
            form.action = 'gradeDelete.jsp';

            // 선택된 ID를 폼에 추가
            for (var i = 0; i < selectedIds.length; i++) {
                var input = document.createElement('input');
                input.type = 'hidden';
                input.name = 'b_idx_' + i;
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
	window.open('gradeIcon.jsp?idx='+i+'', 'ImageUpload', 'width=400,height=200');
}
</script>
<div class="container">
	<div style="padding : 10px">
		<h1>회원등급</h1>
		<form action="grade_ok.jsp" method="post">
			<div class ="toolbar">
				<input type="button" value="추가하기" /> <input type="button" value="삭제하기" />	<input id="editButton" type="button"value="수정하기" />
			</div>
			<table id = "gradetable">
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
					if (arr != null) {
						for (int i = 0; i < arr.size(); i++) {
							GradeDTO dto = arr.get(i);
					%>
						<tr>
							<td><input type="text" name = "g_idx_<%=i%>" value = "<%=dto.getG_idx()%>" readonly="readonly"/></td>
							<td><input type="text" class="g_name" name="g_name_<%=i%>" value="<%=dto.getG_name()%>" readonly="readonly" /></td>
							<td><img src="<%=dto.getG_src() %>" alt="image" width="50px" height="50px" onclick="editIcon('<%=dto.getG_idx() %>');" /></td>
							<td><input type="text" class="g_point" name="g_point_<%=i%>" value="<%=dto.getG_point()%>" readonly="readonly" /></td>
							<td><input type="checkbox" name="chkbox"></td>
						</tr>
					<%
						}
					} else {
					%>
						<tr>
							<td colspan="3"><label>등급을 설정해주세요</label></td>
						</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</form>
	</div>
</div>