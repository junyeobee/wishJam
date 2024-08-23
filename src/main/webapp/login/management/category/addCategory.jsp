<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id = "cdao" class ="com.manage.wishJam.M_CartegoryDAO"/>
<%
	String idx = request.getParameter("c_idx");
	String s_bigCategory = request.getParameter("bigCategory");
	String smallCategory = request.getParameter("smallCategory");
	String hashtags = request.getParameter("hashtags");
	String imagePath = request.getParameter("imagePath");
	if(idx!=null&&s_bigCategory!=null&&smallCategory!=null&&hashtags!=null){
		if (imagePath == null) imagePath = "/wishJam/img/category/category1.jpg";
		int c_idx = Integer.parseInt(idx);
		int c_big = Integer.parseInt(s_bigCategory);
		int c_small = cdao.getNextSeq(c_big);
		
		int result = cdao.addCategory(c_idx, c_big, c_small, smallCategory, hashtags, imagePath);
		if(result > 0) {
			%>
				<script>
					window.alert('저장완료');
					window.location.href = 'category.jsp';
				</script>
			<%
		}
	}
%>
<script>
	window.alert('실패');
	window.location.href = 'category.jsp';
</script>