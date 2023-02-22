<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>

<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="description" name="description" content="호텔예약사이트 바이인호텔입니다.">
<meta id="ogTitle" property="og:title" content="바이인호텔">
<meta id="ogDescription" property="og:description" content="호텔예약사이트 바이인호텔입니다.">
<meta property="og:type" content="website">
<meta id="ogImg" property="og:image" content="">
<meta id="twitterTitle" property="twitter:title" content="바이인호텔">
<meta id="twitterDescription" property="twitter:description" content="호텔예약사이트 바이인호텔입니다.">
<meta name="robots" content=“index”>
<meta name="robots" content="follow"> -->

<title>바이인호텔</title>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/calender.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee7ff3f3324cb139c951a2be686c6e14&libraries=services"></script>

<style>
.location {
	float: left;
	margin: 70px 0px 15px 94px;
	border-bottom: 2px solid #8A8A8A;
	width: 1100px;
	line-height: 40px;
}

.location span{
	font-family: NanumSquare_ac;
	font-size: 18px;
	color: #434343;
}

.content {
	background-color: #F5F5F5;
}

.hotelinfo {
	line-height: 45px;
	margin-bottom: 15px;
}

.bigimg {
	float: left;
	margin-right: 30px;
	margin-left: 10px;
}

.roomimgs {
	width: 550px;
	float: right;
}

.roomimgs img{
	width: 49%;
}

.hotelinfo h4 {
	font-size: 42px;
	font-family: NanumSquare_ac;
	color: #242424;
}

.hotelinfo p {
	font-size: 20px;
	font-family: NanumSquare_ac;
	color: #707070;
}

.icon {
	float: right;
	margin-top: -105px;
	cursor: pointer;
	margin-right: 10px;
}

.backcolor {
	width: 1300px;
	background-color: white;
	padding-bottom: 178px;
}

.allview {
	background-color: rgb(0, 0, 0, 0.5);
	width: 100px;
	height: 28px;
	position: relative;
	margin: -40px 0px 0px 16px;
	color: white;
	font-size: 16px;
	font-family: NanumSquare_ac;
	cursor: pointer;
}

.hotelimg {
	display: inline-block;
	margin: 10px 86px;
}

.tab>.selectmenu {
	margin: 40px 80px 4px;
}

hr {
	width: 1105px;
	color: #8A8A8A;
	margin: 20px auto;
	border: 1px solid;
}

.tab>.selectmenu span {
	font-size: 26px;
	margin: auto 15px;
	font-family: NanumSquare_ac;
	cursor: pointer;
	color: #C9C9C9;
}

.calendarDate {
	width: 1100px;
	height: 45px;
	background-color: #F3F3F3;
	position: relative;
}
#calendarIcon{
	position: absolute;
	transform: translate(10px, 10px);
}
#calendarArr{
	position: absolute;
	transform: translate(-5px, 10px);
	cursor: pointer;
}
.dateCalendar{
	width: 1020px;
	height: 40px;
	margin-left: 40px;
	border: none;
	background-color: #F3F3F3;
	font-size: 18px;
	color: #707070;
	font-weight: bold;
}
.dateCalendar:focus{
	outline: none;
}

.article2 {
	border: 1px solid #A4A4A4;
	border-radius: 10px;
	width: 82%;
	display: grid;
	grid-template-columns: 40% 60%;
	margin: 25px auto;
	padding: 16px;
	cursor: pointer;
}

.reservationTitle{
	margin: 0;
}

.reservationImgs{
	width: 40%;
	display: flex;
	float: right;
}

.reservationText1{
	width: 100%;
	
}
.reservationText2{
	width: 100%;
	
}

.Texts{
	width: 100%;
	margin: 0px;
	text-align : right;
	line-height: 30px;
}

.reservationButton{
	display: flex;
	width: 100%;
	padding-top: 12px;
}

.article2 img {
	width: 250px;
	height: 260px;
	float: left;
	padding: 15px;
	height: 180px;
}

.img1 {
	width: 73px;
	height: 53px;
	border: 1px solid rgb(127,127,127,0.5);
	display: inline-block;
	border-radius: 7px;
	margin: 0px 4px 8px 4px;
}

#serviceText {
	font-size: 12px;
	text-align: center;
	color: #707070;
	margin: 5px auto;
}

#serviceImg {
	width: 20px;
	height: 20px;
	padding: 0;
	margin-top: 4px;
}

.noticeIcon{
	margin: 16px auto;
	display: flex;
	max-width: 500px;
	flex-wrap: wrap;
	justify-content: center;
}

.select_table tr {
	display: flex;
	width: 666px;
}

.select_table td {
	padding: 0px;
	font-family: NanumSquare_ac;
	color: #242424;
	width: 50%;
}

.smain h4 {
	font-size: 32px;
	font-weight: bold;
}

.standard {
	font-size: 15px;
	padding-top: 6px;
	font-family: NanumSquare_ac;
}

.text1 {
	font-family: NanumSquare_ac;
	font-size: 20px;
	color: #242424;
}

.text2{
	font-family: malgun;
	font-size: 15px;
	color: #707070;
}
.select_table span, .select_table2 span{
	font-size: 22px;
	font-weight: bold;
	color: #242424;
	text-align: right;
}
.reservationText1 > span {
	margin-top: -24px;
	margin-right: 12px;
}

.select_table button, .select_table2 button{
	width: 314px;
	height: 43px;
	background-color: white;
	font-size: 20px;
	font-family: NanumSquare_ac;
	border-radius: 7px;
	cursor: pointer;
	font-weight: bold;
}

.select_table2 button{
	width: 694px;
}

.content{
	padding-bottom: 0px;
}

.background, .background2, .background3, .photoView, .photos, .photoReviews, .reviewDetails, .cancelDetail{
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
    background-color: rgba(0, 0, 0, 0.3);
    z-index: 1000;
    z-index: -1;
    opacity: 0;
     }
.show {
	opacity: 1;
	z-index: 1000;
    /* transition: all .5s; */
}

.window {
   position: relative;
   width: 100%;
   height: 100%;
}
.popup {
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   background-color: #ffffff;
   border-radius: 15px;
   /* 임시 지정 */
   width: 650px;
 	padding-bottom: 25px;
   /* 초기에 약간 아래에 배치 */
   transform: translate(-50%, -40%);
}

.show .popup {
	transform: translate(-50%, -50%);
}

.popupBigImg{
    width: 650px;
    height: 350px;
    margin-top: -35px;
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    position: relative;
}
#close , #close2 ,#close1, #close3, #close4, #close9, #close10 {
    float: right; 
    position: relative;
    transform: translate(-15px, -45px);
    width: 35px;
    height: 35px;       
    cursor: pointer;                 
}
   
#close2{
	transform : translate(-15px, 12px);
	z-index : 1000;
}

.m_title{
    text-align: center;
    width: 625px;
    border-bottom: 1px solid #4366A3;
    font-family: NanumSquare_ac;
}
.m_title p{
    font-size: 14px;
    font-weight: bold;
    color: #707070;;
}
.m_notice{
    width: 94%;
    font-family: NanumSquare_ac;
}
.m_notice p{
    font-size: 14px;
    font-weight: bold;
}
.noticeTitle{
	color: #707070;
}
.background p, .background2 p{
    margin: 10px auto;
}
.background h4, .background2 h4{
    margin: 10px auto;
    font-size: 24px;
    color: #242424;
}
.background ul ,  .background2 ul{
    list-style: none;
    padding-left: 0px;
    font-size: 14px;
    color: #707070;
    line-height: 20px;
    font-family: NanumSquare_ac;
    width: 100%;
    overflow: hidden;
    word-break: break-word;
}
.background hr,  .background2 hr{
    margin: 25px auto;
    width: 648px;
    border: 1px solid #D2BBA6;
}

.dReservation, .sReservation, .giftReservation{
    width: 297px;
    height: 45px;
    border-radius: 4px;
    background-color: #4366A3;
    color: white;
    font-size: 18px;
    font-weight: bold;
    text-align: center;
    border: none;
    margin-left: 18px;
    cursor: pointer;
    margin-top: 22px;
}
 .m_title > .mTd1{
    font-size: 20px;
    color: #242424;
}
.m_title > .mTd2{
    font-size: 12px;
    color: #4366A3;
    font-weight: bold;
}
        
.allNotice::-webkit-scrollbar{
	width: 8px;
}
.allNotice::-webkit-scrollbar-thumb{
	background-color: #7E7E7E;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}
.allNotice::-webkit-scrollbar-track{
	background-color: transparent;
}
.see{
	color: red;
	font-size: 12px;
	margin-left: 7px;
}
      
 .smain td:first-child{
	width: 60%;
}
.smain td:last-child{
	width: 40%;
	display: flex;
}

.standardTime{
	font-size: 15px;
	font-family: NanumSquare_ac;
}
      
.roomImg img{
	width: 388px;
	height: 258px;
	border-radius: 26px;
}

.reservationTitle h4{
	font-size: 32px;
	font-family: NanumSquare_ac;
	color: #242424;
}
.select_table, .select_table2{
	width: 100%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	box-sizing: border-box;
	padding: 15px 0;
}

.select_table2 > .reservationText2{
	width: 100%;
	padding-top: 18px;
}
.background.show > .popup > .m_title> img1> img{
	width: 20px;
	heigth: 20px;
	padding: 0px;
}
.amenities{
	margin: 16px auto;
}
.amenities table{
	width: 548px;
	height: 100%;
	border-collapse: collapse;
	border: 1px solid rgb(151,151,151,0.5);
	margin-bottom: 18px;
	
}
.amenities table tr:first-child td{
	border-bottom: 1px solid rgb(151,151,151,0.5);
}
.amenities table tr td:first-child{
	border-right: 1px solid rgb(151,151,151,0.5);
	background-color: #F3F3F3;
	color: #474747;
	width: 120px;
}
.amenities table tr{
	display: revert;
	float: none;
}
 .amenities table tr td p{
 	text-align: center;
 	font-weight: normal;
 	line-height: 20px;
 }
 .amenities table tr:last-child td p{
 	margin: 0px auto;
 	color: #242424;
 }
.amenities table td{
	padding: 8px;
	margin: 0px;
	display: revert;
}
.allNotice{
	width: 100%;
	height: 408px;
	overflow: auto;
}

.noticeIcon > .img1 p{
	font-weight: normal;
}
.standard span{
	margin: 0px;
	float: none;
	color: #242424;
	font-size: 15px;
	font-weight: normal;
}
.tab{
   overflow: hidden;
}
.selectmenu > span.tablinks.active{
     font-weight: bold; 
     color: #242424; 
     border-bottom: 2px solid #4366A3;
 }
.tabcontent{
    display: none;
}
        
#detailInfo > .selectlist, #roomReviews > .selectlist{
	width: 1100px;
	margin-top: 30px;
}
          
.selectlist h4 {
	font-size: 36px;
	font-family: NanumSquare_ac;
	color: #242424;
}


.infotable {
	margin-top: 30px;
	font-size: 16px;
	font-family: NanumSquare_ac;
	color: #242424;
	width: 1100px;
	border-top: 2px solid #8A8A8A;
	border-bottom: 2px solid #8A8A8A;
	border-collapse: collapse;
}

.infotable tr{
	display: revert;
	float: none;
}

.infotable td {
	text-align: center;
	padding: 20px;
	margin: 0px;
	height: 20px;
	border-bottom: 1px solid rgb(138, 138, 138, 0.5);
	display: revert;
}

.infotable td:first-child{
	border-right: 1px solid rgb(138, 138, 138, 0.5);
	width: 168px;
}

.infotable td:last-child{
	width: 892px;
}
/* ////////////////////////////////////////////////// */

.detailinfo {
	margin: 50px auto;
	font-size: 18px;
	font-family: NanumSquare_ac;
	color: #242424;
	line-height: 30px;
}

.hotelstation {
	margin: 50px auto;
}

.roomtable {
	width: 100%;
	border-top: 2px solid #8A8A8A;
	border-bottom: 2px solid #8A8A8A;
	margin-top: 30px;
	font-size: 16px;
	font-family: NanumSquare_ac;
	color: #242424;
	border-collapse: collapse;
}
/*///////////////////////////////////////////// roomtable css 변경 //////////////////////////////////*/
.roomtable tr{
	display: revert;
	float: none;
	/* border-right: 1px solid rgb(138,138,138,0.5); */
}
.roomtable tr:last-child{
	border-right: none;
}

.roomtable td {
	padding: 20px;
	margin: 0px;
	border-bottom: 1px solid rgb(138,138,138,0.5);
	text-align: center;
	display: revert;
	align-content: flex-start;
	justify-content: center;
	border-right: 1px solid rgb(138,138,138,0.5);
}
.roomtable tr td:first-child{
	width: 128px;
}

.roomtable tr td:nth-child(2){
	width: 464px;
}
.roomtable tr td:last-child{
	border-right: none;
	width: 464px;
	text-align: left;
	line-height: 24px;
}

.roomtitle{
	background-color: #EBEBEB;
	line-height: 44px;
	font-weight: bold;
}
.stationinfo{
	margin-top: 40px;
}

.stationinfo h4 {
	margin: 20px auto;
}

.reviewinfo {
	font-family: NanumSquare_ac;
	color: #242424;
}

.photo a {
	float: right;
	margin-top: -50px;
	text-decoration: none;
	font-size: 20px;
	color:  #242424;
	cursor: pointer;
}

.photo p {
	font-size: 24px;
	line-height: 30px;
}

.photo span {
	color: #242424;
	font-weight: bold;
}

.photo>#pinfo {
	font-size: 18px;
}

.collection {
	margin: 10px auto;
	cursor: pointer;
}

.more {
	width: 171px;
	height: 171px;
	float: right;
	position: absolute;
	background: rgb(0, 0, 0, 0.5);
	border: 1px solid #707070;
	border-radius: 16px;
	text-align: center;
	color: white;
	margin: 0 auto;
	transform: translateX(904px);
}

.more p {
	line-height: 170px;
	font-size: 24px;
}

.reviewlist {
	padding: 20px;
	border-bottom: 1px solid #C7C7C7;
}

.people {
	float: left;
}

.reviewtable {
	width: 800px;
	margin-right: 0px;
	margin-left: 0px;
}

.reviewtable tr {
	width: 50%;
}


.reviewtable td {
	padding: 5px;
	font-family: NanumSquare_ac;
	font-size: 18px;
	width: 100%;
	overflow: hidden;
	word-break: break-all;
}

.re1 {
	color: #C3A58A;
	font-weight: bold;
}
.re2{
	color: #E75A00;
}

.re3 {
	color: #242424;
}

.re4 {
	color: #717171;
	font-weight: bold;
}

.retr td {
	text-align: right;
}

