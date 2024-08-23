<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="cdao" class="com.wishJam.detail.ColorDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

var ld=new Object();
ld.v=[4,5,6];

console.log(ld.v[1]);
	function countinput(){
		
		var itag = document.getElementsByTagName('input');
		
		console.log(itag.length);
	}
</script>
</head>
<body>
	<form action="testD_ok.jsp">
		<input type="checkbox" name="box1" value="1" onclick="countinput()"> <input
			type="checkbox" name="box2" value="2"> <input type="checkbox"
			name="box3" value="3">
			<input type="submit" value="전송">
	</form>
</body>
</html>