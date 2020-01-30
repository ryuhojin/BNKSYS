<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="UTF-8">
<title>Insert title here</title>
 <style>
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<div id="map"></div>
    <script>
      function initMap() {
		var locations = [
			<c:forEach var="marker" items="${result}">
		    ['<c:out value="${marker.cname}" />', // wrapped single quotes if string
		      <c:out value="${marker.lat}" />,
		      <c:out value="${marker.lng}" />
		    ],
		 </c:forEach>
			
		];
		
		  var rst = [
		  <c:forEach var="marker" items="${result}">
			 {
          		cname:'<c:out value="${marker.cname}" />',
          		lat : <c:out value="${marker.lat}" />,
          		lng : <c:out value="${marker.lng}" />,
          		locdetail: '<c:out value="${marker.locdetail}" />',
          		starttime: '<c:out value="${marker.starttime}" />',
          		endtime: '<c:out value="${marker.endtime}" />',
          		fullnum: <c:out value="${marker.fullnum}" />,
          		fastnum: <c:out value="${marker.fastnum}" />,
          		locst: '<c:out value="${marker.locst}" />',
          		parking: '<c:out value="${marker.parking}" />',
          		district: '<c:out value="${marker.district}" />',
		  },
		  </c:forEach>
		];
		var map = new google.maps.Map(document.getElementById('map'), {
		      zoom: 10,
		      center: new google.maps.LatLng(35.16, 129.09),
		      mapTypeId: google.maps.MapTypeId.ROADMAP
		    });

		   var infowindow = new google.maps.InfoWindow();
		   var marker, i;

		    map.setZoom(11); 
		    
		    for (i = 0; i < locations.length; i++) { 
		      marker = new google.maps.Marker({
		        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
		        map: map
		      });
		      

		       google.maps.event.addListener(marker, 'click', (function(marker, i) {
		        return function() {
		        	map.setZoom(15);
		            map.setCenter(marker.getPosition()); 
 		        	infowindow.setContent("<div style = 'width:800px;min-height:250px'><h1>" +rst[i].cname
 		        			+"</h1><br>상세 주소 : "+rst[i].locdetail
 		        			+"<br>도로명주소 : "+rst[i].locst
 		        			+"<br>완속충전기대수 : "+rst[i].fullnum
		        	    	+"<br>급속충전기대수 : "+rst[i].fastnum
		        	    	+"<br>이용시간 : "+rst[i].starttime+"~"+rst[i].endtime
		        	    	+"<br>주차료부과여부 : "+rst[i].parking
		        	    	+"<br></p></div>");
					infowindow.open(map, marker);
		        }
		      })(marker, i));
		    }	
	}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCNrAdCnu8hACqLF99Phhbs7XEEEQz19YM&callback=initMap">
    </script>
</body>
</html>