<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id = "cdao" class = "com.manage.wishJam.M_CartegoryDAO"/>
<%
	String idx = request.getParameter("c_idx");
	String bigCategory = request.getParameter("bigCategory");
	String small = request.getParameter("c_small");
	String smallCategory = request.getParameter("smallCategory");
	String hashtags = request.getParameter("hashtags");
	String imagePath = request.getParameter("imagePath");
	if(idx!=null&&bigCategory!=null&&smallCategory!=null&&hashtags!=null&&imagePath!=null&&small!=null){
		int c_idx = Integer.parseInt(idx);
		int c_big = Integer.parseInt(bigCategory);
		int c_small = Integer.parseInt(small);
		int result = cdao.editCategory(c_idx, c_big, c_small, smallCategory, hashtags, imagePath);
		if(result > 0){
			%>
			<script>
				alert('수정 성공');
				window.location.href = 'category.jsp';
			</script>
			<%
		}else {
			%>
			<script>
				alert('수정 실패');
				window.location.href = 'category.jsp';
			</script>
			<%
		}
	}else{
		%>
		<script>
			alert('실패');
			window.location.href = 'category.jsp';
		</script>
		<%
	}
%>