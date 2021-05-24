<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식 예제</title>
</head>
<body>
	<%
	String str[]={"한이진","한수진","한동희"};
	int[] age={26,25,22};
	int i= (int)(Math.random()*3);//0~2 난수
	%>
	name: <%=str[i] %> age: <%=age[i] %>
	<br>
	<%
		StringBuffer sf= new StringBuffer("hanyijin");
		sf.reverse();
		StringBuffer sf2=new StringBuffer(sf);
		sf2.append("is smart");
		out.println("객체의 내용"+sf.toString());
		out.println("객체의 내용"+sf2.toString());
	%>
</body>
</html>