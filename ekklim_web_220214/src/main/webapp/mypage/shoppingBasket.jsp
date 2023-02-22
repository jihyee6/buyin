<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<!-- 메인css -->
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.tabmenu {
	max-width: 860px;
	margin: 0 auto;
	position: relative;
}

hr{
	border: 1px solid #8A8A8A;
}

.basketArticle{
	display: grid;
	grid-template-columns: 20% 80%;
	height: 142px;
}

.basketImg img{
	width: 158px;
	padding: 14px;
}

.basketText{
	text-align: left;
	width: 94%;
	line-height: 26px;
	font-family: NanumSquare_ac;
}

.basketText h4{
	font-size: 24px;
}

.optionTable table{
	width: 100%;
	border: 1px solid #707070;
	margin: 30px auto;
	border-collapse: collapse;
	line-height: 38px;
}	

.optionTable table tr:first-child td{
	background-color: #F6F6F6;
}

.optionTable table td{
	padding: 12px 16px;
	text-align: center;
	width: 111px;
	border-bottom: 1px solid #707070;
	height: 36px;
	margin: 0px;
	font-family: NanumSquare_ac;
	font-size: 16px;
	color: #242424;
}

.optionTable table tr:last-child td{
	border-bottom: none;
}

.optionButton{
	background-color: white;
	border: 1px solid #4366A3;
	border-radius: 4px;
	color: #4366A3;
	width: 78px;
	height: 28px;
}

.deleteButton{
	background-color: white;
	border: 1px solid #707070;
	border-radius: 4px;
	color: #707070;
	width: 78px;
	height: 28px;
}

.BasketButton button{
	width: 158px;
	height: 48px;
	background-color: #4366A3;
	color: white;
	font-family: NanumSquare;
	font-size: 20px;
	border: none;
	border-radius: 8px;
	margin: 32px 344px;
}

 .giftOptionTable {
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
#close5 {
	float: right;
	width: 40px;
	height: 40px;
	margin: -44px 12px 0px 0px;
}
.personalNotice{
    width: 740px;
    margin: 15px auto;
    font-size: 14px;
    font-family: NanumSquare_ac;
    color: #242424;
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

.chooseImg img{
	margin-left: 8px;
	width: 10px;
	height: 20px;
}

.chooseImg td{
	cursor: pointer;
}
.option table td select{
	width: 130px;
	height: 28px;
	font-size: 13px;
	font-family: malgun;
}
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
	width: 142px;
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
	width: 142px;
	margin: 0;
	padding: 20px;
	text-align: center;
	font-size: 15px;
	color: #242424;
	font-family: malgun;
	height: 16px;
	border-bottom: 1px solid #A4A4A4;
}

