<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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

.textbox {
	margin-top: 30px;
	display: block;
}

.textbox p {
	text-align: center;
	font-size: 18px;
	margin: auto 20px;
	font-family: NanumSquare_ac;
	color: #242424;
}

.textbox input {
	width: 388px;
	height: 50px;
	margin: 25px auto;
	border: 1px solid #DCDCDC;
	font-size: 32px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	background: white;
	border-radius: 6px;
	text-align: center;
}

.subtext{
	text-align: center;
	font-size: 16px;
	font-family: NanumSquare_ac;
	color: #242424;
}

.btid button{
	width: 186px;
	height: 50px;
	border: none;
	border-radius: 8px;
	font-size: 18px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	cursor: pointer;
	color: white;
}

.btid{
	margin: 50px 0px 0px 166px;
}

</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="loginbox">
				<!-- 아이디 찾기 제목 div -->
				<div class="title3">아이디 찾기</div>
				<form class="logbox" style="display: flex; margin-top: 40px;">
					<!-- 아이기 결과 div -->
					<div class="textbox">
						<div class='idResult'>
							<p>회원님의 아이디는</p>
							<input type="text" id="userid">
							<p>입니다.</p>
						</div>
					</div>
				</form>
				<!-- 로그인/비밀번호 찾기 넘어가는 btn div -->
				<div class="btid">
					<button type="button" onclick="location.href='login'" style="background: #4366A3;">로그인</button>
					<button type="button" onclick="location.href='searchpw'" style="background: #B1B1B1;">비밀번호찾기</button>
				</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>
	<script>
	var user_id = '<%=id%>';
		/* 찾은 아이디값 보여주는 ajax */
		$(function(){
			$.ajax({
				url : "https://www.buyinhotel.co.kr:5000/user/find-id?phone_numb=", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        }, 
				success : function(result){
					data = result.data;
					console.log(data);

					if(result.message == 'Success'){
						if(data.result == "Success"){
							/* data.type이 app일때만 id값을 알려줌 */
							if(data.type == 'app'){
								$('#userid').val(data.login_id);
								/* data.type이 소셜로그인일때 해당 소셜로그인으로 가입한 회원임을 알려줌 */
							} else if(data.type == 'kakao'){
								$('.idResult').css('display','none');
								$('.textbox').append(
									"<p>kakao로 가입한 회원입니다.</p>"		
								)
							} else if(data.type == 'naver'){
								$('.idResult').css('display','none');
								$('.textbox').append(
									"<p>naver로 가입한 회원입니다.</p>"		
								)
							} else if(data.type == 'apple'){
								$('.idResult').css('display','none');
								$('.textbox').append(
									"<p>apple로 가입한 회원입니다.</p>"		
								)
							}
							/* result가 false일때 가입한 회원이 아님 */
						} else{
							$('.idResult').css('display','none');
							$('.textbox').append(
								"<p>가입한 회원이 아닙니다.</p>"		
							)
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