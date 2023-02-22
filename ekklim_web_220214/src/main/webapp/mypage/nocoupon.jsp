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

.copy {
	float: left;
	margin: 10px;
}
tr{
	display: flex;
}

th {
	display: block;
	padding: 30px;
	text-align: left;
	color: #707070;
	font-family: NanumSquareRound;
}

td {
	display: block;
	padding: 10px;
	margin: 0px;
	text-align: left;
	color: #707070;
	font-family: NanumSquareRound;
}

.num{
	margin: 25px 0px 0px 155px;
}

.num img{
	height: 28px;
	margin: 0px;
	margin-left: 245px;
	height: 18px;
}

.num p{
	margin: auto 10px;
}

.num p img{
	margin-left: 10px;
}

.maintitle {
	font-size: 32px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #434343;
	font-family: NanumSquareRound;
}

.incoupon {
	text-align: center;
	position: relative;
	list-style: none;
	width: 828px;
	height: 168px;
	background-color: white;
	border: 1px solid #B1B1B1;
	border-radius: 14px;
	margin: 22px auto;
	padding: 10px;
	box-shadow: 1px 1px 4px #B1B1B1;
}

.no {
	width: 850px;
	height: 500px;
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.no h2 {
	margin-top: 30px;
	font-size: 32px;
	font-family: NanumSquare_ac;
	color: #BCBCBC;
	font-weight: bold;
}

.h4p {
	font-size: 26px;
	color: #5E5E5E;
	margin: 20px;
}

#pointbox {
	text-align: center;
	font-size: 28px;
	color: #C3A58A;
}

.tcou{
	width: 496px;
	height: 42px;
	border: 1px solid #BFBFBF;
	border-radius: 6px;
	font-size: 18px;
	font-family: NanumSquare_ac;
}

.btcou{
	width: 158px;
	height: 45px;
	background-color: #4366A3;
	color: #FFFFFF;
	border: 1px solid #ACACAC;
	border-radius: 10px;
	font-size: 18px;
	font-weight: bold;
	box-shadow: 1px 1px 1px #ACACAC;
}

.couinfo h4{
	font-size: 26px;
	color: #242424;
	font-family: NanumSquare_ac;
}
.tabnav{
	margin-top: 30px;
	display: flex;
}
.tabnav div{
	border: 1px solid #C2C2C2;
	width: 428px;
	height: 65px;
	font-size: 22px;
	font-family: NanumSquare_ac;
	color: #D2D2D2;
	font-weight: bold;
	text-align: center;
	cursor: pointer;
	line-height: 65px;
}

</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="title">
				<div class="tname">
					<div class="pagename">&nbsp;마이페이지</div>
				</div>
			</div>
			<div class='pageContent'>
				<aside>
				<div class="navbar">
					<nav class="inmenu">
						<div class="navside" onclick="location.href='info'">
							<div class="navitem" id="myinfo">
								<span class="textmenu">내정보</span>
							</div>
						</div>

						<div class="navside" onclick="location.href='point'" style="background-color: #4366A3;">
							<div class="navitem" id="point">
								<span class="textmenu" style="color: #FFFFFF;">포인트·쿠폰 </span> <img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
							</div>
						</div>
						<div class="navside" onclick="location.href='gift'">
							<div class="navitem" id="gift">
								<span class="textmenu">선물함</span>
							</div>
						</div>
						<div class="navside" onclick="location.href='shoppingBasket'">
							<div class="navitem" id="shoppingBasket">
								<span class="textmenu">장바구니</span>
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
				<div class="maintitle">포인트·쿠폰</div>
				<div class="tabmenu">
					<!-- 포인트,쿠폰 탭 -->
					<div class="tabnav">
						<div class="point" onclick="location.href='point'" ><p>포인트</p></div>
						<div class="coupon" onclick="location.href='coupon'" style="border: 1px solid #707070; border-top: 3px solid #4366A3; color: #242424;"><p>쿠폰</p></div>
					</div>
				<!-- 쿠폰 입력/등록 div -->
				<div class="tabcon2">
					<div class="coupon">
						<ul class="incoupon">
							<li style="font-size: 26px; color: #242424; margin: 20px auto;">쿠폰 입력</li>
							<li style="font-size: 18px; margin: 30px auto;">
							<div class="coup">
							<input type="text" placeholder="쿠폰번호를 입력하세요." class="tcou">
								<button type="button" class="btcou">쿠폰등록</button></div>
							</li>
						</ul>
					</div>
				</div>
				<!-- 보유 쿠폰 없음을 보여주는 div -->
				<div class="couinfo">
					<h4>보유 쿠폰</h4>
					<div class="no">
						<img alt="메모아이콘" src="../images/icon/ticketIcon.png">
						<h2>보유하신 쿠폰이 없습니다</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

		
<%@include file="../footer.jsp"%>

</div>
</body>
</html>