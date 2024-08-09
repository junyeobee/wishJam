<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="com.manage.wishJam.MyFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean id="mdto" class="com.mypage.wishJam.MypageDTO" scope="session" /> 
<%
String path = request.getRealPath("/");
System.out.println(path);

mdto.setHomepath(path);

String userId = (String)session.getAttribute("userId");
MyFileRenamePolicy renamePolicy = new MyFileRenamePolicy(userId);
String savepath = mdto.getHomepath() + mdto.getUrl();
int maxPostSize = 10 * 1024 * 1024;
String encoding = "UTF-8";

MultipartRequest mr = new MultipartRequest(request, savepath, maxPostSize, encoding, renamePolicy);
%>
<script>
    window.alert('프로필 사진이 변경되었습니다.');
    window.self.close();
    opener.window.location.reload();
</script>