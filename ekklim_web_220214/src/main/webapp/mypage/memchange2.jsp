<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>

<!-- 메인css -->
<link rel = "stylesheet" href = "../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>

<style>
.confirm ,.pwCheckBth{
	width: 70px;
	height: 28px;
	font-size: 12px;
	text-align: center;
	border: 1px solid #C7C7C7;
	border-radius : 6px;
	background-color: white;
	cursor: pointer;
	font-family: NanumSquare_ac;
	margin-left: 8px;
}
input{
	padding: 6px 8px;
	text-align: center;
	border: 1px solid #C7C7C7;
	border-radius: 6px;
	margin: 0px 4px;
}
.bttext{
	font-size: 12px;
	color: #08BF57;
	font-family: NanumSquare_ac;
}

.information th,td{
	padding: 15px;
	height: 30px;
	line-height: 30px;
}

#mobile{
	width: 70px;
	height: 28px;
	border: 1px solid #C7C7C7;
	border-radius: 6px;
}

#email_select{
	width: 150px;
	height: 30px;
	border: 1px solid #C7C7C7;
	border-radius: 6px;
}
#pwd{
	width: 330px;
}
.pwChange{
	width: 176px;
}
.pwChange td{
	font-weight: bold;
	text-align: center;
}
.changePw{
	display: none;
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
		<div class="content">
			<div class="title">
				<div class="tname">
					<div class="pagename">&nbsp;마이페이지</div>
				</div>
			</div>
			<div class='pageContent'>
				<!-- 마이페이지 메뉴 사이드바 div -->
				<aside>
					<div class="navbar">
						<nav class="inmenu">
							<div class="navside" onclick="location.href='info'"	style="background-color: #4366A3;">
								<div class="navitem" id="myinfo">
									<span class="textmenu" style="color: #FFFFFF;">내정보</span>&nbsp;&nbsp;
									<img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
								</div>
							</div>
							<div class="navside" onclick="location.href='point'">
								<div class="navitem" id="point">
									<span class="textmenu">포인트·쿠폰 </span> 
								</div>
							</div>
							<div class="navside" onclick="location.href='gift'">
								<div class="navitem" id="gift">
									<span class="textmenu">선물함</span>
								</div>
							</div>
							<div class="navside" onclick="location.href='shoppingBasket'">
								<div class="navitem" id="shoppingBasket">
									<span class="textmenu">장바구니</span>
								</div>
							</div>
							<div class="navside" onclick="location.href='recentSearch'">
								<div class="navitem" id="recent">
									<span class="textmenu">최근 검색 숙소</span> 
								</div>
							</div>
	
							<div class="navside" onclick="location.href='wish'">
								<div class="navitem" id="wish">
									<span class="textmenu">위시리스트</span> 
								</div>
							</div>
							
							<div class="navside" onclick="location.href='Myreservation'">
								<div class="navitem" id="reservation">
									<span class="textmenu">예약·취소내역</span> 
								</div>
							</div>
	
							<div class="navside" onclick="location.href='review'">
								<div class="navitem" id="review">
									<span class="textmenu">나의리뷰</span> 
								</div>
							</div>
						</nav>
					</div>
				</aside>

			<div class="maintext">
				<div class="maintitle">회원정보변경</div>
				<div class="tabmenu">
				<hr class="hr1">
				<!-- 회원정보 변경 테이블 -->
				<table class="information">
					<tr>
						<th>이름</th>
						<th>휴대폰번호</th>
						<th>이메일</th>
					</tr>

					<tr>
						<!-- 회원 이름 입력 -->
						<td><input type='text' id='user_name' style='text-align: left;'></td>
						<!-- 휴대폰 번호 입력 부분 --> 
						<td><select id="mobile" name="mobile01[]"
							fw-filter="isNumber" fw-label="N" fw-msg>
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
						</select> -&nbsp;<input type="text" name="phone1" class="input0 phone1" maxlength="4"
							size="4"> -&nbsp;<input type="text" name="phone2"
							class="input0 phone2" maxlength="4" size="4">&nbsp;
							<!-- 휴대폰 인증하기 버튼 -->
							<button type="submit" class="confirm">인증하기</button>
							<!-- 인증 결과 안내 -->
							<br><span class="bttext">인증되었습니다.</span></td>
							<!-- 이메일 입력 부분 -->
						<td><input type="text" name="email" class="email1 emailId" size="15">@
							<input type="text" name="email" class="email1 domain" size="15">
							<select name="email_select" class="box" id="email_select">
								<option value="" selected>선택하세요</option>
								<option value="naver.com">naver.com</option>
								<option value="hotmail.com">hotmail.com</option>
								<option value="hanmail.com">hanmail.com</option>
								<option value="yahoo.co.kr">yahoo.co.kr</option>
								<option value="1">직접입력</option>
						</select>
						<!-- 이메일 인증하기 버튼 -->
						<!-- <button type="submit" class="confirm">인증하기</button>
						인증 결과 안내
						<br><span class="bttext">인증되었습니다.</span></td> -->
					</tr>
				</table>
				<hr class="hr1">
				<!-- 회원정보 변경 버튼 div -->
				<div class="butt">
					<button type="button" class='memChangeBtn'>변경완료</button>
					<button type="button" class='memDeleteBtn' onclick="location.href='memdelete'">회원탈퇴</button>
				</div>
				<div>
					<hr class="hr1">
					<table style='margin-left: 0;'>
						<tr class='pwChange'>
							<td>현재 비밀번호</td>
						</tr>
						<tr>
							<!-- 현재비밀번호 -->
							<td>
								<input id="pwd" type="password" class='currentPw'>
								<button type='button' class='pwCheckBth'>확인</button>
							</td>
						</tr>
					</table>
					<!-- 현재 비밀번호가 일치할때 비밀번호 변경 input append -->
					<table class='pwChangeArea' style='margin-left: 0;'>
						
					</table>
					<hr class="hr1">
					<div class="butt changePw">
						<button type="button" class='pwChangeBtn'>비밀번호 변경</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		<%@include file="../footer.jsp"%>
	</div>
	<script>
		var user_id = '<%=id%>';
		var login_pw;
		
		$(function(){
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../loginpage/login';
			}else{
				/* 로그인한 회원의 정보 보여주는 ajax */
				$.ajax({
					url : "../basic-myinfo", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						
						if(result.message == 'Success'){
							data = result.data;
							console.log(data);	
							
							/* 회원정보 부분에 회원정보값 넣기 */
							$('#user_name').val(data.user_name);
							$('.phone1').val(data.user_tel.substring(3,7));
							$('.phone2').val(data.user_tel.substr(7,11));
							$('#mobile').val(data.user_tel.substr(0,3)).prop("selected",true);
							$('.emailId').val(data.user_email.split("@")[0]);
							$('.domain').val(data.user_email.split("@")[1]);
							
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
				
				/* 이메일 도메인들 select의 옵션값 선택시 domain input에 선택한 옵션값으로 바꾸기 */
				$('#email_select').change(function(){
					$('.domain').val($(this).val());
				})
			}
		})
		
		/* 회원정보 변경 후 변경완료 버튼 누를때 회원정보 변경 기능 넣기 */
		$(document).on('click','.memChangeBtn',function(){
			
			var userName = $('#user_name').val();
			var userTel;
			var userEmail;
			
			userTel = $('#mobile').val() + $('.phone1').val() + $('.phone2').val();
			userEmail = $('.emailId').val() + "@" + $('.domain').val();

			var sendData = {
					user: user_id,
					name: userName,
					tel: userTel,
					email: userEmail,
				 }
			
			  console.log(sendData);
			 $.ajax({
				 contentType: "application/json; charset=utf-8",
				 url : "../basic-myinfo?user=" + user_id, // 컨트롤러 위치
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
						alert("정보변경이 완료되었습니다.")
						location.href='info';
						return false;
					} else if(result.message == 'Fail'){
						alert("서버오류 발생");
						return false;
					} else if(result.message == 'Duplicate') {
						alert("전화번호가 동일한 회원이 있습니다.");
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
		
		/* 현재비밀번호 확인 버튼 클릭하여 로그인한 비밀번호와 입력한 비밀번호 값이 같은지 확인 */
		$(document).on('click','.pwCheckBth',function(){
			var currentPw = $('.currentPw').val();
			
			var sendData = {
					user: user_id,
					pw : currentPw,
				 }
			
			  console.log(sendData);
			 $.ajax({
				 contentType: "application/json; charset=utf-8",
				 url : "https://www.buyinhotel.co.kr:5000/user/password-check", // 컨트롤러 위치
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
						pwChange();
						$('.changePw').css('display','block');
						return false;
					} else if(result.message == 'Fail'){
						alert("비밀번호가 일치하지 않습니다.");
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
		
		/* 비밀번호 입력후 유효성 검사 */
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
		
		
		// 새 비밀번호와 비밀번호 확인에 입력한 값이 같은지 확인
	   function RePwCheck() {
	     	var pw = $('.newPw').val();
			var pwRe = $('.newPwCheck').val();
			
			$.ajax({
			 url : "../PwReCon.do", // 컨트롤러 위치
			 type : "post",
			 data : {pw: pw, pwRe: pwRe},
			 dataType : 'text',
			 success : function(result){
			
			// 5~20자의 영문자, 숫자만 사용 가능합니다.
			
			   if (result == "Blank") {
				   $('#pwReCheck').text("비밀번호를 먼저 입력 해주세요.");
			       $('#pwReCheck').css({"color":"red","font-size":"12px"});
			       return false;
			   } else if(result == "Match") {
			       $('#pwReCheck').text("비밀번호가 일치하지 않습니다.");
			       $('#pwReCheck').css({"color":"red","font-size":"12px"});
			       return false;
			   } else if(result == "Success"){
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
		
	    /* 비밀번호 변경 버튼누르고 비밀번호 변경 */
	    $(document).on('click','.pwChangeBtn',function(){
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
						location.href='info';
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
	    
	    /* 입력한 현재 비밀번호가 로그인한 회원의 비밀번호와 일치했을때 비밀번호 변경을 위한 table append하는 함수 */
		function pwChange(){
			$('.pwChangeArea').append(
				"<tr class='pwChange'>"
					+"<td>새 비밀번호</td>"
					+"<td>새 비밀번호 확인</td>"
				+"</tr>"
				+"<tr>"
					+"<td>"
						+"<input id='pwd' type='password' class='newPw'>"
						+"<p id='pwCheck'></p>"
					+"</td>"
					+"<td>"
						+"<input id='pwd' type='password' class='newPwCheck'>"
						+"<p id='pwReCheck'></p>"
					+"</td>"
				+"</tr>"
			)
		}
		
	    /* 새 비밀번호에 값 입력시 비밀번호 유효성 검사와 일치여부 함수 실행되게 함 */
		$(document).on('keyup','.newPw',function(){
			PwCheck();
			RePwCheck();
		})
		
		/* 비밀번호 확인에 값 입력시 비밀번호 유효성 검사와 일치여부 함수 실행되게 함 */
		$(document).on('keyup','.newPwCheck',function(){
			RePwCheck();
		})
	
	</script>
</body>
</html>