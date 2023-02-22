<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.inicis.std.util.SignatureUtil"%>
<%@page import="java.util.*"%>
<%

	/*
		//*** 위변조 방지체크를 signature 생성 ***

			oid, price, timestamp 3개의 키와 값을

			key=value 형식으로 하여 '&'로 연결한 하여 SHA-256 Hash로 생성 된값

			ex) oid=INIpayTest_1432813606995&price=819000&timestamp=2012-02-01 09:19:04.004
				

			 * key기준 알파벳 정렬

			 * timestamp는 반드시 signature생성에 사용한 timestamp 값을 timestamp input에 그대로 사용하여야함
	*/

	//############################################
	// 1.전문 필드 값 설정(***가맹점 개발수정***)
	//############################################

	// 여기에 설정된 값은 Form 필드에 동일한 값으로 설정
//	String mid					= "INIpayTest";		// 가맹점 ID(가맹점 수정후 고정)
	String mid					= "ekklimkr00";
	
	//인증
//	String signKey			    = "SU5JTElURV9UUklQTEVERVNfS0VZU1RS";	// 가맹점에 제공된 웹 표준 사인키(가맹점 수정후 고정)
	String signKey			    = "S0pDcnVhczg4MWpwYmZuclhGQ09Pdz09";
//	String timestamp			= SignatureUtil.getTimestamp();			// util에 의해서 자동생성

//	String oid					= mid+"_"+SignatureUtil.getTimestamp();	// 가맹점 주문번호(가맹점에서 직접 설정)
//	String price				= "1000";													// 상품가격(특수기호 제외, 가맹점에서 직접 설정)

	String cardNoInterestQuota	= "11-2:3:,34-5:12,14-6:12:24,12-12:36,06-9:12,01-3:4";		// 카드 무이자 여부 설정(가맹점에서 직접 설정)
	String cardQuotaBase		= "2:3:4:5:6:11:12:24:36";		// 가맹점에서 사용할 할부 개월수 설정

	//###############################################
	// 2. 가맹점 확인을 위한 signKey를 해시값으로 변경 (SHA-256방식 사용)
	//###############################################
	String mKey = SignatureUtil.hash(signKey, "SHA-256");
	
	//###############################################
	// 2.signature 생성
	//###############################################
//	Map<String, String> signParam = new HashMap<String, String>();

//	signParam.put("oid", oid); 					// 필수
//	signParam.put("price", price);				// 필수
//	signParam.put("timestamp", timestamp);		// 필수

	// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
//	String signature = SignatureUtil.makeSignature(signParam);
	
	
	/* 기타 */
	String path = request.getRequestURL().toString().split("buyinhotel")[0];
	
	
	String siteDomain = path + "buyinhotel.co.kr/seemore"; //가맹점 도메인 입력
	// 페이지 URL에서 고정된 부분을 적는다. 
	// Ex) returnURL이 http://localhost:8080INIpayStdSample/INIStdPayReturn.jsp 라면
	// http://localhost:8080/INIpayStdSample 까지만 기입한다.
	
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.giftPay{
	width: 1300px;
}
.payLocation {
	float: left;
	width: 100%;
	line-height: 40px;
	margin-bottom: 14px;
}

.payLocation span{
	font-family: NanumSquare_ac;
	font-size: 18px;
	color: #434343;
}

.giftPay h4{
	font-size: 24px;
	font-family: NanumSquare_ac;
	color: #242424;
	margin-top: 42px;
}

.payArticle{
	display: grid;
	grid-template-columns: 15% 70% 15%;
	margin: 16px auto;
	border-top: 1px solid #8A8A8A;
	border-bottom: 1px solid rgb(138,138,138,1.5);
	font-family: NotoSansM;
	
}

