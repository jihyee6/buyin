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
.count {
	font-size: 16px;
	font-family: NanumSquare_ac;
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

						<div class="navside" onclick="location.href='point'">
							<div class="navitem" id="point">
								<span class="textmenu" >포인트·쿠폰 </span>
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
						<div class="navside" onclick="location.href='recentSearch'" >
							<div class="navitem" id="recent">
								<span class="textmenu" >최근 검색 숙소</span>  
							</div>
						</div>
						<div class="navside" onclick="location.href='wish'"  style="background-color: #4366A3;">
							<div class="navitem" id="wish">
								<span class="textmenu" style="color: #FFFFFF;">위시리스트</span> <img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
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
				<div class="maintitle">
					<h4>위시리스트</h4>
				</div>
				<div class="tabmenu">
					<div class="count">
						찜한상품 <span>0</span>개
					</div>
					<!-- 위시리스트 없음 div -->
					<div class="no">
						<img alt="메모아이콘" src="../images/icon/memoIcon.png">
						<h2>선택하신 위시리스트가 없습니다.</h2>
					</div>

					</div>
				</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>

</body>
</html>