.paging {
	margin: 50px 450px;
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
  .review_text{
	margin-top: 32px;
}

.photoCollect {
	margin: 12px 0px 0px 24px;
	overflow: auto;
	height: 121px;
}

.photoCollect img {
	width: 130px;
	height: 100px;
	/* margin-right: 8px; */
	margin: 6px;
	border-radius: 10px;
}

.seePhoto {
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	position: relative;
	height: 60px;
	background-color: #4366A3;
}

.seePhoto p {
	color: white;
	margin-left: 20px;
	font-size: 24px;
	line-height: 58px;
}  

.seePhoto2 , .seephoto {
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	position: relative;
	height: 60px;
	background-color: #4366A3;
	line-height: 55px;
}

.seePhoto2 p {
	color: white;
	margin: 0 auto;
	margin-left: 20px;
	font-size: 24px;
	font-family: NanumSquare_ac;
}

.pCollect {
	margin: 25px 0px 0px 40px;
	overflow: auto;
	width: 860px;
	height: 660px;
}

.pCollect::-webkit-scrollbar{
	width: 10px;
}
.pCollect::-webkit-scrollbar-thumb{
	background-color: #7E7E7E;
	border-radius: 10px;
	background-clip: padding-box;
	border: 2px solid transparent;
}
.pCollect::-webkit-scrollbar-track{
	background-color: transparent;
}

.pCollect img {
	width: 150px;
	height: 150px;
	margin: 5px;
	border-radius: 10px;
}

.mainphoto{
    margin: 20px auto;
    width: 900px;
    height: 530px;
    background-color: black;
}
.mainphoto img{
    width: 800px;
    height: 530px;
    margin: -10px 50px;
}
.button{
    float: right;
    margin-top: -530px;
    position: relative;
}
.button img{
    width: 40px;
    height: 40px;
    margin: 0 auto;
    border-radius: 0px;
}
.direction img{
    width: 40px;
    height: 40px;
    cursor: pointer;
    z-index: 1;
    transform: translateY(-70px);
    
}
.all{
    font-size: 18px;
    color: #0000DE;
    font-family: NanumSquare_ac;
    cursor: pointer;
}

.reviewlist2 > .people{
	width: 54px;
	height: 54px;
	margin: 0px;
}

.reviewlist2 {
	padding: 20px;
	border-bottom: none;
}

.reviewtext2{
    width: 900px;
    height: 772px;
    position: relative;
    background-color: transparent;
    border-top: 1px solid black;
}
.closeButton button{
    width: 900px;
    height: 50px;
    font-size: 18px;
    font-weight: bold;
    line-height: 15px;
    background-color: transparent;
    border-top: 1px solid black;
    border-bottom: 1px solid black;
    border-left: none;
    border-right: none;
}

.back{
	opacity: 0.1;
}
.top{
	background-color: rgba(255,255,255,0.8);
	margin-top: -745px;
}
.Left, .Right {
	width: 50px;
	height: 50px;
	position: absolute;
	top: 480px;
	margin: 10px;
	cursor: pointer;
}

.Right {
	margin-left: 832px;
}

.middleTitle {
	background-color: rgba(36, 36, 36,0.5);
	height: 60px;
	line-height: 60px;
	font-size: 24px;
	color: white;
	font-family: NanumSquare_ac;
	position: relative;
	margin-top: -64px;
}

.middleTitle p {
	font-size: 24px;
	color: white;
	font-family: NanumSquare_ac;
	margin-left: 20px;
}

.reservationPeriod p{
	font-size: 24px;
	font-weight: bold;
	color: #242424;
}

.reservationPeriod button{
	width: 94px;
	height: 28px;
	font-size: 16px;
	background-color: white;
	border: 1px solid #242424;
	border-radius: 6px;
	text-align: center;
	margin: 14px auto;
}

.serviceCollection{
	display: flex;
	width: 100%;
	flex-wrap: wrap;
}

.serviceContent{
	text-align: center;
	margin: 0px 26px;
}

.serviceContentImg{
	width: 79px;
	height: 79px;
	margin-bottom: 10px;
}

.serviceContent p{
	font-size: 16px;
	font-family: NanumSquare_ac;
	color: #000000;
}

.photo> .collection img{
	width: 172px;
	height: 172px;
	border-radius: 18px;
	margin: 0px 4px;
}

.review_img_url {
	cursor: pointer;
}

.wishlistImg{
	width: 75px;
	height: 75px;
	border: 1px solid #C8C8C8;
	border-radius: 6px;
	text-align: center;
	float: left;
	background-color: white;
}
.wishlistImg img{
	margin-top: 25px;
}
.allview p{
	margin-left: 6px;
	line-height: 26px;
}

.allview p span{
	margin-left: 6px;
}

.selected_photo {
	outline: 3px solid #4366A3;
}
.selected_popPhoto{
	outline : 1px solid green;
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
.viewRooms_photo{
	width: 120px;
}
.popLeft, .popRight{
	width: 36px;
	position: absolute;
	top: 296px;
	cursor: pointer;
}
.popLeft{
	left: 10px;
}
.popRight{
	right: 10px;
}
.popImgs{
	display: none;
} 
.serveiceImg{
	display: grid;
}

.service_list{
	resize: none;
	border: none;
	font-family: NanumSquare_ac;
	/* width: 35%; */
	height: 100%;
	text-align: right;
	/* pointer-events: none; */
}
.service_list:focus{
	outline: none;
}
/* 공유하기 버튼 css 시작 */
.bollom {
	position: relative;
	padding: 10px 10px 10px 10px;
	background: #FFFFFF;
	border-radius: 5px;
	border: #CCCCCC solid 1px;
	position: absolute;
	font-size: 16px;
	text-align: left;
	width: 256px;
	height: 36px;
	left: 1311px;
	top: 320px;
	display: none;
}

.bollom:after {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 16px 20px 17.5px;
	border-color: #FFFFFF transparent;
	display: block;
	width: 0;
	z-index: 1;
	top: -19.5px; 
	left: 129px; 
}

.bollom:before {
	content: '';
	position: absolute;
	border-style: solid;
	border-width: 0 16px 20px 17.5px;
	border-color: #CCCCCC transparent;
	display: block;
	width: 0;
	z-index: 0;
	top: -21px;
	left: 129px;
}

.urlInput{
	width: 176px;
	height: 26px;
	border: 1px solid #CCCCCC;
	font-size: 12px;
	font-family: NotoSans;
	color: #000000;
}
.urlBtn{
	width: 64px;
	height: 30px;
	background-color: white;
	border: 1px solid #707070;
	font-size: 12px;
	font-family: NotoSans;
	color: #000000;
}
/* 공유하기 버튼 css끝 */

/* /////////////////////////////////취소규정 팝업 css */
.see{
	cursor: pointer;
}

.cacelList{
	margin: 22px;
}

.cacelList table{
	width: 745px;
	border-collapse: collapse;
	border: 1px solid #A4A4A4;
	margin: 16px auto;
}

.cacelList table td{
	padding: 12px;
	border-bottom: 1px solid #A4A4A4; 
	margin: 0px;
	font-family: NanumSquare_ac;
	font-size: 17px;
	text-align: center;
}
.cacelList table td:last-child{
	border-bottom: none;
}
.cacelList table td:first-child{
	background-color: #EFEFEF;
}
.typeColumn{
	width: 30%;
	border-right: 1px solid #A4A4A4;
}
.refundColumn{
	width: 69.8%;
}
.cacelList h4{
	color: #303030;
	font-weight: bold;
	font-size: 18px;
	margin-bottom: 12px;
	font-family: NanumSquare_ac;
}
.cacelList p{
	margin-bottom: 10px;
	color: #303030;
	font-size: 17px;
	font-family: NanumSquare_ac;
}
#SalePrice{
	text-decoration: line-through;
	color: #DFDFDF;
	font-size: 17px;
	margin-right: 0px;
}
#salePercent{
	color: #4365A2;
	font-size: 17px;
	margin-right: 4px;
}
.viewAll_photo{
	cursor: pointer;
}
.poplikeButton ,.detaillikeButton, .likeButton{
	cursor: pointer;
}

.calendar_popup {
	position: absolute;
	background-color: #ffffff;
	border-radius: 4px;
	display: none;
	border: 1px solid #A4A4A4;
	margin-top: 16px;
}

.calendar_show {
	transition: all .5s;
	z-index: 2;
	display: block;
}

.calendar_show .calendar_popup {
	transform: translate(-50%, -50%);
	transition: all .5s;
}
.calendarBtn button{
	background-color: white;
	width: 30%;
	border: none;
	font-size: 14px;
	font-family: NanumSquare_ac;
}

.popup_gift_select {
   position: absolute;
   top: 50%;
   left: 50%;
   transform: translate(-50%, -50%);
   background-color: #ffffff;
   border-radius: 15px;
   /* 임시 지정 */
   padding: 10px;
               
   /* 초기에 약간 아래에 배치 */
   transform: translate(-50%, -40%);
}

.show .popup_gift_select {
	transform: translate(-50%, -50%);
}

.popup_gift_select button {
	width: 150px;
    height: 43px;
    background-color: white;
    border: 2px solid #4366A3;
    color: #4366A3;
    font-size: 20px;
    font-family: NanumSquare_ac;
    border-radius: 7px;
    cursor: pointer;
    font-weight: bold;
}

#close_gift_select {
    float: right;
    position: relative;
    transform: translate(0px, 0px);
    width: 20px;
    height: 20px;
    cursor: pointer;
    z-index : 1000;
}
.search {
	position: relative;
	display: flex;
	width: 300px;
	margin: auto;
	list-style: none;
	background-color: white;
	box-shadow: 2px 1px 5px 0px #A4A4A4;
	border-radius: 13px;
	padding-left: 0px;
	margin-left: 101px;
	border: 1px solid #A4A4A4;
}

.search>li {
	flex: 1;
	padding: 9px;
	color: #707070;
}

.search>li>.searchbar {
	text-align: left;
}

.searchbar p {
	font-size: 14px;
	font-family: NanumSquare_ac;
	color: #242424;
}

.search>li:not(:last-child)>.searchbar {
	border-right: 1px solid #CCCCCC;
}

#textbox {
	font-size: 16px;
	padding: 5px;
	color: #CCCCCC;
}

.sbar {
	text-align: center;
	height: 63px;
	margin: 27px 7px 0px 0px;
}

.searchbox {
	width: 240px;
	border: 0 solid;
	font-size: 16px;
}

#stext {
	font-size: 30px;
	color: #242424;
	font-family: NanumSquare_ac;
}
.dateSelectBtn button{
	background-color: white;
	border: none;
	font-family: NanumSquare_ac;
	font-size: 14px;
}
.priceBox{
	display: grid;
	grid-template-columns: 50% 50%;
	width: 100%;
}
.cardBox{
	display: grid;
	grid-template-columns: 50% 50%;
	width: 100%;
}
.titleBox{
	text-align: left;
	margin-left: 0;
	line-height: 30px;
}

</style>
</head>
<body>
<!-- 페이지 값 받아오는 코드  -->
<%String hotel = request.getParameter("hotel"); %>
<%String checkin = request.getParameter("checkin"); %>
<%String checkout = request.getParameter("checkout"); %>
<%String review = request.getParameter("review"); %>
<%
	Calendar today = Calendar.getInstance();
	int todayYear = today.get(Calendar.YEAR);
	int todayMonth = today.get(Calendar.MONTH) + 1;
	int todayDate = today.get(Calendar.DATE);
	String todayString = String.format("%d.%02d.%02d", today.get(Calendar.YEAR), today.get(Calendar.MONTH) + 1,
	today.get(Calendar.DATE));
			
	Calendar tomorrow = Calendar.getInstance();		
	tomorrow.set(today.get(Calendar.YEAR), today.get(Calendar.MONTH), today.get(Calendar.DATE) + 1);
	String tomorrowString = String.format("%d.%02d.%02d", tomorrow.get(Calendar.YEAR), tomorrow.get(Calendar.MONTH) + 1,
	tomorrow.get(Calendar.DATE));
	
	Calendar threeMonthDay = Calendar.getInstance();
	threeMonthDay.set(todayYear, todayMonth+2, todayDate);
	int threeMonthDayYear = threeMonthDay.get(Calendar.YEAR);
	int threeMonthDayMonth = threeMonthDay.get(Calendar.MONTH) + 1;
	int threeMonthDayDate = threeMonthDay.get(Calendar.DATE);
	
