<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id = "idao" class="com.wishJam.detail.DetailImgDAO" scope="session"></jsp:useBean>
<%
String s_idx_s = request.getParameter("s_idx");
String m_nick = request.getParameter("m_nick");
String select_id = request.getParameter("select_id");

int s_idx = 0;

if (s_idx_s != null) {
	s_idx = Integer.parseInt(s_idx_s);
}

idao.setS_idx(s_idx);
idao.setM_nick(m_nick);
idao.setSelect_id(select_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="uploadfm" action="sellImgUp_ok.jsp" method="post"
		enctype="multipart/form-data">
		<input type="file" name="uploadImg"><input type="submit" value="확인">
	</form>
</body>
</html>