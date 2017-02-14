<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Feature Tree</title>
</head>
<body>
<h1 align="center">Analytics Of Feature Tree!</h1>

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
	<legend>::DashBoard::Feature Tree of PM Site</legend>
	<table border="1">
<thead>
	<th>FeatureName</th>
	<th>RequirementName</th>
</thead>

<tbody>
<c:set var="i" value="0" />
<c:set var="j" value="0" />
<c:set var="f_id" value="" />
<c:forEach var="feature_tree" items="${feature_trees}">
	<tr>
	<c:if test="${f_id != feature_trees[j].reqFeatureId}">
		<c:set var="i" value="0" />
	</c:if>
	
	<c:choose>
		<c:when test="${i == 0}">
			<c:set var="f_id" value="${feature_trees[j].reqFeatureId}" />
			<td>${feature_tree.featureName}</td>
			<td>${feature_tree.reqName}</td>
			<td>f_id=${f_id}, f_tree=${feature_trees[j].reqFeatureId}, i=${i} ||</td>
		</c:when>
		<c:otherwise>
			<td></td>
			<td>${feature_tree.reqName}</td>
			<td>f_id=${f_id}, f_tree=${feature_trees[j].reqFeatureId}, i=${i}</td>
		</c:otherwise>
	</c:choose>
	</tr>
	<c:set var="i" value="${i+1}" />  
	<c:set var="j" value="${j+1}" />
</c:forEach>
</tbody>
</table>
</fieldset> 

<br><a href="/featureTree"> Home </a><br>
</body>
</html>
