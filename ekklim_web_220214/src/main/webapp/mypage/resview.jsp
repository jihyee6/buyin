<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.article4 {
	/* width: 920px;
	height: 230px; */
	/* margin: 16px 0px 0px 5px; */
}

#can {
	display: flex;
	width: 300px;
	height: 50px;
}

#can2 {
	display: flex;
	width: 600px;
	height: 50px;
}

.ca1, .ca3, .ca5 {
	float: left;
}

.article4 h4 {
	font-size: 18px;
	color: #242424;
	font-family: NanumSquare_ac;
	font-weight: bold;
}

.article4 hr {
	width: 580px;
	margin-left: 22px;
	color: #A2A2A2;
}

.article4>.ca>span {
	font-size: 18px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.htitle h3 {
	font-size: 24px;
	color: #242424;
	font-family: NanumSquare_ac;
	font-weight: bold;
}

.htitle {
	margin: 22px;
}

.rinfo {
	margin: 60px 0px 10px 0px;
	font-size: 26px;
	font-family: NanumSquare_ac;
	color: #242424;
}

.inforr {
	width: 530px;
	margin-left: 0px;
	
}

.rowtitle {
	width: 75px;
	height: 15px;
	font-size: 16px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #242424
}

.rowcontent {
	width: 180px;
	height: 15px;
	font-size: 16px;
	font-family: NanumSquare_ac;
	color: #242424
}

}
.bu {
	transform: translateY(-48px);
}

.resinfo button {
	width: 86px;
	float: right;
	padding: 6px;
	background-color: white;
	border-radius: 6px;
	border: 1px solid #707070;
	font-family: NanumBarunGothic;
	font-size: 12px;
	margin-top: -44px;
}

.resinfo th, td {
	padding: 9px;
	font-size: 16px;
	color: #242424;
}

.resinfo th {
	font-weight: bold;
}

.care {
	margin-top: 93px;
	padding: 10px;
	background-color: #EEEEEE;
	border-radius: 15px;
	text-align: left;
	width: 850px;
}

.care h2 {
	margin: 10px 0px 18px 55px;
	color: #707070;
	font-size: 22px;
	font-family: NanumSquare_ac;
}

.care ol{
	padding-bottom: 14px;
}

.care ol li {
	margin: 15px 0px 0px 33px;
	font-size: 14px;
	color: #9F9F9F;
	font-family: NanumSquare_ac;
	font-size: 14px;
}

hr {
	width: 920px;
}

.total {
	margin-top: 16px;
	float: right;
}

.total p {
	font-size: 18px;
	font-style: NanumSquare_ac;
	color: #242424;
}

.total span {
	font-size: 26px;
	font-weight: bold;
	margin-left: 32px;
}

.canbutt {
	margin: 126px 0px 0px 346px;
}

.colTable td {
	margin: 0px;
}

.canbutt button {
	color: white;
	font-size: 20px;
	padding: 8px;
	width: 158px;
	background-color: #4366A3;
	border: none;
	border-radius: 6px;
}

.colTable {
	display: flex;
}

.rowtitle2 {
	width: 285px;
	font-size: 16px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #242424
}

.rowcontent2 {
	width: 280px;
	font-size: 16px;
	font-family: NanumSquare_ac;
	color: #242424
}

.article4 img {
	padding: 10px;
	width: 245px;
	height: 170px;
}

.cancelTable {
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
	width: 746px;
	padding-bottom: 16px;
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
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
}

#close8 {
	float: right;
	width: 40px;
	height: 40px;
	margin: -44px 12px 0px 0px;
}

.personalNotice {
	width: 636px;
	height: 100%;
	margin: 46px 74px;
}

.personalNotice p {
	font-weight: bold;
	font-size: 18px;
	font-family: NanumSquare_ac;
	color: #242424;
	margin: 14px auto;
}

.personalNotice table {
	width: 600px;
	border: 1px solid #707070;
	border-spacing: 0px;
	margin: 0px;
}

.personalNotice table td {
	margin: 0px;
	border-bottom: 1px solid #707070;
	text-align: center;
	font-size: 16px;
	font-family: NanumSquare_ac;
	color: #242424;
	padding: 14px;
}

.personalNotice table td:last-child {
	border-bottom: none;
}

.personalNotice table td:first-child{
	background-color: #F9F9F9;
}

.personalNotice table tr:first-child {
	border-right: 1px solid #707070;
	width: 200px;
}

.personalNotice table tr:last-child {
	width: 397px;
}

.personalNotice table tr:last-child td:last-child {
	font-weight: bold;
}
.roomInfoTable{
	width: 920px;
}

.roomInfoArea{
	display: grid;
	grid-template-columns: 30% 70%;
	border-bottom: 1px solid #9595a3;
	padding: 4px;
}
.roomInfoTable tr{
	display: revert;
	float: none;
	width: 100%;
}

.roomInfoTable td{
	display: revert;
	font-family: NanumSquareRound;
	color: #242424;
	font-size: 16px;
} 

