<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>event</title>
<style>
	.banner{
		width: 100%;
	}
	.eventBox{
		position: relative;
		width: 100%;
	}
	#list{
		position: absolute;
		inset: 66% 26% 24.5% 57%;
		background: transparent;
		border: none;
		cursor: pointer;
	}
	#delivery{
		position: absolute;
		inset: 66% 7% 24.5% 76%;
    	background: transparent;
    	border: none;
    	cursor: pointer;
	}
	
</style>
</head>
<body>
	<div class='eventBox'>
		<img class='banner' src="../images/eventBanner.png">
		<button type='button' id='list' onclick="window.open('https://drive.google.com/file/d/1veFCwiyvuAl9eVk_7PFhEzKVFw1Fj_3m/view?usp=sharing')"></button>
		<button type='button' id='delivery' onclick="window.open('https://form.office.naver.com/form/responseView.cmd?formkey=ZWU4MjMwODQtNDlhNy00YTViLWE4Y2QtYzk0MDAzNGQ1Mzcz&sourceId=urlshare')"></button>
	</div>
</body>
</html>