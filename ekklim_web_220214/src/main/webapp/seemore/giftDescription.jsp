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

.giftDetail{
	width: 1300px;
}

.giftcardExplain, .giftInformation, .giftGuide, .recommentGift{
	margin-top: 60px;
}

.giftDetail h4{
	font-size: 26px;
	font-family: NanumSquare_ac;
	color: #242424;
	border-bottom: rgb(138,138,138,0.5);
}
.giftDetail hr{
	margin: 16px auto;
	color: rgb(138,138,138,0.5);
	}

.cardArticle{
	display: grid;
	grid-template-columns: 50% 50%;
	margin-top: 24px;
	font-family: NotoSansM;
}
.cardImg{
	width: 548px;
	height: 446px;
	background: #F6F6F6;
}
.cardImg img{
	transform: translate(13%, 38.5%);
}

.cardText{
	width: 100%;
	line-height: 60px;
	font-family: NotoSansR;
}

.cardProvider img{
	float: right;
	width: 58px;
	cursor: pointer;
}

.cardProvider{
	font-size: 24px;
	color: #707070;
}

.kindsOfCard{
	font-size: 32px;
	color: #242424;
}

.cardMoney{
	font-size: 32px;
	color: #303030;
	font-family: NotoSansM;
}

.giftPeriod table{
	border-top: 1px solid rgb(138,138,138,0.5);
	border-collapse: collapse;
	margin-top: 52px;
	margin-left: 0px;
}

.giftPeriod table td{
	margin: 0px;
	padding: 4px;
	border-bottom: 1px solid rgb(138,138,138,0.5);
	font-size: 14px;
	height: 38px;
	line-height: 38px;
	color: #242424;
	font-family: NotoSansR;
}

.periodTitle{
	width: 160px;
	background: #F6F6F6;
}

.periodTitle td{
	text-align: center;
}

.periodContent{
	width: 436px;
}

.periodContent td p{
	text-align: left;
	padding-left: 10px;
}

.useButton button{
	width: 282px;
	height: 48px;
	background-color: #FFFFFF;
	border: 1px solid rgb(138,138,138,0.5);
	color: #707070;
	font-size: 16px;
	font-family: NanumSquare_ac;
	border-radius: 8px;
	margin-right: 26px;
}

.useButton{
	margin-top: 8px;
	/* margin-left: 10px; */
	margin-bottom: 4px;
}

.giftButton{
	width: 594px;
	/* margin: 4px 0px 0px 10px; */
	height: 54px;
	border: none;
	border-radius: 8px;
	font-size: 22px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #FFFFFF;
	background-color: #3966B7;
	cursor: pointer;
	}
	
.giftInfoImg{
	text-align: center;
	margin-top: 32px;
}

.giftGuide ul li{
	list-style: none;
	line-height: 28px;
	font-size: 18px;
	font-family: NanumSquare_ac;
}
li{
    list-style-type: none;
}
.giftType{
    width: 226px;
    display: inline-block;
    margin: 26px 36px;
}

.giftType p{
    line-height: 28px;
    text-align: center;
    font-family: NotoSans;
}

.giftType img{
    margin-bottom: 10px;
    width: 226px;
    height: 141px;
}

.cardType{
    color:#242424;
    font-size: 18px;
    
}

.cardPrice{
    font-size: 20px;
    font-weight: bold;
    color: #E75A00;
}

.provider{
    color: #707070;
    font-size: 16px;           
}
#slideShow{
    width: 100%;
    height: 286px;
    position: relative;
    margin: 30px auto;
    overflow: hidden;
}
.slides{
    position: absolute;
    left: 0;
    top: 0;
    width: 1900px;
    transition: left 0.5s;
}
.slides li:not(:last-child){
    float: left;
    margin-right: -7px;
}
.slides li{
    float: left;
}
.controller span{
    position: absolute;
    background: transparent;
    color: black;
    text-align: center;
    border-radius: 50%;
    padding: 10px 20px;
    top: 24%;
    font-size: 1.3rem;
    
}
 .controller span img{
 	width: 82%;
 }

.prev{
    left: -24px;
}

.next{
    right: -26px;
}
.giftType{
	font-family: NotoSansM;
}
      
.refundTable, .productTable {
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
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
}

.show .popup {
	transform: translate(-50%, -50%);
	transition: all .5s;
}

.pTitle{
	padding: 8px;
	width: 486px;
}


.refundNotice{
    padding: 10px;
    margin: 0 auto;
    font-family: NotoSans;
    color: #242424;
}

.refundNotice p{
    font-size: 24px;
    margin: 8px auto;
}

.refundNotice ul{
    line-height: 30px;
    padding-left: 0px;
}

#close5, #close6{
    float: right;
    transform: translateY(-50px);
    cursor: pointerl
}
      
.productContent {
	font-size: 16px;
	font-family: NotoSans;
	color:#242424;
	line-height: 26px;
	padding: 8px;
}     

.contentTitle{
	font-size: 24px;
	margin: 12px auto;
}

.contentText{
	font-size: 16px;
}
	
