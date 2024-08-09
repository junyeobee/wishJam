<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="rdto" class="com.wishJam.Report.ReportDTO"></jsp:useBean>
<jsp:setProperty property="*" name="rdto"></jsp:setProperty>
<jsp:useBean id="rdao" class="com.wishJam.Report.ReportDAO"></jsp:useBean>

<%
	int result = rdao.reportContent(rdto);

	String msg = result>0?"신고가 성공적으로 접수되었습니다.":"신고 접수에 실패했습니다.";
%>
<script>
	window.alert('<%=msg %>');
	window.self.close();
	location.href='/wishJam/goodsDetail/detail.jsp';
</script>