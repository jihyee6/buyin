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
					<button type="button" onclick="location.href='policy'" >이용약관</button>
					<button type="button" onclick="location.href='personal'" >개인정보처리방침</button>
					<button type="button" onclick="location.href='noemail'" style="background: #707070; color: white; ">이메일무단수집거부</button>
					<button type="button" onclick="location.href='okmarketing'">마케팅활용동의</button>
					<button type="button" onclick="location.href='youth'">청소년보호정책</button>
					<button type="button" onclick="location.href='locationterms'">위치정보이용약관</button>
					<button type="button" onclick="location.href='cancelpolicy'">취소규정</button>
				</div>
				<!-- 약관 한글/영문 페이지로 이동 div -->
			<div class="language">
				<div class="korean" onclick="location.href='noemail'" ><p>한글</p></div>
				<div class="english" onclick="location.href='engnoemail'" style="border: 1px solid #707070; border-top: 3px solid #4366A3; color: #242424; "><p>영문</p></div>
			</div>
			<div class="terms_text">
				<h3>Refusing to collect emails without permission</h3>
					<p>
						<br>
						
						Please note that e-mail addresses posted on this site will be refused to be collected without permission using e-mail collection programs or other technical devices, and that violations will be criminally punished under the Information and Communication Network Act.<br>
						<br>
						Related laws and regulations - Act on Promotion of Information and Communication Network Utilization and Information Protection, etc.<br>
						<br>
						Article 50-2 (Prohibition of unauthorized collection of e-mail addresses, etc.)<br>
						① No one shall collect e-mail addresses using programs or other technical devices that automatically collect e-mail addresses from the Internet homepage without prior consent from the operator or administrator of the Internet homepage.<br>
						② No one shall sell or distribute e-mail addresses collected in violation of paragraph (1).<br>
						③ No one shall use it for information transmission, knowing that it is an e-mail address prohibited from collecting, selling, and distributing pursuant to paragraphs (1) and (2).<br>
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