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
	
	width: 960px;
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


#selllist_wrap {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* 4열 설정 */
    gap: 16px; /* 각 아이템 간의 간격 설정 */
    margin-top: 20px; /* 상단 여백 설정 */
}


.img {
    cursor: pointer; /* 클릭할 수 있음을 나타내는 커서 */
}

.img img {
    width: 215px; /* 이미지가 아이템 크기에 맞게 조정 */
    height: 215px; /* 비율 유지 */
    border-radius: 20px;
}
.title{
font-family: 'Cafe24Ohsquareair';
text-align:center;
}

</style>


</head>


<body>
	<Section>
		<article>
			<div class="seller_pf_wrap">
				<img src="/wishJam/img/seller.jpeg" class="seller_pf">
				
				<h3><%=nick%></h3> </div>
				
					<div id="selllist_wrap">
             <% 
             if(sellerproducts!=null && ! sellerproducts.isEmpty()){
            	 
				for(BestsellerDTO goods :sellerproducts ){
					System.out.println("Dddddd"+goods.getThumbnail_url());
					%>

				 <div class="img" onclick="location.href='/wishJam/goodsDetail/detail.jsp'">				
                        <img src="<%= goods.getThumbnail_url() %>" alt="썸네일">
                        <div class="title"><%=goods.gets_title() %></div>
                    </div>
					<%
				} }else{
				%> <p>작품이 없습니다.<p> <%} %>
				
				</div>
			
		</article>
	</Section>
</body>
</html>