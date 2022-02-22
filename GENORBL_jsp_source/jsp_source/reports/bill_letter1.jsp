<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<script type="text/javascript" src="RepFunc.js"></script>
<script src="js/sel_date.js"></script>

<title>COVERING LETTER SUMMARY</title>

</script>


<style>
table.rcrds
{
border-collapse:collapse;
}
table.rcrds,th, td.rcrdsEle
{
border: 1px solid black;
}


.pgbrk{
page-break-after:always;
}
</style>

</head>

<%
String genstn  = request.getParameter("gs");
String st_dt  = request.getParameter("st_dt");
String end_dt = request.getParameter("end_dt");

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();

%>

<body background="GS1.jpg">

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

<div id="footer">
<div id="container">
<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:25px; top:15px" width="170" height="70">


		  <label style="POSITION: absolute; LEFT: 660px; top:575px"  class="style5" ><b>2012 © Developed by I.T. Department</b></label>

</div>
</div>


<center>
<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3"><font face="Albertus Extra Bold" size="5" color="#400040">
<b>COVERING LETTER SUMMARY</b></font>
<br><br>

<table>
<tr>
<td><font size="4" color="#400040"><b>FROM</b></font></td>
<td><input type="text" name="st_dt"  id= "st_dt" size="11" value="" onClick="sel_date_cls('st_dt','js/')"></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>TO</b></font></td>
<td><input type="text" name="end_dt" id= "end_dt" size="11" value="" onClick="sel_date_cls('end_dt','js/')"></td>
</tr>
</table>

<TABLE>
<TR>
<form method="POST" name="sampleform" action="bill_letter1.jsp" onSubmit="DefaultValue();" valign="middle" align="center" >

<input type ="hidden" id="h1" name="hst_dt">
<input type ="hidden" id="h2" name="hend_dt">
<input type ="hidden" id="h3" name="gs">

<TD align=center><input type = "submit" value="SUBMIT" ></TD>
</form>
<TD>&nbsp;&nbsp;</TD>
<TD align=right><input type = "button" name="printMe" onClick="printSpecial();" value="PRINT"></TD>
<TD>&nbsp;&nbsp;</TD>
<TD align=left> <input type = "button" value="BACK" onclick="window.open('close.html','_self');"></TD>
<TD>&nbsp;&nbsp;</TD>
</TR>
</TABLE>

<%

        String st_dt1  = request.getParameter("hst_dt");
        String end_dt1 = request.getParameter("hend_dt");

