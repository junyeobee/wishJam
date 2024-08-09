<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.manage.wishJam.BannerDTO"%>
<%@page import="java.util.ArrayList"%>
<link rel="stylesheet" href="/wishJam/css/banner.css" />
<jsp:useBean id="badd" class="com.manage.wishJam.BannerDAO"/>
<script>
    function addRow() {
        var table = document.getElementById('bannerTable').getElementsByTagName('tbody')[0];
        var rowCount = table.rows.length;
        var newRow = table.insertRow(rowCount);

        var cell1 = newRow.insertCell(0);
        cell1.innerHTML = rowCount + 1;

        var cell2 = newRow.insertCell(1);
        cell2.innerHTML = '<input type="text" name="b_name" required="required" />';

        var cell3 = newRow.insertCell(2);
        cell3.innerHTML = '<input type="date" name="b_sdate" required="required" /> ~ <input type="date" name="b_edate" required="required" />';

        var cell4 = newRow.insertCell(3);
        cell4.innerHTML = '<img src="/wishJam/img/banner/null.jpg" alt="Prev">';

        var cell5 = newRow.insertCell(4);
        cell5.innerHTML = '<input type="checkbox" id="chkbox" name="chkbox" />';
    }

    function saveData() {
        var table = document.getElementById('bannerTable').getElementsByTagName('tbody')[0];
        var rows = table.rows;
        var data = [];

        for (var i = 0; i < rows.length; i++) {
            var row = rows[i];
            
            // 각 셀에서 입력 필드를 안전하게 가져오는 코드
            var b_nameInput = row.cells[1].getElementsByTagName('input')[0];
            var b_sdateInput = row.cells[2].getElementsByTagName('input')[0];
            var b_edateInput = row.cells[2].getElementsByTagName('input')[1];

            // 각 입력 필드가 존재하는지 확인하고 값을 추출
            var b_name = b_nameInput ? b_nameInput.value : '';
            var b_sdate = b_sdateInput ? b_sdateInput.value : '';
            var b_edate = b_edateInput ? b_edateInput.value : '';

            // 필드 값이 모두 채워졌는지 확인
            if (b_name && b_sdate && b_edate) {
                data.push({ b_name: b_name, b_sdate: b_sdate, b_edate: b_edate });
            }
        }

        // 폼 데이터를 만들어서 서버에 전송
        var form = document.createElement('form');
        form.method = 'post';
        form.action = 'banner_save.jsp';

        for (var i = 0; i < data.length; i++) {
            var inputName = document.createElement('input');
            inputName.type = 'hidden';
            inputName.name = 'b_name_' + i; // 수정된 이름
            inputName.value = data[i].b_name;

            var inputSDate = document.createElement('input');
            inputSDate.type = 'hidden';
            inputSDate.name = 'b_sdate_' + i; // 수정된 이름
            inputSDate.value = data[i].b_sdate;

            var inputEDate = document.createElement('input');
            inputEDate.type = 'hidden';
            inputEDate.name = 'b_edate_' + i; // 수정된 이름
            inputEDate.value = data[i].b_edate;

            form.appendChild(inputName);
            form.appendChild(inputSDate);
            form.appendChild(inputEDate);
        }

        document.body.appendChild(form);
        form.submit();
    }

</script>
<div class="container">
    <div class="conTop">
        <h2>배너 관리</h2>
        <input type="text" placeholder="검색어를 입력해주세요.">
        <button type="button">검색</button>
    </div>
    <table class="banner-management" id="bannerTable">
        <thead>
            <tr>
                <th width="30px">번호</th>
                <th width="200px">배너명</th>
                <th width="150px">기간</th>
                <th width="180px">미리보기</th>
                <th width="50px">선택</th>
            </tr>
        </thead>
        <tbody>
			<%
				ArrayList<BannerDTO> arr = badd.listBanner();
				if(arr!=null){
					for(BannerDTO dto : arr){
						%>
							<tr>
								<td><%=dto.getB_idx() %></td>
								<td><%=dto.getB_name() %></td>
								<td><%=dto.getB_sdate() %> ~ <%=dto.getB_edate() %></td>
								<td><img src="<%=dto.getB_src() %>" alt="image" /></td>
								<td><input type="checkbox" id="chkbox" name = "chkbox"/></td>
							</tr>
						<%
					}
				}
			%>
        </tbody>
    </table>
    <div>
        <button type="button" onclick="addRow()">추가</button>
        <button type="button" onclick="saveData()">저장</button>
        <button type="submit">선택 삭제</button>
    </div>
</div>
