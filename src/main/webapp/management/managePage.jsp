<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id = "maindao" class="com.manage.wishJam.mainDAO"/>
<%@ page import = "java.util.*" %>
<%@page import="java.io.*"%>

<!DOCTYPE html>
<jsp:useBean id = "mdao" class="com.manage.wishJam.manageDTO"/>
<%
	String m_nick = (String)session.getAttribute("m_nick");
	Integer m_idxObj = (Integer) session.getAttribute("m_idx");
	int m_idx = (m_idxObj != null) ? m_idxObj : 0;
	String src = maindao.getImgsrc(m_idx) != null ? maindao.getImgsrc(m_idx) : "";
	if(m_idx == 0){
		%>
			<script>
				alert('관리자만 접근 허용');
				window.location.href = '/wishJam/';
			</script>
		<%
	}else {
		int g_idx = maindao.getGrader(m_idx);
		
		if(g_idx != 1) {
			%>
			<script>
				alert('관리자만 접근 허용');
				window.location.href = '/wishJam/';
			</script>
		<%
		}
	}
	%>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
	body {
		margin: 0;
		padding: 0;
		display: flex;
	}
	
	#manageNavbar {
		width: 200px;
		height: auto;
		background-color: #212121;
		color: white;
		padding: 10px;
	}
	
	#manageNavbar a {
		text-decoration: none;
		color: white;
	}
	
	#manageArea {
		flex: 1;
		background-color: #f4f4f4;
	}
	
	.element {
	    width: 90%;
	    height: 50px;
	    margin: 0px auto;
	    display: flex;
	    align-items: center;
	    font-weight: bold;
	    padding-left: 10px;
	}
	.element:hover{
		background-color:#ff9900;
	}
	.element.active {
	    background-color: #ff9900;
	    color: white;
	}
	.elcontentbox{
		margin-top:50px;
	}
	#manageimg {
		height: 150px;
		width: 150px;
		border-radius: 50px;
		background-color: #4f4f4f;
		text-align: center;
		padding: 10px;
		margin:10px auto;
	}
	
	.pfimg {
		height: 100px;
		width: 100px;
		border-radius: 50px;
		object-fit: cover;
		border-top: 5px;
		margin-top: 10px;
	}
	
	li {
		list-style: none;
	}
	
	#manageTop ul {
		padding: 0;
	}
	
	#manageTop li {
		margin-bottom: 5px;
	}
	
	#manageTop a {
		text-decoration: none;
		color: black;
	}
	
	#manageTop a.active {
		font-weight: bold;
	}
	
	iframe {
		width: 100%;
		height: calc(100vh - 20px);
		border: none;
	}
	
	#managerExplane {
		text-align: center;
		margin-top: 10px;
		color: #FAFAFA;
	}
	.mainlogo img{
	    width: 60px;
    	height: 60px;
		object-fit: cover;
	}
	.hadan{
		position:absolute;
		top:850px;
		font-size: 10px;
		font-family: 'Pretendard-Regular';
	}
</style>
<script>
function changeImg(){
	window.open('/wishJam/management/manager/managerModify.jsp', 'imChag', 'width=400,height=400,top=400px,left=800px');
}
</script>
</head>
<body id = "body">
    <div id="manageNavbar">
        <div class="mainlogo">
            <img src="/wishJam/img/logo2.png" onclick='window.location.href="/wishJam/"'/>
        </div>
        <div id="manageimg" onclick="changeImg()">
            <img src="<%=src %>" class="pfimg" alt="img">
            <div id = "managerExplane"><%=m_nick %> 님</div>
        </div>
		<div class ="elcontentbox">
		    <div class="element active" data-content="/wishJam/management/member/memberManage">
		        회원 관리
		    </div>
		    <div class="element" data-content="/wishJam/management/report/reports">
		        신고 관리
		    </div>
		    <div class="element" data-content="/wishJam/management/banner/banner">
		        배너 설정
		    </div>
		    <div class="element" data-content="/wishJam/management/grade/grade">
		        등급 관리
		    </div>
		    <div class="element" data-content="/wishJam/management/category/category">
		        카테고리 관리
		    </div>
		    
		    <div class="hadan">
		    	<p>W I S H G E M ◈</p>
		    </div>
		</div>
    </div>
    <section id="manageArea">
        <iframe id="contentFrame" src="/wishJam/management/member/memberManage.jsp"></iframe>
    </section>
    <script>
	document.addEventListener('DOMContentLoaded', function() {
	    const dynamicElements = document.querySelectorAll('.element');
	    
	    dynamicElements.forEach(element => {
	        element.addEventListener('click', function(event) {
	            event.preventDefault();
	            
	            // 기존 활성화된 element에서 active 클래스 제거
	            dynamicElements.forEach(el => el.classList.remove('active'));
	            
	            // 현재 클릭된 element에 active 클래스 추가
	            this.classList.add('active');
	            
	            // iframe에 페이지 로드
	            const content = this.getAttribute('data-content');
	            if (content) {
	                loadContent(content);
	            }
	        });
	    });
	});
	
	function loadContent(content) {
	    const fileName = content + '.jsp';
	    document.getElementById('contentFrame').src = fileName;
	}
    </script>
</body>
</html>