%>
	<div class="page">
		<%@include file="../header.jsp"%>
		<div class="content">
			<div class="backcolor">
			<!-- 호텔객실선택. 정보입력. 예약완료 로케이션 -->
				<div class="location">
					<span style="font-weight: bold; color: #4366A3;">호텔/객실선택 </span> <span>> 정보입력/결제하기 </span> <span>> 예약완료</span>
				</div>
				
				<!-- 호텔이름, 위치정보 -->
				<div class="hotelimg">
					<div class="hotelinfo">
						<h4 id="lodgement_name">이끌림호텔</h4> <!-- 받아온 호텔 이름 -->
						<p id="lodgement_address">광주 북구 자미로 10번길 14</p>
						<div class="icon">
						<!-- 하트버튼 -->
							<div class="wishlistImg">
							<!-- <img src="../images/icon/wishlist_off.png" onclick=""> -->
							</div>
							
							<!--//////////////////////////// url공유하기 시작 -->
							<img src="../images/reservationimg/share.png" style="margin-left: 7px;" onclick='shareUrl()'>
							<div class='bollom'>
								<input class='urlInput' type='text' value="" name='urlValue'>
								<button class='urlBtn' type='button' onclick="clip();">url 복사</button>	
 							</div>
 							<!-- /////////////////////////////url 공유하기 끝 -->
						</div>
					</div>
					
					<!-- 큰 호텔 사진 -->
					<div class="bigimg">
						<img style="width: 528px; height: 322px; border-top-left-radius: 12px; border-bottom-left-radius: 12px;" id="lodgement_img_url1">
						<div class="allview" id="a_show" >
							<p>전체보기<span><img style="margin: 3px 0px 0px 9px;" src="../images/reservationimg/viewicon.png"></span></p>
							</div>
					</div>
					<!-- 객실 사진들 -->
					<div class="roomimgs">
						<img style="width: 528px; height: 322px; border-top-right-radius: 12px; border-bottom-right-radius: 12px;" id="lodgement_img_url2"  >
					</div>
				</div>


				<div class="selectpage">
				<!-- 객실예약, 상세정보, 리뷰 메뉴 -->
					<div class="tab">
					    <div class="selectmenu">
					        <span class="tablinks" onclick="openMenu(event,'reservationRoom')" id="defaultOpen">객실예약</span>
					        <span class="tablinks" onclick="openMenu(event,'detailInfo')">상세정보</span> 
					        <span class="tablinks reviewActive" onclick="openMenu(event,'roomReviews')">리뷰</span>
					    </div>
					</div>
					<hr>
					<!-- 객실예약 탭 -->
					<div id="reservationRoom" class="tabcontent">
					<!-- 예약 날짜 달력 -->
					    <!-- <div class="calendarDate" onclick='M_show();'>
					    	<img id='calendarIcon' src="../images/icon/calendar.png">
					        <input type="text" class='dateCalendar' id='dateSearchCondition' placeholder="날짜를 선택하세요." readonly>
					        <img id='calendarArr' src="../images/icon/calendarArr.png">
					    </div>
					    
					    <div class="calendar_window" style="position:relative">
							<div class="calendar_popup">
								<span id="selectState" style="display: none">login</span>
								<span id="checkinDate" style="display: none"></span>
								<span id="checkoutDate" style="display: none"></span>
				
								<div class="navc" style="color:white">
									이전달 버튼 만들기
									<div style="padding: 8px 0px;">
										<button class="navc-btn" id="prevBtn" style="float: left; visibility: visible;">
										<img src="../images/prev.png" style="width:16px; vertical-align: top;"></button>
										제목 만들기
										<div class="year-month" style="float:left;">
											<span id="year"></span>년&nbsp;
											<span id="month"></span>월
										</div>
								
										다음달 버튼 만들기
										<button class="navc-btn" id="nextBtn" style="float: left; visibility: visible;">
										<img src="../images/next.png" style="width:16px; vertical-align: top;"></button>
									</div>
								</div>
								<div class="calendar">
									<div class="days">
								        <div class="day" style="color: #D13E3E;">
								        	일
								        </div>
								        <div class="day">
								        	월
								        </div>
								        <div class="day">
								        	화
								        </div>
								        <div class="day">
								        	수
								        </div>
								        <div class="day">
								        	목
								        </div>
								        <div class="day">
											금
								        </div>
								        <div class="day" style="color: #396EE2;">
								        	토
								        </div>
						      		</div>
							    	<div class="main">
									달력 만들기
										<div class="dates">
										날짜 집어 넣기
										
										</div>
									</div>
								</div>
								<div style="display:flex; margin-bottom:10px">
									<button id="selectBtn" style="width:30%">선택완료</button>
									<button id="cancelBtn" style="width:30%">취소</button>
								</div>
							</div>
						</div> -->
						
						 <div class="selectlist">
					    	<!-- 예약 날짜 달력 -->
					    	<div>
								<ul class="search">
									<li>
										<div class="searchbar" id="dateCalendar" onclick="calendar_show();">
											<div id="textbox">
												<input type="text" placeholder="날짜를 선택해주세요." class="searchbox" id="dateSearchCondition">
												<img src="../images/mainimg/calendarimg.png">
											</div>
										</div>
										
										<div class="calenar_window" style="position:relative">
												<div class="calendar_popup">
													<span id="selectState" style="display: none">login</span>
													<span id="checkinDate" style="display: none"></span>
													<span id="checkoutDate" style="display: none"></span>
									
													<div class="navc" style = "color:white">
														<!-- 이전달 버튼 만들기 -->
														<div style = "padding: 8px 0px;">
															<button class="navc-btn" id="prevBtn" style = "float:left;">
															<img src = "../images/prev.png" style = "width:16px; vertical-align: top;"></button>
															<!-- 제목 만들기 -->
															<div class ="year-month" style = "float:left;">
																<span id="year"></span>년&nbsp;
																<span id="month"></span>월
															</div>
													
															<!-- 다음달 버튼 만들기 -->
															<button class="navc-btn" id="nextBtn" style = "float:left;">
															<img src = "../images/next.png" style = "width:16px; vertical-align: top;"></button>
														</div>
													</div>
													<div class="calendar">
														<div class="days">
													        <div class="day" style = "color: #D13E3E;">
													        	일
													        </div>
													        <div class="day">
													        	월
													        </div>
													        <div class="day">
													        	화
													        </div>
													        <div class="day">
													        	수
													        </div>
													        <div class="day">
													        	목
													        </div>
													        <div class="day">
																금
													        </div>
													        <div class="day"  style = "color: #396EE2;">
													        	토
													        </div>
											      		</div>
												    	<div class="main">
														<!-- 달력 만들기 -->
															<div class="dates">
															<!-- 날짜 집어 넣기 -->
							
												
															</div>
														</div>
													
													</div>
													<div class='dateSelectBtn' style="display:flex; margin-bottom:10px">
														<button id="selectBtn" style="width:30%">선택완료</button>
														<button id="cancelBtn" style="width:30%">취소</button>
													</div>
												</div>
										</div>
									</li>
					
					
								</ul>
							</div>
					    </div>
						
					    <!-- 객실별 대실, 숙박 예약 DIV -->
				
					</div>
					
					<!-- 상세정보 탭 -->
					<div id="detailInfo" class="tabcontent">
					    <div class="selectlist">
					    <!-- 호텔 설명 -->
					        <div class="detailinfo">
					            <p id="lodgement_detail">
					               <!-- 호텔 상세정보 -->
					            </p>
					        </div>
					        <div class="hotelService">
					        	<h4>편의시설 및 서비스</h4>
					        	<div class="serviceCollection">
						      			<!-- 상세제공- 제공편의시설, 서비스 -->
					        	</div>
					        </div>
					        <!-- 호텔정보 -->
					        <div class="hotelstation">
					            <h4>호텔 정보</h4>
					            <table class="infotable">
					                <tr>
					                    <td>위치</td>
					                    <td id="hotelAdderess"><!-- 광주 북구 자미로 10번길 14< --></td>
					                </tr>
					                <tr>
					                	<td>대표번호</td>
					                    <td id="hotel_tel"></td>
					                </tr>
					                <tr>
					                    <td>객실수</td>
					                    <td id='hotelRoomCount'></td>
					                </tr>
					                <tr>
					                    <td style="border-bottom: none;">객실타입</td>
					                    <td id='roomTypes' style="border-bottom: none;"></td>
					                </tr>
					
					            </table>
					        </div>
					        <!-- 객실정보, 어메니티, 특이사항 -->
					        <div class="roominfo">
					            <h4>객실정보</h4>
					            <table class="roomtable">
					               <!--  객실종류 -->
				                    <tr class="room1">
					                    <td class="roomtitle">&nbsp;</td>
					                    <td class="roomtitle" style='width: 386px;'>어메니티</td>
					                    <td class="roomtitle">특이사항</td>
				                    </tr>
					                   
					            </table>
					        </div> 
					        <!-- 위치정보 -->
					        <div class="stationinfo">
					            <h4>위치 정보</h4>
					           <div id="map" style='width: 640px; height: 320px; margin-left: 0px;'>
									<div id="map" style="width: 100%; height: 100%"></div>
					            </div>
						    </div>
						  </div> 
						</div>
					
					<!-- 리뷰 탭 -->
					<div id="roomReviews" class="tabcontent">
					    <div class="selectlist">
					        <div class="reviewinfo">
					            <div class="photo">
					                <p>리뷰 <span id="review_num">0</span>개</p>
					                <p id="pinfo">포토리뷰 모아보기</p>
					                <!-- <a class='reviewWrite'>리뷰작성 <img src="../images/arr3.png" style="height: 18px;"></a> -->
					                 <div class="collection">
					                    <!-- <img src="../images/reviewimg/reviewimg.png" > -->
					                    <div class="more" id="h_show">
					                        <p >더보기</p>
					                    </div>
					                </div> 
					            </div>
					        </div>
					        
					        <!--고객 리뷰글 모음-->
					        <div class="review_text">
					     				    
					            <!--페이지 이동버튼-->
					        </div>
					         	<div class="paging">
									<div class="pagination inner" id='pagination' style='text-align: center;'>
									
									</div>
								</div>
						    </div>
						</div>
		       		</div>
				</div>
			</div>
		<%@include file="../footer.jsp"%>
		</div>	
	<!-- 대실예약 팝업 -->
	<div class="background">
		<div class="window">
			<div class="popup">
				<img src="../images/closebutton.png" id="close">
                <img src="../images/reservationimg/room3.png" class="popupBigImg" id="room_thumb_url_d">
                <div class="allNotice">
				<div class="m_title">
					<h4>스탠다드 더블(넷플릭스 이용가능)</h4>
					<p class="mTd1">대실 20,000원</p>
					<p class="mTd2">2인기준 (최대2인)</p>
						<div class="noticeIcon">
							<div class="img1">
							   <img alt="주차" src="../images/reservationimg/parking.png">
							    <p>주차가능</p>
							</div>
						</div>
					</div>
				
						<div class="m_notice">
								<div class="amenities">
						<table>
						<tr>
							<td><p>어메니티</p></td>
							<td><p>특이사항</p></td>
						</tr>
						<tr>
							<td><p>칫솔, 치약, 샤워스펀지, 샴푸, 린스, 생수, 스킨, 로션, 가운, 폼클렌징, 면도기, 커피, 녹차, 슬리퍼, 레이디세트</p></td>
							<td><p>더블베드, 티테이블, 커피포트, 드라이기, 고데기, 냉장고, 충전기, 에어컨 </p></td>
						</tr>
						</table>
						
						</div>
					<p class='noticeTitle'>예약공지</p>
					<ul>
						<li>· 객실요금은 2인 입실 기준이며, 인원 추가시 프론트로 문의 후 현장에서 추가금액 결제 부탁드립니다.</li>
						<li>· 미성년자의 입실 가능여부는 직접 제휴점에 확인 후 예약 진행 하시기 바랍니다.</li>
						<li>· 미성년자 혼숙예약으로 인해 발생하는 입실 거부에 대해서는 취소/환불이 불가합니다.</li>
						<li>· 제휴점 사정에 의한 취소발생 시 100% 환불처리 됩니다.</li>
						<li>· 제휴점 사정으로 객실 정보가 수시로 변경될 수 있습니다. 이로 인한 불이익은 당사가 책임지지 않습니다.</li>
					</ul>
				</div>
                <div class="m_notice">
                    <p class='noticeTitle'>취소규정 <span class="see">자세히보기</span></p>
                    <ul>
                        <li>· 모텔의 경우 예약 완료시각으로부터 1시간 이내인 경우 바이인 앱을 통해 전액 취소가 가능합니다.<br>단, 1시간 이내라도 입실 시간 경과 시 취소 불가합니다.</li>
                        <li>· 상세한 취소 규정은 '자세히 보기'에서 확인하실수 있습니다.</li>
                    </ul>
                </div>				
				</div>
                <button type="button" class="dReservation">대실 예약하기</button>
			</div>
		</div>
	</div>
	
	<!-- 숙박예약 팝업 -->
		<div class="background2">
		<div class="window">
			<div class="popup">
				<img src="../images/closebutton.png" id="close2">
                <img src="../images/reservationimg/room3.png" class="popupBigImg" id="room_thumb_url_s">
                <img src="../images/blackleft.png" alt="왼쪽" class="popLeft" onclick = 'prev_popPhoto()'>
                <img src="../images/blackright.png" alt="오른쪽"  class="popRight" onclick = 'next_popPhotos()'>
                <div class='popImgs'>
                
              </div>
                <div class="allNotice">
				<div class="m_title" style="margin-top: 8px;">
					<h4 id = 'room_name'><!-- 스탠다드 더블( --><span id='room_service'><!-- 넷플릭스 이용가능 --></span>)</h4>
					<p id = 'lodge_price' class="mTd1"><!-- 숙박 30,000원 --></p>
					
					<p class="mTd2"><span id="people_num">0</span>인기준 (최대<span id="max_people_num">0</span>인)</p>
					
					<div class="noticeIcon">
							<!-- 숙박 서비스 아이콘 -->
					</div>
					<div class= "reservationPeriod">
							<p><span class='roomCheckIn'><!-- 2022.01.01(토) --></span> - <span class='roomCheckOut'><!-- 2022.01.01(토) --></span></p>
							<button type='button' id='changeDateBtn'>날짜변경</button>
					</div>
					</div>
				
						<div class="m_notice">
							<div class="amenities">
						<table>
							<tr>
								<td><p>어메니티</p></td>
								<td><p id='popAmenity'></p></td>
							</tr>
							<tr>
								<td><p>특이사항</p></td>
								<td><p id='specialNote'></p></td>
							</tr>
						</table>
					</div>
					<p>예약공지</p>
						<ul>
							<li>· 객실요금은 <span id='PopStandard'></span>인 입실 기준이며, 인원 추가시 프론트로 문의 후 현장에서 추가금액 결제 부탁드립니다.</li>
							<li>· 미성년자의 입실 가능여부는 직접 제휴점에 확인 후 예약 진행 하시기 바랍니다.</li>
							<li>· 미성년자 혼숙예약으로 인해 발생하는 입실 거부에 대해서는 취소/환불이 불가합니다.</li>
							<li>· 제휴점 사정에 의한 취소발생 시 100% 환불처리 됩니다.</li>
							<li>· 제휴점 사정으로 객실 정보가 수시로 변경될 수 있습니다. 이로 인한 불이익은 당사가 책임지지 않습니다.</li>
						</ul>
				</div>
                <div class="m_notice">
                    <p>취소규정 <span class="see">자세히보기</span></p>
                    <ul>
                        <li>· 모텔의 경우 예약 완료시각으로부터 1시간 이내인 경우 이끌림 앱을 통해 전액 취소가 가능합니다.<br>단, 1시간 이내라도 입실 시간 경과 시 취소 불가합니다.</li>
                        <li>· 상세한 취소 규정은 '자세히 보기'에서 확인하실수 있습니다.</li>
                    </ul>
                </div>				
			</div>
                <button type="button" class ="giftReservation" id="giftBtn" style="background-color: white; border: 2px solid #4366A3; color: #4366A3; ">선물하기</button>
                <button type="button" class="sReservation" id="reserveBtn">예약하기</button>
			</div>
		</div>
	</div>
	
	<!-- 호텔사진 전체보기 팝업 -->
	<div class="photoView">
		<div class="window">
			<div class="popup" style="width: 900px;">
                <div class="pTitle">
                <div class="seePhoto"><p>사진 전체보기</p><img src="../images/closebutton.png" id="close"></div>
                 <!-- 전체보기 큰 사진 -->
                <div class="popBig_photo">
                	<img id = 'big_photo_id' src='' style='width: 900px; height: 600px; margin-top: -88px; border-top-left-radius: 15px; border-top-right-radius: 15px;'>
                </div>
				</div>
                <img src="../images/blackleft.png" alt="왼쪽" class="Left" onclick = 'prev_photo()'>
                <img src="../images/blackright.png" alt="오른쪽"  class="Right" onclick = 'next_photo()'>
				<div class="middleTitle">
                   <p id="pop_hotel_Name"><!-- 이끌림 사진 설명 --></p>
                </div>
                <!-- 사진 전체보기 밑에 사진들 -->
                <div class="photoCollect" style='height: 121px; overflow: auto;'>
                  <!--   <img src="../images/reservationimg/room3.png"> -->
                </div>
                
			</div>
		</div>
	</div>
		<!-- 더보기 팝업 -->
	<div class="photos">
	    <div class="window">
	        <div class="popup" style="width: 900px;">
	            <div class="pTitle">
	                <div class="seePhoto2">
	                    <p>포토리뷰</p>
	                    <img src="../images/closebutton.png" id="close9">
	                </div>
	        	
	        	<!-- 리뷰 더보기 사진들 모음 -->
		            <div class="pCollect">
		              
		            </div>
		        </div>
		    </div>
		</div>
	</div>
<!-- 포토리뷰 요약 -->
	<div class="photoReviews">
	    <div class="window">
	        <div class="popup" style="width: 900px;">
	            <div class="pTitle">
	               	<!-- 팝업 제목 + 닫는 이미지 div -->
	                <div class="seePhoto2">
	                    <p>포토리뷰</p>
	                    <img src="../images/closebutton.png" id="close3">
	                </div>
	        	<div class="reviewSummary">
		        	<div class="mainphoto">
		        		<!-- 리뷰 포토 div -->
		        		<div style = 'margin: 0 auto;'>
		                	<img id = 'pop_review_img'>
		                </div>
		                <!-- 리뷰 사진 왼쪽,오른쪽 방향 이미지 --> 
		                <div class="direction">
		                    <img src="../images/blackleft.png" onclick='prev_Review()' style="margin-left: 6px; float: left;">
		                    <img src="../images/blackright.png" onclick='next_Review()' style="margin-right: 6px; float: right;">
		                </div>
		            </div>
		            <div class="photoRivews">
		            	<!-- 작성한 리뷰 보여주는 div -->
		                <div class="reviewlist2">
		                    <img src="../images/reviewimg/people.png" class="people">
		                    <table class="reviewtable" style = 'width: 760px'>
		                        <!-- 작성자, 작성 날짜 tr -->
		                        <tr>
		                            <td class="re1" id = 'pop_writer_name'></td>
		                            <td class="re4" id = 'pop_review_date'></td>
		                        </tr>
		                        <!-- 작성한 숙소, 좋아요 갯수 -->
		                         <tr class="retr">
		                            <td class="re4" id = 'pop_lodgement_room'></td>
		                            <td class="re2"><!-- <p>좋아요 <span id = 'pop_like_num'>368 </span><img src="../images/reviewimg/thumb.png" style="width: 20px; height: 20px;"> -->
		                            	<div><p style="float: left; margin-left: 269px;">좋아요 <span id="pop_like_num"></span></p></div>
		                            	<div><span class='likeIcon' id="is_liked"><!-- style='padding-left: 6px; vertical-align: middle;' --></span><img class ='poplikeButton' id = 'pop_like_photo_id' src='../images/icon/like_off.png'></div>
		                             </td>
		                        </tr>
		                        <!-- <tr class="retr">
		                            <td class="re4" id = 'pop_lodgement_room'></td>
		                            <td class="re2"><p>좋아요 <span id = 'pop_like_num'>368 </span><img src="../images/reviewimg/thumb.png" style="width: 20px; height: 20px;">
		                            	<div><p>좋아요 <span id="pop_like_num"></span><span class='likeIcon' id="is_liked" style='padding-left: 6px; vertical-align: middle;'><img class ='poplikeButton' id = 'pop_like_photo_id' src='../images/icon/like_off.png'></span></p></div>
		                             </td>
		                        </tr> -->
		                        <!-- 리뷰작성 내용, 전체보기 tr -->
		                        <tr style="width: 750px;">
		                            <td class="re3" >
		                            	<div id = 'pop_review_text' style="overflow: hidden; white-space: nowrap; width: 750px; display: inline-block; text-overflow: ellipsis;"></div>  
		                                <p class="all" id="r_show">전체보기</p>
		                            </td>
		                        </tr>
		                    </table>
		                </div>
		            </div>
	           </div>
	        </div>
	    </div>
	</div>
