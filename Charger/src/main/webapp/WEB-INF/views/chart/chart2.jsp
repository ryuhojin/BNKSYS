<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>
	<meta charset="UTF-8">
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart', 'bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {

        var button = document.getElementById('change-chart');
        var chartDiv = document.getElementById('chart_div');

        var data = google.visualization.arrayToDataTable([
        	 ['District', 'FullCharger', 'FastCharger'],
        	 <c:forEach var ="rs" items="${result}">
             ['<c:out value="${rs.district}" />', <c:out value="${rs.disPerFull}"/>,<c:out value="${rs.disPerFast}"/>],
             </c:forEach>
        ]);

        var materialOptions = {
          width: 900,
          chart: {
            title: '지역구별 완충-급속 전기차 충전기 현황',
            subtitle: 'Full and Quick Electric Vehicle Charger Status by Region'
          }
        };

        function drawMaterialChart() {
          var materialChart = new google.charts.Bar(chartDiv);
          materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
        }
        
        drawMaterialChart();
    };
    </script>
  </head>
  <body>
    <div id="chart_div" style="width: 800px; height: 500px;"></div>
  </body>
</html>
