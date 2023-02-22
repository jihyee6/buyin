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
			<!-- 마이페이지 사이드바 div -->
			<aside>
			<div class="navbar">
				<nav class="inmenu">
					<div class="navside" onclick="location.href='info'"
						style="background-color: #4366A3;">
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
				<table class="myTable">
					<tr>
						<th>아이디</th>
						<th>비밀번호</th>
					</tr>

					<tr>
						<td id='user_id'>-</td>
						<td style="padding: 18px;"><input id="pwd2" type="password"></td>

					</tr>
				</table>
				<hr class="hr1">
				<!-- 회원정보 변경 확인 -->
				<div class="butt2">
					<button type="button" onclick="location.href='memchange2'">확인하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
		<%@include file="../footer.jsp"%>

	</div>
	<script>
	var user_id = '<%=id%>';
		$(function(){
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
						
						$('#user_id').text(data.user_email.split("@")[0]);
						
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