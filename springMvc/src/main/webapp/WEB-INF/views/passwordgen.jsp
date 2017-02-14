<%@page import="java.rmi.server.ServerCloneException"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<%@ page import="java.io.*,java.util.*" %>
<%
   // Get session creation time.
   Date createTime = new Date(session.getCreationTime());
   // Get last access time of this web page.
   Date lastAccessTime = new Date(session.getLastAccessedTime());

   String title = "Welcome Back to my website";
   Integer visitCount = new Integer(0);
   String visitCountKey = new String("visitCount");
   String userIDKey = new String("userID");
   String userID = new String("ABCD");

   // Check if this is new comer on your web page.
   if (session.isNew()){
      title = "Welcome to my website";
      session.setAttribute(userIDKey, userID);
      session.setAttribute(visitCountKey,  visitCount);
   } 
   visitCount = (Integer)session.getAttribute(visitCountKey);
   visitCount = visitCount + 1;
   userID = (String)session.getAttribute(userIDKey);
   session.setAttribute(visitCountKey,  visitCount);
   session.setMaxInactiveInterval(10);
   
%>


<html>
<head>
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> -->
	<title>Generate Strong Password</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.pack.js"></script>
	
	<script type="text/javascript" src="http://j.maxmind.com/app/geoip.js"></script>
	<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=true"></script> 	
</head>

<script type="text/javascript">
var theSymbols = [" ", "!", "\"", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "{", "]", "}", ";", ":", "'", "@", "#", "~", "|", ",", "<", ".", ">", "/", "?"]; //Removed "\\", because backslash character can cause problems when passwords are stored.

function GeneratePassword(lengthOfPassword, wantSymbols) {
	var theLetters = "abcdefghijklmnopqrstuvwxyz";
	var StrongPasswordArray = [];
	var capitalise;
	for (var i = 0; i < lengthOfPassword; i++) {
		capitalise = Math.round(Math.random() * 1);
		if (capitalise === 0) {
			StrongPasswordArray[i] = theLetters.charAt(Math.round(Math.random() * 25)).toUpperCase();
		}
		else {
			StrongPasswordArray[i] = theLetters.charAt(Math.round(Math.random() * 25));
		}
	}
	var numberOfDigits;
	numberOfDigits = Math.round(Math.random() * (lengthOfPassword - 1)) + 1;
	var positionForNumeric, theNumber;
	for (i = 0; i < numberOfDigits; i++) {
		positionForNumeric = Math.round(Math.random() * (lengthOfPassword - 1));
		theNumber = Math.round(Math.random() * 9);
		StrongPasswordArray[positionForNumeric] = theNumber;
	}
	if (wantSymbols) {
		var numberOfSymbols;
		numberOfSymbols = Math.round(Math.random() * (lengthOfPassword - 1)) + 1;
		var positionForSymbol;
		var locationOfSymbolInArray;
		var theSymbol;
		for (i = 0; i < numberOfSymbols; i++) {
			positionForSymbol = Math.round(Math.random() * (lengthOfPassword - 1)); 
			locationOfSymbolInArray = Math.round(Math.random() * (theSymbols.length - 1));
			theSymbol = theSymbols[locationOfSymbolInArray];
			StrongPasswordArray[positionForSymbol] = theSymbol;
		}
	}
	return StrongPasswordArray;
}

function Validate(StrongPasswordArray, lengthOfPassword, wantSymbols) {
	var hasAnUpperCaseLetter = false;
	var hasALowerCaseLetter = false;
	var hasANumber = false;
	var hasASymbol = false;
	var correctLength = false;
	for (var i = 0; i < StrongPasswordArray.length; i++) {
		if ("A" <= StrongPasswordArray[i] && StrongPasswordArray[i] <= "Z") {
			hasAnUpperCaseLetter = true;
			break;
		}
	}
	for (i = 0; i < StrongPasswordArray.length; i++) {
		if ("a" <= StrongPasswordArray[i] && StrongPasswordArray[i] <= "z") {
			hasALowerCaseLetter = true;
			break;
		}
	}
	for (i = 0; i < StrongPasswordArray.length; i++) {
		if ("0" <= StrongPasswordArray[i] && StrongPasswordArray[i] <= "9") {
			hasANumber = true;
			break;
		}
	}
	if (wantSymbols) {
		for (i = 0; i < StrongPasswordArray.length; i++) {
			for (var iSymbols = 0; iSymbols < theSymbols.length; iSymbols++) 
			{
				if (StrongPasswordArray[i] == theSymbols[iSymbols]) {
					hasASymbol = true;
					break;
				}
			}
		}
	}
	if (StrongPasswordArray.length == lengthOfPassword) {
		correctLength = true;
	}
	if (!wantSymbols) {
		hasASymbol = true;
	}
	if (!hasAnUpperCaseLetter || !hasALowerCaseLetter || !hasANumber || !hasASymbol || !correctLength) {
		lengthOfPassword = "";
		loop = "";
		hasAnUpperCaseLetter = "";
		hasALowerCaseLetter = "";
		hasANumber = "";
		hasASymbol = "";
		correctLength = "";
		return false;
	}
	else {
		return true;
	}
}

