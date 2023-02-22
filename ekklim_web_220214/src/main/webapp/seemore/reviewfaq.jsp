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
.noticeAnswer li{
	list-style-type: "-  ";
}
.answerNum{
	padding-left: 20px;
	font-weight: bold;
}
.answerP{
	padding-left: 20px;
	padding-top: 10px;
}
#li_Num li{
	list-style-type: decimal;
}

.notable{
	width: 860px;
	border-top: 1px solid #707070;
}
.noticeQuestion{
	display: flex;
	height: 115px;
	border-bottom: 1px solid #C2C2C2;
	align-items: center;
	cursor: pointer;
}

.notable th{
	width: 750px;
	padding: 10px;
	line-height: 30px;
	font-size: 18px;
	font-family: NanumSquare;
	color: #242424;
}
.notable td{
	width: 110px;
	padding: 10px;
	text-align: center;
	color: #707070;
	font-size: 30px;
}

.noticeAnswer{
	width: 930px;
	background: #F3F3F3;
	display: none;
}

.noticeAnswer td{
	font-size: 18px;
	font-family: NanumSquare;
	color: #242424;
	width: 903px;
	text-align: left;
	line-height: 32px;
	
}

.faqmenu{
	margin: 25px auto;
}
.faqmenu span{
	font-size: 18px;
	margin: auto 15px;
	font-family: NanumSquare;
	cursor: pointer;
	color: #C9C9C9;
}

.callinfo{
	margin: 40px auto;
}

.callinfo h3{
	font-size: 32px;
	font-family: NanumSquare_ac;
	color: #242424;
	margin: 20px auto;
	font-weight: lighter;
}

.callinfo h4{
	font-size: 24px;
	font-family: NanumSquare_ac;
	color: #242424;
	font-weight: lighter;
	margin-bottom: 5px;
}

