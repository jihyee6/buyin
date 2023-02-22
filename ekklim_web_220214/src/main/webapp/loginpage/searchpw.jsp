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
	border-radius: 5px;
}

.subtext{
	text-align: center;
	font-size: 16px;
	font-family: NanumSquare_ac;
	color: #242424;
}

.logbox{
	display: inline-block;
	margin: 40px 0px 0px 74px;
}
.loginbox img{
	margin: 45px 166px;
}
</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="loginbox">
				<div class="title3">비밀번호 찾기</div>
				<p class="subtext">비밀번호를 찾으실 아이디 입력 후 휴대폰 인증을 진행해주세요.</p>
				<form class="logbox">
				<!-- 아이디 입력 div -->
					<div class="textbox">
						<p>아이디</p>
						<input type="text" id="userid" style="margin-left: 30px;">
					</div>
					<!-- 이미지 클릭시 휴대폰 인증으로 넘어간 후 비밀번호 결과페이지로 넘어가기 -->
					<img src="../images/cellphone.png" id='authImg'> 
				</form>
			</div>

		</div>
		<%@include file="../footer.jsp"%>
	</div>
	<script>
	var user_id = '<%=id%>';
		
	/* 아이디값과 휴대폰인증한 휴대폰 번호가 회원정보가 일치한지 확인 */
		$(document).on('click','#authImg',function(){
			var loginId = $('#userid').val();
			
			/* 아이디와 휴대폰 인증번호가 일치하는지 확인 */
			 $.ajax({
				url : "https://www.buyinhotel.co.kr:5000/user/check-id?login_id=" + loginId + "&phone_numb=", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        }, 
				success : function(result){
					data = result.data;
					console.log(data);

					if(result.message == 'Success'){
						if(data.result == 'Success'){
							/* 일치하면 비밀번호 변경하는 페이지로 이동 */
							location.href='changepw';
						} else{
							alert("일치하는 회원정보가 없습니다.");
							location.href='login';
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