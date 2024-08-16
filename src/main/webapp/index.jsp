<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<jsp:useBean id="mdao" class="com.manage.wishJam.manageDTO"/>
<jsp:useBean id="bdao" class="com.manage.wishJam.BannerDAO"/> 
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/wishJam/css/burger.css" />
<link rel="stylesheet" href="/wishJam/css/index.css" />
<link rel="stylesheet" href="/wishJam/css/allFonts.css" />
<link rel="stylesheet" href="/wishJam/css/headfoot.css" />
<link rel="stylesheet" href="/wishJam/css/slide.css" />
<script src="slider.js" defer></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <section>
        <article>
            <div class="slide slide_wrap">
                <%
                    ArrayList<String> arr = bdao.getBannerList();
                	if(arr!=null){
                		for(int i = 0; i < arr.size(); i++) {
                			%>
                				<div class="slide_item item<%=i%>">
                					<img src="<%=arr.get(i)%>" alt="" />
                				</div>
                			<%
                		}
                	}
                %>
            	      <div class="slide_prev_button slide_button">&lt;</div>
				      <div class="slide_next_button slide_button">&gt;</div>
				      <ul class="slide_pagination"></ul>
            </div>
        </article>
        <article>
            <h2>인기상품</h2>
            <div class="listBox">
                <div class="list"><label id="1">상품이미지</label></div>
                <div class="list"><a href="/wishJam/goodsDetail/detail.jsp">상품이미지</a></div>
                <div class="list">상품이미지</div>
                <div class="list">상품이미지</div>
            </div>
            <h2 id="test2">인기상품</h2>
            <div class="listBox">
                <div class="list">상품이미지</div>
                <div class="list">상품이미지</div>
                <div class="list">상품이미지</div>
                <div class="list">상품이미지</div>
            </div>
        </article>
    </section>
    <%@ include file="footer.jsp" %>
</body>
</html>
