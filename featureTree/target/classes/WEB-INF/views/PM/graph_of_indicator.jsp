<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="java.rmi.server.ServerCloneException"%>
<%@page import="javax.xml.ws.Response"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page session="true" %>

<%@ page import="java.io.*,java.util.*" %>
<%
   // Get session creation time.
   Date createTime = new Date(session.getCreationTime());
   // Get last access time of this web page.
   Date lastAccessTime = new Date(session.getLastAccessedTime());

   String title = "Visual Analytics of Features";
   Integer visitCount = new Integer(0);
   String visitCountKey = new String("visitCount");
   String userIDKey = new String("userID");
   String userID = new String("ABCD");

   // Check if this is new comer on your web page.
   if (session.isNew()){
      title = "Visual Analytics of Feature";
      session.setAttribute(userIDKey, userID);
      session.setAttribute(visitCountKey,  visitCount);
   }
   
   visitCount = (Integer)session.getAttribute(visitCountKey);
   visitCount = visitCount + 1;
   userID = (String)session.getAttribute(userIDKey);
   session.setAttribute(visitCountKey,  visitCount);
   session.setMaxInactiveInterval(10);
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PM Site::Statistics of Feature Tree</title>

<script src="http://code.jquery.com/jquery-1.7.2.js"></script>
<script src="resources/js/jquery.ui.core.js"></script>
<script src="resources/js/jquery.ui.datepicker.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<link rel="stylesheet"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/base/jquery-ui.css"
	type="text/css" media="all">

