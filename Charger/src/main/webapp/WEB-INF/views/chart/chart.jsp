<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 지역구 충전소 개수 막대 -->
<html>
  <head>
	<meta charset="UTF-8">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable([
          
        	['DISTRICT', 'NUM'],
        	<c:forEach var ="rs" items="${result}">
          ['<c:out value="${rs.district}" />', <c:out value="${rs.disPerNum}"/>],
          </c:forEach>
        ]);

        var options = {
          width: 800,
          legend: { position: 'none' },
          chart: {
            title: '지역구별 전기차 충전소 대수 현황',
            subtitle: 'Electric Vehicle Charging Station Status by Region' },
          axes: {
            x: {
              0: { side: 'num', label: 'district'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        // Convert the Classic options to Material options.
        chart.draw(data, google.charts.Bar.convertOptions(options));
      };
    </script>
  </head>
  <body>
    <div id="top_x_div" style="width: 100%; height: 100%;"></div>
  </body>
</html>
