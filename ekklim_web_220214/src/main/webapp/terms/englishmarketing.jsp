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
			<div class="korean" onclick="location.href='marketing'" ><p>한글</p></div>
			<div class="english" onclick="location.href='englishmarketing'" style="border: 1px solid #707070; border-top: 3px solid #C3A58A; color: #242424; "><p>영문</p></div>
		</div>
		<div class="terms_text">
		<h3>Agree to use margketing</h3>
		<p>
<br>

① Collected items.<br>
- Contact information : Mobile phone, e-mail, address.<br>
② Purpose of using it.<br>
- It is used as data for marketing activities such as information on services and promotional events.<br>
③ The retention period.<br>
- If you withdraw from the membership or if you request a separate rejection<br>
④ How to collect.<br>
- Homepage<br>
<br>
This is an agreement for the purpose of using A.C.C. Design Hotel marketing activities.<br>
If you do not agree with this, you will not be able to sign up for membership or use the service.<br>
If you disagree, You can't receive various information on the products and benefits of the A.C.C Design Hotel.<br>

<br>
		</p>
		
		
		
		</div>

	</div>
</body>
</html>