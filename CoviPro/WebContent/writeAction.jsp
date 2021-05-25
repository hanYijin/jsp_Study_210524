<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="post.PostDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="post" class="post.Post" scope="page"/>
<jsp:setProperty name="post" property="postTitle"/>
<jsp:setProperty name="post" property="postContent"/>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Covid-19 Web 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!= null){
			userID= (String)session.getAttribute("userID");
		}
		if(userID==null){
			PrintWriter scr = response.getWriter();
			scr.println("<script>alert('로그인을 해주세요.')");
			scr.println(" location.href='login.jsp'");
			scr.println("</script>");
		}
		else{
			if(post.getPostTitle() == null || post.getPostContent() == null){
						PrintWriter scr = response.getWriter();
						scr.print("<script>alert('입력하지 않은 사항이 있습니다.')");
						scr.print("history.back()");
						scr.print("</script>");
				}else{
					PostDAO pd= new PostDAO();
					int result= pd.write(post.getPostTitle(),userID,post.getPostContent());
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
						scr.println("location.href='main.jsp'");
						scr.println("</script>");
					}
			
				}
		}
	%>

</body>
</html>