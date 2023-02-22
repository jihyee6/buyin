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
.paging {
	margin: 26px 0;
}

.inner a {
	text-decoration: none;
	float: left;
	color: #707070;
	font-size: 18px;
}

.inner ul {
	list-style: none;
	float: left;
	padding: 0;
	font-size: 20px;
	font-family: NanumSquare_ac;
}

.inner ul li {
	float: left;
	margin: 0px 10px;
}

.inner img {
	height: 16px;
}
.pageNum.active{
	color: #070707;
	font-weight: 600;
	font-size: 18px;
}
	
.pageNum {
	margin: 4px;
	padding: 0px 6px 2px 6px;
	cursor: pointer;
	background: white;
	color: #A2A2A2;
	font-size: 18px;
}
.noticeAnswer li{
	list-style-type: "-  ";
}
.answerNum{
	padding-left: 20px;
	font-weight: bold;
}
.answerP{
	padding-left: 20px;
	padding-top: 10px;
}
#li_Num li{
	list-style-type: decimal;
}

.notable{
	width: 860px;
	border-top: 1px solid #707070;
}
.noticeQuestion{
	display: flex;
	height: 115px;
	border-bottom: 1px solid #C2C2C2;
	align-items: center;
	cursor: pointer;
}

.notable th{
	width: 750px;
	padding: 10px;
	line-height: 30px;
	font-size: 18px;
	font-family: NanumSquare;
	color: #242424;
}
.notable td{
	width: 110px;
	padding: 10px;
	text-align: center;
	color: #707070;
	font-size: 30px;
}

.noticeAnswer{
	width: 930px;
	background: #F3F3F3;
	display: none;
}

.noticeAnswer td{
	font-size: 18px;
	font-family: NanumSquare;
	color: #242424;
	width: 903px;
	text-align: left;
	line-height: 32px;
	
}

.faqmenu{
	margin: 25px auto;
}
.faqmenu span{
	font-size: 18px;
	margin: auto 15px;
	font-family: NanumSquare;
	cursor: pointer;
	color: #C9C9C9;
}

.callinfo{
	margin: 40px auto;
}

.callinfo h3{
	font-size: 32px;
	font-family: NanumSquare_ac;
	color: #242424;
	margin: 20px auto;
	font-weight: lighter;
}

.callinfo h4{
	font-size: 24px;
	font-family: NanumSquare_ac;
	color: #242424;
	font-weight: lighter;
	margin-bottom: 5px;
}

