<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String id = (String) session.getAttribute("id");
	if(id == null) {
		 id = request.getHeader("id");
	}
%>
<header>
	<div class="wrapper">
		<div class='header_wrap'>
			<!-- 로그인 안했을때 헤더 -->
			<%if(id == null) {%>
			<div id="logo">
				<a href="../index"><img class='mainLogoImg' src="../images/mainimg/logo.png"></a>
			</div>
			<nav class="main_nav">
				<ul id="main-menu">
				<!-- onclick = 'moveReservation1()' -->
					<li><a href = '../reserhotel/reservation1' style = 'cursor: pointer;'>예약하기</a></li>
					<li><a href="../seemore/notice">더보기</a>
						<ul id="submenu2">
							<li><a href="../seemore/notice">공지사항</a></li>
							<li><a href="../seemore/selectGiftcard">선물하기</a></li>
							<li><a href="../mypage/benefits">회원등급혜택</a></li>
							<li><a href="../seemore/event">이벤트</a></li>
							<li><a href="../seemore/faq">FAQ</a></li>
							<li><a href="../seemore/policy">약관 및 정책</a></li>
						</ul>
					</li>
					<li> <a href="../loginpage/login">로그인</a></li>
					<li><a href="../mypage/gift"><img src="../images/icon/giftBox.png"></a></li>
					<!-- <li>
						<a href="reserhotel/reservation1" class="glassesArea"><img id="glasses" src="images/mainimg/glass2.png"></a>
					</li> -->
				</ul>
			</nav>
			<!-- 로그인했을때 헤더 -->
			<%} else {%>
			<div id="logo">
				<a href="../index"><img class='mainLogoImg' src="../images/mainimg/logo.png"></a>
			</div>
			<nav class="main_nav">
				<ul id="main-menu">
				<!-- onclick = 'moveReservation1()' -->
					<li><a href = '../reserhotel/reservation1' style = 'cursor: pointer;'>예약하기</a></li>
					<li><a href="../seemore/notice">더보기</a>
						<ul id="submenu2">
							<li><a href="../seemore/notice">공지사항</a></li>
							<li><a href="../seemore/selectGiftcard">선물하기</a></li>
							<li><a href="../seemore/event">이벤트</a></li>
							<li><a href="../seemore/benefits">회원등급혜택</a></li>
							<li><a href="../seemore/faq">FAQ</a></li>
							<li><a href="../seemore/policy">약관 및 정책</a></li>
						</ul></li>
						<li><a href="../mypage/shoppingBasket">장바구니</a></li>
							<li class="loginMypage"><a href="../mypage/info">마이페이지</a>
							<ul id="submenu">
								<li><span class="userName" id='headerName'></span>님</li>
								<li><a href="../mypage/info">내정보</a></li>
								<li><a href="../mypage/point">포인트 · 쿠폰</a></li>
								<li><a href="../mypage/gift">선물함</a></li>
								<li><a href="../mypage/shoppingBasket">장바구니</a></li>
								<li><a href="../mypage/recentSearch">최근 검색 숙소</a></li>
								<li><a href="../mypage/wish">위시리스트</a></li>
								<li><a href="../mypage/Myreservation">예약·취소내역</a></li>
								<li><a href="../mypage/review">나의리뷰</a></li>
								<li onclick = 'location.href = "../WebLogoutCon.Webdo"' style='cursor: pointer;'>로그아웃</li>
							</ul></li>
							<li><a href="../mypage/gift"><img src="../images/icon/giftBox.png"></a></li>
							<!-- <li><a href="../reserhotel/reservation1" class="glassesArea">
									<img id="glasses" src="../images/mainimg/glass2.png">
									<input id="glassesText" type="text">
									<img id="deleteIcon" src="../images/icon/delete.png">
								</a></li> -->
					<!-- <li> <a href="../loginpage/login">로그인</a></li> -->
				</ul>
			</nav>
			<%} %>
		</div>
	</div>	
</header>
	
	  <script>
	    /* $(document).on('click', '#glasses', function(){
	        if($('#glassesText').css('display') == 'none'){
	            $(this).css('transition-duration', '1s');
	            $('#glassesText').show();
	            $('#deleteIcon').show();
	            $('.glassesArea').css('transform','translate(-32px,-40px)');
	    } 
	    }) */
	
	    
	
	   /*  $(document).on('click', '#deleteIcon',function(){
	        $('#glassesText').hide();
	        $(this).hide();
	        $('#glasses').css('transform','translateX(0px)');
	        $('.glassesArea').css('transform','translate(0px)');
	    }) */
	    
		/* 체크인, 체크아웃 날짜를 오늘, 내일 날짜로 넣은 다음에 예약하기 페이지로 넘어가기 */
	    function moveReservation1() {
	    	
	    	var date = new Date();
	        var year = date.getFullYear();
	        var month = ("0" + (1 + date.getMonth())).slice(-2);
	        var day = ("0" + date.getDate()).slice(-2);

	        var checkin = year + "." + month + "." + day;
	        var checkout = year + "." + month + "." + (parseInt(day)+1);
	    	
	    	location.href = '../reserhotel/reservation1?checkin='+ checkin +'&checkout=' + checkout;
	    }
	    
	    $(function() {
	    	var user_id = '<%= id%>';
	    	console.log(user_id);
			if(user_id == "null") {
				return;
			} else{
				$.ajax({
					url : "../basic-myinfo", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						
						if(result.message == 'Success'){
							user_info = result.data;
							console.log(user_info);	
							
							$('#headerName').text(user_info.user_name);
							
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