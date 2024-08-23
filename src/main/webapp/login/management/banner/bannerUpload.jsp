<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id = "bdao" class = "com.manage.wishJam.BannerDAO"/>
<%@ page import="java.sql.*" %>
<%
	String idx = request.getParameter("idx");
	String b_name = request.getParameter("b_name");
	String b_src = request.getParameter("imagePath");
	String b_sdate = request.getParameter("b_sdate");
	String b_edate = request.getParameter("b_edate");
	if((idx!=null)&&(b_name!=null)&&(b_sdate!=null)&&(b_edate!=null)){
		if(b_src.equals(""))	b_src = "/wishJam/img/banner/default.jpg";
		int b_idx = Integer.parseInt(idx);
        java.sql.Date date1 = java.sql.Date.valueOf(b_sdate);
        java.sql.Date date2 = java.sql.Date.valueOf(b_edate);
        System.out.println(b_src);
        int a = bdao.insertBanner(b_idx, b_name, b_src, date1, date2);
        if(a>0){
        	%>
        	<script>
        		window.alert('저장성공');
        		window.location='banner.jsp';
        	</script>
        	<%
        }else{
        	%>
        	<script>
        		window.alert('상황발생');
        		window.location='banner.jsp';
        	</script>
        	<%
        }
	}else{
		%>
			<script>
        		window.alert('잘못된 접근입니다.');
        		window.location='banner.jsp';
        	</script>
		<%
	}
%>