<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<script type="text/javascript" src="RepFunc.js"></script>

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

String gen_stn  = request.getParameter("gs");
String fin_yr   = request.getParameter("f_yr");
String year1    = request.getParameter("yr");

System.out.println("MISC_BILL_ANNEXURE gen_stn :"+gen_stn);
System.out.println("MISC_BILL_ANNEXURE fin_yr :"+fin_yr);
System.out.println("MISC_BILL_ANNEXURE year1 :"+year1);

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();

%>

<body background="GS1.jpg">

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

<div id="footer">
<div id="container">
<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:25px; top:15px" width="170" height="70">


<label style="POSITION: absolute; LEFT: 660px; top:650px"  class="style5" ><b>2012 &copy Developed by I.T. Department</b></label>

</div>
</div>


<%
    String GStn = new String();
 
    try{

    PreparedStatement ps = null ;
    ResultSet rs         = null ;
   

    ps = mk.con.prepareStatement("select trim(decode(?,'016','BUDGE BUDGE GENERATION STATION',  " +
                                 "                     '014','TITAGARH GENERATING STATION',      " +
                                 "                     '002','SOUTHERN GENERATING STATION',      " +
                                 "                     '013','NEW COSSIPORE GENERATING STATION'," +
                                 "                     '019','CENTRAL TURBINE MAINTENANCE',      " +
                                 "                     '042','ED(GENERATION)')) GS from DUAL   ");

    ps.setString(1,gen_stn);
    rs = ps.executeQuery() ;

    while(rs.next()) {
          GStn = rs.getString(1) ;
    }

    System.out.println("MISC_BILL_ANNEXURE GS: " + GStn);

    rs.close() ;
    ps.close() ;

%>

<center>

<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3">
    <font face="Albertus Extra Bold" size="5" color="#400040">
    <b> <%=GStn%></b>
    </font>
<br>

    <font face="TIMES NEW ROMAN" size="3" color="#400040">
    <b>MISCELLANEOUS ANNEXURE <b>
    </font>

<br>

    <font face="TIMES NEW ROMAN" size="3" color="#400040">
    <b>FINANCIAL YEAR <%=year1%> </b>
    </font>
<%

    }catch(Exception e){
           e.printStackTrace();
     }

%>

<br>

<TABLE>
</TR>
<TD>&nbsp;&nbsp;</TD>
<TD align=right><input type = "button" name="printMe" onClick="printSpecial();" value="PRINT"></TD>
<TD>&nbsp;&nbsp;</TD>
<TD align=left> <input type = "button" value="BACK" onclick="window.open('bill_annex_index.jsp','_self');"></TD>
<TD>&nbsp;&nbsp;</TD>
</TR>
</TABLE>

