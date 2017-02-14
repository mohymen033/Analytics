<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h2 align="center"><b>Configure Feature Tree!</b></h2>

<c:choose>
	<c:when test="${not empty serverTime}">
		<P>  The time on the server is ${serverTime}. </P>
	</c:when>
	<c:when test="${not empty saveMsg}">
		<P>  ${saveMsg} </P>	
	</c:when>
</c:choose>

<fieldset>
	<legend><b>::DashBoard::STATISTICS OF APP</b></legend>
	<menu>
	<li><a href="/featureTree/featureTree"> Feature Tree </a></li>
	<li><a href="/featureTree/statisticsIndicator"> Indicator & sub-Indicator </a></li>
	<li><a href="/featureTree/graphOfIndicator"> Statistics & Graphs </a></li>
	</menu>
</fieldset> 

<fieldset>
	<legend><b>::DashBoard::MANAGEMENT OF APP</b></legend>
	<menu>
	<li><a href="/featureTree/managementFeature"> Manage Feature </a></li>
	<li><a href="/featureTree/managementRequirement"> Manage Requirement </a></li>
	<li><a href="/featureTree/managementGuielement"> Manage GUI Element </a></li>
	<li><a href="/featureTree/managementIndicator"> Manage Indicator </a></li>
	<li><a href="/featureTree/managementSubIndicator"> Manage SubIndicator </a></li>
	</menu>
</fieldset> 

<fieldset>
	<legend><b>::DashBoard::STATISTICS OF PM SITE ACTIVITY</b></legend>
	<menu>
	<li><a href="/featureTree/featureTreePM"> Feature Tree </a></li>
	<li><a href="/featureTree/graphOfIndicatorPM"> Statistics & Graphs </a></li>
	</menu>
</fieldset> 

<fieldset>
	<legend><b>::DashBoard::MANAGEMENT OF PM SITE ACTIVITY</b></legend>
	<menu>
	<li><a href="/featureTree/managementFeaturePM"> Manage Feature </a></li>
	<li><a href="/featureTree/managementRequirementPM"> Manage Requirement </a></li>
	<li><a href="/featureTree/managementGuielementPM"> Manage GUI Element </a></li>
	<!-- 
	<li><a href="/featureTree/managementIndicator"> Manage Indicator </a></li>
	<li><a href="/featureTree/managementSubIndicator"> Manage SubIndicator </a></li>  
	-->
	</menu>
</fieldset> 

<%-- <%response.sendRedirect("http://localhost:8080/springMvc/"); %> --%>
</body>
</html>
