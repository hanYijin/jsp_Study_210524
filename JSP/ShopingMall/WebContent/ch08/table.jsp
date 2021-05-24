<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="color.jspf" %>
<% request.setCharacterEncoding("utf-8"); %>
<% 
	out.println(back);
	out.println(bodyback);
	out.println(title);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.{
		background-color: bodyback;
	}
</style>
<body>
	<table style="text-align: center; color: <% out.println(back);%>;">
		<tr>
			<td colspan="2" style="color:title;"><jsp:include page="top.jsp" flush="false"/></td>
		</tr>
		<tr>
			<td><jsp:include page="left.jsp" flush="false"/></td>
		</tr>
		<tr>
			<td colspan="2"><jsp:include page="bottom.jsp"/></td>
		</tr>
	</table>

</body>
</html>