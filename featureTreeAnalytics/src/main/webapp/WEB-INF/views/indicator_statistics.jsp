<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Indicator Statistics</title>
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
	<legend>::DashBoard::Indicators with Sub Indicators</legend>
	<table border="1">
<thead>
	<th>IndicatorName</th>
	<th>SubIndicatorName</th>
</thead>

<tbody>
<c:set var="i" value="0" />
<c:set var="j" value="0" />
<c:set var="ind_id" value="" />
<c:forEach var="indicator_stat" items="${indicator_stats}">
	<tr>
	<c:if test="${ind_id != indicator_stats[j].subIndIndicatorId}">
		<c:set var="i" value="0" />
	</c:if>
	
	<c:choose>
		<c:when test="${i == 0}">
			<c:set var="ind_id" value="${indicator_stats[j].subIndIndicatorId}" />
			<td>${indicator_stat.indicatorName}</td>
			<td><a href="${indicator_stat.subIndicatorUrl}"> ${indicator_stat.subIndicatorName} </a></td>
			<td>ind_id=${ind_id}, ind_tree=${indicator_stats[j].subIndIndicatorId}, i=${i} ||</td>
		</c:when>
		<c:otherwise>
			<td></td>
			<td><a href="${indicator_stat.subIndicatorUrl}"> ${indicator_stat.subIndicatorName} </a></td>
			<td>ind_id=${ind_id}, ind_tree=${indicator_stats[j].subIndIndicatorId}, i=${i}</td>
		</c:otherwise>
	</c:choose>
	</tr>
	<c:set var="i" value="${i+1}" />  
	<c:set var="j" value="${j+1}" />
</c:forEach>
</tbody>
</table>
</fieldset> 



<br><a href="/featureTreeAnalytics"> Home </a><br>
</body>
</html>
