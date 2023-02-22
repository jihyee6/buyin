<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<meta name='description' content>
<meta name='kewords' content="바이인호텔, 호텔검색, 숙소예약, 숙소찾기, 호텔특가, 국내호텔예약">
<meta property="og:title" content="바이인호텔 ">
<meta property="og:description" content>
<meta property="og:type" content ="website">
<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="바이인호텔">
<meta name="twitter:description" content>
<meta name="robots" content=“index”>
<meta name="robots" content="follow">
<!-- 메인css -->
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/calender.css">
<link rel="stylesheet" href="../css/slide.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.maintext{
	margin: 44px 0px 120px 0px;
}

.tabmenu {
	max-width: 100%;
	margin: 0 auto;
	position: relative;
}

.search {
	position: relative;
	display: flex;
	top: 35px;
	width: 1300px;
	margin: auto;
	list-style: none;
	background-color: white;
	box-shadow: 2px 2px 5px 0px grey;
	border-radius: 13px;
	height: 100px;
}

.search>li {
	flex: 1;
	height: 56px;
	padding: 9px;
	color: #707070;
}

.search>li>.searchbar {
	text-align: left;
}

.searchbar p {
	font-size: 14px;
	font-family: NanumSquare_ac;
	color: #242424;
}

.search>li:not(:last-child)>.searchbar {
	border-right: 1px solid #CCCCCC;
}

#textbox {
	font-size: 16px;
	margin-top: 10px;
	padding: 5px;
	color: #CCCCCC;
}

.sbar {
	text-align: center;
	height: 63px;
	line-height: 63px;
}

.searchbox {
	width: 225px;
	border: 0 solid;
	font-size: 16px;
}

#stext {
	font-size: 30px;
	color: #242424;
	font-family: NanumSquare_ac;
	cursor: default;
}

.recentAside {
	float: right;
	margin: 44px 76px 0px 0px;
}

.recent {
	margin: 20px auto;
	cursor: pointer;
}

.recent img {
	width: 228px;
	height: 124px;
	border-radius: 6px;
}
.recentimg{
	padding-top: 10px;
	border-top: 1px solid rgb(164,164,164,0.5);
}

.recentRoom > .recent:first-child recentimg{
	border-top: none;
}

.recentimg h4 {
	color: #242424;
	font-family: NanumSquare_ac;
	font-size: 16px;
	font-weight: normal;
	padding-bottom: 8px;
}

.count{
	font-size: 18px;
	font-family: NanumSquare_ac;
	margin-left: 30px;
	color: #242424;
}

.article{
	border: 1px solid #A4A4A4;
	border-radius: 10px;
	margin: 25px;
	width: 100%;
	cursor: pointer;
}

.article img{
	border-radius: 30px;
	padding: 21px;
	width: 318px;
	height: 204px;
}

.htitle h3{
	font-size: 28px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.htitle{
	line-height: 28px;
	width: 100%;
	margin-top: 0;
}

.htitle p{
	font-size: 15px;
	color: #242424;
	font-family: malgun;
	padding-top: 4px;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}
.price{
	color: #242424;
	font-size: 15px;
	font-family: malgun;
	width: 100%;
	margin: 0;
}
.salePrice{
	font-size: 20px;
	font-weight: bold;
	color: #242424;
}
.listPrice{
	text-decoration : line-through;
	padding-left: 6px;
	color: #A7A7A7;
	font-size: 16px;
}
.salePercent{
	color: #83B3D1;
	font-size: 18px;
}
.price > p > .reviewNumber{
	text-align: right;
	float: right;
	color: #E75A00;
	font-size: 18px;
}

.price > p > .reviewNumber:hover{
	cursor: pointer;
}

.reviewselect{
	float: right;
	margin: -6px 626px 0px 0px;
}

.recentAside p{
	color: #434343;
	font-size: 18px;
	font-family: NanumSquare_ac;
	font-weight: bold;
}

.box{
	width: 108px;
	height: 30px;
	border: 1px solid #A2A2A2;
	font-size: 16px;
	font-family: malgun;
	border-radius: 5px;
	cursor: pointer;
}

.hotelInfo{
	width: 100%;
	padding: 20px 16px;
	height: 100%;
	box-sizing: border-box;
	display: flex;
	flex-direction: column;
	flex-wrap: wrap;
	jusify-content: center;
	align-items: center;
	align-content: center;
}

.htitle img{
	width: 10px;
	height: 14px;
	padding: 12px 4px 0px 0px;
	float: left;
}
   .hotelnavbar {
	cursor: pointer;
	float: left;
	width: 37%; 
}

.hotelnavside {
	height: 49px;
	font-family: NanumSquareRound;
	text-align: center;
	line-height: 49px;
	width: 75px;
	color: #707070;
}


.hoteltextmenu {
	font-size: 16px;
	font-family: NanumSquare_ac;
	font-weight: bold;
}

.hotelmaintext{
	width: 192px;
}
.reservationContent{
	width: 1300px;
}
.popup {
	position: absolute;
	background-color: #ffffff;
	border-radius: 4px;
	display: none;
	border: 1px solid #A4A4A4;
	margin-top: 16px;
}

.show {
	transition: all .5s;
	z-index: 2;
	display: block;
}

.show .popup {
	transform: translate(-50%, -50%);
	transition: all .5s;
}
.calendarBtn button{
	background-color: white;
	width: 30%;
	border: none;
	font-size: 14px;
	font-family: NanumSquare_ac;
}
.noDataMessage{
	font-size: 20px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #717171;
}
.nohotelsubTxt{
	font-size: 18px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #B8B8B8;
}
.nohotel{
	text-align: center;
	line-height: 40px;
	margin-top: 76px;
}
.roomInfoCard{
	display: grid;
	grid-template-columns: 80% 20%;
}
.infoNum{
	color: #83B3D1;
}
.reviewNumber{
	font-size: 17px;
	font-weight: bold;
	font-family: NanumSquare_ac;
}
.infoNumArea{
	line-height: 26px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.inmenu{
	overflow-y: auto;
	height: 310px;
}
.hotelmaintext{
	overflow-y: auto;
	height: 310px;
	background-color: rgb(249,249,249);
}
.box:focus{
	outline: none;
}
.businessBox{
	display: grid;
	grid-template-columns: 50% 50%;
}
</style>
</head>
<body>
<%String checkin = request.getParameter("checkin"); %>
<%String checkout = request.getParameter("checkout"); %>
<%String regionID = request.getParameter("region"); %>
<%String roomName = request.getParameter("name"); %>
<%
	Calendar today = Calendar.getInstance();
	int todayYear = today.get(Calendar.YEAR);
	int todayMonth = today.get(Calendar.MONTH) + 1;
	int todayDate = today.get(Calendar.DATE);
	String todayString = String.format("%04d.%02d.%02d", today.get(Calendar.YEAR), today.get(Calendar.MONTH) + 1,
	today.get(Calendar.DATE));
			
	Calendar tomorrow = Calendar.getInstance();		
	tomorrow.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH), today.get(Calendar.DATE) + 1);
	String tomorrowString = String.format("%04d.%02d.%02d", tomorrow.get(Calendar.YEAR), tomorrow.get(Calendar.MONTH) + 1,
	tomorrow.get(Calendar.DATE));
	
	Calendar threeMonthDay = Calendar.getInstance();
	threeMonthDay.set(todayYear, todayMonth+2, todayDate);
	int threeMonthDayYear = threeMonthDay.get(Calendar.YEAR);
	int threeMonthDayMonth = threeMonthDay.get(Calendar.MONTH) + 1;
	int threeMonthDayDate = threeMonthDay.get(Calendar.DATE);
