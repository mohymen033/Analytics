<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Update Indicator</title>
</head>

<body>
<h1>Analytics of Feature Tree!</h1>
<h2>Update Indicator</h2>

<P>  The time on the server is ${serverTime}. </P>
<br>

 
<c:url var="updateIndicatorUrl" value="/updateIndicator" />
<form id="frmEditIndicators" action="${updateIndicatorUrl}" method="POST">
<table>
	<c:if test="${not empty indicators}">
	<c:forEach var="indicator" items="${indicators}">
		<tr>
			<td><label for="indicatorName">Indicator Name:</label></td>
			<td><input type="text" name="indicatorName" value="${indicator.name}" id="indicatorName" size="65" /> </td> 
		</tr>
		
		<tr>
			<td><label for="indicatorDesc">Indicator Description:</label></td>
			<td><textarea name="indicatorDesc" id="indicatorDesc" rows="5" cols="50">${indicator.description}</textarea></td>
		</tr>
		
		<input type="hidden" name="indicatorId" value="${indicator.id}" id="indicatorId" />
		<tr>
			<td></td>
			<td><input type="submit" value="Update Indicator" /></td>
		</tr>
	</c:forEach>
	</c:if>	 
</table>
</form>


<br><br>
<a href="/featureTreeAnalytics/"> Home </a>
</body>
</html>
