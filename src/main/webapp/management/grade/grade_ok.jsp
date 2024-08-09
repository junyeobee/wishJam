<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.manage.wishJam.ExampleDTO" %>
<jsp:useBean id = "edao" class = "com.manage.wishJam.ExampleDAO" />
<%
    request.setCharacterEncoding("UTF-8");


    String msg = "실패";
    ArrayList<ExampleDTO> updatedGrades = new ArrayList<ExampleDTO>();
    for (String paramName : request.getParameterMap().keySet()) {
    	System.out.println(paramName);
        if (paramName.startsWith("g_point_")) {
            int index = Integer.parseInt(paramName.substring("g_point_".length()));
            String gPointValue = request.getParameter(paramName);
            String gNameValue = request.getParameter("g_name_" + index);
            ExampleDTO dto = new ExampleDTO();
            dto.setG_name(gNameValue);
            dto.setG_point(Integer.parseInt(gPointValue));
            updatedGrades.add(dto);
        }
    }
    int result = edao.updateGrade(updatedGrades);
    msg = result < 0 ? "저장완료" : "실패";
%>
<script>
    window.alert('<%=msg %>');
    window.location='grade.jsp';
</script>
