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
.tab {
	list-style: none;
	position: relative;
	display: flex;
	width: 850px;
	height: 70px;
	border: 1px solid #707070;
	font-size: 22px;
	font-family: NanumSquare_ac;
}

.t_text{
	width: 950px;
}

.t_text h4{
	font-size: 32px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #242424;
}

.language{
	margin-top: 30px;
	display: flex;
}

.language div{
	border: 1px solid #C2C2C2;
	width: 475px;
	height: 65px;
	font-size: 22px;
	font-family: NanumSquare_ac;
	color: #D2D2D2;
	text-align: center;
	cursor: pointer;
	line-height: 65px;
}

.terms_text{
	font-family: NanumSquare_ac;
	font-color: #242424;
	font-size: 16px;
	width: 950px;
	margin-top: 30px;
}

.terms_text h3{
	font-size: 32px;
	font-weight: bold;
}

.terms_text p{
	line-height: 25px;
	font-size: 16px;
}

</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>

		<div class="content">
			<div class="title">
				<div class="tname">
					<div class="pagename">&nbsp;더보기</div>

				</div>
			</div>
			<div class='pageContent'>
				<!-- 더보기 사이드바 div -->
				<aside>
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
						
						<div class="navside" onclick="location.href='benefits'" >
							<div class="navitem" id="benefit">
								<span class="textmenu" >회원등급혜택</span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='faq'" >
							<div class="navitem" id="faq">
								<span class="textmenu" >FAQ</span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='policy'" style="background-color: #4366A3;">
							<div class="navitem" id="policy">
								<span class="textmenu" style="color: #FFFFFF;">약관 및 정책</span> <img src="../images/mainimg/blackpoint.png" alt="arr"	class="arrow">
							</div>
						</div>
					</nav>
				</div>
			</aside>

			<div class="maintext">
			<div class="t_text">
				<h4>약관 및 정책</h4>
				<!-- 약관 페이지로 넘어가는 버튼 div -->
				<div class="t_button">
					<button type="button" onclick="location.href='policy'" >이용약관</button>
					<button type="button" onclick="location.href='personal'" >개인정보처리방침</button>
					<button type="button" onclick="location.href='noemail'" style="background: #707070; color: white; ">이메일무단수집거부</button>
					<button type="button" onclick="location.href='okmarketing'">마케팅활용동의</button>
					<button type="button" onclick="location.href='youth'">청소년보호정책</button>
					<button type="button" onclick="location.href='locationterms'">위치정보이용약관</button>
					<button type="button" onclick="location.href='cancelpolicy'">취소규정</button>
				</div>
				<!-- 약관 한글, 영문 div -->
				<div class="language">
					<div class="korean" onclick="location.href='noemail'" style="border: 1px solid #707070; border-top: 3px solid #4366A3; color: #242424; "><p>한글</p></div>
					<div class="english" onclick="location.href='engnoemail'"><p>영문</p></div>
				</div>
				<!-- 약관 내용 div -->
				<div class="terms_text">
					<h3>이메일 무단수집 거부</h3>
					<p>
						<br>
							본 사이트에 게시된 이메일 주소가 전자우편 수집프로그램이나 그 밖의 기술적 장치를 이용하여 무단으로 수집되는 것을 거부하며,<br>
							이를 위반할 경우 정보통신망 법에 의해 형사 처벌됨을 유념하시기 바랍니다.<br>
							<br>
							<br>
							관련법규 - 정보통신망 이용촉진 및 정보보호 등에 관한 법률<br>
							<br>
							제50조의2 (전자우편주소의 무단 수집행위 등 금지)<br>
							① 누구든지 인터넷 홈페이지 운영자 또는 관리자의 사전 동의 없이 인터넷 홈페이지에서 자동으로 전자우편주소를 수집하는 프로그램이나 그 밖의 기술적 장치를 이용하여 전자우편주소를 수집하여서는 아니 된다.<br>
							② 누구든지 제1항을 위반하여 수집된 전자우편주소를 판매·유통하여서는 아니 된다.<br>
							③ 누구든지 제1항과 제2항에 따라 수집·판매 및 유통이 금지된 전자우편주소임을 알면서 이를 정보 전송에 이용하여서는 아니 된다.<br>
						<br>
					</p>
				</div>
			</div>
		</div>			
	</div>
</div>

		<%@include file="../footer.jsp"%>
	</div>

</body>
</html>