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
			<button type="button" onclick="location.href='emailcollection'" style="background: #707070; color: white; ">이메일무단수집거부</button>
			<button type="button" onclick="location.href='marketing'">마케팅활용동의</button>
		</div>
		<div class="language">
			<div class="korean" onclick="location.href='emailcollection'" ><p>한글</p></div>
			<div class="english" onclick="location.href='englishemail'" style="border: 1px solid #707070; border-top: 3px solid #C3A58A; color: #242424; "><p>영문</p></div>
		</div>
		<div class="terms_text">
		<h3>Refusing to collect emails without permission</h3>
		<p>

<br>

Please note that e-mail addresses posted on this site will be refused to be collected without permission using e-mail collection programs or other technical devices, and that violations will be criminally punished under the Information and Communication Network Act.<br>
<br>
Related laws and regulations - Act on Promotion of Information and Communication Network Utilization and Information Protection, etc.<br>
<br>
Article 50-2 (Prohibition of unauthorized collection of e-mail addresses, etc.)<br>
① No one shall collect e-mail addresses using programs or other technical devices that automatically collect e-mail addresses from the Internet homepage without prior consent from the operator or administrator of the Internet homepage.<br>
② No one shall sell or distribute e-mail addresses collected in violation of paragraph (1).<br>
③ No one shall use it for information transmission, knowing that it is an e-mail address prohibited from collecting, selling, and distributing pursuant to paragraphs (1) and (2).<br>
<br>
		</p>
		
		
		
		</div>

	</div>
</body>
</html>