<script type="text/javascript">
   var sampledata =null;//${arrayofelementforvisualgraph};
   //alert('${arrayofelementforvisualgraph}');
   
   // Change Feature Font Color OnClick 
   var newFontColor = "#0000FF";
   var defaultFontColor = "#000000";

   // FeatureID
   function defaultColor(f_len, elementId, node)
	{
 		//alert(f_len);
 		//alert(elementId);
 		var i;
 		for(i = 0; i<=f_len; i++)
 			{
 				if(elementId != (node+i))
 				{
 					document.getElementById(node+i).style.color = defaultFontColor;	
 				}
 			}
 	}
   
	var featureId1 = 0;
	function getFeatureId1(fId1, elementId, f_len){
		featureId1 = fId1;
		document.getElementById(elementId).style.color = newFontColor;
		defaultColor(f_len, elementId, "node1_");
		doAjaxPostG1();
		doAjaxPostG2();
	}

	var featureId2 = 0;
	function getFeatureId2(fId2, elementId, f_len){
		featureId2 = fId2;
		document.getElementById(elementId).style.color = newFontColor;
		defaultColor(f_len, elementId, "node2_");
		doAjaxPostG3();
		doAjaxPostG4();
	}

	// Sub-Indicator ID
	var subIndicatorIdG1 = 1;
	function getSubIndicatorIDG1(sig1){
		subIndicatorIdG1 = sig1;
		doAjaxPostG1();
	}

	var subIndicatorIdG2 = 1;
	function getSubIndicatorIDG2(sig2){
		subIndicatorIdG2 = sig2;
		doAjaxPostG2();
	}

	var subIndicatorIdG3 = 1;
	function getSubIndicatorIDG3(sig3){
		subIndicatorIdG3 = sig3;
		doAjaxPostG3();
	}

	var subIndicatorIdG4 = 1;
	function getSubIndicatorIDG4(sig4){
		subIndicatorIdG4 = sig4;
		doAjaxPostG4();
	}


	// Graph Type ID
	var graphTypeG1 = 1;
	function getGraphTypeG1(gtg1){
		graphTypeG1 = gtg1;
		doAjaxPostG1();
	}
	
	var graphTypeG2 = 2;
	function getGraphTypeG2(gtg2){
		graphTypeG2 = gtg2;
		doAjaxPostG2();
	}
	
	var graphTypeG3 = 1;
	function getGraphTypeG3(gtg3){
		graphTypeG3 = gtg3;
		doAjaxPostG3();
	}
	
	var graphTypeG4 = 2;
	function getGraphTypeG4(gtg4){
		graphTypeG4 = gtg4;
		doAjaxPostG4();
	}

	// Date Picker
   	$(function() {
	   	// Graph1
	   	$( "#fromG1" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				doAjaxPostG1();
				$( "#toG1" ).datepicker( "option", "minDate", selectedDate );
				var dateAsString = selectedDate; //the first parameter of this function
	   			dateAsObject = $(this).datepicker( 'getDate' ); //the getDate method
	   			var to = $("#toG1").val();
			}
		});
	   	$( "#toG1" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				doAjaxPostG1();
				$( "#fromG1" ).datepicker( "option", "maxDate", selectedDate );
				var from = $("#fromG1").val();
			}
		});
	   	
	
	   	// Graph2
	   	$( "#fromG2" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				doAjaxPostG2();
				$( "#toG2" ).datepicker( "option", "minDate", selectedDate );
				var dateAsString = selectedDate; //the first parameter of this function
	   			dateAsObject = $(this).datepicker( 'getDate' ); //the getDate method
	   			var to = $("#toG2").val();
			}
		});
	   	$( "#toG2" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				doAjaxPostG2();
				$( "#fromG2" ).datepicker( "option", "maxDate", selectedDate );
				var from = $("#fromG2").val();
			}
		});
	   	
	   	// Graph3
	   	$( "#fromG3" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				doAjaxPostG3();
				$( "#toG3" ).datepicker( "option", "minDate", selectedDate );
				var dateAsString = selectedDate; //the first parameter of this function
	   			dateAsObject = $(this).datepicker( 'getDate' ); //the getDate method
	   			var to = $("#toG3").val();
			}
		});
	   	$( "#toG3" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				doAjaxPostG3();
				$( "#fromG3" ).datepicker( "option", "maxDate", selectedDate );
				var from = $("#fromG3").val();
			}
		});
	   	
	   	// Graph4
	   	$( "#fromG4" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				doAjaxPostG4();
				$( "#toG4" ).datepicker( "option", "minDate", selectedDate );
				var dateAsString = selectedDate; //the first parameter of this function
	   			dateAsObject = $(this).datepicker( 'getDate' ); //the getDate method
	   			var to = $("#toG4").val();
			}
		});
	   	$( "#toG4" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 1,
			onSelect: function( selectedDate ) {
				doAjaxPostG4();
				$( "#fromG4" ).datepicker( "option", "maxDate", selectedDate );
				var from = $("#fromG4").val();
			}
		});
	});
   
   google.load("visualization", "1", {packages:["linechart"]});
   //google.setOnLoadCallback(drawChart);
    
   // Graph1
   function drawChartG1(sampledata) 
   {
      var title="";
      var dataG1 = new google.visualization.DataTable();
      
      dataG1.addColumn('date', 'Dateofvisit');
      title=sampledata[0];
      dataG1.addColumn('number', title); // Implicit data column.
      
      for (var i=1;i<sampledata.length;i++)
   	  {
        eval('var obj= '+sampledata[i]);
   	  	dataG1.addRow( obj);
   	  }
           
     var optionsG1 = {
        title:title,
        legend:'Right',
        pointSize:'6',
        vAxis: {title: "Visitor"},
        hAxis: {title: "Time"}
     };
     	
     var chart = new google.visualization.LineChart(document.getElementById('chart_div_g1'));
     	if(typeof(graphTypeG1) !== 'undefined' && graphTypeG1 != null) {
	       	if(graphTypeG1 == 1)
	       	{
	       		chart = new google.visualization.LineChart(document.getElementById('chart_div_g1'));
	       	}
	       	if(graphTypeG1 == 2)
	       	{
	       		chart = new google.visualization.PieChart(document.getElementById('chart_div_g1'));
	       	}
      	}
     	chart.draw(dataG1,optionsG1);
     }

	// Graph2
   	function drawChartG2(sampledata) 
    {
     	var title="";
		var dataG2 = new google.visualization.DataTable();
         
        dataG2.addColumn('date', 'Dateofvisit');

        if(sampledata[0]==1){
      	   title="Total Visit Count By Date";
        }
         
        dataG2.addColumn('number', title); // Implicit data column.
        
        for (var i=1;i<sampledata.length;i++)
  	   	{
    	   eval('var obj= '+sampledata[i]);
  	  		dataG2.addRow( obj);
  	   	}
        	
        var optionsG2 = {
            title: title,
            legend:'Right',
            pointSize:'6',
            vAxis: {title: "Visitor"},
            hAxis: {title: "Time"}
        };

     	var chart = new google.visualization.LineChart(document.getElementById('chart_div_g2'));
     	if(typeof(graphTypeG2) !== 'undefined' && graphTypeG2 != null) {
	       	if(graphTypeG2 == 1)
	       	{
	       		chart = new google.visualization.LineChart(document.getElementById('chart_div_g2'));
	       	}
	       	if(graphTypeG2 == 2)
	       	{
	       		chart = new google.visualization.PieChart(document.getElementById('chart_div_g2'));
	       	}
      	}

       	chart.draw(dataG2,optionsG2);
    }

	// Graph3
   	function drawChartG3(sampledata) 
    {
		var title="";
      	var dataG3 = new google.visualization.DataTable();
         
        dataG3.addColumn('date', 'Dateofvisit');
		
        if(sampledata[0]==1){
      	   title="Total Visit Count By Date";
        }
         
        dataG3.addColumn('number', title); // Implicit data column.
                   
        for (var i=1;i<sampledata.length;i++)
  	   	{
    	   	eval('var obj= '+sampledata[i]);
  	  		dataG3.addRow( obj);
  	   	}
                    
       	var optionsG3 = {
           title: title,
           legend:'Right',
           pointSize:'6',
           vAxis: {title: "Visitor"},
           hAxis: {title: "Time"}
       	};

    	var chart = new google.visualization.LineChart(document.getElementById('chart_div_g3'));
    	if(typeof(graphTypeG3) !== 'undefined' && graphTypeG3 != null) {
	      	if(graphTypeG3 == 1)
	      	{
	      		chart = new google.visualization.LineChart(document.getElementById('chart_div_g3'));
	      	}
	      	if(graphTypeG3 == 2)
	      	{
	      		chart = new google.visualization.PieChart(document.getElementById('chart_div_g3'));
	      	}
     	}

       	chart.draw(dataG3,optionsG3);
    }


	// Graph4
   	function drawChartG4(sampledata) 
    {
		var title="";
      	var dataG4 = new google.visualization.DataTable();
         
        dataG4.addColumn('date', 'Dateofvisit');

        if(sampledata[0]==1){
         	   title="Total Visit Count By Date";
        }
         
        dataG4.addColumn('number', title); // Implicit data column.
          
        for (var i=1;i<sampledata.length;i++)
  	   	{
    	   	eval('var obj= '+sampledata[i]);
	  	  	dataG4.addRow( obj);
  	   	}
         
        var optionsG4 = {
            title: title,
            legend:'Right',
            pointSize:'6',
            vAxis: {title: "Visitor"},
            hAxis: {title: "Time"}
       	};

     	var chart = new google.visualization.LineChart(document.getElementById('chart_div_g4'));
     	if(typeof(graphTypeG4) !== 'undefined' && graphTypeG4 != null) {
	       	if(graphTypeG4 == 1)
	       	{
	       		chart = new google.visualization.LineChart(document.getElementById('chart_div_g4'));
	       	}
	       	if(graphTypeG4 == 2)
	       	{
	       		chart = new google.visualization.PieChart(document.getElementById('chart_div_g4'));
	       	}
      	}

       	chart.draw(dataG4,optionsG4);
    }
