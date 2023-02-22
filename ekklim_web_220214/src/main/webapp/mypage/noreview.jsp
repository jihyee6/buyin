<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<link rel = "stylesheet" href = "../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.count{
	font-size: 16px;
	font-family: NanumSquare_ac;
	margin: 12px auto;
}

.article{
	padding: 10px;
	border: 1px solid #A4A4A4;
	border-radius: 10px;
	width: 850px;
	height: 200px;
	margin: 25px;
	box-shadow: 2px 2px 10px 1px #A4A4A4;
}

.article img{
	width: 245px;
	float: left;
	height: 178px;
	padding: 10px;
}

.htitle h3{
	font-size: 24px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.htitle{
	margin: 6px 30px 30px 256px;
}

.htitle p{
	margin-top: 10px;
	font-size: 15px;
	color: #242424;
	font-family: NanumSquare_ac;
}
.price{
	float: left;
	color: #707070;
	margin: 35px 35px 35px 280px;
}
.price span{
	font-size: 22px;
	color: #C3A58A;
}
.article> .bt2 {
	display: flex;
	width: 400px;
	margin: 0px 0px 0px 522px;
}
.article > .bt2 > button{
	padding: 0.5rem 1rem;
	text-align: center;
	display: inline-block;
	border: 1px solid #707070;
	border-radius: 4px;
	cursor: pointer;
	margin: 25px;
	display: block;
	width: 120px;
    height: 37px;
    color: #242424;
    font-size: 14px;
    font-family: NanumSquare_ac;
}

.mreview{
	height: 35px;
	margin-top: -12px;
	width: 600px;
	font-size: 15px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.rdate{
	font-size: 16px;
	width: 200px;
	transform: translate(355px, -80px);
	font-family: NanumSquare_ac;
	color: #242424;

}

  .deleteReview{
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
	height: 820px;
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
}
.deleteReview.show >.window> .popup {
	width: 530px;
	height: 300px;
}
.show .popup {
	transform: translate(-50%, -50%);
	transition: all .5s;
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
 	margin: 35px auto;
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
.tabmenu {
	max-width: 886px;
	margin: 0 auto;
	position: relative;
}


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


 .tab>.selectmenu {
    margin-bottom: 4px;
}
  .tabnav > div.tablinks.active{
 	 border: 1px solid #707070; 
 	 border-top: 3px solid #4366A3;
     color: #242424; 
  }
 .tabcontent{
    display: none;
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
			<!-- 마이페이지 사이드바 div -->
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
							<div class="navside" onclick="location.href='wish'">
								<div class="navitem" id="wish">
									<span class="textmenu" >위시리스트</span> 
								</div>
							</div>
							
							<div class="navside" onclick="location.href='Myreservation'" >
								<div class="navitem" id="reservation">
									<span class="textmenu" >예약·취소내역</span> 
								</div>
							</div>
	
							<div class="navside" onclick="location.href='review'" style="background-color: #4366A3;">
								<div class="navitem" id="review">
									<span class="textmenu" style="color: #FFFFFF;">나의리뷰</span> <img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
								</div>
							</div>
						</nav>
					</div>
				</aside>

			<div class="maintext">
				<div class="maintitle"><h4>나의 리뷰</h4></div>
				<div class="tabmenu">
					<!-- 리뷰 작성, 작성한 리뷰 탭 -->
					<div class="tabnav">
						<div class="tablinks" onclick="openMenu(event,'Written')" id="defaultOpen"><p>작성한 리뷰</p></div>
						<div class="tablinks" onclick="openMenu(event,'toWrite')"><p>작성가능리뷰</p></div>
					</div>
					<div id="Written" class="tabcontent">
						<div class="count">작성개수: <span id="review_count">0</span>개</div>
						<!-- 리뷰내역 없음 div -->
						<div class="no">
							<img alt="메모아이콘" src="../images/icon/listIcon.png">
							<h2>리뷰내역이 없습니다</h2>
						</div>
					</div>
						<div id="toWrite" class="tabcontent">
							 <div class="count">작성가능개수: <span id="to_review_count">0</span>개</div>
						</div>
					</div>
				</div>
			
			</div>	
		</div>
		<%@include file="../footer.jsp"%>
	</div>
		<script>
		/* 받은 선물, 보낸선물 탭부분 */
	    function openMenu(evt, review) {
			  var i, tabcontent, tablinks;
			  tabcontent = document.getElementsByClassName("tabcontent");
			  for (i = 0; i < tabcontent.length; i++) {
			    tabcontent[i].style.display = "none";
			  }
			  tablinks = document.getElementsByClassName("tablinks");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].className = tablinks[i].className.replace(" active", "");
			  }
				  document.getElementById(review).style.display = "block";
				  evt.currentTarget.className += " active";
				}
			    document.getElementById("defaultOpen").click();

</script>

</body>
</html>