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

.tabnav{
	margin-top: 30px;
	display: flex;
	width: 896px;
}

.tabcon{
	width: 100%;
	margin-top: 30px;
}

/* .giftCardArea img{
	width: 100%;
	height: 1110px;
	position: relative;
}

.giftCardArea button{
	width: 680px;
	height: 96px;
	font-size: 28px;
	border-radius: 12px;
	border: 1px solid #EC6D6D;
	box-shadow: 1px 1px 2px slategrey;
	position: absolute;
	left: 12%;
	bottom: 8%;
	cursor: pointer;
	background-color: #D66D75;
	color: #FFFFFF;
	font-family: welcome;
	
} */

 .tab>.selectmenu {
    margin-bottom: 4px;
}
  .tabnav > div.tablinks.active{
 	 border: 1px solid #707070; 
  	border-top: 3px solid #4366A3;
      color: #242424; 
  }
 .tabcontent{
    display: none;
}


.selectmenu span{
	font-size: 18px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	cursor: pointer;
	margin: auto 15px;
}

.tab hr{
	margin: 12px auto;
	border: 1px solid rgb(138,138,138,0.5);
}

.giftCollection, .giftCollection2{
	margin-top: 22px;
	display: flex;
	flex-wrap: wrap;
}

.togiftBox, .fromgiftBox{
	display: grid;
	grid-template-columns: 40% 60%;
	width: 400px;
	/* float: left; */
	margin: 14px 14px 28px;
	font-family: NotoSans;
}

.giftImg{
	width: 100%;
	height: 128px;
	background-color: #F6F6F6;
	position: relative;
	border-radius: 8px;
}

.giftImg img{
	width: 126px;
	height: 79px;
	position: absolute;
	left: 10%;
	top: 20%;
	border-radius: 8px;
}

.toGift{
	font-size: 14px;
	color: #242424;
}

.togiftBox h5, .fromgiftBox h5{
	font-size: 18px;
}
.money{
	font-size: 16px;
	font-weight: bold;
	color: #4366A3;
}

.moneyPeriod{
	font-size: 16px;
	color: #A4A4A4;
}
.moneyGift{
	padding-top: 38px;
}
.giftCount{
	font-family: NanumSquare_ac;
	font-size: 16px;
	color: #434343;
	font-weight: bold;
}

.giftCount span{
	color: #FF6600;
}

