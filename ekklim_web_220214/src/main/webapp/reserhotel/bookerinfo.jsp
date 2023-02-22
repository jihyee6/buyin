<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@page import="java.util.*"%>
<%

	/*
		//*** 위변조 방지체크를 signature 생성 ***

			oid, price, timestamp 3개의 키와 값을

			key=value 형식으로 하여 '&'로 연결한 하여 SHA-256 Hash로 생성 된값

			ex) oid=INIpayTest_1432813606995&price=819000&timestamp=2012-02-01 09:19:04.004
				

			 * key기준 알파벳 정렬

			 * timestamp는 반드시 signature생성에 사용한 timestamp 값을 timestamp input에 그대로 사용하여야함
	*/

	//############################################
	// 1.전문 필드 값 설정(***가맹점 개발수정***)
	//############################################

	// 여기에 설정된 값은 Form 필드에 동일한 값으로 설정
//	String mid					= "INIpayTest";		// 가맹점 ID(가맹점 수정후 고정)
	String mid					= "ekklimkr00";
	
	//인증
//	String signKey			    = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";	// 가맹점에 제공된 웹 표준 사인키(가맹점 수정후 고정)
	String signKey			    = "S0pDcnVhczg4MWpwYmZuclhGQ09Pdz09";
//	String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성

//	String oid					= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)
//	String price				= "1000";													// 상품가격(특수기호 제외, 가맹점에서 직접 설정)

	String cardNoInterestQuota	= "11-2:3:,34-5:12,14-6:12:24,12-12:36,06-9:12,01-3:4";		// 카드 무이자 여부 설정(가맹점에서 직접 설정)
	String cardQuotaBase		= "2:3:4:5:6:11:12:24:36";		// 가맹점에서 사용할 할부 개월수 설정

	//###############################################
	// 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
	//###############################################
	String mKey = SignatureUtil.hash(signKey, "SHA-256");
	
	//###############################################
	// 2.signature 생성
	//###############################################
//	Map<String, String> signParam = new HashMap<String, String>();

//	signParam.put("oid", oid); 					// 필수
//	signParam.put("price", price);				// 필수
//	signParam.put("timestamp", timestamp);		// 필수

	// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
//	String signature = SignatureUtil.makeSignature(signParam);
	
	
	/* 기타 */
	//String path = request.getRequestURL().toString().split("ekklim")[0];
	String path = request.getRequestURL().toString().split("buyinhotel")[0];
	
	
	//String siteDomain = path + "ekklim.kr/reserhotel"; //가맹점 도메인 입력
	String siteDomain = path + "buyinhotel.co.kr/reserhotel"; //가맹점 도메인 입력
	// 페이지 URL에서 고정된 부분을 적는다. 
	// Ex) returnURL이 http://localhost:8080INIpayStdSample/INIStdPayReturn.jsp 라면
	// http://localhost:8080/INIpayStdSample 까지만 기입한다.
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.booker_info {
	max-width: 850px;
	padding-top: 30px;
	margin-left: 66px;
}

.location {
	width: 850px;
	margin-top: 40px;
	line-height: 40px;
}

.location span {
	font-family: NanumSquare_ac;
	font-size: 18px;
	color: #434343;
}

aside {
	float: right;
	margin: 153px 400px 0px 0px;
}

.reservation_info {
	position: fixed;
}

.reservation_info h4 {
	border-bottom: 3px solid #8A8A8A;
	width: 100%;
	line-height: 50px;
	font-size: 28px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.content {
	background-color: #F5F5F5;
}

.backcolor {
	width: 1350px;
	background-color: white;
	height: 100%;
	padding-bottom: 172px;
}

.rinfo_table tr {
	display: revert;
	float: none;
}

.rinfo_table tr td:first-child {
	font-weight: bold;
	width: 125px;
}

.rinfo_table tr td:last-child {
	text-align: right;
}

.rinfo_table td {
	margin: 0px;
	padding: 8px;
	display: revert;
	font-family: malgun;
	font-size: 16px;
	color: #242424;
}

.totalPrices td {
	font-size: 20px;
	font-weight: bold;
}

.info_txt td {
	width: 202px;
	text-align: right;
	font-size: 16px;
	color: #242424;
	font-family: malgun;
	text-align: right;
}

.rinfo_table table {
	background: white;
	width: 374px;
	font-family: malgun;
	border-collapse: collapse;
}

hr {
	border: 1px solid #8A8A8A;
}

.price_txt {
	display: flex;
	margin: 15px auto;
	font-family: malgun;
	font-weight: bold;
	color: #242424;
}

.price_txt p {
	font-size: 16px;
	text-align: left;
	width: 170px;
}

.price_txt span {
	font-size: 22px;
	text-align: right;
	width: 170px;
}

.rinfo_table button {
	width: 340px;
	border: none;
	background-color: #4366A3;
	color: white;
	font-size: 20px;
	font-family: NanumSquare_ac;
	height: 48px;
	border-radius: 10px;
	cursor: pointer;
	margin: 24px;
}

.option table thead tr {
	display: flex;
	background: #F9F9F9;
}

.option table thead tr th {
	width: 230px;
	border-bottom: 1px solid rgb(112, 112, 112, 0.5);
	margin: 0;
	padding: 20px;
	text-align: center;
	font-size: 16px;
	font-family: malgun;
	color: #707070;
	font-weight: bold;
}

.option table tbody tr td {
	width: 230px;
	margin: 0;
	padding: 20px;
	text-align: center;
	font-size: 16px;
	color: #707070;
	font-family: malgun;
}

.option table {
	border: 1px solid rgb(112, 112, 112, 0.5);
	border-collapse: collapse;
	margin: 5px auto;
}

.option_count td {
	display: flex;
}

.bookerinfo {
	margin-top: 45px;
}

.option_count input {
	border: none;
	background-color: white;
	font-size: 16px;
	cursor: pointer;
}

.payment h4 {
	font-size: 28px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #242424;
	border-bottom: 3px solid #8A8A8A;
	line-height: 50px;
	margin-bottom: 30px;
}

.binfo {
	margin: 35px auto;
}

.binfo input {
	border: none;
	border-bottom: 1px solid rgb(138, 138, 138, 0.5);
	line-height: 25px;
	font-size: 16px;
	font-family: malgun;
	color: #707070;
	margin: auto 5px;
}

.in1 {
	width: 280px;
}

.in2 {
	width: 500px;
}

.in3 {
	width: 200px;
}

.binfo p {
	font-size: 16px;
	font-weight: bold;
	font-family: malgun;
	color: #242424;
	margin: 20px auto;
}

.binfo select {
	border: none;
	border-bottom: 1px solid rgb(138, 138, 138, 0.5);
	line-height: 25px;
	font-size: 16px;
	font-family: malgun;
	color: #707070;
	margin: auto 5px;
	width: 300px;
}

.bookerinfo h4 label {
	margin-left: 20px;
	font-size: 16px;
	font-weight: normal;
	font-family: malgun;
	color: #242424;
}

.discount {
	border: 1px solid rgb(112, 112, 112, 0.5);
	display: flex;
	width: 850px;
	height: 55px;
	margin: 0px;
}

#discount2 {
	border: 1px solid rgb(112, 112, 112, 0.5);
	width: 675px;
	height: 52px;
	margin-left: 0px;
	text-align: right;
}

#discount2:focus {
	outline: none;
}

.discount p {
	width: 670px;
	float: left;
	font-size: 13px;
	color: #707070;
}

.discount span {
	font-size: 13px;
	font-weight: bold;
	color: #242424;
	cursor: pointer;
}

.discount span img {
	height: 18px;
	margin-left: 12px;
}

.p_number {
	font-size: 13px;
}

.p_number span {
	color: #FF6600;
}

.pointbox {
	display: flex;
}

.pointbox button {
	width: 158px;
	height: 57px;
	border: 1px solid rgb(112, 112, 112, 0.5);
	background-color: white;
	font-size: 13px;
	font-family: malgun;
	font-weight: bold;
	color: #242424;
	cursor: pointer;
}

.paybutton {
	width: 402px;
	height: 62px;
	margin: auto 10px;
	border: 1px solid #707070;
	background-color: white;
	font-size: 16px;
	font-weight: bold;
	font-family: malgun;
	color: #242424;
	cursor: pointer;
	border-radius: 10px;
}

.cancel_table table {
	border: 1px solid #DCDCDC;
	border-collapse: collapse;
	width: 100%;
}

.cancel_table table td {
	border-bottom: 1px solid #DCDCDC;
	margin: 0px;
	font-family: NanumSquare_ac;
	font-size: 14px;
	font-weight: bold;
	color: #242424;
	padding: 22px;
	text-align: center;
}

.cancel_table table td:last-child {
	border-bottom: none;
}

.cancel_table table td:first-child {
	background-color: #F9F9F9;
}

.cancel_condition {
	width: 30%;
	border-right: 1px solid #DCDCDC;
}

.cancel_fees {
	width: 69.8%;
}

.cancel_info {
	font-size: 16px;
	font-weight: bold;
	font-family: malgun;
	color: #242424;
}

.cancel_info p {
	font-weight: normal;
}

.agreebox {
	width: 800px;
	height: 50px;
	background-color: #F7F9FB;
	border: 1px solid #DCDCDC;
}

.agree1 {
	margin: 15px 0px 15px 40px;
}

.agree1 span {
	float: right;
	margin-right: 30px;
	cursor: pointer;
}

.agree, .agreebox {
	font-size: 14px;
	font-weight: bold;
	color: #242424;
	font-family: NanumSquare_ac;
}

.agreebox label {
	margin-left: 15px;
	line-height: 55px;
}

.okbutton button {
	width: 100%;
	height: 48px;
	margin-top: 70px;
	background-color: #4366A3;
	border: none;
	font-size: 20px;
	font-family: NanumSquare;
	color: white;
	border-radius: 7px;
	cursor: pointer;
}

.personInfo, .agreetable, .couponApply, .exclamation, .giftPop,
	.buyRoomPop {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: 1000;
	z-index: -1;
	opacity: 0;
}

.show {
	opacity: 1;
	z-index: 1000;
	transition: all .5s;
}

.window {
	position: relative;
	width: 100%;
	height: 100%;
}

