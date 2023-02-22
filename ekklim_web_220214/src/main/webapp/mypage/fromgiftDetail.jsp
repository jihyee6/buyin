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

.giftPay h4{
	font-size: 24px;
	font-family: NanumSquare_ac;
	color: #242424;
	margin-top: 42px;
}

.payArticle{
	display: grid;
	grid-template-columns: 20% 60% 20%;
	margin: 16px auto;
	border-top: 1px solid #8A8A8A;
	border-bottom: 1px solid rgb(138,138,138,1.5);
	
}

.payImg img{
	width: 80%;
	position: absolute;
	top: 12%;
	left: 11%;
}

.payImg{
	width: 100%;
	height: 115px;
	background-color: #F6F6F6;
	position: relative;
	border-right: 1px solid rgb(112,112,112,0.5);
}
.payText{
	font-family: NotoSansM;
	width: 100%;
	
}

.payText p{
	margin-left: 16px;
	line-height: 24px;
	font-family: NotoSansM;
}

.giftPeople{
	padding-bottom: 28px;
}

.giftHotel{
	font-size: 16px;
	color: #707070;
	
}
.giftMoney, .giftPeople{
	font-size: 18px;
	color: #242424;
}

.payment{
	background-color: #F6F6F6;
	width: 100%;
	height: 115px;
	border-left: 1px solid rgb(112,112,112,0.5);
}

.payment p{
	font-size: 24px;
	color: #4366A3;
	text-align: center;
	line-height: 115px;
}

.okpayment{
	margin: 30px auto;
	border-top: 2px solid #8A8A8A;
	border-bottom: 2px solid #8A8A8A;
}


.complateTable{
	margin: 18px auto;
}

.complateTable table{
	border-top: 2px solid #8A8A8A;
	border-bottom: 2px solid #8A8A8A;
	width: 100%;
	margin: 0px;
	border-collapse: collapse; 
}

.complateTable table td{
	margin: 0px;
	padding: 14px;
	font-size: 16px;
	color: #242424;
	height: 18px;
	border-bottom: 1px solid rgb(138,138,138,0.5);
	font-family: NotoSansM;
}

.sendTitle{
	width: 19%;
	background: #F2F2F2;
}

.sendTitle td{
	text-align: center;
}

.complateTable td:last-child{
	border-bottom: none;
}

.sendText {
	width: 81%;
}

.giftPay input, .giftPay select{
	border: 1px solid rgb(112,112,112,0.5);
	border-radius: 4px;
	height: 22px;
}


.way{
	width: 860px;
	border-top: 2px solid #707070;
	border-bottom: 2px solid #707070;
	border-collapse: collapse;
	background-color: #F2F2F2;
}
.way tr{
	display: flex;
	border-bottom: 1px solid #C2C2C2;
	align-items: center;
	width: 100%;
}
.way tr:last-child{
	border-bottom: none;
}

.way th{
	width: 740px;
	padding: 10px;
	line-height: 30px;
	font-size: 18px;
	font-family: NanumSquare;
	color: #242424;
}
.way > .useTitle td{
	width: 110px;
	padding: 10px;
	text-align: center;
	color: #707070;
	font-size: 30px;
}
.way td{
	padding: 10px;
}
.useContent td{
	line-height: 28px;
	font-size: 16px;
	font-family: NotoSansR;
}
.useContent{
	display: none;
}

.howtoUse{
	margin: 72px auto;
}

.sendText button{
	margin-left: 10px;
	background-color: white;
	border: 1px solid #707070;
	border-radius: 4px;
	font-size: 14px;
	cursor: pointer;
}

.refundAlert{
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
.refundAlert.show >.window> .popup {
	width: 510px;
}
.beforeUse{
	color: #3399FF; 
}
.afterUse{
	color: #FF0404;
}
#giftState{
	font-weight: bold;
}
.giftCancelBtn{
	width: 85px;
	height: 28px;
	background-color: white;
	border: 1px solid #707070;
	border-radius: 5px;
	font-size: 14px;
	font-family: NotoSansR;
	color: #242424;
	margin-left: 6px;
	display: none;
}
</style>

</head>
<body>
<%
	String rooms = request.getParameter("room"); 
	String type = request.getParameter("type");
