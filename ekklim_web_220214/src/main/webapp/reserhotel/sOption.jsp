<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
//String mid = "INIpayTest"; // 가맹점 ID(가맹점 수정후 고정)
String mid	= "ekklimkr00";

//인증
//String signKey = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS"; // 가맹점에 제공된 웹 표준 사인키(가맹점 수정후 고정)
String signKey	= "S0pDcnVhczg4MWpwYmZuclhGQ09Pdz09";
String timestamp = SignatureUtil.getTimestamp(); // util에 의해서 자동생성

String oid = mid + "_" + SignatureUtil.getTimestamp(); // 가맹점 주문번호(가맹점에서 직접 설정)
String price = "1000"; // 상품가격(특수기호 제외, 가맹점에서 직접 설정)

String cardNoInterestQuota = "11-2:3:,34-5:12,14-6:12:24,12-12:36,06-9:12,01-3:4"; // 카드 무이자 여부 설정(가맹점에서 직접 설정)
String cardQuotaBase = "2:3:4:5:6:11:12:24:36"; // 가맹점에서 사용할 할부 개월수 설정

//###############################################
// 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
//###############################################
String mKey = SignatureUtil.hash(signKey, "SHA-256");

//###############################################
// 2.signature 생성
//###############################################
Map<String, String> signParam = new HashMap<String, String>();

signParam.put("oid", oid); // 필수
signParam.put("price", price); // 필수
signParam.put("timestamp", timestamp); // 필수

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

.content {
	padding-bottom: 0px;
}

.content {
	background-color: #F5F5F5;
}

.backcolor {
	width: 1332px;
	background-color: white;
	height: 100%;
	min-height: 758px;
	padding-bottom: 172px;
}

.payment {
	margin-top: 24px;
}

.location {
	width: 850px;
	line-height: 40px;
}

.location span {
	font-family: NanumSquare_ac;
	font-size: 18px;
	color: #434343;
}

aside {
	float: right;
	width: 360px;
	margin-right: 14px;
	margin-top: 34px;
}

.reservation_info {
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
	border-bottom: 1px solid rgb(138, 138, 138, 0.5);
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
	border: 1px solid rgb(112, 112, 112, 0.5);
	border-radius: 10px;
	margin: 20px auto;
	width: 340px;
	background: white;
}

.priceTable {
	width: 100%;
}

.priceTable tr {
	width: 50%;
}

.priceTable td {
	border-bottom: none;
	padding: 8px;
}

.priceTable tr:first-child td {
	text-align: left;
}

.priceTable tr:last-child td {
	text-align: right;
}

