
<html>

<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<head>

<title></title>
<style>
 .Item {
   cursor: hand;
   font-family: verdana; 
   font-size: 12;
   font-style: normal;
   background-color: silver;
   color: navy;
   text-decoration: none
 }
 .Highlight {
   cursor: hand; 
   font-family: verdana;
   font-size: 12;
   font-style: normal;
   background-color: aqua;
   color: darkblue;
   text-decoration: none
 }
</style>
</head>
<%
Date d = new Date();//intialize your date to any date 
   DateFormat dateFormat = new SimpleDateFormat("yyyy");  


String yr =  dateFormat.format(d);
%>
<script LANGUAGE="javascript">
<!--
function rollon() {
  if (window.event.srcElement.className == "Item") 
     window.event.srcElement.className = "Highlight";
}

function rolloff() {
  if (window.event.srcElement.className == "Highlight") 
     window.event.srcElement.className = "Item";
}



function on_click() {
	var months=new Array("JAN","FEB","MAR","APR","MAY","JUN","JUL",
						 "AUG","SEP","OCT","NOV","DEC");
	if(window.event.srcElement.innerText==" ")
		return;
	var d=window.event.srcElement.innerText;
	window.returnValue=(d+"-"+this.yr.value);
	window.close();
}

//-->
</script>


<body>
<div align="center"><center>

<table border="1" cellpadding="0" bordercolor="#808000" width="147" height="163">
  <tr colspan="3" align="center">
    <td colspan="3" align="center" width="143" height="24">

  <select name="yr" size="1" style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">
      <option value="2000" selected>2000 </option>
      <option value="2001">2001 </option>
      <option value="2002">2002 </option>
      <option value="2003">2003 </option>
      <option value="2004">2004 </option>
      <option value="2005">2005 </option>
      <option value="2006">2006 </option>
      <option value="2007">2007 </option>
      <option value="2008">2008 </option>
      <option value="2009">2009 </option>
      <option value="2010">2010 </option>
      <option value="2011">2011 </option>
      <option value="2012">2012 </option>
      <option value="2013">2013 </option>
      <option value="2014">2014 </option>
      <option value="2015">2015 </option>
      <option value="2016">2016 </option>
      <option value="2017">2017 </option>
      <option value="2018">2018 </option>
      <option value="2019">2019 </option>
      <option value="2020">2020 </option>
      <option value="2021">2021 </option>
      <option value="2022">2022 </option>
      <option value="2023">2023 </option>
      <option value="2024">2024 </option>
      <option value="2025">2025 </option>

    </select>
   </td>
  </tr>
  <tr>
    <td id="d1" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">Jan</td>
    <td id="d2" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">Feb</td>
    <td id="d3" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">Mar</td>
  </tr>
  <tr>
    <td id="d8" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">Apr</td>
    <td id="d9" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">May</td>
    <td id="d10" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">Jun</td>
  </tr>
  <tr>
    <td id="d15" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">Jul</td>
    <td id="d16" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">Aug</td>
    <td id="d17" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">Sep</td>
  </tr>
  <tr>
    <td id="d22" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">Oct</td>
    <td id="d23" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">Nov</td>
    <td id="d24" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">Dec</td>
  </tr>
</table>
</center></div><script LANGUAGE="javascript">

yr.value="<%=yr%>";


</script>

</body>
</html>
