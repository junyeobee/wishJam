<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.manage.wishJam.MyFileRenamePolicy"%>
<jsp:useBean id = "mdto" class = "com.manage.wishJam.manageDTO"/>
<%
    request.setCharacterEncoding("UTF-8");
    String idx_s = request.getParameter("idx");
    String imagePath = "";

    if ("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            if (idx_s != null) {
                int idx = Integer.parseInt(idx_s);
                String path = request.getRealPath("/") + "/img/category/";
                mdto.setHomePath(path);
                MyFileRenamePolicy renamePolicy = new MyFileRenamePolicy(idx_s);
                int size = 10 * 1024 * 1024;
                String encoding = "UTF-8";

                MultipartRequest mr = new MultipartRequest(request, path, size, encoding, renamePolicy);
                imagePath = "/wishJam/img/category/" + idx + ".jpg";
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
                window.close();
            }
        }

        window.onload = function() {
            setTimeout(returnImagePath, 1000);
        };
    </script>
</head>
<body>
    <% if (!imagePath.isEmpty()) { %>
        <script>
            returnImagePath();
        </script>
    <% } %>
    <form action="uploadImage.jsp?idx=<%=idx_s %>" method="post" enctype="multipart/form-data">
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
