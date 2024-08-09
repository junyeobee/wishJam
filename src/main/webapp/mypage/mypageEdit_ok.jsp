<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="dto" class="com.mypage.wishJam.MypageDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dao" class="com.mypage.wishJam.MypageDAO"></jsp:useBean>

    <%
    request.setCharacterEncoding("utf-8");
    String id = (String) session.getAttribute("userId");
    int result = dao.memberUpdate(dto,id);
    
    String msg= result >0 ?"회원 정보가 수정되었습니다!" : "회원정보 수정이 실패했습니다.";
    %>
    
    <script>
    window.alert('<%=msg%>');
    location.href='myPage.jsp';
    </script>

 