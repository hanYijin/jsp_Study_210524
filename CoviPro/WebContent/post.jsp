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
<title>Covid-19 Web 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
	    	System.out.println(userID);
		}
	%>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <!-- Brand -->
  	<a class="navbar-brand" href="main.jsp">COVID-19</a>

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
<div class="container">
	<div class="row">
		<table class="table table-hover" style="text-align: center; border: 1px solid=#dddddd;" >
			<thead>
				<tr>
					<td Style="text-align: center;">번호</td>
					<td Style="text-align: center;">제목</td>
					<td Style="text-align: center;">작성자</td>
					<td Style="text-align: center;">작성일자</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>hello</td>
					<td>hong</td>
					<td>2021-05-25</td>
				</tr>
			</tbody>
		</table>
		<a href="writer.jsp" class="btn btn-primary pull-right">글쓰기</a>	
	</div>
</div>

</body>
</html>