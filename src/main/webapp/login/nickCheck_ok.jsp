<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.member.wishJam.MemberDAO"></jsp:useBean>
<%
    request.setCharacterEncoding("UTF-8");
    String m_nick = request.getParameter("m_nick");
    
    // m_nick 확인
    if (m_nick == null) {
    	m_nick = "null";
    } else if (m_nick != null){
    	m_nick = m_nick.replaceAll("\\s+", "");
    }
    System.out.println("Received m_nick: " + m_nick);

    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    boolean result = mdao.nickCheck(m_nick);

    if (result) {
        out.write("{\"status\":\"error\", \"message\":\"이미 사용하고있는 닉네임입니다.\"}");
    } else{
    	out.write("{\"status\":\"success\"}");
    }

    out.flush();
%>
