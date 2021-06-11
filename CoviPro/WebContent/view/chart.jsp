<%@page import="data.CoviData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="data.CoviDataDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	CoviDataDAO cd = new CoviDataDAO();
	ArrayList<CoviData> list = new ArrayList<CoviData>();
	list= cd.addrSelect();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://d3js.org/d3.v6.min.js" charset="UTF-8"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/Style.css"/>
<style type="text/css">
	.rectColor{
		stroke:#000000;
		stroke-width : 1px;
		fill : pink;
	}
	rect{
		stroke:#000000;
		stroke-width : 1px;
		fill : blue;
	}
</style>
</head>
<body>
	<div class="container mt-3" align="center">
		<button class="btn btn-outline-info col-5" id="btn1">전제 확진자 현황</button>
	</div>
	<div class ="container">
		<svg id="coviChart" style="display:none"></svg>
	</div>
	<script type="text/javascript">
		$('#btn1').click(function(){
			$('#coviChart').attr("style","display:block")
				var y=1;
				<%for(int i=0; i<list.size(); i++){%>
				var index = "<%=list.get(i)%>";
				
				var AddrCount = index.indexOf(",");
				var AddrCount = index.indexOf("]");
				Count = index.substring(AddrCount+1,AddCount2)
				Count= Count/5;
				var AddrName= index.indexOf("[");
				var AddrName2= index.indexOf(",");
				Name= index.subString(AddrName+1,AddrName2)
				
				d3.select("#coviChart")
					.append("rect")
					.attr("class","rectColor")
					.attr("x",(<%=i%>+1)*43)
					.attr("y", 790-Count)
					.attr("width",30)
					.attr("height",Count)
			
				d3.select("#coviChart")
					.append("text")
				    .text(Name)
				    .attr("x", (<%=i%>+1)*43)
				    .attr("y", 790)
				    .attr("font-family", "sans-serif")
				    .attr("font-size", "10px")
				    .attr("fill", "black")
				    .attr("text-anchor", "left")
				    
				d3.select("#coviChart")
					.append("text")
				    .text(Count*5)
				    .attr("x", (<%=i%>+1)*43)
				    .attr("y", 780-Count)
				    .attr("font-family", "sans-serif")
				    .attr("font-size", "11px")
				    .attr("fill", "black")
				    .attr("text-anchor", "left")
				y++;
		<%}%>
		})
	</script>
</body>
</html>