<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href=" /erp/webjars/bootstrap/3.3.4/dist/css/bootstrap.min.css">

<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-6">
				<div class="panel panel-default">
					<div class="panel-heading">Bar Chart Example</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="flot-chart">
							<div class="flot-chart-content" id="flot-bar-chart"></div>
						</div>
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
		</div>
	</div>
	<!-- jQuery -->

	<script src="/erp/webjars/jquery/2.1.3/dist/jquery.min.js"></script>
	<!-- Flot Charts JavaScript -->
	<script src="/erp/resources/flot/excanvas.min.js"></script>
	<script src="/erp/resources/flot/jquery.flot.js"></script>
	<script src="/erp/resources/flot/jquery.flot.pie.js"></script>
	<script src="/erp/resources/flot/jquery.flot.resize.js"></script>
	<script src="/erp/resources/flot/jquery.flot.time.js"></script>
	<script src="/erp/resources/flot-tooltip/jquery.flot.tooltip.min.js"></script>
</body>
<script type="text/javascript">
	$(document).ready(
			function() {
				var barOptions = {
					series : {
						bars : {
							show : true,
							barWidth : 43200000
						}
					},
					xaxis : {
						mode : "time",
						timeformat : "%m/%d",
						minTickSize : [ 1, "day" ]
					},
					grid : {
						hoverable : true
					},
					legend : {
						show : false
					},
					tooltip : true,
					tooltipOpts : {
						content : "x: %x, y: %y"
					}
				};
				var barData = {
					label : "bar",
					data : [ [ 1354521600000, 1000 ], [ 1355040000000, 2000 ],
							[ 1355223600000, 3000 ], [ 1355306400000, 4000 ],
							[ 1355487300000, 5000 ], [ 1355571900000, 6000 ] ]
				};
				$.plot($("#flot-bar-chart"), [ barData ], barOptions);

			});
</script>

</html>