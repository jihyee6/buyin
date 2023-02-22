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
	margin: 30px auto;
}

.terms_text p{
	line-height: 25px;
}

.t_text {
	width: 950px;
}

.terms_text {
	font-family: NanumSquare_ac;
	font-color: #242424;
	font-size: 16px;
	width: 950px;
	margin-top: 30px;
}


.terms_text p {
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
					<!-- 약관 페이지 버튼 div -->
					<div class="t_button">
						<button type="button" onclick="location.href='policy'">이용약관</button>
						<button type="button" onclick="location.href='personal'">개인정보처리방침</button>
						<button type="button" onclick="location.href='noemail'">이메일무단수집거부</button>
						<button type="button" onclick="location.href='okmarketing'">마케팅활용동의</button>
						<button type="button" onclick="location.href='youth'" style="background: #707070; color: white;">청소년보호정책</button>
						<button type="button" onclick="location.href='locationterms'">위치정보이용약관</button>
						<button type="button" onclick="location.href='cancelpolicy'">취소규정</button>
					</div>
						<!-- 약관 내용 div -->
						<div class="terms_text">
							<h3>청소년 보호정책</h3>
								<p>
									주식회사 잘래는 유해한 환경으로부터 청소년들의 정신적, 신체적 건강을 보호하기 위하여, ‘청소년 보호법' 및
									'정보통신망 이용촉진 및 정보보호 등에 관한 법률' 등 관계 법령에 따른 청소년 보호정책을 마련하여 시행하고 있으며
									청소년들이 안전하게 인터넷 서비스를 이용할 수 있도록 다음과 같은 활동을 하고 있습니다.<br> <br>
									-청소년 유해정보로부터의 청소년 보호계획의 수립<br> -청소년 유해정보에 대한 청소년 접근제한 및
									관리조치<br> -정보통신업무 종사자에 대한 청소년 유해정보로부터의 청소년보호를 위한 교육<br>
									-청소년 유해정보로 인한 피해상담 및 고충처리<br> -그 밖에 청소년 유해정보로부터 청소년을 보호하기
									위하여 필요한 사항<br>
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