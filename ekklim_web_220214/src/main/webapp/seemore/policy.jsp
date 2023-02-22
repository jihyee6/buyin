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

.language{
	margin-top: 30px;
	display: flex;
}

.language div{
	border: 1px solid #C2C2C2;
	width: 475px;
	height: 65px;
	font-size: 22px;
	font-family: NanumSquare_ac;
	color: #D2D2D2;
	text-align: center;
	cursor: pointer;
	line-height: 65px;
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
}

.terms_text p{
	line-height: 25px;
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
				<!-- 약관 페이지 버튼 div -->
				<div class="t_button">
					<button type="button" onclick="location.href='policy'" style="background: #707070; color: white; ">이용약관</button>
					<button type="button" onclick="location.href='personal'">개인정보처리방침</button>
					<button type="button" onclick="location.href='noemail'">이메일무단수집거부</button>
					<button type="button" onclick="location.href='okmarketing'">마케팅활용동의</button>
					<button type="button" onclick="location.href='youth'">청소년보호정책</button>
					<button type="button" onclick="location.href='locationterms'">위치정보이용약관</button>
					<button type="button" onclick="location.href='cancelpolicy'">취소규정</button>
				</div>
				<!-- 약관 한글, 영문 페이지 div -->
				<div class="language">
					<div class="korean" onclick="location.href='policy'" style="border: 1px solid #707070; border-top: 3px solid  #4366A3; color: #242424; "><p>한글</p></div>
					<div class="english" onclick="location.href='englishpolicy'"><p>영문</p></div>
				</div>
				<!-- 약관 내용 div -->
				<div class="terms_text">
					<h3>이용약관</h3>
					<p>
					<br>
						제 1 장 총칙<br>
						 <br>
						제 1 조 (목적)<br>
						 <br>
						이 약관은 BUY IN HOTEL(이하 "호텔"이라 합니다)이 제공하는 BUY IN HOTEL 온라인 서비스(이하 "서비스"라 한다)의 이용 조건 및 절차에 관한 기본적인 사항을 규정함을 목적으로 합니다.<br>
						 <br>
						제 2 조 (약관의 효력 및 변경)<br>
						<br> 
						① 이 약관은 서비스 메뉴 및 호텔에 게시하여 공시함으로써 효력을 발생합니다.<br>
						② 호텔은 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로써 효력을 발생합니다.<br>
						③ 회원제서비스 이용고객은 변경된 약관 사항에 동의하지 않으면 서비스 이용을 중단하고 이용계약을 해지할 수 있습니다. 약관의 효력발생일 이후의 계속적인 서비스 이용은 약관의 변경사항에 동의한 것으로 간주됩니다.<br>
						 <br>
						제 3 조 (약관 이외의 준칙)<br>
						 <br>
						이 약관에 언급되지 않은 사항이 전기통신기본법, 전기통신사업법, 기타 관련법령에 규정되어 있는 경우 그 규정에 따라 적용할 수 있습니다.<br>
						 <br>
						제 4 조 (용어의 정의)<br>
						 <br>
						이 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br>
						 <br>
						① 회원 : 서비스를 제공받기 위하여 호텔과 이용계약을 체결하거나 이용자 아이디(ID)를 부여 받은 자를 말합니다.<br>
						② 아이디(ID) : 회원의 식별과 서비스를 이용을 위하여 회원이 정하고 호텔이 승인하는 문자와 숫자의 조합을 말합니다.<br>
						③ 비밀번호 : 회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.<br>
						④ 해지 : 호텔 또는 회원이 서비스를 개통 후 이용계약을 종료 시키는 의사표시를 말합니다.
						 <br>
						제 2 장 서비스 이용계약<br>
						 <br>
						제 5 조 (이용계약의 성립)<br>
						 <br>
						이용계약은 서비스 이용희망자의 이용약관 신청에 대하여 호텔이 승낙함으로써 성립합니다.<br>
						 <br>
						제 6 조 (이용신청)<br>
						 <br>
						① 본 서비스를 이용하기 위해서는 호텔 소정의 가입신청 양식에서 요구하는 모든 이용자 정보를 기록 하여 신청합니다.<br>
						② 본 서비스는 만 19세 이상의 성인만이 가입이 가능합니다. <br>
						③ 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며 서비스의 제한을 받을 수 있습니다.<br>
						 <br>
						제 7 조 (이용신청의 승낙)<br>
						 <br>
						① 호텔은 제6조에 따른 이용 신청 고객에 대하여 제2호, 제3호의 경우를 예외로 하여 서비스 이용신청을 승낙합니다.<br>
						② 호텔은 다음에 해당하는 경우에 그 신청에 대한 승낙 제한사유가 해소될 때까지 승낙을 유보할 수 있습니다.<br>
						가. 서비스 관련 설비의 용량이 부족한 경우<br>
						나. 기술상 장애사유가 있는 경우<br>
						다. 기타 호텔이 필요하다고 인정되는 경우<br>
						 <br>
						③ 호텔은 다음에 해당하는 경우에는 동 이용신청을 승낙하지 아니 할 수 있습니다.<br>
						 <br>
						가. 다른 사람의 명의를 사용하여 신청한 경우<br>
						나. 이용신청 시 이용자정보를 허위로 기재하여 신청한 경우<br>
						다. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우<br>
						라. 기타 호텔 소정의 이용신청요건을 충족하지 못하는 경우<br>
						 <br>
						제 8 조 (이용자정보의 변경)<br>
						 <br>
						회원은 이용신청 시 기재한 이용자정보가 변경되었을 경우에는, 온라인으로 수정을 하여야 하며 미 변경으로 인하여 발생되는 문제의 책임은 이용자에게 있습니다.<br>
						 <br>
						제 3 장 계약 당사자의 의무<br>
						 <br>
						제 9 조 (호텔의 의무)<br>
						 <br>
						① 호텔은 서비스 제공과 관련하여 취득한 회원의 개인정보를 본인의 사전 승낙 없이 타인에게 공개 또는 배포할 수 없습니다. 단, 다음 각 호의 1에 해당하는 경우는 예외입니다.<br>
						가. 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우<br>
						나. 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우<br>
						다. 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우<br>
						② 1항의 범위 내에서, 호텔은 업무와 관련하여 회원 전체 또는 일부의 개인 정보에 관한 통계 자료를 작성하여 이를 사용할 수 있고, 서비스를 통하여 회원의 컴퓨터 쿠키를 전송할 수 있습니다. 이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우저의 설정을 변경할 수 있습니다.<br>
						 <br>
						제 10 조 (회원의 의무)<br>
						 <br>
						① 회원은 서비스 이용 시 다음 각 호의 행위를 하지 않아야 합니다.<br>
						<br> 
						가. 다른 회원의 ID를 부정하게 사용하는 행위<br>
						나. 서비스에서 얻은 정보를 호텔의 사전승낙 없이 회원의 이용이외의 목적으로 복사, 복제, 변경, 번역하거나 출판 및 방송 등에 사용하거나 타인에게 제공하는 행위<br>
						다. 호텔의 저작권, 타인의 저작권 등 기타 귄리를 침해하는 행위<br>
						라. 공공질서 및 미풍양속에 위반되는 내용의 정보, 문장, 도형 등을 타인에게 유포하는 행위<br>
						마. 범죄행위를 목적으로 하거나 범죄와 결부된다고 객관적으로 판단하는 행위<br>
						바. 기타 관계법령에 위배되는 행위<br>
						② 회원은 관계법령, 이 약관에서 규정하는 사항, 서비스 이용 안내 및 주의 사항을 준수 하여야 합니다.<br>
						③ 회원은 내용별로 호텔이 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한 사항을 준수하여야 합니다.<br>
						④ 회원은 호텔의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.<br>
						 <br>
						제 4 장 제공 서비스 및 이용<br>
						 <br>
						제 11 조 (회원 아이디(ID)와 비밀번호 관리에 대한 회원의 의무)<br>
						 <br>
						아이디(ID)와 비밀번호에 대한 모든 관리는 회원에게 책임이 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 전적인 책임은 회원에게 있습니다.<br>
						자신의 아이디(ID)가 부정하게 사용된 경우 또는 기타 보안 위반에 대하여, 회원은 반드시 호텔에 그 사실을 통보해야 합니다.<br>
						 <br>
						온라인 회원가입 약관<br>
						<br> 
						제 12 조 (제공 서비스)<br>
						 <br>
						① 호텔은 회원의 서비스 이용 중 필요가 있다고 인정되는 다양한 점에 대해서 전자메일이나 서신우편등의 방법으로 회원에게 제공할 수 있으며, 회원은 원하지 않을 경우 가입신청 메뉴와 회원정보수정 메뉴에서 정보수신거부를 할 수 있습니다.<br>
						② 호텔은 온라인 커뮤니티 서비스를 제공하며, 이는 회원이 원할 경우에만 직접 가입하여 활동할 수 있습니다.<br>
						 <br>
						제 13 조 (광고주와의 거래)<br>
						 <br>
						호텔은 본 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않습니다.<br>
						 <br>
						제 14 조 (회원의 게시물)<br>
						 <br>
						호텔은 회원이 본 서비스를 통하여 게시, 게재, 전자메일 또는 달리 전송한 내용물에 대하여 책임을 지지 않으며, 다음 각 호의 1에 해당한다고 판단되는 경우에 사전통지 없이 삭제할 수 있습니다.<br>
						 <br>
						① 다른 회원이나 타인을 비방하거나, 프라이버시를 침해하거나, 중상모략으로 명예를 손상시키는 내용인 경우.<br>
						② 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 경우<br>
						③ 범죄적 행위에 관련된다고 인정되는 내용일 경우<br>
						④ 호텔의 지적재산권, 타인의 지적재산권 등 기타 권리를 침해하는 내용인 경우<br>
						⑤ 호텔에서 규정한 게시기간을 초과한 경우<br>
						⑥ 기타 관계법령에 위반된다고 판단되는 경우<br>
						 <br>
						제 15 조 (게시물에 대한 권리 및 책임)<br>
						 <br>
						게시물에 대한 저작권을 포함한 모든 권리 및 책임은 이를 게시한 회원에게 있습니다.<br>
						 <br>
						제 16 조 (서비스 이용 책임)<br>
						 <br>
						회원은 서비스를 이용하여 불법 상품을 판매하는 영업 활동을 할 수 없으며 특히 해킹, 돈 벌기 광고, 음란사이트를 통한 상업행위, 상용 S/W 불법배포 등을 할 수 없습니다. <br>
						이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치등에 관해서는 호텔이 책임을 지지 않습니다.<br>
						<br> 
						제 17 조 (서비스 제한 및 정지)<br>
						 <br>
						호텔은 전시, 사변, 천재지변 또는 이에 준하는 국가비상사태가 발생하거나 발생할 우려가 있는 경우와 전기통신사업법에 의한 기간통신 사업자가 전기통신서비스를 중지하는 등 기타 불가항력적 사유가 있는 경우에는 서비스의 전부 또는 일부를 제한 하거나 정지할 수 있습니다. 호텔은 제1항의 규정에 의하여 서비스의 이용을 제한하거나 정지한 때에는 그 사유 및 제한기간 등을 지체 없이 회원에게 알려야 합니다.<br>
						 <br>
						제 5 장 기타<br>
						 <br>
						제 18 조 (계약해지 및 이용제한)<br>
						 <br>
						① 회원이 이용계약을 해지하고자 하는 때에는 회원 본인이 호텔에 해지신청을 하여야 합니다.<br>
						② 호텔은 회원이 다음 각 호의 1에 해당하는 행위를 하였을 경우 사전통지 없이 이용계약을 해지하거나 또는 기간을 정하여 서비스 이용을 제한하거나 중지할 수 있습니다.<br>
						가. 타인의 서비스 ID 및 비밀번호를 도용한 경우<br>
						나. 서비스의 안정적인 운영을 방해한 경우<br>
						다. 공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우<br>
						라. 회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스이용을 계획 또는 실행하는 경우<br>
						마. 타인의 지적재산권을 침해하는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송 하여 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우<br>
						바. 수신자의 의사에 반하는 음란, 저속, 위협적인 내용이나 광고성 정보, 전자우편 등을 지속적으로 전송하는 경우<br>
						사. 정보통신설비의 오 작동이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스프로그램 등을 유포하는 경우<br>
						아. 호텔, 다른 회원 또는 타인의 지적재산권을 침해하는 경우<br>
						자. 정보통신윤리위원회 등 외부기관의 시정요구가 있거나 불법선거 운동과 관련하여 선거관리위원회의 유권해석을 받은 경우<br>
						차. 타인의 개인정보, 이용자ID 및 비밀번호를 부정하게 사용하는 경우<br>
						카. 호텔의 서비스 정보를 이용하여 얻은 정보를 호텔의 사전 승낙 없이 복제 또는 유통시키거나 상업적으로 이용하는 경우<br>
						타. 전기통신 관련법령 등에 위배되는 경우<br>
						파. 본 약관을 포함하여 기타 호텔이 정한 이용조건 및 관계법령에 위반한 경우<br>
						 <br>
						제 19 조 (손해배상)<br>
						 <br>
						호텔은 서비스 요금이 무료인 동안의 서비스 이용과 관련하여 회원에게 발생한 어떠한 손해에 관하여도 책임을 지지 않습니다.<br>
						 <br>
						제 20 조 (면책조항)<br>
						 <br>
						① 호텔은 천재지변 도는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.<br>
						② 호텔은 회원의 귀책사유로 인하여 서비스 이용의 장애가 발생한 경우에는 책임이 면제됩니다.<br>
						③ 호텔은 회원이 호텔의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사 선택 또는 이용으로 발생하는 손해 등에 대해서는 책임이 면제됩니다.<br>
						 <br>
						④ 호텔은 회원이 서비스에 게재한 정보, 자료, 사실의 정확성, 신뢰성 등 그 내용에 관하여는 책임이 면제되고, 회원은 자기의 책임아래 서비스를 이용하며, 서비스를 이용하여 게시 또는 전송한 자료 등에 관하여 손해가 발생하거나 자료의 취사선택, 기타 서비스 이용과 관련하여 어떠한 불이익이 발생 하더라도 이에 대한 모든 책임은 회원에게 있습니다.<br>
						⑤ 호텔은 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임이 면책됩니다.<br>
						⑥ 회원 아이디(ID)와 비밀번호의 관리 및 이용상의 부주의로 인하여 발생되는 손해 또는 제3자에 의한 부정사용 등에 대한 책임은 모두 회원에게 있습니다.<br>
						 <br>
						제 21 조 (관할법원)<br>
						 <br>
						본 약관 상의 분쟁에 대해 소송이 제기될 경우 호텔의 본사 소재지를 관할하는 법원을 전속 관할법원으로 합니다.<br>
						<br> 
						본 약관은 2014년 9월 12일부터 시행합니다<br>​
						<br>		
					</p>	
				</div>
			</div>
		</div>			
	</div>
</div>
		<%@include file="../footer.jsp"%>
	</div>

</body>
</html>