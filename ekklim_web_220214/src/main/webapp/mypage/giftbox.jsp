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

.tabnav{
	margin-top: 30px;
	display: flex;
	width: 896px;
}

.tabnav div{
	border: 1px solid #C2C2C2;
	width: 448px;
	height: 65px;
	font-size: 22px;
	font-family: NanumSquare_ac;
	color: #D2D2D2;
	font-weight: bold;
	text-align: center;
	cursor: pointer;
	line-height: 65px;
}

.tabcon{
	width: 100%;
	margin-top: 30px;
}
 .tab{
    overflow: hidden;
     }
 .tab>.selectmenu {
    margin-bottom: 4px;
}
  .selectmenu > span.tablinks.active{
      font-weight: bold; 
      color: #242424; 
      border-bottom: 2px solid #4366A3;
  }
 .tabcontent{
    display: none;
}


.selectmenu span{
	font-size: 18px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	cursor: pointer;
	margin: auto 15px;
}

.tab hr{
	margin: 12px auto;
	border: 1px solid rgb(138,138,138,0.5);
}

.giftCollection{
	margin-top: 22px;
}

.giftBox{
	display: grid;
	grid-template-columns: 40% 60%;
	width: 400px;
	float: left;
	margin: 14px 14px 28px;
	font-family: NotoSans;
}

.giftImg{
	width: 100%;
	height: 128px;
	background-color: #F6F6F6;
	position: relative;
	border-radius: 8px;
}

.giftImg img{
	width: 126px;
	height: 79px;
	position: absolute;
	left: 10%;
	top: 20%;
	border-radius: 8px;
}

.toGift{
	font-size: 14px;
	color: #242424;
}

.giftBox h5{
	font-size: 18px;
}
.money{
	font-size: 16px;
	font-weight: bold;
	color: #E75A00;
}

.moneyPeriod{
	font-size: 16px;
	color: #A4A4A4;
}
.moneyGift{
	padding-top: 38px;
}
.giftCount{
	font-family: NanumSquare_ac;
	font-size: 16px;
	color: #434343;
	font-weight: bold;
}

.giftCount span{
	color: #FF6600;
}

.useState{
	font-size: 12px;
	font-weight: bold;
	color: #3399FF;
}

</style>