.pruductTitle{
	margin-top: 18px;
}	
/* 공유하기 버튼 css 시작 */
.bollom {
	position: relative;
	padding: 10px 10px 10px 10px;
	background: #FFFFFF;
	border-radius: 5px;
	border: #CCCCCC solid 1px;
	position: absolute;
	font-size: 16px;
	text-align: left;
	width: 256px;
	height: 36px;
	left: 1428px;
	top: 308px;
	display: none;
}

.bollom:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 16px 20px 17.5px;
	border-color: #FFFFFF transparent;
	display: block;
	width: 0;
	z-index: 1;
	top: -19.5px; 
	left: 129px; 
}

.bollom:before {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 16px 20px 17.5px;
	border-color: #CCCCCC transparent;
	display: block;
	width: 0;
	z-index: 0;
	top: -21px;
	left: 129px;
}

.urlInput{
	width: 176px;
	height: 26px;
	border: 1px solid #CCCCCC;
	font-size: 12px;
	font-family: NotoSans;
	color: #000000;
}
.urlBtn{
	width: 64px;
	height: 30px;
	background-color: white;
	border: 1px solid #707070;
	font-size: 12px;
	font-family: NotoSans;
	color: #000000;
}
	
</style>

</head>
<body>
<%int giftcard_id = Integer.parseInt(request.getParameter("giftcard_id"));%>
	<div class="page">
		<%@include file="../header.jsp"%>	
		<div class="content">
			<!-- 선물 상세보기 전체 div -->
			<div class="giftDetail">
				<!-- 선물상세보기 카드종류, 가격, 선물하기 부분 -->
				<div class="giftcardExplain">
					<h4>선물 상세보기</h4>
					<hr>
					<!-- 선물상세보기 가격, 기간 정보 -->
					<div class="cardArticle">
						<!-- 카드이미지 -->
						<div class="cardImg">
							<img alt="기프트카드 이미지" id="giftcard_img_url" src="../images/giftcards/giftcard30.png" style = 'width: 80%'>
						</div>
						<!-- 선물 정보 -->
						<div class="cardText">
							<p class="cardProvider">BUY IN HOTEL<img alt="" src="../images/reservationimg/share.png" onclick='shareUrl()'></p>
							<!-- url 복사 div -->
							<div class='bollom'>
								<input class='urlInput' type='text' value="" name='urlValue'>
								<button class='urlBtn' type='button' onclick="clip();">url 복사</button>	
 							</div>
							<p class="kindsOfCard" id="giftcard_name"><!-- 기프트카드 300,000원권 --></p>
							<p class="cardMoney"><span class="giftcard_price"></span>원</p>
							<!-- 유효기간, 사용처 테이블 -->
							<div class="giftPeriod">
								<table>
									<tr class="periodTitle">
										<td><p>유효기간</p></td>
										<td><p>사용처</p></td>									
									</tr>
									<tr class="periodContent">
										<td><p id="valid_period"><!-- 365일 --></p></td>
										<td><p id="giftcard_usage"><!-- 온라인(전용 앱, 전용 홈페이지) --></p></td>									
									</tr>
								</table>
								<!-- 주의사항 버튼 -->
								<div class="useButton">
									<button type="button" id ="PD_show">상품정보 고시</button>
									<button type="button"  id="RE_show">환불정책 및 방법</button>
								</div>
								<button type="button" class="giftButton" id='giftcardBtn'>선물하기</button>								
							</div>
						</div>
					</div>				
				</div>
				<!-- 상품설명 부분(이미지) -->
				<div class="giftInformation">
					<h4>상품 설명</h4>
					<hr>
					<!-- 상품설명 이미지 -->
					<div class="giftInfoImg">
						<img id="giftcard_detail_img_url" src="../images/giftcards/giftcardDetail.png">
					</div>					
				</div>
				
				<!-- 이용안내 부분 -->
				<div class="giftGuide">
					<h4>이용안내</h4>
					<hr>
					<ul>
						<li>&middot; 본 모바일 상품권은 앱 내에서 예약시 사용할 수 있는 GIFT CARD입니다.</li>
						<li>&middot; 실물 카드는 발급되지 않으며, 선물받은 카드는 [마이페이지 > 선물하기 > 선물함] 에서 확인하실 수 있습니다.</li>
					</ul>
				</div>
				
				<!-- 추천선물 부분 -->
				<!-- <div class="recommentGift">
					<h4>추천선물</h4>
					<hr>
					<div id="slideShow">
				        <ul class="slides">
				         추천기프트카드 div
				            <li><div class="giftType">
				            <img alt="기프트카드사진" src="../images/giftcards/giftcard3.png">
				            <p class="cardType">기프트카드 30,000원권</p>
				            <p class="cardPrice">30,000원</p>
				            <p class="provider">이끌림</p>
				        </div></li>
				        추천 기프트카드 div 끝
				        </ul>    
				        추천 기프트카드 슬라이드 클릭버튼
				        <p class="controller">
				            <span class="prev"><img src="../images/mainimg/arrleft.png"></span>
				            <span class="next"><img src="../images/mainimg/Right.png"></span>
				        </p>        
				    </div>
					
				</div> -->
			
			</div>
		</div>

		<%@include file="../footer.jsp"%>
	</div>
	<!-- 환불정책 팝업 -->
		<div class="refundTable">
		    <div class="window">
		        <div class="popup">
		            <div class="pTitle">
		                <img src="../images/icon/popupX.png" id="close5">
		                <div class="refundNotice">
		                    <p>환불정책 및 방법</p>
		                  <ul>
		                      <li>- 선물하기>선물함>받은선물 에서 환불요청이 가능합니다.</li>
		                      <li>- 유효기간 이내 환불 요청시 결재금액의 100% 환불 가능합니다.</li>
		                      <li>- 유효기간 이후 환불 요청시 결제금액의 90% 환불 가능합니다.</li>
		                      <li>- 유효기간 이내 환불금액은 구매자에게 환불됩니다.</li>
		                      <li>- 유효기간 이후 환불금액은 수신자에게 환불됩니다.</li>
		                      <li>- 일부금액 사용 후에는 환불이 되지 않습니다.</li>
		                      <li>- 부분환불은 불가능합니다.</li>
		                  </ul>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
		<!-- 상품정보 고시 팝업 -->
		<div class="productTable">
		    <div class="window">
		        <div class="popup">
		            <div class="pTitle">
		                <img src="../images/icon/popupX.png" id="close6">
		                <div class="productContent">
		                    <p class="contentTitle">상품정보 고시</p>
			                    <div class="contentText">
				                    <p class="pruductTitle">[발행자]</p>
				                 	<p>(주)바이인호텔</p>
				                 	<p class="pruductTitle">[환불정책]</p>
				                 	<p>환불정책 및 방법 참조</p>
				                 	<p class="pruductTitle">[사용조건]</p>
				                 	<p>명시된 유효기간 내에 사용할 수 있으며 유효기간 만료 후에는 결제금액의 90% 환불 가능합니다. 숙소 예약시 결제화면에서 사용하실 수 있으며 한번에 여러장의 상품권을 사용하실 수 없습니다.</p>
				                 	<p class="pruductTitle">[사용처]</p>
				                 	<p>온라인(전용 앱, 전용 홈페이지)</p>
				                 	<p class="pruductTitle">[소비자상담 관련번호]</p>
				                 	<p>062-230-0115</p>
				                 </div>
			                </div>
			            </div>
			        </div>
			    </div>
			</div>
