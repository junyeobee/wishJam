<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.mypage.wishJam.MypageDTO"%>
<jsp:useBean id="mdto" class="com.mypage.wishJam.MypageDTO"></jsp:useBean>
<jsp:useBean id="mdao" class="com.mypage.wishJam.MypageDAO"></jsp:useBean>



<!DOCTYPE html>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매 내역</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="/wishJam/css/allFonts.css" />
    
</head>

<style>
body {
  font-family: 'Pretendard-Regular';
    background-color: #f8f8f8;
    margin: 0;
    padding: 20px;
}

.container {
    max-width: 800px;
    height:600px;
    margin: auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.title {
    text-align: center;
    color: #ff4900; /* 포인트 컬러 */
    margin-bottom: 20px;
    font-family: 'Cafe24Ohsquare';
}

.purchase-table {
    width: 100%;
    border-collapse: collapse;
}

.purchase-table th, .purchase-table td {
font-family: 'Pretendard-Regular';
    padding: 12px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.purchase-table th {
    background-color: #ff4900; /* 포인트 컬러 */
    color: white;
   
}

.purchase-table tbody tr:hover {
    background-color: #f1f1f1; /* 마우스 오버 시 배경색 */
}


</style>
<body>
<%
String s_idx_param = request.getParameter("s_idx");
int s_idx = 0;  // 기본값 설정

if (s_idx_param != null) {
    try {
        s_idx = Integer.parseInt(s_idx_param);
        
        ArrayList<MypageDTO> buylist = mdao.realbuyList(s_idx);
        %> <div class="container">
        <h1 class="title">구매 내역</h1>
        <table class="purchase-table">
            <thead>
                <tr>
                    <th>상품 이름</th>
                    <th>상품 갯수</th>
                    <th>상품 가격</th>
                    <th>주소</th>
                    <th>결제 번호</th>
                    <th>요청 사항</th>
                    <th>결제 수단</th>
                    <th>구매 날짜</th>
                </tr>
            </thead>
            <tbody>
            <%
     
                for (MypageDTO goods : buylist) {
                    if (goods != null) {
                    	System.out.println("구매내역"+goods);
            %>
            <tr>
                <td><%= goods.getSg_name() %></td>
                <td><%= goods.getBy_count() %></td>
                <td><%= goods.getBy_price() %>원</td>
                <td><%= goods.getBy_addr() %></td>
                <td><%= goods.getBy_idx() %></td>
                <td><%= goods.getBy_wish() %></td>
                <td><%= goods.getBy_sudan() %></td>
                <td><%= goods.getBy_date() %></td>
            </tr>
            <%
                    }}
                
            %>
        
        </tbody>
        </table>
    </div><%        
    } catch (NumberFormatException e) {
      
        e.printStackTrace();
    }
} else {
	%>
	<script>
				window.alert('상품이 존재하지 않습니다.');
				location.href='/wishJam/';
			</script>
	<%}

				
				%>

   

</body>
</html>
