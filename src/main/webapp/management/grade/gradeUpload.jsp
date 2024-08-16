<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id = "gdao" class = "com.manage.wishJam.GradeDAO"/>
<%
	String idx = request.getParameter("idx");
	String g_name = request.getParameter("g_name");
	String g_src = request.getParameter("imagePath");
	String point = request.getParameter("g_point");
	if((idx!=null)&&(g_name!=null)&&(point!=null)){
		if(g_src.equals("")) g_src = "/wishJam/img/grade/default.jpg";
		int g_idx = Integer.parseInt(idx);
		int g_point = Integer.parseInt(point);
        int a = gdao.insertGrade(g_idx, g_name, g_src, g_point);
        if(a>0){
        	%>
        	<script>
        		window.alert('저장성공');
        		window.location='grade.jsp';
        	</script>
        	<%
        }else{
        	%>
        	<script>
        		window.alert('상황발생');
        		window.location='grade.jsp';
        	</script>
        	<%
        }
	}else{
		%>
			<script>
        		window.alert('잘못된 접근입니다.');
        		window.location='grade.jsp';
        	</script>
		<%
	}
%>