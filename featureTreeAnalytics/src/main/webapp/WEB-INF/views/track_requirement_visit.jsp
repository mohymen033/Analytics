<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Track Element Visit</title>
</head>
<body>
<h1 align="center">Analytics of Feature Tree!</h1>

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
	<legend>::DashBoard::Track Requirement Visit</legend>
	<table border="1">
<thead>
	<th>Requirement Name</th>
	<th>GUI Element Name</th>
	<th>Number of Visits</th>
</thead>

<tbody>
	<c:if test="${not empty element_visits}">
	<c:forEach var="element_visit" items="${element_visits}" varStatus="element_visits">
	<tr>	
		<td>${element_visit.reqName}</td>
		<td>${element_visit.guiElementName}</td>
		<td>${element_visit.guiVisitCount}</td>
	</tr>	
	</c:forEach>
	</c:if>
</tbody>
</table>
	
</fieldset> 

<br><a href="/featureTreeAnalytics"> Home </a><br>
</body>
</html>
