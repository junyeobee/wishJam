<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.manage.wishJam.BannerDTO"%>
<%@page import="java.util.ArrayList"%>
<link rel="stylesheet" href="/wishJam/css/banner.css" />
<jsp:useBean id="badd" class="com.manage.wishJam.BannerDAO"/>
<%
	int idx = badd.getBIdx()+1;
%>
<script>
	//Nav에서 선택한거 출력
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
        <div class="topNavLink">	<!-- topNavLink에 있는 a링크중 active인 친구가 선택될시에 해당 topNav내용 출력 -->
            <a onclick="openTab(event, 'manage')" class = "active">전체 배너</a>
            <a onclick="openTab(event, 'upload')">배너 업로드</a>
            <a onclick="openTab(event, 'settings')">배너 설정</a>
        </div>
        <div id="manage" class="topNav active">	<!-- active클래스가 있다면 display허용 -->
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
	<script>
		//팝업창으로 이미지 받아옵니다
        function uploadImage() {
            window.open('uploadImage.jsp?idx=<%=idx%>', 'ImageUpload', 'width=400,height=200');
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
            imgChange(); // 값 변경 후 바로 imgChange 호출
        }
		//imgPath에 값이 들어오면 이벤트처리
        document.addEventListener('DOMContentLoaded', (event) => {
            var inputElement = document.getElementById('imagePath');
            inputElement.addEventListener('input', imgChange);
        });
    </script>
    <div id="upload" class="topNav">
      	<form action="bannerUpload.jsp">
        <div>
        	<input type="text" name="b_idx" value = "<%=idx%>" readonly="readonly" hidden="hidden">
            <label for="title">배너 제목</label><br />
            <input type="text" id="title" name="title" required="required" placeholder="배너 관리용 제목">
        </div>
        <div>
            <label>배너 이미지</label><br />
            <img src="/wishJam/img/profile/default.jpg" onclick="uploadImage()" id="previewImg">
            <input type="text" id="imagePath" name="imagePath" readonly="readonly" hidden="hidden">
        </div>
        <div class="form-group">
                <label for="date-from">기간</label><br />
                <input type="date" id="b_sdate" name="b_sdate" value="2022-12-02">
                <input type="date" id="b_edate" name="b_edate">
            </div>
        <div>
            <input type="reset" value="재작성"/><input type="submit" value="등록하기"/>
        </div>
      	</form>
    </div>

    <div id="settings" class="topNav">
        <h3>배너 설정</h3>
    </div>
</div>