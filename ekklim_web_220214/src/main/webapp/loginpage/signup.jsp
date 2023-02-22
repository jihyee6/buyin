<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    /* ============================================================================== */
    /* =   PAGE : 인증 요청 PAGE                                                    = */
    /* = -------------------------------------------------------------------------- = */
    /* =   Copyright (c)  2018.03 NHN KCP Inc. All Rights Reserved.                 = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   환경 설정 파일 Include                                                   = */
    /* = -------------------------------------------------------------------------- = */
%>
<%@ page import="kr.co.kcp.CT_CLI"%>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<%@ include file="../cfg/web_cert_conf.jsp"%>
<%
    /* = -------------------------------------------------------------------------- = */
    /* =   환경 설정 파일 Include END                                               = */
    /* ============================================================================== */

    /* ============================================================================== */
    /* =   Hash 데이터 생성 필요 데이터                                             = */
    /* = -------------------------------------------------------------------------- = */
    /* = -------------------------------------------------------------------------- = */


    /* = -------------------------------------------------------------------------- = */
    /* = 요청번호  ( up_hash 생성시 필요 )                                           = */
    /* = -------------------------------------------------------------------------- = */

    String ordr_idxx = "TEST" + (new SimpleDateFormat("yyyyMMddHHmmssSSSSSSS").format(new Date())); // 요청번호 생성 예제

    /* = -------------------------------------------------------------------------- = */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.loginbox {
	margin: 80px 660px;
	width: 700px;
}

.title3 {
	font-size: 32px;
	margin-bottom: 65px;
	text-align: center;
	font-family: NanumSquare_ac;
	font-weight: bold;
	color: #242424;
}

/* .textbox {
	margin-top: 30px;
	display: flex;
}

.textbox p {
	font-size: 18px;
	margin: auto 20px;
	font-family: NanumSquare_ac;
	color: #242424;
}

.textbox input {
	width: 350px;
	height: 30px;
	border: none;
	font-size: 16px;
	font-family: NanumSquare_ac;
	background: #F3F3F3;
} */

.subtext{
text-align: center;
font-size: 16px;
font-family: NanumSquare_ac;
color: #242424;
}

/* .logbox button{
width: 120px;
height: 40px;
margin: 25px 0px 0px -45px;
border: 1px solid #707070;
border-radius: 8px;
font-size: 16px;
color: #242424;
font-family: NanumSquare_ac;
background: white;
cursor: pointer;
} */

.loginbox img{
margin: 76px 244px;
}

.doBtn{
margin: 76px 244px;
width: 218px;
height: 212px;
border: none;
background-color: white;
}

</style>