</div>
<!-- 리뷰상세보기 -->
<div class="reviewDetails">
    <div class="window">
        <div class="popup" style="width: 900px; background-color: rgba(255,255,255,0.8);">
            <div class="pTitle">
            	<!-- 팝업 제목, 팝업 닫는 이미지 div -->
                <div class="seePhoto2">
                    <p>포토리뷰</p>
                    <img src="../images/closebutton.png" id="close4" onclick = 'closeDetailPop()'>
                </div>
	        </div>
	        <div class="reviewtext2">
                <div class="reviewlist2">
					<img src="../images/reviewimg/people.png" class="people">
					<table class="reviewtable" style="width: 760px;">
						<!-- 작성자 이름, 작성 날짜 -->
						<tr>
							<td class="re1" id = 'detail_pop_review_name'></td>
							<td class="re4" id='detail_pop_review_date'>2022.01.01</td>
						</tr>
						<!-- 작성한 숙소, 좋아요 갯수 -->
						<tr class="retr">
							<td class="re4" id="detail_pop_lodgement_room">이끌림호텔 천안점 &middot; 디럭스 더블</td>
							<td class="re2">
								<div><p>좋아요 <span id="detail_pop_like_num"></span><span class='likeIcon' id="is_liked" style='padding-left: 6px; vertical-align: middle;'><img class ='detaillikeButton' id = 'id_photo_review_r' src='../images/icon/like_off.png'></span></p></div>
							</td>
						</tr>
						<!-- 작성내용 -->
						<tr style="width: 760px;">
							<td class="re3"><p id="detail_pop_review_text"></p>
							</td>
						</tr>
					</table>
				</div>
   			</div>
   			<!-- 리뷰 상세보기 닫기 버튼 -->
            <div class="closeButton">
                <button type="button" onclick = 'closeDetailPop()'><p>닫기</p></button>
            </div>
	    </div>
	</div>
</div>

<!-- 취소규정 자세히 보기 팝업 -->
	<div class="cancelDetail">
	    <div class="window">
	        <div class="popup" style="width: 822px;">
	            <div class="pTitle">
	                <div class="seePhoto2">
	                    <p>취소규정</p>
	                    <img src="../images/closebutton.png" id="close10">
	                </div>
		            <div class='cacelList'>
						<h4>취소규정</h4>
						<p> &middot; 숙박 및 대실 완료 후 10분이내 당일취소 및 변경 가능합니다.</p>
						<p> &middot; 숙박 환불기준</p>
							<table class='lodgeTable'>
								<tr class='typeColumn'>
									<td>유형</td>
									<td>체크인 10일 전</td>
									<td>체크인 9-7일 전</td>
									<td>체크인 6-5일 전</td>
									<td>체크인 4-3일 전</td>
									<td>체크인 2-1일 전</td>
									<td>당일취소 및 노쇼</td>
								</tr>
								<tr class='refundColumn'>
									<td>환불기준</td>
									<td>총 결제금액 중 100% 환불</td>
									<td>총 결제금액 중 70% 환불</td>
									<td>총 결제금액 중 50% 환불</td>
									<td>총 결제금액 중 30% 환불</td>
									<td>총 결제금액 중 10% 환불</td>
									<td>환불 불가</td>
								</tr>
							</table>
						<p> &middot; 대실 환불기준</p>
							<table class='rentTable'>
								<tr class='typeColumn'>
									<td>유형</td>
									<td>체크인 1일 전</td>
									<td>당일취소 및 노쇼</td>
								</tr>
								<tr class='refundColumn'>
									<td>환불기준</td>
									<td>무료취소 가능</td>
									<td>환불 불가</td>
								</tr>
							</table>		              
			            </div>
			        </div>
			    </div>
			</div>
		</div>
		
		<!-- 숙박권 선물하기 팝업 -->
		<div class="background3">
			<div class="window">
				<div class="popup_gift_select"  style="border-radius:8px; padding:10px">
					<img src="../images/closebutton.png" id="close_gift_select">
					<div style="margin: 30px 0px; text-align: center; font-size: 18px;">
						선물하실 숙박권을 선택해주세요.
					</div>
	                <button type="button" class="weekdayGift" id="weekdayGift" style="width: 150px; background-color: white; border: 2px solid #4366A3; color: #4366A3; ">평일권</button>
	                <button type="button" class="weekendGift" id="weekendGift" style="width: 150px; background-color: white; border: 2px solid #4366A3; color: #4366A3; ">주말권</button>
				</div>
			</div>
		</div>
	  
    
    <!-- 객실예약,상세정보,리뷰 탭메뉴 -->
  <script>
  	var user_id = '<%=id%>';
    var roadedMaps = false;
    var lodge_type;
	var can_reserve;
	var isCheckinSelect = true;
	var storedCheckinDate = "";
	var storedCheckoutDate  = "";
    
    /* 상세보기,리뷰, 예약하기 탭 */
    function openMenu(evt, roomMenu) {
		var i, tabcontent, tablinks;
	  tabcontent = document.getElementsByClassName("tabcontent");
	  for (i = 0; i < tabcontent.length; i++) {
	   		 tabcontent[i].style.display = "none";
		}			
		tablinks = document.getElementsByClassName("tablinks");
	  for (i = 0; i < tablinks.length; i++) {
	  	tablinks[i].className = tablinks[i].className.replace(" active", "");
	  }
	  document.getElementById(roomMenu).style.display = "block";
	  evt.currentTarget.className += " active";
	  if(roomMenu == 'detailInfo' && !roadedMaps){
		  roadedMaps = true;
		  hotelMaps();
	  }
	}
    
    document.getElementById("defaultOpen").click();

    /* 리뷰갯수 */
	function reviewCount(){
		$('#review_num').text(data.reviews.length);
	}
