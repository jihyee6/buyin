<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BUY IN HOTEL</title>
<link rel="stylesheet" href="../css/main.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>
.loginbox {
	margin: 80px 800px;
	width: 400px;
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
	margin-top: 42px;
}

.textbox p {
	font-size: 12px;
	margin-bottom: 12px;
	font-family: malgun;
	font-weight: bold;
	color: #707070;
}

.textbox input {
	width: 380px;
	height: 27px;
	border: none;
	border-bottom: 2px solid #4366A3;
	font-size: 14px;
	font-family: malgun;
	color: #707070;
}

.searchbox {
	float: right;
	margin-right: 13px;
	cursor: pointer;
}

.check1 {
	font-size: 14px;
	margin: 12px auto;
	color: #6D6D6D;
	font-family: malgun;
}

#btlog, .sign button {
	width: 380px;
	margin: 25px auto;
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

.btcolor button {
	width: 180px;
	height: 40px;
	margin-bottom: 40px;
	border: none;
	border-radius: 8px;
	font-size: 14px;
	font-weight: bold;
	font-family: malgun;
	cursor: pointer;
}

#kakao {
	display: flex;
	align-content: center;
	align-items: center;
	flex-wrap: nowrap;
	margin-left: 0px;
    margin-right: 0px;
    text-align: center;
	width: 185px;
	height: 40px;
	margin-bottom: 40px;
	border: none;
	border-radius: 8px;
	font-size: 14px;
	font-weight: bold;
	font-family: malgun;
	cursor: pointer;
	background: #FAE100;
	color: #5E5E5E;
}
#kakao img{
	margin: 0 14px;
}

#naver_id_login {
	width: 180px;
	height: 40px;
	margin-bottom: 40px;
	border: none;
	border-radius: 8px;
	font-size: 14px;
	font-weight: bold;
	font-family: malgun;
	cursor: pointer;
	background: #1EC545;
	color: white;
	margin-left: 9px;
} 

/* .sign button {
	width: 380px;
	height: 40px;
	border: 2px solid #A1A1A1;
	background: white;
	font-size: 18px;
	color: #787878;
	font-family: NanumSquare_ac;
	font-weight: bold;
	border-radius: 10px;
	margin: 0 auto;
	cursor: pointer;
} */

.logbox button {
	cursor: pointer;
}
</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="loginbox">
				<div class="title3">로그인</div>
				<div class="logbox">
					<div class="textbox">
						<p>아이디</p>
						<input type="text" id="user_id" placeholder="아이디를 입력해주세요.">
					</div>
					<div class="textbox">
						<p>비밀번호</p>
						<input type="password" id="user_pw" placeholder="비밀번호를 입력해 주세요.">
					</div>
<!-- 					<div class="check1">
						<input type="checkbox" name="saveid"> 아이디 저장
						<div class="searchbox">
							<span onclick="location.href='searchid.jsp'">아이디/</span><span
								onclick="location.href='searchpw.jsp'">비밀번호 찾기</span>
						</div>
					</div> -->

					<button type="button" id="btlog">로그인</button>
					<div class="btcolor" style='display: flex;width:380px;margin-left:0px;margin-right:0px'>
						<button id="kakao">
							<img alt="kakao" src="../images/icon/kakaoIcon.png">
							카카오톡 로그인
						</button>
						<div id="naver_id_login"></div>
