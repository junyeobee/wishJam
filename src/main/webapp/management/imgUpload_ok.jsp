<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.manage.wishJam.MyFileRenamePolicy"%>
<%@page import="com.manage.wishJam.manageDAO"%>
<jsp:useBean id="mdao" class="com.manage.wishJam.manageDAO" scope="session"/>

<%
    String path = request.getRealPath("/");
    mdao.setHomePath(path);
    
    String userId = (String)session.getAttribute("userId");
    MyFileRenamePolicy renamePolicy = new MyFileRenamePolicy(userId);
    String savepath = mdao.getHomePath() + mdao.getUrl();
    int maxPostSize = 10 * 1024 * 1024;
    String encoding = "UTF-8";
    MultipartRequest mr = new MultipartRequest(request, savepath, maxPostSize, encoding, renamePolicy);
%>
<script>
    window.alert('파일 올리기 성공!');
    window.self.close();
    opener.window.location.reload();
</script>
