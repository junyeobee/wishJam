<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.manage.wishJam.MyFileRenamePolicy"%>
<%@page import="com.manage.wishJam.manageDTO"%>
<jsp:useBean id="mdao" class="com.manage.wishJam.manageDTO" scope="session"/>
<jsp:useBean id = "dao" class = "com.manage.wishJam.manageDAO"/>
<%
	String idx = request.getParameter("m_idx");
	int m_idx = Integer.parseInt(request.getParameter("m_idx"));
	String path = request.getRealPath("/");
	mdao.setHomePath(path);
	MyFileRenamePolicy renamePolicy = new MyFileRenamePolicy(idx);
	String savepath = mdao.getHomePath() + mdao.getUsrpf();
	int maxPostSize = 10 * 1024 * 1024;
	String encoding = "UTF-8";
	MultipartRequest mr = new MultipartRequest(request, savepath, maxPostSize, encoding, renamePolicy);
	String imagePath = "/wishJam/img/member_profile/" + m_idx + ".jpg";
	int result = dao.changeImg(m_idx, imagePath);
%>
<script>
    window.alert('파일 올리기 성공!');
    window.self.close();
    opener.window.location.reload();
</script>
