<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
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
	<legend>::DashBoard::STATISTICS</legend>
	<menu>
	<li><a href="/featureTreeAnalytics/statisticsIndicator"> Indicator Statistics </a></li>
	<li><a href="/featureTreeAnalytics/featureTree"> Feature Tree </a></li>
	<li><a href="/featureTreeAnalytics/graphOfIndicator"> Statistics & Graph </a></li>
	</menu>
</fieldset> 

<br>
<fieldset>
	<legend>::DashBoard::MANAGEMENT</legend>
	<menu>
	<li><a href="/featureTreeAnalytics/managementFeature"> Manage Feature </a></li>
	<li><a href="/featureTreeAnalytics/managementRequirement"> Manage Requirement </a></li>
	<li><a href="/featureTreeAnalytics/managementGuielement"> Manage GUI Element </a></li>
	<li><a href="/featureTreeAnalytics/managementIndicator"> Manage Indicator </a></li>
	<li><a href="/featureTreeAnalytics/managementSubIndicator"> Manage SubIndicator </a></li>
	</menu>
</fieldset> 

<%-- <%response.sendRedirect("http://localhost:8080/springMvc/"); %> --%>
</body>
</html>
