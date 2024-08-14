<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String idx = request.getParameter("idx");
%>
<form action = "gradeIcon_ok.jsp?idx=<%=idx %>" name = "iconupload" method = "post" enctype="multipart/form-data">
	<fieldset>
		<legend>파일올리기</legend>
		<label>파일 선택</label>
		<input type="file" name="upload" accept="image/*"/><!--image파일만 선택가능 -->
		<input type="submit" value="확인" />
	</fieldset>
</form>