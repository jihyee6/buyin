<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<!-- 메인css -->
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<style>
.tabmenu {
	max-width: 860px;
	margin: 0 auto;
	position: relative;
}
.rank{
	width: 50px;
	border: 1px solid #4C4C4C;
	color: #4C4C4C;
	font-size: 12px;
	background-color: white;
	padding: 5px;
	text-align: center;
	border-radius: 3px;
	margin: -23px 0px 0px 105px;
	font-weight: bold;
}
</style>
</head>
<body>
<%
	String rooms = request.getParameter("room"); 
	String type = request.getParameter("type");
	String checkin = request.getParameter("checkin");
	String checkout = request.getParameter("checkout");
%>
<%String hotel = request.getParameter("hotel"); %>
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
				<div class="maintitle">내정보</div>
				<div class="tabmenu">
					<hr class="hr1">
					<!-- 회원 정보 테이블 -->
					<table class="myTable">
						
					</table>
					<hr class="hr1">
					<!-- 회원탈퇴, 변경 버튼 -->
					<div class="butt2">
						
					</div>
				</div>
			</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>

	<script>
	 		var rooms = '<%=rooms%>';
	 		var type = <%=type%>;
	 		var checkin = '<%=checkin%>';
	 		var checkout = '<%=checkout%>';
	 		var user_id = '<%=id%>';
	 		
			$(function() {
				if(user_id == "null") {
					alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
					location.href = '../loginpage/login';
				} else{
					/* 회원정보 보여주는 ajax */
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
								
								//userInfo();
								userTable();
								
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
				}
			})
		</script>
		
			
	    <script>
	    	/* 내 정보에 data넣기 */
			function userInfo() {
				$('#user_email').text(data.user_email);
				$('#user_grade').text(data.user_grade);
				$('#user_name').text(data.user_name);
			}	
			   	
			
			function userTable(){
	    		$('.myTable').append(
	    			"<tr>"
						+"<th>이름</th>"
						+"<th class='email'>이메일</th>"
					+"</tr>"
					+"<tr>"
						+"<td ><p id='user_name'>" + data.user_name + "</p><div class='rank' id='user_grade'>" + data.user_grade + "</div></td>"
						+"<td id ='user_email' class='email'>" + data.user_email + "</td>"
					+"</tr>"	
	    		)
	    		
	    		$('.butt2').append(
	    			"<button type='button' class='memChangeBtn'>회원정보변경</button>"
	    		)
	    		
	    		//기업회원일때
				if(data.business_user == true){
					$('.email').css("display", "none");
					$('.memChangeBtn').css("display", "none");
				}
	    	}
			
			/* 회원정보 변경하기 클릭시 회원정보 변경 페이지로 이동 */
			$(document).on('click','.memChangeBtn',function(){
				location.href='memchange2';
			})
	    
	</script>

</body>
</html>