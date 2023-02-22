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
	font-size: 16px;
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
				<!-- 더보기 사이드바 div -->
				<aside>
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
						<button type="button" onclick="location.href='youth'">청소년보호정책</button>
						<button type="button" onclick="location.href='locationterms'"  style="background: #707070; color: white;">위치정보이용약관</button>
						<button type="button" onclick="location.href='cancelpolicy'">취소규정</button>
					</div>
						<!-- 약관 내용 div -->
						<div class="terms_text">
						<h3>위치정보 이용약관</h3>
							<p>
								제 1 조 (목적) <br>
								본 약관은 ㈜잘래(이하 "회사"라 합니다)가 운영, 제공하는 위치기반서비스(이하 “서비스”)를 이용함에 있어 회사와 고객 및 개인위치정보주체의 권리, 의무 및 책임사항에 따른 이용조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다. <br>
								<br>
								제 2 조 (이용약관의 효력 및 변경) <br>
								1. 본 약관은 서비스를 신청한 고객 또는 개인위치정보주체가 본 약관에 동의하고 회사가 정한 소정의 절차에 따라 서비스의 이용자로 등록함으로써 효력이 발생합니다. <br>
								2. 신청자가 모바일 단말기, PC 등에서 약관의 "동의하기" 버튼을 선택하였을 경우 본 약관의 내용을 모두 읽고 이를 충분히 이해하였으며, 그 적용에 동의한 것으로 봅니다.<br> 
								3. 회사는 위치정보의 보호 및 이용 등에 관한 법률, 콘텐츠산업 진흥법, 전자상거래 등에서의 소비자보호에 관한 법률, 소비자 기본법 약관의 규제에 관한 법률 등 관련 법령을 위배하지 않는 범위에서 본 약관을 변경할 수 있습니다. <br>
								4. 회사가 약관을 변경할 경우에는 홈페이지 공지사항란 또는 별도의 창을 통하여 변경내용 및 변경 이유를 명시하여 지체없이 공지하고, 개정 내용이 이용자에게 불리한 경우에는 그 적용일자 30일 전부터 적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 게시하거나 이용자에게 전자적 형태(전자우편, SMS 등)로 약관 개정 사실을 발송하여 고지합니다.<br> 
								5. 회사가 전항에 따라 회원에게 통지하면서 공지일로부터 적용일 7일 후까지 거부의사를 표시하지 아니하면 개정 약관에 승인한 것으로 간주합니다. 회원이 개정 약관에 동의하지 않을 경우 회원은 이용계약을 해지할 수 있습니다.<br>
								<br>
								제 3 조 (관계법령의 적용) <br>
								본 약관은 신의성실의 원칙에 따라 공정하게 적용하며, 본 약관에 명시되지 아니한 사항에 대하여는 관계법령 또는 상관례에 따릅니다. <br>
								<br>
								제 4 조 (서비스의 내용) <br>
								회사는 위치정보사업자로부터 제공받은 위치정보수집대상의 위치정보 및 상태 정보를 이용하여 다음과 같은 내용으로 서비스한다. <br>
								1. 위치정보수집대상의 실시간 위치확인<br>
								2. 이용자의 위치에서 근접한 상가, 근린시설, 업소정보 제공<br>
								<br>
								제 5 조 (서비스내용변경 통지) <br>
								1. 회사가 서비스 내용을 변경하거나 종료하는 경우 회사는 등록된 전자우편 주소로 이메일을 통하여 서비스 내용의 변경 사항 또는 종료를 통지할 수 있습니다.<br>
								2. 1항의 경우 불특정 다수인을 상대로 통지를 함에 있어서는 웹사이트 등 기타 회사의 공지사항을 통하여 회원에게 통지할 수 있습니다. <br>
								<br>
								제 6 조 (서비스이용의 제한 및 중지) <br>
								1. 회사는 이용자가 다음 각호에 해당하는 경우에는 회원의 서비스 이용을 제한하거나 중지시킬 수 있습니다.<br>
								1) 회원이 회사 서비스의 운영을 고의 또는 중과실로 방해하는 경우<br>
								2) 서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우<br>
								3) 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우<br>
								4) 국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 때<br>
								5) 기타 중대하 사유로 인하여 회사가 서비스 제공을 지속하는 것이 부적당하다고 인정하는 경우<br>
								2. 회사는 전항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한기간 등을 회원에게 알려야 합니다.<br>
								<br>
								제 7 조 (서비스 이용요금) <br>
								고객은 본 서비스를 무료로 이용할 수 있습니다. 다만 위치정보를 확인하기 위하여 이동통신망에 접속할 때 발생하는 비용인 통신요금이 발생할 수 있습니다. 통신 요금은 고객의 데이터 사용량, 이동통신사 등에 따라 변동될 수 있습니다. <br>
								<br>
								제 8 조 (개인위치정보의 이용 또는 제공) <br>
								1. 회사는 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 미리 이용약관에 명시한 후 개인위치정보주체의 동의를 얻어야 합니다.<br>
								2. 회원 및 법정대리인의 권리와 그 행사방법은 제소 당시의 이용자의 주소에 의하며, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br>
								3. 회사는 타사업자 또는 이용 고객과의 요금정산 및 민원처리를 위해 위치정보 이용, 제공, 사실 확인자료를 자동 기록 및 보존하며, 해당 자료는 1년간 보관합니다.<br>
								4. 회사는 개인위치정보를 회원이 지정하는 제 3자에게 제공하는 경우에는 개인위치정보를 수집한 당해 통신 단말장치로 매 회 회원에게 제공받는 자, 제공 일시 및 제공목적을 즉시 통보합니다. 단, 아래 각호의 1에 해당하는 경우에는 회원이 미리 특정하여 지정한 통신 단말장치 또는 전자우편주소로 통보합니다.<br>
								1) 개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우<br>
								2) 개인위치정보주체가 온라인 게시 등의 방법으로 통보할 것을 미리 요청한 경우<br>
								<br>
								제 9 조 (개인위치정보주체의 권리) <br>
								1.회원은 회사에 대하여 언제든지 개인위치정보를 이용한 위치기반서비스 제공 및 개인위치정보의 제 3자 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 이 경우 회사는 수집한 개인위치정보 및 위치정보 이용, 제공사실 확인자료를 파기합니다.<br>
								2. 회원은 회사에 대하여 언제든지 개인위치정보의 이용 또는 제공의 일시적인 중지를 요구할 수 있습니다. 이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 조치를 취합니다. <br>
								3. 회사에 대해 아래 각 호의 자료에 대한 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다. <br>
								1) 개인위치정보주체에 대한 위치정보 이용•제공사실 확인자료 <br>
								2) 개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법률의 규정에 의해 제3자에게 제공된 이유 및 내용<br>
								4. 회원은 제1항 내지 제3항의 권리행사를 위해 회사 소정의 절차를 통해 회사에 요구할 수 있습니다. <br>
								<br>
								제 10 조 (법정대리인의 권리) <br>
								1. 회사는 14세 미만 아동의 개인위치정보를 이용. 제공하고자 하는 경우(개인위치정보주체가 지정하는 제3자에게 제공하는 서비스를 하고자 하는 경우 포함)에는 14세 미만의 아동과 그 법정대리인의 동의를 받아야 합니다. 이 경우 법정대리인은 제9조에 의한 회원의 권리를 모두 가집니다.<br>
								2. 회사는 14세 미만의 아동의 개인위치정보 또는 위치정보 이용, 제공사실 확인자료를 이용약관에 명시 또는 고지한 범위를 넘어 이용하거나 제3자에게 제공하고자 하는 경우에는 14세미만의 아동과 그 법정대리인의 동의를 받아야 합니다. 단, 아래의 경우는 제외합니다.<br>
								1) 위치정보 및 위치기반서비스 제공에 따른 요금정산을 위하여 위치정보 이용, 제공사실 확인자료가 필요한 경우<br>
								2) 통계작성, 학술연구 또는 시장조사를 위하여 특정 개인을 알아볼 수 없는 형태로 가공하여 제공하는 경우 <br>
								<br>
								제 11 조 (8세 이하의 아동 등의 보호의무자의 권리) <br>
								1. 회사는 아래의 경우에 해당하는 자(이하 “8세 이하의 아동”등이라 한다)의 보호의무자가 8세 이하의 아동 등의 생명 또는 신체보호를 위하여 개인위치정보의 이용 또는 제공에 동의하는 경우에는 본인의 동의가 있는 것으로 봅니다. <br>
								1) 8세 이하의 아동<br>
								2) 금치산자<br>
								3) 장애인복지법제2조제2항제2호의 규정에 의한 정신적 장애를 가진 자로서 장애인고용촉진및직업재활법 제2조제2호의 규정에 의한 중증장애인에 해당하는 자(장애인복지법 제29조의 규정에 의하여 장애인등록을 한 자에 한한다) <br>
								2. 8세 이하의 아동 등의 생명 또는 신체의 보호를 위하여 개인위치정보의 이용 또는 제공에 동의를 하고자 하는 보호의무자는 서면동의서에 보호의무자임을 증명하는 서면을 첨부하여 회사에 제출하여야 합니다. <br>
								3. 보호의무자는 8세 이하의 아동 등의 개인위치정보 이용 또는 제공에 동의하는 경우 개인위치 정보주체 권리의 전부를 행사할 수 있습니다. <br>
								<br>
								제 12 조 (위치정보관리책임자의 지정) <br>
								1. 회사는 위치정보를 적절히 관리, 보호하고 개인위치정보주체의 불만을 원활히 처리할 수 있도록 실질적인 책임을 질 수 있는 지위에 있는 자를 위치정보관리책임자로 지정해 운영합니다. <br>
								2. 위치정보관리책임자는 위치기반서비스를 제공하는 부서의 부서장으로서 구체적인 사항은 본 약관의 부칙에 따릅니다. <br>
								<br>
								제 13 조 (손해배상의 범위) <br>
								1. 회사가 위치정보의보호및이용등에관한법률 15조 내지 26조의 규정의 위반한 행위로 회원에게 손해가 발생한경우회원은 회사에 대해 손해배상을 청구할 수 있습니다. 이 경우 회사는 고의 또는 과실이 없음을 입증하지 아니하면 책임을 면할 수 없습니다. <br>
								2. 회원이 본 약관의 규정을 위반하여 회사에 손해가 발생한 경우 회사는 회원에 대해 손해배상을 청구할 수 있습니다. 이 경우 회원은 고의 또는 과실이 없음을 입증하지 아니하면 책임을 면할 수 없습니다.<br>
								<br>
								제 14 조 (면책)<br>
								1. 회사는 다음 각 호의 경우로 서비스를 제공할 수 없는 경우 이로 인하여 회원에게 발생한 손해에 대해서는 책임을 부담하지 않습니다.<br>
								1) 천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우<br>
								2) 서비스 제공을 위하여 회사와 서비스 제휴계약을 체결한 제 3자의 고의적인 서비스 방해가 있는 경우<br>
								3) 회원의 귀책사유로 서비스 이용에 장애가 있는 경우<br>
								4) 제1호 내지 제3호를 제외한 기타 회사의 고의, 과실이 없는 사유로 인한 경우<br>
								2. 회사는 서비스 및 서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 회원의 손해에 대하여는 책임을 부담하지 아니합니다.<br>
								<br>
								제 15 조 (규정의 준용)<br>
								1. 본 약관은 대한민국법령에 의하여 규정되고 이행됩니다.<br>
								2. 본 약관에 규정되지 않은 사항에 대해서는 관계법령 및 상관습에 의합니다.<br>
								<br>
								제 16 조 (분쟁의 조정 및 기타) <br>
								1. 회사는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 위치정보의 보호 및 이용 등에 관한 법률 제28조 규정에 의한 방송통신위원회에 재정을 신청할 수 있습니다. <br>
								2. 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보보호법 제43조 규정에 의한 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.<br>
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