<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="rvdto" class="com.wishJam.review.ReviewDTO"></jsp:useBean>
<jsp:setProperty property="*" name="rvdto"></jsp:setProperty>
<jsp:useBean id="rvdao" class="com.wishJam.review.ReviewDAO"></jsp:useBean>

<%
Object m_idx_s = session.getAttribute("m_idx");
Object s_idx_s = session.getAttribute("s_idx");

int m_idx = 0;
int s_idx = 0;

if (m_idx_s != null) {
	m_idx = (Integer) m_idx_s;
}
if (s_idx_s != null) {
	s_idx = (Integer) s_idx_s;
}

int result = rvdao.addReview(s_idx, m_idx, rvdto);
String msg = result>0?"리뷰가 등록되었습니다.":"리뷰 등록 중 오류가 발생했습니다.";
%>
<script>
window.alert('<%=msg %>');
window.close();
</script>