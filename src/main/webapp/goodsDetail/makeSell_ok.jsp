<%@page import="com.wishJam.detail.DetailDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String getstart = request.getParameter("s_start");
String getend = request.getParameter("s_end");
SimpleDateFormat fr = new SimpleDateFormat("yyyy-MM-dd");
Date s_date = Date.valueOf(getstart);
Date e_date = Date.valueOf(getend);
%>
<jsp:useBean id="ddto" class="com.wishJam.detail.DetailDTO"></jsp:useBean>

<%
ddto.setS_start(s_date);
ddto.setS_end(e_date);
%>

<jsp:setProperty property="s_idx" name="ddto"></jsp:setProperty>
<jsp:setProperty property="m_nick" name="ddto"></jsp:setProperty>
<jsp:setProperty property="c_idx" name="ddto"></jsp:setProperty>
<jsp:setProperty property="g_name" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_title" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_content" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_hash" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_view" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_jjim" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_discnt" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_type" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_trade" name="ddto"></jsp:setProperty>
<jsp:useBean id="ddao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>

<jsp:useBean id="sgdto" class="com.wishJam.s_goods.S_goodsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="sgdto"></jsp:setProperty>
<jsp:useBean id="sgdao" class="com.wishJam.s_goods.S_goodsDAO"></jsp:useBean>

<%
int detail_result = ddao.addSellPage(ddto);

if (detail_result > 0) {
	int s_goods_result = sgdao.addGoods(sgdto);

	String msg = s_goods_result > 0 ? "성공" : "실패";
%>
<script>
	window.alert('게시글 등록에 <%=msg%>했습니다.');
	location.href = '/wishJam/';
</script>
<%
}
%>