</head>
<body>
	<%@include file="../header.jsp"%>
	
	<div class="page">

		<div class="content">
			<div class="title">
				<div class="tname">
					<div class="pagename">&nbsp;마이페이지</div>
					
				</div>
			</div>
			<div class='pageContent'>
			<aside>
			<!-- 마이페이지 사이드바 div -->
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
					<div class="navside" onclick="location.href='gift'"  style="background-color: #4366A3;">
						<div class="navitem" id="gift">
							<span class="textmenu" style="color: #FFFFFF;">선물함</span> <img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
						</div>
					</div>
					<div class="navside" onclick="location.href='shoppingBasket'">
						<div class="navitem" id="shoppingBasket">
							<span class="textmenu">장바구니</span>
						</div>
					</div>
					<div class="navside" onclick="location.href='recentSearch'">
						<div class="navitem" id="recent">
							<span class="textmenu" >최근 검색 숙소</span> 
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
				<div class="maintitle">선물하기</div>
				<div class="tabmenu">
				<!-- 선물하기,선물함 탭부분 -->
					<div class="tabnav">
						<div class="point" onclick="location.href='gift'"><p>선물하기</p></div>
						<div class="coupon" onclick="location.href='giftbox'" style="border: 1px solid #707070; border-top: 3px solid #4366A3; color: #242424; " ><p>선물함</p></div>
					</div>


					<div class="tabcon">
						   <div class="tab">
						   <!-- 보낸선물, 받은선물 탭 -->
							    <div class="selectmenu">
							        <span class="tablinks" onclick="openMenu(event,'giftSent')" id="defaultOpen">보낸선물</span>
							        <span class="tablinks" onclick="openMenu(event,'giftReceive')">받은선물</span> 
							    </div>
							    <hr>
							</div>
							
							<!-- 보낸선물 탭 내용-->
							<div id="giftSent" class="tabcontent">
							  	<p class="giftCount">보낸선물 <span>4</span>개</p>
							  	<div class="giftCollection">
							  	<!-- 기프트카드 종류 -->
							  	<div class="giftBox"  onclick="location.href='togiftDetail'">
							  		<div class="giftImg">
							  			<!-- 기프트카드 이미지 -->
							  			<img src="../images/giftcards/giftcard3.png">
							  		</div>
							  		<div class="giftPeriod">
							  			<p class="toGift">TO.<span><!-- 000 --></span>님</p>
							  			<h5><!-- 기프트카드 50,000원권 --></h5>
							  			<div class="moneyGift">
							  				<p class="money"><!-- 50,000원 --></p>
							  				<p class="moneyPeriod"><!-- 유효기간: 2022년 12월 31일 --></p>
							  			</div>
							  		</div>
							  	</div>
							  	  	  	<div class="giftBox">
							  		<div class="giftImg">
							  			<img src="../images/giftcards/giftcard3.png">
							  		</div>
							  		<div class="giftPeriod">
							  			<p class="toGift">TO.<span>000</span>님</p>
							  			<h5>기프트카드 50,000원권</h5>
							  			<div class="moneyGift">
							  				<p class="money">50,000원</p>
							  				<p class="moneyPeriod">유효기간: 2022년 12월 31일</p>
							  			</div>
							  		</div>
							  	</div>
							  	  	<div class="giftBox">
							  		<div class="giftImg">
							  			<img src="../images/giftcards/giftcard3.png">
							  		</div>
							  		<div class="giftPeriod">
							  			<p class="toGift">TO.<span>000</span>님</p>
							  			<h5>기프트카드 50,000원권</h5>
							  			<div class="moneyGift">
							  				<p class="money">50,000원</p>
							  				<p class="moneyPeriod">유효기간: 2022년 12월 31일</p>
							  			</div>
							  		</div>
							  	</div>
							  	  	<div class="giftBox">
							  		<div class="giftImg">
							  			<img src="../images/giftcards/giftcard3.png">
							  		</div>
							  		<div class="giftPeriod">
							  			<p class="toGift">TO.<span>000</span>님</p>
							  			<h5>기프트카드 50,000원권</h5>
							  			<div class="moneyGift">
							  				<p class="money">50,000원</p>
							  				<p class="moneyPeriod">유효기간: 2022년 12월 31일</p>
							  			</div>
							  		</div>
							  	</div>
							 </div>
						</div>
							
							<!-- 받은선물 탭 -->
							<div id="giftReceive" class="tabcontent">
							  <p class="giftCount">받은선물 <span>4</span>개</p>
							  	<div class="giftCollection">
							  	
							  	<!-- 받은 기프트카드 종류 -->
							  	<div class="giftBox" onclick="location.href='fromgiftDetail'">
							  		<div class="giftImg">
							  			<img src="../images/giftcards/giftcard3.png">
							  		</div>
							  		<div class="giftPeriod">
							  			<p class="toGift">FROM.<span>000</span>님</p>
							  			<h5>기프트카드 50,000원권</h5>
							  			<div class="moneyGift" style="padding-top: 28px;">
							  				<!-- 사용여부 -->
							  				<p class="useState">사용전</p>
							  				<p class="money">50,000원</p>
							  				<p class="moneyPeriod">유효기간: 2022년 12월 31일</p>
							  			</div>
							  		</div>
							  	</div>
				  	  	  			<div class="giftBox">
							  		<div class="giftImg">
							  			<img src="../images/giftcards/giftcard3.png">
							  		</div>
							  		<div class="giftPeriod">
							  			<p class="toGift">FROM.<span>000</span>님</p>
							  			<h5>기프트카드 50,000원권</h5>
							  			<div class="moneyGift" style="padding-top: 28px;">
							  				<p class="useState">사용전</p>
							  				<p class="money">50,000원</p>
							  				<p class="moneyPeriod">유효기간: 2022년 12월 31일</p>
							  			</div>
							  		</div>
							  	</div>
							  		<div class="giftBox">
							  		<div class="giftImg">
							  			<img src="../images/giftcards/giftcard3.png">
							  		</div>
							  		<div class="giftPeriod">
							  			<p class="toGift">FROM.<span>000</span>님</p>
							  			<h5>기프트카드 50,000원권</h5>
							  			<div class="moneyGift" style="padding-top: 28px;">
							  				<p class="useState">사용전</p>
							  				<p class="money">50,000원</p>
							  				<p class="moneyPeriod">유효기간: 2022년 12월 31일</p>
							  			</div>
							  		</div>
							  	</div>
							  		<div class="giftBox">
							  		<div class="giftImg">
							  			<img src="../images/giftcards/giftcard3.png">
							  		</div>
							  		<div class="giftPeriod">
							  			<p class="toGift">FROM.<span>000</span>님</p>
							  			<h5>기프트카드 50,000원권</h5>
							  			<div class="moneyGift" style="padding-top: 28px;">
							  				<p class="useState">사용전</p>
							  				<p class="money">50,000원</p>
							  				<p class="moneyPeriod">유효기간: 2022년 12월 31일</p>
							  			</div>
							  		</div>
							  	</div>
				  	  	  	 </div>
							</div>
			
					</div>

				</div>

			</div>
		</div>
		</div>

		<%@include file="../footer.jsp"%>
	</div>
</body>
<script>
		/* 받은 선물, 보낸선물 탭부분 */
	    function openMenu(evt, giftgo) {
			  var i, tabcontent, tablinks;
			  tabcontent = document.getElementsByClassName("tabcontent");
			  for (i = 0; i < tabcontent.length; i++) {
			    tabcontent[i].style.display = "none";
			  }
			  tablinks = document.getElementsByClassName("tablinks");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].className = tablinks[i].className.replace(" active", "");
			  }
				  document.getElementById(giftgo).style.display = "block";
				  evt.currentTarget.className += " active";
				}
			    document.getElementById("defaultOpen").click();

</script>

</html>