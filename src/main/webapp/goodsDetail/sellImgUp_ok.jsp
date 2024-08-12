<%@page import="org.apache.tomcat.util.http.fileupload.FileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>

<jsp:useBean id="idao" class="com.wishJam.detail.DetailImgDAO"
	scope="session"></jsp:useBean>

<%
request.setCharacterEncoding("UTF-8");
String path = request.getRealPath("/");
idao.setHomePath(path);
String savepath = idao.getHomePath() + idao.getEverypath();

int size = 10 * 1024 * 1024;

String newname = idao.getM_nick();
//FileUploadRename fr = new FileUploadRename(newname);
MultipartRequest mr = new MultipartRequest(request, savepath, size, "UTF-8");
String imgname= mr.getFilesystemName("sellImg");
%>
<script>
	var txt = opener.document.getElementById("txt");
	txt.innerHTML += '<img src="/wishJam/img/sellgoods/<%=imgname %>">';
	window.self.close();
</script>
