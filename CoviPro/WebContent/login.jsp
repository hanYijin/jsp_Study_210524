<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="./css/style2.css"/>
<title>Covid-19 Web 게시판</title>
</head>
<body>
	<nav class="navbar navbar-expand-sm">
  <!-- Brand -->
  <a class="navbar-brand" href="main.jsp">COVID-19</a>

  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="main.jsp">메인</a>
    </li>
    <li class="nav-item">
      	<a class="nav-link" href="vaccineInfo.jsp">백신접종</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="post.jsp">게시판</a>
    </li>
    <li class="nav-item">
      		<a class="nav-link" href="survey.jsp">설문조사</a>
    </li>

    <!-- Dropdown -->
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
        접속하기
      </a>
      <div class="dropdown-menu">
        <a class="dropdown-item" href="login.jsp">로그인</a>
        <a class="dropdown-item" href="join.jsp">회원가입</a>
      </div>
    </li>
  </ul>
</nav>
<!-- 로그인 양식 -->
<div class="container">
	<div class="col-lg-4"></div>
	<div class="col-lg-4">
		<div class="jumbotron mt-5" >
			<form method="post"action="./Action/loginAction.jsp">
				<h3 Style="text-align: center;">로그인</h3>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="비밀번호" name="userPW" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="로그인">
			</form>
		</div>
	</div>
	<div class="col-lg-4">
</div>
</body>
</html>