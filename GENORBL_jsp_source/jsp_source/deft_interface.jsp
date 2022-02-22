<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<style>
td.c{font size:15;color:white;left:2 px;top:0;font-weight:bold}
td.d{font size:14;color:#660066;font-weight:bold;face=arial}
td.e(display:none)
</style>
</HEAD>
<BODY LANGUAGE=javascript>

<%
String deptdesc = request.getParameter("dept_desc");
%>

<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
<!--
     function cc(v1){

      window.returnValue=v1;
      window.close();
     }

 function doCancel() {

    window.returnValue = "";

    window.close();

}

  //function window_onunload() {

      //if (window.returnValue==null){

   // window.returnValue = "xxx";
     // alert("jjj")
   // }
//}

//-->
</SCRIPT>


   <table  BGCOLOR=#CCCCCC border=1 bordercolor=maroon width="80%" bgcolor=lightcyan size="2" color="maroon" face="Bookman Old Style" align=center>
<tr  bgcolor= #9900CC><b>
           <td class=c align="center"  style="font-family: Arial, Helvetica, sans-serif"><b>PLEASE SELECT</td></tr>

<%
 if(deptdesc.equals("MMD") || deptdesc.equals("FMD"))
  {
%>
 <tr><td class=d align="center"  style="font-family: Arial, Helvetica, sans-serif"><a onMouseOver="window.event.srcElement.style.cursor='hand'" Language ="javascript" onclick="return cc('MMD')" ><font size=2 face=Arial>MMD</a ></td></tr>
 <tr><td class=d align="center"  style="font-family: Arial, Helvetica, sans-serif"><a onMouseOver="window.event.srcElement.style.cursor='hand'" Language ="javascript" onclick="return cc('FMD')" ><font size=2 face=Arial>FMD</a ></td></tr>
 <tr><td class=d align="center"  style="font-family: Arial, Helvetica, sans-serif"><a onMouseOver="window.event.srcElement.style.cursor='hand'" Language ="javascript" onclick="return cc('MDS')" ><font size=2 face=Arial>MDS</a ></td></tr>
<%
  }
 if(deptdesc.equals("FAO"))
  {
%>
 <tr><td class=d align="center"  style="font-family: Arial, Helvetica, sans-serif"><a onMouseOver="window.event.srcElement.style.cursor='hand'" Language ="javascript" onclick="return cc('FAO')" ><font size=2 face=Arial>FAO</a ></td></tr>
 <tr><td class=d align="center"  style="font-family: Arial, Helvetica, sans-serif"><a onMouseOver="window.event.srcElement.style.cursor='hand'" Language ="javascript" onclick="return cc('OWN')" ><font size=2 face=Arial>OWN</a ></td></tr>
<%
  }
 if(deptdesc.equals("E_I"))
  {
%>
 <tr><td class=d align="center"  style="font-family: Arial, Helvetica, sans-serif"><a onMouseOver="window.event.srcElement.style.cursor='hand'" Language ="javascript" onclick="return cc('1')" ><font size=2 face=Arial>MAIN PLANT MAINTENANCE</a ></td></tr>
 <tr><td class=d align="center"  style="font-family: Arial, Helvetica, sans-serif"><a onMouseOver="window.event.srcElement.style.cursor='hand'" Language ="javascript" onclick="return cc('2')" ><font size=2 face=Arial>FUEL & ASH MAINTENANCE</a ></td></tr>
<%
  }
 if(deptdesc.equals("CTM"))
  {
%>
 <tr><td class=d align="center"  style="font-family: Arial, Helvetica, sans-serif"><a onMouseOver="window.event.srcElement.style.cursor='hand'" Language ="javascript" onclick="return cc('016')" ><font size=2 face=Arial>BUDGE BUDGE GENERATING STATION</a ></td></tr>
 <tr><td class=d align="center"  style="font-family: Arial, Helvetica, sans-serif"><a onMouseOver="window.event.srcElement.style.cursor='hand'" Language ="javascript" onclick="return cc('014')" ><font size=2 face=Arial>TITAGARH GENERATING STATION</a ></td></tr>
 <tr><td class=d align="center"  style="font-family: Arial, Helvetica, sans-serif"><a onMouseOver="window.event.srcElement.style.cursor='hand'" Language ="javascript" onclick="return cc('002')" ><font size=2 face=Arial>SOUTHERN GENERATING STATION</a ></td></tr>
<%
  }
%>
</table>

</table>

</BODY>
</HTML>