%>

	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="title">
				<!-- 서치바 부분 -->
				<ul class="search">
					<li>
						<div class="searchbar">
							<p>숙소명 검색</p>
							<div id="textbox">
								<input type="text" placeholder="검색어를 입력해주세요." class="searchbox" id ='searchRoom'>
								<img src="../images/mainimg/glass1.png">
							</div>
						</div>
					</li>

					<li>
						<div class="searchbar">
							<p>호텔 또는 지역</p>
							<div id="textbox">
								<input type="text" placeholder="호텔 또는 지역을 선택해주세요."  id='regionResult'	class="searchbox" readonly> 
								<img id='hotel'	src="../images/mainimg/locationimg.png">
							</div>
						</div>
						<!-- 호텔/지역 선택시 나오는 팝업 -->
						  <div class="locationpop" style="position: relative;">
						  	<span id = 'Area' style='display: none;'></span>
						  	<span id = 'Zone' style='display: none;'></span>
							    <aside>
							    	<!-- 지역 사이드 (왼쪽) -->
							        <div class="hotelnavbar">
							            <nav class="inmenu">
							              
							            </nav>
							        </div>
							    </aside>
							    <!-- 구 사이드 (오른쪽) -->
							    <div class="hotelmaintext">
							    								      
							    </div>
							    <div class='regionSelectBtn'>
						        	<button type='button' id = 'selectRegion'>선택</button>
						        	<button type='button' id = 'cancelRegion'>취소</button>
						        </div>
							</div>
						</li>
					<li>
						<div class="searchbar">
							<p>날짜 선택</p>
							<div id="textbox" onclick='s_show();'>
								<input type="text" placeholder="날짜를 선택해주세요." class="searchbox" id="dateSearchCondition" readonly>
								<img src="../images/mainimg/calendarimg.png">
							</div>
						</div>
						<div class="window" style="position:relative;">
							<div class="popup">
								<span id="selectState" style="display: none">login</span>
								<span id="checkinDate" style="display: none"></span>
								<span id="checkoutDate" style="display: none"></span>
				
								<div class="navc" style = "color:white">
									<!-- 이전달 버튼 만들기 -->
									<div style = "padding: 8px 0px;">
										<button class="navc-btn" id="prevBtn" style = "float:left;">
										<img src = "../images/prev.png" style = "width:16px; vertical-align: top;"></button>
										<!-- 제목 만들기 -->
										<div class ="year-month" style = "float:left;">
											<span id="year"></span>년&nbsp;
											<span id="month"></span>월
										</div>
								
										<!-- 다음달 버튼 만들기 -->
										<button class="navc-btn" id="nextBtn" style = "float:left;">
										<img src = "../images/next.png" style = "width:16px; vertical-align: top;"></button>
									</div>
								</div>
								<!-- 달력 div -->
								<div class="calendar">
									<div class="days">
								        <div class="day" style = "color: #D13E3E;">
								        	일
								        </div>
								        <div class="day">
								        	월
								        </div>
								        <div class="day">
								        	화
								        </div>
								        <div class="day">
								        	수
								        </div>
								        <div class="day">
								        	목
								        </div>
								        <div class="day">
											금
								        </div>
								        <div class="day"  style = "color: #396EE2;">
								        	토
								        </div>
						      		</div>
							    	<div class="main">
									<!-- 달력 만들기 -->
										<div class="dates">
										<!-- 날짜 집어 넣기 -->
		
										</div>
									</div>
								</div>
								<div class='calendarBtn' style="display:flex; margin-bottom:10px">
									<button id="selectBtn">선택</button>
									<button id="cancelBtn">취소</button>
								</div>
							</div>
						</div>
					</li>

					<li>
						<div class="sbar" onclick="searchHotel()">
							<span id="stext">SEARCH</span>
						</div>
					</li>
				</ul>
			</div>
			
			<!-- 최근 검색 숙소 사이드바 -->
			<div class='reservationContent'>
				<aside class='recentAside'>
					<p>최근 검색 숙소</p>
					<div class="recentRoom">
						<!-- 최근검색숙소 목록 append -->
					</div>
				</aside>
	
				<!-- 숙소 검색 결과 부분 -->
				<div class="maintext">
					<div class="tabmenu">
						<div class="count">결과 <span id='reservationCountView'>0</span>건
						<!-- 검색결과 정렬부분 -->
							<div class="reviewselect"><!-- onChange="checkemailaddy();" -->
								<select name="review_select" class="box" id="review_select" style="margin-left: 10px;">
										<option id='wish_num' selected>인기순</option>
										<option id='review_num'>리뷰순</option>
										<option id='sale_price_low'>가격낮은순</option>
										<option id=sale_price>가격높은순</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>
	<script>
	var isCheckinSelect = true;
	var storedCheckinDate = "";
	var storedCheckoutDate = "";
	
	/* 가격높은순, 낮은순 정렬하기 */
	function ViewSortListNumber() {
		
		//셀렉트 박스가 바뀔때 실행
		$(document).on('change', '#review_select', function(){
			/* 셀렉트박스에 선택된 옵션의 id값 가져오기 */ 
			var col = $('#review_select option:selected').attr('id');
			if(col == "sale_price" || col == "review_num" || col == 'wish_num'){
				/* 내림차순 */
				data = data.sort(function (a,b){ return b[col] - a[col] });
			
				// 정렬후에 View함수를 다시 실행해주어야 함
				reservationList();
			} else if(col == "sale_price_low") {
				col = "sale_price";
				/* 오름차순 */
				data = data.sort(function (a,b){ return a[col] - b[col] });
				// 정렬후에 View함수를 다시 실행해주어야 함
				reservationList();
				}
			})
		}
	</script>
	<script type="text/javascript">
		/* 호텔 검색하는 기능 */
		function searchHotel() {
			/* var checkinDate = $('#checkinDate').text();
			var checkoutDate = $('#checkoutDate').text();
			
			if (checkinDate != "" && checkoutDate != "") {
				location.href='reservation1?checkin=' + checkinDate + '&checkout=' + checkoutDate;
			} else {
				location.href='reservation1';
			} */
			
			/* var checkinDate = $('#checkinDate').text();
			var checkoutDate = $('#checkoutDate').text();
			var regionID = $('.zoneCss').attr('id'); */
			var checkinDate = storedCheckinDate;
			var checkoutDate = storedCheckoutDate;
			var regionID;
			var roomName = $('#searchRoom').val();
			
			if(roomName == ""){
				roomName = "";
			} else {
				roomName = "&name=" + roomName;
			}
				
			if($('.zoneCss').length == 0){	
				if($('.areaCss').length == 0){
					regionID = "";
				} else { 
					/* regionID = $('.areaCss').children().children().attr('id'); */
					regionID = "&region=" + $('.areaCss').children().children().attr('id');	
				}
			} else{
				regionID = "&region=" + $('.zoneCss').attr('id');
			}
			
			//체크인, 체크아웃 날짜가 있을때
			if (checkinDate != "" && checkoutDate != "") {
				/* location.href='reservation1?checkin=' + checkinDate + '&checkout=' + checkoutDate +'&region=' + regionID + '&name=' + roomName; //받아온 체크인, 체크아웃 값을 가져오기 */
				location.href='reservation1?checkin=' + checkinDate + '&checkout=' + checkoutDate + regionID + roomName;
			} else {
				//오늘, 내일 날짜 받아오는 변수
				var todayString = "<%=todayString%>"; 
				var tomorrowString = "<%=tomorrowString%>";
				//체크인, 체크아웃 값을 오늘, 내일날짜로 넣기
				/* location.href='reservation1?checkin=' + todayString + '&checkout=' + tomorrowString +'&region=' + regionID + '&name=' + roomName; */
				location.href='reservation1?checkin=' + todayString + '&checkout=' + tomorrowString + regionID + roomName;
			}
			ViewSortListNumber();
		}
	</script>
	<script>
	/* 숙소 검색 결과 정보 아티클 */
 	function reservationList() {
 	
		$('.lodgementBox').remove();
		
		for(var i = 0; i < data.length; i ++){
			
			var rentListPrice = data[i].rent_list_price == null ? "" : data[i].rent_list_price.toLocaleString('en'); //대실 정가가격이 null이면 빈값으로 넘겨주고 아니면 값을 그대로 보내주기
			var rentSalePrice = data[i].rent_sale_price == null ? "" : data[i].rent_sale_price.toLocaleString('en'); //대실 세일 가격이 null 이면 빈값, 아니면 값 그대로 보내기
			//숙소 검색결과 아티클 append
			$('.tabmenu').append(
				"<div class='article lodgementBox' style = 'display: grid; grid-template-columns: 40% 60%; align-items: start;' onclick = 'reservationNext(" + data[i].lodgement_id + ")'>"
					+ "<div>"
						+ "<img alt='숙소사진' src='" + data[i].lodgement_img_url + "'>"
					+ "</div>"
					+ "<div class='hotelInfo'>"
						+ "<div class='htitle'>"
							+ "<h3>" + data[i].lodgement_name + "</h3>"
							+ "<img src='../images/icon/locationIcon.png'>"
							+ "<p>" + data[i].landmark + "</p>"
						+ "</div>"
						+ "<div class='price'>"
								+ "1박/부가세 별도"
								+"<div class='roomInfoCard'>"
									+"<div style='margin-left: 0px; margin-bottom: 0px; width: 100%;'>"
										+"<div class='rentCard" + i + "'>"
											
										+"</div>"
										+"<div class='businessCard" + i + " businessBox'>"
											+"<div class='lodgeBox" + i + "' style='margin-left: 0;'>"
												
											+ "</div>"											
										+"</div>"
									+"</div>"
									+"<div class='infoNumArea'>"
										+"<p class='reviewNumber'><span class='infoNum'>관심 </span>" + data[i].wish_num.toLocaleString('en') +"</p>"
										+"<p class='reviewNumber' onclick = 'reservationReview(" + data[i].lodgement_id + ")'><span class='infoNum'>리뷰 </span>" + data[i].review_num.toLocaleString('en') +"</p>"
									+"</div>"
								+"</div>"
						+ "</div>"
					+ "</div>"
				+"</div>"
			);
			
			
			
			
			//기업회원가 + 기업회원 적용되는 방일때
				if(data[i].is_business == true){
					if(data[i].business_list_price != null && data[i].business_dc_rate > 0){
						$('.businessCard' + i).append(
							"<div style='margin-left: 0;'>"
								+"<p class='businessArea" + i + "'><span class='salePercent'>" + data[i].business_dc_rate + "%</span><span class='listPrice'>" + data[i].business_list_price.toLocaleString('en') + "</span></p>"
								+ "<p class='salePrice'>기업숙박 " + data[i].business_sale_price.toLocaleString('en') + "원</p>"
							+"</div>"
						)											
					} else if(data[i].business_list_price == null){
						$('.businessCard' + i).append(
							"<div style='margin-left: 0;'>"
								+ "<p class='salePrice'>기업숙박 예약마감</p>"
							+"</div>"
						)
					} else{
						$('.businessCard' + i).append(
							"<div style='margin-left: 0;'>"
								+ "<p class='salePrice'>기업숙박 " + data[i].business_list_price.toLocaleString('en') + "원</p>"
							+"</div>"
						)	
					}
				} 
				
				//숙박 예약마감
					if(data[i].lodge_list_price != null && data[i].lodge_dc_rate > 0){
						$('.lodgeBox' +i).append(
							"<p class='saleArea" + i + "'><span class='salePercent'>" + data[i].lodge_dc_rate + "%</span><span class='listPrice'>" + data[i].lodge_list_price.toLocaleString('en') + "</span></p>"
							+ "<p class='salePrice'>숙박 " + data[i].lodge_sale_price.toLocaleString('en') + "원</p>"
						)
					} else if(data[i].lodge_list_price == null){
						$('.lodgeBox' +i).append(
								"<p class='salePrice'>숙박 예약마감</p>"														
							)
					} else{
						$('.lodgeBox' +i).append(
								"<p class='salePrice'>숙박 " + data[i].lodge_sale_price.toLocaleString('en') + "원</p>"														
						)
					}
				

				//대실 예약마감
				if(data[i].is_rent){
					if(data[i].rent_list_price != null && data[i].rent_dc_rate > 0){
						$('.rentCard' +i).append(
							"<p class='rentSale" + i + "'><span class='salePercent'>" + data[i].rent_dc_rate + "%</span><span class='listPrice'>" + rentListPrice + "</span></p>"
							+ "<p class='salePrice rentPrice" + i + "'>대실 " + rentSalePrice + "원</p>"														
						)
					} else if(data[i].rent_list_price == null){
						$('.rentCard' +i).append(
								"<p class='salePrice rentPrice" + i + "'>대실 예약마감</p>"														
							)
					}else{
						$('.rentCard' +i).append(
							"<p class='salePrice rentPrice" + i + "'>대실 " + rentSalePrice + "원</p>"														
						)
					}
				} else{
					$('.rentCard'+i).css('display','none');
				}
				
				/* if(data[i].rent_dc_rate == null){
					$('.rentSale'+i).css('display','none');
				}
				
				if(data[i].rent_sale_price == null){
					if(data[i].is_rent == true){
						$('.rentPrice'+i).text("대실 예약마감");						
					} else if(data[i].is_rent == false){
						$('.rentPrice'+i).css('display','none');
					}
				} */
				
					
			}
	} 

		/* $(window).scroll(function(){
			if($(window).scrollTop() == $(document).height() - $(window).height()){
				for(var i = 0; i < data.length; i ++){
					$('.tabmenu').append(
						"<div class='article lodgementBox' style = 'display: grid; grid-template-columns: 40% 60%;' onclick = 'reservationNext(" + data[i].lodgement_id + ")'>"
							+ "<div>"
								+ "<img alt='숙소사진' src='" + data[i].lodgement_img_url + "'>"
							+ "</div>"
							+ "<div class='hotelInfo'>"
								+ "<div class='htitle'>"
									+ "<h3>" + data[i].lodgement_name + "</h3>"
									+ "<img src='../images/icon/locationIcon.png'>"
									+ "<p>" + data[i].landmark + data[i].distance + "</p>"
								+ "</div>"
								+ "<div class='price'>"
									+ "1박/부가세 별도"
									+ "<p>대실 <span>" + data[i].sale_price + " 원</span></p>"
									+ "<p>숙박 <span>" + data[i].list_price + " 원</span><span class='reviewNumber' onclick = 'reservationReview(" + data[i].lodgement_id + ")'>리뷰 " + data[i].review_num +"</span></p>"				
								+ "</div>"
							+ "</div>"
							);
						}
				 	}		
				}) */
		 
				
				
		
	/* 숙소검색결과 아티클 클릭시 경로 */
	function reservationNext(lodgement_id) {
		location.href = '../lodgement/'+lodgement_id + '?checkin=' + checkin + '&checkout=' + checkout;		
	}
	
	/* 리뷰 클릭시 경로 */
	function reservationReview(lodgement_id) {
		location.href = 'hotelreview?hotel='+lodgement_id;
		event.stopPropagation();
	}
	
	</script>
	
	<script>
		/* 검색결과 건수 세기 */
		function reservationCount(){
			$('#reservationCountView').text(data.length);
		}
	
	</script>
	<script>
	/* 최근 검색 숙소 사이드 바 부분 append */
	function recentSearchRoom() {
		
		for(var i = 0; i < recentData.length; i ++){
		$('.recentRoom').append(
			"<div class='recent' onclick='recentRoom(" + recentData[i].lodgement_id + ")'>"
				+"<div class='recentimg'>"
					+"<h4>" + recentData[i].lodgement_name + "</h4>"
					+"<img src='" + recentData[i].lodgement_img_url + "'>"
				+"</div>"
			+"</div>"
			);
		}
	}
	/* 검색결과 아티클 div 클릭시 해당 객실 상세페이지로 이동 */
	function reservationNext(lodgement_id) {
 		if (checkin != "null" && checkout != "null") {
			location.href = '../lodgement/'+ lodgement_id + '?checkin=' + checkin + '&checkout=' + checkout;
		} else {
			location.href = '../lodgement/'+ lodgement_id;
		}
	}
	/* 검색결과에 리뷰 버튼 클릭시 해당 호텔의 리뷰 보는 페이지로 이동 */
	function reservationReview(lodgement_id) {
		location.href = '../lodgement/'+lodgement_id + '?checkin=' + checkin + '&checkout=' + checkout + '&review=1';
		event.stopPropagation();
	}
	
	/* 최근검색 객실의 div 클릭시 해당 객실 상세보기 페이지로 이동 */
	function recentRoom(lodgement_id) {
		location.href = '../lodgement/'+lodgement_id + '?checkin=' + checkin + '&checkout=' + checkout;
	}
	
	</script>
	
	<script>
		var user_id = '<%=id%>';
		var checkin = '<%=checkin%>';
		var checkout = '<%=checkout%>';
		var regionID = '<%=regionID%>';
		var roomName = '<%=roomName%>';
		
		if (checkin == 'null' || checkout == 'null') {
			location.replace('reservation1?checkin=' + '<%= todayString%>' + '&checkout=' + '<%= tomorrowString%>')
		}
		
		storedCheckinDate = checkin;
		storedCheckoutDate = checkout;
		
		$(function() {
			var reservation_url;
			if(user_id == "null") { //로그인 안하고 들어왔을때	
				if(roomName == "null" && regionID == "null") { //객실이름 검색, 지역 검색 안했을때
					reservation_url = "../lodgements?checkin=" + checkin + '&checkout='+ checkout;
				} else if(regionID == "null") { //지역 검색안했을때
					reservation_url = "../lodgements?name=" + roomName + '&checkin=' + checkin + '&checkout='+ checkout;
				} else if (roomName == "null") { //호텔이름 검색 안했을때
					reservation_url = "../lodgements?region=" + regionID + '&checkin=' + checkin + '&checkout='+ checkout;
				} else {
					reservation_url = "../lodgements?name=" + roomName + '&region=' + regionID + '&checkin=' + checkin + '&checkout='+ checkout;
				}
			} else { //로그인하고 들어왔을때
				if(roomName == "null" && regionID == "null") { //객실이름, 지역 검색 안했을때
					reservation_url = "../lodgements?checkin=" + checkin + '&checkout='+ checkout;
				} else if(regionID == "null") { //지역 검색 안했을때
					reservation_url = "../lodgements?name=" + roomName + '&checkin=' + checkin + '&checkout='+ checkout;
				} else if (roomName == "null") { //호텔이름 검색 안했을때
					reservation_url = "../lodgements?region=" + regionID + '&checkin=' + checkin + '&checkout='+ checkout;
				} else {
					reservation_url = "../lodgements?name=" + roomName + '&region=' + regionID + '&checkin=' + checkin + '&checkout='+ checkout;
				}
			} 
			
			//호텔 검색했을때 검색 결과 보여주는 ajax
			$.ajax({
				url : reservation_url,
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					console.log(result.data);
					if(result.message == 'Success'){
						data = result.data;
						if(data.length == 0) {
							//검색결과가 없을때
							$('.tabmenu').append(
								"<div class='nohotel'>"
									+"<img src='../images/nohotelicon.png'>"
									+"<p class='noDataMessage'>원하시는 검색결과가 없습니다.</p>"
									+"<p class='nohotelsubTxt'>다시 입력해주세요</p>"
								+"</div>"
							);
						} else{
						 reservationList();
						 reservationCount();
						 ViewSortListNumber();
							
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
		})
		
		if(roomName == "null") { //숙소명 검색안했을때
			$('#searchRoom').val(""); //빈값으로
		} else {
			$('#searchRoom').val(roomName); //검색한 숙소명으로
		}
		
		if(regionID == "null") { //지역 검색 안했을때
			$('#regionResult').val(""); //빈값으로
		} else {
			$('#regionResult').val(regionID); //검색한 지역명으로
		}
		
		if(checkin == "null") { //체크인 날짜 지정 안했을때
			$('#dateSearchCondition').val(""); //빈값으로
		} else {
			$('#dateSearchCondition').val(checkin + " ~ " + checkout); //선택했던 체크인, 체크아웃 날짜로 
		}
		
		
		var regionDetail;
		var region_id_list = [];
			/* searchbar 지역별 호텔 찾기 */
		 $(function() {		
			$.ajax({
				url : "../regions", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				success : function(result){
				
					regionData = result.data;
					console.log(regionData);
					regionDetail = regionData;
					
					for(var i in regionDetail) {
						
						for(var j in regionDetail[i].inner_regions) {
							var regionObject = {
								parent_region_id : regionDetail[i].region_id, //지역id
								parent_region_name : regionDetail[i].region_name, //지역 이름
								children_region_id : regionDetail[i].inner_regions[j].region_id, //구 id
								children_region_name : regionDetail[i].inner_regions[j].region_name //구 이름
							}
							region_id_list.push(regionObject)
						}
					}
					
					regionHotel();
					//hotelRegionDetail();
					
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
		/* 호텔지역이름 append */
		function regionHotel(){
			for(var i = 0; i<regionData.length; i++){
				$('.inmenu').append(
					 "<div class='hotelnavside'>"
	                    +"<div class='hotelnavitem'>"
	                        +"<span class='hoteltextmenu' id='" + regionData[i].region_id + "'>" + regionData[i].region_name + "</span>"
	                    +"</div>"
	                +"</div>"		
				);
			}
			
			if(regionID != "null") { //지역이름을 선택했을때
				//호텔지역이름을 선택한 id 받아오기
				$('.hoteltextmenu').each(function(i) {
					if($(this).attr('id') == regionID) {
						$('#regionResult').val($(this).text());
						$('.locationpop').prepend(
							"<div class = 'prevRegion areaCss' style = 'display: none;'>"
								+"<div>"
									+"<div id = " + regionID + ">"
									+"</div>"
								+"</div>"
							+"</div>"
						)
					}
				})
				/* 지역 id리스틀 filter를 통해 가져오기 */
				var regionList = region_id_list.filter(function(e) {
					return e.children_region_id == regionID;
				})
				
				//지역을 선택했을때 선택한 지역이름을 text에 올리기
				if(regionList.length != 0) { 
					$('#regionResult').val(regionList[0].parent_region_name + "," + regionList[0].children_region_name);
					$('.locationpop').prepend(
						"<div class ='prevRegion zoneCss' style = 'dispaly:none;' id = " + regionList[0].children_region_id + ">"
					)
				}
			}
		}
		
		function hotelRegionDetail(regionId){
			 /* 지역의 id를 통해 그 id의 구들 filter 통해서 가져오기 */
			var regionList = regionDetail.filter(function(e) {
				return e.region_id == regionId;
			})
			
			$('.hotelmaintext *').remove();
				
			for(var j = 0; j < regionList[0].inner_regions.length; j++){
				$('.hotelmaintext').append(
					"<div class='hotel'>"
		    			+"<p class='hotelRegionName' id='" + regionList[0].inner_regions[j].region_id + "'>" + regionList[0].inner_regions[j].region_name + "</p>"
			    	+"</div>"					
				)
			}				
		}
		/* 호텔지역이름을 선택했을때 지역선택 css 추가 */
		$(document).on('click','.hotelRegionName',function(){
			$('.hotelRegionName').removeClass('zoneCss');
			$(this).addClass('zoneCss');
		})
		
		//호텔 구 이름 선택했을때 구 선택 css 추가
		$(document).on('click','.hotelnavside',function(){
			$('.hotelnavside').removeClass('areaCss');
			$(this).addClass('areaCss');
			$('.hotelmaintext').css('background-color','#F9F9F9');
		})
		
		/* 지역 이름 받아오기 */
		$(document).on('click','.hotelnavside', function(){
			var regionId = $(this).children().children().attr('id');
			//var regionName = $(this).children().children().text();
			
			//$('#Area').text(regionName);
			
			/* 지역 이름을 받아오면서 해당지역의 구들도 받아오기 */
			hotelRegionDetail(regionId);
		})
		
		/* 구역 이름 받아오기 */
		/* $(document).on('click','.hotelRegionName', function(){
			var ZoneId = $(this).attr('id');
			var ZoneName = $('#'+ZoneId).text();	
			$('#Zone').text(ZoneName);
		}) */
		
		/* 선택 버튼 누르면 선택한 지역 input text에 올리기 */
		$('#selectRegion').click(function(){
			if($('.areaCss').length == 0) {
				$('#cancelRegion').trigger("click");
			} else {
				$('.prevRegion').removeClass('areaCss');
				$('.prevRegion').removeClass('zoneCss');
				
				//지역,구 id, 이름
				var parent_regionId = $('.areaCss').children().children().attr('id');
				var parent_regionName = $('.areaCss').children().children().text();
				var child_regionId = $('.zoneCss').attr('id');
				var child_regionName = $('.zoneCss').text();
				
				var region_id;
				
				/* var area = $('#Area').text();
				var zone = $('#Zone').text(); */
				//구가 선택안됐을때 지역결과를 선택된 지역 이름으로 지역 text 창에 넣기
				if($('.zoneCss').length == 0) {
					$('#regionResult').val(parent_regionName);
					region_id = parent_regionId;
				} else {
					//선택한 지역, 구 이름 더한 값으로 지역 text 창에 넣기
					$('#regionResult').val(parent_regionName + "," + child_regionName);
					region_id = child_regionId;
				}
				
				/* // area에 담기
				$('#Area').text(parent_regionName);
				// zone에 담기
				$('#Zone').text(child_regionName); */
				
				var urlSearch = new URLSearchParams(location.search);
				urlSearch.set('region', region_id);
				
				console.log(urlSearch.toString());
				location.replace('reservation1?' + urlSearch.toString());

				//지역 모달창 닫기
				$('.locationpop').hide();	
			}
		})
		
		/* input text에 선택해놨던 지역이 있는 상태에서 취소버튼을 누르면 선택되어있던 지역 그대로 유지 */
		$('#cancelRegion').click(function(){
			var regionResult = $('#regionResult').val();
			
			if(regionResult != ""){
				$('#Area').text(regionResult.split(",")[0]);
				$('#Zone').text(regionResult.split(",")[1]);
			}
			
			$('.locationpop').hide();
			RegionSelect(); 
		})
		
		/* 지역 선택 초기화 */
	 	function RegionSelect(){
			var area = $('#Area').text();
			var zone = $('#Zone').text();
			
			// region Result 값을 가져와서
			// 그 값과 같은 text를 가진 태그에 클래스 붙이기
			
			/* 지역의 css를 미리 지우기 */
			$('.hotelnavside').removeClass('areaCss');
			
			/* 지역이름이 area의 이름과 같을때 css 붙이기 */
			$('.hoteltextmenu').each(function(i){
				if($(this).text() == area){
					$(this).parent().parent().addClass('areaCss');
				}
			})
			/* areaCss가 붙어있는 것의 상위(2)의 div의 id를 가져온다 */
			var sido = $('.areaCss').children().children().attr('id');
			/* 구를 받아오는 함수에 sido를 넣어서 실행 */
			hotelRegionDetail(sido);
		
			$('.hotelRegionName').removeClass('zoneCss');
			/* 호텔지역이름의 text 값이 구의 text값과 같을때 zoneCss 추가 */	
			$('.hotelRegionName').each(function(i){
				if($(this).text() == zone){
					$(this).addClass('zoneCss');
				}
			})
		} 
		
		/* 호텔 아이콘 클릭했을때 지역선택팝업창 보여주기*/
		$(document).on('click', '#hotel', function() {
			
			if($('.locationpop').css('display') == 'none'){
				$('.locationpop').show();
			} 
		})
		/* 지역선택창을 선택했을때 지역선택팝업창 보여주기*/
		$(document).on('click', '#regionResult', function() {
			
			if($('.locationpop').css('display') == 'none'){
				$('.locationpop').show();
			} 
		})
	</script>
	<script>
		
		$(function() {
			/* 최근검색숙소 보여주는 ajax */
			$.ajax({
				url : "../recents", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					
					if(result.message == 'Success'){
						recentData = result.data;
						recentSearchRoom();
						 
						console.log(recentData);
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
		/* 날짜선택 팝업 보여주는 팝업 */
		function s_show() {
			makeCalendar(0);
			document.querySelector(".popup").className = "popup show";
		}
		//날짜선택 팝업 닫는 함수
	    function close2 () {document.querySelector(".popup").className = "popup";}
	
	</script>
	
	<script>
		$(document).on('click', '.date', function(){
			
			if(isCheckinSelect) {
				isCheckinSelect = false;
				
				var dateString = $('#year').text() + "." + ('0' + $('#month').text()).slice(-2) + '.' + ('0' + $(this).text()).slice(-2);

				storedCheckinDate = dateString;
				storedCheckoutDate = dateString;
				
			} else {
				var dateString = $('#year').text() + "." + ('0' + $('#month').text()).slice(-2) + '.' + ('0' + $(this).text()).slice(-2);
				
				if (compareDate(storedCheckinDate, dateString) <= 0) {
					storedCheckinDate = dateString;
					storedCheckoutDate = dateString;
				} else {
					isCheckinSelect = true;
					storedCheckoutDate = dateString;
				}
			}
			/* if($('#selectState').text() == "login") {
				$('#selectState').text("logout");
				
				var dateString = $('#year').text() + "." + $('#month').text() + "." + $(this).text();
				$('#checkinDate').text(dateString);
				$('#checkoutDate').text(dateString);
				
			} else if($('#selectState').text() == "logout") {
				var dateString = $('#year').text() + "." + $('#month').text() + "." + $(this).text();
				
				if (compareDate($('#checkinDate').text(), dateString) <= 0) {
					$('#checkinDate').text(dateString);
					$('#checkoutDate').text(dateString);
				} else {
					$('#selectState').text("login");
					$('#checkoutDate').text(dateString);
				}
			} */
			
			clickedDate();
		})
	</script>
	
	<script type="text/javascript">
		/* 달력만드는 함수 */
		function makeCalendar(moveMonth) {
			$('.dates').children().remove();
			
			if(moveMonth == 0) {
				var checkinDate = storedCheckinDate;
				var checkoutDate = storedCheckoutDate;
				
				if (checkinDate == "" || checkoutDate == "") {
					$('#year').text(<%=todayYear%>);
					$('#month').text(<%=todayMonth%>);
				} else {
					$('#year').text(checkinDate.split(".")[0]);
					$('#month').text(checkinDate.split(".")[1]);
				}
			}
			
			var year = $('#year').text();
			var month = $('#month').text()*1 + moveMonth;
			
			if (month >= 13) {
				year++;
				month = 1;
			} else if (month <= 0) {
				year--;
				month = 12;
			}
			
			$('#year').text(year);
			$('#month').text(month);
			
			if(year == <%=todayYear%> && month == <%=todayMonth%>) {
				$('#prevBtn').css("visibility", "hidden");
			} else {
				$('#prevBtn').css("visibility", "visible");
			}
			
			if(year == <%=threeMonthDayYear%> && month == <%=threeMonthDayMonth%>) {
				$('#nextBtn').css("visibility", "hidden");
			} else {
				$('#nextBtn').css("visibility", "visible");
			}

			//	1일의 요일을 계산한다(자주 쓰이기 때문에 변수로 선언해두기)
			var first = weekDay(year, month, 1);

			//	1일이 출력될 위치 전에 전달의 마지막 날짜들을 넣어주기위해 전 달날짜의 시작일을 계산한다.
			var start = 0;
			start = month == 1 ? lastDay(year - 1, 12) - first : lastDay(year, month - 1) - first;

			//	1일이 출력될 위치를 맞추기 위해 1일의 요일만큼 반복하여 전달의날짜를 출력한다.
 			for (var j = 1; j <= first; j++) {
 				$('.dates').append("<div class = 'before' style = 'pointer-events: none;'></div>");
			}
			
			/* 1일부터 달력을 출력한 달의 마지막 날짜까지 반복하며 날짜를 출력 */
			for (var i = 1; i <= lastDay(year, month); i++) {
				if ((year == <%=todayYear%> && month == <%=todayMonth%> && i < <%=todayDate%>) 
						|| (year == <%=threeMonthDayYear%> && month == <%=threeMonthDayMonth%> && i > <%=threeMonthDayDate%>)) {
					/* 요일별로 색깔 다르게 해주기위해 td에 class 태그걸어주기 */
					switch (weekDay(year, month, i)) {
					// 0일 1월 2화 3수 4목 5금 6토요일
					case 0:
						$('.dates').append(
								"<div class ='invalid-sun invalid-date'>" 
									+ "<span class = 'sun-font'>" + i + "</span>" +
								"</div>");
						break;
					case 1:
						$('.dates').append(
								"<div class ='invalid-mon invalid-date'>"
									+ "<span class = 'etc-font'>" + i + "</span>" +												
								"</div>");
						break;
					case 2:
						$('.dates').append(
								"<div class ='invalid-tue invalid-date'>"
									+ "<span class = 'etc-font'>" + i + "</span>" +											
								"</div>");
						break;
					case 3:
						$('.dates').append(
								"<div class ='invalid-wen invalid-date'>" 
									+ "<span class = 'etc-font'>" + i + "</span>" +													
								"</div>");
						break;
					case 4:
						$('.dates').append(
								"<div class ='invalid-thu invalid-date'>" 
									+ "<span class = 'etc-font'>" + i + "</span>" +													
								"</div>");
						break;
					case 5:
						$('.dates').append(
								"<div class ='invalid-fri invalid-date'>"
									+ "<span class = 'etc-font'>" + i + "</span>" +												
								"</div>");
						break;
					case 6:
						$('.dates').append(
								"<div class ='invalid-sat invalid-date'>"
									+ "<span class = 'sat-font'>" + i + "</span>" +
								"</div>");
						break;
					}
					
					/* 출력한 날짜(i)가 토요일이고 그달의 마지막 날짜이면 줄을 바꿔주기 */
					if (weekDay(year, month, i) == 6 && i != lastDay(year, month)) {
						$('.dates').append("<div></div>");
					}
				} else {
					/* 요일별로 색깔 다르게 해주기위해 td에 class 태그걸어주기 */
					switch (weekDay(year, month, i)) {
					// 0일 1월 2화 3수 4목 5금 6토요일
					case 0:
						$('.dates').append(
								"<div class ='sun date'>" 
									+ "<span class = 'sun-font'>" + i + "</span>" +
								"</div>");
						break;
					case 1:
						$('.dates').append(
								"<div class ='mon date'>"
									+ "<span class = 'etc-font'>" + i + "</span>" +												
								"</div>");
						break;
					case 2:
						$('.dates').append(
								"<div class ='tue date'>"
									+ "<span class = 'etc-font'>" + i + "</span>" +											
								"</div>");
						break;
					case 3:
						$('.dates').append(
								"<div class ='wen date'>" 
									+ "<span class = 'etc-font'>" + i + "</span>" +													
								"</div>");
						break;
					case 4:
						$('.dates').append(
								"<div class ='thu date'>" 
									+ "<span class = 'etc-font'>" + i + "</span>" +													
								"</div>");
						break;
					case 5:
						$('.dates').append(
								"<div class ='fri date'>"
									+ "<span class = 'etc-font'>" + i + "</span>" +												
								"</div>");
						break;
					case 6:
						$('.dates').append(
								"<div class ='sat date'>"
									+ "<span class = 'sat-font'>" + i + "</span>" +
								"</div>");
						break;
					}
					
					/* 출력한 날짜(i)가 토요일이고 그달의 마지막 날짜이면 줄을 바꿔주기 */
					if (weekDay(year, month, i) == 6 && i != lastDay(year, month)) {
						$('.dates').append("<div></div>");
					}
				}

			}
			
			if (weekDay(year, month, lastDay(year, month)) != 6) {
				for (var i = weekDay(year, month, lastDay(year, month)) + 1; i < 7; i++) {
					$('.dates').append("<div></div>");
				}
			}
			
			clickedDate();
		}
	
	</script>
	
	<script type="text/javascript">
		function isLeapYear(year) {
			return (year % 4 ==0) && (year % 100 !=0) ||(year % 400 ==0);
		}
		
		function lastDay(year, month) {
			var m = [31,28,31,30,31,30,31,31,30,31,30,31];
			m[1]=isLeapYear(year)? 29:28;
			return m[month-1];
		}
		
			
		function totalDay(year, month, day) {
			var sum = (year-1)*365 + parseInt((year-1)/4) - parseInt((year-1)/100) + parseInt((year-1)/400);
			for (var i = 1; i < month; i++) {
				sum += lastDay(year,i);
			}
			return sum + day;
		}
	
		function weekDay(year, month, day) {
			return totalDay(year, month, day) % 7;
		}
		
		// yyyy-mm-dd 형식의 날짜 비교(m, d 한자리도 가능), first가 더 클 경우 -1, second가 더 클 경우 1, 같으면 0
		function compareDate(firstDate, secondDate) {
			var firstDateList = firstDate.split(".");
			var secondDateList = secondDate.split(".");
			
			if(firstDateList[0] == secondDateList[0]) {
				if (parseInt(firstDateList[1]) == parseInt(secondDateList[1])) {
					if(parseInt(firstDateList[2]) == parseInt(secondDateList[2])) {
						return 0;
					} else if (parseInt(firstDateList[2]) > parseInt(secondDateList[2])) {
						return -1;
					} else {
						return 1;
					}
				} else if (parseInt(firstDateList[1]) > parseInt(secondDateList[1])){
					return -1;
				} else {
					return 1;
				}
			} else {
				return secondDateList[0] - firstDateList[0];
			}
		}
		
		function clickedDate() {
			var dateList = $('.date').toArray();
			
			if (storedCheckinDate == "" || storedCheckoutDate == "") {
				for (var i in dateList) {
					$(dateList[i]).removeClass("clicked");
				}
			}
			
			for (var i in dateList) {
				var dateString = $('#year').text() + "." + ('0' + $('#month').text()).slice(-2) + '.' + ('0' + $(dateList[i]).text()).slice(-2);
				
				if ((compareDate(storedCheckinDate, dateString) >= 0) 
						&& (compareDate(storedCheckoutDate, dateString) <= 0)) {
					$(dateList[i]).addClass("clicked");
				} else {
					$(dateList[i]).removeClass("clicked");
				}
			}
		}
	</script>
	
	<script type="text/javascript">
		$('#prevBtn').click(function () {
			makeCalendar(-1);
		});
		
		$('#nextBtn').click(function () {
			makeCalendar(1);
		});
		
		$('#selectBtn').click(function () {
			var checkinDate = storedCheckinDate;
			var checkoutDate = storedCheckoutDate;
			
			if (checkinDate != "" && checkoutDate != "") {
			// 체크인, 체크아웃 날짜가 같을때
			if(checkinDate == checkoutDate) {
				var selectDate = checkinDate.split(".");
				// 월에 마지막 날이면
				if(selectDate[2] == lastDay(selectDate[0], selectDate[1])){
					// 12월이면 연도를 +1
					if(selectDate[1] == "12") {
						checkoutDate = (parseInt(selectDate[0])+1) + ".01" +".01"
					// 아니면 월 +1
					} else {
						/* checkoutDate = selectDate[0] + "." + (parseInt(selectDate[1]) +1) +".1" */
						checkoutDate = selectDate[0] + "." + ('0' + (parseInt(selectDate[1]) + 1)).slice(-2) +".01"
					}
				// 아니면 일+1
				} else {
					checkoutDate = selectDate[0] + "." + selectDate[1] + "." + ('0' + (parseInt(selectDate[2])+1)).slice(-2);  
				}
				
				isCheckinSelect = true;
				storedCheckoutDate = checkoutDate;
			}
				$('#dateSearchCondition').val(checkinDate + " ~ " + checkoutDate);
			}
			var urlSearch = new URLSearchParams(location.search);
			urlSearch.set('checkin', checkinDate);
			urlSearch.set('checkout', checkoutDate);
			
			location.replace('reservation1?' + urlSearch.toString());
			
			close2();
		});
		
		$('#cancelBtn').click(function () {
			var dateSearchCondition = $('#dateSearchCondition').val();
			
			if (dateSearchCondition != "") {
				$('#checkinDate').text(dateSearchCondition.split(" ~ ")[0]);
				$('#checkoutDate').text(dateSearchCondition.split(" ~ ")[1]);
			}
			
			close2();
		});
	</script>
	

</body>
</html>