.popup {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #ffffff;
	border-radius: 15px;
	/* 임시 지정 */
	width: 900px;
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
	padding-bottom: 18px;
}

.show .popup {
	transform: translate(-50%, -50%);
	transition: all .5s;
}

.exclamation.show>.window>.popup {
	width: 530px;
	padding-bottom: 22px;
}

.pTitle img {
	width: 900px;
	height: 600px;
	margin-top: -60px;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
}

.seePhoto {
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	position: relative;
	height: 60px;
	background-color: #4366A3;
}

.seePhoto p {
	color: white;
	margin: 0 auto;
	margin-left: 20px;
	font-size: 24px;
	line-height: 54px;
	font-family: NanumSquare_ac;
}

#close4, #close5, #close7, #close8, #close10 {
	float: right;
	width: 40px;
	height: 40px;
	margin: -44px 12px 0px 0px;
}

.personalNotice {
	width: 740px;
	margin: 15px auto;
	font-size: 14px;
	font-family: NanumSquare_ac;
	color: #242424;
}

.deleteAlert {
	text-align: center;
}

.deleteAlert img {
	width: 86px;
	height: 86px;
	margin-top: 22px;
}

.deleteText {
	margin: 20px auto;
	line-height: 33px;
	font-size: 24px;
	color: #707070;
	font-family: NanumSquare_ac;
	font-weight: bold;
}

.deleteButton button {
	width: 112px;
	height: 48px;
	margin-right: 10px;
	font-size: 20px;
	font-family: NanumSquare_ac;
	background-color: white;
	border: 2px solid #979797;
	color: #707070;
	border-radius: 8px;
	cursor: pointer;
}

.personalNotice p {
	line-height: 30px;
	margin-bottom: 20px;
}

.personalNotice textarea {
	width: 740px;
	height: 660px;
	border: none;
	resize: none;
}

.num {
	margin: 25px 0px 0px 172px;
}

.num img {
	width: 12px;
	margin: 0px;
	margin-left: 245px;
	height: 18px;
}

.num p {
	margin: auto 10px;
}

.num p img {
	margin-left: 10px;
}

.couponList {
	margin: 25px auto;
	width: 872px;
	height: 550px;
}

.couponList p {
	margin: 10px 0px 10px 12px;
	font-size: 16px;
	font-family: NanumSquare_ac;
	color: #242424;
}

.couponList table {
	width: 800px;
	border-top: 1px solid #959595;
	border-collapse: collapse;
}

.couponList table tr:first-child {
	width: 100px;
	height: 80px;
}

.couponList table .radiobox {
	background: #F8F8F8;
	text-align: center;
	line-height: 80px;
}

.couponList table tr:last-child {
	width: 700px;
	height: 80px;
}

.couponList table tr:last-child td {
	line-height: 24px;
}

.couponList table td {
	margin: 0px;
	padding: 4px;
	height: 80px;
	border-bottom: 1px solid #959595;
	font-family: NanumSquare_ac;
	color: #242424;
	font-weight: bold;
	font-size: 18px;
}

.couponList table td p {
	line-height: 56px;
}

#couponPeriod {
	font-size: 24px;
	font-weight: bold;
	margin-top: -64px;
	float: right;
}

.deleteButton button {
	width: 112px;
	height: 48px;
	margin-right: 10px;
	font-size: 20px;
	font-family: NanumSquare_ac;
	background-color: white;
	border: 2px solid #979797;
	color: #707070;
	border-radius: 8px;
	cursor: pointer;
}

.giftcardSelect, .buyRoomSelect {
	display: grid;
	grid-template-columns: 40% 60%;
	width: 388px;
	height: 156px;
	border: 1px solid #BFBFBF;
	border-radius: 6px;
	padding: 10px;
	margin: 8px;
	float: left;
}

.giftSelectImg, .buyRoomSelectImg {
	background-color: #F6F6F6;
	width: 158px;
	height: 128px;
	position: relative;
	border-radius: 6px;
}

.giftSelectImg img, .buyRoomSelectImg img {
	width: 128px;
	height: 80px;
	position: absolute;
	transform: translate(15px, 26px);
	margin: 0px;
	border-radius: 4px;
}

.giftSelectText, .buyRoomSelectText {
	color: #242424;
}

.giftSelectText>.giftFrom, .buyRoomFrom {
	font-size: 14px;
	font-family: NotoSansR;
}

.giftSelectText h4, .buyRoomSelectText h4 {
	font-size: 18px;
	margin-bottom: 18px;
	font-family: NotoSansM;
	margin-left: 8px;
}

.giftSelectText>.giftMoney, .buyRoomMoney {
	font-size: 16px;
	font-family: NotoSansB;
	color: #E75A00;
}

.giftSelectText>.giftPeriod {
	font-size: 16px;
	color: #A4A4A4;
	font-family: NotoSansR;
}

.giftcardSelect>.giftNoSelect {
	font-size: 24px;
	line-height: 156px;
	font-family: NotoSansR;
}

.payInformation {
	width: 100%;
}

.payInformation tr {
	width: 50%;
}

.payInformation td {
	padding: 14px;
	margin: 0px;
	font-family: malgun;
	font-size: 16px;
	font-weight: bold;
}

.payInformation td:last-child {
	font-size: 20px;
	border-top: 1px solid #A4A4A4;
	padding-top: 20px;
}

.payTitle td {
	text-align: left;
}

.payText td {
	text-align: right;
}

.couponTable tr {
	display: revert;
	float: none;
}

.couponTable td {
	display: revert;
}

.pageNum.active {
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

#pageArr1 img, #pageArr2 img {
	width: 6px;
	height: 14px;
}

.giftcardList::-webkit-scrollbar, .buyRoonList::-webkit-scrollbar {
	width: 8px;
}

.giftcardList::-webkit-scrollbar-thumb, .buyRoonList::-webkit-scrollbar-thumb
	{
	background-color: #7E7E7E;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}

.giftcardList::-webkit-scrollbar-track, .buyRoonList::-webkit-scrollbar-track
	{
	background-color: transparent;
}

.giftcardList, .buyRoonList {
	width: 870px;
	height: 532px;
	overflow: auto;
}

.giftCardCss, .buyRoomCss {
	outline: 2px solid #4366A3;
}

.payMethodCSS {
	background-color: #707070;
	color: white;
}

.personalAgree tr {
	display: revert;
	float: none;
}

.personalAgree td {
	display: revert;
	height: 34px;
	padding: 20px;
	margin: 0px;
	text-align: center;
	border-bottom: 1px solid #B7B7B7;
	font-family: NanumSquare_ac;
	font-family: bold;
	font-size: 14px;
}

.personalAgree {
	line-height: 25px;
	width: 730px;
	height: 300px;
	border: 1px solid #B7B7B7;
	border-collapse: collapse;
	margin: 20px auto;
}

.personalAgree tr td:first-child {
	color: #4366A3;
	font-weight: bold;
	border-right: 1px solid #B7B7B7;
	width: 166px;
}

.personalAgree tr td:last-child {
	font-weight: bold;
	text-align: left;
}

.personalNotice textarea:focus {
	outline: none;
}

#allCheck, .oneCheck {
	cursor: pointer;
}
</style>

