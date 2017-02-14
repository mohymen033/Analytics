<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Add Feature</title>
</head>

<body>
<h1>Analytics Of Feature Tree!</h1>
<h2>Add New Feature</h2>

<P>  The time on the server is ${serverTime}. </P>
<br>

 
<c:url var="saveFeatureUrlPM" value="/saveFeaturePM" />
<form id="frmAddFeaturesPM" action="${saveFeatureUrlPM}" method="POST">
<table>
	<tr>
		<td><label for="featureName">Feature Name:</label></td>
		<td><input type="text" name="featureName" id="featureName" size="65" /> </td> 
	</tr>
	<tr>
		<td><label for="featureStatus">Status:</label></td>
		<td><select id="featureStatus" name="featureStatus" title="Select Feature Status">
			<option value="NULL" selected="selected">-- None --</option>
			<option value="0">Inactive</option>
			<option value="1">Active</option>
		</select><td>
	</tr>	
	<tr>
		<td><label for="featureDesc">Feature Description:</label></td>
		<td><textarea name="featureDesc" id="featureDesc" rows="5" cols="50"></textarea> </td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" value="Add Feature" /></td>
	</tr>	 
</table>
</form>


<br><br>
<a href="/featureTree/"> Home </a>
</body>
</html>
