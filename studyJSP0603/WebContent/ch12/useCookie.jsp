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

	Cookie[] cookie = request.getCookies();
	if(cookie != null){
		for(int i=0; i<cookie.length;i++){
			if(cookie[i].getName().equals("id")){
			%>
				쿠키의 이름은 "<%=cookie[i].getName()%>" ,
				쿠키의 값은 "<%=cookie[i].getValue()%>"
			<% }
		}
	}
%>
</body>
</html>