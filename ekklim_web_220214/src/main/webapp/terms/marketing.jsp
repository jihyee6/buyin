<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.t_text{
width: 1200px;
margin-left: 365px;
}

hr{
border: 1px solid #707070;
margin: 20px auto;
}

.t_text h4{
font-size: 32px;
font-weight: bold;
font-family: NanumSquare_ac;
color: #242424;
}

.t_button{
margin: 10px auto;
}

.t_button button{
width: 170px;
height: 50px;
border: 1px solid #707070;
font-size: 18px;
font-family: NanumSquare;
background: white;
color: #242424;
margin-right: 10px;
cursor: pointer;
}

.language{
margin-top: 30px;
display: flex;
}

.language div{
border: 1px solid #C2C2C2;
width: 600px;
height: 65px;
font-size: 22px;
font-family: NanumSquare_ac;
color: #D2D2D2;
text-align: center;
cursor: pointer;
}

.terms_text{
font-family: NanumSquare_ac;
font-color: #242424;
font-size: 16px;
width: 1200px;
}

.terms_text h3{
font-size: 32px;
font-weight: bold;
}

.terms_text p{
line-height: 25px;
}


</style>

</head>
<body>
	<div class="t_text">
		<h4>약관 및 정책</h4>
		<hr>
		<div class="t_button">
			<button type="button" onclick="location.href='termsofuse'">이용약관</button>
			<button type="button" onclick="location.href='privacy'" >개인정보처리방침</button>
			<button type="button" onclick="location.href='emailcollection'" >이메일무단수집거부</button>
			<button type="button" onclick="location.href='marketing'"style="background: #707070; color: white; ">마케팅활용동의</button>
		</div>
		<div class="language">
			<div class="korean" onclick="location.href='marketing'" style="border: 1px solid #707070; border-top: 3px solid #C3A58A; color: #242424; "><p>한글</p></div>
			<div class="english" onclick="location.href='englishmarketing'"><p>영문</p></div>
		</div>
		<div class="terms_text">
		<h3>마케팅 활용 동의</h3>
		<p>
<br>

① 수집 항목<br>
- 연락처 정보 : 휴대전화, 이메일, 주소<br>
 <br>
② 이용 목적<br>
- 서비스 및 프로모션 이벤트 정보 안내 등 마케팅 활동 자료로 활용<br>
 <br>
③ 보유 기간<br>
- 회원탈퇴 시 또는 별도 거부의 요청시까지<br>
 <br>
④ 수집 방법<br>
- 홈페이지<br>
 <br>
A.C.C디자인호텔 마케팅 활동에 대한 활용을 목적으로 하는 동의서입니다.<br>
본 내용에 대해 동의 하지 않으시면 회원가입 및 서비스 이용이 불가능 합니다.<br>
비동의 시 A.C.C디자인호텔의 상품과 혜택에 대한 다양한 정보를 받아보실 수 없습니다.​ <br>
<br>
		</p>
		
		
		
		</div>

	</div>
</body>
</html>