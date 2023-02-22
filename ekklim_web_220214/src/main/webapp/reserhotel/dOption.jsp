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
	String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성

	String oid					= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)
	String price				= "1000";													// 상품가격(특수기호 제외, 가맹점에서 직접 설정)

	String cardNoInterestQuota	= "11-2:3:,34-5:12,14-6:12:24,12-12:36,06-9:12,01-3:4";		// 카드 무이자 여부 설정(가맹점에서 직접 설정)
	String cardQuotaBase		= "2:3:4:5:6:11:12:24:36";		// 가맹점에서 사용할 할부 개월수 설정

	//###############################################
	// 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
	//###############################################
	String mKey = SignatureUtil.hash(signKey, "SHA-256");
	
	//###############################################
	// 2.signature 생성
	//###############################################
	Map<String, String> signParam = new HashMap<String, String>();

	signParam.put("oid", oid); 					// 필수
	signParam.put("price", price);				// 필수
	signParam.put("timestamp", timestamp);		// 필수

	// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
	String signature = SignatureUtil.makeSignature(signParam);
	
	
	/* 기타 */
	String siteDomain = "https://www.buyinhotel.co.kr/reserhotel/stdpay"; //가맹점 도메인 입력
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
	max-width: 800px;
	margin-left: 46px;
	padding-top: 30px;
	
}

.content{
	padding-bottom: 0px; 
}

.content{
	background-color: #F5F5F5;
}

.backcolor{
	width: 1332px;
	background-color: white;
	height: 100%;
	min-height: 758px;
	padding-bottom: 172px;
	
}

.location {
	width: 850px;
	line-height: 40px;
}

.payment{
	margin-top: 24px;
}

.location span {
	font-family: NanumSquare_ac;
	font-size: 18px;
	color: #434343;
}

aside {
	float: right;
	width: 360px;
	margin-top: 34px;
	margin-right: 14px;
}

.reservation_info{
	position: fixed;
}

