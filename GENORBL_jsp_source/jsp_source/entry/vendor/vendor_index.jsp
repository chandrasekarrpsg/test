
<html>



<head>

<title></title>
<style>

td.a{font-family: Verdana; font-size: 8 pt; color: maroon; font-weight: normal;}

</style>
</head>

<body bgColor="#ffcec6">

  <div align="center"></div></big><div align="center"><center><p><font face="Bookman Old Style" size="5"><strong><u><big>BBGS Vendors</big></u></strong></font></p>
  </center></div><div align="center"><center><p>&nbsp;</p>
  </center></div><div align="center"><center><p><font face="Brush Script MT" color="#ff0000" size="7">&nbsp;&nbsp;&nbsp; What would you like to do ?</font></p>
  </center></div><div align="center"><center><p>&nbsp;</p>
  </center></div><ul>
    <li><div align="center"><center><p><font face="Bookman Old Style" color="#800040"><big><big><strong><a href="vendor_search.jsp">Search for 
  Vendors</a>
       </strong></big></big></font></p>
      </center></div>
      <%
	String ssnDept1 = session.getAttribute("dept")== null ?"": session.getAttribute("dept").toString();
	  if (ssnDept1.equals("PLG")){
	  
	  %>
    <!--li><div align="center"><center><p><a href="vendor_entry.jsp?ap=add"><font color="#800040"><font face="Bookman Old Style"><big><big><strong>Add
      a new Vendor</strong></big></big></font><br>
      </font></a></p>
      </center></div></li -->
      <%}%>
  </ul>
<center>&nbsp;</center>


<p align="center">&nbsp;</p>
</body>
</html>

