<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="post.PostDAO"%>
<%@ page import="post.Post"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<title>Covid-19 Web 게시판</title>
</head>
<body>
	<%
		String userID = null;
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter scr = response.getWriter();
			scr.println("<script>alert('로그인을 해주세요.')");
			scr.println(" location.href='../login.jsp'");
			scr.println("</script>");
		}
		int postID = 0;
		if (request.getParameter("postID") != null) {
			postID = Integer.parseInt(request.getParameter("postID"));
		}
		if (postID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>alert('유효하지 않은 글 입니다.')");
			script.println(" location.href='post.jsp'</script>");
		}
		Post post = new PostDAO().getPost(postID);
		if (!userID.equals(post.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>alert('수정 권한이 없습니다.')");
			script.println(" location.href='post.jsp'</script>");
		} else {
			PostDAO pd = new PostDAO();
			int result = pd.delete(postID);
			if (result == -1) {
				PrintWriter scr = response.getWriter();
				scr.println("<script>alert('게시글 삭제를 실패하였습니다.')");
				scr.println("history.back()");
				scr.println("</script>");
			} else {
				PrintWriter scr = response.getWriter();
				scr.println("<script>alert('게시글 삭제를 성공적으로 완료하였습니다.')");
				scr.println("location.href='../post.jsp'");
				scr.println("</script>");
			}

		}
	%>

</body>
</html>