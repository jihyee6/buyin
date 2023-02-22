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
.count{
	font-size: 16px;
	font-family: NanumSquare_ac;
}

.article{
	border: 1px solid #707070;
	border-radius: 10px;
	width: 850px;
	height: 237px;
	margin: 25px;
	display: grid;
	grid-template-columns: 35% 65%;
}

.article img{
	border-radius: 30px;
	padding: 14px;
	height: 200px;
	width: 263px;
}
.htitle{
	margin: 0;
}
.htitle h3{
	font-size: 28px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.htitle p{
	font-size: 16px;
	color: #242424;
	font-family: malgun;
	width: 100%;
	word-break: break-all;
	margin-left: 0px;
}
.price{
	color:#242424;
	display: grid;
	grid-template-columns: 50% 50%;
	width: 100%;
	margin: 0;
	align-items: end;
}

.price span{
	font-size: 16px;
	color: #242424 ;
	margin-left: 8px;
}

#recentBtn{
	margin-right: 0;
}
.bt> button{
	padding: 0.5rem 1rem;
	text-align: center;
	border: 1px solid #707070;
	background-color: white;
	border-radius: 4px;
	cursor: pointer;
	display: block;
	width: 120px;
    height: 37px;
    color: #242424;
    font-size: 14px;
    margin: 12px;
    font-family: NanumSquare_ac;
}

.wishTables{
    width: 100%;
    display: flex;
    flex-direction: column;
    flex-wrap: nowrap;
    height: 100%;
    justify-content: space-around;
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
</style>

</head>
<body>
<%String hotel = request.getParameter("hotel");%>
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
						<div class="navside" onclick="location.href='recentSearch'"  style="background-color: #4366A3;">
							<div class="navitem" id="recent">
								<span class="textmenu" style="color: #FFFFFF;">최근 검색 숙소</span>  <img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
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
				<div class="maintitle"><h4>최근 검색 숙소</h4></div>
					<div class="tabmenu">
						<div class="count">최근 검색 <span id="recent_count">0</span>개</div>
						<!-- 최근검색 숙소 append하는 위치 -->
					</div>
				</div>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>
	
	<script>
	/* 최근 검색 숙소 아티클 */
	function recentSearch() {
		for(var i = 0; i < data.length; i ++){
			var lodge_list_price = (data[i].lodge_list_price == null ? "-" : data[i].lodge_list_price.toLocaleString('en'));
			var lodge_sale_price = (data[i].lodge_sale_price == undefined ? "-" : data[i].lodge_sale_price.toLocaleString('en'));
			
		$('.tabmenu').append(
				"<div class='article'>"
					+"<img alt='숙소사진' src='"+data[i].lodgement_img_url + "' style='float: left;'>"
					+"<div class='wishTables'>"
						+"<div class='htitle'>"
						+"<h3>" + data[i].lodgement_name + "</h3>"
						+"<p>" + data[i].landmark + "</p>"
						+"</div>"
						+"<div class='price'>"
							+"<div style='margin-left: 0;'>"
								+"<p style='font-size: 16px; color: red; margin: 0px' class='listPrice" + i + "'>" + data[i].lodge_dc_rate + "%" + "<span style='text-decoration: line-through;'>" + lodge_list_price + "원</span></p>"
								+"<p style='font-size: 28px; color: #242424; margin: 0px' class='salePrice" + i + "'>" + lodge_sale_price + "원</p>"									
							+"</div>"
						+"<div class='bt' id='recentBtn'>"
							+"<button type='button' id='recentDeleteButton' lodgement_id = '" + data[i].lodgement_id + "'>" + "삭제하기" + "</button>"
							+"<button type='button' class='reservationButton' onclick='recentlistNext(" + data[i].lodgement_id + ")'>" + "예약하기" + "</button>"
						+"</div>"
						+"</div>"
					+"</div>"
				+"</div>"		
			);
			
			if(data[i].lodge_list_price == null || data[i].lodge_list_price == "null" ){
				$('.listPrice'+i).css("display","none");
			}
			if(!data[i].lodge_sale_price){
				$('.salePrice'+i).text("예약마감");
			}
		}
	}
	
	/* 최근검색숙소 예약하기 버튼 클릭하면 오늘-내일 날짜의 호텔 예약페이지로 넘어가기 */
	function recentlistNext(lodgement_id){
		
		var date = new Date(); //오늘 날짜 받아오기
        var year = date.getFullYear(); // 올해 년도 받아오기
        var month = ("0" + (1 + date.getMonth())).slice(-2); //오늘자 월 받아오기
        var day = ("0" + date.getDate()).slice(-2); //오늘자 일 받아오기

        var checkin = year + "." + month + "." + day; //체크인 오늘 날짜로 지정
        var checkout = year + "." + month + "." + (parseInt(day)+1); //체크아웃 내일 날짜로 지정
		
        location.href='../lodgement/'+ lodgement_id +'?user=' + user_id + '&checkin=' + checkin + '&checkout=' + checkout;;
		//location.href = '../reserhotel/reservationhotel?hotel='+lodgement_id + "&user=" + user_id + '&checkin=' + checkin + '&checkout=' + checkout; //호텔예약 홈페이지로 넘어가기
	}

	/* 최근검색 삭제했을때마다 변화된 최근 검색 목록 갯수들 세어서 넣기 */
	function recentCount(){
			$('#recent_count').text(data.length);
		}
	
	</script>	
	
	<script>	
	var user_id = '<%=id%>';
	
		$(function() {
			if(user_id == "null") {
				alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
				location.href = '../loginpage/login';
			} else{
				/* 회원이 최근검색한 호텔 정보를 보여주는 ajax */
				$.ajax({
					url : "../recents", // 컨트롤러 위치
					type : "GET",
					dataType : 'JSON',
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					success : function(result){
						
						if(result.message == 'Success'){
							data = result.data;
							console.log(data);
							
							recentSearch();
							recentCount();
														 
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
		/* 최근 검색한 호텔의 삭제하기 버튼을 클릭하면 클릭한 호텔 지워짐 */
		$(document).on('click','#recentDeleteButton',function(){
			
			$(this).parent().parent().parent().remove(); //삭제하기 클릭한 호텔 div 삭제
			
			var lodgement = $(this).attr('lodgement_id'); //삭제하기 클릭한 호텔의 id값
			
			 $.ajax({
				 url : "../recents?lodgement="+ lodgement, // 컨트롤러 위치
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
					
					console.log(result);
					
					if(result.message == 'Success'){
						/* 최근 검색 갯수 세기 */
						$('#recent_count').text($('.wishTables').length);
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