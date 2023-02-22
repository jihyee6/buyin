<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="호텔예약사이트 바이인호텔입니다.">
<meta property="og:type" content="website"> 
<meta property="og:title" content="바이인호텔">
<meta property="og:description" content="호텔예약사이트 바이인호텔입니다.">
<meta property="og:url" content="https://www.buyinhotel.co.kr/">
<meta name="twitter:title" content="바이인호텔">
<meta name="twitter:card" content="summary">
<meta name="twitter:description" content="호텔예약사이트 바이인호텔입니다.">
<meta name="keywords" content="숙박업소깔끔한곳, 깔끔한숙박업소추천,분위기좋은숙박업소, 숙박업소입실, 숙박업소퇴실, 저렴한숙박업소추천, 아이데리고갈만한숙박업소, 병원근처숙소, 호텔예약사이트추천, 호텔예약저렴한곳, 호텔예약포인트, 호텔예약어플, 국내호텔예약, 숙소예약어플, 호텔쿠폰예약, 호텔예약앱추천, 호텔예약하기, 숙박예약하는법,호텔예약할인받는법, 숙박예약할인받는법, 숙박비용, 호텔비용, 숙소예약어떻게하나요, 호텔예약어떻게하나요, 호텔예약사이트순위, 숙박사이트, 호텔특가, 호텔예약싸게하는법, 숙박어플추천, 당일예약호텔, 당일호텔예약, 국내숙박예약사이트, 바이인호텔, 이끌림">
<meta name="robots" content=“index”>
<meta name="robots" content="follow">
<title>바이인호텔</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/calender.css">
<link rel="stylesheet" href="css/slide_20220929.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.slide ul, li {
	list-style: none;
}

#slide {
	height: 80%;
	position: relative;
	overflow: hidden;
}

#slide ul {
	width: 400%;
	height: 100%;
	transition: 1s;
}

#slide ul:after {
	content: "";
	display: block;
	clear: both;
}

#slide li {
	float: left;
	width: 25%;
	height: 400px;
}

/* #slide li:nth-child(1) {
	background-image: url('images/banner1.png');
}

#slide li:nth-child(2) {
	background-image: url('images/banner2.png');
} */

#slide input {
	display: none;
}

#slide label {
	display: inline-block;
	vertical-align: middle;
	width: 10px;
	height: 10px;
	transition: 0.3s;
	border-radius: 50%;
	cursor: pointer;
}

#slide .pos {
	text-align: center;
	position: absolute;
	bottom: 10px;
	left: 0;
	width: 100%;
	text-align: center;
}

#pos1:checked ~ul {
	padding: 0px;
	margin-left: 0%;
}

#pos2:checked ~ul {
	margin-left: -100%;
}

#pos1:checked ~.pos>label:nth-child(1) {
	background-image: url('images/mainimg/pass1.png');
}

#pos2:checked ~.pos>label:nth-child(2) {
	background-image: url('images/mainimg/pass2.png');
}

.search {
	position: relative;
	top: -30px;
	display: flex;
	width: 1200px;
	height: 100px;
	margin: auto;
	list-style: none;
	background-color: white;
	box-shadow: 2px 2px 5px 0px grey;
	border-radius: 13px;
}

.search>li {
	flex: 1;
	height: 80px;
	color: #707070;
}

.search>li>.searchbar {
	text-align: left;
	height: 77px;
	margin: 5px 0px 0px 20px;
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
	line-height: 82px;
}

.searchbox {
	width: 225px;
	border: 0 solid;
	font-size: 16px;
	cursor: pointer;
}

.recommand, .event, .app {
	text-align: center;
}

.recommand {
	width: 1365px;
	height: 427px;
	margin: 44px auto;
}

.event {
	width: 1365px;
	height: 498px;
	margin: 34px auto;
}

