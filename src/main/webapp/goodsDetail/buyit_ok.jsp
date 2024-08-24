<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="gcdao" class="com.wishJam.detail.DetailDAO"></jsp:useBean>
<%
	String[] midxs = request.getParameterValues("m_idx");
	String[] sgidxs = request.getParameterValues("sg_idx");
	String[] ctcounts = request.getParameterValues("ct_count");
	
	ArrayList<Integer> nums = new ArrayList<Integer>();
	int firstnum = gcdao.getLastnum();
	String addr = "";
	int result=0;
	
	for(int i=0; i<midxs.length;i++){
		addr+="product="+firstnum;
		if(i!=midxs.length-1){
			addr+="&";
		}
		
		result+=gcdao.addBuyit(firstnum, Integer.parseInt(midxs[i]), Integer.parseInt(sgidxs[i]), Integer.parseInt(ctcounts[i]));
		firstnum+=1;
	}
	
	if(result==midxs.length){
%>
	<script>
		location.href='/wishJam/pay/pay.jsp?<%=addr %>';
	</script>
<%
	}
%>