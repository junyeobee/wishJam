<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id = "maindao" class = "com.manage.wishJam.mainDAO"></jsp:useBean>
<jsp:useBean id = "ctdao" class ="com.manage.wishJam.M_CartegoryDAO"/>
<%@ page import ="com.manage.wishJam.M_CategoryDTO"%>
<%@ page import ="java.util.*" %>
<link rel="stylesheet" href="/wishJam/css/headfoot.css" />
<link rel="stylesheet" href="/wishJam/css/burger.css" />
<%
	String m_nick = (String)session.getAttribute("m_nick");
	Integer m_idxObj = (Integer) session.getAttribute("m_idx");
	int m_idx = (m_idxObj != null) ? m_idxObj : 0;
	String src = maindao.getImgsrc(m_idx) != null ? maindao.getImgsrc(m_idx) : "";
%>
<script>
function navView() {
    var burger = document.querySelector('#burger');
    var leftNav = document.querySelector('.leftNav');
    
    if (burger.checked) {
        leftNav.style.transform = 'translateX(0)';
    } else {
        leftNav.style.transform = 'translateX(-120%)';
    }
}
function showExtend(i){
    var element = document.querySelector('#smallToBig' + i);
    if (element.style.display === 'none' || element.style.display === '') {
        element.style.display = 'block';
    } else {
        element.style.display = 'none';
    }
}
</script>
<style>
	.leftNavExtend{
		display: none;
	    justify-content: center;
	    padding: 0;
	    margin-left: 0;
	    top: 0px;
	    left: 100px;
		width: 100px;
	    background-color: black;
	    color: white;
	    padding-top: 10px;
	    position: absolute;
	    height: 100%;
	    min-height: 400px;
	    z-index: 10000;
	}
	.leftNavSmall{
		width: 50px;
		height: 50px;
		border-radius: 50%;
		background-color: white;
		margin: 0 auto;
		display: flex;
		justify-content: center;
		align-items: center;
		cursor: pointer;
	}
	.smallCategoryImg{
		width: 90%;
		height: 90%;
		border-radius: 50%;
		object-fit: cover;
	}
	#leftNavSmall0{
		margin-top:20px;
	}
</style>
<header>
    <label class="burger" for="burger">
        <input type="checkbox" id="burger" onchange="navView();">
        <span></span>
        <span></span>
        <span></span>
    </label>
    <div class="top menu">
        <div class="leftNav">
        	<div class="info"><label>카테고리</label></div>
	        <%
				ArrayList<M_CategoryDTO> categoryarr = ctdao.getBigCategory();
				if (categoryarr != null) {
				for (int i = 0; i < categoryarr.size(); i++) {
					int big = categoryarr.get(i).getC_big();
				%>
		            <div class="leftNavBig" onclick="showExtend('<%=big%>');"><img class = "bigCategoryImg" src="<%=categoryarr.get(i).getC_img() %>" alt="categoryBig"/></div>
		            <div class="infoBig"><label><%= categoryarr.get(i).getC_name() %></label></div>

        			<div id = "smallToBig<%=big %>" class="leftNavExtend">
        			<%
        			ArrayList<M_CategoryDTO> categoryarr2 = ctdao.getSmallCategory(big);
					if (categoryarr2 != null) {
						for (int j = 0; j < categoryarr2.size(); j++) {
		        	%>
						<div id = "leftNavSmall<%=j %>" class="leftNavSmall" onclick="window.location.href = '/wishJam/allgoods/allGoods.jsp?c_idx=<%=categoryarr2.get(j).getC_idx()%>'"><img class = "smallCategoryImg" src="<%=categoryarr2.get(j).getC_img() %>" alt="categorySmall"/></div>
						<div class="infoBig"><label><%=categoryarr2.get(j).getC_name() %></label></div>
	        			<%
						}
					}
					%></div><%
				}
			}
        %>
    	</div>
    </div>
    <a href="/wishJam/index.jsp">
    <img src="/wishJam/img/logo.png" alt="mainLogo" class="logo">
	</a>
    <div class="top center">
        <form action="/wishJam/allgoods/allGoods.jsp">
            <input type="text" id="top_Search" name = "search" class="search-bar"/> 
            <input type="submit" value="검색" class="search-btn"/>
        </form>
    </div>
    <% if(m_nick==null){ %>
    <div class="top right notlogin">
        <a href="/wishJam/login/login.jsp">로그인</a> | 
        <a href="/wishJam/login/member.jsp">회원 가입</a>
    </div>
    <% } else { %>
    <div class="top right login">
        <img src="<%=src %>" alt="profile" class="profile-icon"/>
        <label><%=m_nick %>님</label>
        <div class="funcBox">
            <ul>
                <li><a href="/wishJam/mypage/myPage.jsp">마이페이지</a></li>
                <li><a href="/wishJam/goodsDetail/makeSell.jsp">판매글 작성</a></li>
                <li><a href="/wishJam/cart/cart.jsp">장바구니</a></li>
                <li><a href="/wishJam/login/logout.jsp">로그아웃</a></li>
            </ul>
        </div>
    </div>
    <% } %>
</header>
</html>