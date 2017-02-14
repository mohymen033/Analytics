<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Update SubIndicator</title>
</head>

<body>
<h1>Analytics of Feature Tree!</h1>
<h2>Update SubIndicator</h2>

<P>  The time on the server is ${serverTime}. </P>
<br>

<c:url var="updateSubIndicatorUrl" value="/updateSubIndicator" />
<form id="frmEditSubIndicators" action="${updateSubIndicatorUrl}" method="POST">
<table>
	<c:if test="${not empty sub_indicators}">
	<c:forEach var="sub_indicator" items="${sub_indicators}">
		<tr>
			<td><label for="indicatorId">Select Indicator:</label></td>
			<td>
				<select id="indicatorId" name="indicatorId" title="Select Indicator">
					<option value="NULL">-- None --</option>
					<c:if test="${not empty indicators}">
					<c:forEach var="indicator" items="${indicators}" varStatus="indicators">
						<option value="${indicator.id}" <c:if test="${indicator.id == sub_indicator.indicator_id}">selected="selected"</c:if>>${indicator.name}</option>
					</c:forEach>
					</c:if>
				</select>
			</td> 
		</tr>
		<tr>
			<td><label for="subIndicatorName">SubIndicator Name:</label></td>
			<td><input type="text" name="subIndicatorName" value="${sub_indicator.name}" id="subIndicatorName" size="65" /> </td> 
		</tr>
		<tr>
			<td><label for="subIndicatorStatus">Status:</label></td>
			<td><select id="subIndicatorStatus" name="subIndicatorStatus" title="Select SubIndicator Status">
				<option value="NULL" selected="selected">-- None --</option>
				<option value="0" <c:if test="${sub_indicator.is_active == 0}">selected="selected"</c:if> >Inactive</option>
				<option value="1" <c:if test="${sub_indicator.is_active == 1}">selected="selected"</c:if> >Active</option>
			</select><td>
		</tr>
		<tr>
			<td><label for="subIndicatorURL">SubIndicator URL:</label></td>
			<td><input type="text" name="subIndicatorURL" value="${sub_indicator.url}" id="subIndicatorURL" size="65" /> </td> 
		</tr>
		<tr>
			<td><label for="subIndicatorDesc">SubIndicator Description:</label></td>
			<td><textarea name="subIndicatorDesc" id="subIndicatorDesc" rows="5" cols="50">${sub_indicator.description}</textarea> </td>
		</tr>
		
		<input type="hidden" name="subIndicatorId" value="${sub_indicator.id}" id="subIndicatorId" />
		<tr>
			<td></td>
			<td><input type="submit" value="Update SubIndicator" /></td>
		</tr>
	</c:forEach>
	</c:if>	 
</table>
</form>


<br><br>
<a href="/featureTreeAnalytics/"> Home </a>
</body>
</html>
