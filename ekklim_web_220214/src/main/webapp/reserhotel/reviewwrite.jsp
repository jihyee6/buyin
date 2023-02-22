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
.title2{
	margin-top: 70px;
	margin-left: 56px;
	color: #707070;
}

.view1 {
	width: 1200px;
}

.view1 tr {
	width: 1200px;
}

.viewtitle {
	font-size: 26px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.period {
	margin-left: 40px;
	width: 7%;
	height: 15px;
	padding: 10px;
	color: #9F9F9F;
	font-size: 18px;
}

.period2 {
	margin: -4px 0px 0px 0px;
	width: 90%;
	height: 15px;
	padding: 0px;
	font-size: 18px;
	font-weight: bold;
	color: #717171;
}

.viewcl2 {
	display: flex;
	paddding: 10px;
	background-color: #F1F1F1;
}

.view1 td {
	line-height: 33px;
	font-family: NanumSquare_ac;
	padding: 18px;
	color: #585858;
}

.bt4 button{
	margin-top: 50px;
	margin-left: 558px;
	width: 160px;
	height: 48px;
	background-color: white;
	border: 1px solid #707070;
	border-radius: 6px;
	cursor: pointer;
	font-size: 20px;
	color: #242424;
	font-family: NanumSquare_ac;
}

.explain_text{
	font-weight: bold;
	color: #585858;
	font-size: 18px;
}

.reviewarea td{
	font-size: 18px;
	color: #242424;
	font-famly:  NanumSquare_ac;
	padding: 0px;
}

hr{
	width: 1210px;
	border: 1px solid rgb(138,138,138,0.5);
}

.addphoto img{
	cursor: pointer;
}

.addphoto p{
	font-size: 18px;
	color: #959494;
}

.point_text{
	margin-top: 26px;
	font-size: 20px;
	color: #242424;
	font-family: NanumSquare_ac;
	margin-left: 78px;
}

.point_text span{
	color: #E75A00;
}

textarea{
	width: 100%;
	height: 260px;
	background: #F5F5F5;
	border-radius: 8px;
	border: none;
	margin-left: -8px;
	resize: none;
	padding: 16px;
	font-family: NanumSquare_ac;
	font-size: 18px;
	box-sizing: border-box;
}
textarea:focus{
	outline: none;
}
#image_container img{
	margin-right: 20px;
	width: 100%;
}

</style>

</head>
<body>

<%String reservationId = request.getParameter("reservation"); %>

	<div class="page">
		<%@include file="../header.jsp"%>	
		<div class="content">
			<div class='pageContent'>
				<div class="title2">리뷰작성</div>
				
				<div>
			<!-- 리뷰 작성 숙소 정보 부분 -->
				<table class="view1">
					<!-- 작성할 리뷰 호텔 이름, 숙소이름 -->
					<tr class="viewcl2" style="border-top: 2px solid #8A8A8A;">
						<th class="period"> 숙소명</th>
						<td class="period2"><span id='hotelName'>이끌림호텔 천안점</span> &middot; <span id='roomName'>스탠다드 더블</span></td>
					</tr>
					<tr class="viewcl2" style="border-bottom: 2px solid #8A8A8A;">
					<th class="period"> 작성자명</th>
						<td class="period2" id='reviewerName'>ㅇㅇㅇ</td>
					</tr>
		
					<!-- 리뷰 작성 부분 -->
					<tr class="explain_text">
						<td>이용해보신 숙소는 어떠셨나요?<br>
							리뷰를 작성해 주세요.
						</td>
					</tr>
					<tr class="reviewarea">
						<td>
							<!-- 리뷰작성 textarea -->
							<textarea class='reviewsText' id='reviewArea' placeholder = '리뷰를 입력해 주세요.'></textarea>
						</td>
					</tr>
					<tr class= "addphoto">
						<td>
							<!-- 사진추가 img -->
							<label class='addPhotoBtn' id='addPhtos' for ='addFile'>
								<img src="../images/reviewimg/cameraimg.png">
							</label>
							<input type='file' id='addFile' style='display: none;' onchange='setThumbnail(event);' accept = '.jpg,.png'>
								<p>사진은 JPG, PNG 파일만 첨부 가능합니다.</p>
								<p>첨부한 이미지를 클릭하면 이미지가 삭제됩니다.</p>
						</td>
						<td>
							<!-- 추가한 사진 보여주는 div -->
							<div id='image_container'></div>
						</td>
					</tr>
				</table>
				<hr>
			</div>
			<div class="point_text">
				<p>작성완료시 적립 포인트 : <span>200P</span>
			</div>
			<!-- 작성완료 버튼 div -->
			<div class="bt4">
				<button type="button" id='reviewPostBtn'>작성완료</button>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</div>
