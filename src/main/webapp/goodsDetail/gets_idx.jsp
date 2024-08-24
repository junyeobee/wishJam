<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function openMR(){
		var sd = document.idx_gfm3.s_idx;
		window.open('makeReview.jsp?s_idx='+sd.value+'&m_idx=1','makeReview','width=600px,height=800px');
	}
</script>
<title>Insert title here</title>
<%
	session.setAttribute("m_idx", 2);
	session.setAttribute("s_idx", 1);

%>
</head>
<body>
	<form name="idx_gfm" action="detail.jsp">
		detail이동
		<input type="text" name="s_idx">
		<input type="submit" value="제출">
	</form>
	<form name="idx_gfm2" action="makeSell.jsp">
	makeSell이동
		<input type="submit" value="제출">
	</form>
	<form name="idx_gfm3" action="makeReview.jsp">
	<input type="text" name="s_idx">
		<input type="button" value="제출" onclick="openMR()">
	</form>
</body>
</html>