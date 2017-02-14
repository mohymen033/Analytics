<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Update Requirement</title>
</head>

<body>
<h1>Configure Feature Tree!</h1>
<h2>Update Requirement</h2>

<P>  The time on the server is ${serverTime}. </P>
<br>

<c:url var="updateRequirementUrl" value="/updateRequirement" />
<form id="frmEditRequirements" action="${updateRequirementUrl}" method="POST">
<table>
	<c:if test="${not empty requirements}">
	<c:forEach var="requirement" items="${requirements}">
		<tr>
			<td><label for="featureId">Select Feature:</label></td>
			<td>
				<select id="featureId" name="featureId" title="Select Feature">
					<option value="NULL">-- None --</option>
					<c:if test="${not empty features}">
					<c:forEach var="feature" items="${features}" varStatus="features">
						<option value="${feature.id}" <c:if test="${feature.id == requirement.feature_id}">selected="selected"</c:if>>${feature.name}</option>
					</c:forEach>
					</c:if>
				</select>
			</td> 
		</tr>
		<tr>
			<td><label for="requirementName">Requirement Name:</label></td>
			<td><input type="text" name="requirementName" value="${requirement.name}" id="requirementName" size="65" /> </td> 
		</tr>
		<tr>
			<td><label for="requirementDesc">Requirement Description:</label></td>
			<td><textarea name="requirementDesc" id="requirementDesc" rows="5" cols="50">${requirement.description}</textarea> </td>
		</tr>
		
		<input type="hidden" name="requirementId" value="${requirement.id}" id="requirementId" />
		<tr>
			<td></td>
			<td><input type="submit" value="Update Requirement" /></td>
		</tr>
	</c:forEach>
	</c:if>	 
</table>
</form>


<br><br>
<a href="/featureTree/"> Home </a>
</body>
</html>
