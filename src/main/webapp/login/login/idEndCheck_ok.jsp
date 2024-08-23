<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.member.wishJam.MemberDAO"></jsp:useBean>
<%
    request.setCharacterEncoding("UTF-8");
    String m_id = request.getParameter("m_id");
    
    // m_id 확인
    if (m_id == null) {
    	m_id = "null";
    }
    System.out.println("Received m_id: " + m_id);

    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    boolean result = mdao.idCheck(m_id);

    if (result) {
        out.write("{\"status\":\"error\", \"message\":\"아이디 중복을 확인해주세요.\"}");
    } else{
    	out.write("{\"status\":\"success\"}");
    }

    out.flush();
%>
