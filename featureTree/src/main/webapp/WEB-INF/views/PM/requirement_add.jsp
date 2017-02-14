<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Add Requirement</title>
</head>

<body>
<h1>Analytics Of Feature Tree!</h1>
<h2>Add New Requirement</h2>

<P>  The time on the server is ${serverTime}. </P>
<br>

<c:url var="saveRequirementUrlPM" value="/saveRequirementPM" />
<form id="frmAddRequirementsPM" action="${saveRequirementUrlPM}" method="POST">
<table>
	<tr>
		<td><label for="featureId">Select Feature:</label></td>
		<td>
			<select id="featureId" name="featureId" title="Select Feature">
				<option value="NULL" selected="selected">-- None --</option>
				<c:if test="${not empty features}">
				<c:forEach var="feature" items="${features}" varStatus="features">
					<option value="${feature.id}">${feature.name}</option>
				</c:forEach>
				</c:if>
			</select>
		</td> 
	</tr>
	<tr>
		<td><label for="requirementName">Requirement Name:</label></td>
		<td><input type="text" name="requirementName" id="requirementName" size="65" /> </td> 
	</tr>
	<tr>
		<td><label for="requirementDesc">Requirement Description:</label></td>
		<td><textarea name="requirementDesc" id="requirementDesc" rows="5" cols="50"></textarea> </td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Add Requirement" /></td>
	</tr>	 
</table>
</form>


<br><br>
<a href="/featureTree/"> Home </a>
</body>
</html>
