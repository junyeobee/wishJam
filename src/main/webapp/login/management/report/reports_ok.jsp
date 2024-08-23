<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id = "rdao" class ="com.manage.wishJam.M_ReportDAO" />
<%
	String Srp_idx = request.getParameter("rp_idx");
	
	if(Srp_idx!=null){
		int rp_idx = Integer.parseInt(Srp_idx);
		int result = rdao.banPost(rp_idx);
		if(result>0){
			int m_idx = rdao.selectSeller(rp_idx);
			int rs = rdao.SellerToMsg(m_idx);
			if(rs>0){
				%>
					<script>
						window.alert('처리완료');
					</script>
				<%
			}
		}
	}else{
		%>
			<script>
				window.alert('잘못된 접근입니다.');
			</script>
		<%
	}
%>
<script>
	window.location = 'reports.jsp';
</script>