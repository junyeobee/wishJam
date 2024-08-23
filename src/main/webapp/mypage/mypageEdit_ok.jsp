<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dto" class="com.mypage.wishJam.MypageDTO"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="mdao" class="com.mypage.wishJam.MypageDAO"></jsp:useBean>

    <%
    request.setCharacterEncoding("utf-8");
    Integer m_idx = (Integer) session.getAttribute("m_idx");
    int result = mdao.memberUpdate(dto,m_idx);
    
    String msg= result > 0 ?"회원 정보가 수정되었습니다!" : "회원정보 수정이 실패했습니다.";
    %>
    
    <script>
    window.alert('<%=msg%>');
    location.href='/wishJam/mypage/myPage.jsp?ownerIdx=<%=m_idx%>';
    </script>

 