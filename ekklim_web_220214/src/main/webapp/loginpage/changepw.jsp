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

.textbox p {
	font-size: 18px;
	margin: 20px auto;
	font-family: NanumSquare_ac;
	color: #242424;
}

.textbox input {
	width: 388px;
	height: 40px;
	border: none;
	font-size: 16px;
	font-family: NanumSquare_ac;
	background: #F3F3F3;
	border-radius: 5px;
}

.subtext {
	text-align: center;
	font-size: 16px;
	font-family: NanumSquare_ac;
	color: #242424;
}

.logbox {
	display: inline-block;
	margin: 40px 0px 0px 162px;
}

#btbrown {
	width: 388px;
	margin-top: 50px;
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
#pwCheck, #pwReCheck{
	font-size: 12px;
	margin-bottom: 8px;
	text-align: center;
}
</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>
		<!-- 헤더 밑에 콘텐츠 부분 -->		
		<div class="content">
			<div class="loginbox">
				<!-- 비밀번호 변경 + 설명 부분 -->
				<div class="title3">비밀번호 변경</div>
				<p class="subtext">변경하실 비밀번호를 입력해주세요.</p>
				<!-- 비밀번호 변경 input부분 -->
				<form class="logbox">
					<div class="textbox">
						<p>비밀번호</p>
						<input type="password" id="userpw" class='newPw'>
						<p id='pwCheck'></p>
					</div>
					<div class="textbox">
						<p>비밀번호 확인</p>
						<input type="password" id="userpw" class='newPwCheck'>
						<p id='pwReCheck'></p>
					</div>
					<button type="button" id="btbrown">변경완료</button>
				</form>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>
<script>
var user_id = '<%=id%>';
var login_pw;
	
	/* 비밀번호 입력 유효성검사 */
	 	function PwCheck() {
	 		var pw = $('.newPw').val();
			
	        $.ajax({
		        url : "../PwCheckCon.do", // 컨트롤러 위치
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
		
		
		// 새 비밀번호와 비밀번호 확인에 입력한 값이 일치한지 확인하는 함수
	   function RePwCheck() {
	     	var pw = $('.newPw').val();
			var pwRe = $('.newPwCheck').val();
			
			$.ajax({
			 url : "../PwReCon.do", // 컨트롤러 위치
			 type : "post",
			 data : {pw: pw, pwRe: pwRe},
			 dataType : 'text',
			 success : function(result){
			
			   if (result == "Blank") {
				   $('#pwReCheck').text("비밀번호를 먼저 입력 해주세요.");
			       $('#pwReCheck').css({"color":"red","font-size":"12px"});
			       return false;
			   } else if(result == "Match") {
			       $('#pwReCheck').text("비밀번호가 일치하지 않습니다.");
			       $('#pwReCheck').css({"color":"red","font-size":"12px"});
			       return false;
			   } else if(result == "Success"){
				   /* 입력한 새 비밀번호와 비밀번호 확인 값이 일치할때 */
				   if(pwRe != ''){
				       $('#pwReCheck').text("비밀번호가 일치합니다.");
				       $('#pwReCheck').css({"color":"#08a600","font-size":"12px"});
				       login_pw = $('.newPwCheck').val();
				   }
			       return true;
			   } 
			      return false;
			  },
			  error : function(){
			   alert("비밀번호 검증 실패");
			   return false;
			  }
			})
	    };
	
	 /* 비밀번호 변경 후 변경완료 버튼 클릭 */
	$(document).on('click','#btbrown',function(){
		var sendData = {
				user: user_id,
				new_pw: login_pw,
			 }
		
		  console.log(sendData);
		 $.ajax({
			 contentType: "application/json; charset=utf-8",
			 url : "https://www.buyinhotel.co.kr:5000/user/password", // 컨트롤러 위치
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
					alert("비밀번호 변경이 완료되었습니다.")
					location.href='../info';
					return false;
				} else if(result.message == 'Fail'){
					alert("서버오류 발생");
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
		
	 	/* 새 비밀번호에 값 입력할때 비밀번호 유효성, 확인 함수 실행 */
		$(document).on('keyup','.newPw',function(){
			PwCheck();
			RePwCheck();
		})
		
		/* 비밀번호 확인에 값 입력할때 비밀번호 유효성, 확인 함수 실행 */
		$(document).on('keyup','.newPwCheck',function(){
			RePwCheck();
		})
</script>
</body>
</html>