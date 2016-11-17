<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<script type="text/javascript">
$(document).ready(function(){
	  $('.bxslider').bxSlider();
	});

</script>
<script type="text/javascript">
$('.bxslider').bxSlider({
	 auto: true,
	  autoControls: true
	});
</script>

</head>
<body>
<div class="w3-container">
    <div id="image_list_3">
        <div class="clsBannerScreen">
            <div class="images" style="display:block">
                <img src="/erp/resources/portraits/g1.jpg">
            </div>
            <div class="images"><img src="/erp/resources/image/logo.png"></div>
            <div class="images"><img src="/erp/resources/image/logo2.png"></div>
            <div class="images"><img src="/erp/resources/image/main.jpg"></div>
        </div>
        <ul class="clsBannerButton" id="label_3">
            <li><img src="/erp/resources/image/num1.png" height="20"></li>
            <li><img src="/erp/resources/image/num2.png" height="20"></li>
            <li><img src="/erp/resources/image/num3.png" height="20"></li>
            <li><img src="/erp/resources/image/num4.png" height="20"></li>
        </ul>
    </div>
</div>
</body>

<!-- CSS -->
<link rel="stylesheet" href="/erp/resources/css/slider.css">

<!-- JS -->
<script src="/erp/resources/js/jquery.banner.js"></script>
<script src="/erp/resources/js/slider.js"></script>