<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<style type="text/css">
			.notes_wrap{
				width: 600px;
				height: 480px;
				margin: auto;
				padding: 10px;
				border: 1px solid black;
				overflow-y: scroll;
			}
			.wrap_one{
				border: 1px solid black;
				width: 270px;
				height: 270px;
				position: relative;
				display: inline-table;
				margin: 1%;
			}
			.title{
				border: 1px solid black;
				position: relative;
				margin: 8px;
				width: 232px;
				height: 20px;
				text-overflow: ellipsis;
			}
			.content{
				border: 1px solid black;
				position: relative;
				margin: 8px;
				width: 250px;
				height: 130px;
				overflow-y: scroll;
			}
		</style>
		<title>Title</title>
	</head>
	
	<body>
		<div class="notes_wrap">
			<div class="wrap_one">
				<div class="title">
				</div>
				<div class="title">
				</div>
				<div class="title">
				</div>
				<div class="title">
				</div>
				<div class="content">
				</div>
			</div>
		</div>
	</body>
</html>