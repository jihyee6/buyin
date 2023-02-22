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
.paging {
	margin: 26px 0;
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

.inner img {
	height: 16px;
}
.pageNum.active{
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
							<span onclick ="location.href='receiptfaq'" style="font-weight: bold; color: #242424; border-bottom: 2px solid #4366A3;">쿠폰·할인</span>
							<span onclick ="location.href='reviewfaq'">회원·개인정보</span>
						</div>
						<!-- faq 내용 table -->
						<table class="notable">
							<tr class='noticeQuestion'>
								<th><span>[쿠폰/할인]</span> 후기를 작성했는데 적립금이 안들어옵니다. </th>
								<td><span id="aro"><img src="../images/arr5.png"></span></td>
							</tr>
							<!-- 숨겨진 답변 상세보기 -->
							<tr class="noticeAnswer">
								<td>
								<ul>
									<li>서버오류로 발생한 상황이니 고객센터로 문의 주시면 감사하겠습니다.</li>
								</ul>
								</td>				
							</tr>
							<tr class='noticeQuestion'>
								<th><span>[쿠폰/할인]</span> 직접 작성한 후기가 왜 블라인드 처리되었나요?</th>
								<td><span id="aro"><img src="../images/arr5.png"></span></td>
							</tr>
							<!-- 숨겨진 답변 상세보기 -->
							<tr class="noticeAnswer">
								<td>
								<ul>
									<li>이용후기 게시판은 블라인드 운영원칙 및 커뮤니티 운영원칙에 의거하여 운영되고 있습니다.</li>
								</ul>
								<p class='answerNum'>블라인드 운영원칙</p>
								<ul id='li_Num'>
									<li>욕설 비속어 포함한 게시물</li>
									<li>객실 언급 없이 의미 없는 단순 자음을 반복하거나 의미 없는 알파벳, 숫자 등을 나열한 게시물</li>
									<li>상업적인 홍보의 목적으로 작성된 게시물</li>
									<li>객실을 사용하지 않고 작성된 게시물</li>
									<li>개인정보를 포함한 게시물</li>
									<li>음란성 게시물 / 청소년에게 부적합한 게시물</li>
								</ul>
								<p class='answerP'>해당 게시글이 위와 같은 운영원칙에 위배되는 내용을 포함할 경우 블라인드 처리됩니다.<br>
									이용에 불편이 없으시도록 후기 작성 시 확인 부탁드리겠습니다.<br>
									자세한 후기 정책 내용은 제휴점 후기 영역에서 확인 가능합니다.</p>
								</td>				
							</tr>
							<tr class='noticeQuestion'>
								<th><span>[쿠폰/할인]</span> 작성한 이용 후기를 수정/삭제하고 싶어요.</th>
								<td><span id="aro"><img src="../images/arr5.png"></span></td>
							</tr>
							<!-- 숨겨진 답변 상세보기 -->
							<tr class="noticeAnswer">
								<td>
								<ul>
									<li>작성한 후기 수정 및 삭제는 바이인 호텔 앱 > 내 정보 > 리뷰 관리에서 하실 수 있습니다.</li>
									<li>수정의 경우 본인이 작성한 후기는 작성일을 기준으로 48시간 이내 수정 가능합니다.<br>
										(단, 본문 수정이 가능하며 사진의 경우 삭제만 가능)</li>
									<li>후기 삭제는 본인이 작성한 후기에 한해 삭제 가능하며, 바이인 호텔 고객센터(1533-3152)에 문의하시면 후기 삭제가 가능합니다.</li>
									<li>후기 삭제 시, 기 지급된 포인트가 회수될 수 있다는 점 서비스 이용에 참고 부탁드립니다.</li>
								</ul>
								</td>				
							</tr>
						</table>
						
						<div class="paging">
							<div class="pagination inner" id='pagination' style='text-align: center;'>
							
							</div>
						</div>
					<!-- 공지사항 div -->
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
		/* faq 질문 div 클릭시 답변 div toggle */
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