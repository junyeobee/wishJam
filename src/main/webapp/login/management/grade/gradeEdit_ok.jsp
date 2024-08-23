<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id = "gdao" class = "com.manage.wishJam.GradeDAO"/>
<%@ page import="java.sql.*" %>
<%
	String idx = request.getParameter("idx");	
	String g_name = request.getParameter("g_name");
	String g_src = request.getParameter("imagePath");
	String point = request.getParameter("g_point");
	if((idx!=null)&&(g_name!=null)&&(point!=null)&&(g_src!=null)){
		int g_idx = Integer.parseInt(idx);
		int g_point = Integer.parseInt(point);
        
        int a = gdao.editGrade(g_idx, g_name, g_src, g_point);
        if(a>0){
        	%>
        	<script>
        		window.alert('저장성공');
        		opener.window.location.reload();
        		window.close();
        	</script>
        	<%
        }else{
        	%>
        	<script>
        		window.alert('상황발생');
        		window.close();
        	</script>
        	<%
        }
	}else{
		%>
			<script>
        		window.alert('잘못된 접근입니다.');
        		window.close();
        	</script>
		<%
	}
%>