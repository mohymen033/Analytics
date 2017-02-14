<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Add Sub Indicator</title>
</head>

<body>
<h1>Configure Feature Tree!</h1>
<h2>Add New SubIndicator</h2>

<P>  The time on the server is ${serverTime}. </P>
<br>

<c:url var="saveSubIndicatorUrl" value="/saveSubIndicator" />
<form id="frmAddSubIndicators" action="${saveSubIndicatorUrl}" method="POST">
<table>
	<tr>
		<td><label for="indicatorId">Select Indicator:</label></td>
		<td>
			<select id="indicatorId" name="indicatorId" title="Select Indicator">
				<option value="NULL" selected="selected">-- None --</option>
				<c:if test="${not empty indicators}">
				<c:forEach var="indicator" items="${indicators}" varStatus="indicators">
					<option value="${indicator.id}">${indicator.name}</option>
				</c:forEach>
				</c:if>
			</select>
		</td> 
	</tr>
	<tr>
		<td><label for="subIndicatorName">SubIndicator Name:</label></td>
		<td><input type="text" name="subIndicatorName" id="subIndicatorName" size="65" /> </td> 
	</tr>
	<tr>
		<td><label for="subIndicatorURL">SubIndicator URL:</label></td>
		<td><input type="text" name="subIndicatorURL" id="subIndicatorURL" size="65" /> </td> 
	</tr>
	<tr>
		<td><label for="subIndicatorStatus">Status:</label></td>
		<td><select id="subIndicatorStatus" name="subIndicatorStatus" title="Select SubIndicator Status">
			<option value="NULL" selected="selected">-- None --</option>
			<option value="0">Inactive</option>
			<option value="1">Active</option>
		</select><td>
	</tr>
	<tr>
		<td><label for="subIndicatorDesc">SubIndicator Description:</label></td>
		<td><textarea name="subIndicatorDesc" id="subIndicatorDesc" rows="5" cols="50"></textarea> </td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Add SubIndicator" /></td>
	</tr>	 
</table>
</form>


<br><br>
<a href="/featureTree/"> Home </a>
</body>
</html>
