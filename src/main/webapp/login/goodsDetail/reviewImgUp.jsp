<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ridao" class="com.wishJam.review.reviewImgDAO" scope="session"></jsp:useBean>

<%
	String s_idx_s =request.getParameter("s_idx");
	String m_idx_s = request.getParameter("m_idx");
	String cnt_s = request.getParameter("cnt");
	
	int s_idx = 0;
	if (s_idx_s != null) {
		s_idx = Integer.parseInt(s_idx_s);
	}
	
	int m_idx = 0;
	if (m_idx_s != null) {
		m_idx = Integer.parseInt(m_idx_s);
	}
	
	int cnt = 0;
	if (cnt_s != null) {
		cnt = Integer.parseInt(cnt_s);
	}
	
	ridao.setS_idx(s_idx);
	ridao.setM_idx(m_idx);
	ridao.setCnt(cnt);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="uploadfm" action="reviewImgUp_ok.jsp" method="post"
		enctype="multipart/form-data">
		<input type="file" name="uploadImg"><input type="submit" value="확인">
	</form>
</body>
</html>