.option table tbody tr td:last-child{
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

.optionSaveButton{
	width: 172px;
	height: 48px;
	background-color: #4366A3;
	border: none;
	border-radius: 6px;
	color: white;
	margin: 0px 296px;
	font-size: 20px;
	font-family: NanumSquare;
}
.optionTable table tr{
	display: revert;
	float: none;
}
.optionTable table td{
	display: revert;
}
.basketTable td{
	padding: 0px;
	font-size: 16px;
	color: #242424;
	font-family: NanumSquare_ac;
}
.basketTable{
	margin-left: 0px;
	padding-top: 14px;
}
.basketTable tr:first-child td{
	width: 72px;
	font-weight: bold;
}
.basket{
	margin-bottom: 32px;
}
.basketoptionLIst::-webkit-scrollbar{
	width: 8px;
 }
.basketoptionLIst::-webkit-scrollbar-thumb{
	background-color: #7E7E7E;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
   }
.basketoptionLIst::-webkit-scrollbar-track{
	background-color: transparent;
  }
.basketoptionLIst{
  	width: 770px;
  	height: 740px;
  	overflow-y: auto;
  }
.noBasket{
	font-size: 30px;
	text-align: center;
	color: #474747;
	font-family: NanumSquare_ac;
	margin: 194px auto;
}
#allCheck, .oneCheck{
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
	%>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="title">
				<div class="tname">
					<div class="pagename">&nbsp;마이페이지</div>
				</div>
			</div>
			<div class='pageContent'>
			<!-- 마이페이지 사이드바 div -->
			<aside>
				<div class="navbar">
					<nav class="inmenu">
						<div class="navside" onclick="location.href='info'">
							<div class="navitem" id="myinfo">
								<span class="textmenu" >내정보</span>
							</div>
						</div>

						<div class="navside" onclick="location.href='point'">
							<div class="navitem" id="point">
								<span class="textmenu">포인트·쿠폰 </span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='gift'">
							<div class="navitem" id="gift">
								<span class="textmenu">선물함</span>
							</div>
						</div>
						<div class="navside" onclick="location.href='shoppingBasket'" style="background-color: #4366A3;">
							<div class="navitem" id="shoppingBasket">
								<span class="textmenu" style="color: #FFFFFF;">장바구니</span><img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
							</div>
						</div>
						<div class="navside" onclick="location.href='recentSearch'">
							<div class="navitem" id="recent">
								<span class="textmenu">최근 검색 숙소</span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='wish'">
							<div class="navitem" id="wish">
								<span class="textmenu">위시리스트</span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='Myreservation'">
							<div class="navitem" id="reservation">
								<span class="textmenu">예약·취소내역</span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='review'">
							<div class="navitem" id="review">
								<span class="textmenu">나의리뷰</span> 
							</div>
						</div>
					</nav>
				</div>
			</aside>

			<div class="maintext">
				<div class="maintitle">장바구니</div>
				<div class="tabmenu">
					<div class='basketLists'>
						<!-- 장바구니 목록 -->
					</div>
					<!-- 회원탈퇴, 변경 버튼 -->
					<div class="BasketButton">
						<button type="button" class='basketBtn'>결제하기</button>
					</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>
<!-- 장바구니 옵션변경 팝업 -->
 <div class="giftOptionTable">
    <div class="window">
        <div class="popup">
            <div class="pTitle">
                <div class="seePhoto">
                    <p>옵션 변경</p>
                    <img src="../images/closebutton.png" id="close5">
                </div>
                <div class="personalNotice">
          		<div class="payment">
					<div class="option">
						<div class='basketoptionLIst'>
							<!-- 숙박권 옵션 -->
							<div class="voucher">
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
									<tbody>
										<tr>
											<td>평일권</td>
											<td>주말권</td>
										</tr>
										<tr id='week_count'>
											<td><span id='week_day_count'></span>개 사용가능</td>
											<td><span id='weekend_day_count'></span>개 사용가능</td>
										</tr>
										<tr id='week_qty'>
											<td class="optionCount">
												<input type="button" value="-" name="minus" onclick='dayminusCnt(this)' style="border-top-left-radius: 4px; border-bottom-left-radius: 4px; margin-left: 36px;">
												<div id='result' class='week_day_count_default result'>0</div>
												<input type="button" value="+" name="add" onclick='dayPlusCnt(this)' style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;">
											</td>
											<td class="optionCount">
												<input type="button" value="-" name="minus" onclick='dayminusCnt(this)' style="border-top-left-radius: 4px; border-bottom-left-radius: 4px; margin-left: 36px;">
												<div id='result' class='weekend_day_count_default result'>0</div>
												<input type="button" value="+" name="add" onclick='dayPlusCnt(this)' style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;">
											</td>
										</tr>
										<tr id='week_price'>
											<td><span id='weekday_price'>0</span>원</td>
											<td><span id='weekend_price'>0</span>원</td>
										</tr>
									</tbody>
								</table>
							</div>
								<!-- 객실옵션 -->
								<div class="voucher roomVoucher">
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
										<tr id='option_list'>
											<!-- <td>침구류 추가</td> -->
										</tr>
										<tr id='option_price'>
											<!-- <td>10,000원</td> -->
											
										</tr>
										<tr id='option_qty'>
										<!-- 	<td class="optionCount">
												<input type="button" value="-" name="minus" onclick='minusCnt(this)' style="border-top-left-radius: 4px; border-bottom-left-radius: 4px; margin-left: 36px;">
												<div id='result'>0</div>
												<input type="button" value="+" name="add" onclick='plusCnt(this)' style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;">
											</td> -->
											
										</tr>
										<tr id='option_total_price'>
											<!-- <td>0원</td> -->
											
										</tr>
									</tbody>
		
								</table>
							</div>
							<!-- 어메니티 옵션 -->
							<div class="voucher amenityVoucher">
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
										<tr class="chooseImg" id='amenity_select'>
											<!-- <td>
											<select name='Amenities'>
												  <option value='' selected>선택하기</option>
												  <option value=''>기본(백산수)</option>
												  <option value=''>에비앙</option>
												  <option value=''>탄산수(트레비)</option>
												</select>
											</td> -->
										</tr>
										<tr id='amenity_price'>
											<!-- <td>0원</td> -->
										</tr>
									</tbody>
								</table>
							</div>
						</div>
          			<button type="button" class="optionSaveButton">옵션저장</button>	
					</div>
				</div>		          				
               </div>
	        </div>
	    </div>
	</div>			
</div>
<script>	
var roomId;
		/* 장바구니 옵션 변경 버튼을 클릭했을때 변경할 수 있는 옵션 팝업을 보여줌 */
		$(document).on('click', '.option_show', function() {		
			//roomId = $(this).attr('id'); //선택한 옵션변경 버튼의 roomid 값
			let roomIdx = $(this).parent().parent().index()-1; //선택한 옵션의 idx값
			
			basketRoom(shopbasket_data[roomIdx]); //옵션팝업의 객실옵션 append 함수
			rooms(shopbasket_data[roomIdx]); //옵션 팝업의 숙박권 보여주는 함수
			options(shopbasket_data[roomIdx]); // 옵션팝업의 어메니티 옵션 append 함수
			
			roomPrice = shopbasket_data[roomIdx].reserve_price - total_price - totalAmenitiesPrice + lodgementTotalPrice;
			shopbasket_id = shopbasket_data[roomIdx].shopbasket_id;
			
			$('.giftOptionTable').addClass('show'); //옵션 팝업 열기
		})
		//옵션 팝업 닫기
		$(document).on('click', '#close5', function() {
			total_price = 0;
			totalAmenitiesPrice = 0;
			lodgementTotalPrice = 0;
			$('.giftOptionTable').removeClass('show');
		})
		
		//옵션팝업의 숙박권 갯수 data
		function rooms(data){
			$('#week_day_count').text(data.weekday_gift_count); //사용가능한 평일권 갯수
			$('#weekend_day_count').text(data.weekend_gift_count); //사용가능한 주말권 갯수
			$('#weekday_price').text(data.weekday_gift_price.toLocaleString('en')); //평일권 가격
			$('#weekend_price').text(data.weekend_gift_price.toLocaleString('en')); //주말권 가격
		}
		
		function basketRoom(data){
			//for(var i = 0; i < data.length; i++){
				//옵션 변경 버튼을 누를때마다 그 전에 append 되었던 옵션들을 지우고 새로 append하기 위함
				$('#option_list *').remove();
				$('#option_price *').remove();
				$('#option_qty *').remove();
				$('#option_total_price *').remove();
				
				var i = 0; //옵션 버튼을 선택하면 선택한 옵션의 data들만 나오므로 i =0 으로 고정
				
				for(var j = 0; j < data.room_options.length; j++){
					$('#option_list').append( //객실옵션 항목 append
						"<td id='optionName" + i + "_" + j +"'>" + data.room_options[j].option_name + "</td>"	
					);
					
					$('#option_price').append( //객실 단가 append
						"<td id='optionPrices" + i + "_" + j + "' cost = '" + data.room_options[j].option_price + "'>" + data.room_options[j].option_price.toLocaleString('en') + "원</td>"	
					);
					$('#option_qty').append( //객실 수량 append
						"<td class='optionCount' id = 'optionCount" + i + "_" + j + "'>"
							+"<input type='button' value='-' name='minus' onclick='minusCnt(this)' style='border-top-left-radius: 4px; border-bottom-left-radius: 4px; margin-left: 36px;'>"
							+"<div id='result" + i + "_" + j + " optionCount" + i + "_" + j + "' class='result'>" + data.room_options[j].option_count + "</div>"
							+"<input type='button' value='+' name='add' onclick='plusCnt(this)' style='border-top-right-radius: 4px; border-bottom-right-radius: 4px;'>"
						+"</td>"	
					);	
					$('#option_total_price').append( //선택한 옵션의 가격들 계산하여 금액에 append
							"<td id='option_total_price" + i + "_" + j + "' class='optionTotalPrice'>" + (data.room_options[j].option_count*data.room_options[j].option_price).toLocaleString('en') + "원</td>"		
							
					)
					
					total_price += parseInt(data.room_options[j].option_count*data.room_options[j].option_price); //선택한 옵션들의 값 더하여 총 금액에 추가
					
				}
			//}
		}
		
		function options(data){
			//for(var i = 0; i < shopbasket.length; i++){
				var i = 0;
				//옵션변경 선택할때마다 그 전에 append 되었던 어메니티 옵션들을 지우고 다시 append 하기 위함
				$('#amenity_name *').remove();
				$('#amenity_sort *').remove();
				$('#amenity_select *').remove();
				$('#amenity_price *').remove();
				
				for(var j=0; j< data.amenities.length; j++){
					$('#amenity_name').append( //옵션 이름 append
						"<td id='" + data.amenities[j].amenity_id + "'>" + data.amenities[j].amenity_name + "</td>"		
					) 
					
					$('#amenity_sort').append( //옵션 종류 append
						"<td id='amenitiesResult" + j + "'> -- </td>"						
					)
					$('#amenity_select').append( // 옵션 선택 select append
						"<td>"
							+"<select name='Amenities' class = 'selectAmenity' id='amenity" + j + "' onchange='handleOnChange(this)'>"
							+"</select>"
						+"</td>"	
					)
					$('#amenity_price').append( //선택한 옵션의 가격 append
						"<td id='amemitiesPrices" + j + "' class='amenitiesPrice'>0원</td>"	
					)
					
					for(var k =0; k < data.amenities[j].amenity_options.length; k++){					
						$('#amenity'+j).append( //해당 옵션의 어메니티 append
							"<option cost='" + data.amenities[j].amenity_options[k].amenity_option_price + "' value='" + parseInt(data.amenities[j].amenity_options[k].amenity_option_price).toLocaleString('en') + "원' sel = '"+ data.amenities[j].amenity_options[k].is_selected+"' id = 'amenity_options" + i + "_" + j + "_" + k + "' idx = '" + data.amenities[j].amenity_options[k].amenity_option_id + "'>" 							
							+ data.amenities[j].amenity_options[k].amenity_option_name + "</option>"
						)
						
						/* 어메니티 옵션 고정값 */
						if ($('#amenity_options'+ i + "_" + j + "_" + k).attr('sel') == "true") {	//option data의 sel 값이 true인값을 select의 기본으로 고정							
								$('#amenity_options'+ i + "_" + j + "_" + k).attr("selected","selected");
								$('#amenitiesResult'+ j ).text(data.amenities[j].amenity_options[k].amenity_option_name);
								$('#amemitiesPrices'+ j ).text(data.amenities[j].amenity_options[k].amenity_option_price.toLocaleString('en') + "원");
								
								totalAmenitiesPrice += parseInt(data.amenities[j].amenity_options[k].amenity_option_price); //선택한 어메니티 값들을 더하여 총 가격에 추가
							}	
						}
					}				
				//}
			}
		
		//어메니티 옵션의 선택 select값이 변동될때마다 실행되는 함수
		function handleOnChange(amenity_option_list) { 
			  // 선택된 옵션 데이터의 텍스트값 가져오기
			  const amenity_option = amenity_option_list.options[amenity_option_list.selectedIndex]
			  const text = amenity_option.text;
			  const price = amenity_option.value;
			  
			  var amenity_id = $(amenity_option_list).attr('id');
			  amenity_id = amenity_id.replace("amenity","");
			  // 선택한 옵션데이터의 텍스트 출력
			 	document.getElementById('amenitiesResult' + amenity_id).innerText = text;
				document.getElementById('amemitiesPrices' + amenity_id).innerText = price;		
				
				amenityOptionTotal(); 
				TotalPrice();
			}
		
</script>
	<script>
	
	var totalAmenitiesPrice = 0;
  	var lodgementTotalPrice = 0;
  	var total_price = 0;
  	var all_total_price = 0;
  	var plus_price = 0;
	 
		   /* 예약정보 숙박권 사용 가격 합하기 */
	     function lodgementOptionPay(type){
	    	
	     	 /* 숙박권 수량 가져오기 */
	    	var week_day_count = parseInt($('#week_qty').find('.week_day_count_default').text());
	 	    var weekend_day_count = parseInt($('#week_qty').find('.weekend_day_count_default').text());
	 	    
	 	    /* 숙박권 가격 가져오기 */
	 	   var week_price =parseInt($('#week_price').find('#weekday_price').text().replace("원", "").replaceAll(",", ""));
	 	   var weekend_price =parseInt($('#week_price').find('#weekend_price').text().replace("원", "").replaceAll(",", ""));

	 	   lodgementTotalPrice = ((week_price*week_day_count)+(weekend_price*weekend_day_count)); //평일권, 주말권 숙박권 선택한 만큼의 총 숙박권 가격 더하기
			}
		
		 /* 숙박권 +버튼 눌렀을때 변화 - 평일,주말권 수량에 따라 +제어 */
	     function dayPlusCnt(type)  {
		    //숙박권 수량 구하기
		    var week_day_count = $('#week_count').find('#week_day_count').text();
		    var weekend_day_count = $('#week_count').find('#weekend_day_count').text();
		    //선택한 숙박권의 이름, 갯수 가져오기
		    var numberNow = $(type).prev().text();
		    var number = parseInt(numberNow) + 1;
		    
		    var resultClass = $(type).prev().attr('class');
		    
		    if((/week_day_count/).test(resultClass) == true) { //평일권의 수량 가져올때
		    	if(numberNow == week_day_count) {
		    		return false;
		    	} else {
		    		$(type).prev().text(number);
		    	}
		    } else if((/weekend_day_count/).test(resultClass) == true) { //주말권의 수량 가져올때
		    	
		    	if(numberNow == weekend_day_count) {
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
	      	//숙박권의 수량 가지고 오기 
	       	var number = $(type).next().text();
	           number = parseInt(number) - 1;
	           if (number < 0) { //-버튼을 클릭해 0이하로 내려가면 숫자가 더 안내려가게 0으로 고정
	          		number = 0;
	           }
	           $(type).next().text(number);
	           
	           lodgementOptionPay(type); 
	           TotalPrice();
	       }
	     
	      /* 총금액 */
	     function TotalPrice(){
	    	 
	    	  
	    	 
	    	  console.log(roomPrice);
	    	  console.log("total:" + total_price);
	    	 all_total_price = roomPrice + total_price + totalAmenitiesPrice - lodgementTotalPrice; //총 예약금액에 추가된 옵션 가격들 더하고 빼기
    	 	 plus_price = roomPrice + total_price + totalAmenitiesPrice; //추가된 옵션 가격들
    	 	 
    	 	 console.log("plus:" + plus_price);
    	 	 
	    	if(all_total_price<0){
	    		all_total_price = 0;
	    	}
    	 	 
	     }
	     	     
			/* 객실 옵션들의 각각의 가격 구하기 */	
		     function roomOptionspay(type) {
				/* 선택한 객실 옵션의 id값 가지고 오기 */
		    	 var payIdx = $(type).parent().attr('id');
		    	 	payIdx = payIdx.replace("optionCount", "");
		    	 
		    	 var price = parseInt($('#optionPrices'+payIdx).attr('cost'));
		    	 var optionCount = parseInt($('#optionCount'+payIdx).text());
		    	 
		    	 $('#option_total_price'+payIdx).text((price*optionCount).toLocaleString('en') + "원"); //추가한 각각의 객실옵션 가격들 더하기
		     }
			
		 	/* 객실 옵션 가격들 합해서 예약정보 객실옵션에 가격 넣기 */
		     function roomOptionTotal() {
	 			 total_price = 0; //총 객실옵션 가격
		    	 $('.optionTotalPrice').each( function(i){
		    		 total_price += parseInt($(this).text().replace("원", "").replaceAll(",", ""));  //추가된 객실 옵션들의 최종으로 더한 가격
		    	 })
		      }
	
		     /*  어메니티 옵션들 가격 합해서 예약정보 어메니티 옵션에 넣기 */
		     function amenityOptionTotal(){
		    	totalAmenitiesPrice=0; //총 어메니티 가격
		    	 
			     $('.amenitiesPrice').each( function(i){
			    	 totalAmenitiesPrice += parseInt($(this).text().replace("원", "").replaceAll(",", "")); //추가한 어메니티들의 최종으로 더한 가격
			     })
	    	 }
	</script>
    <script>
    /* 객실옵션 + */
    function plusCnt(type)  {
     	  // 결과를 표시할 element
  	      // 현재 화면에 표시된 값
  	      // 더하기/빼기
  	      /* 선택한 객실옵션의 수량 text값 */
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
    	/* 선택한 객실 옵션의 수량 text */
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
		/* 체크박스 전체 체크 클릭시 전체 체크박스 체크, 체크박스 전체 체크시 전체체크 체크박스 체크 */
			/* 전체체크 클릭시 */
		$(document).on('click', "#allCheck", function() {
			if($("#allCheck").is(":checked")) $("input[name=oneCheck]").prop("checked", true); //전체 체크 클릭하면 그 밑에 oneCheck 체크
			else $("input[name=oneCheck]").prop("checked", false); //전체 체크 해제하면 체크된 oneCheck들 다 해제	
		});
		/* 체크박스 하나 클릭시 */
		$(document).on('click', "input[name=oneCheck]", function() {
			var total = $("input[name=oneCheck]").length; 
			var checked = $("input[name=oneCheck]:checked").length;
			
			if(total != checked) $("#allCheck").prop("checked", false); //oneCheck들이 전부 체크 안되어 있으면 전체체크 체크도 해제
			else $("#allCheck").prop("checked", true); //전부 체크 되어 있으면 전체체크도 체크
		});
	</script>
	<script>
	var shopbasket_id;
	var roomPrice;
	var reserve_Price;
	var user_id = '<%=id%>';
	var shopbasket_data;
	
		$(function() {		
			readShopbasket();
		})
		
		function readShopbasket() {
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../loginpage/login';
			} else{
				/* 장바구니 보여주는 ajax */
				$.ajax({
					url : "../shopbaskets", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						if(result.message == 'Success'){
							if(result.data != null) {
								data = result.data;
								console.log(data);
								
								shopbasket = data.shopbaskets;
								//클릭한 옵션변경의 옵션 data들 받아오기 위한 변수
								shopbasket_data = shopbasket;
								// shopbasket_id = shopbasket[0].shopbasket_id;
															
								
								basket();
								
								for(var i in shopbasket_data){
									if(shopbasket_data[i].amenities.length == 0){
										$('.amenityVoucher').css('display','none');
									}
									if(shopbasket_data[i].room_options.length == 0){
										$('.roomVoucher').css('display','none');
									}
								}
								/* basketRoom();
								rooms();
								options(); */
								

								//for(var i = 0; i < shopbasket.length; i++){ //장바구니로 넘어온 객실 + 옵션의 가격
								//	reserve_Price = shopbasket[i].reserve_price;
								//} 
									
								//roomPrice = reserve_Price - total_price - totalAmenitiesPrice + lodgementTotalPrice;
							
							} else {
								/* 장바구니 데이터가 없을때 */
								$('.BasketButton *').remove();
								 
								$('.basketLists').append(
									"<div class='noBasket'>장바구니 내용이 없습니다.</div>"
								)
							}
													
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
		}
	</script>
	<script>
		//장바구니에 담긴 호텔+ 객실 정보 표 append 하는 함수
	 	function basket(){			
			
			$('.basketLists *').remove();
			
			$('.basketLists').append(
				"<div class='basket'>"
					+"<hr>"
						+"<div class='basketArticle'>"
							+"<div class='basketImg'>"
								+"<img alt='' src='" + data.lodgement_img_url + "'>"
							+"</div>"
							+"<div class='basketText'>"
								+"<h4>" + data.lodgement_name + "</h4>"
									+"<table class='basketTable'>"
										+"<tr>"
											+"<td>체크인</td>"
											+"<td>체크아웃</td>"
										+"</tr>"
										+"<tr>"
											+"<td>" + data.date_string.split(" ~ ")[0] + "</td>"
											+"<td>" + data.date_string.split(" ~ ")[1].split(",")[0] + "</td>"
										+"</tr>"											
								+"</table>"
							+"</div>"
						+"</div>"
						+"<hr style='border: dashed 1px #242424;'>"
						+"<div class='optionTable'>"
							+"<table class='options_table'>"
								+"<tr>"
									+"<td>번호</td>"
									+"<td><input type='checkbox' id='allCheck'></td>"
									+"<td>객실명</td>"
									+"<td>가격</td>"
									+"<td>옵션</td>"
									+"<td><button class='deleteButton allDelete' type='button' onclick = 'allDelete()'>전체삭제</button></td>"
								+"</tr>"
							+"</table>"
						+"</div>"
					+"<hr>"
				+"</div>"		
			)	
				/* 장바구니에 담긴 객실 정보 append */
				for(var j = 0; j < shopbasket.length; j++){
					$('.options_table').append(
						"<tr class='oneBasketOption'>"
							+"<td id='basketOptionCount'>" + (j+1) + "</td>"
							+"<td><input type='checkbox' name='oneCheck' class = 'oneCheck' value = '" + shopbasket[j].shopbasket_id + "'></td>"
							+"<td>" + shopbasket[j].room_name + "</td>"
							+"<td>" + shopbasket[j].reserve_price.toLocaleString('en') + "원</td>"
							+"<td><button class='optionButton option_show' type='button' shopId ='" + shopbasket[j].shopbasket_id + "' >옵션변경</button></td>"
							+"<td><button class='deleteButton oneDelete' type='button' shopId ='" + shopbasket[j].shopbasket_id + "'>삭제하기</button></td>"
						+"</tr>"		
					)
							
				}			
		} 
	 	
		//객실의 삭제하기 버튼 클릭했을때 클릭한 객실 delete
	  $(document).on('click','.oneDelete',function(){
		  $(this).parent().parent().remove(); //클릭한 삭제하기 버튼의 객실 지우기
		  
		  var shopbasket = $(this).attr('shopId');
		 
		  $.ajax({
				url : "../shopbaskets?shopbasket="+shopbasket, // 컨트롤러 위치
				type : "DELETE",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					console.log(result)
					if(result.message == 'Success'){
						data = result.data;
						console.log(data);
						//location.reload();
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
	<script>
			//옵션변경 팝업의 옵션변경 버튼 클릭했을때 변경한 옵션들 update
			$(document).on('click','.optionSaveButton',function(){
				var amenityOptionId;
		 		var amenityPrice;	
		 		var optionId;
				
				var optionList = []; //객실옵션 list 담아서 post
				
				for(var i = 0; i < shopbasket.length; i++){
					if(shopbasket[i].shopbasket_id == shopbasket_id) {
						for(var j = 0; j < shopbasket[i].room_options.length; j++){
						
							optionId = shopbasket[i].room_options[j].option_id;
							optionPrice = shopbasket[i].room_options[j].option_price;
							optionCount = $('#optionCount0_'+j).text();
							
							optionList.push({
								roomOptionID : optionId,
								roomOptionPrice : optionPrice,
								roomOptionCount : optionCount,
							});
						}
					}
				}
			
				var amenityOptionList = []; //어메니티 옵션 list 담아서 post
				
				$('.selectAmenity option:selected').each(function(i) {
					amenityOptionList.push({
						amenityID : $('#amenity_name').children().eq(i).attr('id'),
						amenityPrice : $(this).attr('cost'),
						amenityOptionID : $(this).attr('idx')
					})
				})
				
				/* for(var i =0; i < shopbasket.length; i++){
					for(var j = 0; j < shopbasket[i].amenities.length; j++){
						amenityId = shopbasket[i].amenities[j].amenity_id;
						for(var k = 0; k < shopbasket[i].amenities[j].amenity_options.length; k++){
							amenityOptionId = $('#amenity'+i).val().$('#amenity_options'+ i +"_" + j + "_" + k).attr('idx');
							amenityPrice = $('#amenity_options'+ i +"_" + j + "_" + k).attr('cost');
							
							amenityOptionList.push({
								amenityID : amenityId,
								amenityPrice : amenityPrice,
								amenityOptionID : amenityOptionId,
							})
						}
					}
				} */
				
				var sendData = {
						weekdayGiftCount : $('.week_day_count_default').text(),
						weekendGiftCount : $('.weekend_day_count_default').text(),
						roomOptions : optionList, //객실옵션
						amenities : amenityOptionList, //어메니티 옵션
						totalPrice : plus_price , //추가된 옵션들 금액
						reservePrice : all_total_price, //총 계산해야할 금액
					 }
				
				  console.log(sendData);
				
				$.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "../shopbaskets?shopbasket=" + shopbasket_id, // 컨트롤러 위치
					// get, post
					// get은 쿼리스트링 방식
					// post 숨겨서 보내야 되므로 ajax안에 data: {}
					 type : "PUT",
					 beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        }, 
					 data : JSON.stringify(sendData),
					//dataType : response 어떤 타입으로 받을지
					dataType : 'JSON',
					success : function(result){
						
						console.log(result);
						
						if(result.message == 'Success'){
							$('.giftOptionTable').removeClass('show');
							location.reload();
							//readShopbasket();
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
			
		/* 삭제할 체크박스를 선택한 후에 전체삭제 버튼을 누르면 체크된 객실목록 삭제됨 */
		function allDelete() {
			
			var shopbasketIdArr = []; //삭제할 체크박스의 shopbasketid 배열	
			var deleteCnt = 0; 
			
			$('.oneCheck:checked').each(function(){ //삭제할 체크박스 체크시
				shopbasketIdArr.push($(this).val()); 
			})
			
			if(shopbasketIdArr.length == 0) { //체크박스에 선택된게 없는데 전체삭제를 누를때
				alert("적어도 하나의 객실을 선택해야 합니다.");
			} else {
				for(var i in shopbasketIdArr) {
					//선택한 체크박스들 삭제
					$.ajax({
						url : "../shopbaskets?shopbasket="+shopbasketIdArr[i], // 컨트롤러 위치
						type : "DELETE",
						dataType : 'JSON',
						async : false,
						beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        },
						success : function(result){
							console.log(result)
							if(result.message == 'Success'){
								data = result.data;
								console.log(data);
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
				deleteCnt++; //삭제 할때마다 삭제 갯수 더하기	
			}
				/* 삭제갯수 변수와 선택한 shopbasketIdArr의 길이가 똑같으면 새로고침 */
				if(deleteCnt == shopbasketIdArr.length) {
					location.reload();
				}	
			}
		}
			
			/* 결제할 객실 체크박스 체크후 결제하기 버튼 클릭하면 결제 페이지로 넘어가기 */
		 	$(document).on('click','.basketBtn',function(){
				var shopbasket = "(";
				
				var shopbasketsCnt = $('.oneCheck:checked').length; 
				
				if(shopbasketsCnt == 0){
					alert("적어도 한개의 객실을 선택해야 합니다.");
				} else{
					$('.oneCheck:checked').each(function(i){
						
						if(i == shopbasketsCnt -1){ //선택한 객실의 shopbasketid string으로 보내기
							shopbasket += $(this).val();
							shopbasket += ")";
						} else {
							shopbasket += $(this).val() + ",";
						}
					})
				location.href = '../reserhotel/bookerinfo?shopbaskets='+shopbasket;
				} 
			})  
		
		</script>
	
</body>
</html>