.payImg img{
	width: 136px;
	height: 86px;
	position: absolute;
	top: 20%;
	left: 15%;
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

.payText p:first-child{
	font-size: 16px;
	color: #707070;
	
}
.payText p:last-child{
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
	color: #242424;
	text-align: center;
	line-height: 140px;
	font-family: NotoSansM;
}

.sendTable{
	margin: 18px auto;
}

.sendTable table{
	border-top: 2px solid #8A8A8A;
	border-bottom: 2px solid #8A8A8A;
	width: 100%;
	margin: 0px;
	border-collapse: collapse; 
}

.sendTable table td{
	margin: 0px;
	padding: 14px;
	font-size: 16px;
	color: #242424;
	font-family: NotoSansM;
}

.sendTitle{
	padding: 13px 68px;
}

.sendText td{
	border-bottom: 1px solid rgb(138,138,138,0.5);
}

.sendText td:last-child{
	border-bottom: none;
}

.sendText {
	width: 82%;
}

.giftPay input, .giftPay select{
	border: 1px solid rgb(112,112,112,0.5);
	border-radius: 4px;
	height: 22px;
}

.payMethodTable{
	border-top: 2px solid #8A8A8A;
	border-bottom: 2px solid #8A8A8A;
	width: 100%;
	margin: 16px auto;
	font-family: NotoSansM;
}

.payMethodButton{
	margin: 22px auto;
}

.payBtn{
	width: 266px;
	height: 62px;
	background-color: #ffffff;
	font-size: 16px;
	font-weight: bold;
	font-family: malgun;
	color: #242424;
	border: 1px solid #707070;
	border-radius: 8px;
	margin: 0px 6px;
}
.refundCancel ul li{
	list-style: none;
	line-height: 32px;
	font-size: 16px;
	color: #242424;
	font-family: NotoSansM;
}

.refundCancel{
	width: 100%;
	height: 202px;
	background: #F1F1F1;
	border-radius: 8px;
	margin: 18px auto;
	font-family: NotoSansM;
	
}

.refundCancel p{
	padding: 30px 0px 20px 30px;
	color: #242424;
	font-size: 20px;
	font-weight: bold;
}

.payCheck{
	margin: 18px auto;
	font-size: 16px;
	color: #242424;	
}

.payCheck span{
	font-size: 14px;
	font-weight: bold;
	font-family: NanmuSquare_ac;
	margin-left: 14px;
}

.payButton{
	margin: 56px auto;	
}

.payButton button{
	width: 100%;
	height: 62px;
	font-size: 22px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #FFFFFF;
	background-color: #D66363;
	border-radius: 8px;
	border: none;
	cursor: pointer;
}
.payMethodCSS{
	background-color: #707070;
	color: white;
}

.personInfo {
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
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
	padding-bottom: 18px;
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
    font-family: NanumSquare_ac;
}

#close4{
	float: right;
	width: 40px;
	height: 40px;
	margin: -44px 12px 0px 0px;
}

.personalNotice{
    width: 740px;
    margin: 15px auto;
    font-size: 14px;
    font-family: NanumSquare_ac;
    color: #242424;
}

.personalNotice textarea{
    width: 740px;
    height: 660px;
    border: none;
    resize: none;
}
#payment_warning{
	font-weight: bold;
	color: #f01111;
	padding : 8px 12px 0px;
	display: none;
}

.recipient h4 label {
	margin-left: 20px;
	font-size: 16px;
	font-weight: normal;
	font-family: malgun;
	color: #242424;
}
.personalTitle{
	marin-bottom: 14px;
	font-size: 16px;
	font-family: NanumSquare_ac;
}

