<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.member.wishJam.MemberDAO"></jsp:useBean>
<%
    request.setCharacterEncoding("UTF-8");
    String m_email = request.getParameter("m_email");
    
    // m_email 확인
    if (m_email == null) {
    	m_email = "null";
    }
    System.out.println("Received m_email: " + m_email);

    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    boolean result = mdao.emailCheck(m_email);

    if (result) {
        out.write("{\"status\":\"error\", \"message\":\"이메일 중복을 확인해주세요.\"}");
    } else{
    	out.write("{\"status\":\"success\"}");
    }

    out.flush();
%>
