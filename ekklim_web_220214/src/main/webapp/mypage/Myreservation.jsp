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

.tabmenu {
	max-width: 886px;
	margin: 0 auto;
	position: relative;
}

.date input{
	width: 858px;
	height: 38px;
	margin-top: 10px;
	background-color: #F3F3F3;
	border-radius: 5px;
	border: none;
}

.tabnav{
	margin-top: 30px;
	display: flex;
}

 .article2 img{
	width: 230px;
	height: 180px;
	border-radius: 6px;
}
.article2{
	border: 1px solid #242424;
	border-radius: 10px;
	width: 830px;
	padding: 15px;
	margin: 7px auto;
}
.article2 h4{
	font-size: 17px;
	color: #242424;
	font-family: NanumSquare_ac;
	margin: 0px;
}
.htitle h3{
	font-size: 24px;
	color: #242424;
	font-family: NanumSquare_ac;
	margin: 0px;
	padding-bottom: 6px;
}
/*///////////////////////////////// width조정 */
.htitle{
    width: 75%;
    /* float: left; */
    margin-left: 0px;
}

.htitle p{
	font-size: 15px;
	color: #242424;
	font-family: malgun;
	padding: 2px;
}
.resprice{
	text-align: left;
	color: #242424;
	width: 30%;
	float: left;
	margin-top: 50px;
}
.resprice p{
	font-size: 14px;
}

.resprice span{
	font-size: 24px;
	color: #242424;
	font-weight: bold;
}

.reservationTexts > .bt> button{
    display: block;
    width: 114px;
    height: 32px;
    color: #242424;
    font-size: 14px;
	border-radius: 6px;
	font-family: NanumSquare_ac;
    margin: 10px;
    background-color: #FFFFFF;
}

.reinfo{
	color: #E31616;
	font-size: 18px;
	font-family : NanumSquare_ac;
	font-weight: bold;
	float: right;
}

.reservationTable{
    display: grid;
    grid-template-columns: 30% 70%;
}

.bt{
    width: 130px;
    /* float: right; */
}

.reserArticle{
	margin: 24px auto;
}

