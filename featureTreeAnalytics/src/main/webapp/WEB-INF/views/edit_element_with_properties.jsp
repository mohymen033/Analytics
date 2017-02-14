<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Add Requirement</title>
</head>

<body>
<h1>Analytics of Feature Tree!</h1>
<h2>Update Gui Element</h2>

<P>  The time on the server is ${serverTime}. </P>
<br>

<c:url var="updateGuielementUrl" value="/updateGuielement" />
<form id="frmEditGuielements" action="${updateGuielementUrl}" method="POST">
<table>
	<c:if test="${not empty guielements}">
	<c:forEach var="guielement" items="${guielements}">
		<tr>
			<td><label for="requirementId">Select Requirement:</label></td>
			<td>
				<select id="requirementId" name="requirementId" title="Select Requirement">
					<option value="NULL">-- None --</option>
					<c:if test="${not empty requirements}">
					<c:forEach var="requirement" items="${requirements}" varStatus="requirements">
						<option value="${requirement.id}" <c:if test="${requirement.id == guielement.requirement_id}">selected="selected"</c:if>>${requirement.name}</option>
					</c:forEach>
					</c:if>
				</select>
			</td> 
		</tr>
		<tr>
			<td><label for="guielementName">Gui Element Name:</label></td>
			<td><input type="text" name="guielementName" value="${guielement.name}" id="guielementName" size="65" /> </td> 
		</tr>
		<tr>
			<td><label for="guielementDesc">Gui Element Description:</label></td>
			<td><textarea name="guielementDesc" id="guielementDesc" rows="5" cols="50">${guielement.description}</textarea> </td>
		</tr>
		
		<input type="hidden" name="guielementId" value="${guielement.id}" id="guielementId" />
		<tr>
			<td></td>
			<td><input type="submit" value="Update Guielement" /></td>
		</tr>
	</c:forEach>
	</c:if>	 
</table>
</form>


<br><br>
<a href="/featureTreeAnalytics/"> Home </a>
</body>
</html>
