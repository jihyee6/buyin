<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.count {
	font-size: 16px;
	font-family: NanumSquare_ac;
}

.no{
	width: 850px;
	height: 500px;
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.no h2{
	margin-top: 30px;
	font-size: 32px;
	font-family: NanumSquare_ac;
	color: #BCBCBC;
	font-weight: bold;

}
</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>

		<div class="content">
			<div class="title">
				<div class="tname">
					<div class="pagename">&nbsp;마이페이지</div>
					
				</div>
			</div>
			<div class='pageContent'>
				<aside>
				<!-- 더보기 사이드바 div -->
				<div class="navbar">
					<nav class="inmenu">
						<div class="navside" onclick="location.href='notice'" >
							<div class="navitem" id="notice">
								<span class="textmenu">공지사항</span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='selectGiftcard'">
							<div class="navitem" id="notice">
								<span class="textmenu">선물하기</span>
							</div>
						</div>
						<div class="navside" onclick="location.href='event'">
							<div class="navitem" id="event">
								<span class="textmenu" >이벤트</span> 
							</div>
						</div>
						
						<div class="navside" onclick="location.href='benefits'" style="background-color: #4366A3;">
							<div class="navitem" id="benefit">
								<span class="textmenu" style="color: #FFFFFF;">회원등급혜택</span> <img src="../images/mainimg/blackpoint.png" alt="arr"	class="arrow">
							</div>
						</div>
						<div class="navside" onclick="location.href='faq'">
							<div class="navitem" id="faq">
								<span class="textmenu">FAQ</span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='policy'">
							<div class="navitem" id="policy">
								<span class="textmenu">약관 및 정책</span> 
							</div>
						</div>
					</nav>
				</div>
			</aside>

				<div class="maintext">
					<div class="maintitle">
						<h4>회원등급혜택</h4>
					</div>
					<!-- 회원등급혜택 div -->
					<div class="no">
						<img alt="메모아이콘" src="../images/icon/benefiticon.png">
						<h2>준비중입니다.</h2>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>

</body>
</html>