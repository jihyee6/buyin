<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="com.inicis.std.util.ParseUtil"%>
<%@ page import="com.inicis.std.util.SignatureUtil"%>
<%@ page import="com.inicis.std.util.HttpUtil"%>
<%@ page import="java.util.*"%>

<% 

	String OID = (String) session.getAttribute("OID");
	/* 	String payment_state = (String) session.getAttribute("payment_state");
	String payment_message = (String) session.getAttribute("payment_message");
	String payTotalCharge = (String) session.getAttribute("payTotalCharge");
	String TID = (String) session.getAttribute("TID"); */
	String payment_state = "";
	String payment_message = "";
	String payTotalCharge = "";
	String TID = ""; 
	
	String goodsName = (String) session.getAttribute("goodsName");
	String app_payment = (String) session.getAttribute("appPay");
	
	if(app_payment != null && app_payment.equals("true")) {
		payment_state = "true";
		payTotalCharge = "0";
		
		session.removeAttribute("appPay");
	} else {

		try{
	
			//#############################
			// 인증결과 파라미터 일괄 수신
			//#############################
			request.setCharacterEncoding("UTF-8");
	
			Map<String,String> paramMap = new Hashtable<String,String>();
	
			Enumeration elems = request.getParameterNames();
	
			String temp = "";
	
			while(elems.hasMoreElements())
			{
				temp = (String) elems.nextElement();
				paramMap.put(temp, request.getParameter(temp));
			}
			
			System.out.println("paramMap : "+ paramMap.toString());
			
			//#####################
			// 인증이 성공일 경우만
			//#####################
			if("0000".equals(paramMap.get("resultCode"))){
	
				System.out.println("####인증성공/승인요청####");
	
				//############################################
				// 1.전문 필드 값 설정(***가맹점 개발수정***)
				//############################################
				
				String mid 		= paramMap.get("mid");						// 가맹점 ID 수신 받은 데이터로 설정
				String signKey	= "S0pDcnVhczg4MWpwYmZuclhGQ09Pdz09";		// 가맹점에 제공된 키(이니라이트키) (가맹점 수정후 고정) !!!절대!! 전문 데이터로 설정금지
				String timestamp= SignatureUtil.getTimestamp();				// util에 의해서 자동생성
				String charset 	= "UTF-8";								    // 리턴형식[UTF-8,EUC-KR](가맹점 수정후 고정)
				String format 	= "JSON";								    // 리턴형식[XML,JSON,NVP](가맹점 수정후 고정)
				String authToken= paramMap.get("authToken");			    // 취소 요청 tid에 따라서 유동적(가맹점 수정후 고정)
				String authUrl	= paramMap.get("authUrl");				    // 승인요청 API url(수신 받은 값으로 설정, 임의 세팅 금지)
				String netCancel= paramMap.get("netCancelUrl");			 	// 망취소 API url(수신 받은 값으로 설정, 임의 세팅 금지)
				String ackUrl 	= paramMap.get("checkAckUrl");			    // 가맹점 내부 로직 처리후 최종 확인 API URL(수신 받은 값으로 설정, 임의 세팅 금지)		
				String merchantData = paramMap.get("merchantData");			// 가맹점 관리데이터 수신
				
				//#####################
				// 2.signature 생성
				//#####################
				Map<String, String> signParam = new HashMap<String, String>();
	
				signParam.put("authToken",	authToken);		// 필수
				signParam.put("timestamp",	timestamp);		// 필수
	
				// signature 데이터 생성 (모듈에서 자동으로 signParam을 알파벳 순으로 정렬후 NVP 방식으로 나열해 hash)
				String signature = SignatureUtil.makeSignature(signParam);
	
	      		String price = "";  // 가맹점에서 최종 결제 가격 표기 (필수입력아님)
	      		
			    // 1. 가맹점에서 승인시 주문번호가 변경될 경우 (선택입력) 하위 연결.  
			    // String oid = "";             
	      
				//#####################
				// 3.API 요청 전문 생성
				//#####################
				Map<String, String> authMap = new Hashtable<String, String>();
	
				authMap.put("mid"			    ,mid);			  // 필수
				authMap.put("authToken"		,authToken);	// 필수
				authMap.put("signature"		,signature);	// 필수
				authMap.put("timestamp"		,timestamp);	// 필수
				authMap.put("charset"		  ,charset);		// default=UTF-8
				authMap.put("format"		  ,format);		  // default=XML
	      		//authMap.put("price" 		,price);		    // 가격위변조체크기능 (선택사용)
	      
				System.out.println("##승인요청 API 요청##");
	
				HttpUtil httpUtil = new HttpUtil();
	
				try{
					//#####################
					// 4.API 통신 시작
					//#####################
	
					String authResultString = "";
	
					authResultString = httpUtil.processHTTP(authMap, authUrl);
					
					//############################################################
					//5.API 통신결과 처리(***가맹점 개발수정***)
					//############################################################
					
					String test = authResultString.replace(",", "&").replace(":", "=").replace("\"", "").replace(" ","").replace("\n", "").replace("}", "").replace("{", "");
					
					//out.println("<pre>"+authResultString.replaceAll("<", "&lt;").replaceAll(">", "&gt;")+"</pre>");
					
					Map<String, String> resultMap = new HashMap<String, String>();
					
					resultMap = ParseUtil.parseStringToMap(test); //문자열을 MAP형식으로 파싱
									
					System.out.println("resultMap == " + resultMap);
					
					/*************************  결제보안 강화 2016-05-18 START ****************************/ 
					Map<String , String> secureMap = new HashMap<String, String>();
					secureMap.put("mid"			, mid);								//mid
					secureMap.put("tstamp"		, timestamp);						//timestemp
					secureMap.put("MOID"		, resultMap.get("MOID"));			//MOID
					secureMap.put("TotPrice"	, resultMap.get("TotPrice"));		//TotPrice
					
					// signature 데이터 생성 
					String secureSignature = SignatureUtil.makeSignatureAuth(secureMap);
					/*************************  결제보안 강화 2016-05-18 END ****************************/
	
					if("0000".equals(resultMap.get("resultCode")) && secureSignature.equals(resultMap.get("authSignature")) ){	//결제보안 강화 2016-05-18
					   /*****************************************************************************
				       * 여기에 가맹점 내부 DB에 결제 결과를 반영하는 관련 프로그램 코드를 구현한다.  
					   
						 [중요!] 승인내용에 이상이 없음을 확인한 뒤 가맹점 DB에 해당건이 정상처리 되었음을 반영함
								  처리중 에러 발생시 망취소를 한다.
				       ******************************************************************************/	
						
						payment_state = "true";
						payment_message = resultMap.get("resultMsg");
						payTotalCharge = resultMap.get("TotPrice");
						TID = resultMap.get("tid"); 
							  
					} else {
						payment_state = "false";
						payment_message = resultMap.get("resultMsg");
						payTotalCharge = resultMap.get("TotPrice");
						TID = resultMap.get("tid");
						
						//결제보안키가 다른 경우
						if (!secureSignature.equals(resultMap.get("authSignature")) && "0000".equals(resultMap.get("resultCode"))) {	
							
							//망취소
							if ("0000".equals(resultMap.get("resultCode"))) {
								throw new Exception("데이터 위변조 체크 실패");
							}
						}
					}
					
				} catch (Exception ex) {
	
					//####################################
					// 실패시 처리(***가맹점 개발수정***)
					//####################################
					
					payment_state = "false";
					payment_message = "인증에 실패하였습니다.";
					payTotalCharge = "0";
					TID = "";
	
					//---- db 저장 실패시 등 예외처리----//
					System.out.println(ex);
	
					//#####################
					// 망취소 API
					//#####################
					String netcancelResultString = httpUtil.processHTTP(authMap, netCancel);	// 망취소 요청 API url(고정, 임의 세팅 금지)
	
	
				}
	
			}else{
	
				//#############
				// 인증 실패시
				//#############
				
				payment_state = "false";
				payment_message = "인증에 실패하였습니다.";
				payTotalCharge = "0";
				TID = "";
	
			}
	
		}catch(Exception e){
			
			payment_state = "false";
			payment_message = "인증에 실패하였습니다.";
			payTotalCharge = "0";
			TID = "";
	
			System.out.println(e);
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.booker_info {
	width: 1300px;
}

.location {
	width: 850px;
	margin-top: 40px;
	line-height: 40px;
	margin-left: 50px;
}

.location span {
	font-family: NanumSquare_ac;
	font-size: 18px;
	color: #434343;
}

.complete h4 {
	font-size: 28px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #242424;
	border-bottom: 2px solid #8A8A8A;
	line-height: 65px;
	margin-bottom: 30px;
	width: 1200px;
}

.ok_sign {
	margin: 81px 0px 100px 0px;
	font-family: segoeui;
	text-align: center;
}

.ok_sign h3 {
	font-size: 24px;
	font-weight: bold;
	color: #242424;
	margin-top: 15px;
}

.ok_sign p {
	font-size: 14px;
	color: #BFBFBF;
}

.ok_confirm {
	width: 670px;
	height: 550px;
	border-radius: 10px;
	box-shadow: 1px 1px 6px grey;
	border: 1px solid rgb(112, 112, 112, 0.5);
}

.ok_title {
	margin: 50px 0px 10px 0px;
	text-align: center;
}

.search {
	position: relative;
	list-style: none;
	display: flex;
	width: 600px;
	height: 100px;
	background-color: white;
	border: 1px solid #B1B1B1;
	border-radius: 14px;
	margin: 46px auto;
	padding: 0px;
}

.search li {
	line-height: 27px; 
	width: 300px;
	border-right: 1px solid rgb(127, 127, 127, 0.5);
	padding: 23px;
}

.search li:last-child {
	border-right: none;
}

.search p {
	font-size: 18px;
	color: #242424;
	font-family: malgun;
	font-weight: bold;
	text-align: center;
}

#pointbox {
	text-align: center;
	font-size: 18px;
	font-family: malgun;
	color: #242424;
}

.confirm_table{
	margin-top: 30px;
}

.confirm_table td{
	padding: 15px;
	margin: 0px;
	width: 260px;
	border-top: 1px solid rgb(138,138,138,0.5);
	font-size: 18px;
	color: #242424;
	font-family: malgun;
}

.confirm_table td:last-child{
	border-bottom: 1px solid rgb(138,138,138,0.5);
}

.c_title td{
	font-size: 18px;
	font-weight: bold;
}

.c_info td{
	text-align: right;
}

.co_price{
	line-height: 32px;
	float: right;
	margin: 23px 76px 0px 0px;
	font-size: 16px;
	font-family: malgun;
	color: #242424;
	text-align: right;
}

.co_price p span{
	font-size: 22px;
	font-weight: bold;
}

hr{
	width: 1120px;
	margin: 70px auto;
	border: 1px solid #8A8A8A;
}

.c_button button{
	width: 172px;
	height: 48px;
	border: 1px solid #707070;
	font-size: 20px;
	font-family: NanumSquare_ac;
	border-radius: 7px;
	margin-right: 12px;
	color: #707070;
	background-color: white;
	cursor: pointer;
}

.c_button{
	/* width: 100%; */
	margin-left: 456px;
}

</style>

</head>
<%-- <% 
	String OID = (String) session.getAttribute("OID");
	String payment_state = (String) session.getAttribute("payment_state");
	String payment_message = (String) session.getAttribute("payment_message");
	String payTotalCharge = (String) session.getAttribute("payTotalCharge");
	String TID = (String) session.getAttribute("TID");
%> --%>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="booker_info">
			<!-- 예약 경로 -->
				<div class="location">
					<span>호텔/객실선택 </span> <span>> 정보입력/결제하기 </span> <span
						style="font-weight: bold;">> 예약완료</span>
				</div>
				<div class="complete" id="success" style="display: none">
				<!-- 예약 완료 메시지 부분 -->
					<div class="complte_ok">
						<h4>예약완료</h4>
					</div>
					<div class="ok_sign">
						<h3>결제가 완료되었습니다.</h3>
						<p>결제내역은 [마이페이지 - 구매내역] 에서 확인하실 수 있습니다.</p>
					</div>
					<!-- 결제 완료 정보 div -->
					<div class="ok_confirm">
						<div class="ok_title">
								<h3 id='lodgement_name_success'></h3>
									
							</div>
						
						<ul class="search">
							<li>
								<p>체크인</p>
								<div id="pointbox">
									<span id='checkinDate'></span>
								</div>
							</li>
							<li><div class="pointdel">
									<p>체크아웃</p>
									<div id="pointbox">
										<span id='checkoutDate'></span>
									</div>
								</div>
							</li>
						</ul>
						<!-- 예약정보 확인 div -->
						<div class="confirm_table">
							<table>
								<tr class="c_title">
									<td>예약번호</td>
									<td>예약자명</td>
									<td>예약자 번호</td>
									<td>예약자 이메일</td>
								</tr>
								<tr class="c_info">
									<td id='oid'>--</td>
									<td id='userName'>--</td>
									<td id='userTel'>--</td>
									<td id='userEmail'>--</td>
								</tr>

							</table>
						</div>
						<!-- 결제 총 금액 안내 부분 -->
						<div class="co_price">
							<p><span id='paymentMethod'></span> 결제</p>
							<p>총 금액 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id = 'payTotalCharge'></span>원</p>
						</div>
						
					</div>
					<hr>
					<!-- 메인/예약확인 버튼 div -->
					<div class="c_button">
						<button type="button" class='mainBtn'>메인으로</button>
						<button type="button" class='confirmBtn' style="background: #4366A3; color: white; border: none; ">예약확인</button>
					</div>
				</div>
				
				<div class="complete" id="fail" style="display: none">
				<!-- 예약 완료 메시지 부분 -->
					<div class="complte_ok">
						<h4>예약실패</h4>
					</div>
					<div class="ok_sign">
						<h3>결제가 실패하였습니다.</h3>
						<p>다시 시도해주시기 바랍니다.</p>
					</div>

					<div class="ok_confirm">
						<div class="ok_title">
							<h3 id='lodgement_name_fail'></h3>
<!-- 							<p>
								광주 북구 자미로 10번길 14 <img src="../images/mainimg/locationimg.png">
							</p> -->
						</div>

						<div class="confirm_table">
							<table>
								<tr class="c_title">
									<td>실패사유</td>
								</tr>
								<tr class="c_info">
									<td id='failMessage'>--</td>
								</tr>

							</table>
						</div>
						<!-- 결제 총 금액 안내 부분 -->
						
					</div>
					<hr>
					<div class="c_button">
						<button type="button" class='mainBtn'>메인으로</button>
						<button type="button" class='retryBtn' style="background: #4366A3; color: white; border: none; ">다시시도</button>
					</div>
				</div>
			</div>
		</div>

		<%@include file="../footer.jsp"%>
	</div>
	<script>
	
	var OID = '<%=OID%>';
	var payment_state = '<%=payment_state%>';
	var payment_message = '<%=payment_message%>';
	var payTotalCharge = '<%=payTotalCharge%>';
	var TID = '<%=TID%>';
	var user_id = '<%=id%>';
	var lodgement_name = '<%= goodsName%>';
	
	$(function(){
		if (payment_state == 'true') {
			$('#success').show();
			$('#lodgement_name_success').text(lodgement_name);
		} else if(payment_state == 'false') {
			$('#fail').show();
			$('#lodgement_name_fail').text(lodgement_name);
		}
		
		var sendData = {
				TID : TID,
				OID : OID,
				payment_state : payment_state,
				payment_message : payment_message,
			 }
		
		  console.log(sendData);
		/* 결제정보 받아오는 ajax */
		 $.ajax({
			 contentType: "application/json; charset=utf-8",
			 url : "../payments", // 컨트롤러 위치
			// get, post
			// get은 쿼리스트링 방식
			// post 숨겨서 보내야 되므로 ajax안에 data: {}
			 type : "PUT",
			 beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        }, 
			 data : JSON.stringify(sendData),
			//dataType : response 어떤 타입으로 받을지
			dataType : 'JSON',
			success : function(result){
				
				console.log(result);
				if(result.message == 'success'){
					if(payment_state == 'true'){
						$('#oid').text(OID);
						$('#checkinDate').text(result.checkin_date);
						$('#checkoutDate').text(result.checkout_date);
						$('#userName').text(result.payment_user_info.name);
						$('#userTel').text(result.payment_user_info.tel);
						$('#userEmail').text(result.payment_user_info.email);
						$('#paymentMethod').text(result.payment_method);
						$('#payTotalCharge').text(parseInt(payTotalCharge).toLocaleString('en'));
					} else if(payment_state == 'false'){
						$('#failMessage').text(payment_message);
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
				alert("검색실패");
				return false;
			}
		})
	})
	/* 예약확인하기 버튼 클릭하면 예약내역 페이지로 이동 */
	$(document).on('click','.confirmBtn', function(){
		location.href='../mypage/Myreservation'
	})
	$(document).on('click','.retryBtn', function(){
		location.href = 'bookerinfo';
	});
	
	$(document).on('click','.mainBtn', function(){
		location.href='../index';
	});
	</script>
	
</body>
</html>