</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>	
		<div class="content">
			<div class="giftPay">
				<!-- 기프트카드 로케이션 -->
				<div class="payLocation">
					<span>선물하기 ></span> <span style="font-weight: bold;"> 정보입력/결제하기 </span> <span>> 결제완료</span>
				</div>
				
				<div class="productInfomation">
					<h4>상품정보</h4>
					<!-- 상품정보 이미지,가격 부분 -->
					<div class="payArticle">
						<!-- 상품정보 이미지 div -->
						<div class="payImg">
							<img id="gift_img_url">
						</div>
						<!-- 상품정보 숙소 이름 -->
						<div class="payText">
							<p>BUY IN HOTEL</p>
							<p id="gift_name"></p>
						</div>
						<!-- 상품정보 가격 -->
						<div class="payment">
							<p><span id="gift_price"></span>원</p>
						</div>					
					</div>
				</div>
				
				<!-- 보내는 사람 이름, 연락처,이메일 -->
				<div class="sender">
					<h4>보내는 분</h4>
					<div class="sendTable">
						<table>
							<tr class="sendTitle">
								<td>이름</td>
								<td>연락처</td>
								<td>이메일</td>
							</tr>
							<!-- 연락처 -->
							<tr class="sendText">
								<td><input type="text" name="userName" id ="user_name"></td>
								<td>
									<!-- 전화번호 -->
									<select id="mobile" name="mobile01[]" fw-filter="isNumber" fw-label="N" fw-msg >
											<option value="010">010</option>
											<option value="010">011</option>
											<option value="010">016</option>
											<option value="010">017</option>
											<option value="010">018</option>
											<option value="010">019</option>
									</select> -&nbsp;<input type="text" id = 'mobile1' name="phone1" class="input0" maxlength="4" size="4"> -&nbsp;<input type="text" id = 'mobile2' name="phone2" class="input0" maxlength="4" size="4"></td>
								<td>
								<!-- 이메일 -->
									<input type ="text"  name="email01" id="email01" class = "joinText" >@
									<input type="text" name="email02" id="email02" class = "joinText">
									<select class = "joinText" name="selectEmail" id="selectEmail">
										<option value="1" selected>직접입력</option>
							            <option value="naver.com">naver.com</option>
							            <option value="daum.net">daum.net</option>
							            <option value="gmail.com">gmail.com</option>
							            <option value="hanmail.net">hanmail.net</option>
							            <option value="kakao.com">kakao.com</option>
							            <option value="msn.com">msn.com</option>
							            <option value="nate.com">nate.com</option>
							            <option value="tistory.com">tistory.com</option>
							            <option value="yahoo.com">yahoo.com</option>
									</select>
								</td>
							</tr>
						</table>
					</div>
				</div>
				
				<!-- 받는 사람 정보 부분 -->
				<div class="recipient">
					<h4>받는 분 <label><input type="checkbox" id='bookerCheck' style='height: auto'>예약자 정보와 동일합니다.</label></h4>
					<div class="sendTable">
						<table>
						<tr class="sendTitle">
							<td>이름</td>
							<td>연락처</td>
						</tr>
							
							<tr class="sendText">
								<td><input type="text" id='recipient'></td> <!-- 이름정보 -->
								<td>
									<!-- 전화번호 -->
									<select id="receiveMobile" name="mobile01[]" fw-filter="isNumber" fw-label="N" fw-msg>
											<option value="010">010</option>
											<option value="010">011</option>
											<option value="010">016</option>
											<option value="010">017</option>
											<option value="010">018</option>
											<option value="010">019</option>
									</select> -&nbsp;<input type="text" name="phone1" id='phone1' class="input0" maxlength="4" size="4"> -&nbsp;<input type="text" name="phone2" id='phone2' class="input0" maxlength="4" size="4"></td>
							</tr>
						</table>
					</div>
				</div>
				
				<!-- 결제수단 정보 -->
				<div class="payMethod">
					<h4>결제수단</h4>
					<div class="payMethodTable">
						<!-- 계좌이체, 신용카드 선택 버튼 -->
						<div class="payMethodButton">
							<button type="button" id ='directbank' value='card' class='payBtn'>계좌이체</button>
							<button type="button" id ='card' value = 'bank' class='payBtn payMethodCss'>신용카드</button>
							<div id='payment_warning'>※ 결제방법을 선택해 주세요.</div>
						</div>
						<!-- 취소정책 -->
						<div class="refundCancel">
							<p>환불/취소 정책</p>
							<ul>
								<li>- 유효기간 내 교환하지 않은 GIFT CARD는 100% 주문취소 가능합니다.</li>
								<li>- 발행일로부터 1년 이내 수신자에게 90% 환불 가능합니다.</li>
								<li>- 판매가 중단되거나 판매가 변경된 상품의 경우 기간연장이 불가하여 환불처리됩니다.</li>
							</ul>
						</div>
						<!-- 전체동의 체크박스 -->
						<div class="payCheck">
							<label><input type="checkbox" id = 'agreeCheck' style = 'vertical-align: bottom;'> 주문 상품정보 및 서비스 이용약관에 동의합니다(필수) </label><span id='n_show' style='cursor: pointer;'>상세보기 &rang;</span>
						</div>
					</div>
				</div>
				
				
				<form id="SendPayForm_id" name="SendPayForm" method="POST" >
			        <input type="hidden"  name="goodname" id="goodname" value="" >
			        <input type="hidden"  name="buyername" id="buyername" value="" >
			        <input type="hidden"  name="buyertel" id="buyertel" value="" >
			        <input type="hidden"  name="buyeremail" id="buyeremail" value="" >
			        <input type="hidden"  name="price" id="price" value="" >
			        <input type="hidden"  name="mid" value="<%=mid %>" ><!-- 에스크로테스트 : iniescrow0, 빌링(정기과금)테스트 : INIBillTst -->
			        <input type="hidden"  name="gopaymethod" id="gopaymethod" value="Card" >
			        <input type="hidden"  name="mKey" value="<%=mKey %>" >
			        <input type="hidden"  name="signature" id="signature" value="" >
			        <input type="hidden"  name="oid" id="oid" value="" >
			        <input type="hidden"  name="timestamp" id="timestamp" value="" >
			        <input type="hidden"  name="version" value="1.0" >
			        <input type="hidden"  name="currency" value="WON" >
			        <input type="hidden"  name="acceptmethod" value="below1000" ><!-- 에스크로옵션 : useescrow, 빌링(정기과금)옵션 : BILLAUTH(Card) -->
			        <input type="hidden"  name="returnUrl" value="<%=siteDomain %>/completePayment" >
			        <input type="hidden"  name="closeUrl" value="<%=siteDomain %>/close.jsp" >
			   </form>
				
				<!-- 결제하기 버튼 -->
				<div class="payButton">
					<button type="button" id='giftPaymentBtn'><span id ='gift_Total_Price'>0</span>원 결제하기</button>
				</div>
			</div>
		</div>
			
		<%@include file="../footer.jsp"%>
		<!-- 개인정보 수집 팝업 -->
		<div class="personInfo">
		    <div class="window">
		        <div class="popup">
		            <div class="pTitle">
		                <div class="seePhoto">
		                    <p>개인정보 수집 및 이용 목적 동의</p>
		                    <img src="../images/closebutton.png" id="close4">
		                </div>
		                <div class="personalNotice">
		                    <p class="personalTitle">개인정보수집&middot;이용 동의(필수)</p>
		                    <%@include file="../reserhotel/agreePolicy.jsp"%>
		                </div>
			       	 </div>
				    </div>
				</div>
			</div>
		</div>
	<script>
	$(document).on('click','#bookerCheck', function(){
		if($("input:checkbox[id=bookerCheck]").is(":checked") == true){
			
			console.log($('#mobile').val());
			
			$('#recipient').val($('#user_name').val());
			$('#receiveMobile').val($('#mobile').val());
			$('#phone1').val($('#mobile1').val());
			$('#phone2').val($('#mobile2').val());
				
		} else if($("input:checkbox[id=bookerCheck]").is(":checked") == false){
			$('#recipient').val("");
			$('#receiveMobile').val("010");
			$('#phone1').val("");
			$('#phone2').val("");
		}	
	})
	
	//이메일 입력방식 선택 
	$('#selectEmail').change(function () { 
	    $("#selectEmail option:selected").each(function () { 
	        if ($(this).val() == '1') { 
	            //직접입력일 경우 
	            $("#email02").val(''); 
	            //값 초기화 
	            $("#email02").attr("disabled",false); 
	            //활성화 
	        }else{ 
	            //직접입력이 아닐경우 
	            $("#email02").val($(this).text()); 
	            //선택값 입력 
	            $("#email02").attr("disabled",true); 
	            //비활성화 
		        } 
		    }); 
		}); 
	/* 결제수단 선택했을때 css 추가 */
	$(document).on('click','.payBtn',function(){
		$('.payBtn').removeClass('payMethodCSS');
		$(this).addClass('payMethodCSS');
	})
	
	/* 주문 상품정보 서비스 약관 상세보기 팝업 */
	$(document).on('click','#n_show',function(){
		$('.personInfo').addClass('show');
	})
	$(document).on('click','#close4',function(){
		$('.personInfo').removeClass('show');
	})
		
	</script>
	<script>
		<%
			boolean isGiftcard = Boolean.parseBoolean(request.getParameter("isGiftcard"));
			int giftcard_id = 0;
			giftcard_id = Integer.parseInt(request.getParameter("giftcard_id"));
		%>
		var user_id = '<%=id%>';
		var giftInfo;
		var giftcard_id = <%=giftcard_id%>;
		
		$(function() {
			/* 기프트카드 결제 data 보여주는 ajax */
			$.ajax({
				url : "../gift-basic-info?giftcard="+giftcard_id+"&isGiftcard=true&room=null&isWeekend=null", // 컨트롤러 위치
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
						
						$('#gift_price').text(data.gift_price.toLocaleString('en'));
						$('#gift_Total_Price').text(data.gift_price.toLocaleString('en'));
						$('#giftcard_id').text(data.giftcard_id);
						$('#gift_name').text(data.gift_name);
						$('#gift_img_url').attr("src", data.gift_img_url);
						$('#gift_type_id').text(data.gift_type_id);
						$('#user_email').text(data.user_email);
						$('#user_name').val(data.user_name);
						
						$('#mobile').val(data.user_tel.substring(0,3));
						$('#mobile1').val(data.user_tel.substring(3,7));
						$('#mobile2').val(data.user_tel.substring(7,11));
						
						var email = data.user_email.split("@");
						
						$('#email01').val(email[0])
						$('#email02').val(email[1])
						
						giftInfo = {
							gift_img : data.gift_img_url,
							gift_name : data.gift_name,
							gift_price : data.gift_price
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
	
	<script type="text/javascript" src="https://stdpay.inicis.com/stdjs/INIStdPay.js" charset="UTF-8"></script>
	
	<script>
		/* 결제하기 버튼 클릭시 */
		$(document).on('click','#giftPaymentBtn',function(){
			
			var input_check = true;
			//이용자 정보 입력 되어 있는지 확인, 빈값이면 빈값인 곳으로 focus
			$('input[type=text]').each( function(){
				if($(this).val().trim() == ""){
					input_check = false;
					$(this).focus();
					return false;
				} 
			}) 
			
			if(!input_check){
				alert("이용자 정보를 입력하세요");
			} else if($('.payMethodCSS').length == 0){
				alert("결제방법을 선택해주세요.");
				$('#payment_warning').show();
				$('#payment_warning').focus();
			} else if($('#agreeCheck').is(":checked") == false){
				alert("주문 상품정보 및 서비스 이용약관에 동의를 해주세요.");
				$('#agreeCheck').focus();
			} else {
				var giftTotal;
				var userNum;
				var userEmail;
				var receiveNum;
				
				if($('.payMethodCSS').attr('id') == 'card'){
					paymentMethod = "CARD";
				} else if($('.payMethodCSS').attr('id') == 'directbank'){
					paymentMethod = "BANK";
				}
				
				giftTotal = $('#gift_Total_Price').text().replaceAll(",","");
				userNum = $('#mobile').val() + $('#mobile1').val() + $('#mobile2').val();
				userEmail = $('#email01').val() + "@" + $('#email02').val();
				
				receiveNum = $('#receiveMobile').val() + $('#phone1').val() + $('#phone2').val()
				
				var sendData = {
						giftTypeID : giftcard_id,
						isGiftcard : true,
						isWeekend : null,
						paymentMethod : paymentMethod,
						paymentCharge : giftTotal,
						senderInfo : {
							name : $('#user_name').val(),
							tel : userNum,
							email : userEmail,						
						},
						receiverInfo : {
							name : $('#recipient').val(),
							tel : receiveNum,
						}
					 }
				
				  console.log(sendData);
				//기프트카드 입력 정보 넘김
				 $.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "../gifts", // 컨트롤러 위치
					// get, post
					// get은 쿼리스트링 방식
					// post 숨겨서 보내야 되므로 ajax안에 data: {}
					 type : "POST",
					 beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        }, 
					 data : JSON.stringify(sendData),
					//dataType : response 어떤 타입으로 받을지
					dataType : 'JSON',
					success : function(result){
						
						console.log(result);
						
						if(result.message == 'Success'){
							/* var payment_state = true;
							var payment_message = null; */
							var oid = result.OID;
							
							setPaymentInfo(oid, giftTotal);
							
							/* var tid = result.TID;
							if(typeof tid == "undefined" || tid == ""){
								tid = "null";
							}
							paymentInformantion(oid, payment_state, payment_message, giftTotal, tid) */
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
		
		
		function setPaymentInfo(oid, price) {
				
			var urlSearch = new URLSearchParams(location.search);
				
			$.ajax({
				url: "../GoodsNameCon.Webdo", // 컨트롤러 위치
				type: "post",
				data : {
					goodsName : $('#gift_name').text(),
					giftParams : urlSearch.toString()
				},
				dataType: 'text',
				success: function(result) {
					if (result == 'errName') {
						alert("선물 이름 오류");
					} else if(result == 'goodsName') {
						
						$("#goodname").val($('#gift_name').text());
						$("#buyername").val($('#user_name').val());
						$("#buyertel").val($('#mobile').val() + $('#mobile1').val() + $('#mobile2').val());
						$("#buyeremail").val($('#email01').val() + "@" + $('#email02').val());
						$("#price").val(price);
						
						
						$.ajax({
							url: "../PaymentSignatureCon.Webdo", // 컨트롤러 위치
							type: "post",
							dataType: 'JSON',
							data: {
				
								price: price,
								oid : oid
				
							},
							success: function(result) {
								console.log(result)
				
								var message = result.message;
								
								if (message == "Success") {
									$('#signature').val(result.signature);
									$('#oid').val(result.oid);
									$('#timestamp').val(result.timestamp);
									
									INIStdPay.pay(document.SendPayForm);
									
									return false;
								} else if (message == "Fail") {
									alert("서버 요청 실패");
									
									return false;
								}
								
								return false;
							},
							error: function() {
								swal("서버 요청 실패", "연결을 다시 확인 해주세요.", "error");
								return false;
							}
						});
					}
				},
				error: function() {
					alert("서버 요청 실패", "연결을 다시 확인 해주세요.");
					return false;
				}
			});
			
		}
		
		
		// 결제 정보를 세션에 담는 함수
		function paymentInformantion(OID, payment_state, payment_message, giftTotal, TID) {
			
			$.ajax({
				//contentType: "application/json; charset=utf-8",
				url : "../PaymentInfomationCon.do", // 컨트롤러 위치
				type : "POST",
				data : {
					OID: OID,
					payment_state : payment_state,
					payment_message : payment_message,
					payTotalCharge : JSON.stringify(giftInfo),
					TID : TID
				},
				//dataType : response 어떤 타입으로 받을지
				dataType : 'text',
				success : function(result){
					
					console.log(result);
					
					if(result == 'Success'){
						location.href = 'completePayment';
						return false;
					} else {
						alert("세션 등록 실패!!");
						return false;
					}
					return false;					
				},
				error : function(){
					alert("세션 등록 에러@@");
					return false;
				}
			})
		}
		
	</script>
</body>
</html>