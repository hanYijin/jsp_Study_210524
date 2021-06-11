<%@page import="post.PostDAO"%>
<%@page import="post.Post"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../css/Style.css"/>
<title>Covid-19 Web 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		int postID = 0;
		if(request.getParameter("postID") != null){
			postID = Integer.parseInt(request.getParameter("postID"));
		}
		if(postID ==0){
			PrintWriter scr = response.getWriter();
			scr.print("<script>alert('유효하지 않는 글 입니다.')");
			scr.print("location.href='post.jsp");
			scr.print("</script>");
		}
		Post post = new PostDAO().getPost(postID);
	%>
<nav class="navbar navbar-expand-sm">
  <!-- Brand -->
  	<a class="navbar-brand" href="../main.jsp">COVID-19</a>

  <!-- Links -->
  	<ul class="navbar-nav">
  		<li class="nav-item">
      		<a class="nav-link" href="../main.jsp">메인</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="../vaccineInfo.jsp">백신접종</a>
    	</li>
    	<li class="nav-item active">
      		<a class="nav-link" href="../post.jsp">게시판</a>
    	</li>
    	<li class="nav-item">
      		<a class="nav-link" href="../survey.jsp">설문조사</a>
    	</li>
    </ul>
	<!-- 로그인 안될시에 보이는 화면 -->
    <%
    	if(userID == null ){
    %>
    <!-- Dropdown -->
    <ul class="navbar-nav navbar-right">
    	<li class="nav-item dropdown">
      		<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">접속하기</a>
      		<div class="dropdown-menu">
        		<a class="dropdown-item" href="../login.jsp">로그인</a>
        		<a class="dropdown-item" href="../join.jsp">회원가입</a>
      		</div>
    	</li>
  	</ul>
  <%
  	}else{
  %>
  <ul class="navbar-nav navbar-right">
  	<li class="nav-item dropdown">
    	<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">회원관리</a>
      	<div class="dropdown-menu">
        	<a class="dropdown-item" href="../Action/logoutAction.jsp">로그아웃</a>
      	</div>
    	</li>
  </ul>
  <%
  	}
   %>
</nav>
	<div class="container mt-3 ">
	<h2 style="color:#F2B705;"><%=post.getPostTitle() %></h2>
	<hr class="hr-style">
		<table class="table table-hover"
			style="text-align: center; border: 2px solid=#dddddd;">
			<thead>
				<tr>
					<th colspan="3"
						style="background-color: #84A4BF; text-align: center;">게시글</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td Style="width:20%;">글 제목</td>
					<td colspan="2"><%=post.getPostTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td colspan="2"><%=post.getUserID() %></td>
				</tr>
				<tr>
					<td>작성 일자</td>
					<td colspan="2"><%=post.getPostDate().substring(0,10)+" "+post.getPostDate().substring(11,13)+"시"+" "+post.getPostDate().substring(14,16)+"분" %></td>
				</tr>
				<tr>
					<td>글 내용</td>
					<td colspan="2" style="height:200px; text-align: left;"><%=post.getPostContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></td>
				</tr>
			</tbody>
		</table>
		<div class="form-row float-right">
			<a href="../post.jsp" class="btn btn-info mr-2">목록</a>
			<%
				if (userID != null && userID.equals(post.getUserID())) {
			%>
			<a href="../update.jsp?postID=<%=postID%>" class="btn btn btn-warning mr-2">수정</a>
			<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="../Action/deleteAction.jsp?postID=<%=postID%>" class="btn btn-danger">삭제</a>
			<%
				}
			%>
		</div>
			<form method="post" action="../Action/commentAction.jsp">
				<table class="table table-hover" style="text-align: center; border: 1px solid=#dddddd;" >
					<thead>
						<tr>
							<th colspan="2" style="background-color: #84A4BF; text-align: center;">댓글 남기기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><textarea type="text" class="form-control" placeholder="댓글 남기기" name="commentcontent" maxlegth="100"></textarea></td>
						</tr>
					</tbody>
					<tfoot>
						<td><input type="submit" class="btn btn-primary pull-right" value="댓글 작성"></td>
					</tfoot>
				</table>
			</form>
		<div>
			<table class="table table-hover" style="text-align: center; border: 2px solid=#dddddd;">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #84A4BF; text-align: center;">작성자</th>
						<th colspan="3" style="background-color: #84A4BF; text-align: center;">댓글</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td Style="width:20%;">작성자</td>
						<td colspan="2"><%=post.getPostTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="../Action/deletecomment.jsp?postID=<%=postID%>" class="float-right text-danger">삭제</a></td>
						
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>