<script type ="text/javascript" charset="utf-8">

    // 인증창 종료 후 인증데이터 리턴 함수
    function auth_data( frm )
    {
        var auth_form     = document.form_auth;
        var nField        = frm.elements.length;
        var response_data = "";

        // up_hash 검증 
        if( frm.up_hash.value != auth_form.veri_up_hash.value )
        {
            alert("up_hash 변조 위험있음");
            
        }              
        
       /* 리턴 값 모두 찍어보기 (테스트 시에만 사용) */
        var form_value = "";

        for ( i = 0 ; i < frm.length ; i++ )
        {
            form_value += "["+frm.elements[i].name + "] = [" + frm.elements[i].value + "]\n";
        }
        alert(form_value);
    }
    
    // 인증창 호출 함수
    function auth_type_check()
    {
        var auth_form = document.form_auth;

        if( auth_form.ordr_idxx.value == "" )
        {
            alert( "요청번호는 필수 입니다." );

            return false;
        }
        else
        {
            if( ( navigator.userAgent.indexOf("Android") > - 1 || navigator.userAgent.indexOf("iPhone") > - 1 ) == false ) // 스마트폰이 아닌경우
            {
             var return_gubun;
             var width  = 410;
             var height = 500;

             var leftpos = screen.width  / 2 - ( width  / 2 );
             var toppos  = screen.height / 2 - ( height / 2 );

             var winopts  = "width=" + width   + ", height=" + height + ", toolbar=no,status=no,statusbar=no,menubar=no,scrollbars=no,resizable=no";
             var position = ",left=" + leftpos + ", top="    + toppos;
             var AUTH_POP = window.open('','auth_popup', winopts + position);
            }
            
            auth_form.target = "auth_popup"; // !!주의 고정값 ( 리턴받을때 사용되는 타겟명입니다.)
            auth_form.action = "./web_cert_proc_req.jsp"; // 인증창 호출 및 결과값 리턴 페이지 주소
            
            return true;
        }
    }

    /* 예제 */
    window.onload=function()
    {
        var today            = new Date();
        var year             = today.getFullYear();
        var month            = today.getMonth() + 1;
        var date             = today.getDate();
        var time             = today.getTime();
        var year_select_box  = "<option value=''>선택 (년)</option>";
        var month_select_box = "<option value=''>선택 (월)</option>";
        var day_select_box   = "<option value=''>선택 (일)</option>";
        
        if(parseInt(month) < 10) {
            month = "0" + month;
        }

        if(parseInt(date) < 10) {
            date = "0" + date;
        }

        year_select_box = "<select name='year' class='frmselect' id='year_select'>";
        year_select_box += "<option value=''>선택 (년)</option>";

        for(i=year;i>(year-100);i--)
        {
            year_select_box += "<option value='" + i + "'>" + i + " 년</option>";
        }
        
        year_select_box  += "</select>";
        month_select_box  = "<select name=\"month\" class=\"frmselect\" id=\"month_select\">";
        month_select_box += "<option value=''>선택 (월)</option>";
        
        for(i=1;i<13;i++)
        {
            if(i < 10)
            {
                month_select_box += "<option value='0" + i + "'>" + i + " 월</option>";
            }
            else
            {
                month_select_box += "<option value='" + i + "'>" + i + " 월</option>";
            }
        }
        
        month_select_box += "</select>";
        day_select_box    = "<select name=\"day\"   class=\"frmselect\" id=\"day_select\"  >";
        day_select_box   += "<option value=''>선택 (일)</option>";
        for(i=1;i<32;i++)
        {
            if(i < 10)
            {
                day_select_box += "<option value='0" + i + "'>" + i + " 일</option>";
            }
            else
            {
                day_select_box += "<option value='" + i + "'>" + i + " 일</option>";
            }
        }
        
        day_select_box += "</select>";
        
        document.getElementById( "year_month_day"  ).innerHTML = year_select_box + month_select_box + day_select_box;
    }
    
