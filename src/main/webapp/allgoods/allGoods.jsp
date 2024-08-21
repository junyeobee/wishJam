<%@page import="com.allgoods.wishJam.AllgoodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.allgoods.wishJam.AllgoodsDTO"%>
<%@ page import="com.allgoods.wishJam.JjimDTO" %>
<jsp:useBean id="dao" class="com.allgoods.wishJam.AllgoodsDAO"></jsp:useBean>
<jsp:useBean id="jdto" class="com.allgoods.wishJam.AllgoodsDTO"></jsp:useBean>
<jsp:useBean id="jdao" class="com.allgoods.wishJam.JjimDAO"></jsp:useBean>



<%

int Id= 1; //임시 멤버번호 
session.setAttribute("m_idx", Id);
Integer memberId = (Integer)session.getAttribute("m_idx");

if(request.getMethod().equalsIgnoreCase("POST")){
	
int productId = Integer.parseInt(request.getParameter("productId"));
String s_title = request.getParameter("s_title");


if(memberId == null){
	
		%>
		<script>
		window.alert('로그인이 필요합니다.');
		</script>
		
		<%
		
	}else{
		
		JjimDTO jjdto= new JjimDTO();
		jjdto.setM_idx(memberId);
		jjdto.setS_idx(productId);
	
		
		boolean added = jdao.addJjim(jjdto);
		
		if(added){
			
			jdao.incrementJjim(productId);
			
			 // URL에 쿼리 파라미터 추가
            response.sendRedirect("allGoods.jsp?added=1&productId=" + productId);
            return; // 추가 후 현재 요청 종료
		}

		
	}

}
//찜한 상품 목록을 가져오는 로직 (예시)
List<Integer> jjimProductIds = jdao.getJjimProductIds(memberId); // 찜한 상품 ID 목록을 가져오도록 가정


//페이징
	String cp_s = request.getParameter("cp");
	if(cp_s==null||cp_s.equals("")){
		cp_s="1";
	}
	int cp = Integer.parseInt(cp_s);
	
	//총 게시물수
	int totalcnt = dao.getTotalcnt();
	//한번에 보여줄 리스트 수
	int listsize = 10;
	//페이지수
	int pagesize = 5;
	
	//사용자 현재위치
	//int cp=1;
	
	int totalpage = (totalcnt/listsize)+1;
	if(totalcnt%listsize == 0)totalpage--;
	
	int usrgroup=cp/pagesize;
	if(cp%pagesize==0)usrgroup--;
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/wishJam/css/burger.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<meta charset="UTF-8">

<style>
section {
  font-family: 'Cafe24Ohsquareair';
	width: 960px;
	height: 2000px;
	margin: 0 auto;
}

#filter {
	float: right;
	
}

.container {
	width: 100%;
	display: flex;
	flex-wrap: wrap;
	padding-top: 30px;
	gap: 1.2rem !important;
	row-gap: 1.2rem !important;
}

.item {
	width: 223px;
	height: 380px;
	position: relative;
	border-radius: 20px;
	border: 1px solid #C4C4C4;
}

.inner {
	width: 100%;
	
	height: 140px;
	background-color:#F2F2F2;
	position: absolute;
	border-radius: 0 0 20px 20px;
	position: absolute;
	bottom: 0;
	padding-top:10px;
}

.inner div {
	margin-bottom: 10px;
	margin-left:6px;
}

#sortOrder {
	width: 130px;
	height: 50px;
	border: 1px solid #C4C4C4;
	border-radius:10px;
}

.img img {
	width: 100%;
	height: 240px;
	object-fit: cover;
	border-radius: 20px 20px 0 0;
	
}

.heart {
	width: 32px;
	height: 30px;
	position: absolute;
	right: 0;
	bottom: 0;
	display: block;
}



.writer {
	font-size: 14px;
	color: #747474;
}

.pagination{
width:14em;
height:60px;
margin:0 auto;
margin-top:30px;
font-size:13px;
}

.discount{
display:inline;
font-weight:bold;
color:orange;
}


