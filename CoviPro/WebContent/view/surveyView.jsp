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
  <link rel="stylesheet" href="../css/Style.css"/>
<title>Covid-19 Web 게시판</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
	%>
	<nav class="navbar navbar-expand-sm">
  <!-- Brand -->
  	<a class="navbar-brand" href="../main.jsp">COVID-19</a>

  <!-- Links -->
  	<ul class="navbar-nav">
  		<li class="nav-item active">
      		<a class="nav-link" href="../main.jsp">메인</a>
    	</li>
    	<li class="nav-item">
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
<!-- <div class="cantainer-fluid"><img src="./res/main.jpg" class="mx-auto d-block"></div>-->
	<div class="img-2">
        <div class="content">
            <h1>코로나19로 바뀐 일상, 요즘 어떻게 지내세요?</h1>
        </div>
        <div class="img-cover"></div>
    </div>
	<div class="container">
		<div class="media border p-3 mt-3">
			<img src="../res/hobby2.jpg" alt="John Doe"
				class="mr-3 mt-3 rounded-circle" style="width: 200px;">
			<div class="media-body mt-3">
				<h4>
					Q <small>코로나19 이후 제일 많은 시간을 보내는 활동은 무엇인가요?</small>
				</h4>
				<p>Lorem ipsum...</p>
			</div>
		</div>
		<div class="media border p-3 mt-3">
			<div class="media-body mt-3">
				<h4>
					Q <small>코로나19가 종식되면 가장 먼저 무엇을 하고 싶은가요?</small>
				</h4>
				<p>Lorem ipsum...</p>
			</div>
			<img src="../res/daily.jpg" alt="John Doe"
				class="ml-3 mt-3 rounded-circle" style="width: 230px;">
		</div>
	</div>
</body>
</html>