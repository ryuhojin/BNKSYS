<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/base.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function StationDetail(cno) {
		location.href = './stationdetail?cno=' + cno; //get방식
	}
	
</script>
</head>
<style scoped="scoped">
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 100%;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
</style>
<body>
	<div class="container">
		<jsp:include page="../section/header.jsp"></jsp:include>
		<div class="detailover">
			<div class="detailmain">
				<div id="detailcontent">
					<span>충전소명 : ${result.cname }</span> <span>상세위치 :
						${result.locdetail}</span> <span>도로명주소 : ${result.locst}</span> <span>완속충전기대수
						: ${result.fullnum}</span> <span>급속충전기대수 : ${result.fastnum}</span> <span>이용가능시간
						: ${result.starttime}~${result.endtime}</span> <span>주차료부과여부 :
						${result.parking}</span>
				</div>
				<div id="detailmap"></div>
			</div>
		</div>
		<jsp:include page="../section/footer.jsp"></jsp:include>
		<%-- <table>
			<tr>
			<tr>
				<th>충전소명</th>
				<td>${result.cname }
			</tr>
			<tr>
				<th>상세위치</th>
				<td>${result.locdetail}
			</tr>
			<tr>
				<th>도로명주소</th>
				<td>${result.locst}</td>
			</tr>
			<tr>
				<th>완속충전기대수</th>
				<td>${result.fullnum}</td>
			</tr>
			<tr>
				<th>급속충전기대수</th>
				<td>${result.fastnum}</td>
			</tr>
			<tr>
				<th>이용가능시간</th>
				<td>${result.starttime}~${result.endtime}</td>
			</tr>
			<tr>
				<th>주차료부과여부</th>
				<td>${result.parking}</td>
			</tr>
		</table>
		<a href="./station">목록으로</a>
		<div id="map"></div> --%>
	</div>
</body>
<script>

      // This example displays a marker at the center of Australia.
      // When the user clicks the marker, an info window opens.

      function initMap() {
        var loc = {lat: ${result.lat}, lng: ${result.lng}};
        var map = new google.maps.Map(document.getElementById('detailmap'), {
          zoom: 4,
          center: loc
        });

        var contentString = '<div id="content">'+
            
            '</div>';

        var infowindow = new google.maps.InfoWindow({
          content: contentString
        });

        var marker = new google.maps.Marker({
          position: loc,
          map: map,
          title: '안녕'
        });
        
        bounds  = new google.maps.LatLngBounds();
		map.setZoom(11);       
        marker.addListener('click', function() {
       	  map.setZoom(15);
          map.setCenter(marker.getPosition());
          infowindow.open(map, marker);
        });
      }
    </script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNrAdCnu8hACqLF99Phhbs7XEEEQz19YM&callback=initMap">
    </script>