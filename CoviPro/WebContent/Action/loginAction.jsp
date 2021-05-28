<%@page import="java.io.PrintWriter"%>
<%@ page import="user.UserDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!-- 현재 페이지에만 유효한 멤버 자바빈 -->
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPW"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Covid-19 Web 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!= null){
			userID= (String)session.getAttribute("userID");
		}
		if(userID!=null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다')");
			script.println("location.href='../main.jsp'");
			script.println("</script>");
		}
		UserDAO userDao = new UserDAO();
		int result= userDao.login(user.getUserID(), user.getUserPW());
		if(result ==1){
			session.setAttribute("userID", user.getUserID());// 세션 객체에 관리
			PrintWriter scr = response.getWriter();
			scr.println("<script>alert('로그인 성공')");
			scr.println(" location.href='../main.jsp'");
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