function displayPassword() {
	var newStrongPasswordArray;
	var passwordIsOK = false;
	while (!passwordIsOK) {
		newStrongPasswordArray = GeneratePassword(document.getElementById("ddlLength").options[document.getElementById("ddlLength").selectedIndex].value, document.getElementById("chkSymbols").checked);
		passwordIsOK = Validate(newStrongPasswordArray, document.getElementById("ddlLength").options[document.getElementById("ddlLength").selectedIndex].value, document.getElementById("chkSymbols").checked);
	}
	var StrongPassword = "";
	for (var i = 0; i < newStrongPasswordArray.length; i++) {
		StrongPassword += newStrongPasswordArray[i];
	}
	document.getElementById("outputPassword").replaceChild(document.createTextNode(StrongPassword), document.getElementById("outputPassword").firstChild);
	document.getElementById("outputPassword").focus();
}

function addEventHandlers() {
	if (document.getElementById) {
		if (document.getElementById("btnGenerate")) {
			document.getElementById("btnGenerate").onclick = displayPassword;
		}
	}
}

/* function addItem(thecount){ 
	document.getElementById(thecount).innerHTML = parseFloat(document.getElementById(thecount).innerHTML)+1;
} */
</script>

<body id="pgbody" onload="addEventHandlers()" > 


<h1>
	Strong Password Generation!  
</h1>
<P>  The time on the server is ${serverTime}. </P>

