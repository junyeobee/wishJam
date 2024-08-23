<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<jsp:useBean id="cdto" class="com.cart.wishJam.CartDTO"></jsp:useBean>
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="cdao" class="com.cart.wishJam.CartDAO"></jsp:useBean>
<%  
	String[] products = request.getParameterValues("product");
	int result = cdao.ckchange(cdto);
	
    String productParams = "";
    if (products.length > 0) {
        StringBuilder sb = new StringBuilder();
        for (String product : products) {
            if (sb.length() > 0) {
                sb.append("&");
            }
            sb.append("product=").append(URLEncoder.encode(product, "UTF-8"));
        }
        productParams = "?" + sb.toString();
    }
    
 	// URL 리다이렉트
    String redirectUrl = "/wishJam/pay/pay.jsp" + productParams;
    response.sendRedirect(redirectUrl);
%>