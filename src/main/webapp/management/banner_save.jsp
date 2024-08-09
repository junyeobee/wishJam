<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.manage.wishJam.BannerDAO" %>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
    BannerDAO bannerDAO = new BannerDAO();
    boolean hasError = false;

    for (int i = 0; ; i++) {
        String b_name = request.getParameter("b_name_" + i);
        String b_sdate = request.getParameter("b_sdate_" + i);
        String b_edate = request.getParameter("b_edate_" + i);
       
        if (b_name == null || b_sdate == null || b_edate == null) {
            break;
        }
        java.sql.Date date1 = java.sql.Date.valueOf(b_sdate);
        java.sql.Date date2 = java.sql.Date.valueOf(b_sdate);
        int a = bannerDAO.insertBanner(b_name, date1, date2);
        if (a <= 0) {
            hasError = true;
            break;
        }
    }
%>
<%
    if (hasError) {
%>
<script>
    window.alert('상황발생');
</script>
<%
    } else {
%>
<script>
    alert('배너가 성공적으로 저장되었습니다.');
    window.location.href = 'banner.jsp';
</script>
<%
    }
%>
