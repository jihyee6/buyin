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
						<!-- faq 페이지 div -->
						<div class="faqmenu">
							<span onclick ="location.href='faq'">전체</span>
							<span onclick ="location.href='reserfaq'" style="font-weight: bold; color: #242424; border-bottom: 2px solid #4366A3;">예약·결제·영수증</span>
							<span onclick ="location.href='pointfaq'">변경·취소·환불</span>
							<span onclick ="location.href='receiptfaq'">쿠폰·할인</span>
							<span onclick ="location.href='reviewfaq'">회원·개인정보</span>
						</div>
						<!-- faq 내용 보여주는 table -->
					<table class="notable">
							<!-- 질문 -->
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
						</table>
						
						<div class="paging">
							<div class="pagination inner" id='pagination' style='text-align: center;'>
							
							</div>
						</div>
					<!-- 고객센터 div -->
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