<%
    if(gen_stn!= null && fin_yr!= null){
    
%>
    <div id="printReady" style="overflow:scroll; height:450px; background:#DBF2DC;">
<%
       SimpleDateFormat formatdate  = new java.text.SimpleDateFormat("dd/MM/yy");
       String           DisplayDate = formatdate.format(new java.util.Date());
%>

    <table width="97%" >
       <tr> 
       <td align=left>  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
       <td align=right> <font color="#400040" size="4">  Page : 1 </font> </td>
       </tr>
    </table>


    <table  border="1" width="97%" class= "rcrds">

     <tr bgcolor="#DBF2DC">
          <td align="center" width="25px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Sl</b></font></td>
          <td align="center" width="15px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Annex</b></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Order Number</b></font></td>
          <td align="center" width="290px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>Vendor</b></font></td>
          <td align="center" width="245px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>Bill Number</b></font></td>
          <td align="center" width="112px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>Bill Date</b></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Bill Amt(Rs)</b></font></td>
          <td align="center" width="115px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>A/C Code</b></font></td>
     </tr>
<%

        String st_dt  = "01-APR-"+fin_yr.substring(0,2);
        String end_dt = "31-MAR-"+fin_yr.substring(3);
        
        System.out.println("MISC_BILL_ANNEXURE St DT : " +st_dt);
        System.out.println("MISC_BILL_ANNEXURE End DT : " +end_dt);


        String qry_str1 = new String();
        String qry_str2 = new String();


        int    flag    = 0;
        int    srl_num = 0;
        int    no_row_pg = 34 ;

        String annex    = new String();
        String ord_num  = new String();
        String vndr_nm  = new String();
        String bill_no  = new String();
        String bill_dt  = new String();
        String bill_amt = new String();
        String acc_no   = new String();
 
        String tot_amt  = new String();

        try{

        PreparedStatement ps1 = null ;
        ResultSet rs1         = null ;

        PreparedStatement ps2 = null ;
        ResultSet rs2         = null ;

        qry_str1 = "SELECT DISTINCT nvl(b.remarks,' ') MISC_ANNEX,                                             " +
                   "       o.order_no ORDER_NO,                                                                " +
                   "       v.VENDOR_NAME VENDOR,                                                               " +
                   "       trim(b.bill_no) BILL_NO,                                                            " +
                   "       to_char(b.bill_date,'dd-MON-rrrr') BILL_DT,                                         " +
                   "       decode(b.bill_amount,0,' ',to_char(b.bill_amount,'999,99,99,990.99')) BILL_AMT,     " +
                   "       trim(o.ERP_code)  ACNO,                                                             " +
                   "       o.order_id                                                                          " +
                   "FROM   orbl_bill_dtl     b,                                                                " +
                   "       orbl_ord_dtl      o,                                                                " +
                   "       orbl_vendor_mst   v                                                                 " +
                   "WHERE  b.BILL_DATE between TO_DATE(?,'DD-MON-RR') and TO_DATE(?,'DD-MON-RR')               " + 
                   "AND    o.vendor_code  = v.vendor_code                                                      " +
                   "AND    o.order_id  = b.order_id                                                            " +
                   "AND    o.station = ?                                                                       " +
                   "AND    o.station = b.station                                                               " +
                   "AND    b.remarks IS NULL                                                                   " +
                   "ORDER BY o.order_id ASC                                                                    " ;



      ps1 = mk.con.prepareStatement(qry_str1);
    
      ps1.setString(1,st_dt);
      ps1.setString(2,end_dt);
      ps1.setString(3,gen_stn);

      
      System.out.println("MISC_BILL_ANNEXURE qry_str1: " +qry_str1);

      qry_str2 = "SELECT decode(sum(b.bill_amount),0,' ',to_char(sum(b.bill_amount),'999,99,99,990.99')) tot_amt  " +
                 "FROM   orbl_bill_dtl    b,                                                                      " +
                 "       orbl_ord_dtl     o,                                                                      " + 
	         "       orbl_vendor_mst  v                                                                       " + 
                 "WHERE  b.BILL_DATE between TO_DATE(?,'DD-MON-RR') and TO_DATE(?,'DD-MON-RR')                    " + 
                 "AND    o.order_id  = b.order_id                                                                 " +
                 "AND    o.vendor_code  = v.vendor_code                                                           " +
                 "AND    o.station = ?                                                                            " +
                 "AND    o.station = b.station                                                                    " +
                 "AND    b.remarks IS NULL                                                                        " ;


      ps2 = mk.con.prepareStatement(qry_str2);
   
      ps2.setString(1,st_dt);
      ps2.setString(2,end_dt);
      ps2.setString(3,gen_stn);


      rs2 = ps2.executeQuery();

      while(rs2.next()){
            tot_amt  = rs2.getString(1); 
      }


      ps2.close();
      rs2.close();

      rs1 = ps1.executeQuery();

      while(rs1.next()){

            flag = 1;
            if(srl_num>0 && srl_num % no_row_pg == 0){

%>

</table>

<p class="pgbrk">&nbsp;</p>

    <table width="97%" >
       <tr> 
       <td align=left ><font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
       <td align=right > <font color="#400040" size="4">  Page : <%= (srl_num / no_row_pg)+1  %> </font> </td>
       </tr>
    </table>

<table  border="1" width="97%" class= "rcrds">

     <tr bgcolor="#DBF2DC">
          <td align="center" width="25px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Sl</b></font></td>
          <td align="center" width="15px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Annex</b></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Order Number</b></font></td>
          <td align="center" width="290px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>Vendor</b></font></td>
          <td align="center" width="245px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>Bill Number</b></font></td>
          <td align="center" width="112px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>Bill Date</b></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Bill Amt(Rs)</b></font></td>
          <td align="center" width="115px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>A/C Code</b></font></td>
     </tr>

<%
             }
              srl_num++;
              annex    = rs1.getString(1);
              ord_num  = rs1.getString(2);
              vndr_nm  = rs1.getString(3);
              bill_no  = rs1.getString(4);
              bill_dt  = rs1.getString(5);
              bill_amt = rs1.getString(6);
              acc_no   = rs1.getString(7);

%>
    <tr bgcolor="#DBF2DC">
          <td align="center" width="25px"   class= "rcrdsEle" ><font color="#800040" size="1"><%=srl_num%></font></td>
          <td align="center" width="15px"   class= "rcrdsEle" ><font color="#800040" size="1"><%=annex%></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#800040" size="1"><%=ord_num%></font></td>
          <td align="left"   width="290px"  class= "rcrdsEle" ><font color="#800040" size="1"><%=vndr_nm%></font></td>
          <td align="left"   width="245px"  class= "rcrdsEle" ><font color="#800040" size="1"><%=bill_no%></font></td>
          <td align="center" width="112px"   class= "rcrdsEle" ><font color="#800040" size="1"><%=bill_dt%></font></td>
          <td align="right"  width="90px"   class= "rcrdsEle" ><font color="#800040" size="1"><%=bill_amt%></font></td>
          <td align="center" width="115px"  class= "rcrdsEle" ><font color="#800040" size="1"><%=acc_no%></font></td>
    </tr>

<%

   }


%>
      <tr bgcolor="#DBF2DC">
          <td align="center" style="border-color:#DBF2DC" class= "rcrdsEle" colspan="6">
              <font color="#800040" size="2"><b>TOTAL (Rs.)</font></b>
          </td>
          <td align="right"  style="border-color:#DBF2DC"  class= "rcrdsEle">              
              <font color="#800040" size="2"><b><%=tot_amt%></font></b>
          </td>
      </tr>
    </table>
<%
    
    ps1.close();
    rs1.close();

    }catch(Exception e1){
           e1.printStackTrace();
     }finally{
          mk.con.close();
      }
%>
    </div>
    
<%


    }
%>

</center>

</body>

</html>
