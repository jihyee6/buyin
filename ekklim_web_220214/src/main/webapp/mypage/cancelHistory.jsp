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

.tabmenu {
	max-width: 886px;
	margin: 0 auto;
	position: relative;
	padding-bottom: 34px;
}

.tabmenu h4{
	font-size: 32px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #242424;
}

.tabnav{
	margin-top: 30px;
	display: flex;
}
.tabnav div{
	border: 1px solid #C2C2C2;
	width: 442px;
	height: 69px;
	font-size: 22px;
	font-family: NanumSquare_ac;
	color: #D2D2D2;
	font-weight: bold;
	text-align: center;
	cursor: pointer;
	line-height: 69px;
}
.article2{
	width: 920px;
	margin: 7px auto;
	padding: 12px;
	border-top: 1px solid #9595a3;
	border-bottom: 1px solid #9595a3;
}
.article2 h4{
    margin: 0px;
	font-size: 17px;
	color: #242424;
	font-family: NanumSquare_ac;

}
.htitle h3{
	font-size: 24px;
	color: #242424;
	font-family: NanumSquare_ac;
	padding-bottom: 8px;
}

.htitle{
	margin: 0px;
	width: 100%;
}

.htitle p{
	font-size: 15px;
	color: #242424;
	font-family: malgun;
}
.resprice{
	color: #242424;
	/* padding-top: 62px;
	float: left; */
	text-align: left;

}
.resprice p{
	font-size: 14px;
	margin: 0px;
	margin-top: 28px;
	text-align: right;
}

.resprice span{
	font-size: 24px;
	color: #242424;
	font-weight: bold;
}
.bt{
	loat: right;
}
.resprice > .bt> button{
	width: 120px;
    height: 37px;
    color: #242424;
    font-size: 15px;
	border-radius: 6px;
	font-family: NanumSquare_ac;
	border: 1px solid rgb(159,159,159,0.7);
	background: #FFFFFF;
}

.reinfo{
	color: #FF0000;
	font-size: 16px;
	font-family : NanumSquare_ac;
	margin: 0px;
	font-weight: bold;
	float: right;
}

.article2 img{
	width: 240px;
	height: 178px;	
	border-radius: 8px;

}
.reservationTable{
   /*  display: grid;
    grid-template-columns: 30% 70%; */
    margin: 8px auto;
}
.reservationText{
    width: 94%;
}

.reserArticle{
	font-size: 18px;
	color: #242424;
	font-family: NanumSquare_ac;
	margin: 24px auto;
}

.rinfo {
	margin: 60px 0px 10px 0px;
	font-size: 26px;
	font-family: NanumSquare_ac;
	color: #242424;
}


.resinfo th, td {
	padding: 9px;
	font-size: 16px;
	color: #242424;
}

.resinfo th {
	font-weight: bold;
}

hr {
	width: 920px;
}
.cancel_table table{
	border: 1px solid #DCDCDC;
	border-collapse: collapse;
	width: 100%;
}

.cancel_table table td{
	border-bottom: 1px solid #DCDCDC;
	margin: 0px;
	padding: 18px;
	font-family: NanumSquare_ac;
	font-size: 14px;
	font-weight: bold;
	text-align: center;
	color: #242424;
}

.cancel_table table td:last-child{
	border-bottom: none;
}

.cancel_table td:first-child{
	background-color: #F9F9F9;
}

.cancel_condition{
	width: 292px;
	border-right: 1px solid #DCDCDC;
}

.cancel_fees{
	width: 554px;
}

.cancel_info{
	font-size: 16px;
	font-family: malgun;
	color: #242424;
}

.resinfo > .binfo > .cancel_info{
	margin: 28px auto;
}
.resinfo > .binfo > .cancel_info > .cancel_table table{
	width: 99%;
	margin: 14px auto;
}

