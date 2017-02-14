<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<html>
<head>
	<title>Graph Test</title>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
    
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Requirement Name', 'Total Visit'],
          ['R1:Select password length',  10],
          ['R2:Select Punctuation',  10],
          ['R3:Generate Strong password',  12]
        ]);

        var options = {
          title: 'Requirement Visit',
          vAxis: {title: 'Requirement Name',  titleTextStyle: {color: 'red'}}
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
</head>

<body>
<h1 align="center">Configure Feature Tree!</h1>

<c:choose>
	<c:when test="${not empty serverTime}">
		<P>  The time on the server is ${serverTime}. </P>
	</c:when>
	<c:when test="${not empty saveMsg}">
		<P>  ${saveMsg} </P>	
	</c:when>
</c:choose>
<br>
<fieldset>
	<legend>::DashBoard::STATISTICS::Graph Test</legend>
<table>
	<thead>
		<th>Requirement Name</th>
		<th>Number of Visits</th>
		<th>Visitor Location</th>
		<th>IP address</th>
		<th>Visitor Session Id</th>
		
	</thead>

	<tbody>
		<c:if test="${not empty element_visits}">
		<c:forEach var="element_visit" items="${element_visits}" varStatus="element_visits">
		<tr>	
			<td>${element_visit.reqName}</td>
			<td>${element_visit.guiVisitCount}</td>
			<td>${element_visit.visitoraddress} </td>
			<td> ${element_visit.ipaddress} </td>
			<td>${element_visit.elementvisitsessionid} </td>
			
		</tr>	
		</c:forEach>
		</c:if>
	</tbody>
</table>
	
<div id="chart_div" style="width: 1150px; height: 500px;"></div>
</fieldset> 

<br><a href="/featureTree"> Home </a><br>
<a href="/featureTree/statisticsIndicator"> Indicator Statistics </a><br>
<%-- <%response.sendRedirect("http://localhost:8080/springMvc/"); %> --%>
</body>
</html>
