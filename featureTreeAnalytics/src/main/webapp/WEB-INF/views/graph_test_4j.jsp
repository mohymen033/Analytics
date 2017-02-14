<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="http://multidatespickr.sourceforge.net/js/jquery-1.7.2.js"></script>
<script src="http://multidatespickr.sourceforge.net/js/jquery.ui.core.js"></script>
<script src="http://multidatespickr.sourceforge.net/js/jquery.ui.datepicker.js"></script>
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/themes/base/jquery-ui.css" type="text/css" media="all">


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Analytics Chart</title>


<!-- <script>
	$(function() {
		$( "#from" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 3,
			onSelect: function( selectedDate ) {
				$( "#to" ).datepicker( "option", "minDate", selectedDate );
				//alert(selectedDate);
				var dateAsString = selectedDate; //the first parameter of this function
    			 var dateAsObject = $(this).datepicker( 'getDate' ); //the getDate method
    			 alert(dateAsObject);
			}
		
		});
		$( "#to" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 3,
			onSelect: function( selectedDate ) {
				$( "#from" ).datepicker( "option", "maxDate", selectedDate );
				
			}
		});
	});
	</script>
 -->


<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
    var sampledata =${arrayofelementforvisualgraph} ;
    $(function() {
    	$( "#from" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 3,
			onSelect: function( selectedDate ) {
				$( "#to" ).datepicker( "option", "minDate", selectedDate );
				//alert(selectedDate);
				var dateAsString = selectedDate; //the first parameter of this function
    			dateAsObject = $(this).datepicker( 'getDate' ); //the getDate method
    			// alert(dateAsObject);
    			// console.log(drawChart());
    			var to = $("#to").val();
    			if(to){
    				drawChart(sampledata);
    			}
			}
		});
		
    	$( "#to" ).datepicker({
			defaultDate: "+1w",
			changeMonth: true,
			numberOfMonths: 3,
			onSelect: function( selectedDate ) {
				$( "#from" ).datepicker( "option", "maxDate", selectedDate );
				var from = $("#from").val();
   			 	if(from){
   					drawChart(sampledata);
   				}
			}
		});
	});
    
    google.load("visualization", "1", {packages:["linechart"]});
    //google.setOnLoadCallback(drawChart);
     
    function drawChart(sampledata) 
    {
    	var data = new google.visualization.DataTable();
       // data.addColumn('string', 'year'); // Implicit domain column.
       data.addColumn('date', 'Dateofvisit');

       data.addColumn('number', 'Total Visittime'); // Implicit data column.
       var x=2012;
        
       data.addRows([
			[new Date (x,9,03),19 ],
			[new Date (2011,9,03),90 ],
			[new Date (2011,9,03),90 ],
			[new Date (2011,9,03),90 ],
			[new Date (2011,9,03),90 ],
			[new Date (2011,9,03),90 ],
			[new Date (2011,9,03),90 ],
			[new Date (2011,9,03),90 ],
			[new Date (2011,9,03),100 ]]);
          
       /* var sampledata =${arrayofelementforvisualgraph} ;
       console.log(sampledata[0][0]);
       console.log( new Date (2012,8,20)); */

       	data.addRows(sampledata);
       	//console.log(sampledata);
        
      	var options = {
          title: 'Total Visit Time In Minute',
          legend:'Right',
          pointSize:'6',
          vAxis: {title: "Visitor"},
          hAxis: {title: "Time"}
          
              
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data,options);
      }
    </script>
    
</head>
<body>

<label for="from">From</label>
<input type="text" id="from" name="from"/>
<label for="to">to</label>
<input type="text" id="to" name="to"/>

<div id="chart_div" style="width: 800px; height: 600px;"></div>

<%-- <img src="${url}" alt="Chart" /> --%>

<br><a href="/featureTreeAnalytics"> Home </a><br>
<a href="/featureTreeAnalytics/statisticsIndicator"> Indicator Statistics </a><br>
</body>
</html>