.reserDate{
	font-size: 18px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.bt  button.reservationButton{
	border: 1px solid #4366A3; 
	color: #4366A3;
}

.bt button:first-child:hover{
	background-color: #707070;
	color: white;
}
.bt button:last-child:hover{
	background-color: #4366A3;
	color: white;
}
.noData{
	width: 850px;
	height: 500px;
	display: table-cell;
	text-align: center;
	vertical-align: middle;
}
</style>

</head>
<body>
<%String reservation_id = request.getParameter("reservation_id"); %>

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
						<div class="navside" onclick="location.href='recentSearch'" >
							<div class="navitem" id="recent">
								<span class="textmenu" >최근 검색 숙소</span>  
							</div>
						</div>
						<div class="navside" onclick="location.href='wish'">
							<div class="navitem" id="wish">
								<span class="textmenu" >위시리스트</span> 
							</div>
						</div>
						
						<div class="navside" onclick="location.href='Myreservation'"  style="background-color: #4366A3;">
							<div class="navitem" id="reservation">
								<span class="textmenu" style="color: #FFFFFF;">예약·취소내역</span> <img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
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
				<div class="maintitle">예약내역</div>
				<div class="tabmenu">
				<!-- 예약,취소내역 탭메뉴 -->
					<div class="tabnav">				
						<div class="reservationlist" onclick="location.href='Myreservation'" style="border: 1px solid #707070; border-top: 3px solid #4366A3; color: #242424;"><p>예약내역</p></div>
						<div class="canclelist" onclick="location.href='cancel'" ><p>취소내역</p></div>
					</div>
						<!-- 날짜 검색 부분 -->
						<!-- <div class="date"><input type="date"></div> -->
						<!-- 얘약내역 아티클 -->
					<!-- 		<div class="reserArticle">
								<h4 class="reserDate">예약날짜 : 2022.01.01(토)<span class="reinfo">입실전</span></h4>				
							    <div class="article2">
								        <div class="reservationTable">
								        <img alt="숙소사진" src="../images/reservationimg/hotel.png" style="float: left;">
								            <div class="reservationTexts" style="width: 93%;">
								                <div class="htitle">
								                    <h3>이끌림 비즈니스호텔 신안점</h3>
								                    <p>스탠다드 더블</p>
								                    <p>2022.01.01(토) - 2022.01.02(일)</p>
								                </div>
								                <div class="resprice">
								                    <p>예약금액 <br><span>45,000원</span></p>							
								                </div>
								                <div class="reinfo">입실 전</div>
								                얘약취소, 상세보기 버튼
								                <div class="bt">
								                    <button type="button" onclick="location.href='resview'" style="border: 1px solid #707070;">취소요청</button>
								                    <button type="button" class="reservationButton" onclick="location.href='resview'" style="border: 1px solid #4366A3;">상세보기</button>
								                </div>
								
								            </div>
								        </div>
								</div>
						</div> -->
											
					</div>
				</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>
		<script>
		var user_id = '<%=id%>';
		
		$(function() {
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../loginpage/login';
			} else{
				/* 예약내역 보여주는 ajax */
				$.ajax({
					url : "../v2/reservations", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						
						if(result.message == 'Success'){
							data = result.data;
							console.log(data);
							if(data.length == 0) {
								//검색결과가 없을때
								$('.tabmenu').append(
									"<div class='noData'>"
										+"<img src='../images/icon/calandarIcon.png'>"
										+"<p class='noDataMessage'>선택하신 날짜의 예약내역이 없습니다.</p>"
									+"</div>"
								);
							} else{
								reservationList();
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
			}
		})
	</script>
	<script>
		/* 예약내역 append 함수 */
		function reservationList(){
			for(var i = 0; i < data.length ; i++){
				$('.tabmenu').append(
					"<div class='reserArticle' id='" + data[i].reservation_id + "'>"
						+"<h4 class='reserDate'>예약날짜 : " + data[i].reservation_date.split(" ")[0] + "<span class='reinfo'>" + data[i].state + "</span></h4>"				
					        +"<div class='article2'>"
						        +"<div class='reservationTable'>"
						        +"<img alt='숙소사진' src='" + data[i].lodgement_img_url + "' style='float: left;'>"
						            +"<div class='reservationTexts' style='width: 93%; display: grid; grid-template-columns: 70% 30%;'>"
						                +"<div class='htitle'>"
						                    +"<h3>" + data[i].lodgement_name + "</h3>"
						                    +"<p style='font-size: 18px;'>" + data[i].room_name + "</p>"
						                    +"<div style='padding-top: 30px;'>"
							                    +"<p>체크인  " + data[i].check_in.split(" ")[0] + "</p>"
							                    +"<p>체크아웃  " + data[i].check_out.split(" ")[0] + "</p>"
						                    +"</div>"
						                +"</div>"
						                /* +"<div class='resprice'>"
						                    +"<p>예약금액 <br><span>" + data[i].charge.toLocaleString('en') + "원</span></p>"							
						                +"</div>" */					               
						                +"<div class='bt'>"
						                    +"<button type='button' class='cancelRequest' id='" + data[i].reservation_id + "' style='border: 1px solid #707070;'>취소요청</button>"
						                    +"<button type='button' class='reservationButton' id='" + data[i].reservation_id + "' style='border: 1px solid #4366A3;'>상세보기</button>"
						                +"</div>"					
						            +"</div>"
						        +"</div>"
							+"</div>"
						+"</div>"		
					)
				}
			}
			
		/* function formatDate(date){
			var d = new Date(date),
			
			month = '' + (d.getMonth() + 1),
			day = '' + d.getDate(),
			year = d.getFullYear();
			
			if (month.length < 2) month = '0' + month;
			if(day.length < 2) day = '0' + day;
			
			return [year, month, day].join('.');
		} */
		
		
		/* 상세보기 버튼 눌렀을때 */
		$(document).on('click','.reservationButton',function(){
			var reservation_id = $(this).attr('id');
			
			location.href = 'resview?reservation=' + reservation_id; 
		})
		
		/* 취소요청 버튼 눌렀을때 */
		$(document).on('click','.cancelRequest',function(){
			var reservation_id = $(this).attr('id');
			
			location.href = 'recan?reservation=' + reservation_id;
		})
	</script>
</body>
</html>