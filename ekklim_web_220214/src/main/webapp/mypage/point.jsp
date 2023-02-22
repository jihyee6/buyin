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
.h4p {
	font-size: 26px;
	color: #5E5E5E;
	margin: 20px;
}

#pointbox {
	text-align: center;
	font-size: 28px;
	color: #4366A3;
} 


.td1 {
	padding: 30px;
	margin: 0px;
	width: 100px;
	font-size: 24px;
	font-weight: bold;	
	text-align: center;
	color: #707070;
	font-family: NanumSquareRound;
	line-height: 35px;
}

.td2, .td3 {
	padding: 10px;
	margin: 0px;
	text-align: left;
	color: #707070;
	font-family: NanumSquareRound;
}

.td2{
	width: 500px;
	margin-left: 10px;
	overflow: hidden;
	word-break: break-all;
}

.td3{
	width: 160px;
	text-align: right;
	font-weight: bold;
	margin-top: 22px;
	line-height: 35px;
}

.viewtable{
	border-collapse: collapse;
	margin-left: 15px;
	border-top: 1px solid #707070;
	border-bottom: 1px solid #707070;
	line-height: 25px;
}

.viewtable tr{
	display: flex;
	border-bottom: 1px solid #D1D1D1;
}


.tabnav, .pointView{
	margin-top: 30px;
	display: flex;
	width: 896px;
}
.pointView{
	width: 680px;
	border: 2px solid #A8A8A8;
	border-radius: 14px;
	margin-left: 14%;
}

.pointView div{
	width: 340px;
	height: 110px;
	font-size: 18px;
	font-family: NanumSquare_ac;
	color: #707070;
	font-weight: bold;
	text-align: center;
}
.pointView div p{
	line-height: 54px;
}

.plusPoint{
	border-right: 2px solid #A8A8A8;
}
/* .pageNum.active{
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
} */

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
			<aside>
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
			

			<div class="maintext">
				<div class="maintitle">포인트·쿠폰</div>
				
				<div class="tabmenu">
				<!-- 포인트/쿠폰 탭 div -->
					<div class="tabnav">
						<div class="point" onclick="location.href='point'"  style="border: 1px solid #707070; border-top: 3px solid #4366A3; color: #242424; " ><p>포인트</p></div>
						<div class="coupon" onclick="location.href='coupon'"><p>쿠폰</p></div>
					</div>

					<div class="tabcon">
					<!-- 포인트 정보 부분 -->
						<div class="pointView">
							<!-- 사용가능 포인트 data div -->
							<div class="plusPoint">
							<p>사용가능한 포인트</p>
								<div id="pointbox">
									<span id="userPoint"></span>P
								</div>
							</div>
							<!-- 소멸예정 포인트 div -->
							<div class="minusPoint">
							<p>30일이내 소멸예정 포인트</p>
								<div id="pointbox">
									<span id='willDestory'></span>P
								</div>
							</div>
							</div>		
						<!-- 포인트 내역 div -->
						<div class="content2">
							<div class="h4p">
								<h4>포인트 내역</h4>
							</div>
							<!-- 포인트 내역 테이블 -->
							<table class="viewtable">
								<tbody>
								
								</tbody>
							</table>
							</div>
							<!-- <div class="num" style="display: flex;">
								<div class='pagination' id='pagination' style='text-align: center;'></div>
							</div>  -->
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
						/* 회원 포인트 내역 보여주는 ajax */
						$.ajax({
							url : "../points", // 컨트롤러 위치
							type : "GET",
							dataType : 'JSON',
							beforeSend: function (xhr) {
					            xhr.setRequestHeader("user", user_id);
					        },
							success : function(result){
								
								if(result.message == 'Success'){
									data = result.data;
									console.log(data);	
									
									pointHistory();
									//page();
									
									$('#userPoint').text(data.current_point.toLocaleString('en'));
									$('#willDestory').text(data.will_destroy.toLocaleString('en'));
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
		/* 포인트 내역 보여주는 함수 */
		function pointHistory(){
			for(var i=0; i < data.point_usages.length; i++){
				$('.viewtable').append(
					"<tr>"
						+"<td class='td1'>" + data.point_usages[i].is_usage + "</td>"
						+"<td class='td2'>" + data.point_usages[i].point_date + "<br><h3>" + data.point_usages[i].usage_name + "</h3> <span class='useLodge'>사용이용숙소: " + data.point_usages[i].usage_contents + "</span></td>"
						+"<td style='font-size: 24px;' class='td3'><span class='mark'></span>" + data.point_usages[i].point_value.toLocaleString('en') +"P </td>"
					+"</tr>"	
						
				);
			}
			/* td1의 text 값이 true/false일때 text 변화 */
			$('.td1').each(function(i){
				
				var td1 = $(this).text();
				
				if(td1 == "false"){
					$(this).text('적립');
				    $(this).css("background-color", "#E7EDF1");
				    $(this).css("color", "#477696");
				    $(this).next().next().css("color", "#477696");
				    $(this).next().next().children().text("+");
				    
				} else if (td1 == "true"){
					$(this).text('사용');
					 $(this).css("background-color", "#FFE1E1");
					 $(this).css("color", "#FF5F5F");
					 $(this).next().next().css("color", "#FF5F5F");
					 $(this).next().next().children().text("-");
				}
				
			})
			
			$('.useLodge').each(function(i){
							
				var useLodge = $(this).text();
				/* useLodge값이 사용이용숙소: 이고 숙소이름이 안나오면 숨김 */
				if(useLodge == "사용이용숙소: "){
					$(this).css("display","none");
				} 
				
			})
		}
		
		
		/* function page() {	
			// ****더 중요한점 테이블 이름 적어줘야함!!
		    $('table.viewtable').each(function () {
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
		            
		        });

		        $pager.insertAfter($table).find('span.pageNum:first').next().next().addClass('active');
		        $pager.appendTo(pagination);
		        $table.trigger('repaginate');

		    });
		} */
	</script>
	
</body>
</html>