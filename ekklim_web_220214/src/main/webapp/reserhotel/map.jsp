<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
</style>

</head>
<body style="width:100vw; height:100vh; margin: 0px">

	<div id="map" style="width:100%; height:100%"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ee7ff3f3324cb139c951a2be686c6e14&libraries=services"></script>
	
	<script>
		/* var query = location.search;		
		var param = new URLSearchParams(query); */

/* 		var latlng = new kakao.maps.LatLng(param.get('lat'), param.get('lng')); */
		
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
		 		map.setDraggable(false); //마우스로 드래그 안되게 지도이동 X 아예 설정 안하면 됨 웹에서는
				map.setZoomable(false); //확대,축소 안됨

		 		/* kakao.maps.event.addListener(map, 'click', function(mouseEvent) {  
					if (navigator.userAgent.indexOf("Android") > - 1) { 
						window.MapPage.goKakaoMap();
					}
				}); */

				var icon = new kakao.maps.MarkerImage( 
					'../images/icon/blueCheck.png', //마커의 이미지 생성
					new kakao.maps.Size(28, 43), //이미지 사이즈(픽셀기준)
				);

				var marker = new kakao.maps.Marker({ //마커이미지 적용
					map: map, //위에서 정의한 map
					position: latlng, // 일단은 그대로
					image: icon, //마커이미지 생성했던 아이콘
					title: "asdf" //마커를 클릭했을때 나옴 호텔이름 들어가면 될듯
				});
		    }
		};
		
		geocoder.addressSearch('해남군 송지면', callback);
	
	</script>

</body>
</html>