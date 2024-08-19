<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.manage.wishJam.M_ReportDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="com.manage.wishJam.M_ReportDAO"%>
<jsp:useBean id="rdao" class="com.manage.wishJam.M_ReportDAO" />
<link rel="stylesheet" href="/wishJam/css/reports.css">
<%
String cp_s = request.getParameter("cp");
String listType = request.getParameter("listType");
if (listType == null || listType.equals("")) listType = "allList";
if (cp_s == null || cp_s.equals("")) {
    cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

// 총 게시물 수
int totalcnt = rdao.getTotalcnt(listType);
// 한 번에 보여줄 리스트 수
int listsize = 10;
// 페이지 수
int pagesize = 5;

// 사용자 현재 위치
int totalpage = (totalcnt / listsize) + 1;
if (totalcnt % listsize == 0)
    totalpage--;

int usrgroup = cp / pagesize;
if (cp % pagesize == 0)
    usrgroup--;
%>
    <style>
        .modal {
            display: none;
            position: fixed;
            z-index: 1000;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 600px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .modal-content h2 {
            margin-top: 0;
        }
        .gbtn {
            background-color: #4CAF50;
            color: white;
            padding: 8px 13px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin: 5px;
            font-size: 12px;
        }
        .gbtn:hover {
            background-color: #45a049;
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
    </style>
    <script>
        function showdetail(idx) {
            var modal = document.getElementById('report-modal');
            var content = document.getElementById('modal-content');
            var allReports = document.querySelectorAll('.detaildata');
            var selectedReport;
            allReports.forEach(function(report) {
                if (report.dataset.idx === idx) {
                    selectedReport = report;
                }
            });
            if (selectedReport) {
                var s_idx = selectedReport.querySelector('.s_idx').textContent.trim();
                content.innerHTML = selectedReport.innerHTML;
                modal.style.display = 'block';
            }
        }

        function closeModal() {
            var modal = document.getElementById('report-modal');
            modal.style.display = 'none';
        }

        function pagemove(page,listType) {
            window.location.href = 'reports.jsp?cp=' + page + '&listType=' + listType;
        }

        function doban(rp_idx, s_idx){
        	window.location.href = 'reports_ok.jsp?rp_idx='+rp_idx+'&s_idx='+s_idx;
        }
        
        function openTab(evt, tabName) {
            var i, tabcontent, tablinks;
            
            // 모든 탭 콘텐츠를 숨김
            tabcontent = document.getElementsByClassName("topNav");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
                tabcontent[i].classList.remove("active");
            }

            // 모든 탭 링크에서 active 클래스 제거
            tablinks = document.getElementsByClassName("topNavLink")[0].getElementsByTagName("a");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].classList.remove("active");
            }

            // 선택된 탭 콘텐츠 표시
            document.getElementById(tabName).style.display = "block";
            document.getElementById(tabName).classList.add("active");

            // 선택된 탭 링크에 active 클래스 추가
            evt.currentTarget.classList.add("active");
            
            // 페이지 이동 시 listType 파라미터 추가
            var currentPage = document.querySelector('.pagination-controls .pagination-btn.active');
            var page = currentPage ? currentPage.innerText : 1; // 현재 페이지 번호 가져오기

            window.location.href = 'reports.jsp?cp=' + page + '&listType=' + tabName;
        }
    </script>
