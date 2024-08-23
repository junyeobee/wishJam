<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<%
    session.invalidate();

	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
	    for (Cookie cookie : cookies) {
	        if (cookie.getName().equals("user_id")) {
	            cookie.setValue(""); 
	            cookie.setMaxAge(0); 
	            response.addCookie(cookie); 
	            break;
	        }
	    }
	}
	
    response.sendRedirect("/wishJam");
%>