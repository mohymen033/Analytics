<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Manage Sub Indicator</title>
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
	<legend>::DashBoard::Manage SubIndicator</legend>
<table border="1">
<thead>
	<th>Id</th>
	<th>IndicatorId</th>
	<th>Name</th>
	<th>URL</th>
	<th>Description</th>
	<th>Status</th>
	<th>Action</th>
</thead>

<tbody>
	<c:if test="${not empty sub_indicators}">
	<c:forEach var="sub_indicator" items="${sub_indicators}" varStatus="sub_indicators">
	<tr>	
		<td>${sub_indicator.id}</td>
		<td>${sub_indicator.indicator_id}</td>
		<td>${sub_indicator.name}</td>
		<td>${sub_indicator.url}</td>
		<td>${sub_indicator.description}</td>
		<td>${sub_indicator.is_active}</td>
		<td><a href="/featureTree/editSubIndicator?id=${sub_indicator.id}">Modify</a></td>
	</tr>	
	</c:forEach>
	</c:if>
</tbody>
</table>
</fieldset> 

<br><a href="/featureTree/addSubIndicator"> Add SubIndicator </a>
<br><a href="/featureTree"> Home </a><br>
</body>
</html>
