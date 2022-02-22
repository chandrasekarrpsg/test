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

System.out.println("bill_annexure1 gen_stn :"+gen_stn);
System.out.println("bill_annexure1 fin_yr :"+fin_yr);
System.out.println("bill_annexure1 year1 :"+year1);

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

    System.out.println("BILL_ANNEXURE1 GS: " + GStn);

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
    <b>ANNEXURE - I</b>
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

<table border="0">
<tr>
   <td> <input type="radio" name="r1" id="R1" value="F">
        <font face="TIMES NEW ROMAN" size="3" color="#400040"><b>FINAL LIST</b></font>
   </td>
   <td> <input type="radio" name="r1" id="R1" value="B">
        <font face="TIMES NEW ROMAN" size="3" color="#400040"><b>BILLS NOT YET RECEIVED</b></font>
   </td>
</tr>
</table>

<TABLE>
<TR>

<form method="POST" name="sampleform" action="bill_annexure1.jsp" 
                    onSubmit="var rad = document.getElementsByName('r1');
                                   if (rad[0].checked) {
                                       sampleform.h_typ.value=rad[0].value;
                                   }else{
                                       sampleform.h_typ.value=rad[1].value;
                                   }"
                    valign="middle" align="center" >


     <input type="hidden" name="gs"     value="<%=gen_stn%>">
     <input type="hidden" name="f_yr"   value="<%=fin_yr%>">
     <input type="hidden" name="yr"     value="<%=year1%>">
     <input type="hidden" name="h_typ"  value="">

<TD align=center><input type = "submit" value="SUBMIT" ></TD>

</form>

<TD>&nbsp;&nbsp;</TD>
<TD align=right><input type = "button" name="printMe" onClick="printSpecial();" value="PRINT"></TD>
<TD>&nbsp;&nbsp;</TD>
<TD align=left> <input type = "button" value="BACK" onclick="window.open('bill_annex_index.jsp','_self');"></TD>
<TD>&nbsp;&nbsp;</TD>
</TR>
</TABLE>

<%
    if(request.getParameter("gs") != null && request.getParameter("f_yr") != null && request.getParameter("h_typ")!= null){
    
    String h_typ    = request.getParameter("h_typ");
    
    System.out.println("BILL_ANNEXURE1 h_typ :"+ h_typ);
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
          <td align="center" width="300px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>Vendor</b></font></td>
          <td align="center" width="250px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>Bill Number</b></font></td>
          <td align="center" width="97px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Bill date</b></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Bill Amount</b></font></td>
          <td align="center" width="115px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>A/C Code</b></font></td>
     </tr>
<%

        String st_dt  = "01-APR-"+fin_yr.substring(0,2);
        String end_dt = "31-MAR-"+fin_yr.substring(3);
        
        System.out.println("BILL_ANNEXURE1 St DT : " +st_dt);
        System.out.println("BILL_ANNEXURE1 End DT : " +end_dt);


        String qry_str1 = new String();
        String qry_str2 = new String();

        String Cls_Str  = new String();

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

        if(h_typ.equals("F")){
           Cls_Str="b.remarks IS NOT NULL " ;
        }else{
           Cls_Str="(b.bill_ref_id IS NULL AND b.remarks IS NOT NULL) " ;
        } 

        System.out.println("BILL ANNEXURE1 CLS: "+ Cls_Str);

        qry_str1 ="SELECT DISTINCT nvl(b.remarks, ' '),                                                      " +
                  "       o.ORDER_NO ORDER_NO,                                                               " +
	          "       v.VENDOR_NAME vendor,                                                              " +
	          "       trim(b.bill_no) bill_no,                                                           " +
	          "       to_char(b.bill_date,'dd-MON-rrrr') bill_dt,                                        " +
	          "       decode(b.BILL_AMOUNT,0,' ',                                                        " +
                  "              to_char(b.BILL_AMOUNT,'999,99,99,990.99')) bill_amt,                        " +
	          "       trim(o.ERP_CODE)  acno,                                                            " +
                  "       o.order_id                                                                         " +
                  "FROM   orbl_bill_dtl     b,                                                               " +
                  "       orbl_ord_dtl      o,                                                               " +
	          "       orbl_vendor_mst   v                                                                " +
                  "WHERE  decode(o.ORDER_TYPE,'O',o.ORDER_DATE,b.JOB_MONTH)                                  " +
                  "       between TO_DATE(?,'DD-MON-RR') and TO_DATE(?,'DD-MON-RR')                          " +
                  "AND    o.ORDER_ID  = b.ORDER_ID                                                           " +
                  "AND    o.VENDOR_CODE = v.VENDOR_CODE                                                      " +
                  "AND    o.station = ?                                                                      " + 
                  "AND    o.station  = b.station                                                             " + 
                  "AND    " +  Cls_Str + " ORDER BY 8 ASC                                                    " ;


      ps1 = mk.con.prepareStatement(qry_str1);
    
      ps1.setString(1,st_dt);
      ps1.setString(2,end_dt);
      ps1.setString(3,gen_stn);

      
      qry_str2 = "SELECT decode(sum(b.BILL_AMOUNT),0,' ',to_char(sum(b.BILL_AMOUNT),'999,99,99,990.99')) tot_amt " +
                 "FROM   orbl_bill_dtl     b,                                                                    " +
                 "       orbl_ord_dtl      o,                                                                    " + 
	         "       orbl_vendor_mst   v                                                                     " + 
                 "WHERE  decode(o.ORDER_TYPE,'O',o.ORDER_DATE,b.JOB_MONTH)                                       " + 
                 "       between TO_DATE(?,'DD-MON-RR') and TO_DATE(?,'DD-MON-RR')                               " +  
                 "AND    o.ORDER_ID  = b.ORDER_ID                                                                " +             
                 "AND    o.VENDOR_CODE = v.VENDOR_CODE                                                           " +
                 "AND    o.station = ?                                                                           " + 
                 "AND    o.station = b.station                                                                   " +             
                 "AND    " +  Cls_Str                                                                              ; 


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
          <td align="center" width="25px"   class= "rcrdsEle" ><font color="#800040"><b>Sl</b></font></td>
          <td align="center" width="15px"   class= "rcrdsEle" ><font color="#800040"><b>Annex</b></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#800040"><b>Order Number</b></font></td>
          <td align="center" width="300px"  class= "rcrdsEle" ><font color="#800040"><b>Vendor</b></font></td>
          <td align="center" width="250px"  class= "rcrdsEle" ><font color="#800040"><b>Bill Number</b></font></td>
          <td align="center" width="97px"   class= "rcrdsEle" ><font color="#800040"><b>Bill date</b></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#800040"><b>Bill Amount</b></font></td>
          <td align="center" width="115px"  class= "rcrdsEle" ><font color="#800040"><b>A/C Code</b></font></td>
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
          <td align="center" width="25px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=srl_num%></font></td>
          <td align="center" width="15px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=annex%></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=ord_num%></font></td>
          <td align="left"   width="300px"  class= "rcrdsEle" ><font color="#800040" size="2"><%=vndr_nm%></font></td>
          <td align="center" width="250px"  class= "rcrdsEle" ><font color="#800040" size="2"><%=bill_no%></font></td>
          <td align="center" width="97px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=bill_dt%></font></td>
          <td align="right"  width="90px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=bill_amt%></font></td>
          <td align="center" width="115px"  class= "rcrdsEle" ><font color="#800040" size="2"><%=acc_no%></font></td>
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
