<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Manage GUI Element</title>
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
	<legend>::DashBoard::Manage GUI Element of PM Site</legend>
	<table border="1">
<thead>
	<th>Id</th>
	<th>Requirement Id</th>
	<th>Name</th>
	<th>Description</th>
	<th>Action</th>
</thead>

<tbody>
	<c:if test="${not empty guielements}">
	<c:forEach var="guielement" items="${guielements}" varStatus="guielements">
	<tr>	
		<td>${guielement.id}</td>
		<td>${guielement.requirement_id}</td>
		<td>${guielement.name}</td>
		<td>${guielement.description}</td>
		<td><a href="/featureTree/editGuielementPM?id=${guielement.id}">Modify</a></td>
	</tr>	
	</c:forEach>
	</c:if>
</tbody>
</table>
</fieldset> 

<br><a href="/featureTree/addGuielementPM"> Add GUI Element </a>
<br><a href="/featureTree"> Home </a><br>
</body>
</html>
