<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%
    String realPath = "C:/student_java/semi2_wishjam/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps";
    String imgPath = "/wishJam/img/profile/";
    String savePath = realPath+imgPath;
    int sizeLimit = 10 * 1024 * 1024; // 10MB 크기 제한
    String imagePath = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
            File uploadedFile = multi.getFile("image");

            if (uploadedFile != null) {
                imagePath = imgPath + File.separator + uploadedFile.getName();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이미지 업로드</title>
    <script>
        function returnImagePath() {
            var imagePath = '<%= imagePath %>';
            if (imagePath) {
                if (window.opener && typeof window.opener.setImagePath === 'function') {
                    window.opener.setImagePath(imagePath);
                }
                window.close(); // 자식 창 닫기
            }
        }
    </script>
</head>
<body>
    <% if (!imagePath.isEmpty()) { %>
        <script>
            returnImagePath();
        </script>
    <% } %>
    <form action="uploadImage.jsp" method="post" enctype="multipart/form-data">
        <div>
            <label for="image">이미지 선택:</label>
            <input type="file" id="image" name="image">
        </div>
        <div>
            <button type="submit">업로드</button>
        </div>
    </form>
</body>
</html>
