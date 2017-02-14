<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Update Feature</title>
</head>

<body>
<h1>Analytics Of Feature Tree!</h1>
<h2>Update Feature</h2>

<P>  The time on the server is ${serverTime}. </P>
<br>

 
<c:url var="updateFeatureUrlPM" value="/updateFeaturePM" />
<form id="frmEditFeaturesPM" action="${updateFeatureUrlPM}" method="POST">
<table>
	<c:if test="${not empty features}">
	<c:forEach var="feature" items="${features}">
		<tr>
			<td><label for="featureName">Feature Name:</label></td>
			<td><input type="text" name="featureName" value="${feature.name}" id="featureName" size="65" /> </td> 
		</tr>
		<tr>
			<td><label for="featureStatus">Status:</label></td>
			<td><select id="featureStatus" name="featureStatus" title="Select Feature Status">
				<option value="NULL" selected="selected">-- None --</option>
				<option value="0" <c:if test="${feature.is_active == 0}">selected="selected"</c:if> >Inactive</option>
				<option value="1" <c:if test="${feature.is_active == 1}">selected="selected"</c:if> >Active</option>
			</select><td>
		</tr>		
		<tr>
			<td><label for="featureDesc">Feature Description:</label></td>
			<td><textarea name="featureDesc" id="featureDesc" rows="5" cols="50">${feature.description}</textarea></td>
		</tr>
		
		<input type="hidden" name="featureId" value="${feature.id}" id="featureId" />
		<tr>
			<td></td>
			<td><input type="submit" value="Update Feature" /></td>
		</tr>
	</c:forEach>
	</c:if>	 
</table>
</form>


<br><br>
<a href="/featureTree/"> Home </a>
</body>
</html>
