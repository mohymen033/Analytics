<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Feature Management</title>
	<link rel="stylesheet" href="resources/css/folder-tree-static.css" type="text/css">
	<link rel="stylesheet" href="resources/css/context-menu.css" type="text/css">
	<script type="text/javascript" src="resources/js/ajax.js"></script>
	<script type="text/javascript" src="resources/js/folder-tree-static.js"></script>
	<script type="text/javascript" src="resources/js/context-menu.js"></script>
</head>
<body>
<h1 align="center">Configure Feature Tree!</h1>

<p>Feature Tree</p>
<ul id="dhtmlgoodies_tree" class="dhtmlgoodies_tree">
	<li><a href="#" id="node1_1">Product</a>
		<ul>
			<c:if test="${not empty features}">
			<c:forEach var="feature" items="${features}" varStatus="features">
				<li parentId="1"><a href="#" id="node1_${feature.id+1}">${feature.name}</a></li>
			</c:forEach>
			</c:if>
		</ul>
	</li>
</ul>
<script type="text/javascript">
	initContextMenu();
</script>


<c:choose>
	<c:when test="${not empty serverTime}">
		<P>  The time on the server is ${serverTime}. </P>
	</c:when>
	<c:when test="${not empty saveMsg}">
		<P>  ${saveMsg} </P>	
	</c:when>
</c:choose>
<br>
<fieldset>
	<legend>::DashBoard::Feature Management</legend>
<table border="1">
<thead>
	<th>Id</th>
	<th>Name</th>
	<th>Description</th>
	<th>Status</th>
	<th>Action</th>
</thead>

<tbody>
	<c:if test="${not empty features}">
	<c:forEach var="feature" items="${features}" varStatus="features">
	<tr>	
		<td>${feature.id}</td>
		<td>${feature.name}</td>
		<td>${feature.description}</td>
		<td>${feature.is_active}</td>
		<td><a href="/featureTree/editFeature?id=${feature.id}">Modify</a></td>
	</tr>	
	</c:forEach>
	</c:if>
</tbody>
</table>
</fieldset> 

<br><a href="/featureTree/addFeature"> Add Feature </a>
<br><a href="/featureTree"> Home </a><br>
</body>
</html>
