<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.loginbox {
	margin: 80px 620px;
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

.textbox {
	margin-top: 30px;
	display: block;
}

.textbox p, .textbox2 p{
	font-size: 18px;
	margin: 12px auto;
	font-family: NanumSquare_ac;
	color: #242424;
}

.textbox input {
	width: 488px;
	height: 30px;
	margin: 0px;
	border: none;
	font-size: 16px;
	font-family: NanumSquare_ac;
	background: #F3F3F3;
	border-radius: 5px;
	color: #242424;
}

.textbox2{
display: block;
margin-top: 30px;
}

.textbox3{
margin: 50px 0px 10px 58px;
font-size: 16px;
color: #FF4D4D;
font-family: NanumSquare_ac;
}

.textbox4{
margin-left: 58px;
font-family: NanumSquare_ac;
font-size: 16px;
color: #242424;
line-height: 28px;
}

hr{
width: 492px;
margin: 10px auto;
color: #CECECE;
}

.textbox4 input{
margin-top: 12px;

}
.textbox2 input{
    width: 152px;
    height: 30px;
    border: none;
    background: #F3F3F3;
    border-radius: 5px;
    margin: auto 5px;
    color: #242424;
}

.emailbox > #email_select{
    border: none;
    width: 130px;
    height: 30px;
    background: #F3F3F3;
    border-radius: 5px;
    margin: auto 5px;
    font-size: 16px;
    font-family: NanumSquare_ac;
    color: #242424;
}

.logbox {
	display: inline-block;
	margin: 10px 0px 0px 132px;
}

