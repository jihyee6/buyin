<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<link rel="stylesheet" href="../css/main.css">
<style>
.loginbox {
	margin: 80px 660px;
	width: 700px;
}

.title3 {
	font-size: 32px;
	margin-bottom: 65px;
	text-align: center;
	font-family: NanumSquare_ac;
	font-weight: bold;
	color: #242424;
}
.subtext{
	text-align: center;
	font-size: 16px;
	font-family: NanumSquare_ac;
	color: #242424;
}
.loginbox img{
	margin: 76px 242px;
}

</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="loginbox">
				<div class="title3">아이디 찾기</div>
				<p class="subtext">본인인증을 위해 휴대폰 인증하기를 진행해주세요.</p>
				<!-- 이미지 클릭시 휴대폰 인증하기로 넘어가기 -->
				<img src="../images/cellphone.png" onclick="location.href='idresult'"> 
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>
</body>
</html>