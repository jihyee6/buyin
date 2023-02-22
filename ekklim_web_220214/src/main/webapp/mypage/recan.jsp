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
.tab {
	list-style: none;
	position: relative;
	display: flex;
	width: 850px;
	height: 70px;
	border: 1px solid #707070;
	font-size: 22px;
	font-family: NanumSquare_ac;
}

.article4 {
/* 	width: 920px;
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

.htitle2 h3 {
	font-size: 24px;
	color: #242424;
	font-family: NanumSquare_ac;
	font-weight: bold;
}

.htitle2 {
	margin: 22px;
}

.rinfo {
	margin: 60px 0px 10px 0px;
	font-size: 26px;
	font-family: NanumSquare_ac;
	color: #242424;
}
.inforr{
	width: 530px;
	margin-left: 0px;
}

.rowtitle{
	width: 75px;
	height: 15px;
	font-size: 16px;
	font-weight: bold;
	font-family: NanumSquare_ac; 
	color: #242424
}
.rowcontent{
	width: 180px;
	height: 15px;
	font-size: 16px;
	font-family: NanumSquare_ac; 
	color: #242424
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
	margin-top: 76px;
	padding: 10px;
	width: 850px;
	height: 178px;
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
	text-align: right;
}

.total p {
	font-size: 18px;
	font-style: NanumSquare_ac;
	color: #242424;
}

.total span {
	font-size: 26px;
	font-weight: bold;
}

.total> .nototal{
	color: #B70606;
}

.canbutt2 {
	margin: 66px 0px 0px 358px;
}

.canbutt2 button {
	color: white;
	font-size: 20px;
	padding: 8px;
	width: 158px;
	background-color: #4366A3;
	border: none;
	border-radius: 6px;
	box-shadow: 1px 1px 3px 0px grey;
}

.colTable {
	display: flex;
}

.colTable td {
	margin: 0px;
}

.rowtitle2{
	width: 285px;
	font-size: 16px;
	font-weight: bold;
	font-family: NanumSquare_ac; 
	color: #242424
}
.rowcontent2{
	width: 280px;
	font-size: 16px;
	font-family: NanumSquare_ac; 
	color: #242424;
}

#reason{
	width: 300px;
	padding: 6px;
	margin-top: -6px;
	font-size: 16px;
	font-family: NanumSquare_ac;
}
#reason:focus{
	outline: none;
}

.article4 img{
	padding: 10px;
	width: 245px;
	height: 170px;
}

.cancelTable, .cancelReservation {
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
	background-color: rgba(7,7,7,0.5);
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

.personalNotice{
    width: 636px;
    height: 100%;
    margin: 46px 74px;
}
.personalNotice p{
	font-weight: bold;
	font-size: 18px;
	font-family: NanumSquare_ac;
	color: #242424;
	margin: 14px auto;
}

.personalNotice table{
	width: 600px;
	border: 1px solid #707070;
	border-spacing: 0px;
	margin: 0px;
}

.personalNotice table td{
	margin: 0px;
	padding: 12px;
	border-bottom: 1px solid #707070;
	text-align: center;
	font-size: 16px;
	font-family: NanumSquare_ac;
	color: #242424;
}
.personalNotice table td:last-child{
	border-bottom: none;
}

.personalNotice table tr:first-child{
	border-right: 1px solid #707070;
	width: 200px;
}

.personalNotice table td:first-child{
	background: #E5E5E5;
}

.personalNotice table tr:last-child{
	width: 397px;
}


.personalNotice table tr:last-child td:last-child{
	font-weight: bold;
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
.cancelReservation.show >.window> .popup {
	width: 510px;
}

.cancelNotice{
	margin-top: 150px;
}

.infoText{
	margin: 18px auto;
	font-size: 16px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.cancelNotice table{
	width: 860px;
	border: 1px solid #DCDCDC;
	border-collapse: collapse;
	margin: 14px auto;
}

.cancelNotice table td{
	border-bottom: 1px solid #DCDCDC;
	margin: 0px;
	text-align: center;	
	font-size: 14px;
	font-weight: bold;
	padding: 12px;
}

.cancelNotice table td:last-child{
	border-bottom: none;
}

.cancelTitle{
	width: 214px;
	border-right: 1px solid #DCDCDC;
}

.cancelText{
	width: 642px;
}

.cancelNotice table td:first-child{
	background-color: #F9F9F9;
	height: 24px;
	line-height: 24px;
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
			<!-- 사이드바 메뉴 -->
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
				<div class="maintitle">예약취소</div>
				<div class="tabmenu">
				
				<!-- 예약정보 호텔사진 -->
					<div class="resinfo">
						<p class="rinfo">예약 정보</p>
						<hr>
						<div class="article4">
							<div>
								<!-- 호텔 이름 div -->
								<div class="htitle2">
									<h3 id='lodgeName'>-</h3>
								</div>
								
								<!-- 예약정보 테이블 -->
								<div style="margin: 18px;">
									<table class="inforr">
										<tr class = 'colTable'>
											<td class="rowtitle">예약일</td>
											<td class="rowcontent" id='reservationDate'>-</td>
											<td class="rowtitle">결제번호</td>
											<td class="rowcontent" id='oid'>-</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<hr>
					</div>
					
					<!-- 객실정보/취소정책 -->
					<div class="resinfo">
						<p class="rinfo">객실 정보</p>
						<hr>
						<!-- 객실정보  append -->
						<div class='roomInfoTable'>
							
						</div>
					</div>
					
					<!-- 취소사유 옵션 -->
					<div class="resinfo">
						<p class="rinfo">취소 사유</p>
						<hr>
						<table style="margin-left: 44px;">
							<tr>
								<th>사유입력</th>
							</tr>
							<tr>
								<td>
								<!-- 취소사유 입력 select -->
									<select id="reason" name='cancelReason'>
										<option selected>단순 변심</option>
										<option>예약정보 변경(상품,일정,결제수단 등)</option>
										<option>중복예약/이용조건 불만</option>
										<option>기타</option>
									</select>
								</td>
							</tr>
						</table>
						<hr>
					</div>
					
					<!-- 결제정보 테이블 -->
					<div class="resinfo">
						<p class="rinfo">결제 정보</p>
						<hr>
						<table style="margin-left: 44px;">
							<tr>
								<th>예약금액</th>
								<th>바이룸 사용</th>
								<th>쿠폰사용</th>
								<th>포인트사용</th>
								<th>기프트카드 사용</th>
							</tr>

							<tr>
								<!-- 결제정보 가격 data -->
								<td><span id='reservationPrice'>0</span>원</td>
								<td><span id='voucherPrice'>0</span>원</td>
								<td><span id='couponPrice'>0</span>원</td>
								<td><span id='pointPrice'>0</span>원</td>
								<td><span id='giftPrice'>0</span>원</td>
							</tr>
						</table>
						<hr>
					</div>
					
					<!-- 총금액, 취소금액 -->
					<div class="total">
						<p>총 금액&nbsp;<span id='totalPrice'>0</span>원</p><br>
						<p class="nototal">환불 금액&nbsp;<span id='refundPrice'>0</span>원	</p>
					</div>
					
					<div class="cancelNotice">
						<p class="rinfo">취소 규정</p>
						<hr>
							<p class="infoText">&middot; 숙박 및 대실 예약완료 후 10분이내 당일취소 및 변경 가능합니다.</p>
							<p class="infoText">&middot; 숙박 환불기준</p>
							 <table>
		                        <tr class="cancelTitle">                            
		                            <td>유형</td>
		                            <td>체크인 10일전</td>
		                            <td>체크인 9-7일전</td>
		                            <td>체크인 6-5일전</td>
		                            <td>체크인 4-3일전</td>
		                            <td>체크인 2-1일전</td>
		                            <td>당일취소 및 노쇼</td>
		                        </tr>
		                        <tr class="cancelText">
		                            <td>환불기준</td>
		                            <td>총 결제금액 중 100% 환불</td>
		                            <td>총 결제금액 중 70% 환불</td>
		                            <td>총 결제금액 중 50% 환불</td>
		                            <td>총 결제금액 중 30% 환불</td>
		                            <td>총 결제금액 중 10% 환불</td>
		                            <td>환불 불가</td>
		                        </tr>
		                    </table>
		                    <p class="infoText">&middot; 대실 환불기준</p>
		                    <table>
		                        <tr class="cancelTitle">
		                            <td>유형</td>
		                            <td>체크인 1일 전</td>
		                            <td>당일취소 및 노쇼</td>
		                        </tr>
		                        <tr class="cancelText">
		                            <td>환불기준</td>
		                            <td>무료취소 가능</td>
		                            <td>환불불가</td>
		                        </tr>
		                    </table> 
							<hr>	
						</div>
					
						<!-- 취소요청 버튼 div -->
					<div class="canbutt2">
						<!-- <button type="button" id="cR_show">예약취소</button> -->
					</div>
				</div>
			</div>
		</div>
	</div>
		<%@include file="../footer.jsp"%>
	</div>

	<!-- 예약취소 팝업 -->
	<div class="cancelReservation">
	    <div class="window">
	        <div class="popup">
	            <div class="deleteAlert">
	                <img src="../images/icon/blue.png">
	                <div class="deleteText">
	                    <p>예약을 취소하시겠습니까?</p>
	                </div>
	                <!-- 예약취소 div -->
	                <div class="deleteButton">
	                    <button type="button" onclick="$('.cancelReservation').removeClass('show')">닫기</button>
	                    <button type="button" class='cancelBtn'  style="background-color: #4366A3; border: none; color: white;">예약취소</button>
	                	<!-- onclick="location.href='cancel.jsp'" -->
	                </div>
	            </div>
	        </div>
	      </div>
	</div>

<script>

var user_id = '<%=id%>';
var reservation_id = '<%=reservation_id%>';

	/* 예약취소 팝업 */
		$(document).on('click','#cR_show',function(){
			$('.cancelReservation').addClass('show');
		})
		
		/* 예약취소 버튼 눌렀을때 예약취소 기능 */
		$(document).on('click','.cancelBtn',function(){
			var cancelReason;
			/* 예약취소사유 선택한 option text값 */
			cancelReason = $('select[name=cancelReason] option:selected').text();
			
			var sendData = {
					reservation_id : reservation_id,
					cancel_reason : cancelReason,
				 }
			
			  console.log(sendData);
			 $.ajax({
				 contentType: "application/json; charset=utf-8",
				 url : "../v2/cancelations", // 컨트롤러 위치
				// get, post
				// get은 쿼리스트링 방식
				// post 숨겨서 보내야 되므로 ajax안에 data: {}
				 type : "POST",
				 async : false,
				 beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        }, 
			        
				 data : JSON.stringify(sendData),
				//dataType : response 어떤 타입으로 받을지
				dataType : 'JSON',
				success : function(result){
					
					console.log(result);
					
					if(result.message == 'Success'){
						
						location.href='cancel';
						
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
					alert("예약취소에 실패하였습니다.");
					return false;
				}
			})
		})
		
		$(function(){
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../loginpage/login';
			} else {
				/* 예약취소 가능 여부 알려주는 ajax */
				$.ajax({
					url : "../v2/refund-charge?reservation="+ reservation_id, // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        }, 
					success : function(result){
						
						if(result.message == 'Success'){
							refundData = result.data;

							console.log(refundData);
							/* 예약취소, 환불이 가능할때 예약취소 버튼 보여주고 환불가능한 금액 보여줌*/
							if(refundData.can_refund == true){
								$('.canbutt2').append(
									"<button type='button' id='cR_show'>예약취소</button>"
								)
								
								$('#refundPrice').text(refundData.refund_charge.toLocaleString('en'));
								/* 예약취소, 환불 불가일때 */
							} else if (refundData.can_refund == false){
								$('.canbutt2').append(
									"<div>" + refundData.message + "</div>"
								)
								alert(refundData.message);
								$('#refundPrice').text("0");
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
						alert("정보를 읽어 올 수 없습니다. 잠시 후 다시 시도 해주세요.");
						return false;
					}
				})
				
				/* 예약취소 하려는 객실 예약 내용 보여주는 ajax */
				$.ajax({
					url : "../v2/reservation-detail?reservation="+ reservation_id, // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        }, 
					success : function(result){
						
						if(result.message == 'Success'){
							data = result.data;
							roomData = data.rooms;
	
							console.log(data);	
							cancelInfo();
							
							$('#reservationDate').text(data.reservation_date);
							$('#lodgeName').text(data.lodgement_name);
							$('#reservationPrice').text(data.total_price.toLocaleString('en'));
							$('#couponPrice').text(data.coupon_charge.toLocaleString('en'));
							$('#pointPrice').text(data.point_charge.toLocaleString('en'));
							$('#voucherPrice').text(data.gift_charge.toLocaleString('en'));
							$('#giftPrice').text(data.giftcard_charge.toLocaleString('en'));
							$('#totalPrice').text(data.payment_charge.toLocaleString('en'));
							$('#oid').text(data.OID);
							
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
		
		/* 예약취소 객실 옵션 append하는 함수 */
		function cancelInfo(){
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
        		
        		/* 객실 어메니티 한줄에 하나씩 보여주도록 함 */
        		var room_amenity = roomData[i].room_amenity.split("\n"); //어메니티 옵션 데이터 \n으로 나눔
				for (var j in room_amenity) { //room_amenity 반복문
					$('#room_amenity'+i).append(
						"<div style='margin-left: 0px;'>" + room_amenity[j] + "</div>" //한줄에 하나씩 입력되게 append
					)
				}
        	}
       	}
		
    </script>

</body>
</html>