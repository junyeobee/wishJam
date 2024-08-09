<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<jsp:useBean id = "mdao" class="com.manage.wishJam.manageDAO"/>
<%
	String id = "bonobono";
	String pwd = "1234";
	session.setAttribute("userId" , id);
	session.setAttribute("userPwd" , pwd);
	String path = request.getRealPath("/");
	mdao.setHomePath(path);
	File file = new File(mdao.getHomePath() + mdao.getUrl());
	
	File[] fileList = file.listFiles();
	String imgSrc = "/wishJam/img/profile/default.jpg";
	System.out.println(mdao.getHomePath());
	for (File f : fileList) {
		if (f.isFile() && f.getName().startsWith(id)) {
			imgSrc = "/wishJam/img/profile/"+f.getName();	//관리자이름이랑 같으면 경로지정하고 break
			break;
		}else{
			imgSrc = "/wishJam/img/profile/default.jpg"; //아니면 default이미지
		}
	}
	System.out.println(imgSrc);
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
    #manageNavbar a{
    	text-decoration: none;
    	color:white;
    }
    #manageArea {
        flex: 1;
        padding: 10px;
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
    #managerExplane{
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
        	<a href="#" data-content = "managerModify" class="dynamic-link">
            <img src="<%=imgSrc %>" class="pfimg" alt="img">
            </a>
            <div id = "managerExplane">관리자 이름 님</div>
        </div>
        <div class="element">
            <a href="#" data-content="stats" class="dynamic-link">통계</a>
        </div>
        <div class="element">
            <a href="#" data-content="memberManage" class="dynamic-link">회원관리</a>
        </div>
        <div class="element">
            <a href="#" data-content="report" class="dynamic-link">신고 관리</a>
        </div>
        <div class="element">
            <a href="#" data-content="banner" class="dynamic-link">배너 설정</a>
        </div>
        <div class="element">
            <a href="#" data-content="grade" class="dynamic-link">등급 관리</a>
        </div>
        <div class="element">
            <a href="#" data-content="dd" class="dynamic-link">무슨기능넣을까요</a>
        </div>
    </div>
    <section id="manageArea">
        <div id="manageTop">
            <ul>
                <li><a href="#" data-content="menu1" class="dynamic-link">menu1</a></li>
                <li><a href="#" data-content="menu2" class="dynamic-link">menu2</a></li>
                <li><a href="#" data-content="menu3" class="dynamic-link">menu3</a></li>
            </ul>
        </div>
        <hr />
        <iframe id="contentFrame" src="main.jsp"></iframe>
    </section>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const dynamicLinks = document.querySelectorAll('.dynamic-link');
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

        function loadContent(content) {
            const fileName = content + '.jsp';
            document.getElementById('contentFrame').src = fileName;
        }
    </script>
</body>
</html>