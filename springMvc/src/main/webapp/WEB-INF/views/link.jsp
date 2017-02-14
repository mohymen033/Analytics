<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Links</title>
</head>
<body>
<P>  The time on the server is ${serverTime}. </P>

<h2>Product Features of iPhone 4s</h2>
<hr clolor="green" />
<br><br>
<a href="#f1"> F1: The intelligent assistant that helps you get things done. All you have to do is ask. </a><br>
<a href="#f2"> F2: Dual-core A5 chip. The most powerful iPhone ever. </a><br>
<a href="#f3"> F3: The you-can't-believe-it's-on-a-phone camera. </a><br>
<a href="#f4"> F4: Video recording. In 1080p amazing HD. </a><br>
<a href="#f5"> F5: iOS. The world's most advanced mobile operating system. And the easiest to use. </a><br>
<a href="#f6"> F6: iCloud. Your content. On all your devices. </a><br>


<style type="text/css"> 
body{ 
font: 12px arial; 
}
 
.itemcount{ 
cursor:hand; 
font-weight:bold; 
} 
</style>

<script type="text/javascript"> 
/* add 1 to the total */ 
function addItem(thecount){ 
	document.getElementById(thecount).innerHTML = parseFloat(document.getElementById(thecount).innerHTML)+1; 
} 

/* removes 1 from total as long as total is above 0 */ 
function removeItem(thecount){ 
if(parseFloat(document.getElementById(thecount).innerHTML) > 0){ 
document.getElementById(thecount).innerHTML = parseFloat(document.getElementById(thecount).innerHTML)-1; 
} 
} 

/* resets all items according the tagToCheck param to 0 */ 
function resetAllItems(tagToCheck){ 
var numElements = document.getElementsByTagName(tagToCheck).length; 
var i = 0; 
while (i < numElements){ 
document.getElementsByTagName(tagToCheck)[i].innerHTML = 0; 
i++; 
} 
} 

/* post all item counts to your ASP page */ 
function postItems(){ 
document.getElementById('txtTuna').value = document.getElementById('counttuna').innerHTML; 
document.getElementById('txtHam').value = document.getElementById('countHam').innerHTML; 
document.getElementById('txtCola').value = document.getElementById('countCola').innerHTML; 
document.getElementById('frmPostItems').submit(); 
} 
</script>

<p><b>Click item to add or click number to remove.</b> <a href="jsDisabled.html" onclick="resetAllItems('span'); return false;">Click here to reset.</a></p>

<p><a href="#jsDisabled1.html" onclick="addItem('counttuna'); return false;">F1: The intelligent assistant that helps you get things done. All you have to do is ask. </a> 
<br /><span id="counttuna" onclick="removeItem('counttuna');" class="itemcount">0</span></p>

<p><a href="#jsDisabled2.html" onclick="addItem('countHam'); return false;">F2: Dual-core A5 chip. The most powerful iPhone ever.</a> 
<br /><span id="countHam" onclick="removeItem('countHam');" class="itemcount">0</span></p>

<p><a href="#jsDisabled3.html" onclick="addItem('countCola'); return false;"><img src="resources/images/android.jpg" alt="click to add item" /></a> 
<br /><span id="countCola" onclick="removeItem('countCola');" class="itemcount">0</span></p>

<!-- form to post totals --> 
<form action="/springMvc/linksave" method="get" id="frmPostItems"> 
<input type="hidden" name="txtTuna" id="txtTuna" /> 
<input type="hidden" name="txtHam" id="txtHam" /> 
<input type="hidden" name="txtCola" id="txtCola" />

<input type="button" value="Insert into database" onclick="postItems();" /> 
</form>


<br>
<a href="/springMvc"> Home </a>

</body>
</html>
