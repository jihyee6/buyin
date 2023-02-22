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
.tab {
	list-style: none;
	position: relative;
	display: flex;
	width: 850px;
	height: 70px;
	border: 1px solid #707070;
	font-size: 22px;
	font-family: NanumSquare_ac;
}

.evtable {
	width: 860px;
	border-top: 1px solid #707070;
	border-bottom: 1px solid #707070;
	border-spacing: 0px;
}

.evtable tr {
	display: flex;
	border-bottom: 1px solid #BEBEBE;
}

.evtable th {
	width: 300px;
	height: 200px;
	margin: 0;
	padding: 0;
}

.evtable td {
	width: 560px;
	height: 200px;
	margin: 0px 0px 0px 25px;
	padding: 0;
}

.evtitle {
	margin-top: 25px;
}

.evtitle h4 {
	margin-bottom: 20px;
	font-size: 28px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.evtitle p {
	font-size: 16px;
	color: #242424;
	height: 55px;
	font-family: NanumSquare_ac;
}

.period {
	margin-top: 15px;
	font-size: 16px;
	font-weight: bold;
	color: #8D6334;
}

.period2 {
	color: #343434;
}

.detail {
	width: 100px;
	font-size: 16px;
	font-family: NanumSquare_ac;
	transform: translate(240px, -21px);
	color: #505050;
}

.detail span {
	font-size: 16px;
}
.detail span img{
	height: 16px;
}

.paging {
	margin: 30px 330px;
}

.inner a {
	text-decoration: none;
	float: left;
	color: #707070;
	font-size: 18px;
}

.inner ul {
	list-style: none;
	float: left;
	padding: 0;
	font-size: 20px;
	font-family: NanumSquare_ac;
}

.inner ul li {
	float: left;
	margin: 0px 10px;
}
.detail2{
	cursor: pointer;
}

.inner img{
	height: 16px;
}

.eventTitle{
	font-size: 22px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #242424;
}
.eventPeriod{
	font-size: 18px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #242424;
}

.eventPeriod span{
	font-weight: normal;
}

.eventThings{
	margin: 52px auto;
	position: relative;
}
.endEvent{
	margin: 8px auto;
	filter: brightness(50%); 
}

.eventText{
	position: absolute;
	color: white;
	bottom: 46%;
	left: 36%;
	font-size: 22px;
	font-weight: bold;
}
.eventImg{
	width: 854px;
	/* height: 256px; */
	border-radius: 8px;
	cursor: pointer;
}

</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="title">
				<div class="tname">
					<div class="pagename">&nbsp;더보기</div>
					
				</div>
			</div>
			<div class='pageContent'>
				<aside>
				<!-- 더보기 사이드바 div -->
				<div class="navbar">
					<nav class="inmenu">
						<div class="navside" onclick="location.href='notice'" >
							<div class="navitem" id="notice">
								<span class="textmenu">공지사항</span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='selectGiftcard'">
							<div class="navitem" id="notice">
								<span class="textmenu">선물하기</span>
							</div>
						</div>
						<div class="navside" onclick="location.href='event'" style="background-color: #4366A3;">
							<div class="navitem" id="event">
								<span class="textmenu" style="color: #FFFFFF;">이벤트</span> <img src="../images/mainimg/blackpoint.png" alt="arr"	class="arrow">
							</div>
						</div>
						
						<div class="navside" onclick="location.href='benefits'">
							<div class="navitem" id="benefit">
								<span class="textmenu">회원등급혜택</span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='faq'">
							<div class="navitem" id="faq">
								<span class="textmenu">FAQ</span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='policy'">
							<div class="navitem" id="policy">
								<span class="textmenu">약관 및 정책</span> 
							</div>
						</div>
					</nav>
				</div>
			</aside>

			<div class="maintext">
				<div class="maintitle">이벤트</div>
					<div class="tabmenu">
					<!-- 이벤트 데이터 나오는 div -->
						<!-- <div class="eventThings" onclick="location.href='eventContent'">
							<p class="eventTitle">BUY IN HOTEL 앱 출시 이벤트</p>
							<img src="../images/eventimg.png" style="margin: 8px auto;">
							<p class="eventPeriod"> &#8251; 진행기간 : <span>2022/01/01 - 2022/02/01</span></p>
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
			/* 이벤트 데이터 보여주는 ajax */
			$.ajax({
				url : "../events", // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					
					if(result.message == 'Success'){
						data = result.data;
						console.log(data);	
								
						eventList();
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
	<script>
		/* 이벤트 내역 함수 */
		function eventList(){
			for(var i = 0; i < data.length; i++){
				$('.tabmenu').append(
					"<div class='eventThings' onclick= 'newEventScreen(\"" + data[i].event_contents_url.replace(".jsp", "_web.jsp") + "\")'>"
					//"<div class='eventThings' onclick=\"location.href='eventContent?event=" + data[i].event_contents_url.split("/")[5] + "'\">"
						+"<img class='eventImg' id='" + data[i].event_id + "' src='"+ data[i].event_img_url +"' style='margin: 8px auto;'>"
					+"</div>"		
				)
			}
		}
		/* 이벤트 사진 클릭시 해당 이벤트의 팝업 열리기 */
		function newEventScreen(src) {
			//window.open(src, "event", 'width=800px');
			var newTab = window.open(src,"_blank");
			newTab.focus();
		}
	</script>
</body>
</html>