</script>

<script type="text/javascript">
	function doAjaxPostG1() {  

	   // Get the Form Values  
	   //var indicatorIdG1 = $('#ig1').val();
	   //var subIndicatorIdG1 = $('#sig1').val();
	   //var graphTypeG1 = $('#gtg1').val();
	   var fromG1 = $('#fromG1').val();
	   var toG1 = $('#toG1').val();
	   
	   //alert('featureId1: '+ featureId1);
	   //alert('indicatorIdG1: '+ indicatorIdG1);
	   //alert('subIndicatorIdG1: '+ subIndicatorIdG1);
	   //alert('graphTypeG1: '+ graphTypeG1);
	   //alert('fromG1: '+ fromG1);
	   //alert('toG1: '+ toG1);
	   
	   $.ajax({  
	     type: "GET",  
	     url: "/featureTree/getAjaxResponsePM",  
	     data: "featureId=" + featureId1 + "&subIndicatorId=" + subIndicatorIdG1 + "&graphType=" + graphTypeG1 + "&from=" + fromG1 + "&to=" + toG1,  
	     success: function(data){ 
	     	sampledata=data;
	     	drawChartG1(sampledata);
	     },  
	     error: function(e){  
	       alert('Error: ' + e);  
	     }  
	   });  
	}
	
	function doAjaxPostG2() {  
	   // Get the Form Values  
	   //var indicatorIdG2 = $('#ig2').val();
	   //var subIndicatorIdG2 = $('#sig2').val();
	   //var graphTypeG2 = $('#gtg2').val();
	   var fromG2 = $('#fromG2').val();
	   var toG2 = $('#toG2').val();
	   
	   $.ajax({  
	     type: "GET",  
	     url: "/featureTree/getAjaxResponsePM",  
	     data: "featureId=" + featureId1 + "&subIndicatorId=" + subIndicatorIdG2 + "&graphType=" + graphTypeG2 + "&from=" + fromG2 + "&to=" + toG2,  
	     success: function(data){ 
	    	 sampledata=data;
		     drawChartG2(sampledata);
	     },  
	     error: function(e){  
	       alert('Error: ' + e);  
	     }  
	   });  
	}
	
	function doAjaxPostG3() {  
	   // Get the Form Values  
	   //var indicatorIdG3 = $('#ig3').val();
	   //var subIndicatorIdG3 = $('#sig3').val();
	   //var graphTypeG3 = $('#gtg3').val();
	   var fromG3 = $('#fromG3').val();
	   var toG3 = $('#toG3').val();
	   
	   $.ajax({  
	     type: "GET",  
	     url: "/featureTree/getAjaxResponsePM",  
	     data: "featureId=" + featureId2 + "&subIndicatorId=" + subIndicatorIdG3 + "&graphType=" + graphTypeG3 + "&from=" + fromG3 + "&to=" + toG3,  
	     success: function(data){ 
	    	 sampledata=data;
		     drawChartG3(sampledata);
	     },  
	     error: function(e){  
	       alert('Error: ' + e);  
	     }  
	   });  
	}
	
	function doAjaxPostG4() {  
	   // Get the Form Values  
	   //var indicatorIdG4 = $('#ig4').val();
	   //var subIndicatorIdG4 = $('#sig4').val();
	   //var graphTypeG4 = $('#gtg4').val();
	   var fromG4 = $('#fromG4').val();
	   var toG4 = $('#toG4').val();
	   
	   $.ajax({  
	     type: "GET",  
	     url: "/featureTree/getAjaxResponsePM",  
	     data: "featureId=" + featureId2 + "&subIndicatorId=" + subIndicatorIdG4 + "&graphType=" + graphTypeG4 + "&from=" + fromG4 + "&to=" + toG4,  
	     success: function(data){ 
	    	 sampledata=data;
		     drawChartG4(sampledata);
	     },  
	     error: function(e){  
	       alert('Error: ' + e);  
	     }  
	   });  
	}
	
	// Initialize Default Data
	function initDefaultGraphData() {
		doAjaxPostG1();
		doAjaxPostG2();
		doAjaxPostG3();
		doAjaxPostG4();
	}
