<%@page import="javax.websocket.Session"%>
<%@page import="java.io.File"%>
<%@page import="javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.manage.wishJam.manageDAO" scope="session"/>
<head>
<style>
	#imgbox{
		width:100px;
		height:100px;
	}
</style>
</head>
<%
    String id = (String)session.getAttribute("userId");
    String p = (String)session.getAttribute("userPwd");
    String pwd = request.getParameter("pwd");
    if (pwd != null) {
        if (pwd.equals(p)) {
            
            %>
            <script>
                function modifyImg(){
                    window.open('ImgUpload.jsp','ImgUpload','width=400,height=300');
                }
            </script>
            <div>            	
                <h1>관리자 정보수정</h1>
                <%
                    String path = request.getRealPath("/");
                    mdao.setHomePath(path);
                    File file = new File(mdao.getHomePath() + mdao.getUrl());
                    File[] fileList = file.listFiles();
                    String imgSrc = "";
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
                <div>
                    <label>프로필 사진 변경</label>
                    <div id = "imgbox">
                        <img src="<%= imgSrc %>" alt="managerImg" onclick="modifyImg();"/>
                    </div>
                </div>
            </div>
            <%
        } else {
            %>
            <script>
                window.alert('재입력');
                window.location='managerModify.jsp';
            </script>
            <%
        }
    } else {
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
