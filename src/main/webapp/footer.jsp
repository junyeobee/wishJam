<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <style>
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.footer {
font-family: 'Pretendard-Regular';
  background-color: #fff0f5; /* 배경색 */
    padding: 40px 20px; /* 패딩 */
    color: #333; /* 텍스트 색상 */
    width: 100%; /* 폭을 100%로 설정 */
    position: relative; /* 상대 위치 설정 */
    left: 0; /* 좌측 위치 설정 */
    font-size:14px;
   
}

.footer-container {
    display: flex;
    justify-content: space-between; /* 섹션 간의 간격 분배 */
    max-width: 1200px; /* 최대 너비 */
    margin: 0 auto; /* 중앙 정렬 */
}

.footer-section {
    flex: 1; /* 각 섹션이 동일한 비율로 공간을 차지 */
    margin: 0 20px; /* 섹션 간의 간격 */
}

.footer-section h2,
.footer-section h3 {
    margin-bottom: 20px; /* 제목 아래 여백 */
}

.footer-section p {
    margin-bottom: 10px; /* 문단 아래 여백 */
}

.footer-section ul {
    list-style: none; /* 기본 리스트 스타일 제거 */
}

.footer-section ul li {
    margin-bottom: 10px; /* 리스트 아이템 아래 여백 */
}

.footer-section a {
    text-decoration: none; /* 링크 밑줄 제거 */
    color: #007bff; /* 링크 색상 */
}

.footer-section a:hover {
    text-decoration: underline; /* 링크에 마우스 오버 시 밑줄 */
}

.footer-bottom {
    text-align: center; /* 중앙 정렬 */
    margin-top: 20px; /* 위 여백 */
    font-size: 14px; /* 폰트 크기 */
    color: #666; /* 텍스트 색상 */
}
    
    
    </style>
<footer>
	<footer class="footer">
    <div class="footer-container">
        <div class="footer-section about">
            <h2>위시잼</h2>
           
        </div>
        <div class="footer-section links">
            <h3>링크</h3>
            <ul>
                <li><a href="#">홈</a></li>
                <li><a href="#">상품 목록</a></li>

                <li><a href="#">내 계정</a></li>
                <li><a href="#">고객 지원</a></li>
            </ul>
        </div>
        <div class="footer-section contact">
            <h3>연락처</h3>
            <p>이메일: info@wishjam.com</p>
            <p>전화: 123-456-7890</p>
            <p>주소: 서울특별시 강남구 위시잼 빌딩</p>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 위시잼. All rights reserved.</p>
    </div>
</footer>

</footer>
