<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="cdao" class="com.wishJam.detail.ColorDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function gogogo(){
		var b = document.getElementById("bbox");
		var i = document.getElementById("im");
		i.classList.add("move");
	}
</script>
<style>
	#bbox {
	overflow: hidden;
	width: 100px;
	height: 100px;
	}
	
.move {
	transform: translateX(30px);
}
	
	#im {
	//position: absolute;
	position: relative;
	}
	
	.dddd{
	margin: 50px; overflow: hidden; width: 150px; height: 100px; border: 1px solid gray;}
</style>
</head>
<body>
<div id="bbox">
	<div id="im"><img src='/wishJam/img/img1.jpg'></div>
	
</div><div style="cursor: pointer;" onclick="gogogo()">>>>></div>
</body>
</html>