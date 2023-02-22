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

.copy {
	float: left;
	margin: 10px;
}

tr{
	display: flex;

}

th {
	display: block;
	padding: 30px;
	text-align: left;
	color: #707070;
	font-family: NanumSquareRound;
}

td {
	display: block;
	padding: 10px;
	margin: 0px;
	text-align: left;
	color: #707070;
	font-family: NanumSquareRound;
}

.num{
	margin-top: 25px;
}

.num img{
	height: 28px;
	margin: 0px;
	height: 18px;
}

.num p{
	margin: auto 10px;
}

.num p img{
	margin-left: 10px;
}

.maintitle {
	font-size: 32px;
	font-weight: bold;
	margin-bottom: 20px;
	color: #434343;
	font-family: NanumSquareRound;
}

.incoupon {
	text-align: center;
	position: relative;
	list-style: none;
	width: 828px;
	height: 168px;
	background-color: white;
	border: 1px solid #B1B1B1;
	border-radius: 14px;
	margin: 22px auto;
	padding: 10px;
	box-shadow: 1px 1px 4px #B1B1B1;
}

.search p {
	font-size: 18px;
	color: #707070;
	font-family: NanumSquare_ac;
}

.h4p {
	font-size: 26px;
	color: #5E5E5E;
	margin: 20px;
}

#pointbox {
	text-align: center;
	font-size: 28px;
	color: #C3A58A;
}

.tab {
	list-style: none;
	position: relative;
	display: flex;
	width: 650px;
	height: 70px;
	border: 1px solid #707070;
	font-size: 22px;
	font-family: NanumSquare_ac;
}

.viewtable {
	border: 1px solid #D1D1D1;
}

.tcou{
	width: 496px;
	height: 42px;
	border: 1px solid #BFBFBF;
	border-radius: 6px;
	font-size: 18px;
	font-family: NanumSquare_ac;
}

.btcou{
	width: 158px;
	height: 45px;
	background-color: #4366A3;
	color: #FFFFFF;
	border: 1px solid #ACACAC;
	border-radius: 10px;
	font-size: 18px;
	font-weight: bold;
	box-shadow: 1px 1px 1px #ACACAC;
}
.couinfo{
	margin-top: 1rem;
}
.couinfo h4{
	font-size: 26px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.tcoupon{
	margin-top: 25px;
}

.tcoupon th, .tcoupon td{
	border-bottom: 1px solid #707070;
}

.tcoupon tr:first-child{
	border-top: 1px solid #707070;
}

.coupth{
	line-height: 85px;
	width: 162px;
	text-align: center;
	background-color: #F8F8F8;
	color: #242424;
	font-family: NanumSquare_ac;
	font-size: 24px;
	font-weight: bold;
}

.exp{
	width: 450px;
	font-size: 18px;
	font-family:  NanumSquare_ac;
	color: #242424;
	padding: 34px;
	overflow: hidden;
	word-break: break-all;
}

.exp p{
	font-weight: bold;
	line-height: 28px;
}

.tper{
	font-weight: bold;
	line-height: 112px;
	width: 150px;
	padding: 0px;
	font-size: 28px;
	font-family:  NanumSquare_ac;
	color: #242424;
	text-align: right;
}


.tabnav{
	margin-top: 30px;
	display: flex;
	width: 896px;
}

#use{
	font-size: 14px;
}

.is_percent{
	margin-left: 4px;
}
 .pageNum.active{
	color: #070707;
	font-weight: 600;
	font-size: 18px;
}
	
.pageNum {
	margin: 4px;
	padding: 0px 6px 2px 6px;
	cursor: pointer;
	background: white;
	color: #A2A2A2;
	font-size: 18px;
}
.tperText{
	padding-right: 14px;
}

.no {
	width: 850px;
	height: 500px;
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}