.callinfo p{
	font-size: 14px;
	font-family: NanumSquare_ac;
	color: #242424;
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
			<!-- 사이드바 메뉴 -->
			<div class='pageContent'>
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
						<div class="navside" onclick="location.href='faq'" style="background-color: #4366A3;">
							<div class="navitem" id="faq">
								<span class="textmenu" style="color: #FFFFFF;">FAQ</span> <img src="../images/mainimg/blackpoint.png" alt="arr"	class="arrow">
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
				<div class="maintitle">FAQ</div>
				<div class="tabmenu">
				<!-- FAQ 메뉴구성 -->
				<div class="faqmenu">
					<span onclick ="location.href='faq'" style="font-weight: bold; color: #242424; border-bottom: 2px solid #4366A3; ">전체</span>
					<span onclick ="location.href='reserfaq'">예약·결제·영수증</span>
					<span onclick ="location.href='pointfaq'">변경·취소·환불</span>
					<span onclick ="location.href='receiptfaq'">쿠폰·할인</span>
					<span onclick ="location.href='reviewfaq'">회원·개인정보</span>		
				</div>
				
				<!-- 질문 테이블 -->
				<table class="notable">
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 예약 시 복합 결제가 가능한가요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							네, 가능합니다. <br>
							 쿠폰, 포인트, 실결제수단(카드/계좌이체 등)의 복합 결제 가 가능합니다.<br>
							 단 현금 + 카드 혹은 카드 + 카드와 같이 실 결제 수단을 여러 개 선택하거나 쿠폰과 포인트를 동시 사용하는 것은 불가하며
							  고객의 자발적인 취소로 인한 쿠폰 및 포인트 환급은 어렵습니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 사업자 지출 증빙용 영수증(세금계산서) 발급은 어떻게 받나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							본사로 팩스나 메일 중 해당 사업자등록증과 세금계산서 받으실 메일 주소 남겨주시면 발급 도와드리겠습니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 회사 제출용 숙박 이용 내역 증빙자료를 받을 수 있을까요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							증빙자료 받으실 메일 주소 알려주시면 인보이스 작성해서 보내드리겠습니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 당일 예약이 가능한가요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							네, 당일 제휴점에서 잔여 객실이 있다면 당일 예약 가능하십니다.<br>
							투숙일 당일 빈 객실이 남아 있는 경우 서비스를 통해 예약 가능합니다.<br>
							예약하는 시점에 고객님이 위치한 곳과 체크인할 숙소의 시차를 확인 후 예약하시기 바랍니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 예약 일정을 변경할 수 있나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							예약 일정 변경을 원하시다면 번거로우시겠지만 기존 예약 건은 취소 후 다시 재예약 부탁드리겠습니다.<br>
							취소 시점에 따라 취소 수수료가 부과될 수 있으며, 이용을 원하는 숙소의 재고가 소진되었을 수 있으니 주의를 부탁드립니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 미성년자도 예약할 수 있는가요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							만 19세 미만의 미성년자는 청소년 보호법에 따라 숙박업소 출입/고용이 불가하며, 숙박 시설 이용에 제한이 있을 수 있습니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 부대시설, 조식 등 부가요금은 어떻게 지불하나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							예약 시 부가요금에 대한 결제가 안되셨다면 객실 예약 이외의 추가 발생(조식, 인원 추가, 침구류 등) 요금은 현장 결제로 진행됩니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 취소 수수료 계산 기준은 어떻게 되나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							취소 수수료 기준은 당사 모바일 앱 및 웹사이트에 기재된 취소 수수료 정책에 따라서 환불 및 취소 도와드리고 있습니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 카드번호의 자릿수가 16자가 아닌 경우 카드 결제가 가능한가요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							네, 결제 가능합니다.<br> 
							삼성 아멕스 카드(15자리) 등 16자리가 아닌 카드도 신용카드와 동일하게 정상 결제할 수 있습니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 카드 청구서에는 회사명이 뜨나요, 업체명이 뜨나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							신용카드 매출 전표에는 ‘바이인 호텔_바로 예약’.‘바이인 호텔_쿠폰 룸’ 등으로 표기되고, 청구서에는 ‘주식회사 바이인 호텔’로 표기됩니다. 
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 법인카드로 숙소 예약이 가능한가요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							법인 카드로 결제 가능하며, 법인카드 결제 시 아래 상세 내용을 확인하시기 바랍니다.
								<ol>
									<li>개인 법인 카드 : 대부분 소유주 정보를 필요로 하여 카드 소유주 본인인 경우 문제없이 결제  가능</li>
									<li>회사 법인카드 – 비인증 금액 내 : 사업자 번호 및 카드 비밀번호 입력으로 결제 가능</li>
									<li>회사 법인카드 – 비인증 금액 초과 : 카드사의 결제 방법 및 회사의 공인 인증서 필요</li>
								</ol>
							</li>
						</ul>
						<p style='padding-left: 26px; font-size: 14px;'>* 비인증 금액은 카드사별로 다르다는 점 참고 부탁드립니다</p>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 현금영수증 발급은 어떻게 받나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							현금 영수증은 계좌 이체 등 현금성 결제를 진행하는 경우에만 발급됩니다.<br>
							현금 결제를 완료하시면 별도의 신청 없이도 자동으로 현금영수증이 발행되지만 (17년 12월 1일부터 시행) 발행 받지 못한 경우에는 자진 발급받을 수 있습니다.
							</li>
						</ul>
						<p style='padding-top: 14px;'>▶ 결제수단별 현금영수증 발급 방법</p>
						<ul>
							<li>카카오페이<br>
								: 카카오톡 앱 실행 > 더보기 > 프로필 영역의 ‘pay’ > 설정 (우측 상단에 위치, 톱니바퀴 모양) > ‘이용내역’ (QR코드 하단에 위치) > ‘결제’ 탭 선택 > 개별 결제건 선택 후 ‘현금영수증’ 클릭
							</li>
							<li>네이버페이 (앱/웹)<br>
								: ‘결제 내역’ > Naver 로그인 > 거래 건 클릭해서 거래 상세 화면 진입 > 버튼 클릭하여 매출 전표 / 현금영수증(계좌이체, 포인트) 출력 가능
							</li>
							<li>페이코 (앱/웹)<br>
								 : MY PAYCO > 내 지갑 > 결제 내역 > 거래 건 클릭하여 상세 화면 진입 > 버튼 클릭하여 매출전표, 현금영수증(페이코 포인트)확인 가능
							</li>
							<li>페이나우 (앱/웹)<br>
							: 중앙 하단 거래내역 조회 > 결제정보 입력하여 매출 전표 조회 가능
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 결제수단(또는 결제카드)을 변경하고 싶습니다.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							결제 이후에는 결제수단에 대한 어떤 변경도 불가능합니다.<br>
							취소 후에는 다시 결제가 가능하지만, 취소 시점에 따라 취소수수료가 부가되거나 동일 숙소의 잔여 객실이 남아있지 않을 수 있습니다.<br>
							신중히 취소 부탁드립니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 예약 상태 / 내역을 확인하고 싶어요.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							바이인 호텔 앱 > MY 바이인 > 예약 및 구매 내역 > 1년 이내 예약 내역 확인이 가능하며, 1년 이전 예약 내역은 바이인 고객센터(1533-3152)로 연락 주시면 안내해 드리겠습니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 예약 내역은 어디서 확인하나요? </th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<ul>
							<li>
							예약 내역 조회는 바이인 호텔 앱 > MY 바이인 > 예약 및 구매 내역 > 해외 숙소 에서 가능하며, 예약자의 휴대폰 번호와 이메일 주소로 알림 톡/LMS와 예약확인서가 발송됩니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 예약자와 투숙자가 달라도 되나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<p class='answerP'>예약자와 투숙객 정보 입력은 다를 수 있습니다.</p>
						<ul>
							<li>
							예약자 정보 : 예약 완료 후 메시지와 예약확인서를 전달받는 분의 정보를 입력
							</li>
							<li>투숙객 정보 : 실제 숙소를 이용해주시는 분의 정보를 입력</li>
						</ul>
						<p class='answerP'>다만, 투숙객 정보는 숙소를 이용하는 분의 여권 이름과 반드시 동일한 영문 성/이름을 기입해 주셔야 숙소 이용이 가능합니다.</p>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 특정 객실을 선택할 수 있나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							펜션의 경우, 객실명이 모두 다른 경우가 많아 특정 객실을 선택하여 예약할 수 있으나 모텔/호텔의 경우 객실 타입으로 구분되어 체크인 시 배정하기 때문에 특정 객실을 예약하기는 어렵습니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 예약 후 예약 내역에서 조회되지 않는데 어떻게 해야 하나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<p class='answerP'>▶ 예약 문자는 받았으나, 예약 내역에서 조회되지 않는 경우</p>
						<ul>
							<li>정상 예약되었으나, 일시적인 문제로 예약 내역에서 조회되지 않는 경우입니다.</li>
							<li>고객센터에서 처리 가능하며, 이후에는 정상적으로 예약 정보를 조회할 수 있게 됩니다.</li>
						</ul>
						<p class='answerP'>▶ 예약 문자도 받지 못하고, 예약 내역에서 조회되지 않는 경우</p>
						<ul>
							<li>통신사 혹은 시스템의 문제로 예약 문자 수신이 어려운 경우입니다.</li>
							<li>고객센터에서 처리 가능하며 상담사를 통해 예약 문자 수신을 받아보신 후 정상적으로 예약 정보를 조회할 수 있게 됩니다.</li>
						</ul>
						<p style='padding-top: 16px;' class='answerP'>이용하시는데 불편 드려 죄송합니다.<br>
							로그인 후 예약하신 경우에 기재된 내용 중 해당하시는 내용의 답변을 확인해 주시고 바이인 고객센터(1533-3152)로 문의해 주시면 감사하겠습니다.</p>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 숙소 회원, 비회원의 예약 내역은 어디에서 조회할 수 있나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<p class='answerP'>▶ 회원 > 숙소 예약 내역 조회</p>
						<ul>
							<li>
							바이인 호텔 앱 > 내 정보 > 예약 및 숙소 이용내역<br>
							</li>
						</ul>
						<p class='answerP'>현재는 비회원으로 예약 및 조회가 불가능하기 때문에 번거로우시겠지만 회원가입 후 예약 부탁드립니다.</p>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 카드 영수증은 어디에서 보나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							예약 영수증은 고객센터에 문의하시면 고객님께 메일 또는 문자, 카톡으로 발송해드리겠습니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 여러 가지 상품을 한 번에 예약하고 싶은데 어떻게 해야 하나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<ul>
							<li>
							국내 숙소 여러 상품을 장바구니에 담아 한 번에 예약할 수 있습니다.<br>
							1) 예약할 국내 여행 상품의 상세 페이지에서 [장바구니 담기] 버튼을 클릭해 주세요.<br>
							2) 장바구니에서 한 번에 예약할 상품들을 체크 후 페이지 하단의 [예약하기] 버튼을 클릭해 주세요.<br>
							3) 예약 페이지에서 원하는 결제수단을 선택하여 예약/결제를 진행해 주세요.
							</li>
						</ul>
						<p class='answerP'>※ 장바구니 담기가 불가한 아래 상품들은 '바로 예약하기'를 통해 개별 예약만 가능합니다.</p>
						<ul>
							<li>호텔 대기 예약 상품</li>
							<li>모바일 교환권</li>
							<li>외부 채널을 통한 예약 상품</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 장바구니란 무엇인가요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							장바구니란, 마음에 드는 상품을 담아 두었다가 한꺼번에 예약할 수 있는 저장 공간입니다.<br>
							예약을 원하시는 상품의 상세 페이지에서 [장바구니 담기]를 클릭하여 저장해 놓을 수 있으며,
							바이인 호텔 내 국내 여행 상품(숙소, 레저/티켓, 기차, 고속버스)을 담아 한 번에 예약할 수 있습니다.<br>
							제한은 없고, 체크인 체크아웃 날짜가 동일해야 장바구니에 담깁니다.<br>
							(장바구니에 담긴 상품은 상품별 예약 및 삭제가 가능합니다.)
							</li>
						</ul>
						<p class='answerP'>단, 아래의 경우에는 장바구니 이용에 제한이 있을 수 있습니다.</p>
						<ul>
							<li>외부 채널을 통한 예약 시 바이인 호텔 장바구니 이용이 제한될 수 있습니다.</li>
							<li>호텔 대기 예약 상품, 모바일 교환권 상품과 같은 일부 상품은 장바구니 기능을 이용할 수 없습니다.</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[예약/결제/영수증]</span> 예약 후 객실 가격이 달라졌습니다.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							객실 요금은 실시간으로 변동될 수 있으며 취소 가능 시점 내에서는 직접 앱에서 취소 가능합니다.<br>
							단, 취소 불가 시점일 경우에는 해당 사유로 인한 취소 요청은 불가합니다.
							</li>
						</ul>
						</td>				
					</tr>
					<!-- 변경/취소/환불  -->
					<tr class='noticeQuestion'>
						<th><span>[변경/취소/환불]</span> 예약 취소 시, 사용한 포인트도 환불 되나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							예약 취소 시, 사용하신 포인트는 환불 어렵기 때문에 예약취소 시 신중한 선택 부탁드립니다.<br> 
							포인트 정책에 대한 자세한 내용은 아래 방법을 통해 확인 가능합니다.<br>
							▶ 바이인 호텔 앱 > 내 정보 > 포인트·쿠폰 
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[변경/취소/환불]</span> 예약일정을 변경할 수 있나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							예약 일정은 변경이 불가합니다.<br>
							예약 일정 변경을 원하시는 경우 예약 취소 후 재예약을 진행해야 합니다.<br>
							취소 시점에 따라 취소수수료가 부과될 수 있으며, 이용을 원하는 숙소의 재고가 소진되었을 수 있으니 주의를 부탁드립니다. 
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[변경/취소/환불]</span> 결제수단(또는 결제카드)을 변경하고 싶습니다.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							결제 이후에는 결제수단에 대한 어떤 변경도 불가능합니다.<br>
							취소 후에는 다시 결제가 가능하지만, 취소 시점에 따라 취소수수료가 부가되거나 동일 숙소의 잔여 객실이 남아있지 않을 수 있습니다.<br>
							신중히 취소 부탁드립니다.
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[변경/취소/환불]</span> 예약 취소 시 사용한 쿠폰은 돌려 받을 수 있나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td><ul>
							<li>
							고객님 소유의 쿠폰을 사용하신 후 예약 취소할 경우 쿠폰 재반환은 어렵습니다.<br>
							▶ 바이인 호텔 앱 > 내 정보 > 포인트·쿠폰
							</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[변경/취소/환불]</span> 체크인 날짜를 잘못 예약했어요. 일정을 변경할 수 있나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<p class='answerP'>보안등의 이유로 고객님의 예약 내역은 바이인 호텔에서 직접 변경하지 않도록 운영되고 있습니다.</p>
						<ul>
							<li>예약 취소가 가능한 경우 (모텔 예약 후 1시간 이내, 호텔 예약 후 10분 이내), 기존 예약을 취소하시고 새로운 예약을 해주시면 됩니다.</li>
							<li>예약 취소가 불가하거나 수수료가 발생하는 경우, 고객센터(1533-3152)로 문의 부탁드립니다.</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[변경/취소/환불]</span> 환불했는데 돈이 들어오지 않아요.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<ul>
							<li>
							고객님께서 지불하신 결제수단에 따라 환불에 소요되는 기간이 달라질 수 있습니다. 평균적으로 영업일 기준 3~7일 이내에 환불 처리됩니다.<br>
							또한 환불금액이 0원인 경우에는 100% 수수료가 부과된 경우일 수 있습니다. 확인해 주세요.
							</li>
						</ul>
						<p class='answerP'>▶ 시일이 걸리는 경우 다음과 같은 사유를 확인해 주세요.</p>
						<ul>
							<li>카드 결제 : 카드사의 한도 복원이 필요한 경우</li>
							<li>계좌이체 : 은행 계좌 입금에 시일이 소요되는 경우</li>
							<li>휴대폰 소액결제 : 결제월과 환불월이 다른 경우</li>
						</ul>
						<p class='answerP'>특히, 휴대폰 소액결제 취소 시 결제월과 환불월이 다른 경우에는 원 결제수단으로 환불이 불가능하므로 번거로우시겠지만 바이인 호텔 고객센터(1533-3152)로 문의해 주세요.</p>
						<p class='answerP'>각 결제수단에서 정상적으로 취소되었는지 확인이 어려우신 경우에는 고객센터로 문의해 주시면 확인이 가능하며, 정상 취소 후에도 환불 및 입금이 지연되는 경우에는 각 카드사 및 은행으로의 문의가 필요하므로 이용에 참고해 주세요.</p>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[변경/취소/환불]</span> '취소수수료' 규정에 대해 자세히 알고 싶어요.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<ul>
							<li>
							취소 규정이 적용되는 기준일은 입실일입니다.<br>
							취소수수료는 판매금액을 기준으로 계산됩니다.
							</li>
						</ul>
						<p class='answerP' style='padding-top: 20px;'>※ 취소수수료 유형</p>
						<p class='answerNum'>1. 사용자 과실로 인한 취소 유형</p>
						<ul>
							<li>사용자에 의한 취소 유형으로 당일 예약 취소와 부분 취소에 대해 안내드리겠습니다.<br>
								부분 취소는 연박 예약 시에만 가능하며, 제휴점 취소 규정에 따라 일자별 수수료가 부과될 수 있습니다.<br>
								당일 예약 건은 원칙적으로 취소가 불가하며, 당일 예약 무료 취소 가능 제휴점에 한하여 취소 가능합니다.<br>
								당일 예약 무료 취소 가능 제휴점의 경우 다음 조건을 충족한 상태에서 상담사에게 문의하셔야만 취소가 가능합니다.</li>
						</ul>
						<p class='answerP'>▶ 모텔 & 호텔</p>
						<ul>
							<li>예약 완료 시점으로부터 1시간 이내 바이인 호텔 앱/웹을 통해 취소 시 전액 환불</li>
							<li>단, 1시간 이내라도 입실시간 경과 시 취소 불가</li>
							<li>입실시간 경과 후 발생한 예약에 한하여 모텔 15분 이내 고객센터를 통해 취소 가능</li>
						</ul>
						<p class='answerNum'>2. 제휴점 과실로 인한 취소 유형</p>
						<ul>
							<li>오버부킹 취소 시, 별도의 취소수수료는 발생하지 않습니다.<br>
								다만, 전산상으로 자동 취소가 되지 않으므로 직접 취소를 진행할 경우 취소수수료가 부과될 수 있으니 상담사에게 문의하시면 안내해 드리겠습니다.</li>
						</ul>
						<p class='answerNum'>3. 천재지변으로 인한 취소 유형</p>
						<ul>
							<li>천재지변으로 숙소 방문이 어려우신 경우 상담사에게 문의하시면 안내해 드리겠습니다.<br>
								단, 제휴점과의 마찰로 인한 조기 퇴실 및 일방적인 취소, 부분 취소는 어렵다는 점 양해 부탁드립니다</li>
						</ul>
						<p class='answerP'>※ 취소수수료 계산 기준</p>
						<ul>
							<li>PG 사를 통한 현금 결제 금액 -> 포인트 사용금액 -> 쿠폰 또는 제휴사 포인트 할인금액 순으로 부과됩니다.</li>
							<li>단, 취소수수료 금액이 실 결제금액(현금/PG 결제금액+포인트 사용금액) 을 초과 발생하는 경우, 초과되는 취소 수수료 금액에 대해서는 사용된 쿠폰 또는 제휴사 포인트 반환 정책을 따릅니다.</li>
						</ul>
						<p class='answerP'>▶연박 예약 건의 취소 시, 취소 일시를 기준으로 일할 계산됩니다.</p>
						<p class='answerP'>▶예약 정보 변경을 위한 결제 취소 시에도 취소수수료가 부과됩니다.</p>
						
						<p class='answerP'>※ 제휴사 포인트 반환</p>
						<p class='answerP'>통신사 멤버십 포인트를 사용한 할인 금액 중,</p>
						<ul>
							<li>취소수수료로 부과되는 금액이 없는 경우: 사용 시 차감된 통신사 멤버십 포인트 전액 반환</li>
							<li>일부만 취소수수료 부과되는 경우: 사용 시 차감된 통신사 멤버십 포인트 전액 반환</li>
							<li>전액이 취소수수료로 부과되는 경우: 사용 시 차감된 통신사 멤버십 포인트 전액 비 반환<br>
							단, 통신사 멤버십 포인트 반환은 2~3일 정도 소요될 수 있습니다.</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[변경/취소/환불]</span> 예약한 상품을 취소하고 싶어요.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<p class='answerP'>예약한 상품은 아래의 경로를 통해 취소 요청할 수 있습니다.</p>
						<ul>
							<li>내 정보 > [예약 내역] 버튼 클릭 > 취소할 예약 내역 버튼 클릭 > 최하단 우측의 [예약취소] 버튼 클릭 > 취소할 상품 선택 후 취소 수수료 및 환불 금액 확인 > 약관 확인 및 동의 후 [예약취소] 버튼 클릭하여 취소 요청</li>
						</ul>
						<p class='answerP'>※ 단, '이용 완료/취소 요청 중/취소 완료' 상태인 상품은 취소 요청이 불가합니다.<br>
						이미 이용이 완료된 상품을 취소 요청할 경우, 취소 요청 중 상태에서 이용 완료 상태로 변경될 수 있습니다.</p>
						</td>				
					</tr>
					
					<!-- 쿠폰/할인  -->
					<tr class='noticeQuestion'>
						<th><span>[쿠폰/할인]</span> 후기를 작성했는데 적립금이 안들어옵니다. </th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<ul>
							<li>서버오류로 발생한 상황이니 고객센터로 문의 주시면 감사하겠습니다.</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[쿠폰/할인]</span> 직접 작성한 후기가 왜 블라인드 처리되었나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<ul>
							<li>이용후기 게시판은 블라인드 운영원칙 및 커뮤니티 운영원칙에 의거하여 운영되고 있습니다.</li>
						</ul>
						<p class='answerNum'>블라인드 운영원칙</p>
						<ul id='li_Num'>
							<li>욕설 비속어 포함한 게시물</li>
							<li>객실 언급 없이 의미 없는 단순 자음을 반복하거나 의미 없는 알파벳, 숫자 등을 나열한 게시물</li>
							<li>상업적인 홍보의 목적으로 작성된 게시물</li>
							<li>객실을 사용하지 않고 작성된 게시물</li>
							<li>개인정보를 포함한 게시물</li>
							<li>음란성 게시물 / 청소년에게 부적합한 게시물</li>
						</ul>
						<p class='answerP'>해당 게시글이 위와 같은 운영원칙에 위배되는 내용을 포함할 경우 블라인드 처리됩니다.<br>
							이용에 불편이 없으시도록 후기 작성 시 확인 부탁드리겠습니다.<br>
							자세한 후기 정책 내용은 제휴점 후기 영역에서 확인 가능합니다.</p>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[쿠폰/할인]</span> 작성한 이용 후기를 수정/삭제하고 싶어요.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<ul>
							<li>작성한 후기 수정 및 삭제는 바이인 호텔 앱 > 내 정보 > 리뷰 관리에서 하실 수 있습니다.</li>
							<li>수정의 경우 본인이 작성한 후기는 작성일을 기준으로 48시간 이내 수정 가능합니다.<br>
								(단, 본문 수정이 가능하며 사진의 경우 삭제만 가능)</li>
							<li>후기 삭제는 본인이 작성한 후기에 한해 삭제 가능하며, 바이인 호텔 고객센터(1533-3152)에 문의하시면 후기 삭제가 가능합니다.</li>
							<li>후기 삭제 시, 기 지급된 포인트가 회수될 수 있다는 점 서비스 이용에 참고 부탁드립니다.</li>
						</ul>
						</td>				
					</tr>
					<!-- 회원/개인정보  -->
					<tr class='noticeQuestion'>
						<th><span>[회원/개인정보]</span> 아이디, 비밀번호를 잃어버렸어요.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<p class='answerP'>[아이디 찾기]</p>
						<ul>
							<li>바이인 호텔은 회원 가입 시 별도의 이메일 인증 절차를 진행하지 않아 아이디 분실 시 고객센터로 문의해 주시기 바랍니다.</li>
						</ul>
						<p class='answerP'>[비밀번호 찾기]</p>
						<ul>
							<li>바이인 호텔 앱/웹 > 내 정보 > 로그인 > '비밀번호 찾기'에서 가입 시 등록한 이메일 주소 기재 후 재설정 메일 발송 > 메일 내 링크를 통해 비밀번호 재설정 (링크는 24시간 동안만 유지)</li>
						</ul>
						<p class='answerP'>[간편로그인]</p>
						<ul>
							<li>회원가입/로그인 후 내 정보 > 설정 > 간편 로그인에서 설정이 되어야만 사용 가능</li>
						</ul>
						<p class='answerP'>※ 바이인 호텔은 개인정보보호의 일환으로 1년 이상 장기 미이용 고객을 대상으로 모든 개인정보를 삭제 처리합니다.<br>
							로그인 시 '회원정보를 찾을 수 없습니다'의 메시지가 확인되는 경우, 바이인 호텔 고객센터(1533-3152 / 09:00 ~ 18:00 )로 문의해 주시기 바랍니다.</p>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[회원/개인정보]</span> 바이인호텔 사이트 아이디로 로그인이 되지 않아요.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<p class='answerP'>로그인이 되지 않는 경우는 다음과 같습니다.</p>
						<p class='answerNum'>▶ SNS로그인이 안될 경우</p>
						<ul>
							<li>먼저 ID로 회원가입/로그인 후 내 정보 > 설정 > 간편 로그인에서 연동해 주세요.</li>
							<li>바이인 호텔 웹사이트의 경우, SNS 로그인을 지원하지 않으며, 휴대폰 번호로 로그인 기능을 제공하고 있으니 이용에 참고하시기 바랍니다.</li>
						</ul>
						<p class='answerNum'>▶ 장기 미사용 고객일 경우</p>
						<ul>
							<li>바이인 호텔은 개인정보보호의 일환으로 12개월 장기 미이용 고객을 대상으로 모든 개인정보를 삭제 처리합니다.<br>
							 개인정보가 남아있지 않은 경우 탈퇴 여부를 확인할 수 없습니다.</li>
						</ul>
						<p class='answerP'>로그인 시, /회원정보를 찾을 수 없습니다'의 메시지가 나오는 경우 바이인 호텔 고객센터(1533-3152)에 문의해 주세요.</p>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[회원/개인정보]</span> 탈퇴했는데, 약관 개정 등의 메일이 왔어요.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<ul>
							<li>바이인 호텔은 가입 시 별도의 이메일 인증 절차를 진행하지 않아 탈퇴 이후 다른 사람이 가입 시 고객님의 이메일 정보를 입력했을 수 있으며, 이 경우 가입 여부와 관계없이 이메일이 전송될 수 있습니다.</li>
							<li>이메일 수신이 불편하신 경우, 바이인 호텔 고객센터(1533-3152)로 문의해 주세요.</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[회원/개인정보]</span> 탈퇴하고 싶어요.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<ul>
							<li>회원 탈퇴는 아래의 방법을 통해 직접 가능합니다.<br>
								▶ 바이인 호텔 앱/ 웹 : 내 정보 > 상단 닉네임 옆 내 정보 관리 > 회원 탈퇴</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[회원/개인정보]</span> 회원 정보 수정은 어떻게 하나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<p class='answerP'>아이디 변경은 불가하며, 아래 방법을 통해 비밀번호/닉네임 변경이 가능합니다.</p>
						<ul>
							<li>비밀번호<br>
							바이인 호텔 앱 > 내 정보 > 상단 닉네임 옆 내 정보 관리 > 비밀번호 수정하기</li>
							<li>닉네임<br>
							바이인 호텔 앱 > 내 정보 > 상단 닉네임 옆 내 정보 관리 > 닉네임 옆 연필 표시 선택 후 수정하기</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[회원/개인정보]</span> 마케팅 수신 여부를 수정하고 싶습니다.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<p class='answerP'>아래 방법을 통해 마케팅 수신 및 해제가 가능합니다.</p>
						<ul>
							<li>마케팅 수신 여부<br>
								▶ 바이인 호텔 앱 : 핸드폰 > 설정 > 바이인 호텔 알림 설정</li>
						</ul>
						<p class='answerP'>단, 서비스 이용에 필수적인 공지 내용은 동의 여부와 관계없이 발송된다는 점 참고 부탁드립니다.</p>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[회원/개인정보]</span> 탈퇴한 아이디로 재가입 할 수 있나요?</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<ul>
							<li>탈퇴 후 30일 이후부터 동일한 아이디로 재가입이 가능합니다.</li>
						</ul>
						</td>				
					</tr>
					<tr class='noticeQuestion'>
						<th><span>[회원/개인정보]</span> 회원가입 시 인증 문자가 오지 않아요.</th>
						<td><span id="aro"><img src="../images/arr5.png"></span></td>
					</tr>
					<!-- 숨겨진 답변 상세보기 -->
					<tr class="noticeAnswer">
						<td>
						<ul>
							<li>회원가입 시 인증번호 문자가 확인이 안될 시 차단 여부를 확인해 주세요.</li>
						</ul>
						</td>				
					</tr>
				</table>
				
				<div class="paging">
					<div class="pagination inner" id='pagination' style='text-align: center;'>
					
					</div>
				</div>
				
				<!-- 고객센터 전화번호, 문의시간 --> 
				<div class="callinfo">
					<h3>원하시는 질문이 없으신가요?</h3>
					<img src="../images/icon/blueCall.png" style="float: left; margin-right: 15px;">			
					<h4>고객센터 : 1533-3152</h4>
					<p>문의 가능 시간 : 09:00 - 18:00</p>
				</div>
				
				</div>
			</div>
		</div>
