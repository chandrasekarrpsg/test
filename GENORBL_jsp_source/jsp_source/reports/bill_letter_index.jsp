<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">

</head>


<body background="GS1.jpg">

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

<div id="footer">
<div id="container">
<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:25px; top:15px" width="170" height="70">


<label style="POSITION: absolute; LEFT: 660px; top:575px"  class="style5" ><b>2012 \251 Developed by I.T. Department</b></label>

</div>
</div>

<center>
<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3">
<font face="Albertus Extra Bold" size="5" color="#400040">
<b>COVERING LETTER SUMMARY</b>
</font>
<br><br>

<table>
<tr>
<td><font size="5" color="#400040"><b>GENERATING STATION</b></font></td>
<td>
   <select name="s1" id="s1">
         <option value="BBGS">BBGS</option>
         <option value="TGS">TGS</option>
         <option value="SGS">SGS</option>
         <option value="NCGS">NCGS</option>
         <option value="CTM">CTM</option>
         <option value="ED(G)">ED(G)</option>
   </select>
</td>

</tr>

</table>

<TABLE>
<TR>
<form method="POST" name="sampleform" action="bill_letter_index.jsp"
                    onSubmit="document.getElementById('h1').value=document.getElementById('s1').value;"
                    valign="middle" align="center" >

<input type ="hidden" id="h1" name="hgen">

<TD align=center><input type = "submit" value="SUBMIT" ></TD>

</form>

<TD>&nbsp;&nbsp;</TD>
<TD align=left> <input type = "button" value="BACK" onclick="window.open('close.html','_self');"></TD>
<TD>&nbsp;&nbsp;</TD>
</TR>
</TABLE>

<%
     String genstn  = request.getParameter("hgen");

     if(genstn != null){
%>
<div id="D1">

<label style="POSITION: absolute; LEFT: 400px; top:200px">
       <font size="5" color="#400040">
       <b>.<a href="bill_letter1.jsp?gs=<%=genstn%>">COVERING LETTER - I</a></b>
       </font>
</label>

<label style="POSITION: absolute; LEFT: 400px; top:300px">
       <font size="5" color="#400040">
       <b>.<a href="bill_letter2.jsp?gs=<%=genstn%>"> COVERING LETTER - II</a></b>
       </font>
</label>



</div>

<%
       }
%>

</center>
</body>
</html>