</script>
	
 	<script>
 	
 	var room_id;
 	/* 숙박예약 팝업 열기 */
	$(document).on('click', '#s_show', function() {
		
		if (checkin != "null" && checkout != "null") {
			$('.background2').addClass('show');
			/* 숙박예약 버튼의 id를 가지고 와서 해당 id값의 데이터 가지고 오기 */	
	 		var attrId = $(this).attr('class');
			attrId = attrId.replace('room_id', "");
			room_id = $('#room_id'+attrId).text();
			
			$('#room_service').text($('#room_service'+attrId).text());
			$('#room_thumb_url_d').attr('src', $('#room_thumb_url'+attrId).attr('src'));
			
			$('.roomCheckIn').text(checkin);
			$('.roomCheckOut').text(checkout);
			
			// 숙박 대실 구별
			$('#reserveBtn').text('숙박 예약하기');
			$("#reserveBtn").removeClass("dReservation");
			$("#reserveBtn").addClass("sReservation");
			/* $('#giftBtn').attr('type', '1'); */
			
			$('#room_thumb_url_s').attr('src', $('#room_thumb_url'+attrId).attr('src'));
			//숙박예약 팝업의 데이터 넣는 ajax
			$.ajax({
				url : "../rooms?room="+ room_id + "&checkin="+ checkin + "&checkout=" + checkout, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					
					if(result.message == 'Success'){
						roomsdata = result.data;
						console.log(roomsdata);	
				
						viewPhotos();
						pop_RoomsService();
						
						lodge_type = 1;
						can_reserve = roomsdata.can_reserve_lodge;
						
						$('#room_name').text(roomsdata.room_name);
						$('#popAmenity').text(roomsdata.room_amenity);
						$('#specialNote').text(roomsdata.room_notice);
						
						$('#people_num').text(roomsdata.people_num);
						$('#max_people_num').text(roomsdata.max_people_num);
						$('#PopStandard').text(roomsdata.people_num);
						/* $('#serviceImg').attr('src',roomsdata.room_services.service_icon_url);
						$('#serviceText').text(roomsdata.room_services.service_name); */
						
						
												
						
						if(!can_reserve){
							$('#lodge_price').text("숙박 예약마감");
							$('#reserveBtn').css({'border': '2px solid #CBCBCB','color': '#CBCBCB', 'background-color':'white'}).text("예약 마감");							
						}else{
							if(roomsdata.is_business == true && roomsdata.business_user == true){
								$('#lodge_price').text("기업숙박 " + roomsdata.business_price.toLocaleString('en')+ "원");
							} else{
								$('#lodge_price').text("숙박 " + roomsdata.lodge_price.toLocaleString('en') + "원");								
							} 
							
						}
						
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
					alert("검색실패");
					return false;
				}
			})
			
		} else{
			alert("날짜를 선택해주세요.");
		}
	})
	//숙박예약 닫기
	$(document).on('click', '#close2', function() {
		$('.background2').removeClass('show');
	})
	
	/* 대실예약 팝업 열기 */
	$(document).on('click', '#d_show', function() {
		if (checkin != "null" && checkout != "null") {
			$('.background2').addClass('show');
			//대실예약버튼의 id값 가지고 와서 해당 id의 데이터값 받아오기
			var attrId = $(this).attr('class');
			attrId = attrId.replace('room_id', "");
			room_id = $('#room_id'+attrId).text();
			
			$('#room_name').text($('#room_name'+attrId).text());
			$('#lodge_price').text("대실" + $('#rent_price'+attrId).text());
			$('#people_num').text($('#people_num'+attrId).text());
			$('#max_people_num').text($('#max_people_num'+attrId).text());
			$('#room_service').text($('#room_service'+attrId).text());
			$('#room_thumb_url_s').attr('src', $('#room_thumb_url'+attrId).attr('src'));
			$('#popAmenity').text($('#roomAmenities'+attrId).text());
			$('#specialNote').text($('#roomNotices'+attrId).text());
			$('.roomCheckIn').text(checkin);
			$('.roomCheckOut').text(checkout);
			
			// 숙박 대실 구별
			$('#reserveBtn').text('대실 예약하기');
			$("#reserveBtn").removeClass("sReservation");
			$("#reserveBtn").addClass("dReservation");
			/* $('#giftBtn').attr('type', '0'); */
			
			$('#room_thumb_url_d').attr('src', $('#room_thumb_url'+attrId).attr('src'));
			//대실 데이터 받아오는 ajax
			$.ajax({
				url : "../rooms?room="+ room_id + "&checkin="+ checkin + "&checkout=" + checkout, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					
					if(result.message == 'Success'){
						roomsdata = result.data;
						console.log(roomsdata);	
				
						viewPhotos();
						pop_RoomsService();
						
						lodge_type = 0;
						can_reserve = roomsdata.can_reserve_rent;
						
						$('#room_name').text(roomsdata.room_name);
						$('#popAmenity').text(roomsdata.room_amenity);
						$('#specialNote').text(roomsdata.room_notice);
						$('#people_num').text(roomsdata.people_num);
						$('#max_people_num').text(roomsdata.max_people_num);
						
						if(!can_reserve){
							$('#lodge_price').text("대실 예약마감");
							$('#reserveBtn').css({'border': '2px solid #CBCBCB','color': '#CBCBCB','background-color': 'white'}).text("예약 마감");
						} else{							
							$('#lodge_price').text("대실 " + roomsdata.rent_price.toLocaleString('en') + "원");
						}
						
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
					alert("검색실패");
					return false;
				}
			})
			
		} else {
			alert("날짜를 선택해주세요.");
		}
	})
	
	/* 대실예약 팝업 닫기 */
	$(document).on('click', '#close', function() {
		$('.background').removeClass('show');
	})
	
	/* 전체보기 팝업 열고 닫기 */
	$(document).on('click', '#a_show', function() {
		$('.photoView').addClass('show');
	})
	
	$(document).on('click', '#close', function() {
		$('.photoView').removeClass('show');
	})
	
	/* 더보기 팝업 열고 닫기 */
	 $(document).on('click','#h_show',function(){
		$('.photos').addClass('show');
	}) 
	$(document).on('click','#close9',function(){
		$('.photos').removeClass('show');
	})
	
	/* 더보기 사진 클릭시 포토리뷰 팝업 */
	$(document).on('click', '.review_img_url', function() {
		//더보기의 사진 id를 가지고 와서 해당 id값의 데이터 받아오기
 		var attrId = $(this).attr('id');
		var review_id = attrId.replace('review_img', "");
		var img_idx = $(this).attr('idx');
		
		$('#pop_like_photo_id').attr({'idx' : review_id, 'src' : $('#is_liked'+review_id).children().attr('src')});
		$('#id_photo_review_r').attr({'idx' : review_id, 'src' : $('#is_liked'+review_id).children().attr('src')});
		
		$('#pop_review_img').attr({'src' : $('#review_img'+review_id).attr('src'), 'idx' : img_idx});
		$('#pop_writer_name').text($('#review_writer_name'+review_id).text());
		$('#pop_review_date').text($('#review_date'+review_id).text());
		$('#pop_lodgement_room').text($('#lodgement_room'+review_id).text());
		$('#pop_like_num').text($('#like_num'+review_id).text());
		$('#pop_review_text').text($('#review_text'+review_id).text());
		$('.photoReviews').addClass('show');
	})
	//더보기 팝업 닫기
	$(document).on('click','#close3',function(){
		$('.photoReviews').removeClass('show');
	})
	
	/* 리뷰상세보기 팝업 */
	$(document).on('click','#r_show',function(){
		
		var attrId = $(this).attr('id');
		var review_id = attrId.replace('review_imgs', "");
		
		$('#detail_pop_review_name').text($('#pop_writer_name').text());
		$('#detail_pop_review_date').text($('#pop_review_date').text());
		$('#detail_pop_like_num').text($('#pop_like_num').text());
		$('#detail_pop_lodgement_room').text($('#pop_lodgement_room').text());
		$('#detail_pop_review_text').text($('#pop_review_text').text());
		$('.reviewDetails').addClass('show');
	})
	
	function closeDetailPop() {
		$('.reviewDetails').removeClass('show');	
 	}
	
	 /* 숙박예약 팝업- 예약하기 버튼 클릭시 */ 
	$(document).on('click', '.sReservation', function(){
		// 로그인 상태 체크
		if (user_id == "null") {
			//로그인 안되있을때 로그인페이지로 넘어가기
			location.href = '../loginpage/login.jsp';
			return false;
		} else {
			if(!can_reserve) {
				alert("예약이 마감되었습니다.");
				return false;
			}
			
			//기업회원가가 없는 객실 confirm창
			if(roomsdata.is_business == false && roomsdata.business_user == true){//기업회원여부 확인
				if(confirm("기업회원가가 없는 객실입니다.\n예약을 진행하시겠습니까?")){
					location.href = '../reserhotel/sOption?type=1&room=' + room_id + '&checkin=' + checkin + '&checkout=' + checkout;
				} else {
					return false;
				}
			}
			
			// 숙박 대실 구별
			/* var type;
			if ($('#reserveBtn').text() == "숙박 예약하기") {
				type = 1;
			} else {
				type = 0;
			} */
			
			// lodgemnt_id, room_id, user_id를 사용해서 객실예약 페이지로 넘어가기
			/* if (checkin != "null" && checkout != "null") {
				location.href = 'sOption?type=' + type + '&room=' + room_id + '&checkin=' + checkin + '&checkout=' + checkout;
			} else {
				alert("날짜를 선택해주세요.");
				/* location.href = 'sOption?type=' + type + '&room=' + room_id; 
			} */
			
			
			// lodgemnt_id, room_id, user_id
			if (checkin != "null" && checkout != "null") {		
				
				$.ajax({
					url: "../GoodsNameCon.Webdo", // 컨트롤러 위치
					type: "post",
					data : {
						goodsName : $('#lodgement_name').text()
					},
					dataType: 'text',
					success: function(result) {
						if (result == 'errName') {
							alert("숙소 이름 오류");
						} else if(result == 'goodsName') {
							
							location.href = '../reserhotel/sOption?type=1&room=' + room_id + '&checkin=' + checkin + '&checkout=' + checkout;
						}
					},
					error: function() {
						alert("서버 요청 실패", "연결을 다시 확인 해주세요.");
						return false;
					}
				});
			} else {
				alert("날짜를 선택해주세요.");
			}
			
			return false;
		}
		
		return false;
	})
	//팝업의 대실예약하기 버튼 클릭시
	$(document).on('click', '.dReservation', function(){
		// 로그인 상태 체크
		if (user_id == "null") {
			location.href = '../loginpage/login.jsp';
			return false;
		} else {
			
			if(!can_reserve) {
				alert("예약이 마감되었습니다.");
				
				return false;
			}
			// 숙박 대실 구별
			<%-- var type;
			
			if ($('#reserveBtn').text() == "대실 예약하기") {
				type = 0;
			} else {
				type = 1;
			}
			
			// lodgemnt_id, room_id, user_id로 사용해서 대실예약페이지로 넘어가기
			if (checkin != "null" && checkout != "null") {
				location.href = 'dOption?type=' + type + '&room=' + room_id + '&checkin=' + checkin + '&checkout=' + checkin;
			} else {
				alert('날짜를 선택해주세요.');
				location.href = 'dOption?type=' + type + '&room=' + room_id + '&hotel=' + '<%=hotel%>';
			}
			 --%>
			 
			// lodgemnt_id, room_id, user_id
				if (checkin != "null" && checkout != "null") {
					
					$.ajax({
						url: "../GoodsNameCon.Webdo", // 컨트롤러 위치
						type: "post",
						data : {
							goodsName : $('#lodgement_name').text()
						},
						dataType: 'text',
						success: function(result) {
							if (result == 'errName') {
								alert("숙소 이름 오류");
							} else if(result == 'goodsName') {
								//lodgementName
								console.log(result);
								
								location.href = '../reserhotel/dOption?type=0&room=' + room_id + '&checkin=' + checkin + '&checkout=' + checkout;
							}
						},
						error: function() {
							alert("서버 요청 실패", "연결을 다시 확인 해주세요.");
							return false;
						}
					});
				} else {
					alert('날짜를 선택해주세요.');
				}
			 
			return false;
		}
		return false;
	})
	/* 객실예약팝업에서 선물하기 버튼 클릭시 */
	$(document).on('click', '.giftReservation', function(){
		$('.background3').addClass('show');
	})
	
	$(document).on('click', '#close_gift_select', function() {
		$('.background3').removeClass('show');
	});
	 
	$(document).on('click', '#weekdayGift', function() {
		// 로그인 상태 체크
		$.ajax({
			url: "../LoginStateCheckCon.do", // 컨트롤러 위치
			type: "post",
			dataType: 'text',
			success: function(result) {
				console.log(result)

				if (result == "loginFalse") {
					location.href = '../loginpage/login.jsp';
					return false;
				} else if (result == "loginTrue") {					
					location.href = '../reserhotel/giftRoom?type=0&room=' + room_id + '&isGiftcard=false';
					
					return false;
				}
				
				return false;
			},
			error: function() {
				alert("서버 요청 실패", "연결을 다시 확인 해주세요.");
				return false;
			}
		});
	});
	
	$(document).on('click', '#weekendGift', function() {
		$.ajax({
			url: "../LoginStateCheckCon.do", // 컨트롤러 위치
			type: "post",
			dataType: 'text',
			success: function(result) {
				console.log(result)

				if (result == "loginFalse") {
					location.href = '../loginpage/login.jsp';
					return false;
				} else if (result == "loginTrue") {					
					location.href = '../reserhotel/giftRoom?type=1&room=' + room_id + '&isGiftcard=false';
					
					return false;
				}
				
				return false;
			},
			error: function() {
				alert("서버 요청 실패", "연결을 다시 확인 해주세요.");
				return false;
			}
		});
	});
	 
	
	/* 취소규정 팝업 열고 닫기 */
	$(document).on('click','.see',function(){
 		$('.cancelDetail').addClass('show');
 		$('.background2').hide();
 	})
 	$(document).on('click','#close10',function(){
 		$('.cancelDetail').removeClass('show');
 		$('.background2').show();
 	})
 	
	
 	</script>
 	<script>	
 	var lodgement = '<%=hotel%>';
 	var checkin = '<%= checkin%>';
	var checkout = '<%= checkout%>';
	var review = '<%=review%>';
	var hotelMap;
	var hotelName;
	var lodgement_id;
	
	
	if (checkin == 'null' || checkout == 'null') {
		var urlSearch = new URLSearchParams(location.search);
		urlSearch.set('checkin', '<%=todayString%>');
		urlSearch.set('checkout', '<%=tomorrowString%>');
		
		location.replace('../lodgement/' + lodgement + '?' + urlSearch.toString());
	} else {
		$('#dateSearchCondition').val(checkin + " ~ " + checkout);
	}
	
	storedCheckinDate = checkin;
	storedCheckoutDate = checkout;
	
		$(function() {
			/* 객실예약 데이터 ajax */
			$.ajax({
				url : "../lodgement-info?lodgement="+ lodgement + "&checkin="+ checkin + "&checkout=" + checkout, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					
					if(result.message == 'Success'){
						data = result.data;
						console.log(data);	
												
						roomLists();
						hotelInfo();
						roomService();
						wishlists();
						viewAll();				
						reviewCount();

						hotelMap = data.lodgement_address;
						hotelName = data.lodgement_name;
						hotelImg = data.lodgement_images[0].lodgement_img_url;
						lodgement_id = data.lodgement_id;
						
						
						
						/* likes(); */
						reviews();
						// hotelMeta();
						hotelMaps();
						
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
					alert("검색실패");
					return false;
				}
			})
						
		})
				
		
		$(function() {
			/* 호텔 상세정보 ajax */
			 $.ajax({
				url : "../lodgement-detail?lodgement="+ lodgement, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        }, 
				success : function(result){
					
					if(result.message == 'Success'){
						data = result.data;
						console.log(data);	
						roominfo = data.room_infos;
						
						hotelDetailInfo();
						roomOptionTable();
						
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
					alert("검색실패");
					return false;
				}
			}) 
			
		})
		
		function hotelMeta(){
			document.getElementById('description').setAttribute('content',hotelMap +" | 바이인호텔");
			document.getElementById('ogDescription').setAttribute('content',hotelMap +" | 바이인호텔");
			document.getElementById('ogTitle').setAttribute('content',hotelName +" | 바이인호텔");
			document.getElementById('twitterTitle').setAttribute('content',hotelName +" | 바이인호텔");
			document.getElementById('twitterDescription').setAttribute('content',hotelMap +" | 바이인호텔");
			document.getElementById('ogImg').setAttribute('content',hotelImg);
		}
	</script>
	
	    <script>
	    
	    /* 호텔 메인이름, 주소, 이미지, 전화번호 */
		function hotelInfo() {
			document.title = data.lodgement_name + " | 바이인호텔";
			
			$('#lodgement_name').text(data.lodgement_name);
			$('#lodgement_address').text(data.lodgement_address.replaceAll("//", ""));
			var phoneNumber = data.lodgement_tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
			
			$('#lodgement_tel').text(phoneNumber);
			$('#lodgement_detail').text(data.lodgement_detail);
			
			for(var i=0; i < data.lodgement_images.length; i++){
				//사진이 1개일때 큰 호텔 사진 하나만 보여주고 두번째 사진 div는 안보이게 하기
				if(data.lodgement_images.length == 1){
					$('#lodgement_img_url2').css('display','none');
				} 
				//큰 호텔 사진의 첫번째
				if(i == 0){
					$('#lodgement_img_url1').attr("src", data.lodgement_images[0].lodgement_img_url);
				} else if(i == 1){
					//큰 호텔 사진의 두번째
					$('#lodgement_img_url2').attr("src", data.lodgement_images[1].lodgement_img_url);
				} else{
					break;
				}
			}
	    }
	    
	    /* 호텔 상세정보탭의 호텔정보에 들어가는 데이터 함수 */
	function hotelDetailInfo(){
	    	
	    var lodgement_address_detail = data.lodgement_address_detail;
	    
		if (lodgement_address_detail === undefined){
			lodgement_address_detail = ""
		}
		
		$('#hotelAdderess').text(data.lodgement_address.replaceAll("//", "") + " " + lodgement_address_detail);
		
		var hotelNumber = data.lodgement_tel.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
		$('#hotel_tel').text(hotelNumber);
		$('#hotelRoomCount').text(data.room_count);
			
		/* 호텔 룸 타입들 넣기 */
		var room_name_list = "";
		for (var i = 0; i < roominfo.length; i++){
			if(i != roominfo.length-1) {
				room_name_list += (roominfo[i].room_name + " / ");
			} else { 										
				room_name_list += (roominfo[i].room_name);	//호텔의 마지막 룸에 / 없애기
			}
		}
		$('#roomTypes').text(room_name_list);
	}
	    
	</script>
	<script>
		/* 호텔 상세정보탭의 객실정보 데이터 넣는 함수 */
		function roomOptionTable(){
			for (var i = 0; i < data.room_infos.length; i++) {
				$('.roomtable').append(
					"<tr>"
						+"<td>" + data.room_infos[i].room_name + "</td>"
						+"<td><span id='roomAmenities" + i + "'>" + data.room_infos[i].room_amenity + "</span></td>"
						+"<td><span id='roomNotices" + i +"'>" + data.room_infos[i].room_notice.replaceAll("\n","<br>") + "</span></td>"
					+"</tr>"
				)
			}
		}
		
		/* 숙소예약 팝업에 날짜변경 버튼 클릭시 */
		$(document).on('click','#changeDateBtn',function(){
			$('.background2').removeClass('show');
			$('.dateCalendar').focus();
			$('#dateCalendar').trigger('click');
		})
		
	</script>
	
	<script>
	/* 리뷰탭에 리뷰들 보여주기 */
	function reviews() {
		for (var i = 0; i < data.reviews.length; i++) {
			/* 해당 리뷰의 좋아요 데이터가 true일때 좋아요 이미지 상태 변화*/
			if (data.reviews[i].is_liked == "true" || data.reviews[i].is_liked == true) {
				 $('.review_text').append(
					"<div class='reviewlist' style='border-top: 1px solid #C7C7C7;'>" 
		               + "<img src='../images/reviewimg/people.png' class= 'people'>"
		                +"<table class='reviewtable'>"
		                    +"<tr>"
		                        +"<td class='re1' id = 'review_writer_name" + data.reviews[i].review_id + "'>" + data.reviews[i].review_writer_name + "님</td>"
		                        +"<td class='re4' id = 'review_date"+ data.reviews[i].review_id+"'>" + data.reviews[i].review_date+ "</td>"
		                    +"</tr>"
		                    +"<tr class='retr'>"
		                        +"<td class='re4' id = 'lodgement_room" + data.reviews[i].review_id+"'>" + data.lodgement_name +"&middot;" + data.reviews[i].room_name +"</td>"
		                        +"<td class='re2'><div><p>좋아요 <span id = 'like_num" + data.reviews[i].review_id+"'>" + data.reviews[i].like_num +"</span><span class='likeIcon' id='is_liked"+ data.reviews[i].review_id+"' style='padding-left: 6px; vertical-align: middle;'><img idx = '" + data.reviews[i].review_id + "'class ='likeButton' src='../images/icon/like_on.png'></span></p></div></td>"
		                    +"</tr>"
		                    +"<tr style='width: 980px;'>"
		                        +"<td class='re3' id = 'review_text" + data.reviews[i].review_id+"'>" + data.reviews[i].review_text +"</td>"
		                    +"</tr>"
		                +"</table>"
		            +"</div>"	            
				);
			} else if (data.reviews[i].is_liked == "false" || data.reviews[i].is_liked == false) {
				/* 해당 리뷰의 좋아요 데이터가 false 일때 이미지 상태 변화*/
				$('.review_text').append(
					"<div class='reviewlist' style='border-top: 1px solid #C7C7C7;'>" 
		               + "<img src='../images/reviewimg/people.png' class= 'people'>"
		                +"<table class='reviewtable'>"
		                    +"<tr>"
		                        +"<td class='re1' id = 'review_writer_name" + data.reviews[i].review_id + "'>" + data.reviews[i].review_writer_name + "님</td>"
		                        +"<td class='re4' id = 'review_date" + data.reviews[i].review_id+"'>" + data.reviews[i].review_date+ "</td>"
		                    +"</tr>"
		                    +"<tr class='retr'>"
		                        +"<td class='re4' id = 'lodgement_room" + data.reviews[i].review_id+"'>" + data.lodgement_name +"&middot;" + data.reviews[i].room_name +"</td>"
		                        +"<td class='re2'><div><p>좋아요 <span id = 'like_num" + data.reviews[i].review_id+"'>" + data.reviews[i].like_num +"</span><span class='likeIcon' id='is_liked"+data.reviews[i].review_id+"' style='padding-left: 6px; vertical-align: middle;'><img idx = '" + data.reviews[i].review_id + "'class ='likeButton' src='../images/icon/like_off.png'></span></p></div></td>"
		                    +"</tr>"
		                    +"<tr style='width: 980px;'>"
		                        +"<td class='re3' id = 'review_text"+data.reviews[i].review_id+"'>" + data.reviews[i].review_text +"</td>"
		                    +"</tr>"
		                +"</table>"
		            +"</div>"	            
				);
			}
			//리뷰의 사진 데이터가 있을때
			if(data.reviews[i].review_img_url != null){
				$('.pCollect').append(
	               "<img src=" + data.reviews[i].review_img_url + " id='review_img" + data.reviews[i].review_id+"' class='review_img_url' idx = '" + i +"'>"
				)
			}
		}
	
		/* 포토리뷰 모아보기 */
		var photoReviewList = data.reviews.filter(review => review.review_img_url != null);
		//리뷰 사진 데이터가 없으면 더보기 div 안보이게
		if(photoReviewList.length == 0)  {
			$('.more').css("display", "none");
		} else if (photoReviewList.length < 7){
			//리뷰 사진 데이터가 6개면 더보기 div 안보이고 해당 리뷰 사진들만 보여줌 
			$('.more').css("display", "none");
			
			for(var i=0;i< photoReviewList.length; i++){
				$('.collection').append(
                   "<img src=" + photoReviewList[i].review_img_url + " class = 'review_img_url review_top" + photoReviewList[i].review_id+"' id='review_img"+photoReviewList[i].review_id+"' idx = '" + i + "'>"
				)
			}
		} else {
			//리뷰 사진 데이터가 6개 이상이면 더보기 div 보여주고 해당 리뷰 사진들 보여줌
			for(var i=0;i< photoReviewList.length; i++){
				$('.collection').append(
                   "<img src=" + photoReviewList[i].review_img_url + " class = 'review_img_url review_top" + photoReviewList[i].review_id+"' id='review_img"+photoReviewList[i].review_id+"' idx = '" + i + "'>"
				)
				if(i == 5){
					//리뷰 사진 갯수면 for문 중단
					break;
				}
			}
		}
		<%String moveReview = request.getParameter("review");%>
		
		var moveReview = '<%=moveReview%>';
		if(moveReview == 1) {
			openMenu(event,'roomReviews');
			$('.reviewActive').addClass('active');
		}
	}

	</script>
	
	<script>

		/* 더보기 팝업 - 리뷰이미지 없는 부분 빼고 보여주기 */
		function reviewImgs(){
			var reviewImgList = data.reviews.filter(review => review.review_img_url != null);
			
				for(var i=0;i< reviewImgList.length; i++){
					$('.pCollect').append(
	                   "<img src=" + reviewImgList[i].review_img_url + " id='review_img_"+i+"' class='review_img_url'>"
					)
				}
			}
		
		 function reviewSummary(review_id){
			 
			$('.reviewSummary *').remove();
			
			$('.reviewSummary').append(
				 "<div class='mainphoto'>"
	               +"<img src='"+ $('#review_img'+review_id) +" class='review_img_url''>" 
	                +"<div class='direction'>"
	                 +"<img src=''../images/blackleft.png' style='margin-left: 6px; float: left; margin-top: -80px;''>"
	                  +"<img src='../images/blackright.png' style='margin-right: 6px; float: right; margin-top: -80px;''>"
	                +"</div>"
	            +"</div>"
		            +"<div class='photoRivews'>"
		             +"<div class='reviewlist2'>"
		              +"<img src='../images/reviewimg/people.png' class='people'>"
		              +"<span id = 'review_id"+i+"' style = 'display:none;'>" + summaryList[i].review_id + "</span>"
		               +"<table class='reviewtable'>"
			                +"<tr>"
			                 +"<td class='re1' id = 'review_writer_name"+i+"'>" + summaryList[i].review_writer_name + "님</td>"
			                 +"<td class='re4' id = 'review_date"+i+"'>" + summaryList[i].review_date + "</td>"
			                +"</tr>"
			                +"<tr class='retr'>"
			                    +"<td class='re4' >"+ data.lodgement_name +"&middot;<span id = 'room_name"+i+"'>"+ summaryList[i].room_name + "</span></td>"
			                    +"<td class='re2'><div><p>좋아요 <span id = 'like_num"+data.review[i].review_id+"'>" + data.reviews[i].like_num +"</span><span class='likeIcon' id='is_liked"+data.reviews[i].review_id+"' style='padding-left: 6px; vertical-align: middle;'f><img idx = '" + data.reviews[i].review_id + "'class ='likeButton' src='../images/icon/like_off.png'></span></p></div></td>"
			                +"</tr>"
			                +"<tr style='width: 800px;'>"
			                    +"<td class='re3' style='overflow: hidden; white-space: nowrap; max-width: 820px; table-layout:fixed' id = 'review_text"+i+"'>" + summaryList[i].review_text +"<p class='all' id='r_show'>전체보기</p>"
			                    +"</td>"
			                +"</tr>"
		             +"</table>"
	               +"</div>"
	            +"</div>"
				)
			}
	
	</script>
	<script>
	/* 호텔 객실예약 탭에 호텔 article의 편의시설, 서비스 데이터 부분 */
	function roomService(){
		for(var i in data.rooms) {
			$('.reservationImgs'+i).append(
				"<textarea class = 'service_list'>" + data.rooms[i].room_service + "</textarea>"
			)
		}
		
		for(var i=0;i< data.lodgement_service.length; i++){
				$('.serviceCollection').append(
					"<div class='serviceContent'>"
			        	+"<img class='serviceContentImg' src=" + data.lodgement_service[i].service_icon_url + ">"
			        	+"<p>" + data.lodgement_service[i].service_name + "</p>"
		        	+"</div>"
				);
					
				/* $('.reservationImgs').append(
					 "<div class='img1 serveiceImg'>"
			            +"<img id='serviceImg' src='" + data.lodgement_service[i].service_icon_url + "'>"
			                +"<p id='serviceText'>" + data.lodgement_service[i].service_name + "</p>"
		            +"</div>"
				);*/
				
				}
			}
	/* 객실예약 팝업의 제공사항 img와 text 데이터 */
	 function pop_RoomsService(){
		 $('.noticeIcon *').remove();
		 
		for(var i = 0; i < roomsdata.room_services.length; i++){
			$('.noticeIcon').append(
					"<div class='img1'>"
					   +"<img id='serviceImg' src='" + roomsdata.room_services[i].service_icon_url + "'>"
					    +"<p id='serviceText'>" + roomsdata.room_services[i].service_name + "</p>"
					+"</div>"	
				);
			}
		}
	
	</script>
	<script>
		/* 객실예약 객실 정보 article 데이터 넣는 함수 */
		function roomLists() {
			const getDateDiff = (d1,d2) => {
				const date1 = new Date(d1);
				const date2 = new Date(d2);
				
				const diffDate = date1.getTime() - date2.getTime();
				
				return Math.abs(diffDate / (1000 * 60 * 60 * 24));
			}
			
		
		for(var i = 0; i < data.rooms.length; i++){
			//1박이고 rent_period가 null이 아닐때만 대실 보여줌
			if(getDateDiff(checkin, checkout) == 1 && data.rooms[i].can_reserve_rent != null){
				
				/* 객실예약탭 - 대실,숙박버튼 다 보이기 */
				$('#reservationRoom').append(
					 "<div class='article2'>"
						+"<div class='roomImg'>"
						 	+"<img alt='숙소사진' id = 'room_thumb_url" + i + "' src='" + data.rooms[i].room_images[0].room_img_url+ "'>"
						+"</div>"
								<!-- 객실타입 -->
						+"<div class='select_table'>"
					       +"<div class='reservationTitle'>"
					           +"<h4 id = 'room_name"+i+"'>" + data.rooms[i].room_name + "</h4>"
					           +"<span id = 'room_id"+i+"' style = 'display:none;'>" + data.rooms[i].room_id + "</span>"
					            +"<p class='standard'>기준 <span id='people_num"+i+"'>" + data.rooms[i].people_num+"</span>/최대<span id='max_people_num"+i+"'>"+ data.rooms[i].max_people_num + "</span></p>"
					        +"</div>"
					        +"<div class='reservationImgs" + i +  "' style = 'float: right; max-height: 120px; height: 100%; margin-right: 0;'>"
					        +"</div>"
				  	     	+"<div class='priceBox'>"
						        +"<div class='reservationText1'>"
						        	+"<div class='cardBox rentBox"+ i +"'>"
							           
						        	+"</div>"
						       +"</div>"
						        +"<div class='reservationText2 businessCard" + i + "'>"
						        	+"<div class='cardBox lodgeBox" + i + "'>"
							        	
						        	+"</div>"
						        	
						        +"</div>"
					        +"</div>"
					        +"<div class='reservationButton'>"
						        +"<button type='button'	id='d_show' class = 'room_id"+i+"' style='border: 2px solid #5da9d4; color: #5da9d4; margin-right: 18px;'>대실예약</button>"
						        +"<button type='button' id='s_show' class = 'room_id"+i+"' style='border: 2px solid #434FBA; color: #434FBA;'>숙박예약</button>"
					        +"</div>"
					    +"</div>"		
				    +"</div>"		
				)
				
					//기업회원 가격 데이터가 있을때 
					if(data.rooms[i].is_business == true){
						if(data.rooms[i].can_reserve_lodge == true ){
							if(data.rooms[i].business_dc_rate > 0){
								$('.businessCard'+i).append(
									"<div class='cardBox'>"
							        	+"<div class='titleBox'>"
								            +"<p class='text1'>기업숙박</p>"
								            +"<p class='standardTime'>" + data.rooms[i].lodge_begin +" 부터</p>"
							        	+"</div>"
							            +"<div class='Texts lodge" + i + " lodgeClose" + i + "'>"
							            	+"<p class='saleLodgeArea" + i + " lodge" + i + "'><span style='float: none;' id='salePercent'>" + data.rooms[i].business_dc_rate + "%</span><span style='float: none;' id='SalePrice'>" + data.rooms[i].business_list_price.toLocaleString('en') + "</span></p>"
							              +"<span id = 'lodge_price"+i+"'>" + data.rooms[i].business_price.toLocaleString('en') + "원</span>"
							            +"</div>"
						        	+"</div>"
								)
								
							} else {
								
								$('.businessCard'+i).append(
									"<div class='cardBox'>"
							        	+"<div class='titleBox'>"
								            +"<p class='text1'>기업숙박</p>"
								            +"<p class='standardTime'>" + data.rooms[i].lodge_begin +" 부터</p>"
							        	+"</div>"
							            +"<div class='Texts lodge" + i + " lodgeClose" + i + "'>"
							              +"<span id = 'lodge_price"+i+"'>" + data.rooms[i].business_price.toLocaleString('en') + "원</span>"
							            +"</div>"
						        	+"</div>"
								)
							}
							$('.reservationText1').css('padding-top','62px');
							
						} else if(data.rooms[i].can_reserve_lodge == false){
							$('.businessCard'+i).append(
									"<div class='cardBox'>"
							        	+"<div class='titleBox'>"
								            +"<p class='text1'>기업숙박</p>"
							        	+"</div>"
							            +"<div class='Texts lodge" + i + " lodgeClose" + i + "'>"
							              +"<span id = 'lodge_price"+i+"'>예약마감</span>"
							            +"</div>"
						        	+"</div>"
								)
						}
												
					}
					//숙박 예약마감 판단
					if(data.rooms[i].can_reserve_lodge == true){
						if(data.rooms[i].lodge_dc_rate > 0){
							$('.lodgeBox'+i).append(
								"<div class='titleBox'>"
						            +"<p class='text1'>숙박 </p>"
						            +"<p class='standardTime'>" + data.rooms[i].lodge_begin +" 부터</p>"
					        	+"</div>"
					            +"<div class='Texts lodge" + i + " lodgeClose" + i + "'>"
					            	+"<p class='saleLodgeArea" + i + " lodge" + i + "'><span style='float: none;' id='salePercent'>" + data.rooms[i].lodge_dc_rate + "%</span><span style='float: none;' id='SalePrice'>" + data.rooms[i].lodge_list_price.toLocaleString('en') + "</span></p>"
					              +"<span id = 'lodge_price"+i+"'>" + data.rooms[i].lodge_price.toLocaleString('en') + "원</span>"
					            +"</div>"		
							)
						} else {
							$('.lodgeBox'+i).append(
								"<div class='titleBox'>"
						            +"<p class='text1'>숙박 </p>"
						            +"<p class='standardTime'>" + data.rooms[i].lodge_begin +" 부터</p>"
					        	+"</div>"
					            +"<div class='Texts lodge" + i + " lodgeClose" + i + "'>"
					              +"<span id = 'lodge_price"+i+"'>" + data.rooms[i].lodge_price.toLocaleString('en') + "원</span>"
					            +"</div>"		
							)
						}
					}  else {
							$('.lodgeBox'+i).append(
								"<div class='titleBox'>"
						            +"<p class='text1'>숙박 </p>"
					        	+"</div>"
					            +"<div class='Texts lodge" + i + " lodgeClose" + i + "'>"
					              +"<span id = 'lodge_price"+i+"'>예약마감</span>"
					            +"</div>"		
							)
						}
					
					//대실 예약마감 판단
					if(data.rooms[i].can_reserve_rent == true){
						if(data.rooms[i].rent_dc_rate > 0){
							$('.rentBox'+i).append(
								"<div class='titleBox'>"
						            +"<p class='text1'>대실 </p>"
						            +"<p class='standardTime'>최대 " + data.rooms[i].rent_period+ "시간</p>"						        		
				        		+"</div>"
				        		+"<div class='rentClose" + i + "'>"
					        		+"<p><span style='float: none;' id='salePercent'>" + data.rooms[i].rent_dc_rate + "%</span><span style='float: none;' id='SalePrice'>" + data.rooms[i].rent_list_price.toLocaleString('en') + "</span></p>"
						            +"<span id = 'rent_price"+i+"'>" +data.rooms[i].rent_price.toLocaleString('en') + "~원</span>"
					            +"</div>"		
							)							
						} else if(data.rooms[i].rent_dc_rate == 0){
							$('.rentBox'+i).append(
								"<div class='titleBox'>"
						            +"<p class='text1'>대실 </p>"
						            +"<p class='standardTime'>최대 " + data.rooms[i].rent_period + "시간</p>"						        		
				        		+"</div>"
				        		+"<div class='rentClose" + i + "'>"
						            +"<span id = 'rent_price"+i+"'>" +data.rooms[i].rent_price.toLocaleString('en') + "~원</span>"
					            +"</div>"		
							)
						}
					} else if(data.rooms[i].can_reserve_rent == false){
						$('.rentBox'+i).append(
							"<div class='titleBox'>"
					            +"<p class='text1'>대실 </p>"
			        		+"</div>"
			        		+"<div class='rentClose" + i + "'>"
					            +"<span id = 'rent_price"+i+"'>예약마감</span>"
				            +"</div>"		
						)
					} 
					
					
					$('.room_id'+ i).each(function() {
						var id = $(this).attr('id');
						
						if(id == 's_show') {
							if(data.rooms[i].can_reserve_lodge == false) {
								$(this).css({'border': '2px solid #CBCBCB', 'color':'#CBCBCB'}).text("예약 마감");
							}
						} else if(id == 'd_show') {
							if(data.rooms[i].can_reserve_rent == false) {
								$(this).css({'border': '2px solid #CBCBCB', 'color':'#CBCBCB'}).text("예약 마감");
							}
						}
					});
			} else {
				/* 객실예약 탭  - 대실예약이 없을때 숙박예약버튼만 보이기*/
				$('#reservationRoom').append(
					"<div class='selectlist'>"
						+ "<div class='article2'>"
							+"<div class='roomImg'>"
							 	+"<img alt='숙소사진' id = 'room_thumb_url" + i + "' src='" + data.rooms[i].room_images[0].room_img_url+ "'>"
							+"</div>"
									<!-- 객실타입 -->
							+"<div class='select_table2'>"
						       +"<div class='reservationTitle'>"
						           +"<h4 id = 'room_name"+i+"'>" + data.rooms[i].room_name + "</h4>"
						           +"<span id = 'room_id"+i+"' style = 'display:none;'>" + data.rooms[i].room_id + "</span>"
						            +"<p class='standard'>기준 <span id='people_num"+i+"'>" + data.rooms[i].people_num+"</span>/최대<span id='max_people_num"+i+"'>"+ data.rooms[i].max_people_num + "</span></p>"
						        +"</div>"
						        +"<div class='reservationImgs" + i +  "' style = 'float: right; max-height: 120px; height: 100%; margin-right: 0;'>"
					        	
						        +"</div>"
						       +"<div class='reservationText2 businessCard" + i + "'>"
						       		+"<div class='cardBox lodgeBox" + i + "'>"
						       			
						       		+"</div>"
				                +"</div>"
				                +"<div class='reservationButton'>"
				                	+"<button type='button'	id='s_show' class = 'room_id"+i+"' style='border: 2px solid #434FBA; color: #434FBA;'>숙박예약</button>"
				                +"</div>"
						    +"</div>"		
					    +"</div>"	
				    +"</div>"
				)
				
				//기업회원 가격 데이터가 있을때 
				if(data.rooms[i].is_business == true){
					if(data.rooms[i].can_reserve_lodge == true ){
						if(data.rooms[i].business_dc_rate > 0){
							$('.businessCard'+i).append(
								"<div class='cardBox'>"
						        	+"<div class='titleBox'>"
							            +"<p class='text1'>기업숙박</p>"
							            +"<p class='standardTime'>" + data.rooms[i].lodge_begin +" 부터</p>"
						        	+"</div>"
						            +"<div class='Texts lodge" + i + " lodgeClose" + i + "'>"
						            	+"<p class='saleLodgeArea" + i + " lodge" + i + "'><span style='float: none;' id='salePercent'>" + data.rooms[i].business_dc_rate + "%</span><span style='float: none;' id='SalePrice'>" + data.rooms[i].business_list_price.toLocaleString('en') + "</span></p>"
						              +"<span id = 'lodge_price"+i+"'>" + data.rooms[i].business_price.toLocaleString('en') + "원</span>"
						            +"</div>"
					        	+"</div>"
							)
							
						} else {
							
							$('.businessCard'+i).append(
								"<div class='cardBox'>"
						        	+"<div class='titleBox'>"
							            +"<p class='text1'>기업숙박</p>"
							            +"<p class='standardTime'>" + data.rooms[i].lodge_begin +" 부터</p>"
						        	+"</div>"
						            +"<div class='Texts lodge" + i + " lodgeClose" + i + "'>"
						              +"<span id = 'lodge_price"+i+"'>" + data.rooms[i].business_price.toLocaleString('en') + "원</span>"
						            +"</div>"
					        	+"</div>"
							)
						}
						$('.reservationText1').css('padding-top','62px');
						
					} else if(data.rooms[i].can_reserve_lodge == false){
						$('.businessCard'+i).append(
								"<div class='cardBox'>"
						        	+"<div class='titleBox'>"
							            +"<p class='text1'>기업숙박</p>"
						        	+"</div>"
						            +"<div class='Texts lodge" + i + " lodgeClose" + i + "'>"
						              +"<span id = 'lodge_price"+i+"'>예약마감</span>"
						            +"</div>"
					        	+"</div>"
							)
					}
											
				}
				//숙박 예약마감 판단
				if(data.rooms[i].can_reserve_lodge == true){
					if(data.rooms[i].lodge_dc_rate > 0){
						$('.lodgeBox'+i).append(
							"<div class='titleBox'>"
					            +"<p class='text1'>숙박 </p>"
					            +"<p class='standardTime'>" + data.rooms[i].lodge_begin +" 부터</p>"
				        	+"</div>"
				            +"<div class='Texts lodge" + i + " lodgeClose" + i + "'>"
				            	+"<p class='saleLodgeArea" + i + " lodge" + i + "'><span style='float: none;' id='salePercent'>" + data.rooms[i].lodge_dc_rate + "%</span><span style='float: none;' id='SalePrice'>" + data.rooms[i].lodge_list_price.toLocaleString('en') + "</span></p>"
				              +"<span id = 'lodge_price"+i+"'>" + data.rooms[i].lodge_price.toLocaleString('en') + "원</span>"
				            +"</div>"		
						)
					} else {
						$('.lodgeBox'+i).append(
							"<div class='titleBox'>"
					            +"<p class='text1'>숙박 </p>"
					            +"<p class='standardTime'>" + data.rooms[i].lodge_begin +" 부터</p>"
				        	+"</div>"
				            +"<div class='Texts lodge" + i + " lodgeClose" + i + "'>"
				              +"<span id = 'lodge_price"+i+"'>" + data.rooms[i].lodge_price.toLocaleString('en') + "원</span>"
				            +"</div>"		
						)
					}
				}  else {
						$('.lodgeBox'+i).append(
							"<div class='titleBox'>"
					            +"<p class='text1'>숙박 </p>"
				        	+"</div>"
				            +"<div class='Texts lodge" + i + " lodgeClose" + i + "'>"
				              +"<span id = 'lodge_price"+i+"'>예약마감</span>"
				            +"</div>"		
						)
					}
				
				$('.room_id' + i).each(function() {
						var id = $(this).attr('id');
						
						if(id == 's_show') {
							if(data.rooms[i].can_reserve_lodge == false) {
								$(this).css({'border': '2px solid #CBCBCB', 'color':'#CBCBCB'}).text("예약 마감");
							}
						}
					});
			}
		}
	}
	
	</script>
	
	<script>
		/* 위시리스트 버튼 상태에 따라 위시리스트 이미지 색깔 변경 */
		function wishlists() {
			if(data.is_wished == true){
				$('.wishlistImg').append(
					"<img id='wishButton' src='../images/icon/wishlist_on.png'>"	
				);
			} else if(data.is_wished == false){
				$('.wishlistImg').append(
					"<img id='wishButton' src='../images/icon/wishlist_off.png'>"	
				)
			}
		}
		/* 좋아요 버튼 상태에 따라 좋아요 버튼 색깔 변경 */	
 		function likes(){
 			for (var i = 0; i < data.reviews.length; i++) {
				if(data.reviews[i].is_liked == true){
					$('.likeIcon').append(
						"<img class='likeButton' src='../images/icon/like_on.png'>"
					);
				} else if(data.reviews[i].is_liked == false){
					$('.likeIcon').append(
						"<img class='likeButton' src='../images/icon/like_off.png'>"
					);
				}
 			}
		}
		 
		/* 리뷰 좋아요 버튼 클릭시 좋아요 버튼 색깔 변화 */
		$(document).on('click','.likeButton', function(){
			
			var is_like = "../images/icon/like_on.png"; 
			var is_dislike = "../images/icon/like_off.png";
			 
			 /* review_id 받아오기 */
			 var review = $(this).attr('idx');
			
			 /* 리뷰 좋아요 버튼 클릭시 좋아요 취소 */
			 if($(this).attr('src') == is_like){
				 $(this).attr('src', is_dislike);
				 
				 var like_id = $(this).parent().attr('id');
				 like_id = like_id.replace("is_liked","");
				 
				 var like_num = $('#like_num'+like_id).text();
				 $('#like_num'+like_id).text(like_num*1-1);
				 
				 likeDelete(review);
			 
			 } else if($(this).attr('src') == is_dislike){
				 /* 리뷰 좋아요 버튼 클릭시 좋아요 선택 */
				 $(this).attr('src', is_like);
				
				 var like_id = $(this).parent().attr('id');
				 like_id = like_id.replace("is_liked","");
				 
				 var like_num = $('#like_num'+like_id).text();
				 $('#like_num'+like_id).text(like_num*1+1);
				 
				likePost(review);	 
			 }
		})
		/* 리뷰팝업의 좋아요 버튼 클릭 후 좋아요 버튼 변화 */
		$(document).on('click','.poplikeButton', function(){
			
			var is_like = "../images/icon/like_on.png"; 
			var is_dislike = "../images/icon/like_off.png";
			 
			 /* review_id 받아오기 */
			 var review = $(this).attr('idx');
			
			 /* 리뷰 좋아요 버튼 클릭시 좋아요 취소 */
			 if($(this).attr('src') == is_like){
				 $(this).attr('src', is_dislike);
				 
				 var like_id = $(this).parent().attr('id');
				 like_id = like_id.replace("is_liked","");
				 
				 var like_num2 = $('#pop_like_num'+like_id).text();
				 $('#pop_like_num'+like_id).text(like_num2*1-1);
				 
				 likeDelete(review);
			 
			 } else if($(this).attr('src') == is_dislike){
				 /* 리뷰 좋아요 버튼 클릭시 좋아요 선택 */
				 $(this).attr('src', is_like);
				
				 var like_id = $(this).parent().attr('id');
				 like_id = like_id.replace("is_liked","");
				 
				 var like_num2 = $('#pop_like_num'+like_id).text();
				 $('#pop_like_num'+like_id).text(like_num2*1+1);
				 
				likePost(review);	 
			 }
		})
			/* 리뷰 상세보기 좋아요 버튼 클릭시 좋아요 변화 */
			$(document).on('click','.detaillikeButton', function(){
			
			var is_like = "../images/icon/like_on.png"; 
			var is_dislike = "../images/icon/like_off.png";
			 
			 /* review_id 받아오기 */
			 var review = $(this).attr('idx');
			
			 /* 리뷰 좋아요 버튼 클릭시 좋아요 취소 */
			 if($(this).attr('src') == is_like){
				 $(this).attr('src', is_dislike);
				 
				 var like_id = $(this).parent().attr('id');
				 like_id = like_id.replace("is_liked","");
				 
				 var like_num3 = $('#detail_pop_like_num'+like_id).text();
				 $('#detail_pop_like_num'+like_id).text(like_num3*1-1);
				 
				 likeDelete(review);
			 
			 } else if($(this).attr('src') == is_dislike){
				 /* 리뷰 좋아요 버튼 클릭시 좋아요 선택 */
				 $(this).attr('src', is_like);
				
				 var like_id = $(this).parent().attr('id');
				 like_id = like_id.replace("is_liked","");
				 
				 var like_num3 = $('#detail_pop_like_num'+like_id).text();
				 $('#detail_pop_like_num'+like_id).text(like_num3*1+1);
				 
				likePost(review);	 
			 }
		})
		/* 좋아요 버튼 누를시 db에 좋아요 갯수 -1*/
		function likeDelete(review){
			
			 $.ajax({
				 url : "../like?review="+ review, // 컨트롤러 위치
				 type : "DELETE",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					
					if(result.message == 'Success'){
						
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
					alert("검색실패");
					return false;
				}
			})
		}
		
		/* 좋아요 누를시 db에 +1 */
		function likePost(review){
			
			 var sendData = {
					 user : user_id,
					 review : review
				 }
				  
				 $.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "../like", // 컨트롤러 위치
					 type : "POST",
					 beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					 data : JSON.stringify(sendData),
					 dataType : 'JSON',
					 success : function(result){
						
						console.log(result)
						
						if(result.message == 'Success'){
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
						alert("검색실패");
						return false;
					}
				})
			}
		
		/* 위시리스트 클릭시 하트 이미지 색 변경 */
		 $(document).on('click','.wishlistImg', function(){
			 
			 var is_true = "../images/icon/wishlist_on.png"; 
			 var is_false = "../images/icon/wishlist_off.png";
			 
			 /* 위시리스트가 선택되어 있을때 선택취소 */
			 if($('#wishButton').attr('src') == is_true){
				 $('#wishButton').attr('src', is_false);
				 
				 $.ajax({
					 url : "../wishlists?lodgement="+ lodgement, // 컨트롤러 위치
					 type : "DELETE",
					 dataType : 'JSON',
					 beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        },
					 success : function(result){
						console.log(result)
						
						if(result.message == 'Success'){
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
						alert("검색실패");
						return false;
					}
				})
				 
			 // 하트가 비어있을때 선택하면 하트 채워지면서 DB에 입력
			 } else if($('#wishButton').attr('src') == is_false){
				 $('#wishButton').attr('src', is_true);
				
				 var sendData = {
					 user : user_id,
					 lodgement : lodgement
					 }
				 
				 $.ajax({
					 contentType: "application/json; charset=utf-8",
					 url : "../wishlists?lodgement="+ lodgement, // 컨트롤러 위치
					 type : "POST",
					 data : JSON.stringify(sendData),
					 dataType : 'JSON',
					 beforeSend: function (xhr) {
				            xhr.setRequestHeader("user", user_id);
				        },
					 success : function(result){
						
						console.log(result)
						
						if(result.message == 'Success'){
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
						alert("검색실패");
						return false;
					}
				})
			 }
		}) 
	
	</script>
	<script>
		/* 화면에 포토 모음 */
		function viewAll(){
			for(var i=0;i< data.lodgement_images.length; i++){
				$('.photoCollect').append(
					"<img src='" + data.lodgement_images[i].lodgement_img_url + "' id='lodgement_images" + i + "' class='viewAll_photo' idx = '"+ i +"'>"
				);
			}
			/* 팝업 열자마자 나오는 이미지, border 기본값 */
			$('#big_photo_id').attr('src', data.lodgement_images[0].lodgement_img_url);
			$('#pop_hotel_Name').text(data.lodgement_name);
			$('#lodgement_images0').addClass('selected_photo');
		}
		
		/* 호텔사진 전체보기 버튼 클릭시 */
		$(document).on('click','.viewAll_photo',function(){
			
			/* 클릭한 css이미지에 border 추가 */
			$(this).addClass('selected_photo').siblings().removeClass('selected_photo');
			var attrId = $(this).attr('id');
			
			/* 팝업 큰 이미지에 클릭한 이미지 붙이기 */
			$('#big_photo_id').attr('src', $('#'+attrId).attr('src'));
		})
		
		/* 호텔 전체보기 팝업에서 사진의 오른쪽 버튼 클릭시 */
		function next_photo(){
			/* 다음 버튼을 누를때마다 idx값이 1씩 커지면서 다음 사진으로 이동 */
			var idx = $('.selected_photo').attr('idx');
			var next_photo = idx*1 + 1;
			
			/* 사진이 next_photo의 길이만큼 가게되면 첫번째 사진으로 돌아가기 */
			if(next_photo == $('.viewAll_photo').length) {
				next_photo = 0;
			}
			// 버튼 클릭시 사진 바꾸기
			$('#big_photo_id').attr('src', $('#lodgement_images'+next_photo).attr('src'));
			
			// 버튼 클릭시 리스트 사진들 클래스 이동
			$('.photoCollect').children().eq(next_photo).addClass('selected_photo').siblings().removeClass('selected_photo')
			
		}	
		
		/* 호텔 전체보기 팝업에서 사진의 왼쪽 버튼 클릭시 */
		function prev_photo(){
			var idx = $('.selected_photo').attr('idx');
			var prev_photo = idx*1 - 1;
			/* 사진이 첫번째 사진 이전으로 가게 되면 맨 마지막 사진으로 이동 */
			if(prev_photo == -1) {
				prev_photo = $('.viewAll_photo').length-1;
			}
			
			// 버튼 클릭시 사진 바꾸기
			$('#big_photo_id').attr('src', $('#lodgement_images'+prev_photo).attr('src'));
			
			// 버튼 클릭시 리스트 사진들 클래스 이동
			$('.photoCollect').children().eq(prev_photo).addClass('selected_photo').siblings().removeClass('selected_photo')
		}
		
		//대실/숙박예약 팝업 이미지들 이동
		/* 화면에 포토 모음 */
		function viewPhotos(){
			$('.popImgs *').remove();
			
			for(var i=0;i< roomsdata.room_images.length; i++){
				$('.popImgs').append(
					"<img src='" + roomsdata.room_images[i].room_img_url + "' id='room_images" + i + "' class='viewRooms_photo' idx = '"+ i +"'>"
				);
			}
			/* 팝업 열자마자 나오는 이미지, border 기본값 */
			$('#room_thumb_url_s').attr('src', roomsdata.room_images[0].lodgement_img_url);
			$('#room_images0').addClass('selected_popPhoto');
		}
		
		/* 객실예약팝업에서 해당 객실 사진 보여줌 */
		$(document).on('click','.viewRooms_photo',function(){
			
			/* 클릭한 css이미지에 border 추가 */
			$(this).addClass('selected_popPhoto').siblings().removeClass('selected_popPhoto');
			var attrId = $(this).attr('id');
			
			/* 팝업 큰 이미지에 클릭한 이미지 붙이기 */
			$('#room_thumb_url_s').attr('src', $('#'+attrId).attr('src'));
		})
		/* 객실예약팝업의 객실 사진 다음 버튼으로 클릭시 다음 사진으로 이동 */
		function next_popPhotos(){
			/* 다음 버튼을 누를때마다 idx값이 1씩 커지면서 다음 사진으로 이동 */
			var idx = $('.selected_popPhoto').attr('idx');
			var next_photo = idx*1 + 1;
			
			/* 사진이 next_photo의 길이만큼 가게되면 첫번째 사진으로 돌아가기 */
			if(next_photo == $('.viewRooms_photo').length) {
				next_photo = 0;
			}
			// 버튼 클릭시 사진 바꾸기
			$('#room_thumb_url_s').attr('src', $('#room_images'+next_photo).attr('src'));
			
			// 버튼 클릭시 리스트 사진들 클래스 이동
			$('.popImgs').children().eq(next_photo).addClass('selected_popPhoto').siblings().removeClass('selected_popPhoto');
			
		}	
		/* 객실예약 팝업 객실 사진 이전 버튼 클릭시 이전 사진으로 이동 */
		function prev_popPhoto(){
			var idx = $('.selected_popPhoto').attr('idx');
			var prev_photo = idx*1 - 1;
			
			if(prev_photo == -1) {
				prev_photo = $('.viewRooms_photo').length-1;
			}
			
			// 버튼 클릭시 사진 바꾸기
			$('#room_thumb_url_s').attr('src', $('#room_images'+prev_photo).attr('src'));
			
			// 버튼 클릭시 리스트 사진들 클래스 이동
			$('.popImgs').children().eq(prev_photo).addClass('selected_popPhoto').siblings().removeClass('selected_popPhoto');
		}
		
		/* 포토리뷰 사진, 리뷰 변경하기 */	
		function next_Review(){
			/* 다음 버튼을 누를때마다 idx값이 1씩 커지면서 다음 사진으로 이동 */
			
			var photo_cnt = $('.pCollect').children().length;
			var idx = $('#pop_review_img').attr('idx');
			
			idx++;
			$('#pop_review_img').attr('idx', idx);
			
			if (idx == photo_cnt) {
				$('#pop_review_img').attr('idx', 0);
				idx = 0;
			}
			
			var review_id = $('.pCollect').children().eq(idx).attr('id').replace("review_img", "");
			
			$('#pop_like_photo_id').attr('idx', review_id);
			$('#id_photo_review_r').attr('idx', review_id);		
			
			$('#pop_review_img').attr('src', $('#review_img'+review_id).attr('src'));
			$('#pop_writer_name').text($('#review_writer_name'+review_id).text());
			$('#pop_review_date').text($('#review_date'+review_id).text());
			$('#pop_lodgement_room').text($('#lodgement_room'+review_id).text());
			$('#pop_like_num').text($('#like_num'+review_id).text());
			$('#pop_review_text').text($('#review_text'+review_id).text());
		}	
		/* 이전버튼 누를때마다 idx값이 1씩 작아지면서 이전 사진으로 이동 */
		function prev_Review(){
			var photo_cnt = $('.pCollect').children().length;
			var idx = $('#pop_review_img').attr('idx');
			
			idx--;
			$('#pop_review_img').attr('idx', idx);
			
			 if (idx == -1) {
				$('#pop_review_img').attr('idx', photo_cnt);
				idx = photo_cnt-1;
			} 
			
			var review_id = $('.pCollect').children().eq(idx).attr('id').replace("review_img", "");
			
			$('#pop_like_photo_id').attr('idx', review_id);
			$('#id_photo_review_r').attr('idx', review_id);		
			
			$('#pop_review_img').attr('src', $('#review_img'+review_id).attr('src'));
			$('#pop_writer_name').text($('#review_writer_name'+review_id).text());
			$('#pop_review_date').text($('#review_date'+review_id).text());
			$('#pop_lodgement_room').text($('#lodgement_room'+review_id).text());
			$('#pop_like_num').text($('#like_num'+review_id).text());
			$('#pop_review_text').text($('#review_text'+review_id).text());
		}	
	</script>
	<script>
	/* 리뷰 페이징 함수 */
	function page() {	
	    $('div.review_text').each(function () {
	        var pagesu = 10;  //페이지 번호 갯수
	        var currentPage = 0;
	        var numPerPage = 10;  //목록의 수
	        var $div = $(this);
	        var pagination = $("#pagination");

	        //length로 원래 리스트의 전체길이구함
	        var numRows = $div.find('.reviewlist').length;

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
	            $div.find('.reviewlist').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
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
	/* 리뷰 작성가능 여부 - 리뷰작성하기 클릭시 리뷰 작성가능한지 확인 */
	$(document).on('click','.reviewWrite',function(){
		$(function() {			
			$.ajax({
				url : "../review-possible?lodgement="+lodgement, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        },
				success : function(result){
					console.log(result);
					if(result.message == 'Success'){
						data = result.data;
						
						if(Object.keys(data).length == 0){
							data.reservation_id = null;
							
						} else {
							location.href = 'reviewwrite?lodgement=' + lodgement + '&checkin=' + checkin + '&checkout=' + checkout +'&reservation=' + data.reservation_id;
						}
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
					alert("검색실패");
					return false;
					}
				})
			})
		})
	
	</script>
	<script>
		/* 공유하기 아이콘의 url input 창에  현재페이지 url 입력하기 */
		var link = document.location.href;
		$('input[name=urlValue]').attr('value',link);
		
		/* url 복사하기 */
		function clip(){
			var url = '';
			var textarea = document.createElement("textarea");
 			document.body.appendChild(textarea);
 			url = window.document.location.href;
 			textarea.value = url;
 			
 			textarea.select();
 			document.execCommand("copy");
 			document.body.removeChild(textarea);
			alert("URL이 복사되었습니다.")
		}
		/* 공유하기 버튼에 링크공유 div 보여주기 */
		function shareUrl(){
			if($('.bollom').css('display') == 'none'){
				$('.bollom').css('display','flex');
			}else{
				$('.bollom').css('display','none');
			}
		}
 	</script>
 	
 	<script>
	
		/* 날짜선택 팝업 보여주는 팝업 */
		function calendar_show() {
			makeCalendar(0);
			document.querySelector(".calendar_popup").className = "calendar_popup calendar_show";
		}
		//날짜선택 팝업 닫는 함수
	    function calendar_close() {document.querySelector(".calendar_popup").className = "calendar_popup";}
	
	</script>
	<script>
		/* 로그인/로그아웃한 상태에서 날짜 선택했을때 */
		$(document).on('click', '.date', function(){
			                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
			if(isCheckinSelect) {
				isCheckinSelect = false;
				
				var dateString = $('#year').text() + "." + ('0' + $('#month').text()).slice(-2) + '.' + ('0' + $(this).text()).slice(-2);

				storedCheckinDate = dateString;
				storedCheckoutDate = dateString;
				
			} else {
				var dateString = $('#year').text() + "." + ('0' + $('#month').text()).slice(-2) + '.' + ('0' + $(this).text()).slice(-2);
				
				if (compareDate(storedCheckinDate, dateString) <= 0) {
					storedCheckinDate = dateString;
					storedCheckoutDate = dateString;
				} else {
					isCheckinSelect = true;
					storedCheckoutDate = dateString;
				}
			}
			
			clickedDate();
		})
	</script>
	
	<script type="text/javascript">
		/* 달력만드는 함수 */
		function makeCalendar(moveMonth) {
			$('.dates').children().remove();
			
			if(moveMonth == 0) {
				var checkinDate = storedCheckinDate;
				var checkoutDate = storedCheckoutDate;
				
				if (checkinDate == "" || checkoutDate == "") {
					$('#year').text(<%=todayYear%>);
					$('#month').text(<%=todayMonth%>);
				} else {
					$('#year').text(checkinDate.split(".")[0]);
					$('#month').text(checkinDate.split(".")[1]);
				}
			}
			
			var year = $('#year').text();
			var month = $('#month').text()*1 + moveMonth;
			
			if (month >= 13) {
				year++;
				month = 1;
			} else if (month <= 0) {
				year--;
				month = 12;
			}
			
			$('#year').text(year);
			$('#month').text(month);
			
			if(year == <%=todayYear%> && month == <%=todayMonth%>) {
				$('#prevBtn').css("visibility", "hidden");
			} else {
				$('#prevBtn').css("visibility", "visible");
			}
			
			if(year == <%=threeMonthDayYear%> && month == <%=threeMonthDayMonth%>) {
				$('#nextBtn').css("visibility", "hidden");
			} else {
				$('#nextBtn').css("visibility", "visible");
			}

			//	1일의 요일을 계산한다(자주 쓰이기 때문에 변수로 선언해두기)
			var first = weekDay(year, month, 1);

			//	1일이 출력될 위치 전에 전달의 마지막 날짜들을 넣어주기위해 전 달날짜의 시작일을 계산한다.
			var start = 0;
			start = month == 1 ? lastDay(year - 1, 12) - first : lastDay(year, month - 1) - first;

			//	1일이 출력될 위치를 맞추기 위해 1일의 요일만큼 반복하여 전달의날짜를 출력한다.
 			for (var j = 1; j <= first; j++) {
 				$('.dates').append("<div class = 'before' style = 'pointer-events: none;'></div>");
			}
			
			/* 1일부터 달력을 출력한 달의 마지막 날짜까지 반복하며 날짜를 출력 */
			for (var i = 1; i <= lastDay(year, month); i++) {
				if ((year == <%=todayYear%> && month == <%=todayMonth%> && i < <%=todayDate%>) 
						|| (year == <%=threeMonthDayYear%> && month == <%=threeMonthDayMonth%> && i > <%=threeMonthDayDate%>)) {
					/* 요일별로 색깔 다르게 해주기위해 td에 class 태그걸어주기 */
					switch (weekDay(year, month, i)) {
					// 0일 1월 2화 3수 4목 5금 6토요일
					case 0:
						$('.dates').append(
							"<div class ='invalid-sun invalid-date'>" 
								+ "<span class = 'sun-font'>" + i + "</span>" +
							"</div>");
						break;
					case 1:
						$('.dates').append(
							"<div class ='invalid-mon invalid-date'>"
								+ "<span class = 'etc-font'>" + i + "</span>" +												
							"</div>");
						break;
					case 2:
						$('.dates').append(
							"<div class ='invalid-tue invalid-date'>"
								+ "<span class = 'etc-font'>" + i + "</span>" +											
							"</div>");
						break;
					case 3:
						$('.dates').append(
							"<div class ='invalid-wen invalid-date'>" 
								+ "<span class = 'etc-font'>" + i + "</span>" +													
							"</div>");
						break;
					case 4:
						$('.dates').append(
							"<div class ='invalid-thu invalid-date'>" 
								+ "<span class = 'etc-font'>" + i + "</span>" +													
							"</div>");
						break;
					case 5:
						$('.dates').append(
							"<div class ='invalid-fri invalid-date'>"
								+ "<span class = 'etc-font'>" + i + "</span>" +												
							"</div>");
						break;
					case 6:
						$('.dates').append(
							"<div class ='invalid-sat invalid-date'>"
								+ "<span class = 'sat-font'>" + i + "</span>" +
							"</div>");
						break;
					}
					
					/* 출력한 날짜(i)가 토요일이고 그달의 마지막 날짜이면 줄을 바꿔주기 */
					if (weekDay(year, month, i) == 6 && i != lastDay(year, month)) {
						$('.dates').append("<div></div>");
					}
				} else {
					/* 요일별로 색깔 다르게 해주기위해 td에 class 태그걸어주기 */
					switch (weekDay(year, month, i)) {
					// 0일 1월 2화 3수 4목 5금 6토요일
					case 0:
						$('.dates').append(
							"<div class ='sun date'>" 
								+ "<span class = 'sun-font'>" + i + "</span>" +
							"</div>");
						break;
					case 1:
						$('.dates').append(
							"<div class ='mon date'>"
								+ "<span class = 'etc-font'>" + i + "</span>" +												
							"</div>");
						break;
					case 2:
						$('.dates').append(
							"<div class ='tue date'>"
								+ "<span class = 'etc-font'>" + i + "</span>" +											
							"</div>");
						break;
					case 3:
						$('.dates').append(
							"<div class ='wen date'>" 
								+ "<span class = 'etc-font'>" + i + "</span>" +													
							"</div>");
						break;
					case 4:
						$('.dates').append(
							"<div class ='thu date'>" 
								+ "<span class = 'etc-font'>" + i + "</span>" +													
							"</div>");
						break;
					case 5:
						$('.dates').append(
							"<div class ='fri date'>"
								+ "<span class = 'etc-font'>" + i + "</span>" +												
							"</div>");
						break;
					case 6:
						$('.dates').append(
							"<div class ='sat date'>"
								+ "<span class = 'sat-font'>" + i + "</span>" +
							"</div>");
						break;
					}
					
					/* 출력한 날짜(i)가 토요일이고 그달의 마지막 날짜이면 줄을 바꿔주기 */
					if (weekDay(year, month, i) == 6 && i != lastDay(year, month)) {
						$('.dates').append("<div></div>");
					}
				}
			}
			
			if (weekDay(year, month, lastDay(year, month)) != 6) {
				for (var i = weekDay(year, month, lastDay(year, month)) + 1; i < 7; i++) {
					$('.dates').append("<div></div>");
				}
			}
			
			clickedDate();
		}
	
	</script>
	
	<script type="text/javascript">
		function isLeapYear(year) {
			return (year % 4 ==0) && (year % 100 !=0) ||(year % 400 ==0);
		}
		
		function lastDay(year, month) {
			var m = [31,28,31,30,31,30,31,31,30,31,30,31];
			m[1]=isLeapYear(year)? 29:28;
			return m[month-1];
		}
		
			
		function totalDay(year, month, day) {
			var sum = (year-1)*365 + parseInt((year-1)/4) - parseInt((year-1)/100) + parseInt((year-1)/400);
			for (var i = 1; i < month; i++) {
				sum += lastDay(year,i);
			}
			return sum + day;
		}
	
		function weekDay(year, month, day) {
			return totalDay(year, month, day) % 7;
		}
		
		// yyyy-mm-dd 형식의 날짜 비교(m, d 한자리도 가능), first가 더 클 경우 -1, second가 더 클 경우 1, 같으면 0
		function compareDate(firstDate, secondDate) {
			var firstDateList = firstDate.split(".");
			var secondDateList = secondDate.split(".");
			
			if(firstDateList[0] == secondDateList[0]) {
				if (parseInt(firstDateList[1]) == parseInt(secondDateList[1])) {
					if(parseInt(firstDateList[2]) == parseInt(secondDateList[2])) {
						return 0;
					} else if (parseInt(firstDateList[2]) > parseInt(secondDateList[2])) {
						return -1;
					} else {
						return 1;
					}
				} else if (parseInt(firstDateList[1]) > parseInt(secondDateList[1])){
					return -1;
				} else {
					return 1;
				}
			} else {
				return secondDateList[0] - firstDateList[0];
			}
		}
		
		function clickedDate() {
			var dateList = $('.date').toArray();
			
			if (storedCheckinDate == "" || storedCheckoutDate == "") {
				for (var i in dateList) {
					$(dateList[i]).removeClass("clicked");
				}
			}
			
			for (var i in dateList) {
				var dateString = $('#year').text() + "." + ('0' + $('#month').text()).slice(-2) + '.' + ('0' + $(dateList[i]).text()).slice(-2) + "." + $(dateList[i]).text();
				
				if ((compareDate(storedCheckinDate, dateString) >= 0) 
						&& (compareDate(storedCheckoutDate, dateString) <= 0)) {
					$(dateList[i]).addClass("clicked");
				} else {
					$(dateList[i]).removeClass("clicked");
				}
			}
		}
	</script>
	
	<script type="text/javascript">
		$('#prevBtn').click(function () {
			makeCalendar(-1);
		});
		
		$('#nextBtn').click(function () {
			makeCalendar(1);
		});
		
		$('#selectBtn').click(function () {
			var checkinDate = storedCheckinDate;
			var checkoutDate = storedCheckoutDate;
			
			if (checkinDate != "" && checkoutDate != "") {
				if(checkinDate == checkoutDate) {
					var selectDate = checkinDate.split(".");
					if(selectDate[2] == lastDay(selectDate[0], selectDate[1])){
						if(selectDate[1] == "12") {
							checkoutDate = (parseInt(selectDate[0])+1) + ".01" +".01"
						} else {
							checkoutDate = selectDate[0] + "." + ('0' + (parseInt(selectDate[1]) + 1)).slice(-2) +".01"
						}
					} else {
						checkoutDate = selectDate[0] + "." + selectDate[1] + "." + ('0' + (parseInt(selectDate[2])+1)).slice(-2); 
					}
					
					isCheckinSelect = true;
					storedCheckoutDate = checkoutDate;
				}
				$('#dateSearchCondition').val(checkinDate + " ~ " + checkoutDate);
			}
			
			var urlSearch = new URLSearchParams(location.search);
			urlSearch.set('checkin', checkinDate);
			urlSearch.set('checkout', checkoutDate);
			
			location.replace('../lodgement/' + lodgement + '?' + urlSearch.toString());
		});
		
		$('#cancelBtn').click(function () {
			var dateSearchCondition = $('#dateSearchCondition').val();
			
			if (dateSearchCondition != "") {
				storedCheckinDate = dateSearchCondition.split(" ~ ")[0];
				storedCheckoutDate = dateSearchCondition.split(" ~ ")[1];
			}
			
			calendar_close();
		});
	</script>
	<script>
 	/* 호텔 지도 보여주는 함수 */
 	function hotelMaps(){
 		var geocoder = new kakao.maps.services.Geocoder();
		var callback = function(result, status) {
		    if (status === kakao.maps.services.Status.OK) {
		        var latlng = new kakao.maps.LatLng(result[0].y , result[0].x);
		    	console.log(result);
		        
		    	var mapContainer  = document.getElementById('map'),

				// center에 주소를 가지고 위도 경도 가지고오기
		    	mapOption = {
			        center: latlng, //위도,경도
			        level: 5, //얼마나 확대
					disableDoubleClick: true //더블클릭시 이벤트X 
				};
				
			    
				var map = new kakao.maps.Map(mapContainer, mapOption); //div태그에 지도옵션 집어넣은것
		 		//map.setDraggable(false); //마우스로 드래그 안되게 지도이동 X 아예 설정 안하면 됨 웹에서는
				//map.setZoomable(false); //확대,축소 안됨

		 		kakao.maps.event.addListener(map, 'click', function(mouseEvent) {  
		 			window.open("https://map.kakao.com/link/search/" + hotelMap);
				});

				var icon = new kakao.maps.MarkerImage( 
					'../images/icon/marker.png', //마커의 이미지 생성
					new kakao.maps.Size(28, 43), //이미지 사이즈(픽셀기준)
				);
				//호텔 이름 보여주는 div
				var iwContent = '<div style="padding: 5px; font-size: 14px;"><p style="text-align: center;">' + hotelName + '</p><a class="bigMap" style="cursor: pointer; color: blue;" target="_blank">큰 지도보기</a></div>' 
				
				$(document).on('click','.bigMap',function(){
					window.open("https://map.kakao.com/link/search/" + hotelMap);
				})

				/* $(document).on('click','.roadTo',function(){
					window.open("https://map.kakao.com/link/to/" + hotelMap);
				}) */
				
				var marker = new kakao.maps.Marker({ //마커이미지 적용
					map: map, //위에서 정의한 map
					position: latlng, // 일단은 그대로
					image: icon, //마커이미지 생성했던 아이콘
					title: hotelName //마커를 클릭했을때 나옴 호텔이름 들어가면 될듯
				});
				//호텔 이름 보여주는 div 함수
				var infowindow = new kakao.maps.InfoWindow({
				    position : latlng, 
				    content : iwContent 
				});
				
				 map.relayout();
				 infowindow.open(map, marker); 
		    }
		};
		geocoder.addressSearch(hotelMap , callback);
 	}
 	</script>
 	
</body>
</html>