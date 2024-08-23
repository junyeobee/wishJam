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

    if (m_email.equals("null") || m_email.isEmpty()) {
        out.write("{\"status\":\"error\", \"message\":\"이메일을 입력해주세요.\"}");
    } else if (result) {
        out.write("{\"status\":\"error\", \"message\":\"이미 가입되어있는 이메일입니다.\"}");
    } else {
        out.write("{\"status\":\"success\", \"message\":\"가입할 수 있는 이메일입니다.\"}");
    }

    out.flush();
%>