<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>
<%
	String useraddr = request.getParameter("useraddr");
	if(useraddr != ""){
		%>
			<script>
	         window.alert('배송지가 변경되었습니다.');
	         let mAddrElement = opener.document.getElementById('m_addr');
	           if (mAddrElement) {
	               mAddrElement.innerHTML = '<%= useraddr %>';
	           }
	         window.self.close();
	     	</script>
		<%
	} else {
		%>
			<script>
	         window.alert('배송지를 입력해주세요.');
	         location.href='addrUpd.jsp';
	        </script>
		<%
	}
%>