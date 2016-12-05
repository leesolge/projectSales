<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("visualization", "1.1", {packages: ["bar"]});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {    	
		var data = google.visualization.arrayToDataTable([
          	['사원별 판매실적', '판매건수'],
          	<c:forEach items="${pieDataList}" var="entry">
					[ '${entry.key}', ${entry.value}],
				</c:forEach>
        ]);
    
        var options = {

        };

        var chart = new google.charts.Bar(document.getElementById('chart_div'));

        chart.draw(data, options);
    }

</script>
</head>
<body>
<br>
	<div id="chart_div" style="width: 900px; height: 300px;"></div>
</body>
</html>