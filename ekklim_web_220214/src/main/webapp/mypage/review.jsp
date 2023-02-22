<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<link rel = "stylesheet" href = "../css/main.css">
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
	width: 896px;
}

.tabcon{
	width: 100%;
	margin-top: 30px;
}


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
.count{
	font-size: 16px;
	font-family: NanumSquare_ac;
	font-weight: bold;
}

.article{
	padding: 10px;
	border: 1px solid #242424;
	border-radius: 10px;
	width: 850px;
	height: 200px;
	margin: 25px auto;
	display: grid;
	grid-template-columns: 30% 70%;
}

.article img{
	width: 100%;
	border-radius: 12px;
	max-height: 166px;
}

.htitle h3{
	font-size: 24px;
	color: #242424;
	font-family: NanumSquare_ac;
	margin-bottom: 8px;
}

.htitle{
	margin: 14px 30px 30px 14px;
	width: 100%;
}

.htitle p{
	font-size: 15px;
	color: #242424;
	font-family: NanumSquare_ac;
}
.price{
	float: left;
	color: #707070;
	margin: 35px 35px 35px 280px;
}
.price span{
	font-size: 22px;
	color: #C3A58A;
}
.article> div> .bt2 {
	display: flex;
	float: right;
	transform: translateY(48px);
}
.bt2 > button{
	padding: 0.5rem 1rem;
	text-align: center;
	display: inline-block;
	border: 1px solid #707070;
	border-radius: 4px;
	cursor: pointer;
	margin: 6px;
	display: block;
	width: 114px;
    height: 32px;
    color: #242424;
    font-size: 14px;
    font-family: NanumSquare_ac;
    background-color: #FFFFFF;
}