.useState{
	font-size: 12px;
	font-weight: bold;
	color: #3399FF;
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
	<%@include file="../header.jsp"%>
	
	<div class="page">

		<div class="content">
			<div class="title">
				<div class="tname">
					<div class="pagename">&nbsp;마이페이지</div>
					
				</div>
			</div>
			<div class='pageContent'>
			<!-- 마이페이지 사이드바 메뉴 -->
			<aside>
			<div class="navbar">
				<nav class="inmenu">
					<div class="navside" onclick="location.href='info'">
						<div class="navitem" id="myinfo">
							<span class="textmenu">내정보</span>
						</div>
					</div>

					<div class="navside" onclick="location.href='point'">
						<div class="navitem" id="point">
							<span class="textmenu" >포인트·쿠폰 </span>
						</div>
					</div>
					<div class="navside" onclick="location.href='gift'"  style="background-color: #4366A3;">
						<div class="navitem" id="gift">
							<span class="textmenu" style="color: #FFFFFF;">선물함</span> <img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
						</div>
					</div>
					<div class="navside" onclick="location.href='shoppingBasket'">
						<div class="navitem" id="shoppingBasket">
							<span class="textmenu">장바구니</span>
						</div>
					</div>
					<div class="navside" onclick="location.href='recentSearch'">
						<div class="navitem" id="recent">
							<span class="textmenu" >최근 검색 숙소</span> 
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
				<!-- 메인 타이틀 부분 -->
				<div class="maintitle">선물함</div>
				<div class="tabmenu">
					<!-- 선물하기, 선물함 탭 부분 -->
					<div class="tabnav">
						<div class="tablinks" onclick="openMenu(event,'giftSent')" id="defaultOpen"><p>보낸선물</p></div>
						<div class="tablinks" onclick="openMenu(event,'giftReceive')"><p>받은선물</p></div>
					</div>
					
					<div class="tabcon">
							<!-- 보낸선물 탭 -->
							<div id="giftSent" class="tabcontent">
							  	<p class="giftCount">보낸선물 <span id='gift_sends_Count'>0</span>개</p>
							  	<div class="giftCollection">
							  	<!-- 기프트카드 종류 -->
								<!-- <div class="giftBox"  onclick="location.href='togiftDetail'">
								  		<div class="giftImg">
								  			기프트카드 이미지
								  			<img src="../images/giftcards/giftcard3.png">
								  		</div>
								  		<div class="giftPeriod">
								  			<p class="toGift">TO.<span>000</span>님</p>
								  			<h5>[기프트카드] 50,000원권</h5>
								  			<div class="moneyGift">
								  				<p class="money">50,000원</p>
								  				<p class="moneyPeriod">유효기간: 2022년 12월 31일</p>
								  			</div>
								  		</div>
								  	</div>
							  	</div> -->
							 </div>
							 <!-- 기프트카드 페이징 div -->
							 <div class="paging">
								 <div class="pagination inner" id='pagination' style='text-align: center;'>
								 </div>
							 </div>
						</div>
							
							<!-- 받은선물 탭 -->
							<div id="giftReceive" class="tabcontent">
							  <p class="giftCount">받은선물 <span id='gift_receives_Count'>0</span>개</p>
							  	<div class="giftCollection2">
							  	
							  	<!-- 받은 기프트카드 종류 -->
								<!--<div class="giftBox" onclick="location.href='fromgiftDetail'">
								  		<div class="giftImg">
								  			<img src="../images/giftcards/giftcard3.png">
								  		</div>
								  		<div class="giftPeriod">
								  			<p class="toGift">FROM.<span>000</span>님</p>
								  			<h5>[기프트카드] 50,000원권</h5>
								  			<div class="moneyGift" style="padding-top: 28px;">
								  				사용여부
								  				<p class="useState">사용전</p>
								  				<p class="money">50,000원</p>
								  				<p class="moneyPeriod">유효기간: 2022년 12월 31일</p>
								  			</div>
								  		</div>
								  	</div>
							  	</div> -->
				  	  	  	 </div>
				  	  	  	 <!-- 받은 선물 페이징 부분 -->
				  	  	  	 <div class="paging">
								 <div class="pagination inner" id='pagination2' style='text-align: center;'>
								 </div>
							 </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		<%@include file="../footer.jsp"%>
	</div>
</body>

<script>
	/* 보낸선물 갯수 작성 */
	function giftsendsCount(){
		$('#gift_sends_Count').text(data.gift_sends.length);
	}
	/* 받은선물 갯수 작성 */
	function giftReceiveCount(){
		$('#gift_receives_Count').text(data.gift_receives.length);
	}

</script>


<script>
		/* 받은 선물, 보낸선물 탭부분  탭 부분 클릭시 변화*/
	    function openMenu(evt, giftgo) {
			  var i, tabcontent, tablinks;
			  tabcontent = document.getElementsByClassName("tabcontent");
			  for (i = 0; i < tabcontent.length; i++) {
			    tabcontent[i].style.display = "none"; 
			  }
			  tablinks = document.getElementsByClassName("tablinks");
			  for (i = 0; i < tablinks.length; i++) {
			    tablinks[i].className = tablinks[i].className.replace(" active", "");
			  }
			  document.getElementById(giftgo).style.display = "block";
			  evt.currentTarget.className += " active";
		}
		    document.getElementById("defaultOpen").click(); //페이지 열리면 id가 defalutOpen인 div를 클릭

</script>
					
	<script>
 		var rooms = '<%=rooms%>';
 		var type = <%=type%>;
 		var checkin = '<%=checkin%>';
 		var checkout = '<%=checkout%>';
 		var user_id = '<%=id%>';
 		
 		/* 선물함 보여주는 ajax */
		$(function() {
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../loginpage/login';
			} else{
			
				$.ajax({
					url : "../gifts", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						 
						
						if(result.message == 'Success'){
							data = result.data;
							console.log(data);	
							//받은 선물함이 비어있을때
							if(data.gift_receives.length == 0){
								$('.giftCollection2').append(
									"<div style='text-align: center; margin-top: 40px;'>"
										+ "<p style='font-size: 20px; font-family: NanumSquare_ac; color: #474747;'>받은 선물이 없습니다.</p>"
									+ "</div>"
								)
							} 
							//보낸선물함이 비어있을때
							if(data.gift_sends.length == 0){
								$('.giftCollection').append(
									"<div style='text-align: center; margin-top: 40px;'>"
										+ "<p style='font-size: 20px; font-family: NanumSquare_ac; color: #474747;'>보낸 선물이 없습니다.</p>"
									+ "</div>"		
								)
							} 	
							gifts();
							giftSends();
							giftsendsCount();
							giftReceiveCount();
							
							page();
							page2();
							
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
						alert("검색실패options");
						return false;
					}
				})
			}
		})
	</script>		
			
	<script>
	/* 보낸 선물 목록 append 함수 */
	function gifts(){
		for(var i=0; i < data.gift_sends.length; i++){
			$('.giftCollection').append(
				 	"<div class='togiftBox' id = '" + data.gift_sends[i].gift_id + "' type = '" + data.gift_sends[i].gift_type + "'>"
			  		+"<div class='giftImg'>"
			  		+"	<img id='gift_img_url" +i+ "' src=" +data.gift_sends[i].gift_img_url + ">"
			  		+"</div>"
			  		+"<div class='giftPeriod'>"
			  			+"<p class='toGift'>To.<span id='gift_receiver" +i+ "'>" + data.gift_sends[i].gift_receiver + "</span>님</p>"
			  			+"<h5 id='gift_name" +i+ "'>" + data.gift_sends[i].gift_name + "</h5>"
			  			+"<div class='moneyGift' style='padding-top: 28px;'>"
			  				+"<p class='useState' id='gift_state" +i+ "'>" + data.gift_sends[i].gift_state + "</p>"
			  				+"<p class='money' id='gift_price" +i+ "'>" + data.gift_sends[i].gift_price.toLocaleString('en') + "원</p>"
			  				+"<p class='moneyPeriod' id='gift_valid_date" +i+ "'>유효기간: " + data.gift_sends[i].gift_valid_date +"</p>"
			  			+"</div>"
			  		+"</div>"
			  	+"</div>"
			)
		}
		/* data의 useState class 텍스트 값에 따라 text 색깔 변경 */
		$('.useState').each(function(i){
			var useState = $(this).text();
			
			if(useState == "사용전"){
			    $(this).css("color", "#3399FF");
			    
			} else if (useState == "사용 완료"){
				
				 $(this).css("color", "#FF0404");
			}
		})
		
	}
	/* 받은 선물 목록 append 함수 */
	function giftSends(){
		for(var i=0; i < data.gift_receives.length; i++){
			$('.giftCollection2').append(
			 	"<div class='fromgiftBox' id = '" + data.gift_receives[i].gift_id + "' type = '" + data.gift_receives[i].gift_type + "'>"
			  		+"<div class='giftImg'>"
			  		+"	<img id='gift_img_url" +i+ "'src=" +data.gift_receives[i].gift_img_url + ">"
			  		+"</div>"
			  		+"<div class='giftPeriod'>"
			  			+"<p class='toGift'>FROM.<span id='gift_sender" +i+ "'>" + data.gift_receives[i].gift_sender + "</span>님</p>"
			  			+"<h5 id='gift_name" +i+ "'>" + data.gift_receives[i].gift_name + "</h5>"
			  			+"<div class='moneyGift' style='padding-top: 28px;'>"
			  				+"<p class='useState' id='gift_state" +i+ "'>" + data.gift_receives[i].gift_state + "</p>"
			  				+"<p class='money' id='gift_price" +i+ "'>" + data.gift_receives[i].gift_price.toLocaleString('en') + "원</p>"
			  				+"<p class='moneyPeriod' id='gift_valid_date" +i+ "'>유효기간: " + data.gift_receives[i].gift_valid_date +"</p>"
			  			+"</div>"
			  		+"</div>"
			  	+"</div>"
					
			)
		}
		/* useState text 값에 따라 text 색깔 변경 */
		$('.useState').each(function(i){
			var useState = $(this).text();
			
			if(useState == "사용전"){
			    $(this).css("color", "#3399FF");
			    
			} else if (useState == "사용 완료"){
				
				 $(this).css("color", "#FF0404");
			}
		})	
	}
	</script>
	
	<script>
	// 보낸선물 상세보기 버튼을 누르면 해당 보낸선물 상세보기 페이지로 이동
	$(document).on('click', '.togiftBox', function() {
		// 클릭한 giftBox의 id,type을 가져오는거
		var gift_id = $(this).attr('id');
		var type = $(this).attr('type');
		
		location.href = 'togiftDetail?gift_id=' + gift_id + '&type=' + type;
	})
	
	/* 받은선물 상세보기 버튼을 누르면 해당 받은선물 상세보기 페이지로 이동 */
	$(document).on('click', '.fromgiftBox', function() {
		// 클릭한 giftBox의 id, type을 가져오는거
		var gift_id = $(this).attr('id');
		var type = $(this).attr('type');
		
		location.href = 'fromgiftDetail?gift_id=' + gift_id + '&type=' + type;
	})
	</script>
	<script>
	/* 보낸선물 상세보기 페이징 */
	function page() {	
	// ****더 중요한점 테이블 이름 적어줘야함!!
    $('.giftCollection').each(function () {
        var pagesu = 10;  //페이지 번호 갯수
        var currentPage = 0;
        var numPerPage = 6;  //목록의 수
        var $table = $(this);
        var pagination = $("#pagination");

        //length로 원래 리스트의 전체길이구함
        var numRows = $table.find('.togiftBox').length;

        //Math.ceil를 이용하여 반올림
        var numPages = Math.ceil(numRows / numPerPage);

        //리스트가 없으면 종료
        if (numPages == 0) return;

        //pager라는 클래스의 div엘리먼트 작성
        var $pager = $('<div class="pager"></div>');
        var nowp = currentPage;
        var endp = nowp + 10;

        //페이지를 클릭하면 다시 셋팅
        $table.bind('repaginate', function () {

        //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
            $table.find('.togiftBox').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
            $("#pagination").html("");
            if (numPages > 1) {     // 한페이지 이상이면
                if (currentPage < 5 && numPages - currentPage >= 5) {   // 현재 5p 이하이면
                    nowp = 0;     // 1부터 
                    endp = pagesu;    // 10까지
                } else {
                    nowp = currentPage - 5;  // 6넘어가면 2부터 찍고
                    endp = nowp + pagesu;   // 10까지
                    pi = 1;
                }
                if (numPages < endp) {   // 10페이지가 안되면
                    endp = numPages;   // 마지막페이지를 갯수 만큼
                    nowp = numPages - pagesu;  // 시작페이지를   갯수 -10
                }
                if (nowp < 1) {     // 시작이 음수 or 0 이면
                    nowp = 0;     // 1페이지부터 시작
                }
            } else {       // 한페이지 이하이면
                nowp = 0;      // 한번만 페이징 생성
                endp = numPages;
            }
            // [처음]
            $('<span class="pageNum first">《</span>').bind('click', { newPage: page }, function (event) {
                currentPage = 0;
                $table.trigger('repaginate');
                $($(".pageNum")[2]).addClass('active').siblings().removeClass('active');
            }).appendTo(pagination).addClass('clickable');
            // [이전]
            $('<span class="pageNum back"><img src="../images/arr4.png"></span>').bind('click', { newPage: page }, function (event) {
                if (currentPage == 0) return;
                currentPage = currentPage - 1;
                $table.trigger('repaginate');
                $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
            }).appendTo(pagination).addClass('clickable');
            // [1,2,3,4,5,6,7,8]
            for (var page = nowp; page < endp; page++) {
                $('<span class="pageNum"></span>').text((page + 1)).bind('click', { newPage: page }, function (event) {
                	// 여기가 data인데 우리는 항상 data로 data를 정의하기에 그냥 갖다 쓰면 됨!
                    currentPage = event.data['newPage'];
                    $table.trigger('repaginate');
                    $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
                }).appendTo(pagination).addClass('clickable');
            }

            // [다음]
            $('<span class="pageNum next"><img src="../images/arr3.png"></span>').bind('click', { newPage: page }, function (event) {
                if (currentPage == numPages - 1) return;
                currentPage = currentPage + 1;
                $table.trigger('repaginate');
                $($(".pageNum")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
            }).appendTo(pagination).addClass('clickable');

            // [끝]
            $('<span class="pageNum last">》</span>').bind('click', { newPage: page }, function (event) {
                currentPage = numPages - 1;
                $table.trigger('repaginate');
                $($(".pageNum")[endp - nowp + 1]).addClass('active').siblings().removeClass('active');
            }).appendTo(pagination).addClass('clickable');

            $($(".pageNum")[2]).addClass('active');
            
        });

        $pager.insertAfter($table).find('span.pageNum:first').next().next().addClass('active');
        $pager.appendTo(pagination);
        $table.trigger('repaginate');
    });
}
	/* 받은선물 상세보기 페이징 */
	function page2() {	
	// ****더 중요한점 테이블 이름 적어줘야함!!
    $('.giftCollection2').each(function () {
        var pagesu = 10;  //페이지 번호 갯수
        var currentPage = 0;
        var numPerPage = 6;  //목록의 수
        var $table = $(this);
        var pagination = $("#pagination2");

        //length로 원래 리스트의 전체길이구함
        var numRows = $table.find('.fromgiftBox').length;

        //Math.ceil를 이용하여 반올림
        var numPages = Math.ceil(numRows / numPerPage);

        //리스트가 없으면 종료
        if (numPages == 0) return;

        //pager라는 클래스의 div엘리먼트 작성
        var $pager = $('<div class="pager"></div>');
        var nowp = currentPage;
        var endp = nowp + 10;

        //페이지를 클릭하면 다시 셋팅
        $table.bind('repaginate', function () {

        //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
            $table.find('.fromgiftBox').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
            $("#pagination2").html("");
            if (numPages > 1) {     // 한페이지 이상이면
                if (currentPage < 5 && numPages - currentPage >= 5) {   // 현재 5p 이하이면
                    nowp = 0;     // 1부터 
                    endp = pagesu;    // 10까지
                } else {
                    nowp = currentPage - 5;  // 6넘어가면 2부터 찍고
                    endp = nowp + pagesu;   // 10까지
                    pi = 1;
                }
                if (numPages < endp) {   // 10페이지가 안되면
                    endp = numPages;   // 마지막페이지를 갯수 만큼
                    nowp = numPages - pagesu;  // 시작페이지를   갯수 -10
                }
                if (nowp < 1) {     // 시작이 음수 or 0 이면
                    nowp = 0;     // 1페이지부터 시작
                }
            } else {       // 한페이지 이하이면
                nowp = 0;      // 한번만 페이징 생성
                endp = numPages;
            }
            // [처음]
            $('<span class="pageNum2 first">《</span>').bind('click', { newPage: page }, function (event) {
                currentPage = 0;
                $table.trigger('repaginate');
                $($(".pageNum2")[2]).addClass('active').siblings().removeClass('active');
            }).appendTo(pagination).addClass('clickable');
            // [이전]
            $('<span class="pageNum2 back"><img src="../images/arr4.png"></span>').bind('click', { newPage: page }, function (event) {
                if (currentPage == 0) return;
                currentPage = currentPage - 1;
                $table.trigger('repaginate');
                $($(".pageNum2")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
            }).appendTo(pagination).addClass('clickable');
            // [1,2,3,4,5,6,7,8]
            for (var page = nowp; page < endp; page++) {
                $('<span class="pageNum2"></span>').text((page + 1)).bind('click', { newPage: page }, function (event) {
                	// 여기가 data인데 우리는 항상 data로 data를 정의하기에 그냥 갖다 쓰면 됨!
                    currentPage = event.data['newPage'];
                    $table.trigger('repaginate');
                    $($(".pageNum2")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
                }).appendTo(pagination).addClass('clickable');
            }

            // [다음]
            $('<span class="pageNum2 next"><img src="../images/arr3.png"></span>').bind('click', { newPage: page }, function (event) {
                if (currentPage == numPages - 1) return;
                currentPage = currentPage + 1;
                $table.trigger('repaginate');
                $($(".pageNum2")[(currentPage - nowp) + 2]).addClass('active').siblings().removeClass('active');
            }).appendTo(pagination).addClass('clickable');

            // [끝]
            $('<span class="pageNum2 last">》</span>').bind('click', { newPage: page }, function (event) {
                currentPage = numPages - 1;
                $table.trigger('repaginate');
                $($(".pageNum2")[endp - nowp + 1]).addClass('active').siblings().removeClass('active');
            }).appendTo(pagination).addClass('clickable');

            $($(".pageNum2")[2]).addClass('active');
            
        });

        $pager.insertAfter($table).find('span.pageNum2:first').next().next().addClass('active');
        $pager.appendTo(pagination);
        $table.trigger('repaginate');
    });
}
</script>
</html>