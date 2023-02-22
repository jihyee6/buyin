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
.location {
	float: right;
	margin: -30px 360px 0px 0px;
}

.view1 {
	margin-left: 360px;
	width: 1200px;
}

.view1 tr {
	width: 1200px;
}

.viewtitle {
	font-size: 26px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.period {
	margin-left: 40px;
	width: 7%;
	height: 15px;
	padding: 0px;
	color: #8D6334;
	font-size: 16px;
}

.period2 {
	margin: 0px;
	width: 90%;
	height: 15px;
	padding: 0px;
	font-size: 16px;
	color: #343434;
}

.viewcl {
	height: 90px;
	border-top: 2px solid #707070;
}

.viewcl2 {
	display: flex;
	border-bottom: 1px solid #BEBEBE;
}

.title2{
	margin-top: 92px;
}

.list1 {
	width: 1200px;
	padding: 0px;
	line-height: 50px;
	margin: 30px 360px;
	border-top: 1px solid #535353;
	border-bottom: 1px solid #535353;
	list-style: none;
}

.list1 li {
	font-size: 16px;
	color: #343434;
	font-family: NanumSquare_ac;
}

.list1 li a {
	text-decoration: none;
	margin-left: 20px;
	color: #343434;
}

.list1 li .prev, .next {
	position: relative;
	left: 0;
	top: 0;
	width: 150px;
	height: 100%;
	display: inline-block;
	text-align: center;
	background: #F2F2F2;
}


.view1 td {
	font-size: 18px;
	color: #242424;
	line-height: 33px;
	font-family: NanumSquare_ac;
}

.butt2 button{
	margin-left: 565px;
}

.cha{
	font-size: 20px;
}

.butt3 button{
	border: 1.5px solid #C4C4C4;
	background: white;
	width: 60px;
	height: 60px;
	border-radius: 10px;
}

.butt3{
	float: right;
}

.colorPeriod{
	font-size: 20px;
	font-weight: bold;
	color: #8D6334;
}

.store{
	font-weight: bold;
}
</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>	
		<div class="content">
			<div class="title2">이벤트 상세보기</div>
			<!-- <div class="location">
				<span>홈</span> <span>>이벤트</span> <span>>상세보기</span>
			</div> -->
			<div>
				<table class="view1">
					<tr class="viewcl">
						<th class="viewtitle">이끌림 어플리케이션 출시 이벤트
						<!-- 공유 버튼 -->
						<div class="butt3">
							<img alt="share" src="../images/reservationimg/share.png">
						</div>
						</th>
					</tr>
					<tr class="viewcl2">
						<th class="period">&#8251; 진행기간:</th>
						<td class="period2">2022/01/01 - 2022/02/01</td>
					</tr>
					<tr>
						<td><img width=994 height=426 style="margin-left: 62px;"></td>
						<td>이끌림 어플리케이션 출시 할인 이벤트를 진행합니다.<br> <ins>[이끌림 앱 다운로드 > 이끌림 앱 접속 > 숙소 예약> 결제 완료]</ins>시 할인적용되는 코드를 보내드리며, 각 지점마다 이벤트가
							다를 수 있으니 확인 후 할인 혜택을 받으시길 바랍니다.
						</td>
					</tr>
					<tr>
						<td><span class="store">사용가능 지점</span><br> 이끌림 호텔 신안점 / 이끌림 비즈니스호텔 신안점 / 이끌림 호텔 충장점
							/ 이끌림 비즈니스호텔 충장점 / 이끌림 호텔 하남점<br> 이끌림 비즈니스호텔 하남점 / 이끌림 호텔
							천안점 / 이끌림 비즈니스호텔 천안점 / 이끌림 호텔 의정부점 / 이끌림 클래식 호텔 평택점
						</td>
					</tr>
					<tr>
						<td><span class="colorPeriod">&#8251; 진행기간</span>: 2022/01/01 - 2022/02/01</td>
					</tr>
				</table>
			</div>
			<!-- 이벤트 페이지 이전, 다음페이지로 넘기는 div -->
			<ul class="list1">
				<li style="border-bottom: 1px solid #BEBEBE;"><span	class="prev"> 이전글&nbsp;&nbsp; <span class="cha"><img src="../images/arr6.png"></span></span> 
					<a href="">코로나 19 백신 접종 할인 이벤트</a>
				</li>
				<li><span class="next"> 다음글&nbsp;&nbsp; <span class="cha"><img src="../images/arr7.png"></span></span> 
					<a href="">겨울맞이 겨울방학 이벤트</a>
				</li>
			</ul>
			<!-- 목록보기 div -->
			<div class="butt2">
				<button type="button">목록보기</button>
			</div>
		</div>
		<%@include file="../footer.jsp"%>
	</div>

</body>
</html>