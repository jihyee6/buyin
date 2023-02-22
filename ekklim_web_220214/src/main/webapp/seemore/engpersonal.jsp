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
				<!-- 약관 한글, 영어 div -->
				<div class="language">
					<div class="korean" onclick="location.href='personal'" ><p>한글</p></div>
					<div class="english" onclick="location.href='engpersonal'" style="border: 1px solid #707070; border-top: 3px solid #4366A3; color: #242424; "><p>영문</p></div>
				</div>
				<!-- 약관 내용 div -->				
				<div class="terms_text">
					<h3>Privacy policy</h3>
					<p>
					<br>
						<br>
					&lt;Information on the collection and use of personal information&gt;<br>
					<br>
					Items to collect personal information.<br>
					<br>
					The BUY IN HOTEL Design Hotel has free access to most of the content without a separate membership registration process. If you want to use the service at the BUY IN HOTEL, you must enter the following information.<br>
					<br>
					There is no restriction on the use of the service just because you did not enter the selection.<br>
					<br>
					1) Items of personal information collected during customer inquiries (banquet and wedding)<br>
					- Required items: name, e-mail, phone number, address, mobile phone, event type, number of people, event date, event time, and inquiries<br>
					<br>
					2) Items of personal information collected when booking a room.<br>
					- Required items: reservation person, guest, number of guests, reservation type, hotel arrival date, hotel departure date, date of birth, e-mail, address, mobile phone, card number, requirement<br>
					- Optional items: fax number, number of rooms, number of additional beds, smoking status<br>
					<br>
					Period of retention and use of personal information.<br>
					<br>
					① Your personal information will be destroyed when the purpose of collecting or receiving personal information is achieved as follows.<br>
					However, if it is necessary to hold it for a certain period of time due to the confirmation of the transaction-related rights and obligations relationship according to the provisions of related laws such as the Commercial Act, etc., it shall be held for a certain period of time.<br>
					- In the case of membership information, consent is sought by specifying the purpose, period, and personal information items to be held in advance, such as withdrawal from membership or expulsion from membership.<br>
					- In the case of membership information, when you withdraw from membership or are expelled from a member,<br>
					Preservation period: 10 years for the purpose of preserving it as evidence for litigation or dispute.<br>
					In the case of obtaining the consent of the user individually: 3 years.<br>
					- In the case of delivery information, when goods or services are delivered or provided,<br>
					- If collected for temporary purposes such as an event, when the event, etc. ends,<br>
					- Records of contract or withdrawal of subscription, etc.:<br>
					- Records of payment and supply of goods, etc.: 5 years.<br>
					- Records of consumer complaints or disputes: 3 years<br>
					② If you request access to the transaction information you have with your consent, the BUY IN HOTEL will take measures to view and confirm it without delay.<br>
					<br>
					Purpose of collecting and using personal information<br>
					<br>
					The BUY IN HOTEL has enacted and complies with the Personal Information Handling Policy to comply with the "Act on Promotion of Information and Communication Network Utilization and Information Protection," a major law related to personal information protection.<br>
					<br>
					① Collection items: personal identification information (name, gender, date of birth), contact information for service provision (cell phone, email)<br>
					* Personal information such as IP addresses, cookies, visit records, etc. can be automatically generated and collected in the process of using the Internet service.<br>
					② Purpose of use: Use it for identification procedures to handle customer complaints.<br>
					③ The BUY IN HOTEL holds and uses personal information until the purpose of personal information is achieved or terminated, but when the purpose of collecting and using personal information is achieved, the customer's personal information is destroyed without delay.<br>​
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