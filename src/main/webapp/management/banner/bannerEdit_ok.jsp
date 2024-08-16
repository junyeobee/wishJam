<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id = "bdao" class = "com.manage.wishJam.BannerDAO"/>
<%@ page import="java.sql.*" %>
<%
	String idx = request.getParameter("idx");
	String b_name = request.getParameter("b_name");
	String b_src = request.getParameter("imagePath");
	String b_sdate = request.getParameter("b_sdate");
	String b_edate = request.getParameter("b_edate");
	if((idx!=null)&&(b_name!=null)&&(b_sdate!=null)&&(b_edate!=null)&&(b_src!=null)){
		int b_idx = Integer.parseInt(idx);
        java.sql.Date date1 = java.sql.Date.valueOf(b_sdate);
        java.sql.Date date2 = java.sql.Date.valueOf(b_edate);
        
        int a = bdao.editBanner(b_idx, b_name, b_src, date1, date2);
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