<form id="StrongPasswordGenerator" >
	<fieldset>
		<legend>Strong Password Generator</legend>
		<ol>
			<label for="ddlLength">Select Password Length:</label>
			<select id="ddlLength" title="Select Your Password Length" >
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12" selected="selected">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
				<option value="30">30</option>
			</select><br>
			
			<input id="chkSymbols" checked="checked" type="checkbox"/>
			<label for="chkSymbols" >Punctuation (<kbd>!</kbd>, <kbd>"</kbd>, <kbd>£</kbd>, <kbd>$</kbd>, <kbd>%</kbd>, and so on)</label>
			<br>
			
			<input id="btnGenerate" type="button" value="Generate Strong Password" />
		</ol>

		<dl>
			<dt>Your new password:</dt>
			<dd id="ddForOutputPassword">
				<kbd id="outputPassword" tabindex="-1" spellcheck="false">See Your New Password Here!</kbd>
			</dd>
		</dl>
	</fieldset>
</form>


<article id="StrongPasswordGuidelines">
	<h2>Strong Password Guidelines</h2>
	<dl>
		<dt>A strong password:</dt>
		<dd>has at least <strong>15 characters</strong>;</dd>
		<dd>has <strong>uppercase letters</strong>;</dd>
		<dd>has <strong>lowercase letters</strong>;</dd>
		<dd>has <strong>numbers</strong>;</dd>
		<dd>has <strong>symbols</strong>, such as <kbd>` ! " ? $ ? % ^ &amp; * ( ) _ - + = { [ } ] : ; @ ' ~ # | \ &lt; , &gt; . ? /</kbd></dd>
		<dd>is <strong>not</strong> like your <strong>previous passwords</strong>;</dd>
		<dd>is <strong>not</strong> your <strong>name</strong>;</dd>
		<dd>is <strong>not</strong> your <strong>login</strong>;</dd>
		<dd>is <strong>not</strong> your <strong>friend&rsquo;s name</strong>;</dd>
		<dd>is <strong>not</strong> your <strong>family member&rsquo;s name</strong>;</dd>
		<dd>is <strong>not</strong> a dictionary <strong>word</strong>;</dd>
		<dd>is <strong>not</strong> a <strong>common name</strong>;</dd>
		<dd>is <strong>not</strong> a <strong>keyboard pattern</strong>, such as <kbd>qwerty</kbd>, <kbd>asdfghjkl</kbd>, or <kbd>12345678</kbd>.</dd>
	</dl>
</article>
	
<!-- 
Form Click Count: <span id="counttuna" onclick="removeItem('counttuna');" class="itemcount">0</span></br>
Password length field Click Count: <span id="countfieldset" onclick="removeItem('countfieldset');" class="itemcount">0</span><br/>
Punctuation Checkbox Click Count: <span id="countcheckfieldset" onclick="removeItem('countcheckfieldset');" class="itemcount">0</span></br>
Password generate button Click Count: <span id="countpassgenfieldset" onclick="removeItem('countpassgenfieldset');" class="itemcount">0</span></br>
-->
 
<br><br>
<a href="/springMvc">Home</a><br>
<a href="link">Link</a><br> 

<!-- IP address -->
<%
java.net.InetAddress thisIp =java.net.InetAddress.getLocalHost();
String hostname=thisIp.getHostName();
String ipaddress = thisIp.getHostAddress();
out.print( ipaddress );

%>

<script type="text/javascript">
// Track Web App
$('#pgbody').click(function (event) {
	var admin_status = 0;
	
	var latitute;
	var longitude;
	var visitorAddress;
	var geocoder = new google.maps.Geocoder();
	
	//var clickedEvent = event.target.id;
	var clickedEventClass = event.target.className
	var clickedEventtitle = event.srcElement.title;
	var clickedEvent = event.target.id;
	if(!clickedEvent)
	{
		clickedEvent = clickedEventClass;
		if(!clickedEventClass)
		{
			clickedEvent = clickedEventtitle;
		}
	}

	
	if((admin_status == 1) && (clickedEvent != '') && (clickedEvent != 'pgbody')){
		var popupWindow = window.open("http://localhost:8080/featureTree/mapGuielement?eventId="+clickedEvent, "popupWindow", "height=550,width=780");
	}
	  		
	if (navigator.geolocation)
	{
		navigator.geolocation.getCurrentPosition(showPosition);
	}
	
	function showPosition(position)
	{
	   latitute=position.coords.latitude;
	   longitude=position.coords.longitude;
	   //console.log(codeLatLng(latitute,longitude));
	   var latlng = new google.maps.LatLng(latitute, longitude);
	   geocoder.geocode({'latLng': latlng}, function(results, status) {
		      if (status == google.maps.GeocoderStatus.OK) {
		     // console.log(results)
		        if (results[1]) {
		         //formatted address
		        // alert(results[0].formatted_address);
		         
		         visitorAddress=results[0].formatted_address;
		        
		        //find country name
		             for (var i=0; i<results[0].address_components.length; i++) {
		            for (var b=0;b<results[0].address_components[i].types.length;b++) {

		            //there are different types that might hold a city admin_area_lvl_1 usually does in come cases looking for sublocality type will be more appropriate
		                if (results[0].address_components[i].types[b] == "administrative_area_level_1") {
		                    //this is the object you are looking for
		                    visitorAddress= results[0].address_components[i].long_name;
		                    break;
		                }
		            }
		        }
		       
		        } else {
		          alert("No results found");
		        }
		      } else {
		        alert("Geocoder failed due to: " + status);
		      }
		      console.log(visitorAddress);
		    var eventValue = event.target.id;
		  	//var sessionValue=10;
		  	var sessionId ="<%=session.getId().toString()%>"; 
		  	var ipaddress="<%=ipaddress%>";
		  //	alert(ipaddress);
		  //	alert(sessionId);
		  if ( (admin_status == 0) && (clickedEvent != '') && (clickedEvent != 'pgbody')){
		  //	alert(clickedEvent);
		      $.get('http://localhost:8080/featureTree/addGuielementvisit', { eventvalue:clickedEvent,sessionId:sessionId,visitorAddress:visitorAddress,ipaddress:ipaddress}, function(data){
		      	//if(data == 1){
		      		//alert('Data was saved in db!');
		      		
		        //  }
		          //else
		          //{
		          	
		          	//alert(address);
		          	
		          //}
		      });
		  }
		    });
	   
	 };
	 
});
var countryname=geoip_country_name();
//alert(countryname);




</script>
</body>
</html>
