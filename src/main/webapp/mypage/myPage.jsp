<%@page import="com.mypage.wishJam.MypageDAO"%>
<%@page import="com.member.wishJam.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.mypage.wishJam.MypageDTO"%>
<jsp:useBean id="mdto" class="com.mypage.wishJam.MypageDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.mypage.wishJam.MypageDAO"></jsp:useBean>
<%
//m_idx 세션 받기

	
/* 	int m_idx = (int)session.getAttribute("m_idx");
	
	String id = "user1_id";
	
	String nick="user1";
	
	session.setAttribute("userId", id);
	
	session.setAttribute("nick", nick);
	session = request.getSession();
	
	
	String path = request.getRealPath("/");
	mdto.setHomepath(path);
	File file = new File(mdto.getHomepath() + mdto.getUrl());
	File[] fileList = file.listFiles();
	String imgSrc = "/wishJam/img/member_profile/default.png";
	System.out.println(mdto.getHomepath());
	
	for (File f : fileList) {
		if (f.isFile() && f.getName().startsWith(id)) {
			imgSrc = "/wishJam/img/member_profile/" + f.getName();
			break;
		} else {
			imgSrc = "/wishJam/img/member_profile/default.png";
		}
	} 
	*/
	
	

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/wishJam/css/burger.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />


<style>
section {
	width: 960px;
	margin: 0 auto;
	font-family: 'Cafe24Ohsquare';
}

#mypage_section1 {
 font-family: 'Pretendard-Regular';
	width: 100%;
	height: 250px;
}

#mypage_wrap {
 font-family: 'Pretendard-Regular';
	width: 300px;
	height: 100px;
	margin: 0 auto;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	
}
#mypage_wrap div{
margin-bottom:10px;
}
.profile_item {
	height: 20px;
	width: 100%;
	text-align: center;
}

.profileimg img {
	width: 80px;
	height: 80px;
	border-radius: 100px;
	background-color: #C4C4C4;
	text-align: center;
	
}

.container {
	width: 100%;
	heigth: 340px;
	display: flex;
	background-color:#C4C4C4
	gap: 1.2rem !important;
	row-gap: 1.2rem !important;
	overflow: hidden;
}


.container1{
gap: 1.2rem !important;

}
.item {
gap: 1.2rem !important;
	width: 223px;
	height: 340px;
	border: 1px solid #C4C4C4;
	position: relative;
	border-radius: 20px;

}

.inner {
	width: 100%;
	height: 120px;
	background-color:#F0F1F4;
	position: absolute;
	border-radius: 0 0 20px 20px;
	bottom: 0;
	font-family: 'Pretendard-Regular';
}

.inner div{

margin: 10px 0 0 10px;
}

.img img {
	width: 100%;
	height: 240px;
	object-fit: cover;
	border-radius: 20px 20px 0 0;
}

.discount {
	color: #FF4900;
}

.writer {
	font-size: 14px;
	color: #747474;
}

#mypage_section2 {
 font-family: 'Pretendard-Regular';
	height: 240px;
	background-color:#F0F1F4;
	text-align: center;
	border-radius: 10px;
	margin-bottom: 60px;
	
}

.nickname {
	font-weight: 600;
	font-size: 18px;
}

.introduce {
	font-weight: 500;
	font-size: 18px;
	line-height : 240px;

}

.edit{
cursor : pointer;
width:8em;
height:30px;
border: 1px solid lightgray;
border-radius: 20px;
font-size:13px;
color: gray;
line-height : 30px;
position: absolute;
top:53%;

}


.buylist{

border:1px solid red;
position: absolute;
top:170%;
width:960px;
height:500px;
font-family: 'Cafe24Ohsquare';
}


.title{
position: absolute;
top:20%;
left:16%;
}

.sellList{
position:absolute;
top:100%;

}

