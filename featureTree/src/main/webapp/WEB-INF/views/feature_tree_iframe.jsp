<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feature Tree iFrame</title>

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
   //alert(menuItems);
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
   
	var featureId1 = 1; // 0
	function getFeatureId1(fId1, elementId, f_len){
		featureId1 = fId1;
		document.getElementById(elementId).style.color = newFontColor;
		defaultColor(f_len, elementId, "node1_");
		doAjaxPostG1();
		doAjaxPostG2();
	}

	var featureId2 = 1;	// 0
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
				//alert(selectedDate);
				var dateAsString = selectedDate; //the first parameter of this function
	   			dateAsObject = $(this).datepicker( 'getDate' ); //the getDate method
	   			// alert(dateAsObject);
	   			// console.log(drawChart());
	   			var to = $("#toG1").val();
	   			/* if(to){
	   				drawChartG1(sampledata);
	   			} */
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
	  			 	/* if(from){
	  					drawChartG1(sampledata);
	  				} */
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
				//alert(selectedDate);
				var dateAsString = selectedDate; //the first parameter of this function
	   			dateAsObject = $(this).datepicker( 'getDate' ); //the getDate method
	   			// alert(dateAsObject);
	   			// console.log(drawChart());
	   			var to = $("#toG2").val();
	   			/* if(to){
	   				//drawChartG2(sampledata);
	   			} */
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
	  			 	/* if(from){
	  					//drawChartG2(sampledata);
	  				} */
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
				//alert(selectedDate);
				var dateAsString = selectedDate; //the first parameter of this function
	   			dateAsObject = $(this).datepicker( 'getDate' ); //the getDate method
	   			// alert(dateAsObject);
	   			// console.log(drawChart());
	   			var to = $("#toG3").val();
	   			if(to){
	   				//drawChartG3(sampledata);
	   			}
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
	  			 	if(from){
	  					//drawChartG3(sampledata);
	  				}
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
				//alert(selectedDate);
				var dateAsString = selectedDate; //the first parameter of this function
	   			dateAsObject = $(this).datepicker( 'getDate' ); //the getDate method
	   			// alert(dateAsObject);
	   			// console.log(drawChart());
	   			var to = $("#toG4").val();
	   			if(to){
	   				//drawChartG4(sampledata);
	   			}
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
	  			 	if(from){
	  					//drawChartG4(sampledata);
	  				}
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
     /*  if(sampledata[0]==1){
   	   title="Total Visit Count By Date";
      } */
      
      title=sampledata[0];
      dataG1.addColumn('number', title); // Implicit data column.
            
      
      for (var i=1;i<sampledata.length;i++)
   	  {
   	   
        eval('var obj= '+sampledata[i]);
   	  	// alert(obj);
   	  
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
	     url: "/featureTree/getAjaxResponse",  
	     data: "featureId=" + featureId1 + "&subIndicatorId=" + subIndicatorIdG1 + "&graphType=" + graphTypeG1 + "&from=" + fromG1 + "&to=" + toG1,  
	     success: function(data){ 
	     	sampledata=data;
	     	//alert(data);
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
	   
	   //alert("tG2: "+toG2);
	   $.ajax({  
	     type: "GET",  
	     url: "/featureTree/getAjaxResponse",  
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
	   
	   //alert("tG3: "+toG3);
	   $.ajax({  
	     type: "GET",  
	     url: "/featureTree/getAjaxResponse",  
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
	   
	   //alert("tG4: "+toG4);
	   $.ajax({  
	     type: "GET",  
	     url: "/featureTree/getAjaxResponse",  
	     data: "featureId=" + featureId2 + "&subIndicatorId=" + subIndicatorIdG4 + "&graphType=" + graphTypeG4 + "&from=" + fromG4 + "&to=" + toG4,  
	     success: function(data){ 
	    	 sampledata=data;
	    	 //alert(sampledata);
		     drawChartG4(sampledata);
	     },  
	     error: function(e){  
	       alert('Error: ' + e);  
	     }  
	   });  
	}
	
	function initDefaultGraphData() {
		doAjaxPostG1();
		doAjaxPostG2();
		doAjaxPostG3();
		doAjaxPostG4();
	}
</script>

</head>
<body onLoad="initDefaultGraphData()">
	<b><label for="featureId1">Feature Tree:</label></b>
	<ul>
		<li><c:set var="f_len" value="${features.size()}" /> 
			<a href="#" id="node1_0" onclick="getFeatureId1(0,'node1_0',${f_len})"><font size="2" face="times new roman">Product</font></a>
			<ul>
				<c:if test="${not empty features}">
					<c:forEach var="feature" items="${features}" varStatus="features">
						<li><a href="#" id="node1_${feature.id}" onclick="getFeatureId1(${feature.id},'node1_${feature.id}',${f_len});">
							<font size="1" face="times new roman">${feature.name}</font></a>
						</li>
					</c:forEach>
				</c:if>
			</ul>
		</li>
	</ul>
</body>
</html>