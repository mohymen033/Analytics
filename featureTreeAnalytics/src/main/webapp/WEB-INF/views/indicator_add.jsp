<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Add Indicator</title>
</head>

<body>
<h1>Analytics of Feature Tree!</h1>
<h2>Add New Indicator</h2>

<P>  The time on the server is ${serverTime}. </P>
<br>

 
<c:url var="saveIndicatorUrl" value="/saveIndicator" />
<form id="frmAddIndicators" action="${saveIndicatorUrl}" method="POST">
<table>
	<tr>
		<td><label for="indicatorName">Indicator Name:</label></td>
		<td><input type="text" name="indicatorName" id="indicatorName" size="65" /> </td> 
	</tr>
	
	<tr>
		<td><label for="indicatorDesc">Indicator Description:</label></td>
		<td><textarea name="indicatorDesc" id="indicatorDesc" rows="5" cols="50"></textarea> </td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Add Indicator" /></td>
	</tr>	 
</table>
</form>


<br><br>
<a href="/featureTreeAnalytics/"> Home </a>
</body>
</html>
