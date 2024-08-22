<%@page import="com.wishJam.detail.DetailDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.*"%>
<%
request.setCharacterEncoding("utf-8");
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

int s_goods_result = 0;
String sg_names[] = request.getParameterValues("sg_name");
String sg_prices[] = request.getParameterValues("sg_price");
String sg_counts[] = request.getParameterValues("sg_count");
String sg_limits[] = request.getParameterValues("sg_limit");
String sg_discnt[] = request.getParameterValues("sg_discnt");
String sg_img[] = request.getParameterValues("sg_img");
String sg_main[] = request.getParameterValues("sg_main");
%>


<jsp:setProperty property="s_idx" name="ddto"></jsp:setProperty>
<jsp:setProperty property="m_idx" name="ddto"></jsp:setProperty>
<jsp:setProperty property="c_idx" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_title" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_content" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_hash" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_discnt" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_type" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_tradeT" name="ddto"></jsp:setProperty>
<jsp:setProperty property="s_img" name="ddto"></jsp:setProperty>

<jsp:useBean id="ddao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>
<jsp:useBean id="sgdao" class="com.wishJam.s_goods.S_goodsDAO"></jsp:useBean>

<%
int detail_result = ddao.addSellPage(ddto);

if (detail_result > 0) {
	for (int i = 0; i < sg_names.length; i++) {
		s_goods_result+=sgdao.addGoods(ddto.getS_idx(), sg_names[i], Integer.parseInt(sg_prices[i]), Integer.parseInt(sg_counts[i]), Integer.parseInt(sg_limits[i]), Integer.parseInt(sg_discnt[i]), sg_img[i], Integer.parseInt(sg_main[i]));
	 }
	
	String msg = s_goods_result >= sg_names.length ? "성공" : "실패";
%>
<script>
	window.alert('게시글 등록에 <%=msg%>했습니다.');
	location.href = '/wishJam/';
</script>
<%
}
%>