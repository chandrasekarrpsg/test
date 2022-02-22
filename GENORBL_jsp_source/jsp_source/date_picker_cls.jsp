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
String dt=request.getParameter("dt");
Date d = new Date();
DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");  

if (dt.equals("") ){
dt=dateFormat.format(d);
}
dateFormat = new SimpleDateFormat("MM");
int mnth= Integer.parseInt(dateFormat.format(d))-1;
dateFormat = new SimpleDateFormat("yyyy");
int yr= Integer.parseInt(dateFormat.format(d)) ;
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

function refresh() {

	var mnth=parseInt(this.mnth.value,10);
	var yr=parseInt(this.yr.value,10);
	var d=new Date(yr,mnth,1);
	var de=new Date((mnth==11?yr+1:yr),(mnth==11?0:mnth+1),1);
	var dow=d.getDay();
	var days=(de-d)/(60*60*24*1000);

	for(i=1; i<=42;i++) {
		eval("d"+i+".className='';");	
		eval("d"+i+".innerText=' ';");	
	}
	for(i=1; i<=days;i++) {
		eval("d"+(dow+i)+".className='Item';");		
		eval("d"+(dow+i)+".innerText="+i+";");
	}

}

function on_click() {
	var months=new Array("JAN","FEB","MAR","APR","MAY","JUN","JUL",
						 "AUG","SEP","OCT","NOV","DEC");
	if(window.event.srcElement.innerText==" ")
		return;
	var d=window.event.srcElement.innerText;
	window.returnValue=(d+"-"+months[this.mnth.value]+"-"+this.yr.value);
	window.close();
}


function cls() {

	window.returnValue="";
	window.close();
}
//-->
</script>


<body>
<div align="center"><center>

<table border="1" cellpadding="0" bordercolor="#808000" width="294">
<tr>
    <td align="middle" bgcolor="#000080" width="80" height="25" colspan="2"><p align="center"><input
    type="button" value="Clear" name="B1" onclick="cls()"> </td>
      <td align="middle" bgcolor="#000080" width="204" height="25" colspan="5"><strong><div
    align="center"><center><table border="0" cellPadding="0" cellSpacing="0">
      <tr>
        <td><select name="mnth" size="1" style="FONT-FAMILY: Verdana; FONT-SIZE: 12px"
        onchange="refresh()">
          <option selected value="0">January</option>
          <option value="1">February</option>
          <option value="2">March</option>
          <option value="3">April</option>
          <option value="4">May</option>
          <option value="5">June</option>
          <option value="6">July</option>
          <option value="7">August</option>
          <option value="8">September</option>
          <option value="9">October</option>
          <option value="10">November</option>
          <option value="11">December</option>
        </select></td>
        <td></strong><select name="yr" size="1" style="FONT-FAMILY: Verdana; FONT-SIZE: 12px"
        onchange="refresh()">
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
        </select></td>
      </tr>
    </table>
    </center></div></td>
  </tr>
  <tr>
    <td align="center" bgcolor="#000080" width="40" height="25"><strong><font color="#ffffff">Sun</font></strong></td>
    <td align="center" bgcolor="#000080" width="40" height="25"><strong><font color="#ffffff">Mon</font></strong></td>
    <td align="center" bgcolor="#000080" width="40" height="25"><strong><font color="#ffffff">Tue</font></strong></td>
    <td align="center" bgcolor="#000080" width="40" height="25"><strong><font color="#ffffff">Wed</font></strong></td>
    <td align="center" bgcolor="#000080" width="40" height="25"><strong><font color="#ffffff">Thu</font></strong></td>
    <td align="center" bgcolor="#000080" width="40" height="25"><strong><font color="#ffffff">Fri</font></strong></td>
    <td align="center" bgcolor="#000080" width="40" height="25"><strong><font color="#ffffff">Sat</font></strong></td>
  </tr>
  <tr>
    <td id="d1" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">1</td>
    <td id="d2" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">2</td>
    <td id="d3" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">3</td>
    <td id="d4" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">4</td>
    <td id="d5" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">5</td>
    <td id="d6" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">6</td>
    <td id="d7" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">7</td>
  </tr>
  <tr>
    <td id="d8" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">8</td>
    <td id="d9" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">9</td>
    <td id="d10" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">10</td>
    <td id="d11" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">11</td>
    <td id="d12" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">12</td>
    <td id="d13" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">13</td>
    <td id="d14" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">14</td>
  </tr>
  <tr>
    <td id="d15" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">15</td>
    <td id="d16" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">16</td>
    <td id="d17" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">17</td>
    <td id="d18" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">18</td>
    <td id="d19" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">19</td>
    <td id="d20" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">20</td>
    <td id="d21" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">21</td>
  </tr>
  <tr>
    <td id="d22" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">22</td>
    <td id="d23" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">23</td>
    <td id="d24" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">24</td>
    <td id="d25" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">25</td>
    <td id="d26" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">26</td>
    <td id="d27" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">27</td>
    <td id="d28" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">28</td>
  </tr>
  <tr>
    <td id="d29" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">29</td>
    <td id="d30" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">30</td>
    <td id="d31" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">31</td>
    <td id="d32" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">32</td>
    <td id="d33" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">33</td>
    <td id="d34" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">34</td>
    <td id="d35" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">35</td>
  </tr>
  <tr>
    <td id="d36" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">36</td>
    <td id="d37" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">37</td>
    <td id="d38" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">38</td>
    <td id="d39" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">39</td>
    <td id="d40" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">40</td>
    <td id="d41" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">41</td>
    <td id="d42" onmouseover="rollon()" onmouseout="rolloff()" onclick="on_click()"
    align="center" width="40" height="25" bgcolor="#c0c0c0"
    style="FONT-FAMILY: Verdana; FONT-SIZE: 12px">42</td>
  </tr>
</table>
</center></div>
<script LANGUAGE="javascript">

mnth.value="<%=mnth%>";
yr.value="<%=yr%>";
refresh();

</script>

</body>
</html>

