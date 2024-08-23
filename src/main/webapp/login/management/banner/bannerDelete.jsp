<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.manage.wishJam.BannerDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%
    BannerDAO dao = new BannerDAO();
    ArrayList<Integer> del = new ArrayList<Integer>();
    Enumeration<String> parameterNames = request.getParameterNames();
    while (parameterNames.hasMoreElements()) {
        String paramName = parameterNames.nextElement();
        if (paramName.startsWith("b_idx_")) {
            String idParam = request.getParameter(paramName);
            if (idParam != null && !idParam.trim().isEmpty()) {
                try {
                    int id = Integer.parseInt(idParam);
                    del.add(id);
                } catch (NumberFormatException e) {
                    // 형변환 실패 시 처리 (예: 로깅)
                    e.printStackTrace();
                }
            }
        }
    }

    // 유효한 ID를 사용하여 배너 삭제 처리
    for (Integer id : del) {
        int a = dao.deleteBanner(id); // 삭제 메서드는 구현 필요
        if (a<=0){
        	%>
        		<script>
        			window.alert('상황발생');
        			window.location='banner.jsp';
        		</script>
        	<%
        }
    }
%>
<script>
	window.alert('삭제되었습니다.');
	window.location='banner.jsp';
</script>