</body>
	<script>
		var giftcard_id = <%=giftcard_id%>;
		var user_id = '<%=id%>';
	
	$(function() {
		
		$.ajax({
			/* 기프트카드 data ajax */
			url : "../giftcard-info?giftcard="+giftcard_id, // 컨트롤러 위치
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
					
					$('.giftcard_price').text(data.giftcard_price.toLocaleString('en'));
					$('#giftcard_detail_img_url').attr("src", data.giftcard_detail_img_url);
					$('#giftcard_id').text(data.giftcard_id);
					$('#giftcard_name').text(data.giftcard_name);
					$('#giftcard_img_url').attr("src", data.giftcard_img_url);
					$('#giftcard_name').text(data.giftcard_name);
					$('#giftcard_price').text(data.giftcard_price);
					$('#giftcard_usage').text(data.giftcard_usage);
					$('#valid_period').text(data.valid_period);
					
					
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
	
	/* 선물하기 버튼 클릭시 결제정보입력 페이지로 넘어감 */
	$(document).on('click','#giftcardBtn',function(){
		if(user_id == null || user_id == "null") {
			alert("로그인 후 이용하실 수 있습니다.")
			location.href = '../loginpage/login'
		} else {
			location.href = 'giftPayment?giftcard_id=' + giftcard_id;
		}
	})
	
	</script>	
	
 <script>
 	/* 환불정책 팝업 */
 	$(document).on('click','#RE_show',function(){
 		$('.refundTable').addClass('show');
 	})
 	$(document).on('click','#close5',function(){
 		$('.refundTable').removeClass('show');
 	})
 	
 	/* 상품정보고시 팝업 */
	$(document).on('click','#PD_show',function(){
	$('.productTable').addClass('show');
 	})
 	$(document).on('click','#close6',function(){
 		$('.productTable').removeClass('show');
 	})
		
   </script>
   
    <script>
		/* 공유하기 아이콘의 url input 창에  현재페이지 url 입력하기 */
		var link = document.location.href;
		$('input[name=urlValue]').attr('value',link);
		
		/* url 복사하기 */
		function clip(){
			var url = '';
			var textarea = document.createElement("textarea");
 			document.body.appendChild(textarea);
 			url = window.document.location.href;
 			textarea.value = url;
 			textarea.select();
 			document.execCommand("copy");
 			document.body.removeChild(textarea);
			alert("URL이 복사되었습니다.")
		}
		//url 공유하는 팝업 보여주고 닫는 함수
		function shareUrl(){
			if($('.bollom').css('display') == 'none'){
				$('.bollom').css('display','flex');
			}else{
				$('.bollom').css('display','none');
			}
		}
 	</script>

</html>