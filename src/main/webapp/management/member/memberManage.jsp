<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@ page import = "com.manage.wishJam.MemberExDTO" %>
<%@ page import = "com.manage.wishJam.MemberExDAO" %>
<%
	MemberExDAO mexdao = new MemberExDAO();
	int e = mexdao.getTotalcnt();
	String cp_s = request.getParameter("cp");
	if(cp_s==null||cp_s.equals("")){
		cp_s="1";
	}
	int cp = Integer.parseInt(cp_s);
	
	//총 게시물수
	int totalcnt = mexdao.getTotalcnt();
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

<div>
	<h1>회원 관리</h1>
</div>
<div>
	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>닉네임</th>
				<th>등급</th>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>번호</th>
				<th>주소</th>
				<th>이메일</th>
				<th>보유포인트</th>
			</tr>
		</thead>
		<tbody>
			<%
				System.out.println(e);
				ArrayList<MemberExDTO> arr = mexdao.allMember(cp,listsize);
				if(arr!=null){
					for(MemberExDTO dto : arr){
					%>
						<tr>
							<td><%=dto.getM_idx() %></td>
							<td><%=dto.getM_nick() %></td>
							<td><%=dto.getG_name() %></td>
							<td><%=dto.getM_id() %></td>
							<td><%=dto.getM_pwd() %></td>
							<td><%=dto.getM_name() %></td>
							<td><%=dto.getM_tel() %></td>
							<td><%=dto.getM_addr() %></td>
							<td><%=dto.getM_email() %></td>
							<td><%=dto.getM_point() %></td>
						</tr>
					<%
					}
				}else {
					%>
						<tr>
							<td colspan="10">없음</td>
						</tr>
					<%
				}
			%>
		</tbody>
	</table>
<%
	if(usrgroup != 0) {
		%><a href="memberManage.jsp?cp=<%=(usrgroup-1)*pagesize+pagesize %>">&lt;&lt;</a><%
	}
%>

<%
	for(int i = usrgroup*pagesize+1; i<=usrgroup*pagesize+pagesize; i++){
		%>
		&nbsp;&nbsp;<a href="memberManage.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;
		<%
		if(i==totalpage){
			break;
		}
	}
%>
<%
	if(usrgroup != (totalpage/pagesize-(totalpage%pagesize==0?1:0))) {
		%><a href="memberManage.jsp?cp=<%=(usrgroup+1)*pagesize+1%>">&gt;&gt;</a><%
	}

%>
</div>