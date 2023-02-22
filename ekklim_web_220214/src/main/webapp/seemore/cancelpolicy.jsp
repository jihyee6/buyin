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

.t_text{
	width: 950px;
}

.t_text h4{
	font-size: 32px;
	font-weight: bold;
	font-family: NanumSquare_ac;
	color: #242424;
}

.terms_text{
	font-family: NanumSquare_ac;
	font-color: #242424;
	font-size: 16px;
	width: 950px;
	margin-top: 30px;
}

.terms_text h3{
	font-size: 32px;
	font-weight: bold;
	margin: 30px auto;
}

.terms_text p{
	line-height: 25px;
}

.t_text {
	width: 950px;
}

.terms_text {
	font-family: NanumSquare_ac;
	font-color: #242424;
	font-size: 16px;
	width: 950px;
	margin-top: 30px;
}


.terms_text p {
	line-height: 25px;
	font-size: 18px;
}

.s_refund{
	margin-top: 35px;
}

.s_refund p{
	margin-left: 38px;
}

.s_table{
	border-top: 1px solid #707070;
	border-bottom: 1px solid #707070;
	border-collapse: collapse;
	width: 800px;
	margin-top: 10px;
}

.s1{
	display: flex;
}

.s_table th{
	width: 400px;
	text-align: center;
	border-bottom: 1px solid rgb(209,209,209,0.5);
	margin: 0;
	padding: 20px;
	font-size: 18px;
	font-weight: 500;
	background: #F3F3F3;
}

.s_table td{
	width: 400px;
	text-align: center;
	border-bottom: 1px solid rgb(209,209,209,0.5);
	margin: 0px;
	padding: 20px;
	font-size: 16px;
}

.s_table td:last-child{
	border-bottom: none;
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
						<div class="navside" onclick="location.href='event'">
							<div class="navitem" id="event">
								<span class="textmenu" >이벤트</span> 
							</div>
						</div>
						
						<div class="navside" onclick="location.href='benefits'" >
							<div class="navitem" id="benefit">
								<span class="textmenu" >회원등급혜택</span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='faq'" >
							<div class="navitem" id="faq">
								<span class="textmenu" >FAQ</span> 
							</div>
						</div>
						<div class="navside" onclick="location.href='policy'" style="background-color: #4366A3;">
							<div class="navitem" id="policy">
								<span class="textmenu" style="color: #FFFFFF;">약관 및 정책</span> <img src="../images/mainimg/blackpoint.png" alt="arr"	class="arrow">
							</div>
						</div>
					</nav>
				</div>
			</aside>

			<div class="maintext">
				<div class="t_text">
					<h4>약관 및 정책</h4>
					<!-- 약관 페이지 넘어가는 버튼 div -->
					<div class="t_button">
						<button type="button" onclick="location.href='policy'">이용약관</button>
						<button type="button" onclick="location.href='personal'">개인정보처리방침</button>
						<button type="button" onclick="location.href='noemail'">이메일무단수집거부</button>
						<button type="button" onclick="location.href='okmarketing'">마케팅활용동의</button>
						<button type="button" onclick="location.href='youth'" >청소년보호정책</button>
						<button type="button" onclick="location.href='locationterms'">위치정보이용약관</button>
						<button type="button" onclick="location.href='cancelpolicy'" style="background: #707070; color: white;">취소규정</button>
					</div>
						<!-- 약관 내용 div -->
						<div class="terms_text">
						<h3>취소규정</h3>
							<p>
								* 숙박 및 대실 예약완료 후 10분 이내 당일취소 및 변경 가능합니다.</p>
								<div class="s_refund">
								<p>* 숙박 환불기준</p>
								<table class="s_table">
									<thead>
									<tr class="s1">
										<th>유형</th>
										<th>환불기준</th>
									</tr>
									</thead>
									<tbody>
										<tr>
											<td>체크인 10-9일전</td>
											<td>체크인 8-7일전</td>
											<td>체크인 6-5일전</td>
											<td>체크인 4-3일전</td>
											<td>체크인 2-1일전</td>
											<td>당일 취소 및 노쇼</td>
										</tr>
										<tr>
											<td>총 결제금액 중 100% 환불</td>
											<td>총 결제금액 중 70% 환불</td>
											<td>총 결제금액 중 50% 환불</td>
											<td>총 결제금액 중 30% 환불</td>
											<td>총 결제금액 중 10% 환불</td>
											<td>환불불가</td>
										</tr>
									</tbody>
								</table>
								</div>
								<div class="s_refund">
									<p>* 대실 환불기준</p>
								<table class="s_table">
									<thead>
										<tr class="s1">
											<th>유형</th>
											<th>환불기준</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>체크인 1일전</td>
											<td>당일 취소 및 노쇼</td>
										</tr>
										<tr>
											<td>무료 취소 가능</td>
											<td>환불 불가</td>
										</tr>
									</tbody>
								</table>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
		<%@include file="../footer.jsp"%>	
	</div>	
</body>
</html>