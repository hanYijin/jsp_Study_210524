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
		String stArr[]={"한이진", "한수진","한동희"};
		for(int i=0; i<stArr.length; i++){
			out.println(i+"순위: "+stArr[i]+"<br>");
		}
	
	%>
	
	<%
	 int i=0;
	while(i<10){
		out.println(i+"<br>");
		i++;
	}
	%>
</body>
</html>