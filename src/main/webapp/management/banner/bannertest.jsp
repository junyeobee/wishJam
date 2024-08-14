<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Banner Management</title>
    <style>
        .form-container {
            width: 500px;
            margin: 0 auto;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input[type="text"],
        .form-group input[type="date"],
        .form-group input[type="url"] {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group input[type="checkbox"],
        .form-group input[type="radio"] {
            margin-right: 10px;
        }
        .form-group .image-upload {
            padding: 50px;
            border: 2px dashed #ccc;
            text-align: center;
            background-color: #f9f9f9;
        }
        .form-group .btn-group {
            margin-top: 10px;
        }
        .form-group .btn-group button {
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .form-group .btn-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <form action="upload.jsp" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text" id="title" name="title" placeholder="관리용 제목(사용자에겐 표시되지 않음)">
            </div>
            <div class="form-group">
                <label for="date-from">기간</label>
                <input type="date" id="date-from" name="date-from" value="2022-12-02">
                <input type="date" id="date-to" name="date-to" value="2022-12-02">
            </div>
            <div class="form-group">
                <label for="devices">대상 기기</label>
                <input type="checkbox" id="desktop" name="devices" value="desktop" checked> 데스크톱
                <input type="checkbox" id="mobile" name="devices" value="mobile"> 모바일
            </div>
            <div class="form-group">
                <label for="pages">노출 페이지</label>
                <input type="radio" id="home" name="pages" value="home" checked> 홈 화면
                <input type="radio" id="custom" name="pages" value="custom"> 사용자 정의
                <input type="radio" id="product" name="pages" value="product"> 상품 별
            </div>
            <div class="form-group">
                <label for="condition">적용 조건</label>
                <input type="radio" id="all" name="condition" value="all" checked> 모든 방문자
                <input type="radio" id="logged-in" name="condition" value="logged-in"> 로그인 방문자
            </div>
            <div class="form-group">
                <label for="position">위치/형태</label>
                <div class="btn-group">
                    <button type="button">팝업 레이어</button>
                    <button type="button">상단 배너</button>
                </div>
            </div>
            <div class="form-group">
                <label for="image">이미지</label>
                <div class="image-upload">
                    <input type="file" id="image" name="image">
                    <p>이미지를 여기에 드래그</p>
                </div>
            </div>
            <div class="form-group">
                <label for="image-link">이미지 링크</label>
                <input type="url" id="image-link" name="image-link" placeholder="http://">
                <input type="checkbox" id="new-window" name="new-window"> 새 창에서 열기
            </div>
            <div class="form-group">
                <button type="submit">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>
