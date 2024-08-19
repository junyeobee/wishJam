<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.wishJam.bestseller.BestsellerDTO" %>
<%@ page import="com.wishJam.bestseller.BestsellerDAO" %>
<jsp:useBean id="dao" class="com.wishJam.bestseller.BestsellerDAO"></jsp:useBean>

<%
String nick=request.getParameter("nick");
System.out.println("이거"+nick);
List<BestsellerDTO> sellerproducts = dao.bestSellersOne(nick);



%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
section {
	
	width: 920px;
	height: 1500px;
	margin: 0 auto;
}

article {
	margin-bottom: 50px;
}

article div {
	margin-right: 20px;
}

h2 {

	margin-bottom: 50px;
}

#selllist_wrap {
	width: 100%;
	height: 900px;
	border: 1px solid gray;
	display: flex;
	flex-wrap: wrap;
}

.bw_item {
	width: 210px;
	height: 210px;
	border: 1px solid gray;
	background-size: cover;
}

.seller_pf_wrap {
	width: 150px;
	height: 40px;
	display: table;
	margin-left: 5px;
}

.seller_pf {
	width: 35px;
	height: 35px;
	border-radius: 50px;
	border: 1px solid gray;
}

h3 {
	display: table-cell;
	vertical-align: middle;
}

.rank {
	width: 25px;
	height: 25px;
	background-color: black;
	border-radius: 3px;
	display: block;
	color: white;
	text-align: center;
	margin: 3px;
}

#seller_tg {
	width: 100%;
	display: flex;
	flex-wrap: wrap;
}

#seller_tg div {
	width: 120px;
	height: 35px;
	border: 1px solid gray;
	border-radius: 20px;
	margin-right: 7px;
	margin-bottom: 5px;
	text-align: center;
}


</style>


</head>
<body>
	<Section>
		<article>
			<div class="seller_pf_wrap">
				<img src="/wishJam/img/seller.jpeg" class="seller_pf">
				
				<h3><%=nick%></h3>
             <% 
             if(sellerproducts!=null && !sellerproducts.isEmpty()){
				for(BestsellerDTO dto :sellerproducts ){
					
					%>
							
			<div id="selllist_wrap">
				<div class="bw_item"><%=dto.getThumbnail_url() %></div>
		
			</div>
			
			
					<%
				} }else{
				%> <p>작품이 없습니다.<p> <%} %>
				
			
				
				
				
		
		</article>
	</Section>
</body>
</html>