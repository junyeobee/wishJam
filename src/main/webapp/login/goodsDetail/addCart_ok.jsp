<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="acdao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>

<%
String m_idxs[] = request.getParameterValues("m_idx");
String sg_idxs[] = request.getParameterValues("sg_idx");
String ct_counts[] = request.getParameterValues("ct_count");

int s_idx = Integer.parseInt(request.getParameter("s_idx"));

int addcart_result=0;

for(int i=0; i<m_idxs.length;i++){
	addcart_result += acdao.addCart(Integer.parseInt(m_idxs[i]), Integer.parseInt(sg_idxs[i]), Integer.parseInt(ct_counts[i]));
}

String msg = addcart_result==m_idxs.length?"장바구니에 담겼습니다.":"안담김";
%>
	<script>
		window.alert('<%=msg%>');
		location.href='/wishJam/goodsDetail/detail.jsp?s_idx=<%=s_idx%>';
	</script>