</script>


</head>
<body id="pgbody" onLoad="initDefaultGraphData()">
	<div align="center">
		<font size="4" face="Verdana"color"#800080">
			Visual Analytics of Feature Tree |<a href="/featureTree"> Home</a>
		</font>
	</div>
	<div id="container" style="height: 550px; width: 1300px">
		<div id="menu" style="background-color: #F3F3F3; height: 550px; width: 240px; float: left;">
			<!-- <ul id="dhtmlgoodies_tree" class="dhtmlgoodies_tree"> -->
			<div id="menu1_1" style="overflow: auto; height: 275px; width: 240px; float: left; text-align: left; border: gray 1px solid;">
				<!-- <a href="#" onclick="expandAll('dhtmlgoodies_tree');return false">Expand Tree</a>|
				<a href="#" onclick="collapseAll('dhtmlgoodies_tree');return false">Collapse Tree</a> -->
			 	<b><font size="2" face="vardana">Feature Tree1:</font></b><br><br>
				<c:set var="f_len" value="${features.size()}" /> 
				<a href="#" id="node1_0" onclick="getFeatureId1(0,'node1_0',${f_len})"><font size="2" face="times new roman">Product</font></a>
					<c:if test="${not empty features}">
						<c:forEach var="feature" items="${features}" varStatus="features">
							<!-- <li parentId="1" ftId="1"><a href="#" id="node1_${feature.id+1}"><font size="1" face="times new roman">${feature.name}</font></a></li> -->
	 						<li><a href="#" id="node1_${feature.id}" onclick="getFeatureId1(${feature.id},'node1_${feature.id}',${f_len})">
								<font size="1" face="times new roman">${feature.name}</font></a>
							</li>
						</c:forEach>
					</c:if>
				
				<!-- <iframe id="iFeature1" name="iFeature1" src="/featureTree/featureFrame" width="240px" height="275px"></iframe>  -->
			</div> 

			<div id="menu1_2" style="overflow: auto; height: 275px; width: 240px; float: left; text-align: left; border: gray 1px solid;">
				<b><font size="2" face="vardana">Feature Tree2:</font></b><br><br>
				<a href="#" id="node2_0" onclick="getFeatureId2(0,'node2_0',${f_len})"><font size="2" face="times new roman">Product</font></a>
					<c:if test="${not empty features}">
						<c:forEach var="feature" items="${features}" varStatus="features">
							<li><a href="#" id="node2_${feature.id}" onclick="getFeatureId2(${feature.id},'node2_${feature.id}',${f_len})">
								<font size="1" face="times new roman">${feature.name}</font></a>
							</li>
						</c:forEach>
					</c:if>
			</div>
			<!-- </ul>  -->
		</div>

		<div id="content" style="height: 550px; width: 1060px; float: left;">
			<div id="content1_1" style="height: 274px; width: 1060px; float: left;">
				<div id="content1_1_1" style="overflow: auto; height: 274px; width: 528px; float: left; text-align: left; border: red 1px solid;">
					<b><font size="2" face="vardana">Graph1</font></b>

					<c:set var="i" value="0" />
					<c:set var="j" value="0" />
					<c:set var="ind_id" value="" />
					<c:forEach var="indicator_stat" items="${indicator_stats}">
						<c:if test="${ind_id != indicator_stats[j].subIndIndicatorId}">
							<c:set var="i" value="0" />
						</c:if>

						<c:choose>
							<c:when test="${i == 0}">
								<c:set var="ind_id" value="${indicator_stats[j].subIndIndicatorId}" />
								<br>
								<b><font size="1" face="times new roman" color="green">${indicator_stat.indicatorName}:</font></b>
								<input id="sig1_${indicator_stat.subIndicatorId}" name="sig1" type="radio"
									<c:if test="${indicator_stat.subIndicatorId == 1}">checked="checked"</c:if>
									onclick="getSubIndicatorIDG1($('#sig1_${indicator_stat.subIndicatorId}').val())"
									value="${indicator_stat.subIndicatorId}">
								<font size="1" face="times new roman">${indicator_stat.subIndicatorName}</font>
							</c:when>
							<c:otherwise>
								<input id="sig1_${indicator_stat.subIndicatorId}" name="sig1" type="radio"
									onclick="getSubIndicatorIDG1($('#sig1_${indicator_stat.subIndicatorId}').val())"
									value="${indicator_stat.subIndicatorId}">
								<font size="1" face="times new roman">${indicator_stat.subIndicatorName}</font>
							</c:otherwise>
						</c:choose>


						<c:set var="i" value="${i+1}" />
						<c:set var="j" value="${j+1}" />
					</c:forEach>

					<br>
					<label for="graphTypeG1"><font size="1"	face="times new roman">Select Graph Type:</font></label> 
					<input id="gtg1_1" name="gtg1" type="radio" checked="checked" onclick="getGraphTypeG1(1)" value="1"> 
					<font size="1" face="times new roman">Line Chart</font> 
					<input id="gtg1_2" name="gtg1" type="radio" onclick="getGraphTypeG1(2)" value="2">
					<font size="1" face="times new roman">Pie Chart</font> <br>
					
					<label for="fromG1"><font size="1" face="times new roman">From</font></label>
					<input type="text" id="fromG1" name="fromG1" value="${fromDate}" /> 
					<label for="toG1"><font size="1" face="times new roman">To</font></label> 
					<input type="text" id="toG1" name="toG1" value="${toDate}" />

					<div id="chart_div_g1" style="width: 500px; height: 130px;"></div>
				</div>

				<div id="content1_1_2" style="overflow: auto; height: 274px; width: 528px; float: left; text-align: left; border: green 1px solid;">
					<b><font size="2" face="times new roman">Graph2</font></b>

					<c:set var="i" value="0" />
					<c:set var="j" value="0" />
					<c:set var="ind_id" value="" />
					<c:forEach var="indicator_stat" items="${indicator_stats}">
						<c:if test="${ind_id != indicator_stats[j].subIndIndicatorId}">
							<c:set var="i" value="0" />
						</c:if>

						<c:choose>
							<c:when test="${i == 0}">
								<c:set var="ind_id" value="${indicator_stats[j].subIndIndicatorId}" />
								<br>
								<b><font size="1" face="times new roman" color="green">${indicator_stat.indicatorName}</font></b>
								<input id="sig2_${indicator_stat.subIndicatorId}" name="sig2" type="radio"
									<c:if test="${indicator_stat.subIndicatorId == 1}">checked="checked"</c:if>
									onclick="getSubIndicatorIDG2($('#sig2_${indicator_stat.subIndicatorId}').val())"
									value="${indicator_stat.subIndicatorId}">
								<font size="1" face="times new roman">${indicator_stat.subIndicatorName}</font>
							</c:when>
							<c:otherwise>
								<input id="sig2_${indicator_stat.subIndicatorId}" name="sig2" type="radio"
									onclick="getSubIndicatorIDG2($('#sig2_${indicator_stat.subIndicatorId}').val())"
									value="${indicator_stat.subIndicatorId}">
								<font size="1" face="times new roman">${indicator_stat.subIndicatorName}</font>
							</c:otherwise>
						</c:choose>

						<c:set var="i" value="${i+1}" />
						<c:set var="j" value="${j+1}" />
					</c:forEach>
					<br>
					
					<label for="graphTypeG2"><font size="1" face="times new roman">Select Graph Type:</font></label> 
						<input id="gtg2_1" name="gtg2" type="radio" onclick="getGraphTypeG2(1)" value="1"> 
						<font size="1" face="times new roman">Line Chart</font> 
						<input id="gtg2_2" name="gtg2" type="radio" checked="checked" onclick="getGraphTypeG2(2)" value="2"> 
						<font size="1" face="times new roman">Pie Chart</font> <br>
						
					<label for="fromG2"><font size="1" face="times new roman">From</font></label>
					<input type="text" id="fromG2" name="fromG2" value="${fromDate}" /> 
					<label for="toG2"><font size="1" face="times new roman">To</font></label> 
					<input type="text" id="toG2" name="toG2" value="${toDate}" />

					<div id="chart_div_g2" style="width: 500px; height: 130px;"></div>
				</div>
			</div>

			<div id="content1_2" style="height: 274px; width: 1060px; float: left;">
				<div id="content1_2_1" style="overflow: auto; height: 274px; width: 528px; float: left; text-align: left; border: green 1px solid;">
					<b><font size="2" face="times new roman">Graph3</font></b>

					<c:set var="i" value="0" />
					<c:set var="j" value="0" />
					<c:set var="ind_id" value="" />
					<c:forEach var="indicator_stat" items="${indicator_stats}">
						<c:if test="${ind_id != indicator_stats[j].subIndIndicatorId}">
							<c:set var="i" value="0" />
						</c:if>

						<c:choose>
							<c:when test="${i == 0}">
								<c:set var="ind_id" value="${indicator_stats[j].subIndIndicatorId}" />
								<br>
								<b><font size="1" face="times new roman" color="green">${indicator_stat.indicatorName}</font></b>
								<input id="sig3_${indicator_stat.subIndicatorId}" name="sig3" type="radio"
									<c:if test="${indicator_stat.subIndicatorId == 1}">checked="checked"</c:if>
									onclick="getSubIndicatorIDG3($('#sig3_${indicator_stat.subIndicatorId}').val())"
									value="${indicator_stat.subIndicatorId}">
								<font size="1" face="times new roman">${indicator_stat.subIndicatorName}</font>
							</c:when>
							<c:otherwise>
								<input id="sig3_${indicator_stat.subIndicatorId}" name="sig3" type="radio"
									onclick="getSubIndicatorIDG3($('#sig3_${indicator_stat.subIndicatorId}').val())"
									value="${indicator_stat.subIndicatorId}">
								<font size="1" face="times new roman">${indicator_stat.subIndicatorName}</font>
							</c:otherwise>
						</c:choose>

						<c:set var="i" value="${i+1}" />
						<c:set var="j" value="${j+1}" />
					</c:forEach>

					<br>
					<label for="graphTypeG3"><font size="1" face="times new roman">Select Graph Type:</font></label> 
						<input id="gtg3_1" name="gtg3" type="radio" checked="checked" onclick="getGraphTypeG3(1)" value="1"> 
						<font size="1" face="times new roman">Line Chart</font> 
						<input id="gtg3_2" name="gtg3" type="radio" onclick="getGraphTypeG3(2)" value="2">
						<font size="1" face="times new roman">Pie Chart</font> <br>
					
					<label for="fromG3"><font size="1" face="times new roman">From</font></label>
					<input type="text" id="fromG3" name="fromG3" value="${fromDate}" /> 
					<label for="toG3"><font size="1" face="times new roman">To</font></label> 
					<input type="text" id="toG3" name="toG3" value="${toDate}" />

					<div id="chart_div_g3" style="width: 500px; height: 130px;"></div>
				</div>

				<div id="content1_2_2" style="overflow: auto; height: 274px; width: 528px; float: left; text-align: left; border: red 1px solid;">
					<b><font size="2" face="times new roman">Graph4</font></b>

					<c:set var="i" value="0" />
					<c:set var="j" value="0" />
					<c:set var="ind_id" value="" />
					<c:forEach var="indicator_stat" items="${indicator_stats}">
						<c:if test="${ind_id != indicator_stats[j].subIndIndicatorId}">
							<c:set var="i" value="0" />
						</c:if>

						<c:choose>
							<c:when test="${i == 0}">
								<c:set var="ind_id" value="${indicator_stats[j].subIndIndicatorId}" />
								<br>
								<b><font size="1" face="times new roman" color="green">${indicator_stat.indicatorName}</font></b>
								<input id="sig4_${indicator_stat.subIndicatorId}" name="sig4" type="radio"
									<c:if test="${indicator_stat.subIndicatorId == 1}">checked="checked"</c:if>
									onclick="getSubIndicatorIDG4($('#sig4_${indicator_stat.subIndicatorId}').val())"
									value="${indicator_stat.subIndicatorId}">
								<font size="1" face="times new roman">${indicator_stat.subIndicatorName}</font>
							</c:when>
							<c:otherwise>
								<input id="sig4_${indicator_stat.subIndicatorId}" name="sig4" type="radio"
									onclick="getSubIndicatorIDG4($('#sig4_${indicator_stat.subIndicatorId}').val())"
									value="${indicator_stat.subIndicatorId}">
								<font size="1" face="times new roman">${indicator_stat.subIndicatorName}</font>
							</c:otherwise>
						</c:choose>

						<c:set var="i" value="${i+1}" />
						<c:set var="j" value="${j+1}" />
					</c:forEach>

					<br>
					<label for="graphTypeG4"><font size="1"
						face="times new roman">Select Graph Type:</font></label> 
						<input id="gtg4_1" name="gtg4" type="radio" onclick="getGraphTypeG4(1)" value="1"> 
						<font size="1" face="times new roman">Line Chart</font> 
						<input id="gtg4_2" name="gtg4" type="radio" checked="checked" onclick="getGraphTypeG4(2)" value="2"> 
						<font size="1" face="times new roman">Pie Chart</font> <br>
					<label for="fromG4"><font size="1" face="times new roman">From</font></label>
					<input type="text" id="fromG4" name="fromG4" value="${fromDate}" /> 
					<label for="toG4"><font size="1" face="times new roman">To</font></label> 
					<input type="text" id="toG4" name="toG4" value="${toDate}" />

					<div id="chart_div_g4" style="width: 500px; height: 130px;"></div>
				</div>
			</div>
		</div>
	</div>