.mreview{
	margin-left: 12px;
	width: 100%;
	font-size: 15px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.rdate{
	font-size: 16px;
	/* width: 200px; */
	font-family: NanumSquare_ac;
	color: #242424;
	float: left;
	margin-bottom: 8px;
}

  .deleteReview{
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: 1000;
	z-index: -1;
	opacity: 0;
}

.show {
	opacity: 1;
	z-index: 1000;
	transition: all .5s;
}

.window {
	position: relative;
	width: 100%;
	height: 100%;
}

.popup {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	background-color: #ffffff;
	border-radius: 15px;
	/* 임시 지정 */
	width: 900px;
	height: 820px;
	/* 초기에 약간 아래에 배치 */
	transform: translate(-50%, -40%);
}
.deleteReview.show >.window> .popup {
	width: 530px;
	height: 300px;
}
.show .popup {
	transform: translate(-50%, -50%);
	transition: all .5s;
}

.deleteAlert{
    text-align: center;
}
.deleteAlert img{
     width: 86px;
     height: 86px;
     margin-top: 22px;
 }   

 .deleteText{
	margin: 35px auto;
    line-height: 33px;
    font-size: 24px;
    color: #707070;
    font-family: NanumSquare_ac;
    font-weight: bold;
 }

 .deleteButton button{
    width: 112px;
    height: 48px;
    margin-right: 10px;
    font-size: 20px;
    font-family: NanumSquare_ac;
    background-color: white;
    border: 2px solid #979797;
    color: #707070;
    border-radius: 8px;
    cursor: pointer;
 }
 
.bt2 button.reservationButton{
	border: 1px solid #4366A3; 
	color: #4366A3;
}
.bt2 button:first-child:hover{
	background-color: #707070;
	color: white;
}
.bt2 button:last-child:hover{
	background-color: #4366A3;
	color: white;
}

.reviewArticle, .reviewArticle2{
	margin: 22px auto;
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
						
						<div class="navside" onclick="location.href='Myreservation'" >
							<div class="navitem" id="reservation">
								<span class="textmenu" >예약·취소내역</span> 
							</div>
						</div>

						<div class="navside" onclick="location.href='review'" style="background-color: #4366A3;">
							<div class="navitem" id="review">
								<span class="textmenu" style="color: #FFFFFF;">나의리뷰</span> <img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
							</div>
						</div>
					</nav>
				</div>
			</aside>

			<div class="maintext">
				<div class="maintitle"><h4>나의 리뷰</h4></div>
					<div class="tabmenu">
						<!-- 작성한 리뷰/ 작성할 리뷰 탭 -->
						<div class="tabnav">
							<div class="tablinks" onclick="openMenu(event,'Written')" id="defaultOpen"><p>작성한 리뷰</p></div>
							<div class="tablinks" onclick="openMenu(event,'toWrite')"><p>작성가능리뷰</p></div>
						</div>
					
						<div class="tabcon">
							<!-- 작성한 리뷰 탭 -->
							<div id="Written" class="tabcontent">
								<div class="count">작성개수: <span id="review_count">0</span>개</div>
								<!-- 작성한 리뷰 append 위치 -->
							</div>
							
							<!-- 작성가능리뷰 탭 -->
							<div id="toWrite" class="tabcontent">
								<div class="count">작성가능개수: <span id="to_review_count">0</span>개</div>
								<!-- 작성가능리뷰 append 위치 -->
							</div>
						</div>	
													
					</div>
				</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>
	
		<!-- 리뷰삭제 팝업 -->
		<div class="deleteReview">
		    <div class="window">
		        <div class="popup">
		            <div class="deleteAlert">
		                <img src="../images/icon/blue.png">
		                <div class="deleteText">
		                    <p>리뷰를 삭제하시겠습니까?</p>
		                </div>
		                <div class="deleteButton">
		                    <button type="button" onclick="$('.deleteReview').removeClass('show')">뒤로가기</button>
		                    <button type="button" onclick="reviewDelete()" class='reviewDeleteBtn' style="background-color: #4366A3; border: none; color: white;">삭제하기</button>
		                </div>
		            </div>
		        </div>
		      </div>
		</div>
		
	
		<script>
			/* 작성한 리뷰의 갯수 */
			function reviewCount(){
				$('#review_count').text($('.reviewArticle').length);
			}
			
			/* 작성할 리뷰의 갯수 */
			function toreviewCount(){
				$('#to_review_count').text($('.reviewArticle2').length);
			}
			
			var review_id;
			/* 리뷰 삭제하기 버튼 클릭시 리뷰삭제 팝업 뜸 */
			$(document).on('click','#R_show',function(){
				$('.deleteReview').addClass('show');
				review_id = $(this).attr('class');
			})
			
		</script>
		
<script>
	/* 받은 선물, 보낸선물 탭부분 */
    function openMenu(evt, review) {
		  var i, tabcontent, tablinks;
		  tabcontent = document.getElementsByClassName("tabcontent");
		  for (i = 0; i < tabcontent.length; i++) {
		    tabcontent[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablinks");
		  for (i = 0; i < tablinks.length; i++) {
		    tablinks[i].className = tablinks[i].className.replace(" active", "");
		  }
			  document.getElementById(review).style.display = "block";
			  evt.currentTarget.className += " active";
			}
		    document.getElementById("defaultOpen").click();

</script>
			

<script>
	/* 작성한 리뷰 내역 아티클 */
	function reviewList() {
		for(var i = 0; i < data.length; i ++){
			$('#Written').append(
				"<div class='reviewArticle'>"
					+"<div class='rdate'><p>" + "등록일:"+ " <span>" + data[i].review_date+"</span></p></div>"
					+"<div class='article'>"
						+"<div>"
							+"<img alt='숙소사진' id = 'review_img_url" + i + "'src='" + data[i].review_img_url + "'>"
						+"</div>"
						+"<div style='width: 100%; height: 100%;'>"
							+"<div class='htitle'>"
								+"<h3 id='" + data[i].lodgement_id + "'>" + data[i].lodgement_name + "</h3>"
								+"<p>" + data[i].room_name + "</p>"
							+"</div>"					
							+"<div class='mreview'>"
									+"<p>" + data[i].review_text+"</p>"
							+"</div>"
							+"<div class='bt2'>"
								+"<button type='button' id='R_show' class='" + data[i].review_id + "'>삭제하기</button>"
								+"<button type='button' class='reservationButton editBtn' id='" + data[i].reservation_id + "' onclick='editReview(this)''>수정하기</button>"	
							+"</div>"
						+"</div>"
					+"</div>"
				+"</div>"
			);
		
			/* 리뷰 이미지 data가 없으면 바이인 호텔 로고 이미지가 보임 */
			if($('#review_img_url'+i).attr('src') == "null") {
				$('#review_img_url'+i).attr('src', "../images/mainimg/logo.png");
			}
			
		}
	}
	
	/* 작성가능리뷰 */
	function toWriteReview(ableData){
		for(var i = 0; i < ableData.length; i ++){
			$('#toWrite').append(
					"<div class='reviewArticle2'>"
					+"<div class='rdate'><p>숙소 이용일: <span>" + ableData[i].date_string+"</span></p></div>"
					+"<div class='article'>"
					+"<div>"
						+"<img alt='숙소사진' src='" + ableData[i].review_img_url + "'>"
					+"</div>"
					+"<div style='width: 100%; height: 100%;'>"
						+"<div class='htitle'>"
							+"<h3>" + ableData[i].lodgement_name + "</h3>"
							+"<p>" + ableData[i].room_name + "</p>"
						+"</div>"					
						+"<div class='bt2'>"
							+"<button type='button' class='reservationButton writeBtn' id='" + ableData[i].reservation_id + "' onclick='writeReview(this)''>작성하기</button>"	
						+"</div>"
					+"</div>"
			+"</div>"
		+"</div>"
				);
			}
	}
	/* 리뷰수정하기 버튼 클릭하면 리뷰 작성하는 페이지로 넘어감 */
	function editReview(obj){
		var reservationId = $(obj).attr('id');
		
		location.href='../reserhotel/reviewwrite?reservation=' + reservationId;
	}
	
	/* 리뷰작성하기 버튼 클릭하면 리뷰 작성 페이지로 넘어감 */
	function writeReview(obj){
		var reservationId = $(obj).attr('id');
		
		location.href='../reserhotel/reviewwrite?reservation=' + reservationId;
	}

	</script>
	
	
	<script>	
	var user_id = '<%=id%>';
	
		$(function() {
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../loginpage/login';
			} else{
				/* 작성한 리뷰 목록 보여주는 ajax */
				 $.ajax({
					url : "../reviews", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						
						
						/*  var result = {
								    "code": 200,
								    "message": "Success",
								    "data": [
								        {
								            "review_id": 56,
								            "reservation_id": 263,
								            "lodgement_id": 78,
								            "lodgement_name": "신안동 이끌림",
								            "review_date": "2022.05.17",
								            "room_id": 70,
								            "room_name": "비즈니스 더블",
								            "like_num": 0,
								            "review_text": "좋아요 굿",
								            "review_img_url": "../static/review/56220517112904680756.jpg"
								        }
								    ]
								} */
						
						console.log(result);
						
						if(result.message == 'Success'){
							data = result.data;
							if(data.length == 0) {
								//검색결과가 없을때
								$('#Written').append(
									"<div class='noData'>"
										+"<img src='../images/icon/listIcon.png'>"
										+"<p class='noDataMessage'>리뷰내역이 없습니다.</p>"
									+"</div>"
								);
							} else{
								 reviewList();
								 reviewCount();
								 toreviewCount();
							}
							console.log(data);
							
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
			
			/* 작성가능한 리뷰목록들 */
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../loginpage/login';
			} else{
				$.ajax({
					url : "../reviewables", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        }, 
					success : function(result){
						
						if(result.message == 'Success'){
							ableData = result.data;
							
							 /* var ableData = {
							    "code": "200",
							    "data": [
							        {
							            "reservation_id": 194,
							            "room_name": "비즈니스 더블",
							            "lodgement_name": "신안동 이끌림",
							            "date_string": "2022.04.19 (화) 19:00 ~ 2022.04.30 (수) 11:00"
							        }
							    ],
							    "message": "Success"
							} 
							ableData = ableData.data; */
							console.log(ableData);
							
							if(ableData.length == 0) {
								//검색결과가 없을때
								$('#toWrite').append(
									"<div class='noData'>"
										+"<img src='../images/icon/listIcon.png'>"
										+"<p class='noDataMessage'>리뷰내역이 없습니다.</p>"
									+"</div>"
								);
							} else{
								toreviewCount();					
								toWriteReview(ableData);
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
		
		/* 리뷰 삭제하기 */
		function reviewDelete() {
			
			 $.ajax({
				 url : "../reviews?review=" + review_id, // 컨트롤러 위치
				// get, post
				// get은 쿼리스트링 방식
				// post 숨겨서 보내야 되므로 ajax안에 data: {}
				 type : "DELETE",
				// dataType : response 어떤 타입으로 받을지
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					
					console.log(result)
					
					if(result.message == 'Success'){
						$('.deleteReview').removeClass('show');
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
		
	</script>

</body>
</html>