</head>
<body>
	<%
	String rooms = request.getParameter("room");

	String type = request.getParameter("type");
	String checkin = request.getParameter("checkin");
	String checkout = request.getParameter("checkout");
	String shopbaskets = request.getParameter("shopbaskets");

	Calendar today = Calendar.getInstance();
	String todayString = String.format("%d-%d-%d", today.get(Calendar.YEAR), today.get(Calendar.MONTH) + 1,
			today.get(Calendar.DATE));

	Calendar tomorrow = Calendar.getInstance();
	tomorrow.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH), today.get(Calendar.DATE) + 1);
	String tomorrowString = String.format("%d-%d-%d", tomorrow.get(Calendar.YEAR), tomorrow.get(Calendar.MONTH) + 1,
			tomorrow.get(Calendar.DATE));
	
	String lodgementName = (String) session.getAttribute("goodsName");
	%>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="backcolor">
				<!-- 예약정보 사이드바 -->
				<aside>
					<div class="reservation_info">
						<h4>결제 정보</h4>
						<div id='shopbasket_id' style='display: none;'></div>
						<!-- 결제정보 사이드바 div -->
						<div class="rinfo_table">
							<table>
								<tr>
									<td>예약금액</td>
									<td><span id="origin_price"></span>원</td>
								</tr>
								<tr>
									<td>바이룸사용</td>
									<td id='select_buyRoom'>적용안함</td>
								</tr>
								<tr>
									<td>쿠폰사용</td>
									<td><span id='coupon_point'>0</span>P</td>
								</tr>
								<tr>
									<td>포인트사용</td>
									<td><span id="user_point">0</span>원</td>
								</tr>
								<tr style='border-bottom: 1px solid #A4A4A4'>
									<td>기프트카드 사용</td>
									<td><span id="gift_Price">0</span>원</td>
								</tr>
								<tr class='totalPrices'>
									<td>총 결제금액</td>
									<td><span id='totalMoney'>0</span>원</td>
								</tr>
							</table>
							<button type="button" id="paymentButton">
								<span id='AllTotalMoney'>0</span>원 결제하기
							</button>
						</div>
					</div>
				</aside>
				<!-- 예약정보 사이드 바 끝 -->

				<!-- 예약 정보 입력 부분 -->
				<div class="booker_info">
					<!-- 페이지 흐름 div -->
					<div class="location">
						<span>호텔/객실선택 </span> <span>> 옵션선택 ></span><span style="font-weight: bold; color: #4366A3;"> 결제하기 </span> <span>> 결제완료</span>
					</div>
					<!-- 옵션 부분 -->
					<div class="payment">
						<!-- 예약자 정보 입력 부분 -->
						<div class="bookerinfo">
							<h4>예약자 정보</h4>
							<!-- 예약자 이름 div -->
							<div class="binfo">
								<p>예약자명</p>
								<p id='user_name' style='display: none;'></p>
								<input type="text" id="bookerLastName" placeholder="성" size="4" class="in1"> 
								<input type="text" id="bookerFirstName" placeholder="이름" size="8" class="in2">
							</div>
							<!-- 휴대폰 번호 div -->
							<div class="binfo">
								<p>휴대폰번호</p>
								<select name="c_number">
									<option value="+82(대한민국)">+82(대한민국)</option>
								</select> 
								<input type="text" id="bookerPhoneNum" placeholder="-없이 숫자만 입력해주세요" class="in2 phoneNumber">
							</div>
							<!-- 이메일 주소 div -->
							<div class="binfo">
								<p>이메일주소</p>
								<p id='userEmail' style='display: none;'></p>
								<input type="text" id="bookerEmailAccount" name="email" class="in3">&#64; 
								<input type="text" id="bookerEmailDomain" name="email" class="in1">
								<!-- 이메일 도메인 모음 select -->
								<select name="booker_email_select" class="in1" id="booker_email_select">
									<option value="1" selected>직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="kakao.com">kakao.com</option>
									<option value="msn.com">msn.com</option>
									<option value="nate.com">nate.com</option>
									<option value="tistory.com">tistory.com</option>
									<option value="yahoo.com">yahoo.com</option>
								</select>
							</div>
						</div>

						<!-- 이용자 정보 입력 -->
						<div class="bookerinfo">
							<h4>
								이용자 정보 <label><input type="checkbox" id='bookerCheck' class='oneCheck'>예약자 정보와 동일합니다.</label>
							</h4>
							<!-- 이용자 이름 div -->
							<div class="binfo">
								<p>이용자명</p>
								<input type="text" id='userLastName' placeholder="성" size="4" class="in1"> 
								<input type="text" id='userFirstName' placeholder="이름" size="8" class="in2">
							</div>
							<!-- 이용자 번호 div -->
							<div class="binfo">
								<p>휴대폰번호</p>
								<select name="c_number">
									<option value="+82(대한민국)">+82(대한민국)</option>
								</select> 
								<input type="text" id='userPhoneNum' placeholder="-없이 숫자만 입력해주세요" class="in2 phoneNumber">
							</div>
							<!-- 이용자 이메일 주소 div -->
							<div class="binfo">
								<p>이메일주소</p>
								<input type="text" name="email01" id="userEmailAccount" class="in3">@ <input type="text" name="email02" id="userEmailDomain" class="in1">
								<!-- 이메일 도메인 모음 div -->
								<select class="in1" name="user_email_select" id="user_email_select">
									<option value="1" selected>직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="kakao.com">kakao.com</option>
									<option value="msn.com">msn.com</option>
									<option value="nate.com">nate.com</option>
									<option value="tistory.com">tistory.com</option>
									<option value="yahoo.com">yahoo.com</option>
								</select>
							</div>
						</div>

						<div class="bookerinfo">
							<h4>할인 선택</h4>
							<!-- 숙박권(바이룸) div-->
							<div class="binfo">
								<div class="discount_coupon">
									<p class="p_coupon">
										바이룸&nbsp;&#124; <span class="p_number">적용가능 <span id='haveRoom'>0</span>장
										</span>
									</p>
								</div>
								<!-- 선택한 바이룸 옵션 이름 보여주는 div -->
								<div class="discount">
									<p class='buyroomName'>적용안함</p>
									<!-- 바이룸 팝업 나오는 img -->
									<span id="Room_show" class='roomClick'><img src="../images/arr3.png"></span>
								</div>
							</div>

							<!-- 할인쿠폰 -->
							<div class="binfo">
								<div class="discount_coupon">
									<p class="p_coupon">
										할인쿠폰&nbsp;&#124; <span class="p_number">적용가능 <span id='haveCoupon'>0</span>장
										</span>
									</p>
								</div>
								<!-- 선택한 할인쿠폰 이름+ 가격 보여주는 div -->
								<div class="discount">
									<p class='discountName'>적용안함</p>
									<!-- 할인쿠폰 팝업 나오는 img -->
									<span id="ca_show" class='couponClick'><img src="../images/arr3.png"></span>
								</div>
							</div>

							<!-- 포인트 -->
							<div class="binfo">
								<div class="discount_coupon">
									<p class="p_coupon">
										포인트&nbsp;&#124; <span class="p_number">보유포인트 <span id='hasPoint'>0</span>P
										</span>
									</p>
								</div>
								<!-- 포인트 작성 박스 div -->
								<div class="pointbox">
									<input id='discount2' onkeyup='printName()' type='text' value=0>
									<button type="button" id='fullUseBtn'>전액사용</button>
								</div>
							</div>

							<!-- 결제 정보 선택 부분 -->
							<div class="bookerinfo">
								<h4>결제 정보</h4>
								<div class="binfo">
									<table class="payInformation">
										<tr class="payTitle">
											<td>예약금액</td>
											<td>바이룸사용</td>
											<td>쿠폰사용</td>
											<td>포인트사용</td>
											<td>기프트카드 사용</td>
											<td>총 결제금액</td>
										</tr>
										<tr class="payText">
											<td><span id='payInfoPrice'></span>원</td>
											<td id='selectBuyRoom'>적용안함</td>
											<td><span id='useCouponPoint'>0</span>P</td>
											<td><span id='usePointPrice'>0</span>원</td>
											<td><span id='giftCardPrice'>0</span>원</td>
											<td><span id='payTotalPrice'>0</span>원</td>
										</tr>
									</table>
								</div>
							</div>

							<div class="bookerinfo">
								<h4>결제 수단</h4>
								<!-- 기프트카드 -->
								<div class="binfo">
									<div class="discount_coupon">
										<p class="p_coupon">기프트카드</p>
									</div>
									<!-- 선택한 기프트가격 이름 +  가격 보여주는 div -->
									<div class="discount">
										<p class='giftDiscountName' style="margin-left: 8px;">적용안함</p>
										<span style="margin-right: 5px; width: 126px;" id="gi_show">기프트카드 선택<img src="../images/arr3.png"></span>
									</div>
								</div>
							</div>
							<!-- 계좌이체,신용카드 -->
							<div class="binfo">
								<div class="payment_info">
									<p>결제방법</p>
									<div>
										<button type="button" id="card" value='card' class="paybutton payMethod" onclick="Card()">카드결제</button>
										<button type="button" id="directbank" value='bank' class="paybutton" onclick="DirectBank()">계좌이체</button>
										<div id='payment_warning' style='display: none; font-weight: bold; color: #f01111; padding: 8px 12px 0px;'>※결제방법을 선택해 주세요.</div>
									</div>
								</div>
							</div>
						</div>

						<!-- 취소 규정 안내 부분 -->
						<div class="bookerinfo">
							<h4>취소규정</h4>
							<div class="binfo">
								<div class="cancel_info">
									<p>&middot; 숙박 및 대실 예약완료 후 10분이내 당일취소 및 변경 가능합니다.</p>
									<p>&middot; 숙박 환불기준</p>
									<div class="cancel_table">
										<table>
											<tr class="cancel_condition">
												<td>유형</td>
												<td>체크인 10일전</td>
												<td>체크인 9-7일전</td>
												<td>체크인 6-5일전</td>
												<td>체크인 4-3일전</td>
												<td>체크인 2-1일전</td>
												<td>당일취소 및 노쇼</td>
											</tr>
											<tr class="cancel_fees">
												<td>환불기준</td>
												<td>총 결제금액 중 100% 환불</td>
												<td>총 결제금액 중 70% 환불</td>
												<td>총 결제금액 중 50% 환불</td>
												<td>총 결제금액 중 30% 환불</td>
												<td>총 결제금액 중 10% 환불</td>
												<td>환불 불가</td>
											</tr>
										</table>

										<p>&middot; 대실 환불 기준</p>
										<table>
											<tr class="cancel_condition">
												<td>유형</td>
												<td>체크인 1일전</td>
												<td>당일취소 및 노쇼</td>
											</tr>
											<tr class="cancel_fees">
												<td>환불기준</td>
												<td>무료취소 가능</td>
												<td>환불 불가</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>

						<!-- 이용안내 동의 선택 체크박스 -->
						<div class="bookerinfo">
							<h4>개인정보 수집 및 이용에 대한 동의</h4>
							<div class="binfo">
								<div class="agreebox">
									<label><input type="checkbox" id='allCheck'> 전체동의</label>
								</div>
							</div>
							<div class="agree">
								<div class="agree1">
									<label><input type="checkbox" name='oneCheck' class='oneCheck'> 개인정보 수집 및 이용 목적 동의(필수)</label> <span id="n_show">전문보기 > </span>
								</div>
								<div class="agree1">
									<label><input type="checkbox" name='oneCheck' class='oneCheck'> 개인정보의 제3자 제공 동의(필수)</label> <span id="m_show">전문보기 > </span>
								</div>
							</div>
						</div>
						<!-- 결제모듈 -->
						<form id="SendPayForm_id" name="SendPayForm" method="POST" >

				        <input type="hidden"  name="goodname" id="goodname" value="" >
				        <input type="hidden"  name="buyername" id="buyername" value="" >
				        <input type="hidden"  name="buyertel" id="buyertel" value="" >
				        <input type="hidden"  name="buyeremail" id="buyeremail" value="" >
				        <input type="hidden"  name="price" id="price" value="" >
				        <input type="hidden"  name="mid" value="<%=mid %>" ><!-- 에스크로테스트 : iniescrow0, 빌링(정기과금)테스트 : INIBillTst -->
				        <input type="hidden"  name="gopaymethod" id="gopaymethod" value="Card" >
				        <input type="hidden"  name="mKey" value="<%=mKey %>" >
				        <input type="hidden"  name="signature" id="signature" value="" >
				        <input type="hidden"  name="oid" id="oid" value="" >
				        <input type="hidden"  name="timestamp" id="timestamp" value="" >
				        <input type="hidden"  name="version" value="1.0" >
				        <input type="hidden"  name="currency" value="WON" >
				        <input type="hidden"  name="acceptmethod" value="below1000" ><!-- 에스크로옵션 : useescrow, 빌링(정기과금)옵션 : BILLAUTH(Card) -->
				        <input type="hidden"  name="returnUrl" value="<%=siteDomain %>/complete.jsp" >
				        <input type="hidden"  name="closeUrl" value="<%=siteDomain %>/close.jsp" >
				   </form>
					</div>
				</div>
			</div>
			<%@include file="../footer.jsp"%>
		</div>
	</div>

	<!-- 개인정보 수집 팝업 -->
	<div class="personInfo">
		<div class="window">
			<div class="popup">
				<div class="pTitle">
					<div class="seePhoto">
						<p>개인정보 수집 및 이용 목적 동의</p>
						<img src="../images/closebutton.png" id="close4">
					</div>
					<!-- 개인정보 수집 내용 상세히 설명 -->
					<div class="personalNotice">
						<p>개인정보수집&middot;이용 동의(필수)</p>
						<%@include file="agreePolicy.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 개인정보 3자 동의 안내 팝업 -->
	<div class="agreetable">
		<div class="window">
			<div class="popup">
				<div class="pTitle">
					<div class="seePhoto">
						<p>개인 정보의 제3자 제공 동의</p>
						<img src="../images/closebutton.png" id="close5">
					</div>
					<div class="personalNotice">
						<p>(주)바이인호텔 결제 서비스를 위한 개인(신용)정보 제3자 제공 동의서(필수)</p>
						<p>
							「개인정보 보호법」,「신용정보의 이용 및 보호에 관한 법률」등에 따라 신용카드사 고객의 개인(신용)정보를 제3자에게 제공하는 경우 고객의 동의를 얻어야합니다.<br> 이에 본인은 아래의 내용과 같이 본인의 개인(신용)정보를 제3자에게 제공하는데 동의합니다.
						</p>
						<table class='personalAgree'>
							<tr>
								<td>제공받는자</td>
								<td>(주)바이인호텔</td>
							</tr>
							<tr>
								<td>제공받는 자의 이용목적</td>
								<td>결제서비스 및 카드등록, 카드관리, 포인트적립 서비스, 상담 및 민원처리</td>
							</tr>
							<tr>
								<td>제공항목</td>
								<td>
									<p>- 일반개인 정보: 카드사 회원 ID</p>
									<p>- 신용거래정보 : 카드ID(대체카드정보), OTC(1회용 가상카드번호), 마스킹된 카드번호, 고정형 토큰, 결제정보(결제일시, 결제금액, 할부개월 수, 가맹점명, 가맹점번호, 승인번호 등)</p>
								</td>
							</tr>
							<tr>
								<td>이용 및 보유기간</td>
								<td>서비스의 제공목적이 달성된 후 파기<br> (단, 관계법령에 정해진 규정에 따라 법정기간 동안 보관)
								</td>
							</tr>
						</table>
						<p>[개인정보의 제3자 제공 거부]</p>
						<p>이용자는 개인정보의 제 3자 제공 동의를 거부할 수 있습니다. 단, 동의를 거부하는 경우 본 서비스 결제 및 예약이 정상적으로 이루어 질 수 없음을 알려드립니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 쿠폰적용 리스트 팝업-->
	<div class="couponApply">
		<div class="window">
			<div class="popup">
				<div class="pTitle">
					<div class="seePhoto">
						<p>쿠폰 적용</p>
						<img src="../images/closebutton.png" id="close7">
					</div>
					<div class="couponList">
						<p style='margin: 10px 0px 18px 42px;'>해당 상품에 적용 가능한 쿠폰입니다. 쿠폰을 선택해주세요.</p>
						<table class="couponTable">
							<!-- 쿠폰 적용 안함 div -->
							<tr class='couponType'>
								<td class='radiobox' style='width: 20%'><input type='radio' name='check' value='no'></td>
								<td style='width: 80%'><p>적용안함</p></td>
							</tr>
							<!-- 팝업창 쿠폰리스트 append -->
						</table>
					</div>
					<!-- 쿠폰 팝업 페이징 -->
					<div class="paging">
						<div class="pagination inner" id='pagination' style='text-align: center;'></div>
					</div>
					<!-- 쿠폰 적용 버튼 div -->
					<div class="deleteButton" style="margin: 26px 0px 0px 322px;">
						<button type="button" id='couponCancelBtn'>취소</button>
						<button type="button" id='couponSelectBtn' style="background-color: #4366A3; color: white; border: none;">쿠폰적용</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 기프트카드 팝업 -->
	<div class="giftPop">
		<div class="window">
			<div class="popup">
				<div class="pTitle">
					<div class="seePhoto">
						<p>기프트카드 적용</p>
						<img src="../images/closebutton.png" id="close8">
					</div>
					<div class="couponList">
						<p>해당 상품에 적용 가능한 상품권 입니다. 상품권을 선택해주세요.</p>
						<div class="giftcardList">
							<!-- 기프트카드 적용안함 div -->
							<div class='giftcardSelect' id='nogift' idx='nogift'>
								<div class='giftSelectText'>
									<h2>적용안함</h2>
								</div>
							</div>
							<!-- 팝업창 기프트카드 append-->
						</div>
					</div>
					<!-- 기프트 카드 선택/취소 버튼 div -->
					<div class="deleteButton" style="margin: 26px 0px 0px 322px;">
						<button type="button" id='giftCardCancelBtn'>취소</button>
						<button type="button" id='CardSelectBtn' style="background-color: #4366A3; color: white; border: none;">선택</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 뒤로가기 버튼 팝업 -->
	<div class="exclamation">
		<div class="window">
			<div class="popup">
				<div class="deleteAlert">
					<img src="../images/Exclamation.png">
					<div class="deleteText">
						<p>
							입력하셨던 정보는 전부 삭제됩니다.<br> 
							객실선택으로 돌아가시겠습니까?
						</p>
					</div>
					<div class="deleteButton">
						<button type="button" onclick="location.href='bookerinfo'">취소하기</button>
						<button type="button" onclick="location.href='reservationhotel'" style="background-color: #C3A58A; border: none; color: whtie;">확인하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 바이룸 팝업 -->
	<div class="buyRoomPop">
		<div class="window">
			<div class="popup">
				<div class="pTitle">
					<div class="seePhoto">
						<p>바이룸 적용</p>
						<img src="../images/closebutton.png" id="close10">
					</div>
					<div class="couponList">
						<p>해당 상품에 적용 가능한 숙박권 입니다. 숙박권을 선택해주세요.</p>
						<div class="buyRoonList">
							<!-- 바이룸 선택 안함 div -->
							<div class='buyRoomSelect' id='noRoom' idx='noRoom'>
								<div class='buyRoomSelectText'>
									<h2>적용안함</h2>
								</div>
							</div>
							<!-- 팝업창 기프트카드 -->
						</div>
					</div>

					<div class="deleteButton" style="margin: 26px 0px 0px 322px;">
						<button type="button" id='roomCardCancelBtn'>취소</button>
						<button type="button" id='RoomSelectBtn' style="background-color: #4366A3; color: white; border: none;">선택</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
 		/* 개인정보수집 전문 팝업 열고 닫기*/
	 		$(document).on('click','#n_show',function(){
	 			$('.personInfo').addClass('show');
	 			$("body").addClass("modal_open");
	 		})
	 		$(document).on('click','#close4',function(){
	 			$('.personInfo').removeClass('show');
	 			$("body").removeClass("modal_open");
	 		})
 		
	
         /* 개인정보 3자 제공 전문 팝업 열고 닫기 */
	        $(document).on('click','#m_show',function(){
	 			$('.agreetable').addClass('show');
	 			$("body").addClass("modal_open");
	 		})
	 		$(document).on('click','#close5',function(){
	 			$('.agreetable').removeClass('show');
	 			$("body").removeClass("modal_open");
	 		})
         
         
          /* 쿠폰적용 팝업 열고 닫기 */
           	$(document).on('click','#ca_show',function(){
           		//예약금액 - 바이룸 가격이 0과 같거나 포인트의 금액이 0보다 크면 쿠폰 체크박스 선택 불가 / 반대의 경우엔 선택 가능
           		if(origin_Price - selectRoomPrice == 0 || $('#user_point').text().replaceAll(",","") > 0){
           			$('input[name="check"]').prop("disabled",true);
           		} else {
           			$('input[name="check"]').prop("disabled",false);
           		}
           		
 				$('.couponApply').addClass('show');
 				$("body").addClass("modal_open");
	 		})
	 		$(document).on('click','#close7',function(){
	 			$('.couponApply').removeClass('show');
	 			$("body").removeClass("modal_open");
	 		})
 			/* 쿠폰팝업의 취소 버튼 클릭시 팝업 닫기 */
	 		$(document).on('click','#couponCancelBtn',function(){
	 			$('.couponApply').removeClass('show');
	 			$("body").removeClass("modal_open");
	 		})
	 		
 		/* 기프트카드 적용 팝업 */
	 		$(document).on('click','#gi_show',function(){
	 			$('.giftPop').addClass('show');
	 			$("body").addClass("modal_open");
	 		})
	 		$(document).on('click','#close8, #giftCardCancelBtn',function(){
	 			$('.giftPop').removeClass('show');
	 			$("body").removeClass("modal_open");
	 		}) 
			
	 		/* 바이룸 팝업 적용 */
	 		$(document).on('click','#Room_show',function(){
	 			$('.buyRoomPop').addClass('show');
	 			$("body").addClass("modal_open");
	 		})
	 		
	 		$(document).on('click','#close10',function(){
	 			$('.buyRoomPop').removeClass('show');
	 			$("body").removeClass("modal_open");
	 		})
	 		$(document).on('click','#roomCardCancelBtn',function(){
	 			$('.buyRoomPop').removeClass('show');
	 			$("body").removeClass("modal_open");
	 		})
          
    </script>

	<script>
		    $(document).ready(function() {		    	  
		        $(".phoneNumber").focus(focused); //input에 focus일 때
		        $(".phoneNumber").blur(blured);   //focus out일 때
		      })
			/* 휴대폰 번호에 - 추가 */
		    function focused(){
		      var input = $(".phoneNumber").val();
		      
		      //input안에서 하이픈(-) 제거
		      var phone = input.replace( /-/gi, '');
		    //number 타입으로 변경(숫자만 입력)
		      $(".phoneNumber").prop('type', 'number');
		      
		      $(".phoneNumber").val(phone);
		    }
			/* 휴대폰 번호 작성 input에 숫자만 사용 가능 */
		    function blured(){
		      var input = $(".phoneNumber").val();
		      
		      //숫자에 하이픈(-) 추가
		    var phone = chkItemPhone(input);
		      //text 타입으로 변경
		      $(".phoneNumber").prop('type', 'text');
		      
		      $(".phoneNumber").val(phone);
		    }
		
		
		    //전화번호 문자(-)
		    function chkItemPhone(temp) {
		    var number = temp.replace(/[^0-9]/g, "");
		    var phone = "";
		
		    if (number.length < 9) {
		    return number;
		    } else if (number.length < 10) {
			    phone += number.substr(0, 2);
	            phone += "-";
	            phone += number.substr(2, 3);
			    phone += "-";
			    phone += number.substr(5);
		    } else if (number.length < 11) {
			    phone += number.substr(0, 3);
			    phone += "-";
			    phone += number.substr(3, 3);
			    phone += "-";
			    phone += number.substr(6);
		    } else {
			    phone += number.substr(0, 3);
			    phone += "-";
			    phone += number.substr(3, 4);
			    phone += "-";
			    phone += number.substr(7);
		    }
		
		   	 return phone;
		    }
 
    </script>

	<script>
 		var rooms = '<%=rooms%>';
 		var type = <%=type%>;
 		var checkin = '<%=checkin%>';
 		var checkout = '<%=checkout%>';
 		var user_id = '<%=id%>';
 		var shopbaskets = '<%=shopbaskets%>';
 		var lodgementName = '<%=lodgementName%>';
 		var couponData;
 		var giftData;
 		var user_point;
 		var buyRoomData;
 		var selectRoomPrice;
 		var origin_Price;
 		var discount;
 		
		$(function() {
			var referrer =  document.referrer;
			//장바구니 페이지에서 넘어왔을때
			if(/shoppingBasket/.test(referrer)) {
				/* //객실예약 결제 정보 보여주기 */
				$.ajax({
					url : "../reservation-basic-info?shopbaskets=" + shopbaskets, // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						
						if(result.message == 'Success'){
							data = result.data;
							console.log(data);	
							
							couponData = data.coupons;
							giftData = data.giftcards;
							buyRoomData = data.buyrooms;
							origin_Price = data.origin_price;
							
							reserveInfo();
							couponHistory();
							giftCardHistory();
							buyRoomHistory();
							user_point = data.user_point;
							page();
							
							havePoint = user_point;
							selectRoomPrice = 0;
							
							$('#origin_price').text(data.origin_price.toLocaleString('en'));
							$('#payInfoPrice').text(data.origin_price.toLocaleString('en'));
							$('#shopbasket_id').text(shopbaskets);
							$('#gift_name').text(data.gift_name);
							$('#gift_type_id').text(data.gift_type_id);
							$('#userEmail').text(data.user_email);
							
							$('#hasPoint').text(data.user_point.toLocaleString('en'));
							$('#haveCoupon').text(data.coupons.length);
							
							$('#user_name').val(data.user_name);
							$('#bookerPhoneNum').val(data.user_tel);
							
							$('#bookerLastName').val(data.user_name.substring(0,1));
							$('#bookerFirstName').val(data.user_name.substring(1,5));
							
							$('#haveRoom').text(buyRoomData.length);						
							TotalCalc();	
						    
							var email = data.user_email.split("@");
							
							$('#bookerEmailAccount').val(email[0])
							$('#bookerEmailDomain').val(email[1])
							
							discount = $('#discount2').val();
							return false;
						} else if(result.message == 'Fail'){
							alert("잠시후에 다시 시도해주세요.");
							return false;
						} else {
							alert("알 수 없는 에러입니다.");
							return false;
						}
						return false;					
					},
					error : function(){
						alert("검색실패options");
						return false;
					}
				})
			} else {
				//바로 결제하기로 넘어왔을때
				$.ajax({
					url : "../reservation-basic-info", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						
						if(result.message == 'Success'){
							data = result.data;
							console.log(data);	
							
							couponData = data.coupons;
							giftData = data.giftcards;
							buyRoomData = data.buyrooms;
							origin_Price = data.origin_price;
							
							console.log(giftData);
							console.log(couponData);
							
							reserveInfo();
							couponHistory();
							giftCardHistory();
							buyRoomHistory();
							user_point = data.user_point;
							page();
							
							havePoint = user_point;
							
							selectRoomPrice = 0;
							
							$('#origin_price').text(data.origin_price.toLocaleString('en'));
							$('#payInfoPrice').text(data.origin_price.toLocaleString('en'));
							$('#shopbasket_id').text(data.shopbasket_id);
							$('#gift_name').text(data.gift_name);
							$('#gift_type_id').text(data.gift_type_id);
							$('#userEmail').text(data.user_email);
							
							$('#hasPoint').text(data.user_point.toLocaleString('en'));
							$('#haveCoupon').text(data.coupons.length);
							
							$('#user_name').val(data.user_name);
							$('#bookerPhoneNum').val(data.user_tel);
							
							$('#bookerLastName').val(data.user_name.substring(0,1));
							$('#bookerFirstName').val(data.user_name.substring(1,5));
							
							$('#haveRoom').text(buyRoomData.length);
							
							TotalCalc();	
						    
							var email = data.user_email.split("@");
							
							$('#bookerEmailAccount').val(email[0])
							$('#bookerEmailDomain').val(email[1])
						
							discount = $('#discount2').val();
							
							return false;
						} else if(result.message == 'Fail'){
							alert("잠시후에 다시 시도해주세요.");
							return false;
						} else {
							alert("알 수 없는 에러입니다.");
							return false;
						}
						return false;					
					},
					error : function(){
						alert("검색실패options");
						return false;
					}
				})
			}
		})
	</script>
	<script>
	/* 쿠폰팝업 페이징 */
	function page() {	
		// ****더 중요한점 테이블 이름 적어줘야함!!
	    $('table.couponTable').each(function () {
	        var pagesu = 10;  //페이지 번호 갯수
	        var currentPage = 0;
	        var numPerPage = 10;  //목록의 수
	        var $table = $(this);
	        var pagination = $("#pagination");

	        //length로 원래 리스트의 전체길이구함
	        var numRows = $table.find('tr').length;

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
	            $table.find('tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
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
	            $('<span class="pageNum back" id="pageArr1"><img src="../images/arr4.png"></span>').bind('click', { newPage: page }, function (event) {
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
	            $('<span class="pageNum next" id="pageArr2"><img src="../images/arr3.png"></span>').bind('click', { newPage: page }, function (event) {
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

	<script type="text/javascript">
		/* 결제모듈 관련 함수 */
		function reserveInfo() {
			$('#lodgementName').text(data.lodgement_name);
			$('#roomName').text(data.room_name);
			
			if (type == 0) {
				$('#totalPrice').text(data.lodge_price + "원");
				
				if (checkin == "null" || checkout == "null") {
					checkin = '<%=todayString%>';
					checkout = '<%=tomorrowString%>';
				}
			} else if (type == 1){
				$('#totalPrice').text(data.rent_price + "원");
				
				if (checkin == "null" || checkout == "null") {
					checkin = '<%=todayString%>';
				}
				
				checkout = checkin;
			}
			
			$('#checkinDate').text(checkin);
			$('#checkoutDate').text(checkout);
		}
	
	</script>

	<script type="text/javascript">
		/* function plus(i) {
			var count = parseInt($('#optionCount' + i).text());
			var price = parseInt($('#optionPrice' + i).text());
			var totalPrice = parseInt($('#totalPrice').text().replace("원", ""));
			
			$('#optionCount' + i).text(count+1);
			$('#totalPrice').text(totalPrice + price + "원");
		}
		
		function minus(i) {
			var count = parseInt($('#optionCount' + i).text());
			
			if (count != 0) {
				var price = parseInt($('#optionPrice' + i).text());
				var totalPrice = parseInt($('#totalPrice').text().replace("원", ""));
				
				$('#optionCount' + i).text(count-1);
				$('#totalPrice').text(totalPrice - price + "원");
			}
		} */
	</script>

	<script type="text/javascript">
		/* 결제방법 카드결제 선택했을때 */
		function Card() {
			document.querySelector("#card").className = "paybutton payMethod";
			document.querySelector("#directbank").className = "paybutton";
			
			$('#gopaymethod').val("Card");
		}
		/* 결제방법 계좌이체 선택했을때 */
		function DirectBank() {
			document.querySelector("#card").className = "paybutton";
			document.querySelector("#directbank").className = "paybutton payMethod";
			
			$('#gopaymethod').val("DirectBank");
		}
		$(document).on('click','.paybutton',function(){
			$('.paybutton').removeClass('payMethodCSS');
			$(this).addClass('payMethodCSS');
		})
	</script>

	<script type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>

	<script type="text/javascript">
		//이메일 입력방식 선택 
		$('#booker_email_select').change(function () { 
		    $("#booker_email_select option:selected").each(function () { 
		        if ($(this).val() == '1') { 
		            //직접입력일 경우 
		            $("#bookerEmailDomain").val(''); 
		            //값 초기화 
		            $("#bookerEmailDomain").attr("disabled",false); 
		            //활성화 
		        }else{ 
		            //직접입력이 아닐경우 
		            $("#bookerEmailDomain").val($(this).text()); 
		            //선택값 입력 
		            $("#bookerEmailDomain").attr("disabled",true); 
		            //비활성화 
		        } 
		    }); 
		});
		
		$('#user_email_select').change(function () { 
		    $("#user_email_select option:selected").each(function () { 
		        if ($(this).val() == '1') { 
		            //직접입력일 경우 
		            $("#userEmailDomain").val(''); 
		            //값 초기화 
		            $("#userEmailDomain").attr("disabled",false); 
		            //활성화 
		        }else{ 
		            //직접입력이 아닐경우 
		            $("#userEmailDomain").val($(this).text()); 
		            //선택값 입력 
		            $("#userEmailDomain").attr("disabled",true); 
		            //비활성화 
		        } 
		    }); 
		});
	</script>

	<!-- 	<script type="text/javascript">
		$('#paymentButton').click(function () {
			
			$("#goodname").val($('#lodgementName').text() + "(" + $('#roomName').text() + ")");
			$("#buyername").val($('#bookerLastName').val() + $('#bookerFirstName').val());
			$("#buyertel").val('0' + $('#bookerPhoneNum').val());
			$("#buyeremail").val($('#bookerEmailAccount').val() + '@' + $('#bookerEmailDomain').val());
			$("#price").val($('#totalPrice').text().replace(",", "").replace("원", ""));
			
			
			$.ajax({
				url: "../CashCon.do", // 컨트롤러 위치
				type: "post",
				dataType: 'JSON',
				data: {
	
					price: $("#price").val(),
	
				},
				success: function(result) {
					console.log(result)
	
					var message = result.message;
					
					if (message == "Success") {
						$('#signature').val(result.signature);
						$('#oid').val(result.oid);
						$('#timestamp').val(result.timestamp);
						
						INIStdPay.pay(document.SendPayForm);
						
						return false;
					} else if (message == "Fail") {
						alert("서버 요청 실패");
						
						return false;
					}
					
					alert("서버 오류");
					return false;
				},
				error: function() {
					swal("서버 요청 실패", "연결을 다시 확인 해주세요.", "error");
					return false;
				}
			});
		});
	</script> -->
	<script>
		/* 이용자 정보의 예약자 정보와 동일합니다 체크박스 */
		$(document).on('click','#bookerCheck', function(){
			//이용자 정보와 동일한 정보를 예약자 정보 input에 넣음
			if($("input:checkbox[id=bookerCheck]").is(":checked") == true){
			
				$('#userPhoneNum').val(data.user_tel);
				$('#userLastName').val(data.user_name.substring(0,1));
				$('#userFirstName').val(data.user_name.substring(1,5));
				var email = data.user_email.split("@");
				
				$('#userEmailAccount').val(email[0]);
				$('#userEmailDomain').val(email[1]);
				//체크박스에 체크를 안했으면 빈값으로 두기
		} else if($("input:checkbox[id=bookerCheck]").is(":checked") == false){
				$('input:text[id=userPhoneNum]').val("");
				$('input:text[id=userLastName]').val("");
				$('input:text[id=userFirstName]').val("");
				$('input:text[id=userEmailDomain]').val("");
				$('input:text[id=userEmailAccount]').val("");
			}	
		})
	</script>
	<script>
	/* 바이룸 팝업의 바이룸 data 넣기 */
	function buyRoomHistory(){
		for(var i=0; i < data.buyrooms.length; i++){
			$('.buyRoonList').append( 
				"<div class='buyRoomSelect' id='" + data.buyrooms[i].gift_id + "' idx='" + i + "'>"
         			+"<div class='buyRoomSelectImg'>"
         				+"<img src='" + data.buyrooms[i].gift_img_url + "'>"	
         			+"</div>"
         			+"<div class='buyRoomSelectText'>"
         				+"<p class='buyRoomFrom'>FROM." + data.buyrooms[i].gift_sender + "님</p>"
         				+"<h4>" + data.buyrooms[i].gift_name +"</h4>"
         				+"<p class='buyRoomMoney'>" + data.buyrooms[i].gift_price.toLocaleString('en') + "원</p>"         				
         				+"<p class='giftPeriod'>유효기간 : " + data.buyrooms[i].gift_valid_date + "</p>"
         			+"</div>"
         		+"</div>"
			);
		}
	}
	/* 바이룸 카드 선택했을때 선택했음을 보여주는 css 추가 */
	$(document).on('click','.buyRoomSelect',function(){
		$('.buyRoomSelect').removeClass('buyRoomCss')
		$(this).addClass('buyRoomCss');
	})
	
	var selectRoom;
	var havePoint;
	var checkCoupon;
	var couponPoint;
	var percentCoupon;
	var selectCard;
	var giftcardPrice;
	var minusgiftTotal;
	var selectRoomIdx;
	
	/* 바이룸 숙박권 선택했을때 가격 전달 */
	$(document).on('click','#RoomSelectBtn',function(){
		selectRoom = $('.buyRoomCss').attr('id');
		selectRoomIdx = $('.buyRoomCss').attr('idx');
		
		/* 적용안함 클릭했을때/ 아닐때  */
		if(selectRoom == "noRoom"){
			$('.buyroomName').text("적용안함");
			$('#select_buyRoom').text("적용안함");
			$('#selectBuyRoom').text("적용안함");
			selectRoomPrice = 0;
		} else{
			/* 바이룸 선택했을때 선택한 바이룸의 이름을 바이룸 사용 text에 넣기 */
			$('.buyroomName').text(buyRoomData[selectRoomIdx].gift_name);
			$('#select_buyRoom').text(buyRoomData[selectRoomIdx].gift_name);
			$('#selectBuyRoom').text(buyRoomData[selectRoomIdx].gift_name);
			selectRoomPrice = buyRoomData[selectRoomIdx].gift_price;
			
			/* 포인트 사용하고 바이룸 선택했을때 */
			if(discount != 0){
				if(origin_Price - selectRoomPrice == 0){ //예약금액 - 바이룸 사용금액이 0일때 포인트 사용 가격 0으로 변경
					document.getElementById('discount2').value = 0;
					document.getElementById("user_point").innerText = 0;
					document.getElementById("usePointPrice").innerText = 0;
				} else{ //예약금액- 바이룸 사용금액이 0이 아닐때 
					if(discount.replaceAll(",","") > origin_Price - selectRoomPrice){ //포인트 사용 금액이 예약금액 - 바이룸 사용 금액보다 클 때
						document.getElementById('discount2').value = Math.min(havePoint, origin_Price - selectRoomPrice).toLocaleString('en'); //포인트 사용 금액을 보유포인트와 예약금액 - 바이룸 사용 금액중 작은 금액으로 넣기
						document.getElementById("user_point").innerText = Math.min(havePoint, origin_Price - selectRoomPrice).toLocaleString('en');
						document.getElementById("usePointPrice").innerText = Math.min(havePoint, origin_Price - selectRoomPrice).toLocaleString('en');
					} 
				}
			}
			
			/* 쿠폰을 사용하고 바이룸 선택했을때 */
			if($('input:radio[name="check"]').is(":checked") == true && checkCoupon != "no"){ //쿠폰을 선택하고 선택한 쿠폰의 value가 no일때
				if(origin_Price - selectRoomPrice == 0){ //예약금액 - 바이룸 사용금액이 0일때 쿠폰 사용 가격 0으로 변경
					$('#useCouponPoint').text("0");
					$('#coupon_point').text("0");
					$('.discountName').text("적용안함");
					$('input:radio[value="no"]').prop("checked",true); //적용안함 체크박스로 쿠폰 체크 변동
				} else{
					if(couponData[checkCoupon].is_percent == true){ //쿠폰이 percent 쿠폰일때
						if(percentCoupon.replaceAll(",","") > origin_Price - selectRoomPrice){ //선택한 쿠폰의 가격이 예약금액 - 바이룸 가격 보다 클때 쿠폰의 가격과 예약금- 바이룸의 금액 중 작은 금액으로 넣기
							$('#coupon_point').text(Math.min(percentCoupon.replaceAll(",",""),origin_Price - selectRoomPrice).toLocaleString('en'));
							$('#useCouponPoint').text(Math.min(percentCoupon.replaceAll(",",""),origin_Price - selectRoomPrice).toLocaleString('en'));
						}	
					} else{ //쿠폰이 그냥 가격 나와있는 쿠폰일때
						if(couponPoint.replaceAll(",","") > origin_Price - selectRoomPrice){ //선택한 쿠폰의 가격이 예약금액 - 바이룸 가격 보다 클때 쿠폰의 가격과 예약금- 바이룸의 금액 중 작은 금액으로 넣기
							$('#useCouponPoint').text(Math.min(couponPoint.replaceAll(",",""),origin_Price - selectRoomPrice).toLocaleString('en'));
							$('#coupon_point').text(Math.min(couponPoint.replaceAll(",",""),origin_Price - selectRoomPrice).toLocaleString('en'));
						}
					}
				}
			}
			
			/* 기프트카드 */
			if($('.giftCardCss').length != 0 && selectCard != "nogift"){ //기프트 카드를 선택했고 선택한 기프트카드의 value가 nogift일때
				if(origin_Price - selectRoomPrice == 0){ //예약금 - 바이룸 가격이 0일때 기프트카드의 가격을 0으로 변경하고 선택했던 기프트카드를 적용안함 카드로 변경
					$('.giftDiscountName').text("적용안함");
					$('#gift_Price').text("0");
					$('#giftCardPrice').text("0");
					$('.giftcardSelect').removeClass('giftCardCss');
					$('#nogift').addClass('giftCardCss');
				} else{
					if(giftData[selectCard].giftcard_price > origin_Price - selectRoomPrice){ //선택한 기프트카드의 금액이 예약금 - 바이룸 가격보다 클때 기프트카드의 금액과 예약금 - 바이룸 가격중 작은 값으로 넣기
						$('.giftDiscountName').text(Math.min(giftData[selectCard].giftcard_price, origin_Price - selectRoomPrice).toLocaleString('en'));
						$('#gift_Price').text(Math.min(giftData[selectCard].giftcard_price, origin_Price - selectRoomPrice).toLocaleString('en'));
						$('#giftCardPrice').text(Math.min(giftData[selectCard].giftcard_price, origin_Price - selectRoomPrice).toLocaleString('en'));
					}
				}
			}
		}
		
		TotalCalc(); //총 가격계산하기
		
		$('.buyRoomPop').removeClass('show'); //바이룸 팝업 닫기
	})
		
		/* 포인트 input text에 값 넣기 */
		function printName()  {
			discount = $('#discount2').val();
			if(discount.replaceAll(",","") > havePoint){ //적어넣은 포인트가 보유포인트보다 클때
			  	alert('보유 금액 이상 사용은 불가능 합니다.');
			  	document.getElementById('discount2').value = Math.min(havePoint, origin_Price - selectRoomPrice).toLocaleString('en');
			  	document.getElementById("user_point").innerText = Math.min(havePoint, origin_Price - selectRoomPrice).toLocaleString('en');
				document.getElementById("usePointPrice").innerText = Math.min(havePoint, origin_Price - selectRoomPrice).toLocaleString('en');
			} else if(origin_Price - selectRoomPrice < discount.replaceAll(",","")){ // 적어놓은 포인트가 예약금 - 바이룸 가격보다 클때
				alert('결제할 금액 이상 포인트 사용은 불가능 합니다.');
				document.getElementById('discount2').value = Math.min(havePoint, origin_Price - selectRoomPrice).toLocaleString('en');
				document.getElementById("user_point").innerText = Math.min(havePoint, origin_Price - selectRoomPrice).toLocaleString('en');
				document.getElementById("usePointPrice").innerText = Math.min(havePoint, origin_Price - selectRoomPrice).toLocaleString('en');
			}else{ //둘 다의 경우가 아닐때 적어놓은 포인트로 적용
				document.getElementById('discount2').value = discount.toLocaleString('en');
				document.getElementById("user_point").innerText = discount.toLocaleString('en');
				document.getElementById("usePointPrice").innerText = discount.toLocaleString('en');
			}

			$('input[name="check"]').prop("disabled",true); //포인트를 사용하면 쿠폰 사용은 불가
			discount = $('#discount2').val();
			TotalCalc();	//총 결제금액 계산
		}
		
	/* 전액사용 버튼 누르면 보유포인트값 전액 반영 */
		$(document).on('click','#fullUseBtn',function(){
			discount = $('#discount2').val();
			//전액사용을 눌렀을때 보유포인트 금액이 예약금 - 바이룸 가격보다 넘지 않게 둘 중 최소값으로 넣음
			document.getElementById('discount2').value = Math.min(havePoint, origin_Price - selectRoomPrice).toLocaleString('en');
			$('#user_point').text(Math.min(havePoint, origin_Price - selectRoomPrice).toLocaleString('en'));
			$('#usePointPrice').text(Math.min(havePoint, origin_Price - selectRoomPrice).toLocaleString('en'));
			
			discount = $('#discount2').val();
			$('input[name="check"]').prop("disabled",true); //포인트 사용하면 쿠폰사용 불가
			TotalCalc();
		})
		
		/* 포인트 입력창에 숫자만 입력 */
		/* const input = document.querySelector('#discount2');
		input.addEventListener('keyup', function(e) {
		  let value = e.target.value;
		  value = Number(value.replaceAll(',', ''));
		  if(isNaN(value)) {
		    input.value = 0;
		  }else {
		    const formatValue = value.toLocaleString('ko-KR');
		    input.value = formatValue;
		  }
		}) */
		 
		/* 결제금액 계산하기 */
		function TotalCalc(){
			var originPrice = parseInt($('#origin_price').text().replaceAll(",","")); //예약금액
			var couponPrice = parseInt($('#coupon_point').text().replaceAll(",","")); //쿠폰금액
			var userPrice = parseInt($('#user_point').text().replaceAll(",","")); //포인트금액
			var giftPrice = parseInt($('#gift_Price').text().replaceAll(",","")); //기프트카드 금액
			var buyRoomPrice = parseInt(selectRoomPrice); //바이룸 금액
			
			alltotal = originPrice -buyRoomPrice - userPrice - couponPrice - giftPrice;
			minusgiftTotal = originPrice - buyRoomPrice - userPrice - couponPrice;
			
			if(giftcardPrice > minusgiftTotal){ //기프트카드 금액이 예약금액에서 기프트카드 금액을 뺀 나머지 금액들을 뺀 값보다 클 경우 총 결제금액은 0이 되고 기프트카드 금액은 minusgiftTotal이 됨
				alltotal = 0;
				$('#gift_Price').text(minusgiftTotal.toLocaleString('en'));
				$('#giftCardPrice').text(minusgiftTotal.toLocaleString('en'));
			}
			
		    $('#totalMoney').text((alltotal).toLocaleString('en'));
		    $('#AllTotalMoney').text((alltotal).toLocaleString('en'));
		    $('#payTotalPrice').text((alltotal).toLocaleString('en'));
		}
	</script>

	<script>
	/* 쿠폰 팝업에 데이터 append */
	function couponHistory(){
		for(var i=0; i < data.coupons.length; i++){
			$('.couponTable').append( 
               "<tr class='couponType' id='" + data.coupons[i].coupon_id + "'>"
               	+"<td class='radiobox' style = 'width:20%'><input type='radio' name='check' value='" + i +"'></td>"
                   +"<td style = 'width:80%'><p>" + data.coupons[i].coupon_name + "</p>"
                  +"<p id='couponPeriod'><span id='couponCharge'>" + data.coupons[i].coupon_charge.toLocaleString('en') +"</span><span class='couponPriceType'>" + data.coupons[i].is_percent + "</span></p></td>"               
               +"</tr>"
			);
		}
		/* ispercent의 true/false에 따라 퍼센트인지 원인지 구분 */
		$('.couponPriceType').each(function(i){			
			var ispercent = $(this).text();
			if(ispercent == "false"){
				$(this).text("원");
				
			} else if (ispercent == "true"){
				$(this).text('%');				
			}			
		})		
	}
	
	/* 쿠폰팝업에서 쿠폰 선택후 쿠폰적용 눌렀을때 가격변화 */
	$(document).on('click','#couponSelectBtn',function(){
		checkCoupon = $('input[name="check"]:checked').val();

		if(checkCoupon == "no"){
			$('#useCouponPoint').text("0");
			$('#coupon_point').text("0");
			$('.discountName').text("적용안함");
			/* 적용안함 눌렀을때 포인트창 사용가능 */
			$('#discount2').removeAttr('disabled');
			$('#fullUseBtn').removeAttr('disabled');
		} else {
			couponPoint = couponData[checkCoupon].coupon_charge.toLocaleString('en'); //쿠폰이 "원"일때
			percentCoupon = (parseInt(origin_Price) * (couponPoint / 100)).toLocaleString('en'); //쿠폰이 %일때 %값 적용해서 가격 구하기
			
			if(couponData[checkCoupon].is_percent == true){ //쿠폰이 %일때
				if(percentCoupon.replaceAll(",","") > origin_Price - selectRoomPrice){ //쿠폰 가격이 예약금액- 바이룸 보다 클때 둘 중 작은 값을 비교 후 적용
					$('#coupon_point').text(Math.min(percentCoupon.replaceAll(",",""),origin_Price - selectRoomPrice).toLocaleString('en'));
					$('#useCouponPoint').text(Math.min(percentCoupon.replaceAll(",",""),origin_Price - selectRoomPrice).toLocaleString('en'));
				} else{ 
					$('#coupon_point').text(percentCoupon);
					$('#useCouponPoint').text(percentCoupon);
				}
			} else{ //쿠폰이 "원"일때
				if(couponPoint.replaceAll(",","") > origin_Price - selectRoomPrice){ //쿠폰 가격이 예약금액- 바이룸 보다 클때 둘 중 작은 값을 비교 후 적용
					$('#useCouponPoint').text(Math.min(couponPoint.replaceAll(",",""),origin_Price - selectRoomPrice).toLocaleString('en'));
					$('#coupon_point').text(Math.min(couponPoint.replaceAll(",",""),origin_Price - selectRoomPrice).toLocaleString('en'));
				} else{
					$('#coupon_point').text(couponPoint);
					$('#useCouponPoint').text(couponPoint);
				}
			}

			$('.discountName').text(couponData[checkCoupon].coupon_name);
			$('#discount2').attr('disabled','disabled');
			$('#fullUseBtn').attr('disabled','disabled');	
			/* 쿠폰을 선택해서 할인 적용 받으면 포인트창 사용불가능 */
			document.getElementById('discount2').value = 0;
		  	document.getElementById("user_point").innerText = 0;
			document.getElementById("usePointPrice").innerText = 0;
		}
		
		$('.couponApply').removeClass('show');
		
		TotalCalc();
	})
	
	/* 기프트카드 팝업에 기프트카드 데이터 append */
	function giftCardHistory(){
		for(var i=0; i < data.giftcards.length; i++){
			$('.giftcardList').append( 
				"<div class='giftcardSelect' id='" + data.giftcards[i].giftcard_id + "' idx='" + i + "'>"
         			+"<div class='giftSelectImg'>"
         				+"<img src='" + data.giftcards[i].giftcard_img_url + "'>"	
         			+"</div>"
         			+"<div class='giftSelectText'>"
         				+"<p class='giftFrom'>FROM." + data.giftcards[i].sender_name + "님</p>"
         				+"<h4>" + data.giftcards[i].giftcard_name +"</h4>"
         				+"<p class='giftMoney'>" + data.giftcards[i].giftcard_price.toLocaleString('en') + "원</p>"
         				+"<p class='giftPeriod'>유효기간 : " + data.giftcards[i].valid_date + "</p>"
         			+"</div>"
         		+"</div>"
			);
		}
	}
	/* 기프트카드 선택하면 기프트카드 선택 css 추가 */
	$(document).on('click','.giftcardSelect',function(){
		$('.giftcardSelect').removeClass('giftCardCss')
		$(this).addClass('giftCardCss');
	})
	
	/* 기프트 카드 선택버튼 클릭했을때 선택한 기프트카드 가격 전달 */
	$(document).on('click','#CardSelectBtn',function(){
		selectCard = $('.giftCardCss').attr('idx');
		
		/* 적용안함 클릭했을때/ 아닐때  */
		if(selectCard == "nogift"){
			$('.giftDiscountName').text("적용안함");
			$('#gift_Price').text("0");
			$('#giftCardPrice').text("0");
		} else{
			giftcardPrice = giftData[selectCard].giftcard_price; //선택한 기프트카드 가격
			if(minusgiftTotal == 0){ //기프트카드를 뺀 나머지 금액들의 총 합이 0일때
				alert("기프트카드를 사용해 결제할 금액이 없습니다.");
				$('.giftDiscountName').text("적용안함");
				$('#gift_Price').text("0");
				$('#giftCardPrice').text("0");
				$('.giftcardSelect').removeClass('giftCardCss');
				$('#nogift').addClass('giftCardCss');
			} else if(giftData[selectCard].giftcard_price > origin_Price){ //기프트카드의 금액이 예약금액보다 클때 기프트카드의 금액과 예약금액중 최소값을 기프트금액에 대입
				$('.giftDiscountName').text(giftData[selectCard].giftcard_name);
				$('#gift_Price').text(Math.min(giftData[selectCard].giftcard_price, origin_Price).toLocaleString('en'));
				$('#giftCardPrice').text(Math.min(giftData[selectCard].giftcard_price, origin_Price).toLocaleString('en'));				
			} else if(origin_Price - selectRoomPrice < giftData[selectCard].giftcard_price){ //기프트카드의 금액이 예약금액- 바이룸 가격보다 클때 둘 중 작은 금액을 기프트카드에 대입
				$('.giftDiscountName').text(giftData[selectCard].giftcard_name);
				$('#gift_Price').text(Math.min(giftData[selectCard].giftcard_price, origin_Price - selectRoomPrice).toLocaleString('en'));
				$('#giftCardPrice').text(Math.min(giftData[selectCard].giftcard_price, origin_Price - selectRoomPrice).toLocaleString('en'));
			} else{ // 어떤 조건에도 해당하지 않으면 선택한 기프트카드의 금액을 대입
				$('.giftDiscountName').text(giftData[selectCard].giftcard_name);
				$('#gift_Price').text(giftData[selectCard].giftcard_price.toLocaleString('en'));
				$('#giftCardPrice').text(giftData[selectCard].giftcard_price.toLocaleString('en'));
			}
		}
		
		TotalCalc();
		
		$('.giftPop').removeClass('show');
	})
	</script>
	<script>
		/* 체크박스 전체 체크 클릭시 전체 체크박스 체크, 체크박스 전체 체크시 전체체크 체크박스 체크 */
		$(document).ready(function() {
			/* 전체체크 클릭시 */
			$("#allCheck").click(function() {
				if($("#allCheck").is(":checked")) $("input[name=oneCheck]").prop("checked", true);
				else $("input[name=oneCheck]").prop("checked", false);
			});
			/* 체크박스 하나 클릭시 */
			$("input[name=oneCheck]").click(function() {
				var total = $("input[name=oneCheck]").length;
				var checked = $("input[name=oneCheck]:checked").length;
				
				if(total != checked) $("#allCheck").prop("checked", false);
				else $("#allCheck").prop("checked", true); 
			});
		});
	</script>

	<script>
		/* 결제하기 버튼 클릭시 결제 기능 추가 */
		$(document).on('click','#paymentButton',function(){
			var input_check = true;
			
			$('input[type=text]').each( function(){ 
				if($(this).val().trim() == ""){ //input text값이 비어져있으면 비어져있는 곳으로 이동
					input_check = false;
					$(this).focus();
					return false;
				} 
			})  
			if(!input_check){ //input text값이 비어져있으면 
				alert("이용자 정보를 입력하세요.");
			} else if($('.payMethodCSS').length == 0) { //결제방법이 선택이 안되어 있을때
				alert("결제 방법을 선택해 주세요.");
				$('#payment_warning').show();
				$('#payment_warning').focus();
			} else if ($('#allCheck').is(":checked") == false) { //개인정보수집동의 체크가 안되어있을때
				alert("개인정보 수집 및 이용에 대한 동의를 체크해 주세요.");
				$('#allCheck').focus();
			} else { //모든것이 체크가 되었을때 결제하기 ajax 실행
				var visitorName;
				var visitorNum;
				var visitorEmail;
				var selectGiftCard;
				var selectCouponId;
				var selectCouponPrice;
				var payTotalCharge;
				var paymentMethod;
				var giftSelectPrice;
				var selectgiftRoom;
				var roomgiftPrice;
				
				visitorName = $('#userLastName').val() + $('#userFirstName').val();
				visitorNum = $('#userPhoneNum').val().replace( /-/gi, '');
				visitorEmail = $('#userEmailAccount').val() + "@" + $('#userEmailDomain').val();
				selectCouponPrice = $('#coupon_point').text().replaceAll(",","");
				
				/* 선택한 바이룸 숙박권 정보 보내기 */
				if($('.buyRoomCss').length == 0){
					selectgiftRoom = null;
					roomgiftPrice = 0;
				} else if(selectRoomIdx == "noRoom"){
					selectgiftRoom = null;
					roomgiftPrice = 0;
				} else {
					selectgiftRoom = buyRoomData[selectRoomIdx].gift_id;
					roomgiftPrice = buyRoomData[selectRoomIdx].gift_price;
				}
				
				/* 선택한 쿠폰의 정보 보내기 */
				if($('input:radio[name="check"]').is(":checked") == false){
					selectCouponId = null;
					selectCouponPrice = 0;
				} else if(checkCoupon == "no"){
					selectCouponId = null;
					selectCouponPrice = 0;
				} else{
					selectCouponId = couponData[checkCoupon].coupon_id; 
					$('#coupon_point').text().replaceAll(",","");
				}
				
				/* 선택한 기프트카드 정보 보내기 */
				if($('.giftCardCss').length == 0){
					selectGiftCard = null;
					giftSelectPrice = 0;
				} else if(selectCard == "nogift"){
					selectGiftCard = null;
					giftSelectPrice = 0;
				} else{
					selectGiftCard = giftData[selectCard].giftcard_id;
					giftSelectPrice = giftData[selectCard].giftcard_price;
				}

				payTotalCharge = $('#totalMoney').text().replaceAll(",","");
				/* 카드/계좌이체 선택후 데이터 post */
				 if(payTotalCharge == 0){
					paymentMethod = "APP";
				} else {
					if($('.payMethodCSS').attr('id') == 'card'){
						paymentMethod = "CARD";
					} else if($('.payMethodCSS').attr('id') == 'directbank'){
						paymentMethod = "BANK";
					}
				}
				
				var shopBaskets = [$('#shopbasket_id').text()];
				
				var sendData = {
					shopBaskets : shopBaskets,
					couponID : selectCouponId,
					giftcardID : selectGiftCard,
					giftID : selectgiftRoom,
					giftCharge: roomgiftPrice,
					paymentCharge: payTotalCharge,
					couponCharge : $('#coupon_point').text().replaceAll(",",""),
					pointCharge : $('#user_point').text().replaceAll(",",""),
					giftcardCharge : giftSelectPrice,
					paymentMethod : paymentMethod,
					bookerInfo : {
						name : $('#user_name').val(),
						tel : $('#bookerPhoneNum').val().replace( /-/gi, ''),
						email : $('#userEmail').text(),
					},
					lodgeUserInfo : {
						name : visitorName,
						tel : visitorNum,
						email : visitorEmail,
					},
				 }
				
				  console.log(sendData);
				/* 결제내역 보내는 함수 */
				 $.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "../v2/reservations", // 컨트롤러 위치
					// get, post
					// get은 쿼리스트링 방식
					// post 숨겨서 보내야 되므로 ajax안에 data: {}
					 type : "POST",
					 async : false,
					 beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        }, 
					 data : JSON.stringify(sendData),
					//dataType : response 어떤 타입으로 받을지
					dataType : 'JSON',
					success : function(result){
						
						console.log(result);
						
						if(result.message == 'Success'){
							
							var oid = result.OID;
							
							if (paymentMethod == 'app') {
								setAppPayment(oid);
							} else {
								setPaymentInfo(oid, payTotalCharge);
							}

							// 결제모듈 설치 후에는 결제모듈에서 리턴해주는 값 담기
							/* var payment_state = true;
							var payment_message = null; */
							/* var tid = result.TID;
							if(typeof tid == "undefined" || tid == ""){
								tid = "null";
							}	
							paymentInformantion(oid, payment_state, payment_message, payTotalCharge, tid); */
							
							return false;
						} else if(result.message == 'Fail'){
							alert("잠시후에 다시 시도해주세요.");
							return false;
						} else {
							alert("알 수 없는 에러입니다.");
							return false;
						}
						return false;					
					},
					error : function(){
						alert("검색실패");
						return false;
					}
				})
			}
		})
		
		
		function setPaymentInfo(oid, price) {
			
			$("#goodname").val(lodgementName);
			$("#buyername").val($('#bookerLastName').val() + $('#bookerFirstName').val());
			$("#buyertel").val($('#bookerPhoneNum').val());
			$("#buyeremail").val($('#bookerEmailAccount').val() + '@' + $('#bookerEmailDomain').val());
			$("#price").val(price);
			
			
			$.ajax({
				url: "../PaymentSignatureCon.Webdo", // 컨트롤러 위치
				type: "post",
				dataType: 'JSON',
				data: {
					price: price,
					oid : oid
				},
				success: function(result) {
					console.log(result)
	
					var message = result.message;
					
					if (message == "Success") {
						$('#signature').val(result.signature);
						$('#oid').val(result.oid);
						$('#timestamp').val(result.timestamp);
						
						INIStdPay.pay(document.SendPayForm);
						
						return false;
					} else if (message == "Fail") {
						alert("서버 요청 실패");
						
						return false;
					}
					
					return false;
				},
				error: function() {
					swal("서버 요청 실패", "연결을 다시 확인 해주세요.", "error");
					return false;
				}
			});
		}
		
		function setAppPayment(oid) {			
			
			$.ajax({
				url: "../AppPaymentCon.Webdo", // 컨트롤러 위치
				type: "post",
				dataType: 'text',
				data: {
					oid : oid
				},
				success: function(result) {
					console.log(result)
					
					if (result == "Success") {
						location.href = 'complete.jsp';
						
						return false;
					} else if (result == "Fail") {
						alert("서버 요청 실패");
						
						return false;
					}
					
					return false;
				},
				error: function() {
					alert("서버 요청 실패");
					return false;
				}
			});
		}
		
		// 결제 정보를 세션에 담는 함수
		function paymentInformantion(OID, payment_state, payment_message, payTotalCharge, TID) {
			$.ajax({
				//contentType: "application/json; charset=utf-8",
				url : "../PaymentInfomationCon.do", // 컨트롤러 위치
				type : "POST",
				data : {
					OID: OID,
					payment_state : payment_state,
					payment_message : payment_message,
					payTotalCharge : payTotalCharge,
					TID : TID
				},
				//dataType : response 어떤 타입으로 받을지
				dataType : 'text',
				success : function(result){
					
					console.log(result);
					
					if(result == 'Success'){
						/* location.href = 'complete'; */
						return false;
					} else {
						alert("세션 등록 실패!!");
						return false;
					}
					return false;					
				},
				error : function(){
					alert("세션 등록 에러@@");
					return false;
				}
			})
		}
	// 포인트 인풋에 숫자만 입력
	$(document).on('input', '#discount2', function() {
		if ($(this).val() != null && $(this).val() != '') {
			var tmps = parseInt($(this).val().replace(/[^0-9]/g, '')) || '0';
			var tmps2 = tmps.toString().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1,');
			$(this).val(tmps2);
		} else {
			$(this).val(0);
		}
		// 빈값일때 0으로
	});
		
	/* $(document).on('input', '#userPhoneNum', function() {
		this.value = this.value.replaceAll(/\D/g, "");
	}) */
	
	</script>

</body>
</html>