</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<script>
        //현재 로그인 한 상태로 왔는지 체크하는 로직입니다. 헤더에서 받은 m_idx값이 만약 0이라면(헤더에서 세션이 없으면 0으로 세팅되도록 설정되어있습니다.) 해당 페이지 사용못하도록 구현했습니다
        //윤나님 파이팅하세용 
		var m_idx = <%=m_idx %>;
        if (m_idx === 0) {
        	//alert('로그인을 하세요');
           // window.history.back();
        } 
        
        
        
        
        function godetail(i){
        	window.location.href = '/wishJam/goodsDetail/detail.jsp?s_idx='+i
        }
        
    </script>
  
  
  
    
	<section>
		
		<article id="mypage_section1">
			<div id="mypage_wrap">	
				<div class="profileimg">
					<!-- 이거 dto에서 받아오도록 하시면 될것같습니다. 즉, dto에 m_img 인자 추가 -> mmdto의 인자 생성자에 추가,쿼리 수정 > dto객체를 이미지태그 위에서 불러오면 되겠죠? -->
					<!-- 그냥 헤더에서 받아오는 로직있어서 그거썼습니다. 수정안하셔도됩니다 -->
					<img src="<%=src %>">
				</div>
				
				<%
				
				/*
				int test = 12;
				
				session.setAttribute("m_idx", test);
				
				session= request.getSession(); */
				
				//Integer sessionMIdx = (Integer) request.getSession().getAttribute("m_idx");
				//int ownerId = Integer.parseInt(request.getParameter("ownerIdx"));

				//int ownerMidx = mdao.mypageOwner(ownerId); 
				
				// 요청 파라미터에서 ownerIdx 가져오기
				
				
			    String ownerIdxParam = request.getParameter("ownerIdx");
			    int ownerId = Integer.parseInt(ownerIdxParam);
			    if (ownerIdxParam != null) {
			        
			        
			    	if(ownerId == m_idx){
			    		%>
			    		
			    		<%
			    	}
			        System.out.println("ownerIdx parameter is null.");
			    }
				
				
				//m_idx = (sessionMIdx != null) ? sessionMIdx : 0; 
				
				 MypageDTO mmdto = new MypageDTO(); 
				 
				 System.out.println(mmdto);
					
					if(m_idx == 0 || m_idx!=ownerId ){ //로그인한 m_idx != 마이페이지 주인m_idx
					   
					
						mmdto= mdao.memberGet(ownerId);
					   mmdto= mdao.mypageOwner(ownerId);
					%>
					<h2 class="title">
					<%=mmdto.getM_nick() %>의 위시잼💎</h2>
					
					<%
						
						
					}else if (m_idx != 0 && m_idx==ownerId) {  // 로그인한 m_idx = 마이페이지 주인 m_idx
					
							
							
						mmdto= mdao.memberGet(ownerId);
					    System.out.println("됨됨됨");

						%>
						<h2 class="title">마이페이지</h2>
						<div class="profile_item edit" onclick="location.href='/wishJam/mypage/mypageEdit.jsp'">수정하기  ></div>
						
						<article class="buylist">
						
			<h3>구매내역</h3>
			<hr>
			<div id="celllist_wrap">
				<div class="mypage_item"></div>
				<div class="mypage_item"></div>
				<div class="mypage_item"></div>
				<div class="mypage_item rightbox"></div>
			</div>
		</article>
						
						<%
						
								
					}
					%>
					
				<div class="profile_item"><%=mmdto.getM_grade()%></div>
				<div class="profile_item nickname" ><%=mmdto.getM_nick()%></div>

			</div>
	</article>
		<article id="mypage_section2">
		<%
		MypageDTO mmdto_2 = new MypageDTO(); 
		if(mmdto_2.getProfile()==null){
			
			%><p>자기소개를 입력해주세요.</p><%
			
		}else{ %>
			<div class="introduce"><%=mmdto_2.getProfile()%></div>
		</article>
		<%} %>
				
		<article class="sellList">
			<h3>판매내역</h3>
			<hr>

			<div class="container">
				<%
				int idx = m_idx!=0 ? 0 : m_idx;
				List<MypageDTO> buylist =  mdao.buyList(ownerId);
				for (MypageDTO goods : buylist) {
					
					if(goods ==null){
						
						%> <p> 판매 내역이 없습니다. <p><%
					}else{
				%>
				<div class="item">
					<div class="img" onclick="godetail('<%=goods.getS_idx()%>');">
						<img src="<%=goods.getS_img()%>" alt="썸네일">
					</div>

					<div class="inner">
						<div><%=goods.getS_title()%></div>
						<div><%=goods.getSg_price()%></div>
					</div>
				</div>
				<%
				}
					}
				%>
			</div>
		</article>


		

	</section>
</body>
</html>