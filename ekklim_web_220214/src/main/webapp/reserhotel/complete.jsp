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
<% 
	String id = (String) session.getAttribute("id");
	if(id == null) {
		 id = request.getHeader("id");
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>바이인 호텔</title>
</head>
<body>
<script type="text/javascript">

var OID = '<%=OID%>';
var payment_state = '<%=payment_state%>';
var payment_message = '<%=payment_message%>';
var payTotalCharge = '<%=payTotalCharge%>';
var TID = '<%=TID%>';
var user_id = '<%=id%>';
var lodgement_name = '<%= goodsName%>';

$(function(){
		
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
			if(result.message == 'Success'){
				if(payment_state == true || payment_state == "true"){
					alert("결제에 성공하셨습니다.");
					location.href='../index';
				} else if(payment_state == false || payment_state == "false"){
					alert(payment_message);
					history.back();
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

</script>
</body>
</html>