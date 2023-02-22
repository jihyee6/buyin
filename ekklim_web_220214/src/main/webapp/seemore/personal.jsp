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
					<button type="button" onclick="location.href='personal'" style="background: #707070; color: white; ">개인정보처리방침</button>
					<button type="button" onclick="location.href='noemail'">이메일무단수집거부</button>
					<button type="button" onclick="location.href='okmarketing'">마케팅활용동의</button>
					<button type="button" onclick="location.href='youth'">청소년보호정책</button>
					<button type="button" onclick="location.href='locationterms'">위치정보이용약관</button>
					<button type="button" onclick="location.href='cancelpolicy'">취소규정</button>
				</div>
				<!-- 약관 한글, 영문 버전 div -->
				<div class="language">
					<div class="korean" onclick="location.href='personal'" style="border: 1px solid #707070; border-top: 3px solid #4366A3; color: #242424; "><p>한글</p></div>
					<div class="english" onclick="location.href='engpersonal'"><p>영문</p></div>
				</div>
				<!-- 약관 내용 div -->
				<div class="terms_text">
					<h3>개인정보 수집 및 이용에 대한 안내</h3>
					<p>
					<br>
						개인정보의 수집항목<br>
						 <br>
						BUY IN HOTEL은 별도의 회원가입 절차 없이 대부분의 컨텐츠에 자유롭게 접근할 수 있습니다.BUY IN HOTEL은 서비스를 이용하시고자 할 경우 다음의 정보를 입력해주셔야 하며,<br>
						선택항목을 입력하시지 않았다 하여 서비스 이용에 제한은 없습니다.<br>
						1) 고객 문의(연회 및 웨딩)시 수집하는 개인정보의 항목<br>
						- 필수항목 : 성명, 이메일, 전화번호, 주소, 휴대폰, 행사종류, 인원수, 행사날짜,  행사시간, 문의사항<br>
						 <br>
						2) 객실예약시 수집하는 개인정보의 항목<br>
						- 필수항목 : 예약자, 투숙자, 투숙인원, 예약타입, 호텔도착일자, 호텔출발일자, 생년월일, 이메일, 주소, 휴대폰, 카드번호, 요구사항<br>
						- 선택항목 : 팩스번호, 객실수, 추가침대수, 흡연여부<br>
						 <br>
						개인정보의 보유 및 이용기간<br>
						 <br>
						① 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다.<br>
						단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다.<br>
						- 회원가입정보의 경우, 회원가입을 탈퇴하거나 회원에서 제명된 경우 등 일정한 사전에 보유목적, 기간 및 보유하는 개인정보 항목을 명시하여 동의를 구합니다.<br>
						- 회원 가입정보의 경우, 회원가입을 탈퇴하거나 회원에서 제명된때<br>
						   보존 기간 : 소송이나 분쟁의 근거 자료로 보존하는 목적으로서 10년<br>
						   기타 개별적으로 이용자의 동의를 받은 경우 : 3년<br>
						- 배송정보의 경우 물품 또는 서비스가 인도되거나 제공된때<br>
						- 이벤트 등 일시적목적을 위하여 수집한 경우 이벤트등이 종료한 때<br>
						- 계약 또는 청약철회 등에 관한 기록 : 5년<br>
						- 대금결제 및 재화등의 공급에 관한 기록 : 5년<br>
						- 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br>
						② 귀하의 동의를 받아 보유하고 있는 거래정보 등을 귀하께서 열람을 요구하는 경우BUY IN HOTEL은  지체없이 그 열람,확인 할 수 있도록 조치합니다.<br>
						 <br>
						개인정보의 수집목적 및 이용목적<br>
						 <br>
						BUY IN HOTEL은 개인정보보호 관련 주요 법률인 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’을 준수하기 위하여 개인정보취급방침을 제정하고 이를 준수하고 있습니다.<br>
						 <br>
						① 수집 항목: 개인 식별 정보 (성명, 성별, 생년월일), 서비스 제공 연락 정보 (휴대폰, 이메일)<br>
						* 인터넷 서비스 이용과정에서 IP주소, 쿠키, 방문기록, 등 개인정보가 자동으로 생성되어 수집될 수 있습니다.<br>
						② 이용 목적: 본인 확인 절차에 활용, 고객 불만 처리<br>
						③BUY IN HOTEL은 개인정보의 이용목적의 달성 및 해지시까지 개인정보를 보유, 이용하되 개인정보의 수집 및 이용 목적이 달성된 때에는 고객의 개인정보를 지체없이 파기합니다.​ <br>
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