<!-- 						<button type="button" id="kakao">카카오톡
							로그인</button>
						<button type="button" id="naver_id_login">네이버
							로그인</button> -->
					</div>
					<div class="sign">
						<button type="button" id='webJoin'>통합 회원가입</button>
					</div>
				</div>
			</div>

		</div>





		<%@include file="../footer.jsp"%>
	</div>
	
	<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
		
	<script type="text/javascript">
		Kakao.init('ee7ff3f3324cb139c951a2be686c6e14');
		console.log(Kakao.isInitialized());
		
		var naver_id_login = new naver_id_login("OMVNqw15Yd0gOdxctK21", "https://www.buyinhotel.co.kr/loginpage/navercallback.jsp");
		var state = naver_id_login.getUniqState();
	 	naver_id_login.setButton("green", 3,40);
		naver_id_login.setDomain("https://buyinhotel.co.kr");
		naver_id_login.setState(state);
		naver_id_login.setPopup();
		naver_id_login.init_naver_id_login();
		
		var naver_access_token = null;
	
	
		$(document).ready(function() {			
			// 엔터키 입력
			$("#user_id").keydown(function(key) {
				if (key.keyCode == 13) {
					$("#user_pw").focus();
				}
			});
		
			$("#user_pw").keydown(function(key) {
				if (key.keyCode == 13) {
					AppLogin();
				}
			});
			
			$('#btlog').click(function() {
				AppLogin();
			});
			
			$('#kakao').click(function() {
				KakaoLink();
			});
			
			$('#webJoin').click(function() {
				JoinType(null, 'app');
			});
		});

	</script>
	
	<script type="text/javascript">

	</script>
	
	<script>
		function KakaoLink() {
			Kakao.Auth.login({
			    success: function(response) {
			        console.log(response);
			        
			        Kakao.Auth.setAccessToken(response.access_token);
			        
			        Kakao.API.request({
			            url: '/v2/user/me',
			            success: function(response) {
			                console.log(response);
			                
			                SocialLogin('kakao', String(response.id));
			            },
			            fail: function(error) {
			                console.log(error);
			            }
			        });
			    },
			    fail: function(error) {
			        console.log(error);
			    }
			});
		}
		
		function setNaverAccessToken(access_token) {
			naver_access_token = access_token;
		}
	
		function SocialLogin(login_type, social_token) {
			var sendData = {
					login_type : login_type,
					social_token : social_token,
					fcm_token : null
				};
			
			$.ajax({
				contentType: "application/json; charset=utf-8",
				url: "https://www.buyinhotel.co.kr:5000/user/social-login-try", // 컨트롤러 위치
				type: "post",
				dataType: 'JSON',
				data: JSON.stringify(sendData),
				success: function(result) {
					console.log(result)
					
					var message = result.message;
					
					if(message == "Success") {
						Login(result.app_token, login_type);
						
						return false;
					} else if(message == "Join") {
						JoinType(social_token, login_type);
						
						return false;
					} else if(message == "ReJoin") {
						if(login_type == "kakao") {
							Kakao.API.request({
								  url: '/v1/user/unlink',
								  success: function(response) {
								    console.log(response);
								    
								    KakaoLink();
								  },
								  fail: function(error) {
								    console.log(error);
								  },
							});
						} else if(login_type == "naver") {
							$.ajax({
								url: "../NaverUnlinkCon.Webdo",
								type: "GET",
								dataType: 'text',
								data: {
									access_token : naver_access_token,
								},
								success: function(result) {
									console.log(result)
									
									$('#naver_id_login_anchor').trigger('click');
									
									return false;
								},
								error: function(error) {
									console.log(error);
									
									return false;
								}
							});
						}
						
						return false;
					} else if(message == "Exited") {
						alert("탈퇴처리중인 회원입니다.");
						
						return false;
					} else if(message == "Fail") {
						alert("회원확인 처리중 오류 발생");
						
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
		
		function AppLogin() {
			var sendData = {
					login_id : $('#user_id').val(),
					password : $('#user_pw').val(),
					fcm_token : null
				};
			
			$.ajax({
				contentType: "application/json; charset=utf-8",
				url: "https://www.buyinhotel.co.kr:5000/user/app-user-login", // 컨트롤러 위치
				type: "post",
				dataType: 'JSON',
				data: JSON.stringify(sendData),
				success: function(result) {
					console.log(result)
					
					var message = result.message;
					
					if(message == "Success") {
						Login(result.app_token, "app");
						
						return false;
					} else if(message == "False") {
						alert("아이디 또는 비밀번호가 잘못되었습니다.");
						
						return false;
					} else if(message == "Exited") {
						alert("탈퇴처리중인 회원입니다.");
						
						return false;
					} else if(message == "Fail") {
						alert("회원확인 처리중 오류 발생");
						
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
	
	</script>


	<script type="text/javascript">
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
						location.href = document.referrer;
						
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
		
		function JoinType(token, join_type) {	
			$.ajax({
				url: "../JoinTypeCon.do", // 컨트롤러 위치
				type: "post",
				dataType: 'text',
				data: {
	
					token: token,
					join_type: join_type,
					origin_page : document.referrer
	
				},
				success: function(result) {
					console.log(result)
	
					if (result == "joinToken") {
						alert("아이디 오류");

						return false;
					} else if (result == "joinType") {
						alert("타입 오류");

						return false;
					} else if (result == "join") {
						location.href = 'signup';
						
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
		
	</script>
</body>
</html>