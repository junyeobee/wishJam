<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.manage.wishJam.GradeDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Enumeration"%>

<%
	GradeDAO gao = new GradeDAO();
    ArrayList<Integer> del = new ArrayList<Integer>();
    Enumeration<String> parameterNames = request.getParameterNames();
    while (parameterNames.hasMoreElements()) {
        String paramName = parameterNames.nextElement();
        if (paramName.startsWith("g_idx_")) {
            String idParam = request.getParameter(paramName);
            if (idParam != null && !idParam.trim().isEmpty()) {
                try {
                    int id = Integer.parseInt(idParam);
                    del.add(id);
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    for (Integer id : del) {
        int a = gao.deleteGrade(id);
        if (a<=0){
        	%>
        		<script>
        			window.alert('상황발생');
        			window.location='grade.jsp';
        		</script>
        	<%
        }
    }
%>
<script>
	window.alert('삭제되었습니다.');
	window.location='grade.jsp';
</script>
