<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Application Home Page!  
</h1>
<P>  The time on the server is ${serverTime}. </P>

<a href="/springMvc/link"> Link </a> <br>
<a href="/springMvc/passwordgen"> Password Generator </a>
</body>
</html>
