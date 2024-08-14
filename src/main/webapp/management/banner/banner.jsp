<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.manage.wishJam.BannerDTO"%>
<%@page import="java.util.ArrayList"%>
<link rel="stylesheet" href="/wishJam/css/banner.css" />
<jsp:useBean id="badd" class="com.manage.wishJam.BannerDAO"/>
<%
	int idx = badd.getBIdx()+1;
%>

<script>
	function openTab(evt, tabName) {
	    var i, tabcontent, tablinks;

	    // 모든 탭 콘텐츠 숨기기
	    tabcontent = document.getElementsByClassName("tab-content");
	    for (i = 0; i < tabcontent.length; i++) {
	        tabcontent[i].style.display = "none";
	        tabcontent[i].classList.remove("active");
	    }

	    // 모든 탭 링크에서 active 클래스 제거
	    tablinks = document.getElementsByClassName("nav-tabs")[0].getElementsByTagName("a");
	    for (i = 0; i < tablinks.length; i++) {
	        tablinks[i].classList.remove("active");
	    }

	    // 선택된 탭 콘텐츠 표시
	    document.getElementById(tabName).style.display = "block";
	    document.getElementById(tabName).classList.add("active");

	    // 선택된 탭 링크에 active 클래스 추가
	    evt.currentTarget.classList.add("active");
	}
    
    function imgChange(ss){
    	window.open('bannerImgsave.jsp?idx='+ss, 'gradeIconChange', 'width=400,height=200')
    }
    
    function deleteData() {
        // 확인 대화 상자 표시
        var confirmDelete = confirm('정말 삭제하시겠습니까?');
        if (confirmDelete) {
        	//bannerTable tbody 선택
            var table = document.getElementById('bannerTable').getElementsByTagName('tbody')[0];
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
                form.action = 'bannerDelete.jsp';

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
</script>
<style>
	.container {
	    width: 100%;
	    height: calc(100% - 20vh);
	    margin: auto;
	}
	.nav-tabs {
	    display: flex;
	}
	.nav-tabs a {
	    padding: 10px 20px;
	    text-decoration: none;
	    color: #333;
	    border: 1px solid #ccc;
	    border-bottom: none;
	    background-color: #f1f1f1;
	    margin-right: 5px;
	    cursor: pointer;
	}
	.nav-tabs a.active {
	    background-color: white;
	    font-weight: bold;
	    border-top: 2px solid #007bff;
	    border-right: 2px solid #ccc;
	    border-left: 2px solid #ccc;
	    border-bottom: 1px solid white;
	}
	.tab-content {
	    border: 1px solid #ccc;
	    height:100%;
	    padding: 20px;
	    margin-top: -1px;
	    display: none;
	}
	.tab-content.active {
	    display: block;
	    background-color:white;
	}
	.conTop {
	    display: flex;
	    justify-content: space-between;
	    margin-bottom: 20px;
	}
	.search-area input {
		margin-right: 10px;
	}
	.banner-management {
	    width: 100%;
	    border-collapse: collapse;
	}
	.banner-management th, .banner-management td {
	    border: 1px solid #ddd;
	    padding: 8px;
	    text-align: center;
	}
	.banner-management th {
	    background-color: #f2f2f2;
	}
</style>
</head>
<body>
    <div class="container">
        <h2>배너 설정</h2>
        <div class="nav-tabs">	<!-- nav-tab에 있는 a링크중 active인 친구가 선택될시에 해당 tab-content내용 출력 -->
            <a onclick="openTab(event, 'manage')" class = "active">전체 배너</a>
            <a onclick="openTab(event, 'upload')">배너 업로드</a>
            <a onclick="openTab(event, 'settings')">배너 설정</a>
        </div>
        <div id="manage" class="tab-content active">	<!--tab-content, active만 출력 -->
            <div class="conTop">
                <div class="search-area">
                    <input type="text" placeholder="검색">
                    <button type="button">검색</button>
                </div>
                <div class="button-area">
                    <button type="button" onclick="deleteData()">선택 삭제</button>
                </div>
            </div>
            <table class="banner-management" id="bannerTable">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>이름</th>
                        <th>기간</th>
                        <th>미리보기</th>
                        <th>선택</th>
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
                        <td><img src="<%=dto.getB_src() %>" alt="image" onclick="imgChange('<%=dto.getB_idx() %>');"></td>
                        <td><input type="checkbox" name="chkbox"></td>
                    </tr>
                    <%
                            }
                        }
                    %>
			</tbody>
        </table>
    </div>

    <div id="upload" class="tab-content">          
      	<form action="">
      		<div>
      			<label>배너 번호??</label><label><%=idx %></label>
      		</div>
      		
      		<div>
      			<label>제목</label><input type="text" required="required" name = "b_name"/>
      		</div>
			
      		<div>
      			<label>이미지</label>
      			<button>사진 올리기</button>
      		</div>
      		
      		<div>
      			<label>시작 날짜</label>
      			<input type="date" name = "b_sdate"/>
      		</div>
      		<div>
      			<label>종료 날짜</label>
      			<input type="date" name = "b_edate"/>
      		</div>
      		<div>
      			<label>공지사항 링크</label>
      			<button></button>
      		</div>
      		<input type="submit" />
      	</form>
    </div>

    <div id="settings" class="tab-content">
        <h3>배너 설정</h3>
    </div>
</div>