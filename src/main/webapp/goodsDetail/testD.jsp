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
		i.style.left="30px";
	}
</script>
<style>
	#bbox {
	overflow: hidden;
	}
	
	@keyframes box-ani{
	from {
		transform: translate(0, 0);
	}
	to {
		transform: translate(100px, 0);
	}
	
	}
	
	#im {
	position: absolute;
	animation: box-ani 1s inear forwards;
	}
</style>
</head>
<body>
<div style="margin: 50px; overflow: hidden; width: 150px; border: 1px solid gray;">
	<div id="bbox" style="position: relative;"><img id="im" src='/wishJam/img/img1.jpg'></div>
	<div style="cursor: pointer;" onclick="gogogo()">>>>></div>
	
</div>
</body>
</html>