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
	// 'ctidx'와 'ctckbox' 값을 각각 추출합니다.
    List<Integer> idsList = data.get("ctidx");
    List<Integer> ckinviList = data.get("ctckbox");
	
 	// 결과를 저장할 리스트 생성
    List<Map<String, Object>> result = new ArrayList<>();
 	
	if (idsList != null && ckinviList != null) {
		// 리스트의 크기가 같다는 가정 하에 처리합니다.
        for (int i = 0; i < idsList.size(); i++) {
            int ct_idx = idsList.get(i);
            int ct_ckchange = ckinviList.get(i);

            // DAO 메서드를 호출하여 처리합니다.
            cdao.costchange(ct_idx, ct_ckchange);
            
            // 결과를 저장합니다.
            Map<String, Object> entry = new HashMap<>();
            entry.put("ct_idx", ct_idx);
            entry.put("ct_ckchange", ct_ckchange);
            result.add(entry);
        }
	}
	
	// 결과를 JSON으로 반환합니다.
    ObjectMapper responseMapper = new ObjectMapper();
    response.setContentType("application/json; charset=UTF-8");
    response.getWriter().write(responseMapper.writeValueAsString(result));
%>