.lodgmentNotice{
	line-height: 30px;
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
<%String cancel_id = request.getParameter("cancel"); %>
	<div class="page">
		<%@include file="../header.jsp"%>

		<div class="content">
			<!-- 페이지 제목 -->
			<div class="title">
				<div class="tname">
					<div class="pagename">&nbsp;마이페이지</div>
				</div>
			</div>
			<!-- 마이페이지 메뉴 사이드바 -->
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
				
				<div class="tabmenu">
					<h4>취소내역 상세보기</h4>
					<!-- 취소 숙소 정보 아티클 -->
					<div class="reserArticle">
						<!-- 취소 날짜 data -->
	                    <h4 class="reserDate" style="font-size: 16px;">취소날짜 : <span id='cancelDate'></span></h4>
					    <div class="article2">
					    		<!-- 취소 객실 정보 div -->
						        <div class="reservationTable">
						        	<!-- <img alt="숙소사진" id='lodgementImg' src="../images/reservationimg/hotel.png" style="float: left;"> -->
						            <div class="reservationTexts" style="width: 93%;">
						                <div class="htitle">
						                	<!-- 취소 호텔 이름/ 취소 상태 -->
						                    <h3><span id='hotelName'></span> <span class="reinfo" id='cancelState'>예약취소</span></h3> 
						                    <!-- <p id='roomName'>스탠다드 더블</p> -->
						                    <!-- <p><span id='checkinDate'>2022.01.01(토) - 2022.01.02(일)</span></p> -->
						                </div>
						                <!-- 환불 금액 div -->
						                <div class="resprice">
						                    <p>환불금액 <br><span id='refundPrice'>0</span>원</p>							
						                </div>
						            </div>
						        </div>
							</div>
						</div>		
							
					<div class="resinfo">
						<p class="rinfo">객실 정보</p>
						<hr>
						<!-- 객실 정보 입력 부분 div -->
						<div class='roomInfoTable'>
							
						</div>
					</div>
					
					<!-- 취소 정보 div -->
					<div class="resinfo">
						<p class="rinfo">취소 정보</p>
						<hr>
						<table style="margin-left: 44px;">
							<tr>
								<th>접수번호</th>
								<th>취소사유</th>
								<!-- <th>환불수단</th> -->
								<th>환불금액</th>
							</tr>

							<tr>
								<td id='receiptNumber'>-</td>
								<td id='cancelReason'>-</td>
								<!-- <td id='refundMeans'>카카오뱅크카드 </td> -->
								<td><span id='refundAmount'>-</span>원</td>
							</tr>
						</table>
						<hr>
					</div>
					
					<!-- 취소 규정 부분 -->
					<div class="resinfo">
						<p class="rinfo">취소 규정</p>
						<hr>
							<div class="binfo">
							<div class="cancel_info">
								<!-- 취소 규정 주의사항 -->
								<div class="lodgmentNotice">
									<p>&middot; 숙박 및 대실 예약완료 후 10분이내 당일취소 및 변경 가능합니다.</p>
									<p>&middot; 숙박 환불기준</p>
								</div>
								<!-- 취소 규정 테이블 -->
 								<div class="cancel_table">
	 								<table>
		 								<tr class="cancel_condition">
			 								<td>유형</td>
			 								<td>체크인 10일전</td>
			 								<td>체크인 9-7일전</td>
			 								<td>체크인 6-5일전</td>
			 								<td>체크인 4-3일전</td>
			 								<td>체크인 2-1일전</td>
			 								<td>당일취소 및 노쇼</td>
		 								</tr>
		 								<tr class="cancel_fees">
			 								<td>환불기준</td>
			 								<td>총 결제금액 중 100% 환불</td>
			 								<td>총 결제금액 중 70% 환불</td>
			 								<td>총 결제금액 중 50% 환불</td>
			 								<td>총 결제금액 중 30% 환불</td>
			 								<td>총 결제금액 중 10% 환불</td>
			 								<td>환불 불가</td>
	 								
	 									</tr>								
	 								</table>
	 								<!-- 대실 환불 기준 테이블 -->
	 								<p>&middot; 대실 환불 기준</p>
	 								<table>
		 								<tr class="cancel_condition">
		 									<td>유형</td>
		 									<td>체크인 1일전</td>
		 									<td>당일취소 및 노쇼</td>								
		 								</tr>
		 								
		 								<tr class="cancel_fees">
		 									<td>환불기준</td>
		 									<td>무료취소 가능</td>
		 									<td>환불불가</td>
		 								</tr>
	 								</table>
 								</div>
							</div>
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>




	<%@include file="../footer.jsp"%>
	</div>
	<script>
	var user_id = '<%=id%>';
	var cancel_id = '<%=cancel_id%>';
	
	/* 취소내역 보여주는 ajax */
	$(function() {
		
		$.ajax({
			url : "../v2/cancelation-detail?cancelation="+ cancel_id, // 컨트롤러 위치
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
					cancel();
					
					 $('#cancelDate').text(data.cancelation_date);
					 $('#cancelState').text(data.state);
					 $('#hotelName').text(data.lodgement_name);
					 $('#refundPrice').text(data.refund_charge.toLocaleString('en'));
					 $('#receiptNumber').text(data.OID);
					 $('#cancelReason').text(data.cancel_reason);
					 $('#refundAmount').text(data.refund_charge.toLocaleString('en'));
					
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
	
	/* 취소 객실 정보 append 함수 */
	function cancel(){
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
			
			var room_amenity = roomData[i].room_amenity.split("\n"); //어메니티를 자른후에 한 줄에 하나씩 밑으로 보여주도록 설정
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