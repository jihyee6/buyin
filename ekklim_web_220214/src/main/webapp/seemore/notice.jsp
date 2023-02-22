<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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

.tabmenu {
	max-width: 860px;
	margin: 0 auto;
	position: relative;
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
	padding: 18px 0px;
	width: 903px;
	text-align: left;
}

.paging{
	margin-top: 32px;
}

.inner a{
	text-decoration: none;
	float: left;
	color: #707070;
	font-size: 18px;
}
.inner ul{
	list-style: none;
	float: left;
	padding: 0;
	font-size: 20px;
	font-family: NanumSquare_ac;
}
.inner ul li{
	float: left;
	margin: 0px 10px;
}
.waitingBox{
	text-align: center;
	margin-top: 72px;
}
.waitingTxt{
	font-size: 30px;
	color: #707070;
	margin-top: 20px;
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
							<div class="navside" onclick="location.href='notice'" style="background-color: #4366A3;">
								<div class="navitem" id="notice">
									<span class="textmenu"  style="color: #FFFFFF;">공지사항</span> <img src="../images/mainimg/blackpoint.png" alt="arr"	class="arrow">
								</div>
							</div>
							<div class="navside" onclick="location.href='selectGiftcard'">
								<div class="navitem" id="notice">
									<span class="textmenu">선물하기</span>
								</div>
							</div>
							<div class="navside" onclick="location.href='event'">
								<div class="navitem" id="event">
									<span class="textmenu">이벤트</span> 
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
				<div class="maintitle">공지사항</div>
				<div class="tabmenu">
				<!-- 공지사항 테이블 append-->
				<!-- <table class="notable">
					<tr class='noticeQuestion'>
						<th>[공지] 고객센터 이용 지연 안내<br>
							<div class="ndate">2022.01.01</div></th>
								<td><span class='detailArr' id="aro"><img alt="" src="../images/arr5.png"></span></td>
					</tr>
					<tr class="noticeAnswer">
						<td>요약상세</td>				
					</tr>
				</table> -->
				<!-- 준비중 문구 -->
				<div class='waitingBox'>
					<img src = '../images/icon/cancelIcon.png'>
					<h4 class='waitingTxt'>준비중 입니다.</h4>
				</div>
				
				<!-- 페이징 함수 -->
					<!-- <div class="paging">
						<div class="pagination inner" id='pagination' style='text-align: center;'>
						
						</div>
						
					</div> -->
				</div>
			</div>
		</div>
	</div>
		<%@include file="../footer.jsp"%>
</div>
<script>
$(function() {
	page();
})
/* 페이징 함수 */
function page() {	
	// ****더 중요한점 테이블 이름 적어줘야함!!
    $('table.notable').each(function () {
        var pagesu = 10;  //페이지 번호 갯수
        var currentPage = 0;
        var numPerPage = 10;  //목록의 수
        var $table = $(this);
        var pagination = $("#pagination");

        //length로 원래 리스트의 전체길이구함
        var numRows = $table.find('tr').length;

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
            $table.find('tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
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

<script>
	/* 공지제목 클릭시 답변 div 토글됨 */
	$('.noticeQuestion').click(function(){
		$(this).next().toggle();
	})
</script>

</body>
</html>