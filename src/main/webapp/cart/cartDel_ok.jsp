<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper, com.fasterxml.jackson.core.type.TypeReference" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.stream.*"%>
<jsp:useBean id="cdao" class="com.cart.wishJam.CartDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("UTF-8");
	String json = request.getReader().lines().collect(Collectors.joining());
	ObjectMapper mapper = new ObjectMapper();
	
	//JSON 파싱
	Map<String, List<Integer>> data = mapper.readValue(json, new TypeReference<Map<String, List<Integer>>>() {});
	List<Integer> idsList = data.get("ctidx");
	
	if (idsList != null) {
	    for (int ct_idx : idsList) {
	        cdao.cartDel(ct_idx); // 항목 삭제
	    }
	}
%>