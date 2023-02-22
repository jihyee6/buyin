<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<!-- 메인css -->
<link rel="stylesheet" href="../css/main.css">
<style>
.maintext{
	margin-top: 44px;
}

.tabmenu {
	max-width: 860px;
	margin: 0 auto;
	position: relative;
}

.search {
	position: relative;
	display: flex;
	top: 35px;
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
	margin: 27px 7px 0px 0px;
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
}

aside {
	float: right;
	margin: 44px 56px 0px 0px;
}

.recent {
	margin: 20px auto;
	width: 270px;
	height: 210px;
	border: 1px solid #B4B4B4;
	border-radius: 10px;
	box-shadow: 1px 1px 7px grey;
}

.recent img {
	width: 270px;
	height: 145px;
	margin-top: -24px;
}

.recentimg h4 {
	position: relative;
	height: 25px;
	border-top-left-radius: 7px;
	border-top-right-radius: 7px;
	background-color: rgb(0, 0, 0, 0.5);
	color: white;
	font-family: NanumSquare_ac;
	font-size: 16px;
}

.priceinfo {
	margin: 11px 0px 0px 12px;
	line-height: 21px;
}

.priceinfo p {
	color: #505050;
	font-size: 15px;
	font-family: NanumSquare_ac;
}

.priceinfo p span {
	font-weight: bold;
}

.reviewcount {
	margin: -22px 13px 30px 0px;
	float: right;
	font-size: 15px;
	color: #C3A58A;
	font-weight: bold;
}

.count{
	font-size: 18px;
	font-family: NanumSquare_ac;
	margin-left: 30px;
	color: #242424;
}

.reviewselect{
	float: right;
	margin: -27px 650px 0px 24px;
}

aside p{
	color: #434343;
	font-size: 18px;
	font-family: NanumSquare_ac;
	font-weight: bold;
}
.box{
	width: 100px;
	height: 30px;
	border: 1px solid #A2A2A2;
	font-size: 16px;
	font-family: malgun;
	border-radius: 5px;
}

.noicon{
	width: 500px;
	margin: 40px 215px;
	text-align: center;
}

.noicon img{
	margin-left: 70px;
}

.noicon h4{
	margin: 20px auto;
	font-size: 28px;
	font-family: NanumSquare_ac;
	color: #717171;
}

.noicon p{
	font-size: 20px;
	font-family: NanumSquare_ac;
	font-weight: bold;
	color: #B8B8B8;
}

</style>
</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>


		<div class="content">
			<div class="title">
				<ul class="search">

					<li><div class="searchbar">
							<p>숙소명 검색</p>
							<div id="textbox">
								<input type="text" placeholder="검색어를 입력해주세요." class="searchbox">
								<img src="../images/mainimg/glass1.png">
							</div>
						</div></li>

					<li><div class="searchbar">
							<p>호텔 또는 지역</p>
							<div id="textbox">
								<input type="text" placeholder="호텔 또는 지역을 선택해주세요."
									class="searchbox"> <img
									src="../images/mainimg/locationimg.png">
							</div>
						</div></li>

					<li><div class="searchbar">
							<p>날짜 선택</p>
							<div id="textbox">
								<input type="text" placeholder="날짜를 선택해주세요." class="searchbox">
								<img src="../images/mainimg/calendarimg.png">
							</div>
						</div></li>


					<li><div class="sbar">
							<span onclick="location.href=''" id="stext">SEARCH</span>
						</div></li>
				</ul>
			</div>
			<div class='pageContent'>
			<aside>
				<p>최근 둘러본 숙소</p>
				<div class="recent" onclick="location.href=''">
					<div class="recentimg">
						<h4>· 이끌림호텔 하남점</h4>
						<img alt="" src="../images/reservationimg/hotel.png">
						<div class="retext">
							<div class="priceinfo">
								<p>
									대실 <span>20,000원</span>
								</p>
								<p>
									숙박 <span>40,000원</span>
								</p>
							</div>
							<div class="reviewcount">리뷰 1000</div>
						</div>
					</div>
				</div>
				<div class="recent" onclick="location.href=''">
					<div class="recentimg">
						<h4>· 이끌림호텔 하남점</h4>
						<img alt="" src="../images/reservationimg/hotel.png">
						<div class="retext">
							<div class="priceinfo">
								<p>
									대실 <span>20,000원</span>
								</p>
								<p>
									숙박 <span>40,000원</span>
								</p>
							</div>
							<div class="reviewcount">리뷰 1000</div>
						</div>
					</div>
				</div>
				<div class="recent" onclick="location.href=''">
					<div class="recentimg">
						<h4>· 이끌림호텔 하남점</h4>
						<img alt="" src="../images/reservationimg/hotel.png">
						<div class="retext">
							<div class="priceinfo">
								<p>
									대실 <span>20,000원</span>
								</p>
								<p>
									숙박 <span>40,000원</span>
								</p>
							</div>
							<div class="reviewcount">리뷰 1000</div>
						</div>
					</div>
				</div>

			</aside>


			<div class="maintext">
				<div class="tabmenu">
				<div class="count">결과 <span>0</span>건
				<div class="reviewselect">
				<select name="review_select" class="box" id="review_select"
							onChange="checkemailaddy();">
								<option value="" selected>리뷰순</option>
								<option value="">가격높은순</option>
								<option value="">가격낮은순</option>
						</select>
				</div>
				</div>
				<div class="noicon">
				<img alt="" src="../images/nohotelicon.png">
				<h4>원하시는 검색결과가 없습니다.</h4>
				<p>다시 입력해주세요</p>
				</div>
				
				
					</div>

				</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>

</body>
</html>