#btbrown {
	width: 492px;
	margin: 40px auto;
	height: 45px;
	border: none;
	background: #4366A3;
	border-radius: 10px;
	color: white;
	font-size: 18px;
	font-family: NanumSquare_ac;
	font-weight: bold;
	cursor: pointer;
}
</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="loginbox">
				<div class="title3">회원가입</div>
				
				<!-- 로그인박스 폼 -->
				<form class="logbox">
					<div class="textbox" id="useridBox">
						<p>아이디</p>
						<input type="text" id="userid" style='width: 360px'>
						<input type="button" id="idCheckBtn" value="중복체크" style='width: 120px'>
					</div>
					<div class="textbox" id="userpwBox">
						<p>비밀번호</p>
						<input type="password" id="userpw">
						<div id="pwCheck"></div>
					</div>
					<div class="textbox">
						<p>이름</p>
						<input type="text" id="username" readonly>
					</div>
					<div class="textbox">
						<p>휴대폰번호</p>
						<input type="tel" id="usertel" readonly>
					</div>
					<div class="textbox2">
						<p>이메일</p>
						
						<!-- 이메일 박스 -->
						<div class="emailbox">
						<input type="text" id="emailAccount" class="email1" size="15">@
						<input type="text" id="emailDomain" class="email1" size="15">
						<select id="email_select" class="box" id="email_select">
							<option value="" selected>직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="hanmail.com">hanmail.com</option>
							<option value="yahoo.co.kr">yahoo.co.kr</option>
						</select>					
						</div>					
					</div>
					<!-- 이용약관 동의 체크박스 -->
					<div class="textbox3">
						<input type="checkbox" id="allCheck"> 전체동의
					</div>
					<hr>
					<div class="textbox4">
						<input type="checkbox" name='oneCheck' id='serviceTerms'> 이용약관 동의(필수)<br>
						<input type="checkbox" name='oneCheck' id='ageTerms'> 만 14세 이상 확인(필수)<br>
						<input type="checkbox" name='oneCheck' id='privacyTerms'> 개인정보 수집 이용 동의(필수)<br>
						<!-- <input type="checkbox" id=""> 개인정보 수집 및 이용 동의(선택)<br> -->
						<input type="checkbox" name='oneCheck' id='marketingTerms'> 마케팅 알림 수신 동의(선택)<br>
						<input type="checkbox" name='oneCheck' id='locationTerms'> 위치기반 서비스 이용약관 동의(선택)
					</div>
					<button type="button" id="btbrown">회원가입</button>
				</form>
			</div>

		</div>





		<%@include file="../footer.jsp"%>
	</div>
	 <script>	 
	 	var join_type = '<%= session.getAttribute("join_type")%>';
	 	var name = '<%= session.getAttribute("name")%>';
	 	var phone = '<%= session.getAttribute("phone")%>';
	 	var token = '<%= session.getAttribute("token")%>';
	 	var origin_page = '<%= session.getAttribute("origin_page")%>';
	 	
	 	var idCheck = false;
	 	var pwCheck = false;
	 	
	 	var id = "";

	 	function IDCheck() {
	 		id = $('#userid').val();
			var input_phone = $('#usertel').val();
	 		
 	 		if (phone != input_phone) {
	 			alert("전화번호 변조 위험");
	 			
	 			return;
	 		}
	 		
	 		var sendData = {
	 				user_id : id,
	 				user_phone_numb : phone
	 		};
	 		
			$.ajax({
				contentType: "application/json; charset=utf-8",
				url: "https://www.buyinhotel.co.kr:5000/user/app-user-id-check", // 컨트롤러 위치
				type: "post",
				dataType: 'JSON',
				data: JSON.stringify(sendData),
				success: function(result) {
					console.log(result)
					
					var message = result.message;
					
					if(message == "Success") {
						idCheck = true;
						
						alert("사용가능한 아이디입니다.");
						
						return false;
					} else if(message == "duplicate") {
						idCheck = false;
						
						alert("중복된 아이디입니다.");
						
						return false;
					} else if(message == "Exist") {
						idCheck = false;
						
						alert("이미 회원가입이 완료되었습니다.");
						
						return false;
					} else if(message == "Fail") {
						idCheck = false;
						
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
	 	
	 	function PwCheck() {
	 		var pw = $('#userpw').val();

            $.ajax({
		        url : "../../PwCheckCon.do", // 컨트롤러 위치
		        type : "post",
		        data : {pw: pw},
		        dataType : 'text',
		        success : function(result){
			
			        if (result == "Regex") {
				          $('#pwCheck').text("8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
	                	  $('#pwCheck').css({"color":"red","padding-left":"24px"});
	                	  
	                	  pwCheck = false;
	                	  
	                	  return false;
	    			} else if(result == "Success"){
	    				  $('#pwCheck').text('사용 가능한 비밀번호 입니다.');
	                	  $('#pwCheck').css({"color":"#666DF2", "padding-left":"24px"});
	                	  
	                	  pwCheck = true;
	                	  
						  return true;
					} 
					
	    			return false;
			    },
		        error : function(){
			        alert("비밀번호 검증 실패");
			        return false;
		        }
			});
	 	}
	 	
	 	function JoinComplete() {
 	 		if (name == 'null' || phone == 'null') {
				return;
			}
	 		
	 		var input_name = $('#username').val();
	 		var input_phone = $('#usertel').val();
	 		
 	 		if (name != input_name || phone != input_phone) {
	 			alert("정보 변조 위험");
	 			
	 			return;
	 		}
	 		
	 		var account_check;
	 		var email_account = $('#emailAccount').val();
	 		var email_domain = $('#emailDomain').val();
	 		var service_terms_check = $('#serviceTerms').is(":checked");
	 		var age_terms_check = $('#ageTerms').is(":checked");
	 		var privacy_terms_check = $('#privacyTerms').is(":checked");
	 		
	 		if (join_type == "app") {
	 			console.log(idCheck);
	 			
	 			account_check = idCheck && pwCheck;
	 			
	 			console.log(account_check);
	 		} else {
	 			account_check = true;
	 		}
	 		
	 		if(!account_check) {
	 			alert("아이디 중복체크 및 올바른 비밀번호를 입력해주세요.");
	 		} else if(email_account == "" || email_domain == "") {
	 			alert("이메일 입력은 필수사항입니다.");
	 		} else if(!service_terms_check || !age_terms_check || !privacy_terms_check) {
	 			alert("필수 약관에 동의해주세요.");
	 		} else {
	 			var sendData;
	 			
	 			if (join_type == "app") {
	 				sendData = {
	 						login_id : id,
	 						login_type : "app",
	 						username : name,
	 						user_email_account : email_account,
	 						user_email_domain : email_domain,
	 						user_phone_numb : phone,
	 						password : $('#userpw').val(),
	 						social_token : null,
	 						marketing_check : $('#marketingTerms').is(":checked"),
	 						location_check : $('#locationTerms').is(":checked")
	 				};
	 			} else {
	 				sendData = {
	 						login_id : null,
	 						login_type : join_type,
	 						username : name,
	 						user_email_account : email_account,
	 						user_email_domain : email_domain,
	 						user_phone_numb : phone,
	 						password : null,
	 						social_token : token,
	 						marketing_check : $('#marketingTerms').is(":checked"),
	 						location_check : $('#locationTerms').is(":checked")
	 				};
	 			}
	 			
	 			$.ajax({
					contentType: "application/json; charset=utf-8",
					url: "https://www.buyinhotel.co.kr:5000/user/join-complete", // 컨트롤러 위치
					type: "put",
					dataType: 'JSON',
					data: JSON.stringify(sendData),
					success: function(result) {
						console.log(result);
						
						var message = result.message;
						
						if(message == "Success") {
							
							
							return false;
						} else if(message == "Fail") {							
							alert("회원가입 중 오류 발생");
							
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
	 	
		function Login(id, login_type) {	
			$.ajax({
				url: "../WebLoginCon.Webdo", // 컨트롤러 위치
				type: "post",
				dataType: 'text',
				data: {
	
					id: id,
					login_type: login_type,
	
				},
				success: function(result) {
					console.log(result)
	
					if (result == "loginId") {
						alert("아이디 오류");

						return false;
					} else if (result == "loginType") {
						alert("타입 오류");

						return false;
					} else if (result == "login") {
						location.href = origin_page;
						
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
	 
		/* 체크박스 전체 체크 클릭시 전체 체크박스 체크, 체크박스 전체 체크시 전체체크 체크박스 체크 */
		$(function() {
			console.log(join_type);
			
 			if (join_type != "app") {
				$('#useridBox').css('display', 'none');
				$('#userpwBox').css('display', 'none');
			}
			
			if (name == 'null' || phone == 'null') {
				alert("회원가입 중 오류가 발생했습니다. 처음부터 다시 시도해주세요.");
			} else {
				$('#username').val(name);
				$('#usertel').val(phone);
			}
		});
		
		$("#idCheckBtn").click(function() {
			IDCheck();
		});
		
		$('#userpw').keyup(function() {
			PwCheck();
		})
		
		$("#email_select").change(function() {
			var domain = $(this).val();
			if (domain == "") {
				$("#emailDomain").val(domain);
				$("#emailDomain").attr('readonly', false);
			} else {
				$("#emailDomain").val(domain);
				$("#emailDomain").attr('readonly', true);
			}
		});
		
		/* 전체체크 클릭시 */
		$("#allCheck").click(function() {
			if($("#allCheck").is(":checked")) $("input[name=oneCheck]").prop("checked", true);
			else $("input[name=oneCheck]").prop("checked", false);
		});
		/* 체크박스 하나 클릭시 */
		$("input[name=oneCheck]").click(function() {
			var total = $("input[name=oneCheck]").length;
			var checked = $("input[name=oneCheck]:checked").length;
			
			if(total != checked) $("#allCheck").prop("checked", false);
			else $("#allCheck").prop("checked", true); 
		});
		
		$("#btbrown").click(function() {
			JoinComplete();
		});
		
	</script>
</body>
</html>