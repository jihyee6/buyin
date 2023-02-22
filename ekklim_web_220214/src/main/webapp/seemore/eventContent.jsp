<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>바이인호텔</title>
<link rel="stylesheet" href="../css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	margin: 44px auto;
}
.endEvent{
	margin: 8px auto;
	filter: brightness(50%); 
	position: relative;
}

.eventText{
	position: absolute;
	color: white;
	bottom: 21%;
	left: 39%;
	font-size: 22px;
	font-weight: bold;
}

.couponButton{
	border-radius: 12px;
	transform: translate(100px, -1419px);
	cursor: pointer;
}

.postList table{
	border-top: 1px solid #E8E8E8;
	border-bottom: 1px solid #E8E8E8;
	border-collapse: collapse;
	width: 100%;
	cursor: pointer;
}

.postList table td{
	padding: 28px;
	height: 30px;
	border-bottom: 1px solid #E8E8E8; 
	margin: 0px;
	font-family: NanumSquare_ac;
	font-size: 16px;
}

.postList table tr:first-child td, tr:last-child td{
	text-align: center;
	line-height: 30px;
}

.postList table tr:nth-child(2) td p{
	line-height: 22px;
}

.postList table td:last-child{
	border-bottom: none;
}

/* .iframebox {

 position: relative;
 width: 100%;
 padding-bottom: 56.25%;

}

.iframebox iframe {

  display: block;
  border: none;
  height: 100vh;
  height: 100%;
  width: 100%;
  overflow:hidden;

}​ */
</style>

</head>
<body>
<% 
	String event_img = (String) request.getParameter("event");
	event_img = "http://www.buyinhotel.co.kr/images/event/" + event_img;
%>
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
								<span class="textmenu" style="color: #FFFFFF;">이벤트</span> <img src="../images/mainimg/blackpoint.png" alt="arr" class="arrow">
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
					<!-- <img src="../images/eventcontent.png">
					<img class="couponButton" onclick="" src="../images/icon/couponButton.png" > -->
					<div class="iframebox">
						<iframe id = 'evnet_img' src ='' frameborder="0" scrolling="no" onload="resizeIframe(this)"></iframe>
					</div>
				</div>
				
				<!-- <div class="postList">
					<table>
						<tr style="width: 20%; background-color: #F6F6F6;">
							<td>다음글</td>
							<td>이전글</td>
						</tr>
						<tr style="width: 70%;" onclick="">
							<td><p>비수기 여행객을 위한 할인쿠폰 이벤트</p>
								<p>&#8251; 진행기간: 2022.01.01 - 2022.02.01</p>
							</td>
							<td><p>늦은 저녁엔 더욱 할인! 저녁 예약 선착순 이벤트</p>
								<p>&#8251; 진행기간: 2022.01.01 - 2022.02.01</p></td>
						</tr>
						<tr style="width: 10%;" onclick="">
							<td><img src="../images/arr6.png"></td>
							<td><img src="../images/arr7.png"></td>
						</tr>
					</table>
				</div> -->
				
				
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>
<script>
	$(function() {
		var event_img = '<%=event_img%>';
		
		$('#evnet_img').attr('src',event_img);
	})
	
	function resizeIframe(obj) {
    	obj.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
    }
</script>
</body>
</html>