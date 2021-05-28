<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPW"/>
<jsp:setProperty property="userName" name="user"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="./css/Style.css"/>
<title>Covid-19 Web 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!= null){
			userID= (String)session.getAttribute("userID");
		}
		if(userID!=null){
			PrintWriter scr = response.getWriter();
			scr.println("<script>alert('이미 로그인이 되어있습니다.')");
			scr.println(" location.href='../main.jsp'");
			scr.println("</script>");
		}
		if(user.getUserID() == null || user.getUserPW() == null || user.getUserName() == null 
		|| user.getUserGender() == null ||user.getUserEmail() == null){
			PrintWriter scr = response.getWriter();
			scr.print("<script>alert('입력하지 않은 사항이 있습니다.')");
			scr.print("history.back()");
			scr.print("</script>");
		}else{
			UserDAO userDao = new UserDAO();
			int result= userDao.join(user);
			if(result == -1){
				PrintWriter scr = response.getWriter();
				scr.println("<script>alert('이미 존재하는 아이디입니다.')");
				scr.println("history.back()");
				scr.println("</script>");
			}
			else{
				session.setAttribute("userID", user.getUserID());
				PrintWriter scr = response.getWriter();
				scr.println("<script>alert('회원가입 완료!')");
				scr.println("location.href='../main.jsp'");
				scr.println("</script>");
			}
		}
	%>

</body>
</html>