.no h2 {
	margin-top: 30px;
	font-size: 32px;
	font-family: NanumSquare_ac;
	color: #BCBCBC;
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
				<!-- 페이지 제목 div -->
				<div class="tname">
					<div class="pagename">&nbsp;마이페이지</div>
				</div>
			</div>
			<div class='pageContent'>
			<aside>
			<!-- 마이페이지 사이드바 div -->
			<div class="navbar">
				<nav class="inmenu">
					<div class="navside" onclick="location.href='info'">
						<div class="navitem" id="myinfo">
							<span class="textmenu">내정보</span>
						</div>
					</div>
	
					<div class="navside" onclick="location.href='point'" style="background-color: #4366A3;">
						<div class="navitem" id="point">
							<span class="textmenu" style="color: #FFFFFF;">포인트·쿠폰 </span> <img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
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
			<!-- 페이지 내용 div -->
			<div class="maintext">
				<!-- 해당 페이지 제목 div -->
				<div class="maintitle">포인트·쿠폰</div>
				<div class="tabmenu">
				<!-- 포인트,쿠폰 탭메뉴 -->
					<div class="tabnav">
						<div class="point" onclick="location.href='point'" ><p>포인트</p></div>
						<div class="coupon" onclick="location.href='coupon'" style="border: 1px solid #707070; border-top: 3px solid #4366A3; color: #242424;"><p>쿠폰</p></div>
					</div>
				<!-- 탭 밑에 쿠폰 내용 보여주는 div -->
				<!-- <div class="tabcon2">
					<div class="coupon">
					쿠폰 번호 입력 박스 div
						<ul class="incoupon">
							<li style="font-size: 26px; color: #242424; margin: 20px auto;">쿠폰 입력</li>
							<li style="font-size: 18px; margin: 30px auto;">
							쿠폰 번호 입력 부분
							<div class="coup">
							<input type="text" placeholder=" 쿠폰번호를 입력하세요." class="tcou">
								<button type="button" class="btcou">쿠폰등록</button></div>
							</li>
						</ul>
					</div>			
				</div> -->
				
				<div class="couinfo">
					<h4>보유 쿠폰</h4>
					<!-- 보유 쿠폰 테이블 append부분-->
					<table class="tcoupon">
						<tbody>
						
						</tbody>
					</table>
				</div>
				<!-- 페이지 갯수(페이징) 부분 -->
				<div class="num" style="display: flex;">
					<div class='pagination' id='pagination' style='text-align: center;'></div>
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
	 		
	 		/* 쿠폰 데이터 보여주는 ajax */
			$(function() {
				if(user_id == "null") {
					alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
					location.href = '../loginpage/login';
				} else{
					$.ajax({
						url : "../coupons", // 컨트롤러 위치
						type : "GET",
						dataType : 'JSON',
						beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        },
						success : function(result){
							
							if(result.message == 'Success'){
								data = result.data;
								console.log(data);	
								
								couponHistory();
								page();
								
								//쿠폰 데이터가 없으면 nocoupon페이지로 넘어가기
								 if (data.length == 0) {
									$('.couinfo').append(
										"<div class='no'>"
											+"<img alt='메모아이콘' src='../images/icon/ticketIcon.png'>"
											+"<h2>보유하신 쿠폰이 없습니다</h2>"
										+"</div>"	
									)
									return false;
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
							alert("검색실패options");
							return false;
						}
					})
				}
			})
		</script>
			
		<script>
			/* 쿠폰 내역 append하는 함수 */
			function couponHistory(){
				for(var i=0; i < data.length; i++){
					$('.tcoupon').append(
						"<tr>"
							+"<td class='coupth'>" + (i+1) + "</td>"
							+"<td class='exp'>"
									+"<p>" + data[i].coupon_name + "</p>"
									+"<div id='use'>" + data[i].valid_date + "</div>"
							+"</td>"
							+"<td class='tper'><p class='tperText'>" + data[i].coupon_charge.toLocaleString('en') + "<span class='is_percent'>" + data[i].is_percent + "</span></p></td>"
						+"</tr>"
					)
				}
				
				/* is_percent class를 돌면서 그 text 값이 %인지 원인지 판단후 작성 */
				$('.is_percent').each(function(i){
					
					var ispercent = $(this).text();
					  
					if(ispercent == "false"){
						$(this).text('원');
						
					} else if (ispercent == "true"){
						
						$(this).text('%');
					}
				})
			}
		
		</script>
		<script>
		/* 페이징 함수 */
			function page() {	
				// ****더 중요한점 테이블 이름 적어줘야함!!
			    $('table.tcoupon').each(function () {
			        var pagesu = 5;  //페이지 번호 갯수
			        var currentPage = 0;
			        var numPerPage = 5;  //목록의 수
			        var $table = $(this);
			        var pagination = $("#pagination");
	
			        //length로 원래 리스트의 전체길이구함
			        var numRows = $table.find('tbody tr').length;
	
			        //Math.ceil를 이용하여 반올림
			        var numPages = Math.ceil(numRows / numPerPage);
	
			        //리스트가 없으면 종료
			        if (numPages == 0) return;
	
			        //pager라는 클래스의 div엘리먼트 작성
			        var $pager = $('<div class="pager"></div>');
			        var nowp = currentPage;
			        var endp = nowp + 5;
	
			        //페이지를 클릭하면 다시 셋팅
			        $table.bind('repaginate', function () {
	
			        //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
			            $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
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
			            
			            $('.noticeAnswer').css('display', 'none');
			        });
	
			        $pager.insertAfter($table).find('span.pageNum:first').next().next().addClass('active');
			        $pager.appendTo(pagination);
			        $table.trigger('repaginate');
	
			    });
			}
		</script>
</body>
</html>