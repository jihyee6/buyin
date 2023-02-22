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
.tabnav{
	margin-top: 30px;
	display: flex;
}

.article2{
	border: 1px solid #242424;
	border-radius: 10px;
	width: 830px;
	margin: 7px auto;
	padding: 12px;
}
.article2 h4{
    margin: 0px;
	font-size: 17px;
	color: #242424;
	font-family: NanumSquare_ac;
}
.htitle h3{
	font-size: 24px;
	color: #242424;
	font-family: NanumSquare_ac;
	margin: 0px;
	padding-bottom: 4px;
}

.htitle{
	margin: 0px;
	width: 100%;
}

.htitle p{
	font-size: 15px;
	color: #242424;
	font-family: malgun;
}
.resprice{
	color: #242424;
	text-align: left;
	float: left;
	margin-top: 50px;
}
.resprice p{
	font-size: 14px;
	margin: 0px;
}

.resprice span{
	font-size: 24px;
	color: #242424;
	font-weight: bold;
}
.bt{
	float: right;
}
.resprice > .bt> button{
	width: 120px;
    height: 37px;
    color: #242424;
    font-size: 15px;
	border-radius: 6px;
	font-family: NanumSquare_ac;
	border: 1px solid rgb(159,159,159,0.7);
	background: #FFFFFF;
}

.reinfo{
	color: #FF0000;
	font-size: 18px;
	font-family : NanumSquare_ac;
	margin: 0px;
	font-weight: bold;
}

.article2 img{
	width: 240px;
	height: 178px;	
	border-radius: 8px;

}
.reservationTable{
    display: grid;
    grid-template-columns: 30% 70%;
    margin: 8px auto;
}
.reservationText{
    width: 94%;
}
.reserArticle{
	margin: 24px auto;
}

.reserDate{
	font-size: 18px;
	color: #242424;
	font-family: NanumSquare_ac;
	display: flex;
	padding: 0 10px;
	justify-content: space-between;
}

.bt{
	padding-top: 62px;
}

.bt button{
	width: 114px;
	height: 32px;
	background-color: white;
	border: 1px solid #4366A3;
	border-radius: 5px;
	font-size: 14px;
}
.bt  button.reservationButton{
	border: 1px solid #4366A3; 
	color: #4366A3;
}

.bt button:last-child:hover{
	background-color: #4366A3;
	color: white;
}
</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>

		<div class="content">
			<!-- 마이페이지 div -->
			<div class="title">
				<div class="tname">
					<div class="pagename">&nbsp;마이페이지</div>
				</div>
			</div>
			<!-- 마이페이지 메뉴 사이드바 div -->
			<div class='pageContent'>
			<aside>
				<div class="navbar">
					<nav class="inmenu">
						<!-- 메뉴 하나 div 시작 -->
						<div class="navside" onclick="location.href='info'">
							<div class="navitem" id="myinfo">
								<span class="textmenu">내정보</span>
							</div>
						</div>
						<!-- 메뉴 하나 div 끝 -->
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
			<!-- 내용 div -->
			<div class="maintext">
				<div class="maintitle">예약내역</div>
				<div class="tabmenu">
				<!-- 예약, 취소내역 탭메뉴 -->
					<div class="tabnav">				
						<div class="reservationlist" onclick="location.href='Myreservation'"><p>예약내역</p></div>
						<div class="canclelist" onclick="location.href='cancel'" style="border: 1px solid #707070; border-top: 3px solid #4366A3; color: #242424;"><p>취소내역</p></div>
					</div>
				<!-- 예약 취소내역 아티클 -->
						<!-- <div class="reserArticle">
								<h4 class="reserDate">취소날짜 : <span>2022.01.01(토)</span><span class="reinfo">취소완료</span></h4>				
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
								                    <button type="button" class="reservationButton" onclick="location.href='cancelHistory'">상세보기</button>
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
		/* 페이지 관련 data 받아오는 ajax */
		$(function() {
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../loginpage/login';
			} else{
				$.ajax({
					url : "../v2/cancelations", // 컨트롤러 위치
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
										+"<img src='../images/icon/cancelIcon.png'>"
										+"<p class='noDataMessage'>취소내역이 없습니다.</p>"
									+"</div>"
								);
							} else{
								cancelList();
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
		/* 취소 내역 div append 함수 */
		function cancelList(){
			for(var i = 0; i <data.length ; i++){
				$('.tabmenu').append(
					"<div class='reserArticle'>"
						+"<h4 class='reserDate'>취소날짜 : " + data[i].cancel_date + "<span class='reinfo'>" + data[i].state + "</span></h4>"				
						    +"<div class='article2'>"
						        +"<div class='reservationTable'>"
						        +"<img alt='숙소사진' src='" + data[i].lodgement_img_url + "' style='float: left;'>"
						            +"<div class='reservationTexts' style='width: 93%;'>"
						                +"<div class='htitle'>"
						                    +"<h3>" + data[i].lodgement_name + "</h3>"
						                    +"<p>" + data[i].room_name + "</p>"
						                    +"<p>" + data[i].check_in + " - " + data[i].check_out + "</p>"
						                +"</div>"
						               /*  +"<div class='resprice'>"
						                    +"<p>예약금액 <br><span>" + data[i].charge.toLocaleString('en') + "원</span></p>"							
						                +"</div>"	 */					                
						                +"<div class='bt'>"
						                    +"<button type='button' class='reservationButton' id='" + data[i].cancel_id + "'>상세보기</button>"
						                +"</div>"						
						            +"</div>"
						        +"</div>"
							+"</div>"
						+"</div>"		
					)
				}
			}	
		
		/* 상세보기 버튼 눌렀을때 취소 상세보기로 넘어감*/
		$(document).on('click','.reservationButton',function(){
			var cancel_id = $(this).attr('id');
			
			location.href='cancelHistory?cancel=' + cancel_id; //클릭한 취소내역의 상세보기 페이지로 넘어가기
		})
	
	</script>
</body>
</html>