</script>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="loginbox">
				<div class="title3">회원가입</div>
				<p class="subtext">본인인증을 위해 휴대폰 인증하기를 진행해주세요.</p>
				
				<form name="form_auth" method="post">
					<input type="submit" value="" class="doBtn" style = 'cursor:pointer; background-image: url("../images/cellphone.png")' onclick="return auth_type_check();">
					
					 <!-- 인증요청 정보 출력 테이블 Start -->
                     <table style = "display:none;">
                         <!-- 요청번호(ordr_idxx) -->
                         <tr>
                             <td class="sub_title1">요청번호</td>
                             <td class="sub_input1"><input type="text" name="ordr_idxx" class="frminput" value="<%=ordr_idxx%>" size="40" readonly="readonly" maxlength="40"/></td>
                         </tr>
                         <!-- 생년월일 -->
                         <tr>
                             <td class="sub_title1">생년월일</td>
                             <td class="sub_content1" id="year_month_day">
                             </td>
                         </tr>
                         <!-- 성별구분 -->
                         <tr>
                             <td class="sub_title1">성별구분</td>
                             <td class="sub_content1 bold">
                                 <input type="radio" name="sex_code" value="" />선택
                                 <!-- 내/외국인구분 -->
                                 <select name='local_code' class="frmselect">
                                     <option value=''>선택</option>
                                 </select>
                             </td>
                         </tr>
 
                         <tr class="height_1px"><td colspan="2" bgcolor="#0f75ac"></td></tr>
                     </table>
                     <!-- 인증요청 정보 출력 테이블 End -->
 
                     <!-- 인증요청 버튼 테이블 End -->
    
		            <!-- 요청종류 -->
		            <input type="hidden" name="req_tx"       value="cert"/>
		            <!-- 요청구분 -->
		            <input type="hidden" name="cert_method"  value="01"/>
		            <!-- 웹사이트아이디 : ../cfg/cert_conf.jsp 파일에서 설정해주세요 -->
		            <input type="hidden" name="web_siteid"   value="<%= g_conf_web_siteid %>"/> 
		            <!-- 노출 통신사 default 처리시 아래의 주석을 해제하고 사용하십시요 
		                 SKT : SKT , KT : KTF , LGU+ : LGT
		            <input type="hidden" name="fix_commid"      value="KTF"/>
		            -->
		            <!-- 사이트코드 : ../cfg/cert_conf.jsp 파일에서 설정해주세요 -->
		            <input type="hidden" name="site_cd"      value="<%= g_conf_site_cd %>" />               
		            <!-- Ret_URL : ../cfg/cert_conf.jsp 파일에서 설정해주세요 -->
		            <input type="hidden" name="Ret_URL"      value="<%= g_conf_Ret_URL %>" />
		            <!-- cert_otp_use 필수 ( 메뉴얼 참고)
		                 Y : 실명 확인 + OTP 점유 확인 , N : 실명 확인 only
		            -->
		            <input type="hidden" name="cert_otp_use" value="Y"/>
		            <!-- 리턴 암호화 고도화 -->
		            <input type="hidden" name="cert_enc_use_ext" value="Y"/>
		
		            <input type="hidden" name="res_cd"       value=""/>
		            <input type="hidden" name="res_msg"      value=""/>
		
		            <!-- up_hash 검증 을 위한 필드 -->
		            <input type="hidden" name="veri_up_hash" value=""/>
		
		            <!-- 본인확인 input 비활성화 -->
		            <input type="hidden" name="cert_able_yn" value=""/>
		
		            <!-- web_siteid 검증 을 위한 필드 -->
		            <input type="hidden" name="web_siteid_hashYN" value=""/>
		
		            <!-- 가맹점 사용 필드 (인증완료시 리턴)-->
		            <input type="hidden" name="param_opt_1"  value="opt1"/> 
		            <input type="hidden" name="param_opt_2"  value="opt2"/> 
		            <input type="hidden" name="param_opt_3"  value="opt3"/> 
					
				</form>
				
			</div>

		</div>
		
		



		<%@include file="../footer.jsp"%>
	</div>
	
	<script>
		function getUserInfo(name, phone, gender, birthYear) {
			var join_type = '<%= session.getAttribute("join_type")%>'
			
			console.log(name);
			console.log(phone);
			console.log(join_type);
			console.log('<%= session.getAttribute("token")%>');
			
			if (name == "") {
				alert("본인 인증 오류");
			} else {
				if (join_type == "app") {
					var sendData = {
							user_phone_numb : phone
						};
					
					$.ajax({
						contentType: "application/json; charset=utf-8",
						url: "https://www.buyinhotel.co.kr:5000/user/app-try-use-phonenumb", // 컨트롤러 위치
						type: "post",
						dataType: 'JSON',
						data: JSON.stringify(sendData),
						success: function(result) {
							console.log(result)
							
							var message = result.message;
							
							if(message == "Success") {
								JoinInfo(name, phone, gender, birthYear, join_type, null);
								
								return false;
							} else if(message == "duplicate") {
								alert("번호가 중복되었습니다.");
								
								return false;
							} else if(message == "Fail") {
								alert("전화번호 체크중 오류 발생");
								
								return false;
							}
							
							return false;
						},
						error: function() {
							alert("서버 요청 실패");
							return false;
						}
					});
				} else {
					var token = '<%= session.getAttribute("token")%>'
					
					var sendData = {
							login_type : join_type,
							social_token : token,
							user_phone_numb : phone
						};
					
					$.ajax({
						contentType: "application/json; charset=utf-8",
						url: "https://www.buyinhotel.co.kr:5000/user/social-try-use-phonenumb", // 컨트롤러 위치
						type: "put",
						dataType: 'JSON',
						data: JSON.stringify(sendData),
						success: function(result) {
							console.log(result)
							
							var message = result.message;
							
							if(message == "Success") {
								JoinInfo(name, phone, gender, birthYear, join_type, token);
								
								return false;
							} else if(message == "duplicate") {
								alert("번호가 중복되었습니다.");
								
								return false;
							} else if(message == "Fail") {
								alert("전화번호 체크중 오류 발생");
								
								return false;
							}
							
							return false;
						},
						error: function() {
							alert("서버 요청 실패");
							return false;
						}
					});
				}
			}
		}
		
		function JoinInfo(name, phone, gender, birthYear, join_type, token) {
			$.ajax({
				url: "../JoinInfoCon.do", // 컨트롤러 위치
				type: "post",
				dataType: 'text',
				data: {
	
					name: name,
					phone: phone,
					gender : gender,
					birthYear : birthYear,
					
					join_type : join_type,
					token : token
	
				},
				success: function(result) {
					console.log(result)
	
					if (result == "joinName") {
						alert("이름 오류");

						return false;
					} else if (result == "joinPhone") {
						alert("전화번호 오류");

						return false;
					} else if (result == "joinInfo") {
						location.href = 'signdetail';
						
						return false;
					}
					
					return false;
				},
				error: function() {
					alert("서버 요청 실패");
					return false;
				}
			});
		}
	</script>

</body>
</html>