try{

if(st_dt1!= null && end_dt1!= null){

%>
<br>
<br>
<div id="printReady" style="overflow:scroll; height:365px; background:#DBF2DC;">

<%
SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
String DisplayDate= formatdate.format(new java.util.Date());

%>
<table width="97%" >
<tr > 
<td align=left ><font color="#400040" size="4"> &nbsp Date : <%= DisplayDate %> </font> </td>
<td align=center > <font color="#400040" size="4">  <b>COVERING LETTER SUMMARY BETWEEN <%=st_dt1%> AND <%=end_dt1%></b> </font> </td>
<td align=right > <font color="#400040" size="4">  Page : 1 </font> </td>
</tr>
</table>
     <table  border="1" width="97%" class= "rcrds" >
     <tr bgcolor="#DBF2DC">

          <td colspan="8" align="center" class= "rcrdsEle" >
            <font color="#400040" size="3">
	    <b>GENERATING STATION : <%=genstn%>></b>
            </font>
          </td>
     </tr>


     <tr bgcolor="#DBF2DC">
          <td align="center" width="25px" class= "rcrdsEle" ><font color="#400040" ><b>Sl</b></font></td>
          <td align="center" width="90px" class= "rcrdsEle" ><font color="#400040" ><b>Ref Id</b></font></td>
          <td align="center" width="250px" class= "rcrdsEle" ><font color="#400040"><b>Letter Ref</b></font></td>
          <td align="center" width="97px" class= "rcrdsEle" ><font color="#400040" ><b>Letter Date</b></font></td>
          <td align="center" width="97px" class= "rcrdsEle" ><font color="#400040" ><b>Finance Recd Date</b></font></td>
          <td align="center" width="45px" class= "rcrdsEle" ><font color="#400040"><b>No of Bill</b></font></td>
          <td align="center" width="80px" class= "rcrdsEle" ><font color="#400040"><b>Amount (Rs.)</b></font></td>
     </tr>


<%

       
      
        String qry_str = new String();
        //String qry_str1 = new String();

        int    flag    = 0;
        int    srl_num = 0;
        int    no_row_pg = 34 ;

	String ref_id  = new String();
        String let_ref = new String();
        String let_dt  = new String();
        String fin_dt  = new String();
        String tot_bil = new String();
        String bil_amt = new String();


        PreparedStatement ps1 = null ;
        ResultSet rs1         = null ;

        PreparedStatement ps2 = null ;
        ResultSet rs2         = null ;


	qry_str = "SELECT 'REF_123','LETT_123',?,?,TO_Char('1234'),TO_CHAR('1234.50') FROM DUAL";

	ps1 = mk.con.prepareStatement(qry_str);
        
        ps1.setString(1,st_dt1);
        ps1.setString(2,end_dt1);

        rs1 = ps1.executeQuery() ;

        if(srl_num>0 && srl_num % no_row_pg == 0){

%>

</table>

<p class="pgbrk">&nbsp;</p>

<table width="97%" >
<tr >
<td align=left ><font color="#400040" size="4"> &nbsp Date : <%= DisplayDate %> </font> </td>
<td align=center > <font color="#400040" size="4">  <b>COVERING LETTER SUMMARY BETWEEN <%=st_dt1%> AND <%=end_dt1%></b> </font> </td>
<td align=right > <font color="#400040" size="4">  Page : 1 </font> </td>
</tr>
</table>
     <table  border="1" width="97%" class= "rcrds" >
     <tr bgcolor="#DBF2DC">

          <td colspan="8" align="center" class= "rcrdsEle" >
            <font color="#400040" size="3">
            <b>GENERATING STATION : <%=genstn%>></b>
            </font>
          </td>
     </tr>

     <tr bgcolor="#DBF2DC">
          <td align="center" width="25px" class= "rcrdsEle" ><font color="#400040" ><b>Sl</b></font></td>
          <td align="center" width="90px" class= "rcrdsEle" ><font color="#400040" ><b>Ref Id</b></font></td>
          <td align="center" width="250px" class= "rcrdsEle" ><font color="#400040"><b>Letter Ref</b></font></td>
          <td align="center" width="97px" class= "rcrdsEle" ><font color="#400040" ><b>Letter Date</b></font></td>
          <td align="center" width="97px" class= "rcrdsEle" ><font color="#400040" ><b>Finance Recd Date</b></font></td>
          <td align="center" width="45px" class= "rcrdsEle" ><font color="#400040"><b>No of Bill</b></font></td>
          <td align="center" width="80px" class= "rcrdsEle" ><font color="#400040"><b>Amount (Rs.)</b></font></td>
     </tr>



            <%

            srl_num++  ;
	    ref_id  = rs1.getString(1);
            let_ref = rs1.getString(2);
            let_dt  = rs1.getString(3);
            fin_dt  = rs1.getString(4);
            tot_bil = rs1.getString(5);
            bil_amt = rs1.getString(6);
%>
    <tr bgcolor="#DBF2DC">
          <td align="center" width="25px" class= "rcrdsEle" ><font color="#400040" ><b>Sl</b></font></td>
          <td align="center" width="90px" class= "rcrdsEle" ><font color="#400040" ><b>Ref Id</b></font></td>
          <td align="center" width="250px" class= "rcrdsEle" ><font color="#400040"><b>Letter Ref</b></font></td>
          <td align="center" width="97px" class= "rcrdsEle" ><font color="#400040" ><b>Letter Date</b></font></td>
          <td align="center" width="97px" class= "rcrdsEle" ><font color="#400040" ><b>Finance Recd Date</b></font></td>
          <td align="center" width="45px" class= "rcrdsEle" ><font color="#400040"><b>No of Bill</b></font></td>
          <td align="center" width="80px" class= "rcrdsEle" ><font color="#400040"><b>Amount (Rs.)</b></font></td>
     </tr>

   </table>

   </div>

<%

}
   }
    }catch(Exception e){
          e.printStackTrace();
    }finally{
          mk.con.close();
    }
%>

<center>
</body>
</html>
