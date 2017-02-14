<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Add Graphical User Interface Element Properties</title>
</head>

<body>
<h1>Analytics Graphical User Interface Element Properties!</h1>
<h2>Add New Graphical User Interface Element with Properties</h2>
<br>

<c:url var="saveGuielementUrlPM" value="/saveGuielementPM" />
<form id="frmAddGuielementsPM" action="${saveGuielementUrlPM}" method="POST">
<table>
	<tr>
		<td><label for="requiremntId">Select Requirement:</label></td>
		<td>
			<select id="requiremntId" name="requiremntId" title="Select Requirement">
				<option value="NULL" selected="selected">-- None --</option>
				<c:if test="${not empty requirements}">
				<c:forEach var="requirement" items="${requirements}" varStatus="requirements">
					<option value="${requirement.id}">${requirement.name}</option>
				</c:forEach>
				</c:if>
			</select>
		</td> 
	</tr>
	<tr>
		<td><label for="guiName">Gui Element Name:</label></td>
		<td><input type="text" name=guiName id="guiName" size="65" /> </td> 
	</tr>
	<tr>
		<td><label for="guiDesc">Gui Element Description:</label></td>
		<td><textarea name="guiDesc" id="guiDesc" rows="5" cols="50"></textarea> </td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Add GUI Element" /></td>
	</tr>	 
</table>
</form>


<br><br>
<a href="/featureTree/"> Home </a>
</body>
</html>