</div>
<%@include file="../footer.jsp"%>
	</div>
	<script>
		/* faq 질문 div 클릭시 답변 toggle로 나옴 */
		$('.noticeQuestion').click(function(){
			$(this).next().toggle();
		})
	</script>
	<script>                                            
	$(function(){
		page();
	})
	function page() {	
	    $('table.notable').each(function () {
	        var pagesu = 10;  //페이지 번호 갯수
	        var currentPage = 0;
	        var numPerPage = 8;  //목록의 수
	        var $table = $(this);
	        var pagination = $("#pagination");

	        //length로 원래 리스트의 전체길이구함
	        var numRows = $table.find('.noticeQuestion').length;

	        //Math.ceil를 이용하여 반올림
	        var numPages = Math.ceil(numRows / numPerPage);

	        //리스트가 없으면 종료
	        if (numPages == 0) return;

	        //pager라는 클래스의 div엘리먼트 작성
	        var $pager = $('<div class="pager"></div>');
	        var nowp = currentPage;
	        var endp = nowp + 10;

	        //페이지를 클릭하면 다시 셋팅
	        $table.bind('repaginate', function () {

	        //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
	            $table.find('.noticeQuestion').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	            $("#pagination").html("");
	            if (numPages > 1) {     // 한페이지 이상이면
	                if (currentPage < 5 && numPages - currentPage >= 5) {   // 현재 5p 이하이면
	                    nowp = 0;     // 1부터 
	                    endp = pagesu;    // 10까지
	                } else {
	                    nowp = currentPage - 5;  // 6넘어가면 2부터 찍고
	                    endp = nowp + pagesu;   // 10까지
	                    pi = 1;
	                }
	                if (numPages < endp) {   // 10페이지가 안되면
	                    endp = numPages;   // 마지막페이지를 갯수 만큼
	                    nowp = numPages - pagesu;  // 시작페이지를   갯수 -10
	                }
	                if (nowp < 1) {     // 시작이 음수 or 0 이면
	                    nowp = 0;     // 1페이지부터 시작
	                }
	            } else {       // 한페이지 이하이면
	                nowp = 0;      // 한번만 페이징 생성
	                endp = numPages;
	            }
	            // [처음]
	            $('<span class="pageNum first">《</span>').bind('click', { newPage: page }, function (event) {
	                currentPage = 0;
	                $table.trigger('repaginate');
	                $($(".pageNum")[2]).addClass('active').siblings().removeClass('active');
	            }).appendTo(pagination).addClass('clickable');
	            // [이전]
	            $('<span class="pageNum back"><img src="../images/arr4.png"></span>').bind('click', { newPage: page }, function (event) {
	                if (currentPage == 0) return;
	                currentPage = currentPage - 1;
	                $table.trigger('repaginate');
	                $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
	            }).appendTo(pagination).addClass('clickable');
	            // [1,2,3,4,5,6,7,8]
	            for (var page = nowp; page < endp; page++) {
	                $('<span class="pageNum"></span>').text((page + 1)).bind('click', { newPage: page }, function (event) {
	                	// 여기가 data인데 우리는 항상 data로 data를 정의하기에 그냥 갖다 쓰면 됨!
	                    currentPage = event.data['newPage'];
	                    $table.trigger('repaginate');
	                    $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
	                }).appendTo(pagination).addClass('clickable');
	            }

	            // [다음]
	            $('<span class="pageNum next"><img src="../images/arr3.png"></span>').bind('click', { newPage: page }, function (event) {
	                if (currentPage == numPages - 1) return;
	                currentPage = currentPage + 1;
	                $table.trigger('repaginate');
	                $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
	            }).appendTo(pagination).addClass('clickable');

	            // [끝]
	            $('<span class="pageNum last">》</span>').bind('click', { newPage: page }, function (event) {
	                currentPage = numPages - 1;
	                $table.trigger('repaginate');
	                $($(".pageNum")[endp - nowp + 1]).addClass('active').siblings().removeClass('active');
	            }).appendTo(pagination).addClass('clickable');

	            $($(".pageNum")[2]).addClass('active');
	            
	            $('.noticeAnswer').css('display', 'none');
	        });

	        $pager.insertAfter($table).find('span.pageNum:first').next().next().addClass('active');
	        $pager.appendTo(pagination);
	        $table.trigger('repaginate');
		    });
		}
	</script>
</body>
</html>