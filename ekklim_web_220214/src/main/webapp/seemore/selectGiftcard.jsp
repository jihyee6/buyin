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
.giftcardTitle{
	width:100%;
	position: relative;
}
.giftcardTitleImg{
	width: 1903px;
	vertical-align: middle;
}
.giftTitleText{
	position: absolute;
	top: 30%;
	left: 50%;
	transform: translate(-50%, -50%);
	text-align: center;
}

.giftTitleText h4{
	font-size: 62px;
	font-family: welcome;
	color: #FFFFFF;
	text-shadow: 1px 1px 2px #000000;
	
}
.selectGift{
	width: 1200px;
	margin-top: 60px;
}
.selectGift h4{
	margin: 18px auto;
	font-family: NanumSquare_ac;
	font-size: 26px;
	color: #242424;
}
.selectGift hr{
	color: #535353;
}

.giftcardSection{
	/* width: 97%; */
	margin-top: 10px;
}

.giftType{
	width: 226px;
	display: inline-block;
	margin: 26px 36px;
	cursor: pointer;
}

.giftType p{
	line-height: 28px;
	text-align: center;
	font-family: NotoSansM;
}

.giftType img{
	margin-bottom: 10px;
	width: 226px;
	height: 141px;
}

.cardType{
	color:#242424;
	font-size: 18px;
	
}

.giftType> .cardPrice{
	font-size: 20px;
	color: #303030;
	font-family: NotoSansB;
}

.provider{
	color: #707070;
	font-size: 16px;
}

.num{
	margin: 25px 0px 0px 388px;
}

.num img{
	height: 28px;
	margin: 0px;
	margin-left: 245px;
	height: 18px;
}

.num p{
	margin: auto 10px;
}

.num p img{
	margin-left: 10px;
}
</style>

</head>
<body>
	<div class="page">
		<%@include file="../header.jsp"%>	
		<div class="content">
		<!-- 기프트카드 제목 -->
			<div class="giftCardTitle">
				<!-- 기프트카드 배경이미지 -->
				<div class="giftcardTitleImg">
					<!-- 기프트카드 이미지 -->
					<img src="../images/giftcards/buyinGiftTitle.png" style='width: 1903px;'>
				</div>
			
				<!-- <div class="giftTitleText">
				<h4>GIFT CARD</h4>
				<h4>이끌림 모바일 상품권</h4>
				</div>	 -->		
			</div>
			
			<!-- 기프트카드 선택 -->
			<div class="selectGift">
				<h4>선물 선택</h4>
				<hr>
				<!-- 기프트카드 나열부분 -->
				<div class="giftcardSection">
					<!-- 기프트카드 종류 append -->
					<!-- <div class="giftType" onclick="location.href='giftDescription'">
						<img alt="기프트카드사진" src="../images/giftcards/giftcard3.png">
						<p class="cardType">기프트카드 30,000원권</p>
						<p class="cardPrice">30,000원</p>
						<p class="provider">이끌림</p>
					</div>
					기프트카드 종류 하나 끝
 -->				
				</div>
				<hr>
		</div>

		<%@include file="../footer.jsp"%>
	</div>

	<script>
	var user_id = '<%=id%>';
	
	$(function() {
		/* 기프트카드 종류 data ajax */
		$.ajax({
			url : "../giftcards", // 컨트롤러 위치
			type : "GET",
			dataType : 'JSON',
			// beforeSend = Header 먼저 보내주는부분 
			beforeSend: function (xhr) {
	            xhr.setRequestHeader("user", user_id);
	        },
			success : function(result){
				
				if(result.message == 'Success'){
					data = result.data;
					console.log(data);	
					
					giftcards();
					
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
				alert("검색실패options");
				return false;
			}
		})
	})
	
	</script>

<script>
/* 기프트카드 종류 append */
function giftcards(){
	for(var i=0; i < data.length; i++){
		$('.giftcardSection').append(
			"<div class='giftType' id = '" + data[i].giftcard_id + "'>"
				+"<img alt='기프트카드사진'  src='" + data[i].giftcard_img_url + "'>"
				+"<p class='cardType'>" + data[i].giftcard_name + "</p>"
				+"<p class='cardPrice'><span>" +data[i].giftcard_price.toLocaleString('en') + "</span>원</p>"
				+"<p class='provider'>BUY IN HOTEL</p>"
			+"</div>"
		)
	}
}
	/* 기프트카드 선택시 기프트카드 상세보기 페이지로 이동 */
	$(document).on('click', '.giftType', function() {
		// 클릭한 giftBox의 id를 가져오는거
		var giftcard_id = $(this).attr('id');
		//기프트카드 상세보기 페이지로 이동
		location.href = 'giftDescription?giftcard_id=' + giftcard_id;
	})

</script>
</body>
</html>