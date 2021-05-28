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
  <link rel="stylesheet" href="./css/Style.css"/>
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
      <a class="nav-link" href="post.jsp">게시판</a>
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
		<div class="jumbotron mt-5">
			<form method="post" action="surveyAction.jsp">
				<h3 Style="text-align: center;">코로나19로 바뀐 일상 요즘 어떻게 지내세요?</h3>
				<div class="form-group mt-5">
				<p>Q1. 코로나19 이후 제일 많은 시간을 보내는 활동은?</p>
					<input type="checkbox" name="question1" value="1">영상시청(TV, 유튜브 등)<br>
					<input type="checkbox" name="question1" value="2">가족과 함께<br>
					<input type="checkbox" name="question1" value="3">독서<br>
					<input type="checkbox" name="question1" value="4">홈트레이닝<br>
					<input type="checkbox" name="question1" value="5">기타
				</div>
				<div class="form-group  mt-5">
				<p>Q2. 코로나19가 종식되면 가장 먼저 무엇을 하고 싶은가요?</p>
					<input type="checkbox" name="question2" value="1">국내여행<br>
					<input type="checkbox" name="question2" value="2">국외여행<br>
					<input type="checkbox" name="question2" value="3">지인모임<br>
					<input type="checkbox" name="question2" value="4">영화, 공연 관람<br>
					<input type="checkbox" name="question2" value="5">운동
				</div>
				<input type="submit" class="btn btn-primary form-control mt-5" value="제출">
			</form>
		</div>
	</div>
	<div class="col-lg-4">
</div>
</body>
</html>