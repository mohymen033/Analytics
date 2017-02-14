<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Map Graphical User Interface Element with Requirements</title>
</head>

<body>
<h1>Map Graphical User Interface Element with Requirements!</h1>
<br>
<c:if test="${not empty saveMsg}">
	<P> ${saveMsg} </P>
</c:if>
<br>
<c:url var="saveMappedGuielementUrlPM" value="/saveMappedGuielementPM" />
<form id="frmMapGuielementsPM" action="${saveMappedGuielementUrlPM}" method="GET">
<table>
	<tr>
		<td><label for="requiremntId">Select Requirement:</label></td>
		<td>
			<select id="requirementId" name="requirementId" title="Select Requirement">
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
		<td><label for="guiElementIdName">Gui Element Name:</label></td>
		<td><input id="guiElementIdName" type="text" value="${clickedEvent}" name="guiElementIdName" size="65" /> </td> 
	</tr>
	<tr>
		<td></td>
		<!-- <td><input type="submit" value="MAP GUI Element" onclick='window.close();'/></td> -->
		<td><input type="submit" value="MAP GUI Element" /></td>
	</tr>	 
</table>
</form>
<a href="#" onclick='window.close();'>Close</a>
</body>
</html>
