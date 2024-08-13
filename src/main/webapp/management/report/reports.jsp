<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.manage.wishJam.M_ReportDTO" %>
<%@ page import ="java.util.*" %>
<jsp:useBean id = "rdao" class = "com.manage.wishJam.M_ReportDAO"/>
<%
	String cp_s = request.getParameter("cp");
	if(cp_s==null||cp_s.equals("")){
		cp_s="1";
	}
	int cp = Integer.parseInt(cp_s);
	
	//총 게시물수
	int totalcnt = rdao.getTotalcnt();
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
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Report Management</title>
    <link rel="stylesheet" href="/wishJam/css/reports.css">
    <script src="reports.js"></script>
</head>
<body>
    <div class="container">
        <h1>신고 리스트</h1>
        <div class="toolbar">
            <button class="btn back-btn">뒤로가기</button>
            <button class="btn ban-btn">게시금지</button>
        </div>
        <table>
            <thead>
                <tr>
                    <th><input type="checkbox"></th>
                    <th>ID</th>
                    <th>게시글번호</th>
                    <th>카테고리</th>
                    <th>내용</th>
                    <th>판매자</th>
                    <th>신고자</th>
                    <th>상태변경</th>
                </tr>
            </thead>
            <tbody id="report-list">
            <%
				ArrayList<M_ReportDTO> arr = rdao.allReports(cp,listsize);
				if(arr!=null){
					for(M_ReportDTO dto : arr){
				%>
						<tr>
							<td><input type="checkbox"></td>
							<td><%=dto.getRp_idx()%> </td>
							<td><%=dto.getS_idx()%> </td>
							<td><%=dto.getC_idx()%> </td>
							<td><%=dto.getRp_reason() %></td>
                    		<td><%=dto.getReported_idx() %></td>
                    		<td><%=dto.getReporter_idx() %></td>
                    		<td><button class="status-change-btn">변경</button></td>
						</tr>
					<%
					}
				}else {
					%>
						<tr>
							<td colspan="8">없음</td>
						</tr>
					<%
				}
			%>
            </tbody>
        </table>
        <div class="pagination">
        	<span>Showing <%=(totalcnt/listsize)>=cp?cp*listsize:totalcnt %> to <%=totalcnt %> of <%=cp %> entries</span>
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
	function navigateTo(page) {
	    window.location.href = 'reports.jsp?cp=' + page;
	}
	</script>
</body>