<!-- IP address -->
<%
	java.net.InetAddress thisIp = java.net.InetAddress.getLocalHost();
	String hostname = thisIp.getHostName();
	String ipaddress = thisIp.getHostAddress();
	out.print(ipaddress);
%>

<script type="text/javascript">
	// Track Web App
	<%-- $('#pgbody').click(function (event) 
	{
		var admin_status = 0;
		
		var latitute;
		var longitude;
		var visitorAddress;
		var geocoder = new google.maps.Geocoder();
		
		var clickedEvent = event.target.id;
		if((admin_status == 1) && (clickedEvent != '') && (clickedEvent != 'pgbody')){
			var popupWindow = window.open("http://localhost:8080/featureTreeAnalytics/mapGuielement?eventId="+clickedEvent, "popupWindow", "height=550,width=780");
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
		   	
		   	geocoder.geocode({'latLng': latlng}, 
		   	function(results, status)
		   	{
			  	if (status == google.maps.GeocoderStatus.OK) {
					// console.log(results)
				    if (results[1]) {
				    	//formatted address
				        // alert(results[0].formatted_address);
				        visitorAddress=results[0].formatted_address;
				        	
				        //find country name
				        for (var i=0; i<results[0].address_components.length; i++) 
				        {
				        	for (var b=0;b<results[0].address_components[i].types.length;b++) 
				        	{
				            	//there are different types that might hold a city admin_area_lvl_1 usually does in come cases looking for sublocality type will be more appropriate
				            	if (results[0].address_components[i].types[b] == "administrative_area_level_1") 
				            	{
				                	//this is the object you are looking for
				                    visitorAddress= results[0].address_components[i];
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
				// alert(ipaddress);
				// alert(sessionId);
				if ( (admin_status == 0) && (clickedEvent != '') && (clickedEvent != 'pgbody')){
					//	alert(clickedEvent);
					
					$.get('http://localhost:8080/featureTreeAnalytics/addGuielementvisit', {eventvalue:clickedEvent, sessionId:sessionId, visitorAddress:visitorAddress, ipaddress:ipaddress}, 
					function(data)
						{
							if(data == 1)
							{
								//alert('Data was saved in db!');
						    } else {
						    	//alert(address);
				          	}
				      	});
				}
			});
		   
		 };
		 
	});

	var countryname=geoip_country_name(); --%>
	//alert(countryname);
</script>

</body>
</html>