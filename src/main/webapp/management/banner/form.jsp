<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>폼 입력</title>
    <script>
        var imageUploadWindow;

        function uploadImage() {
            // 자식 창 열기
            imageUploadWindow = window.open('uploadImage.jsp', 'ImageUpload', 'width=400,height=200');
            setTimeout(checkChildWindow, 500); // 자식 창이 닫혔는지 체크 시작
        }

        function checkChildWindow() {
            if (imageUploadWindow && imageUploadWindow.closed) {
                console.log("자식 창이 닫혔습니다.");
                // 자식 창이 닫혔을 때 실행할 로직을 여기에 작성
            } else {
                setTimeout(checkChildWindow, 500); // 반복적으로 체크
            }
        }

        function imgChange() {
            var imgpath = document.getElementById('imagePath').value;
            var previewImg = document.getElementById('previewImg');
            if (previewImg) {
                previewImg.src = imgpath;
            }
        }

        function setImagePath(value) {
            var input = document.getElementById('imagePath');
            input.value = value;
            imgChange(); // 값 변경 후 바로 imgChange 호출
        }

        document.addEventListener('DOMContentLoaded', (event) => {
            var inputElement = document.getElementById('imagePath');
            // 'input' 이벤트를 감지하여 실시간으로 처리
            inputElement.addEventListener('input', imgChange);
        });
    </script>
</head>
<body>
    <form action="saveData.jsp" method="post">
        <div>
            <label for="title">제목:</label>
            <input type="text" id="title" name="title">
        </div>
        <div>
            <label for="image">이미지 업로드:</label>
            <img src="/wishJam/img/profile/default.jpg" onclick="uploadImage()" id="previewImg">
        </div>
        <div>
            <label for="imagePath">이미지 경로:</label>
            <input type="text" id="imagePath" name="imagePath" readonly="readonly">
        </div>
        <div>
            <button type="submit">제출</button>
        </div>
    </form>
</body>
</html>