.h2n {
	font-size: 30px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.h2o {
	font-size: 30px;
	margin: 20px;
}

.app {
	width: 1903px;
	height: 402px;
	color: #FFFFFF;
	/* background-color: #242424; */
	margin-bottom: 140px;
}

.appinfo {
	width: 762px;
	padding: 60px;
	text-align: left;
	margin-right: 358px;
}

#stext {
	font-size: 30px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.swiper{
	margin-top: 70px;
	position: relative;
}
.swiper2{
	position: relative;
}

.swiperimgs2{
	display: flex;
	margin: 45px 105px;
}

.swiperimgs2 a{
	margin: auto 15px;
	text-decoration: none;
	color: #242424;
	text-align: left;
}

.swiperimgs2 img{
	width: 549px;
	/* height: 269px; */
}

.swiper button{
	border: none;
	background: white;
	margin-top: -167px;
	cursor: pointer;
}
.swiper2 button{
	border: none;
	background: white;
	margin-top: -304px;
	cursor: pointer;
}

.etitle{
	margin-top: 10px;
	font-size: 24px;
	color: #242424;
	font-family: NanumBarunGothic;
}

.esub{
	font-size: 18px;
	color: #343434;
	font-family: NanumBarunGothic;
}
.esub span{
	color: #8D6334;
	font-weight: bold;
}

.appimg{
	float: left;
	/* margin-top: -140px;
	margin-left: -260px; */
}

.swiperimgs{
	position: relative;
	margin: 12px;
	cursor: pointer;
}

.swiperText{
	font-family: Gmarket;
	line-height: 29px;
	text-align: left;
	color: white;
	position: absolute;
	z-index: 1;
	bottom: 10%;
	left: 5%;
}

.swiperText h4{
	font-size: 29px;
}

.swiperText p{
	font-size: 14px;
}

.swiperbox{
	display: flex;
	width: 83%;
}

.eventMore{
	font-family: SEGOEUI;
	font-size: 14px;
	color: #707070;
	cursor: pointer;
}

.bannerImg {
	height: 242px;
	border-radius: 18px;
	filter: brightness(50%);
	width: 361px;
}

.popup {
	position: absolute;
	background-color: #ffffff;
	border-radius: 4px;
	display: none;
	border: 1px solid #A4A4A4;
	box-shadow: 0px 0px 5px gray;
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

#close , #close2{
    float: right; 
    position: relative;
    transform: translate(-7px, 21px);
    width: 35px;
    height: 35px;       
    cursor: pointer;                 
}

.hotelnavbar {
	cursor: pointer;
	float: left;
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

.locationpop{
    border: 1px solid #A4A4A4;
    height: 360px;
    margin-top: 18px;
    display: none;
    background-color: white;
    z-index: 1000;
    border-radius: 4px;
}

.hotelName{
    font-size: 16px;
}

.hotelLocation{
    font-size: 12px;
}
 .slideShow{
    width: 86%;
    height: 296px;
    position: relative;
    margin: 30px auto;
    overflow: hidden;
}
.slides, .slides2{
    position: absolute;
    left: -10px;
    top: 0;
    transition: left 0.5s;
}
.slides li:not(:last-child){
    float: left;
    margin-right: -7px;
}
.slides li{
    float: left;
}

.slides2 li{
	float: left;
	margin-right: 40px;
}
.controller span, .controller2 span{
    position: absolute;
    background: transparent;
    color: black;
    text-align: center;
    border-radius: 50%;
    padding: 10px 20px;
    font-size: 1.3rem;
    cursor: pointer;
    
}

.controller span{
	top: 30%;
}

.controller2 span{
	top: 38%;
}


.prev, .prev2{
    left: 2px;
}

.next, .next2{
    right: -36px;
}
.hotelRegionName{
	font-size: 16px;
	color: #242424;
	font-family: NanumSquare_ac;
	cursor: pointer;
}
.regionSelectBtn{
	position: absolute;
	bottom: 0px;
	width: 100%;
	height: 50px;
	line-height: 54px;
	text-align: center;
	background-color: white;
}
.regionSelectBtn button{
	width: 78px;
	height: 26px;
	background-color: white;
	border: none;
	font-size: 14px;
	margin: 0px 8px;
}
.areaCss{
	font-weight: bold;
	font-size: 18px;
	background-color: #F9F9F9;
	color: #4366A3;
	width: 75px;
	height: 48px;
	text-align: center;
	line-height: 48px;
}
.zoneCss{
	font-weight: bold;
	font-size: 18px;
	color: #4366A3;
}
.calendarBtn button{
	background-color: white;
	width: 30%;
	border: none;
	font-size: 14px;
	font-family: NanumSquare_ac;
}
.downloadLink{
	position: absolute;
	display: flex;
	transform: translate(699px, -230px);
	cursor: pointer;
}
.eimg{
	cursor: pointer;
}
.hotel{
	padding: 14px;
	width: revert;
	height: revert;
	line-height: revert;
}

</style>

<title>BUY IN HOTEL</title>
</head>
<body>
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
	
	String id = (String) session.getAttribute("id");
%>
<div class="page" style="height: 100%;">
 <header>
		<div class="wrapper">
			<div class='header_wrap'>
				<!-- 로그인 상태가 아닐때 헤더 -->
				<%if(id == null) {%>
				<div id="logo">
					<a href="index"><img class='mainLogoImg' src="images/mainimg/logo.png"></a>
				</div>
				<nav class="main_nav">
					<ul id="main-menu">
						<li><a onclick = 'searchHotel()' style = 'cursor: pointer;'>예약하기</a></li>
						<li><a href="seemore/notice">더보기</a>
							<ul id="submenu2">
								<li><a href="seemore/notice">공지사항</a></li>
								<li><a href="seemore/selectGiftcard">선물하기</a></li>
								<li><a href="mypage/benefits">회원등급혜택</a></li>
								<li><a href="seemore/event">이벤트</a></li>
								<li><a href="seemore/faq">FAQ</a></li>
								<li><a href="seemore/policy">약관 및 정책</a></li>
							</ul></li>
						<li> <a href="loginpage/login">로그인</a></li>
						<li><a href="mypage/gift"><img src="images/icon/giftBox.png"></a></li>
					</ul>
				</nav>
				<%} else {%>
				<!-- 로그인 상태일때 헤더 -->
				<div id="logo">
					<a href="index"><img class='mainLogoImg' src="images/mainimg/logo.png"></a>
				</div>
				<nav class="main_nav">
					<ul id="main-menu">
						
						<li><a onclick = 'searchHotel()' style = 'cursor: pointer;'>예약하기</a></li>
						<li><a href="seemore/notice">더보기</a>
							<ul id="submenu2">
								<li><a href="seemore/notice">공지사항</a></li>
								<li><a href="seemore/selectGiftcard">선물하기</a></li>
								<li><a href="seemore/event">이벤트</a></li>
								<li><a href="seemore/benefits">회원등급혜택</a></li>
								<li><a href="seemore/faq">FAQ</a></li>
								<li><a href="seemore/policy">약관 및 정책</a></li>
							</ul>
						</li>
						<li><a href="mypage/shoppingBasket">장바구니</a></li>
						<li class="loginMypage"><a href="mypage/info">마이페이지</a>
							<ul id="submenu">
								<li><span class="userName" id='headerName'></span>님</li>
								<li><a href="mypage/info">내정보</a></li>
								<li><a href="mypage/point">포인트 · 쿠폰</a></li>
								<li><a href="mypage/gift">선물함</a></li>
								<li><a href="mypage/shoppingBasket">장바구니</a></li>
								<li><a href="mypage/recentSearch">최근 검색 숙소</a></li>
								<li><a href="mypage/wish">위시리스트</a></li>
								<li><a href="mypage/Myreservation">예약·취소내역</a></li>
								<li><a href="mypage/review">나의리뷰</a></li>
								<li onclick = 'location.href = "WebLogoutCon.Webdo"'>로그아웃</li>
							</ul>
						</li>
						<li><a href="mypage/gift"><img src="images/icon/giftBox.png"></a></li>
					</ul>
				</nav>
				<%}%>
				</div>
			</div>	
	</header>

		<div class="content" style = 'padding-bottom: 40px;'>
			<div class="banner">
				<div id="slider-wrap">
		            <ul id="slider" style = "margin:0px; padding:0px;">
		            	<!-- 배너 추가시 <li>써서 똑같이 밑에 붙여넣기 -->
		            	<!-- 메인 배너 이미지 append -->
		            </ul>
		
		            <!--controls 배너 이미지 이전, 이후 배너로 이동-->
		            <div class="btns" id="next"><i aria-hidden ='true'><img src="images/mainimg/pass2.png" style="height: 36px; margin-top: 12px;"></i></div>
		            <div class="btns" id="previous"><i aria-hidden ='true'><img src="images/mainimg/pass1.png" style="height: 36px; margin-top: 12px;"></i></div>
					
					<!-- 몇번째 배너인지 보여주는 아이콘 -->
		            <div id="pagination-wrap" >
		                <ul>
		                </ul>
		            </div>
		        </div>
			</div>
			<!-- 숙소검색 div -->
			<ul class="search">
				<li>
					<div class="searchbar">
						<p>숙소명 검색</p>
						<div id="textbox">
							<input type="text" placeholder="검색어를 입력해주세요." class="searchbox" id ='searchRoom'>
							<img src="images/mainimg/glass1.png">
						</div>
					</div>
				</li>

				<li>
				<div class="searchbar">
					<p>호텔 또는 지역</p>
					<div id="textbox">
						<input type="text" placeholder="호텔 또는 지역을 선택해주세요."  id = 'regionResult' class="searchbox" readonly>
						<img id="hotel" src="images/mainimg/locationimg.png">
					</div>
				</div>
				<!-- 호텔/지역 선택시 나오는 팝업 -->
				  <div class="locationpop" style="position: relative">
				  	<span id = 'Area' style='display: none;'></span>
				  	<span id = 'Zone' style='display: none;'></span>
					    <aside>
					        <div class="hotelnavbar">
					            <nav class="inmenu" style='overflow-y: auto; height: 310px;'>
					            	<!-- 지역 (왼쪽 사이드)-->
					            </nav>
					        </div>
					    </aside>
					    	<!-- 구(오른쪽 사이드) -->
					    <div class="hotelmaintext" style='overflow-y: auto; background-color: rgb(249,249,249); height: 310px;'>
					    
					    </div>
					    <div class='regionSelectBtn'>
				        	<button type='button' id = 'selectRegion'>선택</button>
				        	<button type='button' id = 'cancelRegion'>취소</button>
					    </div>
					</div>
				</li>
			<!-- 날짜 선택, 달력 팝업 -->
				<li>
					<div class="searchbar">
						<p>날짜 선택</p>
						<div id="textbox" onclick="s_show();">
							<input type="text" placeholder="날짜를 선택해주세요." class="searchbox" id="dateSearchCondition" readonly> 
							<img src="images/mainimg/calendarimg.png">
						</div>
					</div>
					
					<div class="window" style="position:relative; margin-top: 16px;">
						<div class="popup">
							<span id="selectState" style="display: none">login</span>
							<span id="checkinDate" style="display: none"></span>
							<span id="checkoutDate" style="display: none"></span>
			
							<div class="navc" style = "color:white">
								<!-- 이전달 버튼 만들기 -->
								<div style = "padding: 8px 0px;">
									<button class="navc-btn" id="prevBtn" style = "float:left;">
									<img src = "images/prev.png" style = "width:16px; vertical-align: top;"></button>
									<!-- 제목 만들기 -->
									<div class ="year-month" style = "float:left;">
										<span id="year"></span>년&nbsp;
										<span id="month"></span>월
									</div>
							
									<!-- 다음달 버튼 만들기 -->
									<button class="navc-btn" id="nextBtn" style = "float:left;">
									<img src = "images/next.png" style = "width:16px; vertical-align: top;"></button>
								</div>
							</div>
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
							<!-- 날짜 선택, 취소 버튼 -->
							<div class='calendarBtn' style="display:flex; margin-bottom:10px">
								<button id="selectBtn">선택</button>
								<button id="cancelBtn">취소</button>
							</div>
						</div>
					</div>
				</li>
				<li>
					<!-- 입력한 내용으로 검색하기 -->
					<div class="sbar" onclick="searchHotel()">
						<span id="stext">SEARCH</span>
					</div>
				</li>
			</ul>
			
			<!-- 숙소추천 div -->
			<div class="recommand">
				<h2 class="h2n">숙소추천</h2>
				<div class="swiper">
					<div class="slideShow">
						<div class="swiperbox">
							<ul class="slides">
							<!-- 숙소추천 append -->
							</ul>
						</div>	
					</div>
					<!-- 숙소 슬라이드 이동 버튼 div -->
					<p class="controller">
			            <span class="prev"><img src="images/mainimg/arrleft.png"></span>
			            <span class="next"><img src="images/mainimg/Right.png"></span>
			        </p>   
				</div>
			</div>
			<div class="event" style = 'height: 400px;'>
				<h2 class="h2n">EVENT&amp;PROMOTION</h2>
				<span class="eventMore" onclick="location.href='seemore/event'">more ></span>
				<div class="swiper2">
					<div class="slideShow">
						<div class="swiperimgs2">
							<ul class="slides2">
							<!-- 이벤트 내용 append -->
							</ul>				
						</div>
					</div>
					<!-- 이벤트 슬라이드 div -->
					<p class="controller2">
			            <span class="prev2"><img src="images/mainimg/arrleft.png"></span>
			            <span class="next2"><img src="images/mainimg/Right.png"></span>
				    </p>   
				</div>
			</div>
			<div class="app">
				<!-- 앱 다운로드 관련 내용 div -->
				<div class="appimg">
					<img src="images/mainimg/appLink2.png" class="phoneimg" style = 'width: 100%; position: relative;'>
					<!-- 구글플레이, 앱스토어 다운로드 링크 div -->
					<div class='downloadLink'>
						<img src='images/google.png' onclick='location.href="https://play.google.com/store/apps/details?id=com.adiot.ekklim&hl=kr"'>
						<img src='images/apple.png' onclick='location.href="https://apps.apple.com/kr/app/buyinhotel/id1621448647"'>
					</div>	
				</div>
			</div>
		</div>
		<!-- 푸터 section -->
		<footer>
			<div class="footer">
				<div class="foot">
					<!-- footer logo div -->
					<div class="flogo">
						<img src="images/newfooter.png" alt="address">
					</div>
					&nbsp;&nbsp;
					<div class="v1" style='height: 200px;'></div>
					<div class="address">
						<a href="../seemore/policy.jsp" target="_blank">Terms and Conditions</a>&nbsp;|&nbsp;<a href="../seemore/personal.jsp" target="_blank"><strong>Personal information processing policy</strong></a>
						<br><a onclick="onopen()"target="_blank">Confirmation of business information</a>&nbsp;|&nbsp;<a href="../seemore/youth.jsp"  target="_blank">a adolescent protection policy</a>&nbsp;|&nbsp;<a href="../seemore/locationterms.jsp"  target="_blank">Location information use slightly</a>
						<br>
						<br>Buy in Hotel Co., Ltd&nbsp;|&nbsp;Business registration number: 627-81-02234&nbsp;|&nbsp;Mail order business report: Dong-gu, Gwangju-0024
						<br>Address:Room 1109, 11th floor, 58, Nonhyeon-ro 85-gil, Gangnam-gu, Seoul (Yeoksam-dong, Gangnam Rudens Officetel)
						<br>CEO: Lim Jae Ok&nbsp;|&nbsp;
						<br>Buy in Hotel Co., Ltd. is responsible for all transactions such as responsibility, delivery, exchange, refund, and civil complaints.
						<br>(Complaint Officer: Lim Jae Ok / Contact information: 1533-3152)
						<br>
		
						<div class="snsLogo">
							<img src="../images/icon/instagram.png" onclick="window.open('https://www.instagram.com/buy_in_hotel/')">
							<img src="../images/icon/naver.png" onclick="window.open('https://blog.naver.com/buyinhotel')">
						</div>

					</div>
				</div>
			</div>
		</footer>	
<script>
//current position
var pos = 0;
var sliderWidth = $('#slider-wrap').width();
var totalSlides;
/* 메인배너 슬라이드 함수 */
function banner_slide() {
	
	//number of slides
	
	//get the slide width
	
	/*****************
	 BUILD THE SLIDER
	*****************/
	//set width to be 'x' times the number of slides
	$('#slider-wrap ul#slider').width(sliderWidth * totalSlides);

	//next slide  
	$('#next').click(function() {
		slideRight();
	});

	//previous slide
	$('#previous').click(function() {
		slideLeft();
	});



	/*************************
	 //*> OPTIONAL SETTINGS
	************************/
	//automatic slider
	// 2000시간
	var autoSlider = setInterval(slideRight, 2000);

	//for each slide 
	$.each($('#slider-wrap ul li'), function() {

		//create a pagination
		var li = document.createElement('li');
		$('#pagination-wrap ul').append(li);
	});

	//counter
	countSlides();

	//pagination
	pagination();

	//hide/show controls/btns when hover
	//pause automatic slide when hover
	$('#slider-wrap').hover(
		function() { $(this).addClass('active'); clearInterval(autoSlider); },
		function() { $(this).removeClass('active'); autoSlider = setInterval(slideRight, 4000); }
	);
}

/***********
 SLIDE LEFT
************/
/* 왼쪽 버튼 클릭시 이전 배너로 이동*/
function slideLeft() {
	
	pos--;
	if (pos == -1) { pos = totalSlides - 1; }
	$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

	//*> optional
	countSlides();
	pagination();
}

/************
 SLIDE RIGHT
*************/
/* 오른쪽 버튼 클릭시 다음 배너로 이동 */
function slideRight() {
	console.log(totalSlides);
	
	pos++;
	if (pos == totalSlides) { pos = 0; }
	$('#slider-wrap ul#slider').css('left', -(sliderWidth * pos));

	//*> optional 
	countSlides();
	pagination();
}




/************************
 //*> OPTIONAL SETTINGS
************************/
function countSlides() {
	 
	$('#counter').html(pos + 1 + ' / ' + totalSlides);
}

function pagination() {
	$('#pagination-wrap ul li').removeClass('active');
	$('#pagination-wrap ul li:eq(' + pos + ')').addClass('active');
}

</script>
	<script language="JavaScript">
	/* 사업자 정보 열리는 함수 */
		function onopen()
		{
		var url =
		"http://www.ftc.go.kr/bizCommPop.do?wrkr_no=6278102234";
		window.open(url, "_blank");
		}
	</script>
	<script>
		/* 이벤트 배너 append */
		function eventBanner() {
			var max_event_index = dataEvents.length;
			var eventLength = 700 * max_event_index;

			/* 이벤트 배너 append */
			for(var i = 0; i < max_event_index; i++){
				$('.slides2').append(
					"<li>"
						+"<a onclick = 'newEventScreen(\"" + dataEvents[i].event_contents_url.replace(".jsp", "_web.jsp") + "\")' class='eimg'>"
						+ "<div class='ex'>"
							+ "<img alt='' src='" + dataEvents[i].event_img_url + "'>"
						+ "</div>"					
						+ "</a>"
					+"</li>"
				);
				/* 메인 배너 이미지 append */
				$('#slider').append(
					"<li id='bannerImg" + i + "'>"
						+"<img src='" + dataEvents[i].event_img_url.split("event/")[0] + "event/top_" + dataEvents[i].event_img_url.split("event/")[1] + "'>"
					+"</li>"
				) 				
				//배너이미지 클릭하면 해당 팝업 보여주기
				$('#bannerImg'+i).attr('onclick', 'newEventScreen(' + "\"" + dataEvents[i].event_contents_url.replace(".jsp", "_web.jsp") + "\"" + ')')
			}+-
			
			$('.slides2').css('width',eventLength);
			
			totalSlides = $('#slider-wrap ul li').length;
			banner_slide();
		}
		/* 숙소추천 append 함수 */
		function bannerRoom() {
			var max_thumb_index = dataLodgements.length;
			var bannerLength = 387 * max_thumb_index;
			
			for(var i = 0; i < max_thumb_index; i++){
			$('.slides').append(
					"<li>"
						+"<div class='swiperimgs' onclick='recommandNext(" + dataLodgements[i].lodgement_id + ")'>"
							+ "<img src='" + dataLodgements[i].lodgement_img_url + "' class = 'bannerImg'>"
							+ "<div class='swiperText'>"
								+ "<h4>" + dataLodgements[i].lodgement_name + "</h4>"
							+ "</div>" 
						+ "</div>"
					+"</li>"
				);
			}
			$('.slides').css('width', bannerLength);
	}
		/* 추천 숙소 클릭시 해당 숙소 설명 페이지로 이동 */
		function recommandNext(lodgement_id) {
			var todayString = '<%=todayString%>';
			var tomorrowString = '<%=tomorrowString%>';
			location.href = './lodgement/' + lodgement_id + '?checkin=' + todayString + '&checkout=' + tomorrowString;
			
		}
	
	</script>
	<script>
	/* 지역 선택 팝업의 지역 append */
	function regionHotel(){
		for(var i = 0; i<data.length; i++){
			$('.inmenu').append(
				 "<div class='hotelnavside'>"
                    +"<div class='hotelnavitem'>"
                        +"<span class='hoteltextmenu' id='" + data[i].region_id + "'>" + data[i].region_name + "</span>"
                    +"</div>"
                +"</div>"		
			);
		}
		/* if(regionID != "null") {
			$('.hoteltextmenu').each(function(i) {
				if($(this).attr('id') == regionID) {
					$('#regionResult').val($(this).text());
				} else {
					var regionList = region_id_list.filter(function(e) {
						return e.children_region_id == regionID;
					})
					$('#regionResult').val(regionList[0].parent_region_name + "," + regionList[0].children_region_name);
				} 
			})
		} */
	}
	
	/* 선택한 지역의 구들 받아오기 */
	function hotelRegionDetail(regionId){
		 /* 지역의 id를 통해 그 id의 구들 filter 통해서 가져오기 */
		var regionList = regionDetail.filter(function(e) {
			return e.region_id == regionId;
		})
		
		$('.hotelmaintext *').remove();
		//받아온 구 들 append
		for(var j = 0; j < regionList[0].inner_regions.length; j++){
			$('.hotelmaintext').append(
				"<div class='hotel'>"
	    			+"<p class='hotelRegionName' id='" + regionList[0].inner_regions[j].region_id + "'>" + regionList[0].inner_regions[j].region_name + "</p>"
		    	+"</div>"					
			)
		}				
	}
	/* 호텔 구이름 클릭시 구 css 추가 */
	$(document).on('click','.hotelRegionName',function(){
		$('.hotelRegionName').removeClass('zoneCss');
		$(this).addClass('zoneCss');
	})
	/* 호텔 지역이름 선택시 지역css 추가 */
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
		
		var parent_regionId = $('.areaCss').children().children().attr('id');
		var parent_regionName = $('.areaCss').children().children().text();
		var child_regionId = $('.zoneCss').attr('id');
		var child_regionName = $('.zoneCss').text();
		
		/* var area = $('#Area').text();
		var zone = $('#Zone').text(); */
		
		if($('.zoneCss').length == 0) {
			$('#regionResult').val(parent_regionName);
		} else {
			$('#regionResult').val(parent_regionName + "," + child_regionName);
		}
		
		// area에 담기
		$('#Area').text(parent_regionName);
		// zone에 담기
		$('#Zone').text(child_regionName);
		
		$('.locationpop').hide();	
	})
	
	/* input text에 선택해놨던 지역이 있는 상태에서 취소버튼을 누르면 선택되어있던 지역 그대로 유지 */
	$('#cancelRegion').click(function(){
		var regionResult = $('#regionResult').val();
		
		console.log(regionResult);
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
		
		$('.hotelRegionName').each(function(i){
			if($(this).text() == zone){
				$(this).addClass('zoneCss');
			}
		})
	} 
	</script>
	
	<script>
	var user_id = '<%=id%>';
		$(function() {
			/* 호텔 기본적인 data 받아오는 ajax */
			$.ajax({
				url : "../v2/mainpage", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
				
					data = result.data;
					dataEvents = data.events;
					console.log(data);
					eventBanner();
					
					dataLodgements = data.thumb_lodgements;
					bannerRoom();
					
					return false;
				},
				error : function(){
					alert("검색실패");
					return false;
				}
			})
		})
		var regionDetail;
		var region_id_list = [];
		
		/* searchbar 지역별 호텔 찾기 */
		 $(function() {		
			$.ajax({
				url : "../regions", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
				
					data = result.data;
					regionDetail = data;
					
					for(var i in regionDetail) {
						for(var j in regionDetail[i].inner_regions) {
							var regionObject = {
								parent_region_id : regionDetail[i].region_id,
								parent_region_name : regionDetail[i].region_name,
								children_region_id : regionDetail[i].inner_regions[j].region_id,
								children_region_name : regionDetail[i].inner_regions[j].region_name
							}
							region_id_list.push(regionObject)
						}
					}
					console.log(regionDetail)
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
	 	/* 날짜 팝업 열기 */
		function s_show() {
			makeCalendar(0);
			document.querySelector(".popup").className = "popup show";
		}
		/* 날짜 팝업 닫기 */
	    function close2 () {document.querySelector(".popup").className = "popup";}
	
	</script>
	
	<script>
		/* 로그인 상태에 따라 팝업의 날짜 보여주기 */
		$(document).on('click', '.date', function(){
			if($('#selectState').text() == "login") {
				$('#selectState').text("logout");
				
				var dateString = $('#year').text() + "." + ('0' + $('#month').text()).slice(-2) + '.' + ('0' + $(this).text()).slice(-2);
				$('#checkinDate').text(dateString);
				$('#checkoutDate').text(dateString);
				
			} else if($('#selectState').text() == "logout") {
				var dateString = $('#year').text() + "." + ('0' + $('#month').text()).slice(-2) + '.' + ('0' + $(this).text()).slice(-2);
				
				if (compareDate($('#checkinDate').text(), dateString) <= 0) {
					$('#checkinDate').text(dateString);
					$('#checkoutDate').text(dateString);
				} else {
					$('#selectState').text("login");
					$('#checkoutDate').text(dateString);
				}
			}
			clickedDate();
		})
	</script>
	
	<script type="text/javascript">
		/* 날짜 팝업에서 날짜 선택했을때 선택한 날짜 받아오기 */
		function makeCalendar(moveMonth) {
			$('.dates').children().remove();
			
			if(moveMonth == 0) {
				var checkinDate = $('#checkinDate').text();
				var checkoutDate = $('#checkoutDate').text();
				
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
			
			//월이 13이상이면 1로 가기
			if (month >= 13) {
				year++;
				month = 1;
			} else if (month <= 0) {
				//월이 0이하이면 12로 가기
				year--;
				month = 12;
			}
			
			$('#year').text(year);
			$('#month').text(month);
			//이번년도 이번달이면 이전 버튼 안보여줌
			if(year == <%=todayYear%> && month == <%=todayMonth%>) {
				$('#prevBtn').css("visibility", "hidden");
			} else {
				$('#prevBtn').css("visibility", "visible");
			}
			//3달뒤는 다음 버튼 안보여줌
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
		/* 달력 팝업에서 날짜 선택하면 선택한 날짜 배열하기 */
		function clickedDate() {
			var dateList = $('.date').toArray();
			
			if ($('#checkinDate').text() == "" || $('#checkoutDate').text() == "") {
				for (var i in dateList) {
					$(dateList[i]).removeClass("clicked");
				}
			}
			
			for (var i in dateList) {
				if ((compareDate($('#checkinDate').text(), $('#year').text() + "." + $('#month').text() + "." + $(dateList[i]).text()) >= 0) 
						&& (compareDate($('#checkoutDate').text(), $('#year').text() + "." + $('#month').text() + "." + $(dateList[i]).text()) <= 0)) {
					$(dateList[i]).addClass("clicked");
				} else {
					$(dateList[i]).removeClass("clicked");
				}
			}
		}
	</script>
	
	<script type="text/javascript">
		/* 이전 버튼 클릭시 1 마이너스 된 달로 이동 */
		$('#prevBtn').click(function () {
			makeCalendar(-1);
		});
		/* 다음 버튼 클릭시 1 플러스 된 달로 이동 */
		$('#nextBtn').click(function () {
			makeCalendar(1);
		});
		/* 선택 버튼 클릭시 선택한 날짜에서 체크인, 체크아웃 날짜를 받아와서 적용*/
		$('#selectBtn').click(function () {
			var checkinDate = $('#checkinDate').text();
			var checkoutDate = $('#checkoutDate').text();
			
			if(checkinDate == checkoutDate) {
				var selectDate = checkinDate.split(".");
				if(selectDate[2] == lastDay(selectDate[0], selectDate[1])){
					if(selectDate[1] == "12") {
						checkoutDate = (parseInt(selectDate[0])+1) + ".1" +".1"
					} else {
						checkoutDate = selectDate[0] + "." + (parseInt(selectDate[1]) +1) +".1"
					}
				} else {
					checkoutDate = selectDate[0] + "." + selectDate[1] + "." + (parseInt(selectDate[2])+1); 
				}
				
			}
			//페크인, 체크아웃 날짜가 선택되었으면 선택된 날짜값을 날짜선택 text 창에 넣음
			if (checkinDate != "" && checkoutDate != "") {
				$('#dateSearchCondition').val(checkinDate + " ~ " + checkoutDate);
			}
			
			close2();
		});
		//달력 취소 버튼 클릭시 그 전에 선택해놓은 날짜가 있으면 그대로 적용
		$('#cancelBtn').click(function () {
			var dateSearchCondition = $('#dateSearchCondition').val();
			
			if (dateSearchCondition != "") {
				$('#checkinDate').text(dateSearchCondition.split(" ~ ")[0]);
				$('#checkoutDate').text(dateSearchCondition.split(" ~ ")[1]);
			}
			close2();
		});
	</script>
	
	<script>
	/* 호텔 이미지 클릭시 지역선택 팝업 나옴 */
	$(document).on('click', '#hotel', function() {
		
		if($('.locationpop').css('display') == 'none'){
			$('.locationpop').show();
		} 		
	})
	/* 지역선택 텍스트 클릭시 지역선택 팝업 나옴 */
	$(document).on('click', '#regionResult', function() {
		
		if($('.locationpop').css('display') == 'none'){
			$('.locationpop').show();
		} 		
	})
	
	</script>
	
	<script type="text/javascript">
	/* 검색 결과를 토대로 조건에 맞는 호텔 검색하는 함수 */
		function searchHotel() {
			var checkinDate = $('#checkinDate').text();
			var checkoutDate = $('#checkoutDate').text();
			var regionID = $('.zoneCss').attr('id');
			var roomName = $('#searchRoom').val();
			
			if(roomName == ""){
				roomName = null;
			}
			//구css 값이 없을때
			if($('.zoneCss').length == 0){
				if($('.areaCss').length == 0){
					//지역css 값이 없으면 regionId 없음
					regionID = null;
				} else {
					//regionId = 지역의 id
					regionID = $('.areaCss').children().children().attr('id');	
				}
			}
			//체크인, 체크아웃 날짜가 있으면 해당 날짜를 checkin/checkout 에 넣고 해당 날짜의 호텔검색결과 페이지로 이동
			if (checkinDate != "" && checkoutDate != "") {
				location.href='reserhotel/reservation1?checkin=' + checkinDate + '&checkout=' + checkoutDate +'&region=' + regionID + '&name=' + roomName;
			} else {
				
				var todayString = "<%=todayString%>";
				var tomorrowString = "<%=tomorrowString%>";
				//오늘날짜, 내일날짜의 호텔검색결과 페이지로 이동
				location.href='reserhotel/reservation1?checkin=' + todayString + '&checkout=' + tomorrowString +'&region=' + regionID + '&name=' + roomName;
			}
		}
	</script>
	
	<script>
	/* 추천 선물 슬라이드 */
    const slides = document.querySelector('.slides'); //전체 슬라이드 컨테이너
     const slideImg = document.querySelectorAll('.bannerImg'); //모든 슬라이드들 
     let currentIdx = 0; //현재 슬라이드 index 
     const slideCount = slideImg.length; // 슬라이드 개수 
     const prev = document.querySelector('.prev'); //이전 버튼 
     const next = document.querySelector('.next'); //다음 버튼 
     const slideWidth = 361; //한개의 슬라이드 넓이 
     const slideMargin = 84; //슬라이드간의 margin 값 
     //전체 슬라이드 컨테이너 넓이 설정 
     //slides.style.width = (slideWidth + slideMargin) * slideCount + 'px'; 
     function moveSlide(num) { 
         slides.style.left = (-num * 378 - 24) + 'px'; 
         currentIdx = num; 
     }
     
     prev.addEventListener('click', function () {
          /*첫 번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==0일때만 moveSlide 함수 불러옴 */ 
          if (currentIdx > 0) {
        	  moveSlide(currentIdx - 1); 
          } else {
        	  moveSlide($('.bannerImg').length - 3);
          }
     });
     
     next.addEventListener('click', function () { 
          /* 마지막 슬라이드로 표시 됐을때는 다음 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==slideCount - 1 일때만 moveSlide 함수 불러옴 */
           if (currentIdx < $('.bannerImg').length - 3) { 
           	moveSlide(currentIdx + 1);
           	/* if ($('.slides').css("width").replace("px","") < parseInt($('.slides').css("left"))*-1) {
               	$('.slides').css("left", -10);
               } */
           } else {
        	   moveSlide(0);
           }
           
     });
    </script>
    
    <script>
		/* 추천 선물 슬라이드 */
         const slides2 = document.querySelector('.slides2'); //전체 슬라이드 컨테이너
         const slideImg2 = document.querySelectorAll('.slides2 li'); //모든 슬라이드들 
         let currentIdx2 = 0; //현재 슬라이드 index 
         const slideCount2 = slideImg2.length; // 슬라이드 개수 
         const prev2 = document.querySelector('.prev2'); //이전 버튼 
         const next2 = document.querySelector('.next2'); //다음 버튼 
         const slideWidth2 = 570; //한개의 슬라이드 넓이 
         const slideMargin2 = 30; //슬라이드간의 margin 값 
         //전체 슬라이드 컨테이너 넓이 설정 
         //slides.style.width = (slideWidth + slideMargin) * slideCount + 'px'; 
         function moveSlide2(num) { 
             slides2.style.left = -num * 600 + 'px'; 
             currentIdx2 = num; 
        }
        prev2.addEventListener('click', function () {
            /*첫 번째 슬라이드로 표시 됐을때는 이전 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==0일때만 moveSlide 함수 불러옴 */ 
            if (currentIdx2 !== 0) moveSlide2(currentIdx2 - 1); 
       });
       next2.addEventListener('click', function () { 
            /* 마지막 슬라이드로 표시 됐을때는 다음 버튼 눌러도 아무런 반응 없게 하기 위해 currentIdx !==slideCount - 1 일때만 moveSlide 함수 불러옴 */
       		if (currentIdx2 !== $('.slides2 li').length - 1) moveSlide2(currentIdx2 + 1);
       });

    </script>
    
    <script>
	   /*  $(document).on('click', '#glasses', function(){
	        if($('#glassesText').css('display') == 'none'){
	            $(this).css('transition-duration', '1s');
	            $('#glassesText').show();
	            $('#deleteIcon').show();
	            $('.glassesArea').css('transform','translate(-32px,-40px)');
	   		 } 
	    })
	
	    $(document).on('click', '#deleteIcon',function(){
	        $('#glassesText').hide();
	        $(this).hide();
	        $('#glasses').css('transform','translateX(0px)');
	        $('.glassesArea').css('transform','translate(0px)');
	    }) */
	    
	    /* 배너 이벤트 클릭시 팝업 생성 */
	    function newEventScreen(src) {
	    	var newTab = window.open(src, "_blank");
			newTab.focus();
		}
	   
	    $(function() {
	    	var user_id = '<%= id%>';
	    	
			if(user_id == "null") {
				return;
			} else{
				$.ajax({
					url : "../basic-myinfo", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						
						if(result.message == 'Success'){
							user_info = result.data;
							console.log(user_info);	
							
							$('#headerName').text(user_info.user_name);
							
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
		    
    </script>
</div>
</body>
</html>