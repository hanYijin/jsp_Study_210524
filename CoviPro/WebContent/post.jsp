<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="post.PostDAO" %>
<%@ page import="post.Post" %>
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
  
<title>Covid-19 Web 게시판</title>
<style>
	nav{background-color:#4F698C;}
	nav>ul>li>a{
		color:#B8CCD9;
		font-weight: bold;
	}
	a{
		color:#435C73;
		font-weight: bold;
	}
	a:hover{color:#6CCED9;}
	.active {
    	color: #6CCED9;	
	}
</style>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		int pageNumber=1; //기본페이지
		if(request.getParameter("pageNumber")!=null){
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<nav class="navbar navbar-expand-sm">
  <!-- Brand -->
  	<a style="color:#DFEBF2; font-weight: bold;" class="navbar-brand" href="main.jsp">COVID-19</a>

  <!-- Links -->
  	<ul class="navbar-nav">
  		<li class="nav-item">
      		<a class="nav-link" href="main.jsp">메인</a>
    	</li>
    	<li class="nav-item active">
      		<a class="nav-link" href="post.jsp">게시판</a>
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
        		<a class="dropdown-item" href="login.jsp">로그인</a>
        		<a class="dropdown-item" href="join.jsp">회원가입</a>
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
        	<a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
      	</div>
    	</li>
  </ul>
  <%
  	}
   %>
  
</nav>
<div class="container mt-3">
	<h2 style="color: #F2B705">희망 메시지</h2>
	<hr class="hr-style">
	<div class="row">
		<table class="table table-hover" style="text-align: center; border: 1px solid=#dddddd;" >
			<thead>
				<tr style="background-color: #84A4BF;">
					<td Style="text-align: center;">번호</td>
					<td Style="text-align: center;">제목</td>
					<td Style="text-align: center;">작성자</td>
					<td Style="text-align: center;">작성일자</td>
				</tr>
			</thead>
			<tbody>
				<%
					PostDAO pd= new PostDAO();
					ArrayList<Post> list=pd.getList(pageNumber);
					for(int i=0; i<list.size();i++){
				%>
				<tr>
					<td><%=list.get(i).getPostID() %></td>
					<td><a href="view.jsp?postID=<%=list.get(i).getPostID()%>"><%=list.get(i).getPostTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
					<td><%=list.get(i).getUserID() %></td>
					<td><%=list.get(i).getPostDate().substring(0,10)+" "+list.get(i).getPostDate().substring(11,13)+"시"+" "+list.get(i).getPostDate().substring(14,16)+"분" %></td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<!-- 페이지 태그 -->
		<%if(pageNumber != 1){ %>
			<a href="post.jsp?pageNumber=<%=pageNumber - 1 %>" class="btn btn-info">이전</a>
		
		<% } if(pd.nextPage(pageNumber + 1)){ %>
			<a href="post.jsp?pageNumber=<%=pageNumber +1 %>" class="btn btn-info ml-2">다음</a>
		<% } %>
		
	</div>
	<div class="form-row float-right"><a href="writer.jsp" class="btn btn-primary pull-right" style="float: right;">글쓰기</a></div>
</div>

</body>
</html>