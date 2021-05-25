<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%request.setCharacterEncoding("UTF-8"); %>
<!-- 현재 페이지에만 유효한 멤버 자바빈 -->
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPW"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Covid-19 Web 게시판</title>
</head>
<body>
	<%
		UserDAO userDao = new UserDAO();
		int result= userDao.logIn(user.getUserID(), user.getUserPW());
		if(result ==1){
			PrintWriter scr = response.getWriter();
			scr.println("<script>alert('로그인 성공')");
			scr.println(" location.href='main.jsp'");
			scr.println("</script>");
		}else if(result == 0){
			PrintWriter scr = response.getWriter();
			scr.println("<script>alert('비밀번호가 일치하지 않습니다.')");
			scr.println("history.back()");
			scr.println("</script>");
		}else if(result == -1){
			PrintWriter scr = response.getWriter();
			scr.println("<script>alert('존재하지 않는 아이디 입니다.')");
			scr.println("history.back()");
			scr.println("</script>");
		}else if(result == 2){
			PrintWriter scr = response.getWriter();
			scr.println("<script>alert('데이터베이스 오류입니다.')");
			scr.println("history.back()");
			scr.println("</script>");
		}
	%>
</body>
</html>