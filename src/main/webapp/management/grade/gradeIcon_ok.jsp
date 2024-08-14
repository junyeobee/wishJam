<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "com.manage.wishJam.MyFileRenamePolicy" %>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean id="mdao" class="com.manage.wishJam.manageDAO"/>
<jsp:useBean id = "gdao" class ="com.manage.wishJam.GradeDAO"/>
<%
	request.setCharacterEncoding("UTF-8");
	String idx_s = (String)request.getParameter("idx");
	if(idx_s!=null){
		int idx = Integer.parseInt(idx_s);
		String path = request.getRealPath("/");
		mdao.setHomePath(path);
		MyFileRenamePolicy renamePolicy = new MyFileRenamePolicy(idx_s);
		String savepath = mdao.getHomePath() + mdao.getGrade();
		int size = 10 * 1024 * 1024;
		String encoding = "UTF-8";
		MultipartRequest mr = new MultipartRequest(request, savepath, size, encoding, renamePolicy);
		gdao.imgUpload(idx, "/wishJam/img/grade/"+idx+".jpg");
		%>
			<script>
			    window.alert('파일 올리기 성공!');
			    window.self.close();
			    opener.window.location.reload();
			</script>
		<%
	}
	else{
		%>
			<script>
			    window.alert('파일 올리기 실패');
			    window.self.close();
			    opener.window.location.reload();
			</script>
		<%
	}
%>