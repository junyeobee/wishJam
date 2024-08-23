<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.*" %>
<%@ page import="com.wishJam.bestseller.BestsellerDTO" %>
<jsp:useBean id="bdao" class="com.wishJam.bestseller.BestsellerDAO"></jsp:useBean>
	
<%
String[] sellerArray = {"user1","user2","user3"};
List<String> sellerslist = new ArrayList<>();

List<BestsellerDTO> bestsellerlist= new ArrayList<>();

for(String sellers: sellerArray){
	
	BestsellerDTO bdto= new BestsellerDTO();
	bdto.setM_nick(sellers);
	
List<BestsellerDTO> sellerProducts = bdao.bestSellers(bdto); //상품정보를 가져와서 리스트에 추가함.

if(sellerProducts !=null){
	
	bestsellerlist.addAll(sellerProducts);
}


	
}


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

section {
	 font-family: 'Cafe24Ohsquareair';
	width: 940px;
	height: 1500px;
	margin: 0 auto;
}

.seller_pf_wrap {
    margin-bottom: 20px; /* 작가 프로필과 상품 목록 사이의 여백 */
}


.selllist_wrap {
    margin-top: 10px; /* 작가 이름과 상품 목록 사이의 여백 */
}

.container {
    display: flex; /* 플렉스박스를 사용하여 가로 배치 */
    flex-wrap: wrap; /* 줄바꿈 허용 */
    gap: 1.2rem !important;
}

.item {
   width: 215px;
	height: 245px;
    text-align: center; /* 텍스트 중앙 정렬 */
    position: relative;
	border-radius: 20px;
	
}

.img {
    cursor: pointer; /* 클릭할 수 있음을 나타내는 커서 */
    
}

.img img {
    width: 215px; /* 이미지가 아이템 크기에 맞게 조정 */
    height: 215px; /* 비율 유지 */
    border-radius: 20px;
}

.rank {
    display: block; /* 순위를 블록으로 표시 */
    font-weight: bold; /* 강조 */
    margin-bottom: 5px; /* 순위와 이미지 사이의 여백 */
     font-family: 'Cafe24Ohsquareair';
}
.seller_pf{
width:35px;
height:35px;
 font-family: 'Cafe24Ohsquareair'; 	

}
</style>
</head>
<body>
	<section>

		<article>
		  <div class="seller_pf_wrap">
        <%
        String currentNick = ""; // 현재 작가명
        String currentImage = ""; // 현재 작가 이미지
        int rank=1;

        for (int i = 0; i < bestsellerlist.size(); i++) {
            BestsellerDTO goods = bestsellerlist.get(i);
            
            // 작가명이 변경되면 새로운 섹션 시작
            if (!currentNick.equals(goods.getM_nick())) {
                // 이전 작가의 상품 목록을 닫기
                if (!currentNick.isEmpty()) {
                    out.println("</div>"); // 이전 작가의 상품 목록 닫기
                    rank=1;
                }
                
                // 현재 작가명과 이미지 업데이트
                currentNick = goods.getM_nick();
                currentImage = goods.getThumbnail_url(); // 작가 이미지 URL을 사용하거나 고정된 이미지로 설정
        %>
                <h3>
                    <img src="/wishJam/img/seller.jpeg" class="seller_pf"> <!-- 작가 프로필 이미지 -->
                    <%= currentNick %> <!-- 작가명 -->
                </h3>
                <div class="selllist_wrap">
                    <div class="container">
        <%
            }
        %>
                <div class="item">  
                
               
                    <span class="rank"><%= rank%></span> 
                    <div class="img" onclick="location.href='/wishJam/goodsDetail/detail.jsp'">				
                        <img src="<%= goods.getThumbnail_url() %>" alt="썸네일">
                    </div>
                </div>
        <%
        		rank++;
        	if(rank>4){
        		
        		rank=1;
            }
        }     
        
        // 마지막 작가의 상품 목록 닫기
        if (!currentNick.isEmpty()) {
            out.println("</div>"); // 마지막 작가의 상품 목록 닫기
        }
    %>    
    </div>
		</article>


	</section>

</body>
</html>