.priceTable td:last-child {
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

.option table thead tr {
	display: flex;
	background: #F9F9F9;
}

.option table thead tr th {
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

.option table tbody tr td {
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

.option table tbody tr td:last-child {
	border-bottom: none;
}

.option table {
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

.voucherTitle {
	font-size: 16px;
	font-family: malgun;
	font-weight: bold;
	color: #242424;
	margin: 16px auto;
}

.optionCount input {
	margin: 0px;
	background-color: white;
	width: 32px;
	height: 28px;
	border: 1px solid #707070;
	float: left;
	cursor: pointer;
}

.result {
	float: left;
	width: 34px;
	border: 1px solid #707070;
	height: 26px;
	line-height: 26px;
}

.chooseImg td {
	cursor: pointer;
}

.option table td select {
	width: 128px;
	height: 28px;
	font-size: 13px;
	font-family: malgun;
	margin-top: -5px;
}

.SaveBasket {
	width: 342px;
	height: 48px;
	background-color: white;
	border: 1px solid #242424;
	border-radius: 12px;
	margin-top: 14px;
	display: none;
}

.SaveBasket p {
	font-size: 14px;
	font-family: NanumSquare_ac;
	color: #242424;
	line-height: 48px;
	margin-left: 20px;
}

.SaveBasket p span {
	color: #4366A3;
	float: right;
	margin-right: 17px;
	cursor: pointer;
}

.SaveBasket p span img {
	margin-left: 5px;
	height: 12px;
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
	String todayString = String.format("%dd-%dd-%dd", today.get(Calendar.YEAR), today.get(Calendar.MONTH) + 1,
			today.get(Calendar.DATE));

	Calendar tomorrow = Calendar.getInstance();
	tomorrow.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH), today.get(Calendar.DATE) + 1);
	String tomorrowString = String.format("%dd-%dd-%dd", tomorrow.get(Calendar.YEAR), tomorrow.get(Calendar.MONTH) + 1,
			tomorrow.get(Calendar.DATE));
	%>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<!-- 예약정보 사이드바 -->
			<div class="backcolor">
				<aside>
					<div class="reservation_info">
						<h4>예약 정보</h4>
						<div class="rinfo_table">
							<hr>
							<!-- 총금액 안내 -->
							<div class="price_txt">
								<!-- 가격정보 알려주는 table -->
								<table class="priceTable">
									<tr>
										<td>객실금액</td>
										<td>객실 옵션</td>
										<td>어메니티 옵션</td>
										<td>총 금액</td>
									</tr>
									<tr>
										<td id="room_price">0원</td>
										<td id='roomoption_total'>0원</td>
										<td id='amenity_total'>0원</td>
										<td id="total_price">0원</td>
									</tr>
								</table>
							</div>
								<!-- 장바구니, 바로결제 버튼 -->
								<button type="button" class='basketButton'>장바구니 담기</button>
								<button type="button" class='payRightBtn' style="background-color: #4366A3; color: white;">바로 결제하기</button>
							<!-- 장바구니 담기 버튼 클릭했을때 나타나는 팝업 -->
							<div class="SaveBasket">
								<p>
									장바구니에 담았습니다. <span onclick="location.href='../mypage/shoppingBasket'">장바구니 바로가기<img src="../images/icon/bluearr.png"></span>
								</p>
							</div>

						</div>
					</div>
				</aside>
				<!-- 예약정보 사이드 바 끝 -->

				<!-- 예약 정보 입력 부분 -->
				<div class="booker_info">
					<div class="location">
						<span>호텔/객실선택 ></span> <span style="font-weight: bold; color: #4366A3;"> 옵션선택 </span><span>> 결제하기 </span> <span>> 결제완료</span>
					</div>
					<!-- 옵션 부분 -->
					<div class="payment">
						<div class="option">
							<h4>객실 옵션 선택</h4>
							<!-- 숙박권 옵션 -->
							<!-- <div class="voucher">
								<p class="voucherTitle">숙박권 사용</p>
								<table>
									<thead>
										<tr>
											<th>항목</th>
											<th>수량</th>
											<th>수량</th>
											<th>금액</th>
										</tr>
									</thead>
									<tbody id='weekTable'>
										<tr id="choose_week">
											<td>평일권</td>
											<td>주말권</td>
										</tr>
										<tr id="week_count">
											<td><span id='week_day_count'></span>개 사용가능</td>
											<td><span id='weekend_day_count'></span>개 사용가능</td>
										</tr>
										<tr id="week_qty">
											<td class="optionCount"><input type="button" value="-" onclick='dayminusCnt(this)' style="border-top-left-radius: 4px; border-bottom-left-radius: 4px; margin-left: 36px;">
												<div id='result' class='result week_day_count_default'>0</div> <input type="button" value="+" onclick='dayPlusCnt(this)' value="-" onclick='dayminusCnt(this)' style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;"></td>
											<td class="optionCount"><input type="button" value="-" onclick='dayminusCnt(this)' style="border-top-left-radius: 4px; border-bottom-left-radius: 4px; margin-left: 36px;">
												<div id='result' class='result weekend_day_count_default'>0</div> <input type="button" value="+" onclick='dayPlusCnt(this)' style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;"></td>
										</tr>
										<tr id="week_price">
											<td id="weekday_price">0원</td>
											<td id="weekend_price">0원</td>
										</tr>
									</tbody>
								</table>
							</div> -->
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
										<tr id="option_list">
											<!-- <td>침구류 추가</td> -->
										</tr>
										<tr id='option_price'>
											<!-- <td>10,000원</td> -->

										</tr>
										<tr id="option_qty">
											<!-- <td class="optionCount">
											<input type="button" value="+" name="add" onclick='count("plus")' style="border-top-left-radius: 4px; border-bottom-left-radius: 4px; margin-left: 36px;">
											<div id='result'>0</div>
											<input type="button" value="-" name="minus" onclick='count("minus")' style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;">
										</td> -->

										</tr>
										<tr id='option_total_price'>
											<!-- <td>0원</td>-->

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
										<tr id='amenity_name'>
											<!-- <td>생수</td> -->
										</tr>
										<tr id='amenity_sort'>
											<!-- <td>-</td> -->
										</tr>
										<tr class="chooseImg" name='amenitiesSelect' id='amenity_select'>
											<!-- <td>
										<select name='Amenities'>
											  <option value='' selected>선택하기</option>
											  <option value=''>기본(백산수)</option>
											  <option value=''>에비앙</option>
											  <option value=''>탄산수(트레비)</option>
											</select>
										<img src="../images/passmini.png"></td>	 -->

										</tr>
										<tr id='amenity_price'>
											<!-- <td>0원</td> -->
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
			<!--  <div class="exclamation">
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

				
			 -->
		</div>
		<%@include file="../footer.jsp"%>
	</div>
	<script>
            /* 뒤로가기 버튼 팝업 */
           /*  function e_show() {document.querySelector(".exclamation").className = "exclamation show";}
            document.querySelector("#e_show").addEventListener('click', e_show);*/
    </script>

	<script>
		var lodge_begin;
		var user_id = '<%=id%>';
		
		/* 예약정보 알려주는 함수 */
		function options(){
			$('#room_price').text(data.room_price.toLocaleString('en') + "원");
			$('#rent_period').text(data.rent_period);
			$('#rent_begin').text(data.rent_begin);
			$('#total_price').text(data.room_price.toLocaleString('en') + "원");
			
			$('#week_day_count').text(data.weekday_gift_count);
			$('#weekend_day_count').text(data.weekend_gift_count);
			
			$('#weekday_price').text(data.weekday_gift_price.toLocaleString('en') + "원");
			$('#weekend_price').text(data.weekend_gift_price.toLocaleString('en') + "원");
			
			lodge_begin = data.lodge_begin;
			
			/* 객실옵션 append*/ 
			if(data.room_options.length == 0){
				$('#vocherRoom').remove();
			} else{
				for(var i = 0; i < data.room_options.length; i++){
					
						$('#option_list').append(
							"<td id='optionNames" + i + "'>" + data.room_options[i].option_name + "</td>"
						)
						
						$('#option_price').append(
							"<td id='optionPrices" + i + "' cost = '" + data.room_options[i].option_price + "'>" + data.room_options[i].option_price.toLocaleString('en') + "원</td>"
						)
						 
						$('#option_qty').append(
							"<td class='optionCount' id = 'optionCount" + i + "'>"
				        		+ "<input type='button' value='-' name='minus' onclick = 'minusCnt(this)' style='border-top-left-radius: 4px; border-bottom-left-radius: 4px; margin-left: 36px;'>"
									+ "<div class = 'result' id='result"+ i +" optionCount" + i + "'>"+ data.room_options[i].option_count +"</div>"
								+ "<input type='button' value='+' name='add' onclick = 'plusCnt(this)' style='border-top-right-radius: 4px; border-bottom-right-radius: 4px;'>"
							+"</td>" 						       
						)
						$('#option_total_price').append(
							"<td id='option_total_price" + i + "' class = 'optionTotalPrice'>0원</td>"		
						);
					}
				}
			
			/* 어메니티 옵션 append*/
				if(data.amenities.length == 0){
					
					$('#voucherAmenity').remove();
				} else{
					
					for(var i = 0; i < data.amenities.length; i++){
				
					$('#amenity_name').append(
						"<td id='" + data.amenities[i].amenity_id + "'>" + data.amenities[i].amenity_name + "</td>"
					);
					
					$('#amenity_sort').append(
						"<td class='amenitySort' id='amenitiesResult" + i + "''> -- </td>"
					);
					
					$('#amenity_select').append(
						"<td>"
							+ "<select name='Amenities' id = 'amenity" + i + "' onchange='handleOnChange(this)'>"
							+"</select>"
						+"</td>"
					);
					$('#amenity_price').append(
							"<td id='amenitiesPrices" + i + "' class='amenitiesPrice'>0원</td>"		
					);
					
					/* 선택 - select option들 */
					for(var j =0; j < data.amenities[i].amenity_options.length; j++){
						$('#amenity'+i).append(
							"<option cost='" + data.amenities[i].amenity_options[j].amenity_option_price + "' value='" + parseInt(data.amenities[i].amenity_options[j].amenity_option_price).toLocaleString('en') + "원' sel = '"+data.amenities[i].amenity_options[j].is_selected+"' id = 'amenity_options" + i + "_" + j + "' idx='" + data.amenities[i].amenity_options[j].amenity_option_id + "'>" 
							+ data.amenities[i].amenity_options[j].amenity_option_name + "</option>"
						)
						
						/* 어메니티 옵션 고정값 */
						if ($('#amenity_options'+ i + "_" + j).attr('sel') == "true") {
								$('#amenity_options'+ i + "_" + j).attr("selected","selected");
								$('#amenitiesResult'+i).text(data.amenities[i].amenity_options[j].amenity_option_name);
								$('#amenitiesPrices'+i).text(data.amenities[i].amenity_options[j].amenity_option_price.toLocaleString('en') + "원");
							}									
						}
					}
				}
			}
			
			/* 어메니티 옵션 select 선택값이 변할때 */
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
		
			var weekdayGiftCount;
			var weekdayGiftPrice;
			var weekendGiftCount;
			var weekendGiftPrice;
		 	
		 $(function() {
			var rooms = '<%=rooms%>';
	 		var type = <%=type%>;
	 		var checkin = '<%=checkin%>';
	 		var checkout = '<%=checkout%>';
			
	 		/* 객실옵션들 data */
			$.ajax({
				url : "../options?room=" + rooms +'&checkInDate=' + checkin + '&checkOutDate=' + checkout, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        }, 
				success : function(result){
					
					if(result.message == 'Success'){
						data = result.data;
						console.log(data);	
						
						/* 옵션 data가 없을때 */
						if(data.amenities.length == 0 && data.room_options.length == 0){
							$('.option').append(
								"<div style='margin-top: 128px;'>"
									+"<p style='text-align: center; font-size: 23px; color: #4e4141;'>선택할 수 있는 옵션이 없습니다.</p>"
								+"</div>"
							)
						}

						weekdayGiftCount = data.weekday_gift_count;
						weekdayGiftPrice = data.weekday_gift_price;
						weekendGiftCount = data.weekend_gift_count;
						weekendGiftPrice = data.weekend_gift_price;
						
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

	<script type="text/javascript">
		function reserveInfo() {
			$('#lodgementName').text(data.lodgement_name);
			$('#roomName').text(data.room_name);
			//숙박일때 숙박 가격 가져오기
			if (type == 0) {
				$('#totalPrice').text(data.lodge_price + "원");
				
				if (checkin == "null" || checkout == "null") {
					checkin = '<%=todayString%>';
					checkout = '<%=tomorrowString%>';
				}
			} else if (type == 1){
				//대실일때 대실 가격 가져오기
				$('#totalPrice').text(data.rent_price + "원");
				
				if (checkin == "null" || checkout == "null") {
					checkin = '<%=todayString%>';
				}
				
				checkout = checkin;
			}
			
			$('#checkinDate').text(checkin);
			$('#checkoutDate').text(checkout);
		}
		/* 호텔 객실옵션 함수 */
		function roomOptions() {
			for(var i=0; i < data.options.length; i++) {
				$('#optionName').append("<td id='optionName" + i + "'>" + data.options[i].option_name + "</td>");
				$('#optionPrice').append("<td id='optionPrice" + i + "'>" + data.options[i].option_price + "</td>");
				$('#optionCount').append(
					"<td>"
						+ "<input type='button' onclick='minus(" + i + ")' value='&minus;'>"
						+ "<div id='optionCount" + i + "'>&nbsp;0&nbsp;</div>" 
						+ "<input type='button' onclick='plus(" + i + ")' value='&plus;'>"
					+ "</td>"
				);
			}
		}
	</script>

	<script type="text/javascript">
	    /* 총 금액 */ 
	    var plus_price;
	    	
	    /* 총 금액 계산 함수 */
		  function TotalPrice(){
		     var all_total_price = 0;
	    	 
	    	 var roomprice = parseInt($('#room_price').text().replace("원", "").replaceAll(",", ""));
	    	 var roomOptionprice = parseInt($('#roomoption_total').text().replace("원", "").replaceAll(",", ""));
	    	 var amenityOptionprice = parseInt($('#amenity_total').text().replace("원", "").replaceAll(",", ""));
	    	 //총 계산 금액
	    	 all_total_price = roomprice + roomOptionprice + amenityOptionprice;
    	 	 plus_price = roomprice + roomOptionprice + amenityOptionprice;
	    	
    	 	 //총 계산 금액이 0보다 작으면 0으로 
	    	if(all_total_price<0){
	    		all_total_price = 0;
	    	}
    	 	 
	    	$('#total_price').text((all_total_price).toLocaleString('en') + "원");
	     }
     
	    /* 예약정보 숙박권 사용 가격 합하기 */
	     function lodgementOptionPay(type){
	     	 var lodgementTotalPrice = 0;
	    	
	     	 /* 숙박권 수량 가져오기 */
	    	 var week_day_count = parseInt($('#week_qty').find('.week_day_count_default').text());
	 	    var weekend_day_count = parseInt($('#week_qty').find('.weekend_day_count_default').text());
	 	    
	 	    /* 숙박권 가격 가져오기 */
	 	    var week_price =parseInt($('#week_price').find('#weekday_price').text().replace("원", "").replaceAll(",", ""));
	 	   var weekend_price =parseInt($('#week_price').find('#weekend_price').text().replace("원", "").replaceAll(",", ""));
	    	
	 	  	lodgementTotalPrice = ((week_price*week_day_count)+(weekend_price*weekend_day_count));
	 	  
	    	$('#lodgment_total').text((lodgementTotalPrice).toLocaleString('en') + "원");
	     }
     
	  	/* 어메니티 옵션들 가격 합해서 예약정보 어메니티 옵션에 넣기 */
	     function amenityOptionTotal(){
	 		var amenityTotalPrice = 0;
	    	 //어메니티 옵션들 가격 더하기
	    	 $('.amenitiesPrice').each( function(i){
	    		 amenityTotalPrice += parseInt($(this).text().replace("원", "").replaceAll(",", ""));
	    	 })
	    	 
	    	 $('#amenity_total').text((amenityTotalPrice).toLocaleString('en') + "원");
	     }
	     
	   	/* 객실 옵션 가격들 합해서 예약정보 객실옵션에 가격 넣기 */
	     function roomOptionTotal() {
	    	 
	    	 var total_price = 0;
	    	 //객실옵션들 값 더하기
	    	 $('.optionTotalPrice').each( function(i){
	    		 total_price += parseInt($(this).text().replace("원", "").replaceAll(",", ""));
	    	 })
	    	 
	    	 $('#roomoption_total').text((total_price).toLocaleString('en') + "원");
	    	 
	     }
	
	   	 /* 객실 옵션들의 각각의 가격 구하기 */	
	     function roomOptionspay(type) {
	    	 
	    	 var payIdx = $(type).parent().attr('id');
	    	 payIdx = payIdx.replace("optionCount", "");
	    	 
	    	 var price = parseInt($('#optionPrices'+payIdx).attr('cost'));
	    	 var optionCount = parseInt($('#optionCount'+payIdx).text());
	    	//각각의 객실옵션 금액에 단가 * 가격한 값들 넣기
	    	 $('#option_total_price'+payIdx).text((price*optionCount).toLocaleString('en') + "원");
	    	 
	     }
	     
	   	 /* 객실옵션 +버튼 눌렀을때 변화 */
		 function plusCnt(type)  {
	    	 	//수량 1개씩 증가
	       	   var number = $(type).prev().text();
	           number = parseInt(number) + 1;
	           $(type).prev().text(number);
		       
		       var idx = type;
	           roomOptionspay(idx);
	           roomOptionTotal();
	           TotalPrice();
	     }
	     
	   	 /* 숙박권 +버튼 눌렀을때 변화 - 평일,주말권 수량에 따라 +제어 */
	     function dayPlusCnt(type)  {
		    
		    var week_day_count = $('#week_count').find('#week_day_count').text();
		    var weekend_day_count = $('#week_count').find('#weekend_day_count').text();
		    
		    var numberNow = $(type).prev().text();
		    var number = parseInt(numberNow) + 1;
		    
		    var resultClass = $(type).prev().attr('class');
		    //평일권
		    if((/week_day_count/).test(resultClass) == true) {
		    	if(numberNow == week_day_count) {
		    		//객실권 사용 가능 갯수와 더한 갯수의 값이 같을때 멈춤
		    		return false;
		    	} else {
		    		$(type).prev().text(number);
		    	}
		    } else if((/weekend_day_count/).test(resultClass) == true) {
		    	//주말권
		    	if(numberNow == weekend_day_count) {
		    		//객실권 사용 가능 갯수와 더한 갯수의 값이 같을때 멈춤
		    		return false;
		    	} else {
		    		$(type).prev().text(number);
		    	}
		    }
		    
		    lodgementOptionPay(type);
		    TotalPrice();
		        
	    }
	     /* 숙박권 -버튼 눌렀을때 변화 - 평일,주말권 수량에 따라 -제어 */
	     function dayminusCnt(type)  {
	      	 
	       	var number = $(type).next().text();
	           number = parseInt(number) - 1;
				
	           //숙박권 갯수가 0이하로 떨어지면 0으로 고정
	           if (number < 0) {
	          		number = 0;
	           }
	           
	           $(type).next().text(number);
	           
	           lodgementOptionPay(type);
	           TotalPrice();
	         
	       }
	     
	     /* 객실옵션 -버튼 눌렀을때 변화 */
	     function minusCnt(type)  {
	   	 
	    	var number = $(type).next().text();
	        number = parseInt(number) - 1;
	        
	        if (number < 0) {
	       		number = 0;
	        }
	        /* -버튼 위에 있는 값에 number 작성 */
	        $(type).next().text(number);
	        
	        roomOptionspay(type);
	        roomOptionTotal();
	        TotalPrice();
	    }	
	     
     
	</script>

	<script type="text/javascript">
		/* 결제모듈 */
		function Card() {
			document.querySelector("#card").className = "paybutton payMethod";
			document.querySelector("#directbank").className = "paybutton";
			
			$('#gopaymethod').val("Card");
		}
		
		function DirectBank() {
			document.querySelector("#card").className = "paybutton";
			document.querySelector("#directbank").className = "paybutton payMethod";
			
			$('#gopaymethod').val("DirectBank");
		}
	</script>

	<script type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>

	<script type="text/javascript">	
		/* $('#booker_email_select').change(function () { 
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
		});  */
	</script>

	<script type="text/javascript">
		/* $('#paymentButton').click(function () {
			
			$("#goodname").val($('#lodgementName').text() + "(" + $('#roomName').text() + ")");
			$("#buyername").val($('#bookerLastName').val() + $('#bookerFirstName').val());
			$("#buyertel").val('0' + $('#bookerPhoneNum').val());
			$("#buyeremail").val($('#bookerEmailAccount').val() + '@' + $('#bookerEmailDomain').val());
			$("#price").val($('#totalPrice').text().replace(",", "").replace("원", ""));
			
			console.log($("#goodname").val());
			
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
		}); */
	</script>
	<script>
		/* 장바구니 담기 버튼 눌렀을때 정보 db로 넘김 */
		$(document).on('click','.basketButton',function(){
			
			var rooms = '<%=rooms%>';
	 		var type = <%=type%>;
	 		var checkin = '<%=checkin%>';
	 		checkin = checkin + " " + lodge_begin;
	 		var checkout = '<%=checkout%>';
	 		checkout = checkout + " 11:00";
	 		var amenityOptionId;
	 		var amenityPrice;
	 		var allTotalPrice;
	 		var plusPrice;
	 		
	 		/* 어메니티 옵션 값들 담기 */
	 		var amenityOptionList = [];
	 		for(var i = 0; i < data.amenities.length; i++){
	 			amenityId = data.amenities[i].amenity_id;
	 			for(var j = 0; j < data.amenities[i].amenity_options.length; j++){		 								
					amenityOptionId = $('#amenity_options'+i + "_" + j).attr('idx');
					amenityPrice = $('#amenity_options'+i + "_" + j).attr('cost');
 				}
	 			amenityOptionList.push({
					amenityID : amenityId,
					amenityPrice : amenityPrice ,
					amenityOptionID : amenityOptionId , 						 
				 })
	 		}
	 		
	 		/* 객실옵션 리스트 담기 */
	 		var optionList = [];
	 		for(var i = 0; i < data.room_options.length; i++){
	 			optionId = data.room_options[i].option_id;
	 			roomprice = data.room_options[i].option_price;
	 			 roomCount = $('#optionCount'+i).text();
	 			
	 			optionList.push({
					 roomOptionID : optionId,
					 roomOptionPrice: roomprice,
					 roomOptionCount : roomCount,
				 }); 
	 		}
	 		allTotalPrice = $('#total_price').text().replaceAll(",","").replace("원","");
			plusPrice = $('#total_price').text().replaceAll(",","").replace("원","") - $('#lodgment_total').text().replaceAll(",","").replace("원","");
	 		
			var roomType = true;
			
			if(type == 0) {
				roomType = false;
			}
			
			var sendData = {
					 room : rooms,
					 lodgeType : roomType,
					 roomPrice : $('#room_price').text().replaceAll(",","").replace("원",""),
					 checkInDate : checkin,
					 checkOutDate : checkout,
					 weekdayGiftCount : weekdayGiftCount,
					 weekdayGiftPrice : weekdayGiftPrice,
					 weekendGiftCount : weekendGiftCount,
					 weekendGiftPrice : weekendGiftPrice,
					 reservePrice : plusPrice,
					 totalPrice : allTotalPrice,
					 roomOptions : optionList,
					 amenities : amenityOptionList,
					 justReserve : false,
					 }
				  console.log(sendData);
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
		
		/* 바로결제하기 버튼 눌렀을때 옵션들 값 넘기기*/
		$(document).on('click','.payRightBtn',function(){
			
			var rooms = '<%=rooms%>';
	 		var type = <%=type%>;
	 		var checkin = '<%=checkin%>';
	 		checkin = checkin + " " + lodge_begin;
	 		var checkout = '<%=checkout%>';
	 		checkout = checkout + " 11:00"
	 		var amenityOptionId;
	 		var amenityPrice;
	 		var allTotalPrice;
	 		var plusPrice;
	 		
	 		//어메니티 옵션들 리스트 담기
	 		var amenityOptionList = [];
	 		for(var i = 0; i < data.amenities.length; i++){
	 			amenityId = data.amenities[i].amenity_id;
	 			for(var j = 0; j < data.amenities[i].amenity_options.length; j++){		 								
					amenityOptionId = $('#amenity_options'+i + "_" + j).attr('idx');
					amenityPrice = $('#amenity_options'+i + "_" + j).attr('cost');
 				}
	 			amenityOptionList.push({
					amenityID : amenityId,
					amenityPrice : amenityPrice ,
					amenityOptionID : amenityOptionId , 						 
				 })
	 		}
	 		
	 		//객실옵션 리스트 담기
	 		var optionList = [];
	 		for(var i = 0; i < data.room_options.length; i++){
	 			optionId = data.room_options[i].option_id;
	 			roomprice = data.room_options[i].option_price;
	 			 roomCount = $('#optionCount'+i).text();
	 			
	 			optionList.push({
					 roomOptionID : optionId,
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
					 weekdayGiftCount : weekdayGiftCount,
					 weekdayGiftPrice : weekdayGiftPrice,
					 weekendGiftCount : weekendGiftCount,
					 weekendGiftPrice : weekendGiftPrice,
					 reservePrice : plusPrice,
					 totalPrice : allTotalPrice,
					 roomOptions : optionList,
					 amenities : amenityOptionList,
					 justReserve : true,
					 }
				  console.log(sendData);
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
	</script>
</body>
</html>