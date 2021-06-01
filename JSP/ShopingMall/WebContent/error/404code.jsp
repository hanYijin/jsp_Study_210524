<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- 현재 페이지가 정상적으로 응답되는 페이지임을 지정하는 코드 -->
<% response.setStatus(HttpServletResponse.SC_OK); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>404 error page</title>
</head>
<body>
요청하신 페이지는 존재하지 않습니다.
</body>
</html>