<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.manage.wishJam.M_ReportDTO"%>
<%@ page import="java.util.*"%>
<%@ page import="com.manage.wishJam.M_ReportDAO"%>
<jsp:useBean id="rdao" class="com.manage.wishJam.M_ReportDAO" />
<%
String cp_s = request.getParameter("cp");
if (cp_s == null || cp_s.equals("")) {
    cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

// 총 게시물 수
int totalcnt = rdao.getTotalcnt();
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

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>신고 리스트</title>
    <link rel="stylesheet" href="/wishJam/css/reports.css">
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
    </style>
    <script>
        function showdetail(idx) {
            var modal = document.getElementById('report-modal');
            var content = document.getElementById('modal-content');

            // 모든 신고 데이터에서 선택된 신고의 판매자 ID를 찾아서
            var allReports = document.querySelectorAll('.detaildata');
            var selectedReport;
            allReports.forEach(function(report) {
                if (report.dataset.idx === idx) {
                    selectedReport = report;
                }
            });

            // 모달에 상세정보와 함께 동일 판매자의 다른 신고 목록을 표시
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

        function navigateTo(page) {
            window.location.href = 'reports.jsp?cp=' + page;
        }
    </script>
</head>
<body>
    <div class="container">
        <div style="padding:10px">
            <h1>신고 리스트</h1>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>게시글번호</th>
                        <th>카테고리</th>
                        <th>내용</th>
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
                        <td><%=dto.getC_idx()%></td>
                        <td><%=dto.getRp_reason()%></td>
                        <td><%=dto.getReported_idx()%></td>
                        <td><%=dto.getReporter_idx()%></td>
                        <td>
                            <button class="Cbtn" onclick="showdetail('<%=dto.getRp_idx()%>')">변경</button>
                            <div class="detaildata" data-idx="<%=dto.getRp_idx()%>" style="display:none;">
                            	<h3>상세보기</h3><button class="gbtn" onclick="" style="float:right;">죽이기</button>
                                <p class="s_idx">ID: <%=dto.getRp_idx()%></p>
                                <p>판매자: <%=dto.getReported_idx()%></p>
                                <p>신고자: <%=dto.getReporter_idx()%></p>
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
                        onclick="navigateTo('<%=(usrgroup - 1) * pagesize + pagesize%>')">Prev</button>
                    <%
                    }
                    %>
                    <%
                    for (int i = usrgroup * pagesize + 1; i <= usrgroup * pagesize + pagesize; i++) {
                    %>
                    &nbsp;
                    <button class="pagination-btn" onclick="navigateTo('<%=i%>')"><%=i%></button>
                    &nbsp;
                    <%
                    if (i == totalpage) {
                            break;
                        }
                    }
                    if (usrgroup != (totalpage / pagesize - (totalpage % pagesize == 0 ? 1 : 0))) {
                    %><button class="pagination-btn"
                        onclick="navigateTo('<%=(usrgroup + 1) * pagesize + 1%>')">Next</button>
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
</body>
</html>
