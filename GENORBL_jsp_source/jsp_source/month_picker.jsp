
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
   DateFormat dateFormat = new SimpleDateFormat("yy");  


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
    <td colspan="3" align="center" width="143" height="24"><select name="yr" size="1"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">
      <option value="00" selected>2000 </option>
      <option value="01">2001 </option>
      <option value="02">2002 </option>
      <option value="03">2003 </option>
      <option value="04">2004 </option>
      <option value="05">2005 </option>
      <option value="06">2006 </option>
      <option value="07">2007 </option>
      <option value="08">2008 </option>
      <option value="09">2009 </option>
      <option value="10">2010 </option>
<option value="11">2011 </option>
      <option value="12">2012 </option>
      <option value="13">2013 </option>
      <option value="14">2014 </option>
      <option value="15">2015 </option>
      <option value="16">2016 </option>
      <option value="17">2017 </option>
      <option value="18">2018 </option>
      <option value="19">2019 </option>
      <option value="20">2020 </option>
      <option value="21">2021 </option>
      <option value="22">2022 </option>
      <option value="23">2023 </option>
      <option value="24">2024 </option>
      <option value="25">2025 </option>
    </select></td>
  </tr>
  <tr>
    <td id="d1" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">JAN</td>
    <td id="d2" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">FEB</td>
    <td id="d3" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">MAR</td>
  </tr>
  <tr>
    <td id="d8" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">APR</td>
    <td id="d9" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">MAY</td>
    <td id="d10" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">JUN</td>
  </tr>
  <tr>
    <td id="d15" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">JUL</td>
    <td id="d16" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">AUG</td>
    <td id="d17" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">SEP</td>
  </tr>
  <tr>
    <td id="d22" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">OCT</td>
    <td id="d23" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">NOV</td>
    <td id="d24" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" bgcolor="#C0C0C0" style="font-family: Verdana; font-size: 12px"
    class="Item" width="37" height="29">DEC</td>
  </tr>
</table>
</center></div><script LANGUAGE="javascript">

yr.value="<%=yr%>";


</script>

</body>
</html>
