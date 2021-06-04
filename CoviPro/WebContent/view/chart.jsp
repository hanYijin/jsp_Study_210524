<%@page import="data.CoviData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.CoviDataDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	CoviDataDAO cd = new CoviDataDAO();
	ArrayList<CoviData> list = cd.addrSelect();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<canvas id= "coviChart"></canvas>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		let coviChart = document.getElementById('coviChart').getContext('2d');
		<%for(int i=0; i<list.size();i++){%>
		var index = "<%= list.get(i).getAddr()%>";
		var count = "<%= list.get(i).getAddrcount()%>";<%}%>
		let barChart = new Chart(coviChart,{
			type: 'bar',
			date: {
				labels: index
				datasets:[{
					label: '코로나 주소별 확진현황',
					data:count
				}]
			}
		})
	</script>
</body>
</html>