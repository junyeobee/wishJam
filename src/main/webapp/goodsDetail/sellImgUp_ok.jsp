<%@page import="org.apache.tomcat.util.http.fileupload.FileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.manage.wishJam.MyFileRenamePolicy" %>

<jsp:useBean id="idao" class="com.wishJam.detail.DetailImgDAO" scope="session"></jsp:useBean>

<%
request.setCharacterEncoding("UTF-8");
String path = request.getRealPath("/");
idao.setHomePath(path);
String savepath = idao.getHomePath() + idao.getEverypath();
int size = 10 * 1024 * 1024;

String whereImg = idao.getSelect_id();
String lastnum = whereImg.substring(whereImg.length()-1);

if (whereImg.equals("content_img")) {
	MyFileRenamePolicy fr = new MyFileRenamePolicy(idao.getS_idx()+"_content"+idao.getImgcnt());
	MultipartRequest mr = new MultipartRequest(request, savepath, size, "UTF-8", fr);
	String imgname = mr.getFilesystemName("uploadImg");
%>
<script>
	var txt = opener.document.getElementById("txt");
	var imgE = document.createElement("img");
	var imgbr = document.createElement("br");
	imgE.className = "contentImg";
	imgE.setAttribute("src","/wishJam/img/sellgoods/<%=imgname%>");
	txt.append(imgbr, imgE);
	window.opener.makeSellfm.s_content.value = txt.innerHTML;
	window.self.close();
</script>
<%
} else if (whereImg.equals("thumb_img")) {
	MyFileRenamePolicy fr = new MyFileRenamePolicy(idao.getS_idx()+"_thumb");
	MultipartRequest mr = new MultipartRequest(request, savepath + "goodsThumb/", size, "UTF-8",fr);
	String imgname = mr.getFilesystemName("uploadImg");
%>
<script>
	var tbox = opener.document.getElementById("thumb_img");
	tbox.innerHTML="";
	
	var imgE = document.createElement("img");
	imgE.className = "thumbImg";
	imgE.setAttribute("src","/wishJam/img/sellgoods/goodsThumb/<%=imgname%>");
	
	var inputE= opener.document.makeSellfm.s_img;
	inputE.value = "/wishJam/img/sellgoods/goodsThumb/<%=imgname%>";
	
	tbox.append(imgE);
	window.self.close();
</script>
<%
} 
else if (whereImg.contains("option_img")) {
	MyFileRenamePolicy fr = new MyFileRenamePolicy(idao.getS_idx()+"_option"+lastnum);
	MultipartRequest mr = new MultipartRequest(request, savepath + "options/", size, "UTF-8",fr);
	String imgname = mr.getFilesystemName("uploadImg");
%>
<script>
	var tbox2 = opener.document.getElementById("<%=whereImg%>");
	tbox2.innerHTML="";

	var imgE = document.createElement("img");
	imgE.className = "optionimg";
	imgE.setAttribute("src","/wishJam/img/sellgoods/options/<%=imgname%>");
	
	var inputE = opener.document.getElementById("sg_img"+<%=lastnum%>);
	inputE.value="/wishJam/img/sellgoods/options/<%=imgname%>";
	
	tbox2.append(imgE);
	window.self.close();
</script>
<%
}
%>