%>
	<%@include file="../header.jsp"%>
	
	<div class="page">

		<div class="content">
			<div class="title">
				<div class="tname">
					<div class="pagename">&nbsp;마이페이지</div>
					
				</div>
			</div>
			<div class='pageContent'>
			<!-- 마이페이지 메뉴 사이드바 div -->
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
				<div class="maintitle">받은선물 상세보기</div>
				<div class="tabmenu">
					<div class="tabcon">
					<div class="giftPay">
						<div class="productInfomation">
							<h4>상품정보</h4>
							<!-- 기프트카드 가격, 보낸이 정보 아티클-->
							<div class="payArticle">
								<!-- 기프트카드 img div -->
								<div class="payImg">
									<img id="giftcard_img_url">
								</div>
								<!-- 보낸사람, 호텔 이름, 기프트 가격 정보 div -->
								<div class="payText">
									<p class="giftPeople">FROM. <span id='gift_sender'></span>님</p>
									<p class="giftHotel"></p>
									<p class="giftMoney" id="giftcard_name"></p>
								</div>
								<!-- 선물할 기프트 가격 정보 div -->
								<div class="payment">
									<p><span class = 'giftcard_price'></span>원</p>
								</div>					
							</div>
						</div>
						
						<!-- 선물정보 -->
						<div class="Sender">
							<h4>선물정보</h4>
							<div class="complateTable">
								<table>
									<tr class="sendTitle">
										<td>선물정보</td>
										<td>유효기간</td>
										<td>사용처</td>
										<td>선물상태</td>
									</tr>
									<!-- 선물정보 결과 -->
									<tr class="sendText">
										<td><span class = 'giftcard_price'></span>원</td>
										<td id="valid_period"></td>
										<td id="giftcard_usage"></td>
										<td style = 'padding: 8px 14px;'><span id='giftState'></span><!-- <button type="button" id="refund_show" class='giftCancelBtn'>거절하기</button> --></td>
									</tr>
								</table>
							</div>
						</div>
						
						<!-- 이용안내, 환불취소 방법 -->
						<div class="howtoUse">
							<table class="way">
								<tr class='useTitle'>
									<th><span>이용안내</span></th>
									<td><span id="aro"><img src="../images/down.png"></span></td>
								</tr>
								<tr class='useContent' style='display: none;'>
									<td>										
										<p>- 본 모바일 상품권은 앱 내에서 예약시 사용할 수 있는 GIFT CARD 입니다.</p>
										<p>- 실물카드는 발급되지 않으며, 선물받은 카드는 [ 마이페이지 - 선물하기 - 선물함 ] 에서 확인하실 수 있습니다.</p>
										<p>- 사용완료된 선물기록은 6개월동안 보관됩니다.</p>																				
									</td>
								</tr>
								<tr class='useTitle'>
									<th><span>환불/취소 정책 및 방법</span></th>
									<td><span id="aro"><img src="../images/down.png"></span></td>
								</tr>
								<tr class='useContent' style='display: none;'>
									<td>
										<p>- 선물하기 > 선물함 > 받은선물 에서 환불요청이 가능합니다.</p>
										<p>- 유효기간 이내 환불 요청시 결제금액의 100% 환불 가능합니다.</p>
										<p>- 유효기간 이후 환불 요청시 결제금액의 90% 환불 가능합니다.</p>
										<p>- 유효기간 이내 환불금액은 구매자에게 환불됩니다.</p>
										<p>- 유효기간 이후 환불금액은 수신자에게 환불됩니다.</p>
										<p>- 일부금액 사용 후에는 환불이 되지 않습니다.</p>
										<p>- 부분환불은 불가능합니다.</p>																					
									</td>
								</tr>
							</table>
						</div>										
					</div>
				</div>
			</div>
		</div>

		</div>
	</div>
		<%@include file="../footer.jsp"%>
	</div>
		<!-- 환불요청 팝업 -->
		<div class="refundAlert">
		    <div class="window">
		        <div class="popup">
		            <div class="deleteAlert">
		                <img src="../images/icon/blue.png">
		                <div class="deleteText">
		                    <p>거절시 상품권을 사용하실 수 없습니다.</p>
		                    <P>거절을 진행하시겠습니까?</P>
		                </div>
		                <!-- 환불요청 확인/취소 버튼 -->
		                <div class="deleteButton">
		                    <button type="button" onclick="$('.refundAlert').removeClass('show')">취소</button>
		                    <button type="button" onclick="location.href='cancel.jsp'" style="background-color: #4366A3; border: none; color: white;">확인</button>
		                </div>
		            </div>
		        </div>
		      </div>
		</div>
</body>

<script>
<%int gift_id = Integer.parseInt(request.getParameter("gift_id"));%>
 	
 	/* 기프트 카드 정보 ajax */
	$(function() {
		
		var gift_id = <%=gift_id%>;
		var type = '<%=type%>';
		var user_id = '<%=id%>';
		
		$.ajax({
			url : "../gift-receive-detail?gift="+gift_id +'&type=' + type, // 컨트롤러 위치
			type : "GET",
			dataType : 'JSON',
			// beforeSend = Header 먼저 보내주는부분 
			beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
	        },
			success : function(result){
				
				if(result.message == 'Success'){
					data = result.data;
					console.log(data);	
					
					$('.giftcard_price').text(data.gift_price.toLocaleString('en'));
					$('#giftcard_detail_img_url').attr("src", data.giftcard_detail_img_url);
					$('#giftcard_id').text(data.giftcard_id);
					$('#giftcard_name').text(data.giftcard_name);
					$('#giftcard_img_url').attr("src", data.gift_img_url);
					$('#giftcard_name').text(data.giftcard_name);
					$('#giftcard_price').text(data.gift_price);
					$('#giftcard_usage').text(data.gift_usage);
					$('#valid_period').text(data.gift_valid_date);
					$('#gift_sender').text(data.gift_sender);
					$('#giftState').text(data.gift_state);
					
					if($('#giftState').text() == '사용전'){
						$('#giftState').addClass('beforeUse');
						$('.giftCancelBtn').css('display','inline');
					} else if(('#giftState').text() == '사용완료'){
						$('#giftState').addClass('afterUse');
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
				alert("검색실패options");
				return false;
			}
		})
	
	})

</script>

<script>
	/* 선물거절하기 클릭후 환불 요청 팝업 띄우기 */
	function refund_show() {
		document.querySelector(".refundAlert").className = "refundAlert show";}
		document.querySelector("#refund_show").addEventListener('click',refund_show);
</script>
<script>
	/* 이용 안내, 환불 취소 방법 div 클릭시 밑에 상세 정보 div 보이게 함 */
	$('.useTitle').click(function(){
		$(this).next().toggle();
	})
</script>

</html>