<script>
	var user_id = '<%=id%>';
	var reservationId = '<%=reservationId%>';
	
	var review_write = true;
	var img_state = false;
	var review_original_img = false;
	
	var review_id;
	var img_cnt = 0;
	
	/* 리뷰 작성완료 버튼 클릭 */
	$(document).on('click','#reviewPostBtn',function(){
		
		if(img_state == false) {
			
			if(review_write == true) {
				//리뷰 이미지 없고 내용만 있을때
				var formData = new FormData();
				formData.append("review_img", null);
				formData.append("writer", user_id);
				formData.append("reservation_id", '<%=reservationId%>');
				formData.append("text", $('.reviewsText').val());
				
				 $.ajax({
					enctype: 'multipart/form-data',  
					url : "../reviews", // 컨트롤러 위치
					type : "POST",
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					data: formData,          
		            processData: false,    
		            contentType: false,      
		            cache: false,           
		            timeout: 600000,
					dataType : 'JSON',
					success : function(result){
						
						console.log(result);
						
						if(result.message == 'Success'){
							if($('.reviewsText').val().length > 10){
								alert('리뷰를 작성이 완료 되었습니다. 200P가 적립 됩니다. 감사합니다.')
								location.href = '../mypage/review';
							} else{
								alert('최소 10자 이상 작성해주세요.');
							}
						} else if(result.message == 'Fail'){
							alert("잠시후에 다시 시도해주세요.");
						} else {
							alert("알 수 없는 에러입니다.");
						}
						return false;					
					},
					error : function(){
						alert("리뷰 작성에 실패하였습니다. 잠시후에 다시 시도해주세요.");
						return false;
					}
				})
			} else if(review_write == false) {
				//리뷰 수정할때
				var formData = new FormData();
				formData.append("review_img", null);
				formData.append("delete_image", review_original_img);
				formData.append("review_id", review_id);
				formData.append("text", $('.reviewsText').val());
				
				$.ajax({
					enctype: 'multipart/form-data',  
					url : "../reviews", // 컨트롤러 위치
					type : "PUT",
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("user", user_id);
			        },
					data: formData,          
		            processData: false,    
		            contentType: false,      
		            cache: false,           
		            timeout: 600000,
					dataType : 'JSON',
					success : function(result){
						
						console.log(result);
						
						if(result.message == 'Success'){
							if($('.reviewsText').val().length > 10){
								alert('리뷰 수정이 완료 되었습니다.')
								location.href = '../mypage/review';
							} else{
								alert('최소 10자 이상 작성해주세요');
							}
						} else if(result.message == 'Fail'){
							alert("잠시후에 다시 시도해주세요.");
						} else {
							alert("알 수 없는 에러입니다.");
						}
						return false;					
					},
					error : function(){
						alert("리뷰 작성에 실패하였습니다. 잠시후에 다시 시도해주세요.");
						return false;
					}
				})
			}  
				
		}
		
	})
	//이미지 폼데이터로 묶어서 추가한 이미지 보내기
	function setThumbnail(e) {
    	
		img_state = true;
		
    	if($('.imgBox').length == 0){
		    const files = e.target.files;
		   	const filesArr = Array.prototype.slice.call(files);
	   		// 여러장의 이미지를 불러올 경우, 배열화
	  	 	filesArr.forEach(file => {
	   	    	const reader = new FileReader();
		   	    reader.onload = e => {
		   	        const image = new Image();
		   	        image.className = "img-item"; // 스타일 적용을 위해
		   	        image.src = e.target.result;
		   	        image.onload = imageEvent => {
	   	        	let canvas = document.createElement("canvas"),
	   			    max_size = 1280,
	   			    // 최대 기준을 1280으로 잡음.
	   			    width = image.width,
	   			    height = image.height;
	
	   			 	if (width > height) {
	   			    // 가로가 길 경우
	   			    if (width > max_size) {
	   			      height *= max_size / width;
	   			      width = max_size;
	   			    }
	   			    
	   			    } else {
	   			    // 세로가 길 경우
		   			    if (height > max_size) {
		   			    	width *= max_size / height;
		   			        height = max_size;
	   			    	}
	   			    }
	   			  canvas.width = width;
	   			  canvas.height = height;
	   			  canvas.getContext("2d").drawImage(image, 0, 0, width, height);
	   			  const dataUrl = canvas.toDataURL("image/jpeg");
	   			  // 미리보기 위해서 마크업 추가.
	   			  
	              var img_html = "<img src=\"" + dataUrl + "\" / class = 'imgBox'/>";
	              $("#image_container").append(img_html);
	   			  
	   			  var formData = new FormData();
	   			  
	   			  if(review_write == true) {
	   				  /* 새로운 리뷰 작성할때 */
			   		  formData.append("review_img", dataURLToBlob(dataUrl));
			   		  formData.append("writer", user_id);
				      formData.append("reservation_id", '<%=reservationId%>');
				      formData.append("text", $('.reviewsText').val());
				      
				      $(document).on('click', '.imgBox', function(){
				      		$(this).remove();
				      		img_state == false
				      		
				      		formData.delete("review_img");
				      		formData.delete("writer");
				      		formData.delete("reservation_id");
				      		formData.delete("text");
				      		
				      		for (let key of formData.keys()) {
				      			console.log(key)
				      		}
			      		
			      	  }) 
				      
	   			  } else if (review_write == false) {
	   				  /* 리뷰 수정할때 */
	   				  formData.append("review_img", dataURLToBlob(dataUrl));
	   				  formData.append("review_id", review_id);
   		    		  formData.append("delete_image", true);
   					  formData.append("text", $('.reviewsText').val());
   					  
	   				  $(document).on('click', '.imgBox', function(){
				          $(this).remove();
				      	  img_state == false
				      		
				      	  formData.delete("review_img");
				      	  formData.delete("review_id");
				      	  formData.delete("delete_image");
				      	  formData.delete("text");
				      		
				      		for (let key of formData.keys()) {
				      			console.log(key)
				      		}
			      		
			      	  }) 
	   			  }
		   		  
	   		      $('#addFile').val("");
	   		      
	   		      $(document).on('click', "#reviewPostBtn", function () {
	   		    	  /* 리뷰 이미지를 새로 추가할때 */
	   		    	if(review_write == true && formData.has("review_img") == true) {
	   		    		
	   		    		$.ajax({             
	   		          		type: "POST",          
	   		                enctype: 'multipart/form-data',  
	   		             	url : "../reviews", 
		   		             beforeSend: function (xhr) {
		 			            xhr.setRequestHeader("user", user_id);
		 			        },
	   		                data: formData,          
	   		                processData: false,    
	   		                contentType: false,      
	   		                cache: false,           
	   		                timeout: 600000,
	   		                dataType : 'JSON',
	   		                success: function (result) {
	   		                	
	   		                	console.log(result);
	   							if(result.message == 'Success'){
	   								alert('리뷰를 작성이 완료 되었습니다. 200P가 적립 됩니다. 감사합니다.')
	   								location.href = '../mypage/review';
	   							} else if(result.message == 'Fail'){
	   								alert("잠시후에 다시 시도해주세요.");
	   							} else {
	   								alert("알 수 없는 에러입니다.");
	   							}
	   							return false;	
	   		                	
	   		                },          
	   		                error: function (e) {
	   		                	console.log("ERROR : ", e);     
	   		                }
	   		        	});
	   		    	} else if(review_write == false && formData.has("review_img") == true) {
	   		    		/* 리뷰 이미지를 수정할때 */
	   		    		$.ajax({             
	   		          		type: "PUT",          
	   		                enctype: 'multipart/form-data',  
	   		             	url : "../reviews", 
	   		                data: formData,   
		   		             beforeSend: function (xhr) {
		 			            xhr.setRequestHeader("user", user_id);
		 			        },
	   		                processData: false,    
	   		                contentType: false,      
	   		                cache: false,           
	   		                timeout: 600000,
	   		                dataType : 'JSON',
	   		                success: function (result) {
	   		                	
	   		                	console.log(result);
	   							if(result.message == 'Success'){
	   								alert('리뷰 수정이 완료 되었습니다.')
	   								location.href = '../mypage/review';
	   							} else if(result.message == 'Fail'){
	   								alert("잠시후에 다시 시도해주세요.");
	   							} else {
	   								alert("알 수 없는 에러입니다.");
	   							}
	   							return false;	
	   		                	
	   		                },          
	   		                error: function (e) {
	   		                	console.log("ERROR : ", e);     
	   		                }
	   		        	});
	   		    	}
	   		          
		   	      });
			   	    };
		   	    };
	   	    reader.readAsDataURL(file);
	   	  	});
	   		
    	} else {
    		alert("리뷰 이미지는 1장만 등록 하실 수 있습니다.")
    	}
	}
	
	$(function() {
		if(user_id == "null") {
			alert("마이페이지는 로그인 후 이용 하실 수 있습니다.");
			location.href = '../loginpage/login';
		} else{
			/* 작성할 리뷰의 숙소, 사용자 이름, 호텔 이름 정보 알려주는 ajax */
			$.ajax({
				url : "../review-basic-info?reservation=" + reservationId, // 컨트롤러 위치
				type : "GET",
				dataType : 'JSON',
				beforeSend: function (xhr) {
		            xhr.setRequestHeader("user", user_id);
		        }, 
				success : function(result){
					
					if(result.message == 'Success'){
						reviewData = result.data;
						console.log(reviewData);
						$('#hotelName').text(reviewData.lodgement_name);
						$('#roomName').text(reviewData.room_name);
						$('#reviewerName').text(reviewData.writer_name);
						$('#reviewArea').text(reviewData.review_contents);
						
						if(typeof reviewData.review_id != "undefined") {
							
							review_write = false;
							review_id = reviewData.review_id;
							
							$('#reviewPostBtn').text("수정완료");
							$('.point_text').css('display', 'none');
							
							if(reviewData.image_url != null){
								$('#image_container').append(
									"<img class = 'imgBox' src='" + reviewData.image_url + "'>"		
								)
							}
							
							 $(document).on('click', '.imgBox', function(){
								review_original_img = true;
					      		$(this).remove();
					      	}) 
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
		}
	})
	
	/* 사진데이터 url을 파일로 변환해 formdata에 추가할때 사용 */
	const dataURLToBlob = dataURL => {
		const BASE64_MARKER = ";base64,";
		console.log("checked!")
     	// base64로 인코딩 되어있지 않을 경우
	    if (dataURL.indexOf(BASE64_MARKER) === -1) {
	    	const parts = dataURL.split(",");
	    	const contentType = parts[0].split(":")[1];
	    	const raw = parts[1];
	    	return new Blob([raw], {
	      		type: contentType
	   		});
		}
	    // base64로 인코딩 된 이진데이터일 경우
	    const parts = dataURL.split(BASE64_MARKER);
	    const contentType = parts[0].split(":")[1];
	    const raw = window.atob(parts[1]);
	    // atob()는 Base64를 디코딩하는 메서드
	    const rawLength = raw.length;
	    // 부호 없는 1byte 정수 배열을 생성 
	    const uInt8Array = new Uint8Array(rawLength); // 길이만 지정된 배열
	    let i = 0;
	    while (i < rawLength) {
	    	uInt8Array[i] = raw.charCodeAt(i);
	    	i++;
	    }
	    return new Blob([uInt8Array], {
	    	type: contentType
	    });
	};
</script>
</body>
</html>