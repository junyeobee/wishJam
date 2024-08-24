<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.manage.wishJam.BannerDTO"%>
<%@page import="java.util.ArrayList"%>
<link rel="stylesheet" href="/wishJam/css/banner.css" />
<jsp:useBean id="badd" class="com.manage.wishJam.BannerDAO"/>
<%
	int idx = badd.getBIdx()+1;
	String cp_s = request.getParameter("cp");
	if(cp_s==null||cp_s.equals("")){
		cp_s="1";
	}
	int cp = Integer.parseInt(cp_s);
	
	//총 게시물수
	int totalcnt = badd.getTotalcnt();
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
    
    function imgedit(ss){
    	window.open('bannerImgsave.jsp?idx='+ss, 'bannerChange', 'width=400,height=120,top=400px,left=800px');
    }
    function bannerEdit(i){
    	window.open('bannerEdit.jsp?idx='+i, 'gradeIconChange', 'width=800,height=400,top=300px,left=500px');
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
input[type='date']{
	/* 캘린더 아이콘을 클릭해야만 달력이 보이는데 캘린더의 영역을 조절하기위함*/
	position: relative;
	/* 배경에 원하는 아이콘 삽입*/
	background: url('') no-repeat;
	padding-right: 10px;
	/*글자색 변경*/
	color: #858585;                        
}
/*기본으로 제공되는 달력 이모지 display 없애기 기본 값으론 캘린더를 눌러야만 달력이 나왔는데 이 기능도 무력화*/
input[type="date"]::-webkit-clear-button,
input[type="date"]::-webkit-inner-spin-button { 
	display: none;
} 
 
       
/*input date의 날짜를 선택할 때, 캘린더 모양을 클릭해야 설정할 수 있다. 이걸 해제하고 어느곳을 클릭하든 날짜 설정할 수 있도록 변경해*/
input[type='date']::-webkit-calendar-picker-indicator {
    position:absolute;
    /*왼쪽위에 위치시키고 클릭 영역을 부모(input)의 크기만큼 가짐*/
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    /*배경과 글자를 투명하게 하여 기존의 아이콘이 없는 것처럼 보여줌*/
    background: transparent;
    color: transparent;
}
         
input[type='date']::before {
   content: attr(data-placeholder);
   text-align: left;
   display: inline;
}
       
       
/* 유효값이 입력된 경우 before에 있는 것을 없애준다.*/
input[type='date']:valid::before {
    display: none;
}
#b_sdate{
	width:200px;
}
#b_edate{
	width:200px;
}/* Form group spacing */
.form-group {
    margin-bottom: 20px;
}

/* Image upload container */
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
.pagination {
	position:absolute;
	bottom:0px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.pagination-controls {
    display: flex;
}

.pagination-btn {
    background-color: #f8f9fc;
    border: 1px solid #ddd;
    padding: 5px 10px;
    cursor: pointer;
    margin-left: 5px;
}
.delbtn{
	background-color: #e74a3b;
	border: none;
	width: 80px;
	height: 30px;
	border-radius: 3px;
	color: white;
	font-weight:bold
}
.okbtn{
	background-color: #1cc88a;
	border: none;
	width: 80px;
	height: 30px;
	border-radius: 3px;
	color: white;
	font-weight:bold
}
.upform{
	width: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    margin: 0 auto;
}
.form-group{
	margin: 30px;
}
</style>
</head>
<body>
    <div class="container">
        <div class="topNavLink">	<!-- topNavLink에 있는 a링크중 active인 친구가 선택될시에 해당 topNav내용 출력 -->
            <a onclick="openTab(event, 'manage')" class = "active">전체 배너</a>
            <a onclick="openTab(event, 'upload')">배너 업로드</a>
        </div>
        <div id="manage" class="topNav active">	<!-- active클래스가 있다면 display허용 -->
            <div class="conTop">
                <div class="button-area">
                    <button class = "delbtn" type="button" onclick="deleteData()">선택 삭제</button>
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
                        ArrayList<BannerDTO> arr = badd.listBanner(cp,listsize);
                        if(arr!=null){
                            for(BannerDTO dto : arr){
                    %>
                    <tr>
                        <td onclick="bannerEdit(<%=dto.getB_idx()%>);"><%=dto.getB_idx() %></td>
                        <td onclick="bannerEdit(<%=dto.getB_idx()%>);"><%=dto.getB_name() %></td>
                        <td onclick="bannerEdit(<%=dto.getB_idx()%>);"><%=dto.getB_sdate() %> ~ <%=dto.getB_edate() %></td>
                        <td><img src="<%=dto.getB_src() %>" alt="image" onclick="imgedit('<%=dto.getB_idx() %>');"></td>
                        <td><input type="checkbox" name="chkbox"></td>
                    </tr>
                    <%
                            }
                        }
                    %>
			</tbody>
        </table>
        <div class="pagination">
		<div class="pagination-controls">
			<%
				if(usrgroup != 0) {
					%><button class="pagination-btn" onclick="navigateTo('<%=(usrgroup-1)*pagesize+pagesize %>')">Prev</button><%
				}
			%>
			
			<%
				for(int i = usrgroup*pagesize+1; i<=usrgroup*pagesize+pagesize; i++){
					%>
					&nbsp;<button class="pagination-btn" onclick="navigateTo('<%=i%>')"><%=i%></button>&nbsp;
					<%
					if(i==totalpage){
						break;
					}
				}
			%>
			<%
				if(usrgroup != (totalpage/pagesize-(totalpage%pagesize==0?1:0))) {
					%><button class="pagination-btn" onclick="navigateTo('<%=(usrgroup+1)*pagesize+1%>')">Next</button><%
				}
			
			%>
		</div>
	</div>
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
    	    window.location.href = 'banner.jsp?cp=' + page;
    	}
    </script>
	<div id="upload" class="topNav">
	<div class = "upform">
	    <form action="bannerUpload.jsp">
	    	<h2>배너 등록하기</h2>
	    	<input type="hidden" name = "idx" value="<%=idx%>"/>
	        <div class="form-group">
	            <label for="title">배너 제목</label>
	            <input type="text" id="title" name="b_name" required="required" placeholder="배너 관리용 제목">
	        </div>
	        <div class="form-group">
	            <label for="imagePath">배너 이미지</label><br />
	            <div class="image-upload-container">
	                <img src="/wishJam/img/banner/default.jpg" onclick="uploadImage()" id="previewImg" class="image-preview">
	                <input type="text" id="imagePath" name="imagePath" readonly="readonly" hidden="hidden">
	                <button type="button" onclick="uploadImage()">이미지 업로드</button>
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="b_sdate">시작일</label>
	            <input type="date" id="b_sdate" name="b_sdate" required="required"><br />
	            
	            <label for="b_edate">종료일</label>
	            <input type="date" id="b_edate" name="b_edate" required="required">
	        </div>
	        <div class="form-group">
	            <label for="notice">공지사항</label>
	        </div>
	        <div class="form-actions">
	            <input class = "delbtn" type="reset" value="재작성">
	            <input class = "okbtn" type="submit" value="등록하기">
	        </div>
	    </form>
	    </div>
	</div>
</div>