</head>
<body>
    <div class="container">
    <div class="topNavLink">	<!-- topNavLink에 있는 a링크중 active인 친구가 선택될시에 해당 topNav내용 출력 -->
        <a onclick="openTab(event, 'allList')" class="<%= listType == null || listType.equals("allList") ? "active" : "" %>">전체 리스트</a>
        <a onclick="openTab(event, 'compList')" class="<%= "compList".equals(listType) ? "active" : "" %>">완료된 항목</a>
        <a onclick="openTab(event, 'incompList')" class="<%= "incompList".equals(listType) ? "active" : "" %>">미완료된 항목</a>
    </div>
        <div id="allList" class="topNav <%= "allList".equals(listType) ? "active" : "" %>" style="padding:10px margin-top : 10px">
            <table>
                <thead>
                    <tr>
                        <th>신고번호</th>
                        <th>게시글번호</th>
                        <th>신고내용</th>
                        <th>판매자</th>
                        <th>신고자</th>
                        <th>상세확인</th>
                    </tr>
                </thead>
                <tbody id="report-list">
                    <%
                    ArrayList<M_ReportDTO> arr = rdao.allReports(cp, listsize);
                    if (arr != null) {
                        for (M_ReportDTO dto : arr) {
                    %>
                    <tr>
                        <td><%=dto.getRp_idx()%></td>
                        <td><%=dto.getS_idx()%></td>
                        <td><%=dto.getRp_reason()%></td>
                        <td><%=dto.getReported_nick()%></td>
                        <td><%=dto.getReporter_nick()%></td>
                        <td>
                            <button class="Cbtn" onclick="showdetail('<%=dto.getRp_idx()%>')">변경</button>
                            <div class="detaildata" data-idx="<%=dto.getRp_idx()%>" style="display:none;">
                            	<h3>상세보기</h3><button class="gbtn" onclick="doban('<%=dto.getRp_idx() %>','<%=dto.getS_idx() %>');" style="float:right;">죽이기</button>
                                <p class="s_idx">ID: <%=dto.getRp_idx()%></p>
                                <p>판매자: <%=dto.getReported_nick()%></p>
                                <p>신고자: <%=dto.getReporter_nick()%></p>
                                <p>신고 사유</p>
                                <div>
                                	<p><%=dto.getRp_reason()%></p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    	
                    %>
                    <tr>
                        <td colspan="7">없음</td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
            <div class="pagination">
                <span>Showing <%=(totalcnt / listsize) >= cp ? cp * listsize : totalcnt%>
                    to <%=totalcnt%> of <%=cp%> entries
                </span>
                <div class="pagination-controls">
                    <%
                    if (usrgroup != 0) {
                    %><button class="pagination-btn"
                        onclick="pagemove('<%=(usrgroup - 1) * pagesize + pagesize%>','allList')">Prev</button>
                    <%
                    }
                    %>
                    <%
                    for (int i = usrgroup * pagesize + 1; i <= usrgroup * pagesize + pagesize; i++) {
                    %>
                    &nbsp;
                    <button class="pagination-btn" onclick="pagemove('<%=i%>','allList')"><%=i%></button>
                    &nbsp;
                    <%
	                    if (i == totalpage) {
	                            break;
	                        }
	                    }
                    if (usrgroup != (totalpage / pagesize - (totalpage % pagesize == 0 ? 1 : 0))) {
                    %><button class="pagination-btn"
                        onclick="pagemove('<%=(usrgroup + 1) * pagesize + 1%>','allList')">Next</button>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>
        <div id="compList" class="topNav <%= "compList".equals(listType) ? "active" : "" %>" style="padding:10px margin-top : 10px">
            <table>
                <thead>
                    <tr>
                        <th>신고번호</th>
                        <th>게시글번호</th>
                        <th>신고내용</th>
                        <th>판매자</th>
                        <th>신고자</th>
                        <th>상세확인</th>
                    </tr>
                </thead>
                <tbody id="report-list">
                    <%
                    ArrayList<M_ReportDTO> arr2 = rdao.compReports(cp, listsize);
                    if (arr2 != null) {
                        for (M_ReportDTO dto : arr2) {
                    %>
                    <tr>
                        <td><%=dto.getRp_idx()%></td>
                        <td><%=dto.getS_idx()%></td>
                        <td><%=dto.getRp_reason()%></td>
                        <td><%=dto.getReported_nick()%></td>
                        <td><%=dto.getReporter_nick()%></td>
                        <td>
                            <button class="Cbtn" onclick="showdetail('<%=dto.getRp_idx()%>')">변경</button>
                            <div class="detaildata" data-idx="<%=dto.getRp_idx()%>" style="display:none;">
                            	<h3>상세보기</h3><button class="gbtn" onclick="doban('<%=dto.getRp_idx() %>','<%=dto.getS_idx() %>');" style="float:right;">죽이기</button>
                                <p class="s_idx">ID: <%=dto.getRp_idx()%></p>
                                <p>판매자: <%=dto.getReported_nick()%></p>
                                <p>신고자: <%=dto.getReporter_nick()%></p>
                                <p>신고 사유</p>
                                <div>
                                	<p><%=dto.getRp_reason()%></p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7">없음</td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
            <div class="pagination">
                <span>Showing <%=(totalcnt / listsize) >= cp ? cp * listsize : totalcnt%>
                    to <%=totalcnt%> of <%=cp%> entries
                </span>
                <div class="pagination-controls">
                    <%
                    if (usrgroup != 0) {
                    %><button class="pagination-btn"
                        onclick="pagemove('<%=(usrgroup - 1) * pagesize + pagesize%>' ,'compList')">Prev</button>
                    <%
                    }
                    %>
                    <%
                    for (int i = usrgroup * pagesize + 1; i <= usrgroup * pagesize + pagesize; i++) {
                    %>
                    &nbsp;
                    <button class="pagination-btn" onclick="pagemove('<%=i%>','compList')"><%=i%></button>
                    &nbsp;
                    <%
	                    if (i == totalpage) {
	                            break;
	                        }
	                    }
                    if (usrgroup != (totalpage / pagesize - (totalpage % pagesize == 0 ? 1 : 0))) {
                    %><button class="pagination-btn"
                        onclick="pagemove('<%=(usrgroup + 1) * pagesize + 1%>' ,'compList')">Next</button>
                    <%
                    }
                    %>
                </div>
            </div>
        </div>
    	<div id="incompList" class="topNav <%= "incompList".equals(listType) ? "active" : "" %>">
    		 <table>
                <thead>
                    <tr>
                        <th>신고번호</th>
                        <th>게시글번호</th>
                        <th>신고내용</th>
                        <th>판매자</th>
                        <th>신고자</th>
                        <th>상세확인</th>
                    </tr>
                </thead>
                <tbody id="report-list">
                    <%
                    ArrayList<M_ReportDTO> arr3 = rdao.incompReports(cp, listsize);
                    if (arr3 != null) {
                        for (M_ReportDTO dto : arr3) {
                    %>
                    <tr>
                        <td><%=dto.getRp_idx()%></td>
                        <td><%=dto.getS_idx()%></td>
                        <td><%=dto.getRp_reason()%></td>
                        <td><%=dto.getReported_nick()%></td>
                        <td><%=dto.getReporter_nick()%></td>
                        <td>
                            <button class="Cbtn" onclick="showdetail('<%=dto.getRp_idx()%>')">변경</button>
                            <div class="detaildata" data-idx="<%=dto.getRp_idx()%>" style="display:none;">
                            	<h3>상세보기</h3><button class="gbtn" onclick="doban('<%=dto.getRp_idx() %>','<%=dto.getS_idx() %>');" style="float:right;">죽이기</button>
                                <p class="s_idx">ID: <%=dto.getRp_idx()%></p>
                                <p>판매자: <%=dto.getReported_nick()%></p>
                                <p>신고자: <%=dto.getReporter_nick()%></p>
                                <p>신고 사유</p>
                                <div>
                                	<p><%=dto.getRp_reason()%></p>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="7">없음</td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
            <div class="pagination">
                <span>Showing <%=(totalcnt / listsize) >= cp ? cp * listsize : totalcnt%>
                    to <%=totalcnt%> of <%=cp%> entries
                </span>
                <div class="pagination-controls">
                    <%
                    if (usrgroup != 0) {
                    %><button class="pagination-btn" onclick="pagemove('<%=(usrgroup - 1) * pagesize + pagesize%>','incompList')">Prev</button>
                    <%
                    }
                    %>
                    <%
                    for (int i = usrgroup * pagesize + 1; i <= usrgroup * pagesize + pagesize; i++) {
                    %>
                    &nbsp;
                    <button class="pagination-btn" onclick="pagemove('<%=i%>','incompList')"><%=i%></button>
                    &nbsp;
                    <%
	                    if (i == totalpage) {
	                            break;
	                        }
	                    }
                    if (usrgroup != (totalpage / pagesize - (totalpage % pagesize == 0 ? 1 : 0))) {
                    %>
                    <button class="pagination-btn" onclick="pagemove('<%=(usrgroup + 1) * pagesize + 1%>','incompList')">Next</button>
                    <%
                    }
                    %>
                </div>
            </div>
    	</div>
    </div>
    
    <div id="report-modal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal();">&times;</span>
            <div id="modal-content"></div>
        </div>
    </div>