.roomInfoImg{
	width: 258px;
	margin: 6px;
}
.roomInfoTitle{
	text-align: left;
	font-weight: bold;
	width: 94px;
}
.room_amenity_grid{
	display: grid;
	grid-template-columns: 50% 50%;
	width: 80%;
	margin-left: 0px;
}
</style>

</head>
<body>
<%String reservation_id = request.getParameter("reservation"); %>

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

						<div class="navside" onclick="location.href='wish'">
							<div class="navitem" id="wish">
								<span class="textmenu" >위시리스트</span> 
							</div>
						</div>
						
						<div class="navside" onclick="location.href='Myreservation'"  style="background-color: #4366A3;">
							<div class="navitem" id="reservation">
								<span class="textmenu" style="color: #FFFFFF;">예약·취소내역</span> <img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
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
				<div class="maintitle">예약내역확인</div>
				<div class="tabmenu">
					<div class="resinfo">
						<p class="rinfo">예약 정보</p>
						<hr>
						<!-- 예약정보 아티클 -->
						<div class="article4">
							<div>
								<!-- 예약호텔 이름 div -->
								<div class="htitle">
									<h3 id='roomName'>-</h3>
								</div>
								<!-- 예약일/결제번호 div -->
								<div style="margin: 18px;">
									<table class="inforr">
										<tr class='colTable'>
											<td class="rowtitle">예약일</td>
											<td class="rowcontent" id='reservationDate'>-</td>
											<td class="rowtitle">결제번호</td>
											<td class="rowcontent" id='oid'>-</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<!-- 예약정보 아티클 끝 -->
						<hr>

					</div>

					<div class="resinfo">
						<p class="rinfo">객실 정보</p> 
						<div class="bu">
							<button type="button" id="c_show">취소정책</button>
						</div>
						<hr>
						<!-- 객실정보 테이블 append -->
						<div class='roomInfoTable'>
							<!-- <div class='roomInfoArea'>
								<div>
									<img class='roomInfoImg' src ='../images/reservationimg/hotel.png'>
								</div>
								<div>
									<table>
										<tr>
											<td class='roomInfoTitle'>객실타입</td>
											<td>-</td>
											<td class='roomInfoTitle'>예약금액</td>
											<td>-</td>
										</tr>
										<tr>
											<td class='roomInfoTitle'>체크인</td>
											<td>-</td>
											<td class='roomInfoTitle'>체크아웃</td>
											<td>-</td>
										</tr>
										<tr>
											<td class='roomInfoTitle'>객실옵션</td>
											<td>-</td>
										</tr>
										<tr>
											<td class='roomInfoTitle'>어메니티 옵션</td>
											<td>-</td>
										</tr>
									</table>
								</div>
							</div> -->
						</div>
					</div>

					<div class="resinfo">
						<p class="rinfo">고객 정보</p>
						<hr>
						<!-- 고객정보 테이블 -->
						<table style="margin-left: 44px;">
							<tr>
								<th>예약자명</th>
								<th>휴대폰번호</th>
								<th>이메일</th>
							</tr>

							<tr>
								<!-- 고객정보 data -->
								<td id='userName'>-</td>
								<td id='userPhone'>-</td>
								<td id='userEmail'>-</td>
							</tr>
						</table>
						<hr>
					</div>

					<div class="resinfo">
						<p class="rinfo">결제 정보</p>
						<hr>
						<!-- 결제정보 테이블 -->
						<table style="margin-left: 44px;">
							<tr>
								<th>예약금액</th>
								<th>바이룸 사용</th>
								<th>쿠폰사용</th>
								<th>포인트사용</th>
								<th>기프트카드 사용</th>
							</tr>
							<tr>
								<td><span id='reservationPrice'>0</span>원</td>
								<td><span id='voucherPrice'>0</span>원</td>
								<td><span id='couponPrice'>0</span>원</td>
								<td><span id='pointPrice'>0</span>원</td>
								<td><span id='giftPrice'>0</span>원</td>
							</tr>
						</table>
						<hr>
					</div>
					<!-- 총 금액 안내 -->
					<div class="total">
						<p>
							총 금액<span id='totalPrice'>0</span>원
						</p>
					</div>
						<!-- 예약 주의사항 -->
					<!-- <div class="care">
						<h2>주의사항</h2>
						<ol>
							<li>요금에는 10% 세금이 포함되어 있습니다.</li>
							<li>체크인 시간은 15시이며 체크아웃 시간은 12시 입니다.</li>
							<li>호텔은 투숙객에게 서비스를 제공하기 위해 고객의 전화번호,이메일,주소 등을 포함한 개인정보를 보관할수 있습니다.</li>
						</ol>
					</div> -->
					<!-- 예약 취소 버튼 -->
					<div class="canbutt">
						<button type="button" class='cancelBtn'>예약취소요청</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>

	<!-- 취소정책 팝업 -->
	<div class="cancelTable">
		<div class="window">
			<div class="popup">
				<div class="pTitle">
					<div class="seePhoto">
						<p>취소규정</p>
						<img src="../images/closebutton.png" id="close8">
					</div>
					<div class="personalNotice">
						<p>&middot;숙박 환불기준</p>
						<table>
							<tr>
								<td>유형</td>
								<td>체크인 10일전</td>
								<td>체크인 9-7일전</td>
								<td>체크인 6-5일전</td>
								<td>체크인 4-3일전</td>
								<td>체크인 2-1일전</td>
								<td>당일취소 및 노쇼</td>

							</tr>
							<tr>
								<td>환불기준</td>
								<td>총 결제금액 중 100% 환불</td>
								<td>총 결제금액 중 70% 환불</td>
								<td>총 결제금액 중 50% 환불</td>
								<td>총 결제금액 중 30% 환불</td>
								<td>총 결제금액 중 10% 환불</td>
								<td>환불 불가</td>
							</tr>
						</table>
						<p>&middot; 대실 환불기준</p>
						<table>
							<tr>
								<td>유형</td>
								<td>체크인 1일 전</td>
								<td>당일취소 및 노쇼</td>
							</tr>
							<tr>
								<td>환불기준</td>
								<td>무료취소 가능</td>
								<td>환불 불가</td>
							</tr>
						</table>
						<p>&middot; 숙박 및 대실 예약완료 후 10분이내 당일취소 및 변경 가능합니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		/* 취소정책 팝업 나타내고 숨기기 */
		$(document).on('click','#c_show',function(){
			$('.cancelTable').addClass('show');			
		})
		$(document).on('click','#close8',function(){
			$('.cancelTable').removeClass('show');
		})
		
		
		var user_id = '<%=id%>';
		var reservation_id = '<%=reservation_id%>';
		
		$(function() {
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../loginpage/login';
			} else {
				/* 예약내역 확인 내용 보여주는 ajax */
				$.ajax({
					url : "../v2/v2/reservation-detail?reservation="+ reservation_id, // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        }, 
					success : function(result){
						
						console.log(result);
						if(result.message == 'Success'){
							data = result.data;
							roomData = data.rooms;
							console.log(data);	
							
							$('#reservationDate').text(data.reservation_date);
							$('#roomName').text(data.lodgement_name);
							$('#userName').text(data.user_info.name);
							$('#userPhone').text(data.user_info.tel);
							$('#userEmail').text(data.user_info.email);
							$('#reservationPrice').text(data.payment_charge.toLocaleString('en'));
							$('#couponPrice').text(data.coupon_charge.toLocaleString('en'));
							$('#pointPrice').text(data.point_charge.toLocaleString('en'));
							$('#voucherPrice').text(data.gift_charge.toLocaleString('en'));
							$('#giftPrice').text(data.giftcard_charge.toLocaleString('en'));
							$('#totalPrice').text(data.total_price.toLocaleString('en'));
							$('#oid').text(data.OID);
							 
							roomInfo();
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
		
		/* 예약취소 버튼 클릭시 예약확인 페이지로 넘어감 */
		$(document).on('click','.cancelBtn',function(){
			
			location.href='recan?reservation='+ reservation_id;
		})
		
		/* 예약내역 객실 옵션 append하는 함수 */
		function roomInfo(){
			for(var i = 0; i < roomData.length; i++){
				$('.roomInfoTable').append(
					"<div class='roomInfoArea'>"
						+"<div>"
							+"<img class='roomInfoImg' src ='" + roomData[i].room_img_url + "'>"
						+"</div>"
						+"<div>"
							+"<table>"
								+"<tr>"
									+"<td class='roomInfoTitle'>객실타입</td>"
									+"<td>" + roomData[i].room_name + "</td>"
									+"<td class='roomInfoTitle'>예약금액</td>"
									+"<td>" + roomData[i].room_total_price.toLocaleString('en') + "원</td>"
								+"</tr>"
								+"<tr>"
									+"<td class='roomInfoTitle'>체크인</td>"
									+"<td>" + roomData[i].checkin_date + "</td>"
									+"<td class='roomInfoTitle'>체크아웃</td>"
									+"<td>" + roomData[i].checkout_date + "</td>"
								+"</tr>"
								+"<tr>"
									+"<td class='roomInfoTitle'>객실옵션</td>"
									+"<td colspan ='3'>" + roomData[i].room_option + "</td>"
								+"</tr>"
								+"<tr>"
									+"<td class='roomInfoTitle'>어메니티 옵션</td>"
									+"<td colspan ='3'><div id = 'room_amenity" + i + "' class = 'room_amenity_grid'></div></td>"
								+"</tr>"
							+"</table>"
						+"</div>"	
					+"</div>"
				)
				
				/* 어메니티 옵션들 한 줄에 하나씩 나오게 하기 */
				var room_amenity = roomData[i].room_amenity.split("\n");
				for (var j in room_amenity) {
					$('#room_amenity'+i).append(
						"<div style='margin-left: 0px;'>" + room_amenity[j] + "</div>"
					)
				}
					
			}
		}
		
	</script>
</body>
</html>