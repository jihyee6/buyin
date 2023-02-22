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
	color: #242424;
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
			<!-- 약관 페이지 이동 버튼 div -->
			<div class="t_button">
				<button type="button" onclick="location.href='policy'" style="background: #707070; color: white; ">이용약관</button>
				<button type="button" onclick="location.href='personal'">개인정보처리방침</button>
				<button type="button" onclick="location.href='noemail'">이메일무단수집거부</button>
				<button type="button" onclick="location.href='okmarketing'">마케팅활용동의</button>
				<button type="button" onclick="location.href='youth'">청소년보호정책</button>
				<button type="button" onclick="location.href='locationterms'">위치정보이용약관</button>
				<button type="button" onclick="location.href='cancelpolicy'">취소규정</button>
			</div>
			<!-- 약관 한글/영문버전 선택 버튼 div -->
		<div class="language">
			<div class="korean" onclick="location.href='policy'" ><p>한글</p></div>
			<div class="english" onclick="location.href='englishpolicy'" style="border: 1px solid #707070; border-top: 3px solid #4366A3; color: #242424; "><p>영문</p></div>
		</div>
		<!-- 약관 내용 보여주는 div -->
		<div class="terms_text">
		<h3>Terms and conditions</h3>
			<p>
			<br>
				Chapter 1. General Rules.<br>
				<br>
				Article 1 (Purpose)<br>
				<br>
				These terms and conditions are aimed at stipulating basic matters concerning the terms and procedures of use of the BUY IN HOTEL online service (hereinafter referred to as "service") provided by the BUY IN HOTEL (hereinafter referred to as "hotel").<br>
				<br>
				Article 2 (Effective and amended terms and conditions)<br>
				<br>
				① These terms and conditions take effect by posting them on the service menu and hotel.<br>
				② The hotel may change the contents of these terms and conditions, and the changed terms and conditions take effect by notifying or notifying in the same way as in paragraph 1.<br>
				③ Customers who use the membership service can stop using the service and terminate the contract if they do not agree to the changed terms and conditions. Continuous service use after the effective date of the terms and conditions is considered to have agreed to the changes in the terms and conditions.<br>
				<br>
				Article 3 (Regulations other than Terms and Conditions)<br>
				<br>
				Matters not mentioned in these terms and conditions may be applied in accordance with the provisions of the Framework Act on Telecommunications, the Telecommunications Business Act, and other relevant laws.<br>
				<br>
				Article 4 (Definition of Terms)<br>
				<br>
				The definitions of terms used in these terms and conditions are as follows.<br>
				① Member: It refers to a person who has signed a contract with a hotel or has been given a user ID to receive services.<br>
				② ID: It refers to a combination of letters and numbers determined by a member and approved by a hotel for the identification of members and use of services.<br>
				③ Password: It refers to a combination of letters and numbers set by a member to confirm that the member is a member that matches the ID given and to protect the member's own secret.<br>
				④ Cancellation: It refers to an expression of intention for a hotel or member to terminate the service contract after opening the service.<br>
				<br>
				Chapter 2. Contract for Service Use.<br>
				<br>
				Article 5 (Estitution of a contract for use)<br>
				<br>
				The use contract is established by the hotel's consent to the application of the terms and conditions of use of the service.<br>
				<br>
				Article 6 (Application for Use)<br>
				<br>
				① To use this service, record and apply all user information required by the hotel's prescribed subscription application form.<br>
				② Only adults over the age of 19 can sign up for this service.<br>
				③ All user information on the subscription application form is considered to be actual data. Users who do not enter real names or actual information are not legally protected and may be restricted from services.<br>
				<br>
				Article 7 (approval of application for use)<br>
				<br>
				① The hotel approves the application for service use with the exception of subparagraphs 2 and 3 for customers who apply for use under Article 6.<br>
				② The hotel may withhold consent until the reasons for the restriction on consent to the application are resolved in the following cases.<br>
				A. When the capacity of service-related facilities is insufficient,<br>
				B. If there are technical reasons for disability,<br>
				C. Other cases where it is deemed necessary to have a hotel.<br>
				<br>
				③ The hotel may not accept the application for use in the following cases.<br>
				A. In the case of an application using the name of another person,<br>
				B. In the case of applying for use by falsely stating user information,<br>
				C. In a case where an application is made for the purpose of hindering the well-being and order or customs of society.<br>
				D. Other cases where the requirements for application for use of the hotel are not met.<br>
				<br>
				Article 8 (Change of user information)<br>
				<br>
				If the user information entered at the time of application for use is changed, the member must modify it online, and the user is responsible for the problem caused by the non-change.<br>
				<br>
				Chapter 3. The obligations of the parties to the contract.<br>
				<br>
				Article 9 (Hotel's duty)<br>
				<br>
				① Hotels cannot disclose or distribute the personal information of members acquired in connection with the provision of services to others without prior consent. However, exceptions are made in cases falling under any of the following subparagraphs.<br>
				A. Where there is a request from a state agency pursuant to the provisions of the Framework Act on Telecommunications, etc.<br>
				B. Where there is an investigative purpose for a crime or a request from the Information and Communication Ethics Committee.<br>
				C. Where there is a request in accordance with the procedures prescribed by other relevant laws and regulations,<br>
				② Within the scope of paragraph 1, hotels can prepare and use statistical data on all or part of their personal information related to their work, and transmit members' computer cookies through services. In this case, the member may change the settings of the browser on the computer that is used to refuse to receive the cookie or warn about the receipt of the cookie.<br>
				<br>
				Article 10 (Duties of Members)<br>
				<br>
				① Members shall not engage in the following acts when using the service.<br>
				A. The act of illegally using the IDs of other members.<br>
				B. Copying, copying, changing, translating information obtained from the service for purposes other than the use of members without prior consent of the hotel, or using it for publication and broadcasting, or providing it to others.<br>
				C. Infringement of hotel copyrights, copyrights of others, etc.<br>
				D. The act of distributing information, sentences, figures, etc. of content in violation of public order and customs and customs to others.<br>
				E. An act of objectively determining that it is for the purpose of a criminal act or is associated with a crime.<br>
				F. Other acts that violate relevant laws and regulations.<br>
				② Members must comply with relevant laws, matters stipulated in these terms and conditions, guidance on service use, and precautions.<br>
				③ Members must comply with the usage restrictions posted by the hotel on the service notice or announced separately for each content.<br>
				④ Members are not allowed to engage in any for-profit activities using the service without prior consent from the hotel.<br>
				<br>
				Chapter 4. Services provided and used.<br>
				Article 11 (Member's obligation to manage member IDs and passwords)<br>
				<br>
				Members are responsible for all management of IDs and passwords. The member is fully responsible for all consequences arising from the negligence of the ID and password assigned to the member and fraudulent use.<br>
				<br>
				Members must notify the hotel of this fact if their ID is illegally used or for other security violations.<br>
				<br>
				Terms and conditions of online membership registration.<br>
				<br>
				Article 12 (Provided Service)<br>
				<br>
				① Hotels can provide members with various points that are deemed necessary while using members' services by e-mail or letter mail, and members can refuse to receive information from the membership application menu and the membership information modification menu if they do not want.<br>
				② The hotel provides online community service, which allows members to sign up and work directly only if they want.<br>
				<br>
				Article 13 (Transaction with advertisers)<br>
				<br>
				The hotel is not responsible for any losses or damages incurred as a result of communication or transaction or participation of members in advertisers' promotional activities posted on this service or through this service.<br>
				<br>
				Article 14 (Member's Post)<br>
				<br>
				Hotels are not responsible for the contents posted, posted, e-mail, or otherwise transmitted by members through this service, and may be deleted without prior notice if they are deemed to fall under any of the following subparagraphs.<br>
				<br>
				① Case where it is a content that slanders other members or others, infringes on privacy, or defames them by slanderously.<br>
				② In a case where there is a concern that it interferes with or may interfere with the stable operation of the service.<br>
				③ In the case of content recognized as being related to criminal acts,<br>
				④ In the case of infringement of other rights such as intellectual property rights of a hotel, intellectual property rights of another person, etc.<br>
				⑤ In the case where the posting period prescribed by the hotel is exceeded,<br>
				⑥ In the case where it is deemed to violate other relevant laws and regulations,<br>
				<br>
				Article 15 (Rights and Liabilities for Posts)<br>
				<br>
				All rights and responsibilities, including copyrights for posts, lie with the member who posted them.<br>
				<br>
				Article 16 (Responsibility for Service Use)<br>
				<br>
				Members are not allowed to engage in sales activities that sell illegal products using services, especially hacking, money-making advertisements, commercial activities through obscene sites, and illegal distribution of commercial S/W.<br>
				<br>
				The hotel is not responsible for the consequences and losses of business activities that have occurred in violation of this, and legal measures such as arrest by related agencies.<br>
				<br>
				Article 17 (Service restrictions and suspension)<br>
				<br>
				Hotels may restrict or suspend all or part of the service in case of exhibition, speculation, natural disasters, or equivalent national emergencies, and other force majeure reasons such as the suspension of telecommunication services by key telecommunications operators under the Telecommunications Business Act. When a hotel restricts or suspends the use of the service pursuant to paragraph (1), it shall notify the member of the reason and the period of restriction without delay.<br>
				<br>
				Chapter 5. Guitar.<br>
				<br>
				Article 18 (Contract termination and restriction on use)<br>
				<br>
				① When a member intends to terminate the contract, the member himself/herself must apply for termination at the hotel.<br>
				② Hotels may terminate or suspend the use of the service without prior notice if a member has committed any of the following acts, or restrict or suspend the use of the service for a fixed period.<br>
				A. In the case of stealing another person's service ID and password,<br>
				B. In the case of interfering with the stable operation of the service,<br>
				C. In the case of intentionally disseminating content that hinders public order and customs and customs,<br>
				D. In a case where a member plans or executes the use of services for the purpose of hindering the national interest or social public interest,<br>
				E. In a case where an act of damaging or penalizing another person's reputation by posting, posting, e-mailing, or other means of infringing on the intellectual property rights of another person is performed.<br>
				F. In the case of continuous transmission of obscene, low-speed, threatening content, advertising information, e-mail, etc. contrary to the intention of the recipient,<br>
				G. In the case of distributing computer virus programs that cause malfunction of information and communication facilities or destruction of information, etc.<br>
				H. In the case of infringing on the intellectual property rights of a hotel, another member, or another person,<br>
				I. In the case where there is a request for correction by an external agency such as the Information and Communication Ethics Committee or an authoritative interpretation of the Election Commission in connection with an illegal election campaign, etc.,<br>
				J. In the case of fraudulent use of another person's personal information, user ID, and password,<br>
				K. In a case where information obtained using the hotel's service information is reproduced, distributed, or commercially used without prior consent of the hotel.<br>
				L. In the case of violation of telecommunications-related laws, etc.,<br>
				M. In the case of violation of the terms and conditions of use and related statutes prescribed by the hotel, including these terms and conditions.<br>
				<br>
				Article 19 (Compensation for damages)<br>
				<br>
				The hotel is not responsible for any damages incurred to its members regarding the use of the service while the service charge is free.<br>
				<br>
				Article 20 (Exemption clause)<br>
				<br>
				① If the hotel is unable to provide services due to force majeure equivalent to this, it is exempted from responsibility for providing services.<br>
				② Hotels are exempt from liability in the event of a service failure due to reasons attributable to members.<br>
				③ Hotels are exempt from liability for damages caused by members' failure to benefit from the hotel's service provision or selection or use of service materials.<br>
				④ The hotel is exempt from responsibility for information, data, accuracy, reliability, etc. posted on the service, and the member uses the service under his or her responsibility, and no damage to the data posted or transmitted using the service, selection of materials, or other disadvantages.<br>
				⑤ Hotels do not bear any responsibility for goods transactions, etc. between members or between members and third parties through services, and are exempted from liability for the benefits members expect in relation to the use of the service.<br>
				⑥ The member is all responsible for damages caused by carelessness in managing and using the member ID and password or fraudulent use by a third party.<br>
				<br>
				Article 21 (Court of competent jurisdiction)<br>
				<br>
				If a lawsuit is filed against a dispute under these terms and conditions, the court having jurisdiction over the location of the hotel's headquarters shall be the exclusive competent court.<br>
				<br>
				These terms and conditions will take effect on September 12th, 2014.<br>
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