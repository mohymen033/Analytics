<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head><title>Indicator Management</title></head>
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
	<legend>::DashBoard::Indicator Management</legend>
<table border="1">
<thead>
	<th>Id</th>
	<th>Name</th>
	<th>Description</th>
	<th>Action</th>
</thead>

<tbody>
	<c:if test="${not empty indicators}">
	<c:forEach var="indicator" items="${indicators}" varStatus="indicators">
	<tr>	
		<td>${indicator.id}</td>
		<td>${indicator.name}</td>
		<td>${indicator.description}</td>
		<td><a href="/featureTreeAnalytics/editIndicator?id=${indicator.id}">Modify</a></td>
	</tr>	
	</c:forEach>
	</c:if>
</tbody>
</table>
</fieldset> 

<br><a href="/featureTreeAnalytics/addIndicator"> Add Indicator </a>
<br><a href="/featureTreeAnalytics"> Home </a><br>
</body>
</html>
