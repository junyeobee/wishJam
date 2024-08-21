<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.manage.wishJam.MyFileRenamePolicy"%>

<jsp:useBean id="ridao" class="com.wishJam.review.reviewImgDAO" scope="session"></jsp:useBean>
<%
request.setCharacterEncoding("UTF-8");
String path = request.getRealPath("/");
ridao.setHomePath(path);
String savepath = ridao.getHomePath() + ridao.getEverypath();
int size = 10 * 1024 * 1024;

MyFileRenamePolicy fr = new MyFileRenamePolicy(ridao.getS_idx()+"_"+ridao.getM_idx() + "_review" +ridao.getCnt() );
MultipartRequest mr = new MultipartRequest(request, savepath, size, "UTF-8", fr);
String imgname = mr.getFilesystemName("uploadImg");
%>
<script>
	var txt = opener.document.getElementById("rvImg");
	var val = opener.document.getElementById("r_img");
	var li1 =document.createElement("li");
	var imgE = document.createElement("img");
	imgE.className = "review_img";
	imgE.setAttribute("src","/wishJam/img/review/<%=imgname%>");
	li1.append(imgE);
	txt.append(li1);
	val.value+="/wishJam/img/review/<%=imgname%>*";
	window.self.close();
</script>