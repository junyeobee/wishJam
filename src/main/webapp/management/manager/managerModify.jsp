<%@page import="javax.websocket.Session"%>
<%@page import="java.io.File"%>
<%@page import="javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdto" class="com.manage.wishJam.manageDTO" scope="session"/>
<jsp:useBean id = "mdao" class = "com.manage.wishJam.manageDAO"/>
<jsp:useBean id = "maindao" class = "com.manage.wishJam.mainDAO"/>
<head>
<style>
	#imgbox{
		width:100px;
		height:100px;
	}
</style>
</head>
<%
	Integer m_idxObj = (Integer) session.getAttribute("m_idx");
	int m_idx = (m_idxObj != null) ? m_idxObj : 0;
    String pwd = request.getParameter("pwd");
    int result = mdao.getPwd(pwd, m_idx);
    if (pwd != null) {
    	if(result == 1){
    		String src = maindao.getImgsrc(m_idx) != null ? maindao.getImgsrc(m_idx) : ""; 
    		%>
    		<div>
    			<h1>관리자 정보수정</h1>
    		<div>
    			<label>프로필 사진 변경</label>
    			<div id = "imgbox">
    				<img src="<%=src %>" alt="managerImg" onclick="modifyImg('<%=m_idx %>');"/></div>
    			</div>
    		</div>
    		<%
    	}else{
    			%>
    			<script>
    				window.alert('재입력');
    				window.location='managerModify.jsp';
    			</script>
    			<%
    	}
    }else {
        %>
        <div>
            <h1>관리자 정보 수정</h1>
            <form action="managerModify.jsp">
                <div>
                    <label>비밀번호 입력</label>
                    <input type="password" name="pwd"/>
                </div>
                <div>
                    <input type="submit" value="확인"/>
                </div>
            </form>
        </div>
<% 
	} 
%>

<script>
	function modifyImg(i){
	    window.open('ImgUpload.jsp?m_idx='+i,'ImgUpload','width=400,height=300');
	}
</script>