.callinfo p{
	font-size: 14px;
	font-family: NanumSquare_ac;
	color: #242424;
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
						<div class="navside" onclick="location.href='faq'" style="background-color: #4366A3;">
							<div class="navitem" id="faq">
								<span class="textmenu" style="color: #FFFFFF;">FAQ</span> <img src="../images/mainimg/blackpoint.png" alt="arr"	class="arrow">
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
				<div class="maintitle">FAQ</div>
					<div class="tabmenu">
						<!-- faq 페이지 div -->
						<div class="faqmenu">
							<span onclick ="location.href='faq'">전체</span>
							<span onclick ="location.href='reserfaq'">예약·결제·영수증</span>
							<span onclick ="location.href='pointfaq'">변경·취소·환불</span>
							<span onclick ="location.href='receiptfaq'">쿠폰·할인</span>
							<span onclick ="location.href='reviewfaq'" style="font-weight: bold; color: #242424; border-bottom: 2px solid #4366A3;">회원·개인정보</span>	
						</div>
						<!-- faq 내용 table -->
						<table class="notable">
							<tr class='noticeQuestion'>
								<th><span>[회원/개인정보]</span> 아이디, 비밀번호를 잃어버렸어요.</th>
								<td><span id="aro"><img src="../images/arr5.png"></span></td>
							</tr>
							<!-- 숨겨진 답변 상세보기 -->
							<tr class="noticeAnswer">
								<td>
								<p class='answerP'>[아이디 찾기]</p>
								<ul>
									<li>바이인 호텔은 회원 가입 시 별도의 이메일 인증 절차를 진행하지 않아 아이디 분실 시 고객센터로 문의해 주시기 바랍니다.</li>
								</ul>
								<p class='answerP'>[비밀번호 찾기]</p>
								<ul>
									<li>바이인 호텔 앱/웹 > 내 정보 > 로그인 > '비밀번호 찾기'에서 가입 시 등록한 이메일 주소 기재 후 재설정 메일 발송 > 메일 내 링크를 통해 비밀번호 재설정 (링크는 24시간 동안만 유지)</li>
								</ul>
								<p class='answerP'>[간편로그인]</p>
								<ul>
									<li>회원가입/로그인 후 내 정보 > 설정 > 간편 로그인에서 설정이 되어야만 사용 가능</li>
								</ul>
								<p class='answerP'>※ 바이인 호텔은 개인정보보호의 일환으로 1년 이상 장기 미이용 고객을 대상으로 모든 개인정보를 삭제 처리합니다.<br>
									로그인 시 '회원정보를 찾을 수 없습니다'의 메시지가 확인되는 경우, 바이인 호텔 고객센터(1533-3152 / 09:00 ~ 18:00 )로 문의해 주시기 바랍니다.</p>
								</td>				
							</tr>
							<tr class='noticeQuestion'>
								<th><span>[회원/개인정보]</span> 바이인호텔 사이트 아이디로 로그인이 되지 않아요.</th>
								<td><span id="aro"><img src="../images/arr5.png"></span></td>
							</tr>
							<!-- 숨겨진 답변 상세보기 -->
							<tr class="noticeAnswer">
								<td>
								<p class='answerP'>로그인이 되지 않는 경우는 다음과 같습니다.</p>
								<p class='answerNum'>▶ SNS로그인이 안될 경우</p>
								<ul>
									<li>먼저 ID로 회원가입/로그인 후 내 정보 > 설정 > 간편 로그인에서 연동해 주세요.</li>
									<li>바이인 호텔 웹사이트의 경우, SNS 로그인을 지원하지 않으며, 휴대폰 번호로 로그인 기능을 제공하고 있으니 이용에 참고하시기 바랍니다.</li>
								</ul>
								<p class='answerNum'>▶ 장기 미사용 고객일 경우</p>
								<ul>
									<li>바이인 호텔은 개인정보보호의 일환으로 12개월 장기 미이용 고객을 대상으로 모든 개인정보를 삭제 처리합니다.<br>
									 개인정보가 남아있지 않은 경우 탈퇴 여부를 확인할 수 없습니다.</li>
								</ul>
								<p class='answerP'>로그인 시, /회원정보를 찾을 수 없습니다'의 메시지가 나오는 경우 바이인 호텔 고객센터(1533-3152)에 문의해 주세요.</p>
								</td>				
							</tr>
							<tr class='noticeQuestion'>
								<th><span>[회원/개인정보]</span> 탈퇴했는데, 약관 개정 등의 메일이 왔어요.</th>
								<td><span id="aro"><img src="../images/arr5.png"></span></td>
							</tr>
							<!-- 숨겨진 답변 상세보기 -->
							<tr class="noticeAnswer">
								<td>
								<ul>
									<li>바이인 호텔은 가입 시 별도의 이메일 인증 절차를 진행하지 않아 탈퇴 이후 다른 사람이 가입 시 고객님의 이메일 정보를 입력했을 수 있으며, 이 경우 가입 여부와 관계없이 이메일이 전송될 수 있습니다.</li>
									<li>이메일 수신이 불편하신 경우, 바이인 호텔 고객센터(1533-3152)로 문의해 주세요.</li>
								</ul>
								</td>				
							</tr>
							<tr class='noticeQuestion'>
								<th><span>[회원/개인정보]</span> 탈퇴하고 싶어요.</th>
								<td><span id="aro"><img src="../images/arr5.png"></span></td>
							</tr>
							<!-- 숨겨진 답변 상세보기 -->
							<tr class="noticeAnswer">
								<td>
								<ul>
									<li>회원 탈퇴는 아래의 방법을 통해 직접 가능합니다.<br>
										▶ 바이인 호텔 앱/ 웹 : 내 정보 > 상단 닉네임 옆 내 정보 관리 > 회원 탈퇴</li>
								</ul>
								</td>				
							</tr>
							<tr class='noticeQuestion'>
								<th><span>[회원/개인정보]</span> 회원 정보 수정은 어떻게 하나요?</th>
								<td><span id="aro"><img src="../images/arr5.png"></span></td>
							</tr>
							<!-- 숨겨진 답변 상세보기 -->
							<tr class="noticeAnswer">
								<td>
								<p class='answerP'>아이디 변경은 불가하며, 아래 방법을 통해 비밀번호/닉네임 변경이 가능합니다.</p>
								<ul>
									<li>비밀번호<br>
									바이인 호텔 앱 > 내 정보 > 상단 닉네임 옆 내 정보 관리 > 비밀번호 수정하기</li>
									<li>닉네임<br>
									바이인 호텔 앱 > 내 정보 > 상단 닉네임 옆 내 정보 관리 > 닉네임 옆 연필 표시 선택 후 수정하기</li>
								</ul>
								</td>				
							</tr>
							<tr class='noticeQuestion'>
								<th><span>[회원/개인정보]</span> 마케팅 수신 여부를 수정하고 싶습니다.</th>
								<td><span id="aro"><img src="../images/arr5.png"></span></td>
							</tr>
							<!-- 숨겨진 답변 상세보기 -->
							<tr class="noticeAnswer">
								<td>
								<p class='answerP'>아래 방법을 통해 마케팅 수신 및 해제가 가능합니다.</p>
								<ul>
									<li>마케팅 수신 여부<br>
										▶ 바이인 호텔 앱 : 핸드폰 > 설정 > 바이인 호텔 알림 설정</li>
								</ul>
								<p class='answerP'>단, 서비스 이용에 필수적인 공지 내용은 동의 여부와 관계없이 발송된다는 점 참고 부탁드립니다.</p>
								</td>				
							</tr>
							<tr class='noticeQuestion'>
								<th><span>[회원/개인정보]</span> 탈퇴한 아이디로 재가입 할 수 있나요?</th>
								<td><span id="aro"><img src="../images/arr5.png"></span></td>
							</tr>
							<!-- 숨겨진 답변 상세보기 -->
							<tr class="noticeAnswer">
								<td>
								<ul>
									<li>탈퇴 후 30일 이후부터 동일한 아이디로 재가입이 가능합니다.</li>
								</ul>
								</td>				
							</tr>
							<tr class='noticeQuestion'>
								<th><span>[회원/개인정보]</span> 회원가입 시 인증 문자가 오지 않아요.</th>
								<td><span id="aro"><img src="../images/arr5.png"></span></td>
							</tr>
							<!-- 숨겨진 답변 상세보기 -->
							<tr class="noticeAnswer">
								<td>
									<ul>
										<li>회원가입 시 인증번호 문자가 확인이 안될 시 차단 여부를 확인해 주세요.</li>
									</ul>
								</td>				
							</tr>
						</table>
						
						<div class="paging">
							<div class="pagination inner" id='pagination' style='text-align: center;'>
							
							</div>
						</div>
					<!-- 고객센터 div -->
					<div class="callinfo">
						<h3>원하시는 질문이 없으신가요?</h3>
						<img src="../images/icon/blueCall.png" style="float: left; margin-right: 15px;">			
						<h4>고객센터 : 1533-3152</h4>
						<p>문의 가능 시간 : 09:00 - 18:00</p>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file="../footer.jsp"%>
	</div>
	<script>
		$('.noticeQuestion').click(function(){
			$(this).next().toggle();
		})
	</script>
	<script>                                            
		$(function(){
			page();
		})
		function page() {	
		    $('table.notable').each(function () {
		        var pagesu = 10;  //페이지 번호 갯수
		        var currentPage = 0;
		        var numPerPage = 8;  //목록의 수
		        var $table = $(this);
		        var pagination = $("#pagination");
	
		        //length로 원래 리스트의 전체길이구함
		        var numRows = $table.find('.noticeQuestion').length;
	
		        //Math.ceil를 이용하여 반올림
		        var numPages = Math.ceil(numRows / numPerPage);
	
		        //리스트가 없으면 종료
		        if (numPages == 0) return;
	
		        //pager라는 클래스의 div엘리먼트 작성
		        var $pager = $('<div class="pager"></div>');
		        var nowp = currentPage;
		        var endp = nowp + 10;
	
		        //페이지를 클릭하면 다시 셋팅
		        $table.bind('repaginate', function () {
	
		        //기본적으로 모두 감춘다, 현재페이지+1 곱하기 현재페이지까지 보여준다
		            $table.find('.noticeQuestion').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
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