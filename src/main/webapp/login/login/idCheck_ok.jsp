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

    if (m_id.equals("null") || m_id.isEmpty()) {
        out.write("{\"status\":\"error\", \"message\":\"아이디를 입력해주세요.\"}");
    } else if (result) {
        out.write("{\"status\":\"error\", \"message\":\"이미 가입되어있는 아이디입니다.\"}");
    } else {
        out.write("{\"status\":\"success\", \"message\":\"" + m_id + "는 사용가능한 아이디입니다.\"}");
    }

    out.flush();
%>
