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
					<!-- faq 목록 div -->
					<div class="faqmenu">
						<span onclick ="location.href='faq'">전체</span>
					<span onclick ="location.href='reserfaq'">예약·결제·영수증</span>
					<span onclick ="location.href='pointfaq'" style="font-weight: bold; color: #242424; border-bottom: 2px solid #4366A3;">변경·취소·환불</span>
					<span onclick ="location.href='receiptfaq'">쿠폰·할인</span>
					<span onclick ="location.href='reviewfaq'">회원·개인정보</span>	
					</div>
					<!-- faq 내용 table -->
					<table class="notable">
						<tr class='noticeQuestion'>
							<th><span>[변경/취소/환불]</span> 예약 취소 시, 사용한 포인트도 환불 되나요?</th>
							<td><span id="aro"><img src="../images/arr5.png"></span></td>
						</tr>
						<!-- 숨겨진 답변 상세보기 -->
						<tr class="noticeAnswer">
							<td><ul>
								<li>
								예약 취소 시, 사용하신 포인트는 환불 어렵기 때문에 예약취소 시 신중한 선택 부탁드립니다.<br> 
								포인트 정책에 대한 자세한 내용은 아래 방법을 통해 확인 가능합니다.<br>
								▶ 바이인 호텔 앱 > 내 정보 > 포인트·쿠폰 
								</li>
							</ul>
							</td>				
						</tr>
						<tr class='noticeQuestion'>
							<th><span>[변경/취소/환불]</span> 예약일정을 변경할 수 있나요?</th>
							<td><span id="aro"><img src="../images/arr5.png"></span></td>
						</tr>
						<!-- 숨겨진 답변 상세보기 -->
						<tr class="noticeAnswer">
							<td><ul>
								<li>
								예약 일정은 변경이 불가합니다.<br>
								예약 일정 변경을 원하시는 경우 예약 취소 후 재예약을 진행해야 합니다.<br>
								취소 시점에 따라 취소수수료가 부과될 수 있으며, 이용을 원하는 숙소의 재고가 소진되었을 수 있으니 주의를 부탁드립니다. 
								</li>
							</ul>
							</td>				
						</tr>
						<tr class='noticeQuestion'>
							<th><span>[변경/취소/환불]</span> 결제수단(또는 결제카드)을 변경하고 싶습니다.</th>
							<td><span id="aro"><img src="../images/arr5.png"></span></td>
						</tr>
						<!-- 숨겨진 답변 상세보기 -->
						<tr class="noticeAnswer">
							<td><ul>
								<li>
								결제 이후에는 결제수단에 대한 어떤 변경도 불가능합니다.<br>
								취소 후에는 다시 결제가 가능하지만, 취소 시점에 따라 취소수수료가 부가되거나 동일 숙소의 잔여 객실이 남아있지 않을 수 있습니다.<br>
								신중히 취소 부탁드립니다.
								</li>
							</ul>
							</td>				
						</tr>
						<tr class='noticeQuestion'>
							<th><span>[변경/취소/환불]</span> 예약 취소 시 사용한 쿠폰은 돌려 받을 수 있나요?</th>
							<td><span id="aro"><img src="../images/arr5.png"></span></td>
						</tr>
						<!-- 숨겨진 답변 상세보기 -->
						<tr class="noticeAnswer">
							<td><ul>
								<li>
								고객님 소유의 쿠폰을 사용하신 후 예약 취소할 경우 쿠폰 재반환은 어렵습니다.<br>
								▶ 바이인 호텔 앱 > 내 정보 > 포인트·쿠폰
								</li>
							</ul>
							</td>				
						</tr>
						<tr class='noticeQuestion'>
							<th><span>[변경/취소/환불]</span> 체크인 날짜를 잘못 예약했어요. 일정을 변경할 수 있나요?</th>
							<td><span id="aro"><img src="../images/arr5.png"></span></td>
						</tr>
						<!-- 숨겨진 답변 상세보기 -->
						<tr class="noticeAnswer">
							<td>
							<p class='answerP'>보안등의 이유로 고객님의 예약 내역은 바이인 호텔에서 직접 변경하지 않도록 운영되고 있습니다.</p>
							<ul>
								<li>예약 취소가 가능한 경우 (모텔 예약 후 1시간 이내, 호텔 예약 후 10분 이내), 기존 예약을 취소하시고 새로운 예약을 해주시면 됩니다.</li>
								<li>예약 취소가 불가하거나 수수료가 발생하는 경우, 고객센터(1533-3152)로 문의 부탁드립니다.</li>
							</ul>
							</td>				
						</tr>
						<tr class='noticeQuestion'>
							<th><span>[변경/취소/환불]</span> 환불했는데 돈이 들어오지 않아요.</th>
							<td><span id="aro"><img src="../images/arr5.png"></span></td>
						</tr>
						<!-- 숨겨진 답변 상세보기 -->
						<tr class="noticeAnswer">
							<td>
							<ul>
								<li>
								고객님께서 지불하신 결제수단에 따라 환불에 소요되는 기간이 달라질 수 있습니다. 평균적으로 영업일 기준 3~7일 이내에 환불 처리됩니다.<br>
								또한 환불금액이 0원인 경우에는 100% 수수료가 부과된 경우일 수 있습니다. 확인해 주세요.
								</li>
							</ul>
							<p class='answerP'>▶ 시일이 걸리는 경우 다음과 같은 사유를 확인해 주세요.</p>
							<ul>
								<li>카드 결제 : 카드사의 한도 복원이 필요한 경우</li>
								<li>계좌이체 : 은행 계좌 입금에 시일이 소요되는 경우</li>
								<li>휴대폰 소액결제 : 결제월과 환불월이 다른 경우</li>
							</ul>
							<p class='answerP'>특히, 휴대폰 소액결제 취소 시 결제월과 환불월이 다른 경우에는 원 결제수단으로 환불이 불가능하므로 번거로우시겠지만 바이인 호텔 고객센터(1533-3152)로 문의해 주세요.</p>
							<p class='answerP'>각 결제수단에서 정상적으로 취소되었는지 확인이 어려우신 경우에는 고객센터로 문의해 주시면 확인이 가능하며, 정상 취소 후에도 환불 및 입금이 지연되는 경우에는 각 카드사 및 은행으로의 문의가 필요하므로 이용에 참고해 주세요.</p>
							</td>				
						</tr>
						<tr class='noticeQuestion'>
							<th><span>[변경/취소/환불]</span> '취소수수료' 규정에 대해 자세히 알고 싶어요.</th>
							<td><span id="aro"><img src="../images/arr5.png"></span></td>
						</tr>
						<!-- 숨겨진 답변 상세보기 -->
						<tr class="noticeAnswer">
							<td>
							<ul>
								<li>
								취소 규정이 적용되는 기준일은 입실일입니다.<br>
								취소수수료는 판매금액을 기준으로 계산됩니다.
								</li>
							</ul>
							<p class='answerP' style='padding-top: 20px;'>※ 취소수수료 유형</p>
							<p class='answerNum'>1. 사용자 과실로 인한 취소 유형</p>
							<ul>
								<li>사용자에 의한 취소 유형으로 당일 예약 취소와 부분 취소에 대해 안내드리겠습니다.<br>
									부분 취소는 연박 예약 시에만 가능하며, 제휴점 취소 규정에 따라 일자별 수수료가 부과될 수 있습니다.<br>
									당일 예약 건은 원칙적으로 취소가 불가하며, 당일 예약 무료 취소 가능 제휴점에 한하여 취소 가능합니다.<br>
									당일 예약 무료 취소 가능 제휴점의 경우 다음 조건을 충족한 상태에서 상담사에게 문의하셔야만 취소가 가능합니다.</li>
							</ul>
							<p class='answerP'>▶ 모텔 & 호텔</p>
							<ul>
								<li>예약 완료 시점으로부터 1시간 이내 바이인 호텔 앱/웹을 통해 취소 시 전액 환불</li>
								<li>단, 1시간 이내라도 입실시간 경과 시 취소 불가</li>
								<li>입실시간 경과 후 발생한 예약에 한하여 모텔 15분 이내 고객센터를 통해 취소 가능</li>
							</ul>
							<p class='answerNum'>2. 제휴점 과실로 인한 취소 유형</p>
							<ul>
								<li>오버부킹 취소 시, 별도의 취소수수료는 발생하지 않습니다.<br>
									다만, 전산상으로 자동 취소가 되지 않으므로 직접 취소를 진행할 경우 취소수수료가 부과될 수 있으니 상담사에게 문의하시면 안내해 드리겠습니다.</li>
							</ul>
							<p class='answerNum'>3. 천재지변으로 인한 취소 유형</p>
							<ul>
								<li>천재지변으로 숙소 방문이 어려우신 경우 상담사에게 문의하시면 안내해 드리겠습니다.<br>
									단, 제휴점과의 마찰로 인한 조기 퇴실 및 일방적인 취소, 부분 취소는 어렵다는 점 양해 부탁드립니다</li>
							</ul>
							<p class='answerP'>※ 취소수수료 계산 기준</p>
							<ul>
								<li>PG 사를 통한 현금 결제 금액 -> 포인트 사용금액 -> 쿠폰 또는 제휴사 포인트 할인금액 순으로 부과됩니다.</li>
								<li>단, 취소수수료 금액이 실 결제금액(현금/PG 결제금액+포인트 사용금액) 을 초과 발생하는 경우, 초과되는 취소 수수료 금액에 대해서는 사용된 쿠폰 또는 제휴사 포인트 반환 정책을 따릅니다.</li>
							</ul>
							<p class='answerP'>▶연박 예약 건의 취소 시, 취소 일시를 기준으로 일할 계산됩니다.</p>
							<p class='answerP'>▶예약 정보 변경을 위한 결제 취소 시에도 취소수수료가 부과됩니다.</p>
							
							<p class='answerP'>※ 제휴사 포인트 반환</p>
							<p class='answerP'>통신사 멤버십 포인트를 사용한 할인 금액 중,</p>
							<ul>
								<li>취소수수료로 부과되는 금액이 없는 경우: 사용 시 차감된 통신사 멤버십 포인트 전액 반환</li>
								<li>일부만 취소수수료 부과되는 경우: 사용 시 차감된 통신사 멤버십 포인트 전액 반환</li>
								<li>전액이 취소수수료로 부과되는 경우: 사용 시 차감된 통신사 멤버십 포인트 전액 비 반환<br>
								단, 통신사 멤버십 포인트 반환은 2~3일 정도 소요될 수 있습니다.</li>
							</ul>
							</td>				
						</tr>
						<tr class='noticeQuestion'>
							<th><span>[변경/취소/환불]</span> 예약한 상품을 취소하고 싶어요.</th>
							<td><span id="aro"><img src="../images/arr5.png"></span></td>
						</tr>
						<!-- 숨겨진 답변 상세보기 -->
						<tr class="noticeAnswer">
							<td>
							<p class='answerP'>예약한 상품은 아래의 경로를 통해 취소 요청할 수 있습니다.</p>
							<ul>
								<li>내 정보 > [예약 내역] 버튼 클릭 > 취소할 예약 내역 버튼 클릭 > 최하단 우측의 [예약취소] 버튼 클릭 > 취소할 상품 선택 후 취소 수수료 및 환불 금액 확인 > 약관 확인 및 동의 후 [예약취소] 버튼 클릭하여 취소 요청</li>
							</ul>
							<p class='answerP'>※ 단, '이용 완료/취소 요청 중/취소 완료' 상태인 상품은 취소 요청이 불가합니다.<br>
							이미 이용이 완료된 상품을 취소 요청할 경우, 취소 요청 중 상태에서 이용 완료 상태로 변경될 수 있습니다.</p>
							</td>				
						</tr>
					</table>
					
					<div class="paging">
						<div class="pagination inner" id='pagination' style='text-align: center;'>
						
						</div>
					</div>
					<!-- 고객센터 정보 div -->
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
	/* faq 제목 클릭시 답변 toggle */
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