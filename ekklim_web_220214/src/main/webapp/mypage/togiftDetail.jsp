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
	width: 86%;
	position: absolute;
	top: 18%;
	left: 7%;
}

.payImg{
	width: 100%;
	height: 140px;
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
	line-height: 34px;
}

.giftPeople{
	padding-bottom: 12px;
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
	height: 140px;
	border-left: 1px solid rgb(112,112,112,0.5);
}

.payment p{
	font-size: 24px;
	color: #4366A3;
	text-align: center;
	line-height: 140px;
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
	font-family: NotoSansM;
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
	font-weight: bold;
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
	width: 730px;
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

.howtoUse{
	margin: 72px auto;
}
.useContent td{
	line-height: 28px;
	font-size: 16px;
	font-family: NotoSansR;
}
.useContent{
	display: none;
}
.beforeUse{
	color: #3399FF !important; 
}
.afterUse{
	color: #FF0404 !important;
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
				<div class="maintitle">보낸선물 상세보기</div>
				<div class="tabmenu">
					<div class="tabcon">
					<div class="giftPay">
						<div class="productInfomation">
							<h4>상품정보</h4>
							<!-- 상품정보 카드설명 -->
							<div class="payArticle">
							<!-- 선물 이미지 div -->
							<div class="payImg">
								<img id="giftcard_img_url" src="">
							</div>
							<!-- 상품정보 가격, 보낸사람 -->
							<div class="payText">
								<p class="giftPeople">TO. <span class='gift_receiver'></span>님</p>
								<p class="giftHotel">BUY IN HOTEL</p>
								<p class="giftMoney" id="giftcard_name" ></p>
							</div>
							<!-- 선물가격 div -->
							<div class="payment">
								<p><span class="giftcard_price"></span>원</p>
							</div>					
							</div>
						</div>
						
						<!-- 선물정보 부분 -->
						<div class="Sender">
							<h4>선물정보</h4>
							<div class="complateTable">
								<table>
									<tr class="sendTitle">
										<td>받는분</td>
										<td>받는분 번호</td>
										<td>유효기간</td>
										<td>선물상태</td>
									</tr>
									<!-- 받는 사람 data 넣는 곳 -->
									<tr class="sendText">
										<td class='gift_receiver'></td>
										<td id='receiverNumber'></td>
										<td id='giftValidDate'></td>
										<td><div><span id='giftState'></span><!-- <input type='button' class='giftCancelBtn' value = '취소하기'> --></div></td>
									</tr>
								</table>
							</div>
						</div>
						
						<!-- 구매정보 부분 -->
						<div class="PurchaseInfo">
							<h4>구매정보</h4>
							<div class="complateTable">
								<table>
									<tr class="sendTitle">
										<td>구매번호</td>
										<td>선물구매일</td>
										<td>결제수단</td>
										<td>총 결제금액</td>
									</tr>
									<!-- 구매정보 data 정보 넣는 곳 -->
									<tr class="sendText">
										<td id = 'purchase_id'></td>
										<td id='purchase_date'></td>
										<td id='purchaseMethod'></td>
										<td style="font-weight: bold;"><span class="giftcard_price"></span>원</td>
									</tr>
								</table>
							</div>						
						</div>
						
						<!-- 이용안내, 환불/취소정책 부분 -->
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
<script>

<%int gift_id = Integer.parseInt(request.getParameter("gift_id"));%>

<%-- $(function() {
	
	var gift_id = <%=gift_id%>;
	
	$.ajax({
		url : "../giftcard-info?giftcard="+gift_id, // 컨트롤러 위치
		type : "GET",
		dataType : 'JSON',
		// beforeSend = Header 먼저 보내주는부분 
		beforeSend: function (xhr) {
            xhr.setRequestHeader("user","kakaoE2149996795");
        },
		success : function(result){
			
			if(result.message == 'Success'){
				data = result.data;
				console.log(data);	
				
	 			$('.giftcard_price').text(data.giftcard_price.toLocaleString('en'));
				$('#giftcard_detail_img_url').attr("src", data.giftcard_detail_img_url);
				$('#giftcard_id').text(data.giftcard_id);
				$('#giftcard_name').text(data.giftcard_name);
				$('#giftcard_img_url').attr("src", data.giftcard_img_url);
				$('#giftcard_name').text(data.giftcard_name);
				$('#giftcard_price').text(data.giftcard_price);
				$('#giftcard_usage').text(data.giftcard_usage);
				$('#valid_period').text(data.valid_period); 
				
				
				//gifts();
				//giftSends();
				
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
}) --%>

$(function() {
	
	var gift_id = <%=gift_id%>;
	var type = '<%=type%>';
	var user_id = '<%=id%>';

	/* 보낸선물 정보 보여주는 ajax */
	$.ajax({
		url : "../gift-send-detail?gift=" + gift_id + '&type=' + type, // 컨트롤러 위치
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
				$('#giftcard_img_url').attr("src", data.gift_img_url);
				$('.gift_receiver').text(data.gift_receiver);
				$('#giftcard_name').text(data.gift_name);
				$('#giftcard_price').text(data.gift_price);
				
				//휴대폰 번호에 - 넣기
				var phoneNum = data.gift_receiver_tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
				
				$('#receiverNumber').text(phoneNum);
				$('#giftValidDate').text(data.gift_valid_date);
				$('#giftState').text(data.gift_state);
				$('#purchase_id').text(data.purchase_id);
				$('#purchase_date').text(data.purchase_date);
				$('#purchaseMethod').text(data.purchase_method);
				
				/* giftstate 선물 상태 text에 따라서 css 추가 */
				if($('#giftState').text() == '사용전'){
					$('#giftState').addClass('beforeUse');
					$('.giftCancelBtn').css('display', "inline");
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
	//이용안내 div 클릭시 밑에 있는 답변 toggle 되서 보임
	$('.useTitle').click(function(){
		$(this).next().toggle();
	})
</script>

</body>
</html>