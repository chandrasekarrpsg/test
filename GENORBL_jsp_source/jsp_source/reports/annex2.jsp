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

String dept   = request.getParameter("var1");
String st_dt  = request.getParameter("var2");
String end_dt = request.getParameter("var3");
String genStn = request.getParameter("var4");

System.out.println("ANNEX2 genStn :"+genStn);
System.out.println("ANNEX2 st_dt :"+st_dt);
System.out.println("ANNEX2 end_dt :"+end_dt);
System.out.println("ANNEX2 dept :"+dept);

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();

%>

<body background="GS1.jpg">

<center>

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

<div id="footer">
<div id="container">
<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:25px; top:15px" width="170" height="70">


<label style="POSITION: absolute; LEFT: 660px; top:575px"  class="style5" ><b>2012 &copy Developed by I.T. Department</b></label>

</div>
</div>

<br><br>
<%

if(dept != null && st_dt !=null && end_dt != null && genStn != null){
%>
<TABLE>
<TD>&nbsp;&nbsp;</TD>
<TD align=right><input type = "button" name="printMe" onClick="printSpecial();" value="PRINT"></TD>
<TD>&nbsp;&nbsp;</TD>
<TD align=left> <input type = "button" value="BACK" onclick="window.open('bill_liability.jsp','_self');"></TD>
<TD>&nbsp;&nbsp;</TD>
</TR>
</TABLE>

<br>

<div id="printReady" style="overflow:scroll; height:400px; background:#DBF2DC;">

<%

SimpleDateFormat formatdate  = new java.text.SimpleDateFormat("dd/MM/yy");
String           DisplayDate = formatdate.format(new java.util.Date());

%>
    <table width="97%" >
       <tr> 
       <td align=left>  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
       <td align=center >
           <font color="#400040" size="3">  
           <b>STATION ORDERS RAISED BUT BILLS NOT RELEASED BETWEEN <%=st_dt%> AND <%=end_dt%></b>
           </font>
       </td>
       <td align=right> <font color="#400040" size="4">  Page : 1 </font> </td>
       </tr>
    </table>
    
     <table  border="1" width="97%" class= "rcrds">
     <tr bgcolor="#DBF2DC">
          <td colspan="8" align="center" class= "rcrdsEle" >
            <font color="#400040" size="3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <b>GENERATING STATION : <%=genStn%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : <%=dept%></b>
            </font>
          </td>
     </tr>
     <tr bgcolor="#DBF2DC">
          <td align="center" width="25px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Sl</b></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Order No</b></font></td>
          <td align="center" width="97px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Order Date</b></font></td>
          <td align="center" width="350px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>Scope</b></font></td>
          <td align="center" width="300px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>Vendor</b></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Order Amount</b></font></td>
     </tr>
<%
      String qry_str1 = new String();
      String qry_str2 = new String();

      int    flag    = 0;
      int    srl_num = 0;
      int    no_row_pg = 34 ;

      String ord_num  = new String();
      String ord_dt   = new String();
      String scope    = new String();
      String vndr_nm  = new String();
      String ord_amt  = new String();
        
      String tot_amt  = new String();

      try{

        PreparedStatement ps1 = null ;
        ResultSet rs1         = null ;

        PreparedStatement ps2 = null ;
        ResultSet rs2         = null ;

             qry_str1 = " SELECT o.order_no ORDER_NO,                                           " +
                        "        to_char(o.ORDER_DATE,'DD-MON-YYYY') ORD_DT,                    " +
                        "        o.JOB_DESC SCOPE,                                              " +
                        "        v.VENDOR_NAME VENDOR,                                          " +
                        "        decode(o.P1_TOTAL,0,' ',                                       " +
                        "               to_char(o.P1_TOTAL,'9999999990.99')) ORD_AMT,           " +
                        "        o.ORDER_ID                                                     " +
                        " FROM   orbl_bill_dtl     b,                                           " +
                        "        orbl_ord_dtl      o,                                           " +
                        "        orbl_vendor_mst   v,                                           " +
                        "        orbl_cd_dept      d                                            " +
                        " WHERE  decode(o.ORDER_TYPE,'O',o.ORDER_DATE,b.JOB_MONTH)              " +
                        "        BETWEEN TO_DATE(?,'DD-MON-RR') AND TO_DATE(?,'DD-MON-RR')      " +
                        " AND    o.ORDER_ID  = b.ORDER_ID                                       " +
                        " AND    o.VENDOR_CODE = v.VENDOR_CODE                                  " +
                        " AND    o.STATION =                                                    " +
                        "        (SELECT DISTINCT DECODE(?,'SGS','002','NCGS','013',            " +
                        "                                  'TGS','014','BBGS','016',            " +
                        "                                  'CTM','019','EDGE','042')            " +
                        "        FROM cd_station)                                               " +
                        " AND    d.ORDER_DEPT = ?                                               " +
                        " AND    o.DEPT   = d.DEPT                                              " +
                        " AND    o.STATION = b.STATION                                          " +
                        " AND    o.order_type = 'O'                                             " +
                        " ORDER BY o.ORDER_ID                                                   " ;

/*AND    b.ORDREF IS NULL
AND    o.CANCEL   = 'N'*/

         ps1 = mk.con.prepareStatement(qry_str1);
    
         ps1.setString(1,st_dt);
         ps1.setString(2,end_dt);
         ps1.setString(3,genStn); 
         ps1.setString(4,dept); 

              qry_str2 =" SELECT decode(sum(o.P1_TOTAL),0,' ',                                  " +
                        "              to_char(sum(o.P1_TOTAL),'999,99,99,990.99')) tot_amt     " +
                        " FROM   orbl_bill_dtl    b,                                            " +
                        "        orbl_ord_dtl     o,                                            " +
                        "        orbl_vendor_mst  v,                                            " +
                        "        orbl_cd_dept     d                                             " +
                        " WHERE  decode(o.ORDER_TYPE,'O',o.ORDER_DATE,b.JOB_MONTH)              " +
                        "        BETWEEN TO_DATE(?,'DD-MON-RR') AND TO_DATE(?,'DD-MON-RR')      " +
                        " AND    o.ORDER_ID  = b.ORDER_ID                                       " +
                        " AND    o.VENDOR_CODE = v.VENDOR_CODE                                  " +
                        " AND    o.STATION =                                                    " +
                        "        (SELECT DISTINCT DECODE(?,'SGS','002','NCGS','013',            " +
                        "                                  'TGS','014','BBGS','016',            " +
                        "                                  'CTM','019','EDGE','042')            " +
                        "        FROM cd_station)                                               " +
                        " AND    d.ORDER_DEPT = ?                                               " +
                        " AND    o.DEPT   = d.DEPT                                              " +
                        " AND    o.STATION = b.STATION                                          " +
                        " AND    o.order_type = 'O'                                             " ;

         ps2 = mk.con.prepareStatement(qry_str2);
   
         ps2.setString(1,st_dt);
         ps2.setString(2,end_dt);
         ps2.setString(3,genStn);
         ps2.setString(4,dept);


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
             <td align=left>  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
             <td align=center >
                 <font color="#400040" size="3">  
                 <b>STATION ORDERS RAISED BUT BILLS NOT RELEASED BETWEEN <%=st_dt%> AND <%=end_dt%></b>
                 </font>
             </td>
             <td align=right> <font color="#400040" size="4">  Page : <%= (srl_num / no_row_pg)+1  %> </font> </td>
             </tr>
           </table>
   
     <table  border="1" width="97%" class= "rcrds">

     <tr bgcolor="#DBF2DC">
          <td colspan="8" align="center" class= "rcrdsEle" >
            <font color="#400040" size="3">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <b>GENERATING STATION : <%=genStn%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : <%=dept%></b>
            </font>
          </td>
     </tr>
     <tr bgcolor="#DBF2DC">
          <td align="center" width="25px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Sl</b></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Order No</b></font></td>
          <td align="center" width="97px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Order Date</b></font></td>
          <td align="center" width="350px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>Scope</b></font></td>
          <td align="center" width="300px"  class= "rcrdsEle" ><font color="#400040" size="2"><b>Vendor</b></font></td>
          <td align="center" width="90px"   class= "rcrdsEle" ><font color="#400040" size="2"><b>Order Amount</b></font></td>
     </tr>

<%
            }

            srl_num++;
            ord_num  = rs1.getString(1);  
            ord_dt   = rs1.getString(2); 
            scope    = rs1.getString(3); 
            vndr_nm  = rs1.getString(4); 
            ord_amt  = rs1.getString(5); 
       
            if(srl_num%2 == 0){

%>
     <tr bgcolor="#DBF2DC">
          <td align="center" width="25px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=srl_num%></font></td>
          <td align="left"   width="90px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=ord_num%></font></td>
          <td align="center" width="97px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=ord_dt%></font></td>
          <td align="left"   width="350px"  class= "rcrdsEle" ><font color="#800040" size="2"><%=scope%></font></td>
          <td align="left"   width="300px"  class= "rcrdsEle" ><font color="#800040" size="2"><%=vndr_nm%></font></td>
          <td align="right"  width="90px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=ord_amt%></font></td>
     </tr>
<%
            }else{
%>
     <tr bgcolor="#FFFFFF">
          <td align="center" width="25px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=srl_num%></font></td>
          <td align="left"   width="90px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=ord_num%></font></td>
          <td align="center" width="97px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=ord_dt%></font></td>
          <td align="left"   width="350px"  class= "rcrdsEle" ><font color="#800040" size="2"><%=scope%></font></td>
          <td align="left"   width="300px"  class= "rcrdsEle" ><font color="#800040" size="2"><%=vndr_nm%></font></td>
          <td align="right"  width="90px"   class= "rcrdsEle" ><font color="#800040" size="2"><%=ord_amt%></font></td>
     </tr>
<%

            }
         }
%>
     <tr bgcolor="#DBF2DC">
          <td align="center" style="border-color:#DBF2DC" class= "rcrdsEle" colspan="5">
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