.reservation_info h4 {
	width: 340px;
	line-height: 50px;
	font-size: 28px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.rinfo_table td {
	margin: 0px;
	padding: 13px;
	border-bottom: 1px solid rgb(138,138,138,0.5);
}

.rinfo_table td:last-child {
	border-bottom: none;
}

.info_txt td {
	width: 202px;
	text-align: right;
	font-size: 16px;
	color: #242424;
	font-family: malgun;
	text-align: right;
}

.riTable {
	border: 1px solid rgb(112,112,112,0.5);
	border-radius: 10px;
	margin: 20px auto;
	width: 340px;
	background: white;
}

.priceTable{
	width: 100%;
}

.priceTable tr{
	width: 50%;
}

.priceTable td{
	border-bottom: none;
	padding: 8px;
}

.priceTable tr:first-child td{
	text-align: left;
}

.priceTable tr:last-child td{
	text-align: right;
}

.priceTable td:last-child{
	border-top: 1px solid #8A8A8A;
	font-size: 22px;
	font-weight: bold; 
	margin: 6px auto;
}
hr {
	border: 1px solid #8A8A8A;
}

.title_txt td {
	font-size: 16px;
	font-weight: bold;
	color: #242424;
	font-family: malgun;
}

.title_txt {
	margin-left: 9px;
}
/* 
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
} */

.rinfo_table button {
	width: 172px;
	border: 2px solid #4366A3;
	background-color: white;
	color: #4366A3;
	font-size: 18px;
	font-family: NanumSquare_ac;
	height: 48px;
	border-radius: 10px;
	cursor: pointer;
}

.voucher table thead tr {
	display: flex;
	background: #F9F9F9;
}

.voucher table thead tr th {
	width: 174px;
	border-bottom: 1px solid rgb(112, 112, 112, 0.5);
	margin: 0;
	padding: 20px;
	text-align: center;
	font-size: 16px;
	font-family: malgun;
	color: #242424;
	font-weight: bold;
	height: 6px;
	line-height: 6px;
}

.voucher table tbody tr td {
	width: 174px;
	margin: 0;
	padding: 20px;
	text-align: center;
	font-size: 15px;
	color: #242424;
	font-family: malgun;
	height: 16px;
	border-bottom: 1px solid #A4A4A4;
}

.voucher table tbody tr td:last-child{
	border-bottom: none;
}

.voucher table {
	border: 1px solid rgb(112, 112, 112, 0.5);
	border-collapse: separate;
	margin: 5px auto;
	border-radius: 8px;
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
	line-height: 50px;
	margin-bottom: 30px;
}


.bookerinfo h4 label {
	margin-left: 20px;
	font-size: 16px;
	font-weight: normal;
	font-family: malgun;
	color: #242424;
}


.paybutton{
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
 .personInfo, .agreetable,  .couponApply, .exclamation, .giftPop {
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

.exclamation.show >.window> .popup {
	width: 530px;
	padding-bottom: 22px;
}

#close4, #close5 ,#close7, #close8 {
	float: right;
	width: 40px;
	height: 40px;
	margin: -44px 12px 0px 0px;
}

.deleteAlert{
    text-align: center;
    }
.deleteAlert img{
     width: 86px;
     height: 86px;
     margin-top: 22px;
 }   

 .deleteText{
 	margin: 20px auto;
     line-height: 33px;
     font-size: 24px;
     color: #707070;
     font-family: NanumSquare_ac;
     font-weight: bold;
 }

 .deleteButton button{
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

.voucherTitle{
	font-size: 16px;
	font-family: malgun;
	font-weight: bold;
	color: #242424;
	margin: 16px auto;
}

.optionCount input{
	margin: 0px;
	background-color: white;
	width: 32px;
	height: 28px;
	border: 1px solid #707070;
	float: left;
}

.result{
	float: left;
	width: 34px;
	border: 1px solid  #707070;
	height: 26px;
	line-height: 26px;
}

.chooseImg td{
	cursor: pointer;
}


.option> .time h4 {
	font-size: 28px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #242424;
	border-bottom: 3px solid #8A8A8A;
	line-height: 50px;
	margin-bottom: 30px;
}

.option table td select{
	width: 128px;
	height: 28px;
	font-size: 13px;
	font-family: malgun;
	margin-top: -5px;
	
}
.chooseImg img{
	margin-left: 8px;
}

.chooseImg td{
	cursor: pointer;
}
.SaveBasket{
	width: 342px;
	height: 48px;
	background-color: white;
	border: 1px solid #242424;
	border-radius: 12px;
	margin-top: 14px;
	display: none;
}

.SaveBasket p{
	font-size: 14px;
	font-family: NanumSquare_ac;
	color: #242424;
	line-height: 48px;
	margin-left: 20px;
}

.SaveBasket p span{
	color: #4366A3;
	float: right;
	margin-right: 17px;
	cursor: pointer;
}

.SaveBasket p span img{
	margin-left: 5px;
	height: 12px;
}
.clicked{
	background:#4366A3; 
	color: white;
}

.timetable{
	display: flex;
	flex-wrap: wrap;
	width: 816px;
}
.checked{
	background:#4366A3; 
	color: white;
}
.notChecked {
    background-color: gray;
    color: darkgray;
    border-color: gray;
}


</style>

</head>
<body>
<%
	String rooms = request.getParameter("room"); 
	
	String type = request.getParameter("type");
	String checkin = request.getParameter("checkin");
	String checkout = request.getParameter("checkout");
	
	Calendar today = Calendar.getInstance();
	String todayString = String.format("%d-%d-%d", today.get(Calendar.YEAR), today.get(Calendar.MONTH) + 1, today.get(Calendar.DATE));
	
	Calendar tomorrow = Calendar.getInstance();
	tomorrow.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH), today.get(Calendar.DATE) + 1);
	String tomorrowString = String.format("%d-%d-%d", tomorrow.get(Calendar.YEAR), tomorrow.get(Calendar.MONTH) + 1, tomorrow.get(Calendar.DATE));
%>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<!-- 예약정보 사이드바 -->
			<div class="backcolor">
		<aside>
			<div class="reservation_info">
				<!-- 예약정보 사이드 바 div -->
				<h4>예약 정보</h4>
				<div class="rinfo_table">
					<!-- <table class="riTable">
						<tr class="title_txt">
							<td>숙소명</td>
							<td>객실타입</td>
							<td>체크인</td>
							<td>체크아웃</td>
							<td>객실가격</td>
							
						</tr>
						<tr class="info_txt">
							<td id="lodgementName">이끌림호텔 신안점</td>
							<td id="roomName">스탠다드 더블</td>
							<td id="checkinDate">2022.01.01 토요일 15:00</td>
							<td id="checkoutDate">2022.01.01 토요일 18:00</td>
							<td id="room_price">20,000원</td>
							
						</tr>
					</table> -->
					<hr>
					<!-- 총금액 안내 -->
					<div class="price_txt">
						<!-- <p>총금액</p>
						<span id="totalPrice">41,000원</span> -->
						<table class="priceTable">
							<tr>
								<td>객실금액</td>
								<td>객실 옵션</td>
								<td>어메니티 옵션</td>
								<td>총 금액</td>
							</tr>
							<tr>
								<td id = 'room_price'></td>
								<td id='roomoption_total'>0원</td>
								<td id='amenity_total'>0원</td>
								<td id = 'total_price' ></td>
							</tr>
						</table>
					</div>
					<!-- 장바구니/결제하기 버튼 div -->
					<button type="button" class='basketButton'>장바구니 담기</button>
					<button type="button" class='payRightBtn' onclick="location.href='bookerinfo'" style="background-color: #4366A3; color: white;">바로 결제하기</button>
					<!-- 장바구니에 담았을경우 알림 팝업 div -->
					<div class="SaveBasket">
						<p>장바구니에 담았습니다. <span onclick="location.href='../mypage/shoppingBasket'">장바구니 바로가기<img src="../images/icon/bluearr.png"></span></p>
					</div>
				</div>
			</div>
		</aside>
			<!-- 예약정보 사이드 바 끝 -->
			
			<!-- 예약 정보 입력 부분 -->
			<div class="booker_info">
				<div class="location">
					<span >호텔/객실선택 ></span> <span style="font-weight: bold; color: #4366A3;"> 옵션선택 </span><span>> 결제하기 </span> <span>> 결제완료</span>
				</div>
			<!-- 옵션 부분 -->
				<div class="payment">
					<div class="option">
						<h4>객실 옵션 선택</h4>
						<!-- 숙박권 옵션 -->
							<div class="time">
								<div class="timeoption">
									<p class="voucherTitle">이용시간 선택</p>
									<!-- 이용시간 div -->
									<div class="timetable">
										<div class="timebutton">
								            <div>11:00</div>
								        </div>
								        <div class="timebutton">
								            <div>11:30</div>
								        </div>
								        <div class="timebutton">
								            <div>12:00</div>
								        </div>
								        <div class="timebutton">
								            <div>12:30</div>
								        </div>
								        <div class="timebutton">
								            <div>13:00</div>
								        </div>
								        <div class="timebutton">
								            <div>13:30</div>
								        </div>
								        <div class="timebutton">
								            <div>14:00</div>
								        </div>
								        <div class="timebutton">
								            <div>14:30</div>
								        </div>
								        <div class="timebutton">
								            <div>15:00</div>
								        </div>
								        <div class="timebutton">
								            <div>15:30</div>
								        </div>
								        <div class="timebutton">
								            <div>16:00</div>
								        </div>
								        <div class="timebutton">
								            <div>16:30</div>
								        </div>
								        <div class="timebutton">
								            <div>17:00</div>
								        </div>
								        <div class="timebutton">
								            <div>17:30</div>
								        </div>
								        <div class="timebutton">
								            <div>18:00</div>
								        </div>
								        <div class="timebutton">
								            <div>18:30</div>
								        </div>
								        <div class="timebutton">
								            <div>19:00</div>
								        </div>
								        <div class="timebutton">
								            <div>19:30</div>
								        </div>
								        <div class="timebutton">
								            <div>20:00</div>
								        </div>
								        <div class="timebutton">
								            <div>20:30</div>
								        </div>
								        <div class="timebutton">
								            <div>21:00</div>
								        </div>
								        <div class="timebutton">
								            <div>21:30</div>
								        </div>
								        <div class="timebutton">
								            <div>22:00</div>
								        </div>
								        <div class="timebutton">
								            <div>22:30</div>
								        </div>
								        <div class="timebutton">
								            <div>23:00</div>
								        </div>
								        <div class="timebutton">
								            <div>23:30</div>
								        </div>
								        <div class="timebutton">
								            <div>24:00</div>
								        </div>
									</div>			
								</div>
									
					<!-- 객실옵션 -->
					<div class="voucher" id='vocherRoom'>
						<p class="voucherTitle">객실 옵션</p>
						<table>
							<thead>
								<tr>
									<th>항목</th>
									<th>단가</th>
									<th>수량</th>
									<th>금액</th>
								</tr>
							</thead>
							<tbody>
								<tr id = 'option_list'>
									<!-- <td>침구류 추가</td> -->
								</tr>
								<tr id = 'option_price'>
									<!-- <td>10,000원</td> -->
								</tr>
								<tr id = 'option_qty'>
									<!-- <td class="optionCount">
										<input type="button" value="+" name="add" onclick='count("plus")' style="border-top-left-radius: 4px; border-bottom-left-radius: 4px; margin-left: 36px;">
										<div id='result'>0</div>
										<input type="button" value="-" name="minus" onclick='count("minus")' style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;">
									</td> -->
								</tr>
								<tr id = 'option_total_price'>
									<!-- <td>0원</td> -->
								</tr>
							</tbody>

						</table>
					</div>
						<!-- 어메니티 옵션 -->
						<div class="voucher" id='voucherAmenity'>
							<p class="voucherTitle">어메니티 옵션</p>
							<table>
								<thead>
									<tr>
										<th>항목</th>
										<th>종류</th>
										<th>선택</th>
										<th>금액</th>
									</tr>
								</thead>
								<tbody>
									<tr id = 'amenity_name'>
										<!-- <td id = "amenity1_name">생수</td> -->
									</tr>
									<tr id = 'amenity_sort'>
										<!-- <td>-</td> -->
									</tr>
									<tr class="chooseImg" id = 'amenity_select'>
										<!-- <td>
											<select name='Amenities' id = "amenity1">
												  <option selected disabled>선택하기</option>
											</select>
											<img src="../images/passmini.png">
										</td> -->
									</tr>
									<tr id = 'amenity_price'>
										<!-- <td>0원</td>-->
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				</div>
			</div>
					<!-- 예약자 정보 입력 부분 -->
					
	<!-- 뒤로가기 버튼 팝업 -->
	 <div class="exclamation">
	    <div class="window">
	        <div class="popup">
	            <div class="deleteAlert">
	                <img src="../images/Exclamation.png">
	                <div class="deleteText">
	                    <p>입력하셨던 정보는 전부 삭제됩니다.<br>
	                    객실선택으로 돌아가시겠습니까?</p>
	                </div>
	                <div class="deleteButton">
	                    <button type="button" onclick="location.href='bookerinfo'">취소하기</button>
	                    <button type="button" onclick="location.href='reservationhotel'" style="background-color: #C3A58A; border: none; color: whtie;">확인하기</button>
	                </div>
	            </div>
	        </div>
	      </div>
	</div>
	</div>
		<%@include file="../footer.jsp"%>
	</div>
	</div>
	
	
	    
    <script>
	// 1. if sequence true이면 date_list의 0번쨰에 첫번째 클릭한 값을 넣어주세요
	// 2. if sequence false이면 date_list의 1번쨰에 첫번째 클릭한 값을 넣어주세요
	// 3. false가 되었을때 0번째와 1번쨰값을 비교 해 주세요.
	// 4. 만약 0번째 값이 더 크면 두값의 위치를 바꿔주세요.
	// 5. 두 사이의 값을 모두 선택해주세요
     var sequence = true;
     var date_list = [];
     
		/* 이용시간 div클릭했을때 */
        $(document).on('click', '.timebutton', function() {
            if($(this).hasClass("notChecked")){
                // 아무런 이벤트 없음
            } else {
                if(sequence == true) {
                    $('.timebutton').removeClass("checked");
                    $('.timebutton').removeClass("notChecked");
                    
                    $(this).addClass("checked");
                    date_list[0] = $(this).children().eq(0).text();
                    
                    // 현재 선택된 시간으로부터 4시간
                    var limit_hours = (parseInt(date_list[0].split(":")[0])+parseInt(rent_period)) + ":" + date_list[0].split(":")[1];
                    $('.timebutton').each(function() {
                        if(limit_hours < $(this).children().eq(0).text()){
                            $(this).addClass("notChecked")
                        }
                        if(date_list[0] > $(this).children().eq(0).text()){
                            $(this).addClass("notChecked")
                        }
                    })
                    sequence = false;
                } else if (sequence == false) {
                
                    $(this).addClass("checked");
                    date_list[1] = $(this).children().eq(0).text();
                    console.log(date_list);
                    
                    
                    // date_list[0] 보다 date_list[1] 크면 순서 변경
                    /* if(date_list[0] > date_list[1]) {
                        var temp;
                        temp = date_list[0];
                        date_list[0] = date_list[1];
                        date_list[1] = temp;
                    } else */ 

                    if(date_list[0] == date_list[1]) {	//첫번째로 선택한 값과 두번째로 선택한 값이 같을때 checked css 삭제
                        $(this).removeClass('checked');
                        $('.timebutton').removeClass("notChecked");
                        sequence = true;
                    }
                    // 첫번째 선택값과 마지막 선택값 사이의 값들 checked class 추가
                    $('.timebutton').each(function() {
                        if(date_list[0] < $(this).children().eq(0).text() && $(this).children().eq(0).text() < date_list[1]) {
                            $(this).addClass('checked');
                        }
                    })
                    sequence = true;
                }
            }
        })
    	
 
    
    
    function TotalPrice(){ 
	   	 var all_total_price = 0;
	   	 var roomprice = parseInt($('#room_price').text().replace("원", "").replaceAll(",", ""));
	   	 var roomOptionprice = parseInt($('#roomoption_total').text().replace("원", "").replaceAll(",", ""));
	   	 var amenityOptionprice = parseInt($('#amenity_total').text().replace("원", "").replaceAll(",", ""));
	   	 
	   	 all_total_price = roomprice + roomOptionprice + amenityOptionprice;
	   	 
	   		/* if(all_total_price < 0){ 
   				all_total_price = 0;
   			} */
	   	
	   		$('#total_price').text((all_total_price).toLocaleString('en') + "원");
	    }
	    
	    
    /* 어메니티 옵션들의 가격 더하기 */
    function amenityOptionTotal(){
    	
		var amenityTotalPrice = 0;
	   	 
	   	 $('.amenitiesPrice').each( function(i){
	   		 amenityTotalPrice += parseInt($(this).text().replace("원", "").replaceAll(",", ""));
	   		 })
	   	 
	   	 $('#amenity_total').text((amenityTotalPrice).toLocaleString('en') + "원");
	   	 }
	    
    /* 객실옵션들의 가격 더하기 */
    function roomOptionTotal() {
   	 
   	 var total_price = 0;
   	 
   	 $('.optionTotalPrice').each( function(i){
   		 total_price += parseInt($(this).text().replace("원", "").replaceAll(",", ""));
   	 	})
   		 
   	 $('#roomoption_total').text((total_price).toLocaleString('en') + "원");
  	 
 	  }
	/* 선택한 옵션 수량만큼의 가격 구하기 */
    function roomOptionspay(type) {
   	 
	   	 var payIdx = $(type).parent().attr('id');
	   	 payIdx = payIdx.replace("optionCount", "");
	   	 
	   	 var price = parseInt($('#optionPrices'+payIdx).attr('cost'));
	   	 var optionCount = parseInt($('#result'+payIdx).text());
	   	 
	   	 $('#option_total_price'+payIdx).text((price*optionCount).toLocaleString('en') + "원");
	   	 
   	 
    }
	/* 선택한 어메니티들의 가격 더하기 */
    function roomOptionTotal() {
   	 
   	 var total_price = 0;
   	 
   	 $('.optionTotalPrice').each( function(i){
   		 total_price += parseInt($(this).text().replace("원", "").replaceAll(",", ""));
   	 })
   	 
   	 $('#roomoption_total').text((total_price).toLocaleString('en') + "원");
   	 
    }
    
	/* 객실옵션 + */
	 function plusCnt(type)  {
   	 		 // 결과를 표시할 element
	        // 현재 화면에 표시된 값
	        // 더하기/빼기
      	  var number = $(type).prev().text();
          number = parseInt(number) + 1;
          $(type).prev().text(number);
	       
	      var idx = type;
          roomOptionspay(idx);
          roomOptionTotal();
          TotalPrice();
    }
    
    /* 객실옵션 - */
    function minusCnt(type)  {
    	var number = $(type).next().text();
	       number = parseInt(number) - 1;
		       
	       if (number < 0) {
	      		number = 0;
	       }
	       
	       $(type).next().text(number);
	       roomOptionspay(type);
	       roomOptionTotal();
	       TotalPrice();
   }	


    </script>
    
     <script>
 		<%-- var rooms = '<%=rooms%>';
 		var type = <%=type%>;
 		var checkin = '<%=checkin%>';
 		var checkout = '<%=checkout%>';
 		
 		var data = {"room_price":35000,
				"rent_period":4,
				"rent_begin":"10:00",
				"room_options":
					[{"option_count":0,"option_price":2000,"option_id":1,"option_name":"침구 추가"},
					{"option_count":0,"option_price":10000,"option_id":2,"option_name":"인원 추가"}],
				"amenities":
					[{"amenity_id":1,
					"amenity_options":
						[{"amenity_option_price":0,"amenity_option_id":1,"is_selected":"true","amenity_option_name":"굵은모"},
					{"amenity_option_price":500,"amenity_option_id":2,"is_selected":"false","amenity_option_name":"미세모"}],
					"amenity_name":"칫솔"},
					{"amenity_id":2,
					"amenity_options":
						[{"amenity_option_price":0,"amenity_option_id":3,"is_selected":"true","amenity_option_name":"여행용"},
				{"amenity_option_price":1000,"amenity_option_id":4,"is_selected":"false","amenity_option_name":"2080"}],
					"amenity_name":"치약"},
					{"amenity_id":3,
					"amenity_options":
						[{"amenity_option_price":0,"amenity_option_id":5,"is_selected":"true","amenity_option_name":"삼다수"},
				{"amenity_option_price":2000,"amenity_option_id":6,"is_selected":"false","amenity_option_name":"에비앙"},
				{"amenity_option_price":500,"amenity_option_id":7,"is_selected":"false","amenity_option_name":"백산수"}],
					"amenity_name":"생수"}]};
		
		console.log(data); --%>
		
		var rent_period = 0;
		
		/* 객실옵션의 append 함수 */
		function options(){
			$('#room_price').text(data.room_price.toLocaleString('en') + "원");
			$('#rent_period').text(data.rent_period);
			$('#rent_begin').text(data.rent_begin);
			$('#total_price').text(data.room_price.toLocaleString('en') + "원");
			
			rent_period = data.rent_period;
			
			if(data.room_options.length == 0){ //객실옵션 data가 없으면 객실옵션 div 삭제
				$('#vocherRoom').remove();
			} else{
				/* 객실옵션 data append */
				for(var i = 0; i < data.room_options.length; i++) {
					
					$('#option_list').append(
						"<td id='optionNames" + i + "'>" + data.room_options[i].option_name + "</td>"
					)
					
					$('#option_price').append(
						"<td id='optionPrices" + i + "' cost = '" + data.room_options[i].option_price + "'>" + data.room_options[i].option_price.toLocaleString('en') + "원</td>"
					)
					$('#option_qty').append(
						"<td class='optionCount' id = 'optionCount" + i + "'>"
			        		+ "<input type='button' value='-' name='minus' onclick = 'minusCnt(this)' style='border-top-left-radius: 4px; border-bottom-left-radius: 4px; margin-left: 36px;''>"
								+ "<div class = 'result' id='result"+ i +"'>"+ data.room_options[i].option_count +"</div>"
							+ "<input type='button' value='+' name='add' onclick = 'plusCnt(this)' style='border-top-right-radius: 4px; border-bottom-right-radius: 4px;'>"
						+"</td>" 
					)
					
					$('#option_total_price').append(
							"<td id='option_total_price" + i + "' class = 'optionTotalPrice'>0원</td>"			
					);
				}
			}
			
			/* 어메니티 data가 없을때 어메니티 옵션 div 삭제 */
			if(data.amenities.length == 0){
				$('#voucherAmenity').remove();
			} else{
				/* 어메니티 append */
				for(var i = 0; i < data.amenities.length; i++){
					$('#amenity_name').append(
						"<td>" + data.amenities[i].amenity_name + "</td>"
					)
					
					$('#amenity_sort').append(
						"<td class='amenitySort' id='amenitiesResult" + i + "'>" + "--" + "</td>"
					)
					$('#amenity_price').append(
						"<td id='amenitiesPrices" + i + "' class='amenitiesPrice'>0원</td>"		
					);
					
					$('#amenity_select').append(
						"<td>"
							+ "<select name='Amenities' id = 'amenity"+i+"' onchange='handleOnChange(this)'>"	
							+"</select>"
						+"</td>"
					)
					/* 어메니티 옵션 select append */
					for(var j =0; j < data.amenities[i].amenity_options.length; j++){
						$('#amenity'+i).append(
							"<option cost='" + data.amenities[i].amenity_options[j].amenity_option_price + "' value=" +parseInt(data.amenities[i].amenity_options[j].amenity_option_price).toLocaleString('en') + "원 sel = '"+data.amenities[i].amenity_options[j].is_selected+"' id = 'amenity_options" + i + "_" + j + "' idx='" + data.amenities[i].amenity_options[j].amenity_option_id + "'>" 
							+ data.amenities[i].amenity_options[j].amenity_option_name + "</option>"
						)
						
						if ($('#amenity_options'+ i + "_" + j).attr('sel') == "true") {
								$('#amenity_options'+ i + "_" + j).attr("selected","selected");
								$('#amenitiesResult'+i).text(data.amenities[i].amenity_options[j].amenity_option_name);
								$('#amenitiesPrices'+i).text(data.amenities[i].amenity_options[j].amenity_option_price.toLocaleString('en') + "원");
						}
					}
				}
			}
			
			//이용시간 버튼의 첫번째 text 값이 rent_begin보다 작을때 timebutton을 숨기기
			$('.timebutton').each(function() {
				if(data.rent_begin > $(this).children().eq(0).text()){
	                $(this).hide();
	            }
				//rent_begin> rent_end 이거는 24까지만 나오게 
				//반대의 경우에는 rent_end의 시간보다 큰 애는 숨기기
				
	            if(timeString > $(this).children().eq(0).text()){
	                 $(this).hide();
	            }
				
				if(data.rent_begin < data.rent_end){
					if(data.rent_end < $(this).children().eq(0).text()){
		                $(this).hide();
		            }
				} else if(data.rent_begin > data.rent_end){
					
				}
				
			})
		}
		
		//어메니티 옵션 select option 값이 변할때 선택한 옵션값이 출력되게 하기
		function handleOnChange(amenity_option_list) {
			  // 선택된 데이터의 텍스트값 가져오기
			  const amenity_option = amenity_option_list.options[amenity_option_list.selectedIndex]
			  const text = amenity_option.text;
			  const price = amenity_option.value;
			  
			  var amenity_id = $(amenity_option_list).attr('id');
			  amenity_id = amenity_id.replace("amenity","");
			  // 선택한 텍스트 출력
			  document.getElementById('amenitiesResult' + amenity_id).innerText = text;
			  document.getElementById('amenitiesPrices' + amenity_id).innerText = price;
			  
			amenityOptionTotal();
			TotalPrice();
		}

	</script>
	<script>
	var user_id = '<%=id%>';
	
	var today = new Date();   

	var hours = ('0' + today.getHours()).slice(-2); 
	var minutes = ('0' + today.getMinutes()).slice(-2);

	var timeString = hours + ':' + minutes
	
	 $(function() {
		 
		var rooms = '<%=rooms%>';
 		var type = <%=type%>;
 		var checkin = '<%=checkin%>';
 		var checkout = '<%=checkout%>';
 		
 		/* 객실 옵션들 받아오는 ajax */
		$.ajax({
			url : "../options?room=" + rooms +'&checkInDate=' + checkin + '&checkOutDate=' + checkin, // 컨트롤러 위치
			type : "GET",
			dataType : 'JSON',
			beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
	        },
			success : function(result){
				
				if(result.message == 'Success'){
					data = result.data;
					console.log(data);	
					
					options();
					
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
	
	})
	</script>
    
    <script>
    	/* 장바구니 담기 버튼 눌렀을때 객실정보 보내기 */
		$(document).on('click','.basketButton',function(){
			
			if(date_list == null | date_list.length < 2) {
				alert("대실 시간을 선택해주세요.");
				return false;
			}
			
			console.log(date_list);
			
			var rooms = '<%=rooms%>';
	 		var type = <%=type%>;
	 		var checkin = '<%=checkin%>';
	 		checkin = checkin + " " + date_list[0];
	 		var checkout = '<%=checkin%>';
	 		checkout = checkout + " " + date_list[1];
	 		var amenityId;
	 		var amenityOptionId;
	 		var amenityPrice;
	 		var allTotalPrice;
	 		var plusPrice;	
	 		var optionId;
	 		var roomprice;
	 		var roomCount;
	 		
	 		/* 어메니티 값들 보내기 */
	 		var amenityOptionList = [];
	 		for(var i = 0; i < data.amenities.length; i++){
	 			amenityId = data.amenities[i].amenity_id;
	 			for(var j = 0; j < data.amenities[i].amenity_options.length; j++){		 								
					amenityOptionId = $('#amenity_options'+ i + "_" + j).attr('idx');
					amenityPrice = $('#amenity_options'+ i + "_" + j).attr('cost');
 				}
	 			if(amenityPrice != 0) {
		 			amenityOptionList.push({
						amenityID : amenityId,
						amenityPrice : amenityPrice ,
						amenityOptionID : amenityOptionId , 						 
					})
	 			}
	 		}
	 		
	 		/* 객실 옵션들 값 보내기 */
	 		var optionList = [];
	 		for(var i = 0; i < data.room_options.length; i++){
	 			optionId = data.room_options[i].option_id;
	 			roomprice = data.room_options[i].option_price;
	 			roomCount = $('#optionCount'+i).text();
	 			
	 			if(roomCount != 0) {
		 			optionList.push({
						 roomOptionID : optionId,
						 roomOptionPrice: roomprice,
						 roomOptionCount : roomCount,
					}); 
	 			}
	 		}
	 		allTotalPrice = $('#total_price').text().replaceAll(",","").replace("원","");
			plusPrice = $('#total_price').text().replaceAll(",","").replace("원","") - $('#lodgment_total').text().replaceAll(",","").replace("원","");
	 		
			/* var roomType = true;
			
			if(type == 0) {
				roomType = false;
			} */
			
			var sendData = {
				 room : rooms,
				 lodgeType : type,
				 roomPrice : $('#room_price').text().replaceAll(",","").replace("원",""),
				 checkInDate : checkin,
				 checkOutDate : checkout,
				 weekdayGiftCount : 0,
				 weekdayGiftPrice: 0,
				 weekendGiftCount : 0,
				 weekendGiftPrice : 0,
				 reservePrice : plusPrice,
				 totalPrice : allTotalPrice,
				 roomOptions : optionList,
				 amenities : amenityOptionList,
				 justReserve : false,
			 }
				  console.log(sendData);
			/* 장바구니에 담을 객실 정보 보내기 */
				$.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "../shopbaskets", // 컨트롤러 위치
					// get, post
					// get은 쿼리스트링 방식
					// post 숨겨서 보내야 되므로 ajax안에 data: {}
					 type : "POST",
					 beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        }, 
					 data : JSON.stringify(sendData),
					//dataType : response 어떤 타입으로 받을지
					dataType : 'JSON',
					success : function(result){
						
						console.log(result);
						
						if(result.message == 'Success'){
							if($('.SaveBasket').css('display') == 'none'){
				    			$('.SaveBasket').show();
				    		} else{
				    			$('.SaveBasket').hide();
				    		}
							return false;
						} else if(result.message == 'Fail'){
							alert("잠시후에 다시 시도해주세요.");
							return false;
						} else {
							alert(result.message);
							return false;
						}
						return false;					
					},
					error : function(){
						alert("검색실패");
						return false;
					}
				})
			
		})
		
		/* 바로결제 버튼 눌렀을때 정보 보내기 */
		$(document).on('click','.payRightBtn',function(){
			
			if(date_list == null | date_list.length < 2) {
				alert("대실 시간을 선택해주세요.");
				return false;
			}
			
			var rooms = '<%=rooms%>';
	 		var type = <%=type%>;
	 		var checkin = '<%=checkin%>';
	 		checkin = checkin + " " + date_list[0];
	 		var checkout = '<%=checkin%>';
	 		checkout = checkin + " " + date_list[1];
	 		var amenityOptionId;
	 		var amenityPrice;
	 		var allTotalPrice;
	 		var plusPrice;
	 		var amenityId;
	 		var optionId;
	 		var roomprice;
	 		var roomCount;
	 		
	 		/* 어메니티 옵션 보내기 */
	 		var amenityOptionList = [];
	 		for(var i = 0; i < data.amenities.length; i++){
	 			amenityId = data.amenities[i].amenity_id;
	 			for(var j = 0; j < data.amenities[i].amenity_options.length; j++){		 								
					amenityOptionId = $('#amenity_options'+ i + "_" + j).attr('idx');
					amenityPrice = $('#amenity_options'+ i + "_" + j).attr('cost');
 				}
	 			amenityOptionList.push({
					amenityID : amenityId,
					amenityPrice : amenityPrice ,
					amenityOptionID : amenityOptionId , 						 
				 })
	 		}
	 		
	 		/* 객실 옵션 정보 보내기 */
	 		var optionList = [];
	 		for(var i = 0; i < data.room_options.length; i++){
	 			optionId = data.room_options[i].option_id;
	 			roomprice = data.room_options[i].option_price;
	 			 roomCount = $('#optionCount'+i).text();
	 			
	 			optionList.push({
					 roomOptionId : optionId,
					 roomOptionPrice: roomprice,
					 roomOptionCount : roomCount,
				 }); 
	 		}
	 		allTotalPrice = $('#total_price').text().replaceAll(",","").replace("원","");
			plusPrice = $('#total_price').text().replaceAll(",","").replace("원","") - $('#lodgment_total').text().replaceAll(",","").replace("원","");
	 		
			var sendData = {
				 room : rooms,
				 lodgeType : type,
				 roomPrice : $('#room_price').text().replaceAll(",","").replace("원",""),
				 checkInDate : checkin,
				 checkOutDate : checkout,
				 weekdayGiftCount : 0,
				 weekdayGiftPrice: 0,
				 weekendGiftCount : 0,
				 weekendGiftPrice : 0,
				 reservePrice : plusPrice,
				 totalPrice : allTotalPrice,
				 roomOptions : optionList,
				 amenities : amenityOptionList,
				 justReserve : true,
			 }
				  console.log(sendData);
			/* 바로결제할 객실 정보 보내기 */
				 $.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "../shopbaskets", // 컨트롤러 위치
					// get, post
					// get은 쿼리스트링 방식
					// post 숨겨서 보내야 되므로 ajax안에 data: {}
					 type : "POST",
					 beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        }, 
					 data : JSON.stringify(sendData),
					//dataType : response 어떤 타입으로 받을지
					dataType : 'JSON',
					success : function(result){
						
						console.log(result);
						
						if(result.message == 'Success'){
							
							location.href = 'bookerinfo';
							
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
			
		})
	</script>
</body>
</html>