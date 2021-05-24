<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	int local= Integer.parseInt(request.getParameter("localNum"));
	String name="";
	
	switch(local){
	case 0:
		name="jonglo";
		break;
	case 1:
		name="dobong";
		break;
	case 2:
		name="sowon";
		break;
	case 3:
		name="daegu";
		break;
	case 4:
		name="seoul";
		break;
	default:
		name="없는 권역";
		break;
	}
	
	out.println("선택하신 지역은 "+ name+" 입니다.");
	%>
</body>
</html>