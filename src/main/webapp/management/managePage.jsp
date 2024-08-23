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
		margin-bottom: 10px;
	}
	
	#manageimg {
		height: 150px;
		width: 150px;
		border-radius: 50px;
		background-color: #4f4f4f;
		text-align: center;
		padding: 10px;
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
</style>
</head>
<body id = "body">
    <div id="manageNavbar">
        <div>
            <a href="/wishJam/index.jsp">메인로고</a>
        </div>
        <div id="manageimg">
        	<a href="#" data-content = "/wishJam/management/manager/managerModify" class="link">
            <img src="<%=src %>" class="pfimg" alt="img">
            </a>
            <div id = "managerExplane"><%=m_nick %> 님</div>
        </div>
        <div class="element">
            <a href="#" data-content="/wishJam/management/stats/stats" class="link">거래 통계</a>
        </div>
        <div class="element">
            <a href="#" data-content="/wishJam/management/member/memberManage" class="link">회원 관리</a>
        </div>
        <div class="element">
            <a href="#" data-content="/wishJam/management/report/reports" class="link">신고 관리</a>
        </div>
        <div class="element">
            <a href="#" data-content="/wishJam/management/banner/banner" class="link">배너 설정</a>
        </div>
        <div class="element">
            <a href="#" data-content="/wishJam/management/grade/grade" class="link">등급 관리</a>
        </div>
        <div class="element">
            <a href="#" data-content="/wishJam/management/category/category" class="link">카테고리 관리</a>
        </div>
    </div>
    <section id="manageArea">
        <iframe id="contentFrame" src="main.jsp"></iframe>
    </section>
    <script>
    	/*link 클릭시 data content값 가져옴*/
        document.addEventListener('DOMContentLoaded', function() {
            const dynamicLinks = document.querySelectorAll('.link');
            dynamicLinks.forEach(link => {
                link.addEventListener('click', function(event) {
                    event.preventDefault();
                    const content = this.getAttribute('data-content');
                    if (content) {
                        loadContent(content);
                    }
                });
            });
        });
		//data content + .jsp로 iframe 링크 변경
        function loadContent(content) {
            const fileName = content + '.jsp';
            document.getElementById('contentFrame').src = fileName;
        }
    </script>
</body>
</html>