<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
	// Set a callback to run when the Google Visualization API is loaded.
	google.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		// Create the data table.	
		var data = google.visualization.arrayToDataTable([
		                                                  	['Country', 'Area(square km)'],
		                                                  	<c:forEach items="${pieDataList}" var="entry">
		                          								[ '${entry.key}', ${entry.value} ],
		                          							</c:forEach>
		                                                ]);
		// Set chart options
		var options = {
			'title' : '실험용',
			is3D : true,
			pieSliceText: 'label',
			tooltip :  {showColorCode: true}
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>
</head>
<body>

	<div id="chart_div" style="width: 900px; height: 500px;"></div>
</body>
</html>