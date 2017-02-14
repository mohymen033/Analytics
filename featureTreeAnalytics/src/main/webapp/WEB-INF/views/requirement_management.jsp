<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Manage Requirement</title>
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
	<legend>::DashBoard::Manage Requirement</legend>
<table border="1">
<thead>
	<th>Id</th>
	<th>FeatureId</th>
	<th>Name</th>
	<th>Description</th>
	<th>Action</th>
</thead>

<tbody>
	<c:if test="${not empty requirements}">
	<c:forEach var="requirement" items="${requirements}" varStatus="requirements">
	<tr>	
		<td>${requirement.id}</td>
		<td>${requirement.feature_id}</td>
		<td>${requirement.name}</td>
		<td>${requirement.description}</td>
		<td><a href="/featureTreeAnalytics/editRequirement?id=${requirement.id}">Modify</a></td>
	</tr>	
	</c:forEach>
	</c:if>
</tbody>
</table>
</fieldset> 

<br><a href="/featureTreeAnalytics/addRequirement"> Add Requirement </a>
<br><a href="/featureTreeAnalytics"> Home </a><br>
</body>
</html>
