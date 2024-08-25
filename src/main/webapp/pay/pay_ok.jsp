<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="pdao" class="com.pay.wishJam.PayDAO"></jsp:useBean>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String m_idx = request.getParameter("m_idx");
	String[] sg_idx = request.getParameterValues("sg_idx");
	String by_addr = request.getParameter("by_addr");
	String by_wish = request.getParameter("by_wish");
	String by_sudan = request.getParameter("by_sudan");
	String[] by_count = request.getParameterValues("by_count");
	String[] by_price = request.getParameterValues("by_price");
	String[] ct_idx = request.getParameterValues("ct_idx");
	
	int result = 0;
	for(int i=0; i<ct_idx.length;i++){
		result += pdao.paySuccess(Integer.parseInt(m_idx), Integer.parseInt(sg_idx[i]), by_addr, by_wish, by_sudan,
									Integer.parseInt(by_count[i]), Integer.parseInt(by_price[i]), Integer.parseInt(ct_idx[i]));
	}
	
	String msg = result==ct_idx.length?"구매가 완료되었습니다.":"결제에 실패했습니다. 다시 결제해주세요.";
%>
<script>
	window.alert('<%=msg%>');
	location.href='/wishJam';
</script>