.jbt{
border:none;
background-color:#F2F2F2;
position: absolute;
right: 7px;
bottom: 10px;
cursor: pointer;
font-size:1.4em;
}


</style>


<script>



function updateSortOrder() {
    const selectElement = document.getElementById('sortOrder');
    var selectedValue=selectElement.options[selectElement.selectedIndex].value;
    window.location.href = '/wishJam/allgoods/allGoods.jsp?sortOrder='+selectedValue;
}

</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>
		<h2>전체 상품</h2>
		<article>
			<div id="filter">
		<select name="sortOrder" id="sortOrder" onchange="updateSortOrder()">
        <option value="popular" <%= request.getParameter("sortOrder") != null && request.getParameter("sortOrder").equals("popular") ? "selected" : "" %>>인기순</option>
        <option value="latest" <%= request.getParameter("sortOrder") != null && request.getParameter("sortOrder").equals("latest") ? "selected" : "" %>>최신순</option>
    </select>
			</div>
		</article>
		<div class="container">
		  <%

		  String sortOrder=request.getParameter("sortOrder");
		  
		  System.out.println("sortorder"+sortOrder);	
		  
		  List<AllgoodsDTO> productList = dao.allGoods(sortOrder);
		  
		  
    if (productList == null || productList.isEmpty()) {
        out.println("상품이 없습니다.");
    } else {
        for (AllgoodsDTO products : productList) {
            
        	// 찜한 상태 확인
            boolean isJjimmed = jjimProductIds.contains(products.getS_idx());
            String buttonText = isJjimmed ? "🧡" : "🤍";
            
			%>
			

			<form action="allGoods.jsp" method="post" >
			<div class="item" >
				<div class="img" onclick="location.href='/wishJam/goodsDetail/detail.jsp'">
					<img src="<%=products.getS_img()%>" alt="썸네일">
				</div>
				<div class="inner"> 	
					<div class="writer"><%=products.getM_nick()%></div>
			<input type="hidden" name="s_title" value="<%=products.getS_title()%>"> <!-- 상품 제목 -->
            <input type="hidden" name="productId" value="<%=products.getS_idx()%>"> <!-- 상품 ID -->
					<div name="s_title"><%=products.getS_title()%></div>
					<div>
					
					
					<% 
					int dis=products.getS_discnt();
					
					if(dis>0){
		                  
		                 %><span class="discount"><%=dis +"%"%></span>
		                <%=(int)(products.getSg_price()*(1-(double)products.getS_discnt()/100)) %> <%
		               }else{%>
		                  <%=products.getSg_price() %>
		                  <% }%>
		               
		               </div>


                  <button type="submit" id="jbt_<%= products.getS_idx() %>" class="jbt"><%= buttonText %></button> <!--제출 버튼 -->
   
					
				</div>

			</div>
  </form>
			<%
			}
    } 
			%>
		</div>






		<!-- 페이징처리  -->
			 <div class="pagination">
        	<span>Showing <%=(totalcnt/listsize)>=cp?cp*listsize:totalcnt %> to <%=totalcnt %> of <%=cp %> entries</span>
			<div class="pagination-controls">
			    <%
			        if(usrgroup != 0) {
			            %><button class="pagination-btn" onclick="navigateTo('<%=(usrgroup-1)*pagesize+pagesize %>')">Prev</button><%
			        }
			    %>
			    
			    <%
			        for(int i = usrgroup*pagesize+1; i<=usrgroup*pagesize+pagesize; i++){
			            %>
			            &nbsp;<button class="pagination-btn" onclick="navigateTo('<%=i%>')"><%=i%></button>&nbsp;
			            <%
			            if(i==totalpage){
			                break;
			            }
			        }
			    %>
			    <%
			        if(usrgroup != (totalpage/pagesize-(totalpage%pagesize==0?1:0))) {
			            %><button class="pagination-btn" onclick="navigateTo('<%=(usrgroup+1)*pagesize+1%>')">Next</button><%
			        }
			    %>
			</div>
    	</div>
	</section>
	

</body>
</html>