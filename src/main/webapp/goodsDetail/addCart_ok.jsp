<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="acdao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>

<%
String m_idxs[] = request.getParameterValues("m_idx");
for(String name : m_idxs){
	System.out.println(name);
}
String sg_idxs[] = request.getParameterValues("sg_idx");
String ct_counts[] = request.getParameterValues("ct_count");

int s_idx = Integer.parseInt(request.getParameter("s_idx"));

int addcart_result=0;

for(int i=0; i<m_idxs.length;i++){
	addcart_result += acdao.addCart(Integer.parseInt(m_idxs[i]), Integer.parseInt(sg_idxs[i]), Integer.parseInt(ct_counts[i]));
}

String msg = addcart_result==m_idxs.length?"상품을 장바구니에 담았습니다. 장바구니로 이동하시겠습니까?":"장바구니에 상품을 담지 못했습니다.";
%>
	<script>
		var cartalert = window.confirm('<%=msg%>');
		
		if(cartalert){
			location.href='/wishJam/cart/cart.jsp';
		}else {
			location.href='/wishJam/goodsDetail/detail.jsp?s_idx=<%=s_idx%>';
		}
	</script>

