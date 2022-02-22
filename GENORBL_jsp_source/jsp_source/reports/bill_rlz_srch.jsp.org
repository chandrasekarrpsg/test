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

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();

PreparedStatement ps = null ;
ResultSet rs = null ;

%>

<body background="GS1.jpg" onLoad="prescript1();">

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

<div id="footer">
<div id="container">
<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:25px; top:15px" width="170" height="70">


<label style="POSITION: absolute; LEFT: 660px; top:575px"  class="style5" ><b>2012 ) Developed by I.T. Department</b></label>

</div>
</div>

<center>
<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3"><font face="Albertus Extra Bold" size="5" color="#400040">
<b>BILLS RELEASED SEARCH</b></font>
<br><br>

<table>
<tr>
<td><font size="4" color="#400040"><b>ORDER NUMBER</b></font></td>
<td>
   <select name="s1" id="s1">
         <option value="NONE">SELECT</option>
         <option value="BBGS">BBGS</option>
         <option value="TGS">TGS</option>
         <option value="SGS">SGS</option>
         <option value="NCGS">NCGS</option>
         <option value="CTM">CTM</option>
         <option value="ED(G)">ED(G)</option>
   </select>
</td>
<td>/</td>

<td>
<select name="s2" id="s2">
<option value="NONE">SELECT</option>
<%
  String tc = new String() ;
  try {

      ps = mk.con.prepareStatement("SELECT DISTINCT TC FROM orbl_ord_dtl_old ORDER BY 1" ) ;
      rs = ps.executeQuery() ;

      while(rs.next()) {
            tc = rs.getString(1) ;
%>
<option value="<%=tc%>"><%=tc%></option>
<%
      }
    
      ps.close();
      rs.close();

  }catch(Exception e1){
      e1.printStackTrace();
    } 
%>
</select>
</td>

<td>/</td>

<td>
<select name="s3" id="s3">
<option value="NONE">SELECT</option>
<%
  String dept = new String() ;
  try {

      ps = null ;
      rs = null ;

      ps = mk.con.prepareStatement("select DEPT from orbl_deptac_mst_old order by DEPT" ) ;
      rs = ps.executeQuery() ;

      while(rs.next()) {
            dept = rs.getString(1) ;
%>
<option value="<%=dept%>"><%=dept%></option>
<%
      }

      ps.close();
      rs.close();
  }catch(Exception e3){
      e3.printStackTrace();
    } 
%>
</select>
</td>

<td>/</td>

<td>
<select name="s4" id="s4">
<option value="NONE">SELECT</option>
<%
  String sl_no = new String() ;
  try {

      ps = null ;
      rs = null ;

      ps = mk.con.prepareStatement("select distinct LPAD(TO_CHAR(sl_no),5,'0') from orbl_ord_dtl_old order by 1" ) ;
      rs = ps.executeQuery() ;

      while(rs.next()) {
            sl_no = rs.getString(1) ;
%>
<option value="<%=sl_no%>"><%=sl_no%></option>
<%
      }

      rs.close() ;
      ps.close() ;

  }catch(Exception e4){
      e4.printStackTrace();
    }
%>
</select>
</td>
</tr>
</table>
<br>
<table>
<tr>
<td><font size="4" color="#400040"><b>BILL NUMBER</b></font></td>
<td>
<select name="s5" id="s5">
<option value="NONE">SELECT</option>
<%
  String dept1 = new String() ;
  try {

      ps = mk.con.prepareStatement("select DEPT from orbl_deptac_mst_old order by DEPT" ) ;
      rs = ps.executeQuery() ;

      while(rs.next()) {
            dept1 = rs.getString(1) ;
%>
<option value="<%=dept1%>"><%=dept1%></option>
<%
      }

      rs.close() ;
      ps.close() ;

  }catch(Exception e3){
      e3.printStackTrace();
    }
%>
</select>
</td>
<td>/</td>

<td>
<select name="s6" id="s6">
<option value="NONE">SELECT</option>
<%
  String bill_no = new String() ;
  try {

      ps = mk.con.prepareStatement("select distinct bill_no from orbl_bill_dtl_old order by 1" ) ;
      rs = ps.executeQuery() ;

      while(rs.next()) {
            bill_no = rs.getString(1) ;
%>
<option value="<%=bill_no%>"><%=bill_no%></option>
<%
      }

      rs.close() ;
      ps.close() ;

  }catch(Exception e4){
      e4.printStackTrace();
    }
%>
</select>
</td>
</tr>
</table>

<table>
<tr>
<td><font size="4" color="#400040"><b>VENDOR NAME</b></font></td>
<td>
<select name="s7" id="s7">
<option value="NONE">SELECT</option>
<%
  String vndr = new String() ;
  try {

      ps = mk.con.prepareStatement("select distinct v_name from orbl_vendor_mst_old order by 1" ) ;
      rs = ps.executeQuery() ;

      while(rs.next()) {
            vndr = rs.getString(1) ;
%>
<option value="<%=vndr%>"><%=vndr%></option>
<%
      }

      rs.close() ;
      ps.close() ;

  }catch(Exception e5){
      e5.printStackTrace();
    }
%>
</select>
</td>
</tr>
</table>

<TABLE>
<TR>
<form method="POST" name="sampleform" action="bill_rlz_srch.jsp" onSubmit="DefaultValue2();" valign="middle" align="center" >

<input type ="hidden" id="h1" name="h_ord">
<input type ="hidden" id="h2" name="h_bill">
<input type ="hidden" id="h3" name="h_vndr">
<input type ="hidden" id="h4" name="h_gen">

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
        String ord_num = request.getParameter("h_ord");
        String bill_nm = request.getParameter("h_bill");
        String vndr_nm = request.getParameter("h_vndr");
        String genStn  = request.getParameter("h_gen");

        String qry_str1 = new String();
        String qry_str2 = new String();

        String Cls_Str  = new String();

        String Cls1     = new String();
        String Cls2     = new String();
        String Cls3     = new String();

        int    flag      = 0;
        int    srl_num   = 0;
        int    no_row_pg = 34 ;

        String gs_id     = new String();
        String vndr1     = new String();
        String bill_ref  = new String();
        String ord_num1  = new String();
        String bill_dt   = new String();
        String bill_for  = new String();
        String bill_amt  = new String();
        String lttr_ref  = new String();
        String fin_rcd_dt= new String();

        String  tot_bl_amt = new String();

    try{

        if(!ord_num.equals("NONE") || !bill_nm.equals("NONE") || !vndr_nm.equals("NONE")){
      
%>
 <div id="printReady" style="overflow:scroll; height:365px; background:#DBF2DC;"> 

<%
   SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
   String DisplayDate= formatdate.format(new java.util.Date());

%>
<table width="97%" >
    <tr> 
       <td align=left>  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
       <td align=right> <font color="#400040" size="4">  Page : 1 </font> </td>
    </tr>
</table>

<table  border="1" width="97%" class= "rcrds" >
     <tr bgcolor="#DBF2DC">
          <td colspan="10" align="center" class= "rcrdsEle" >
            <font color="#400040" size="3">
            <b>GENERATING STATION : <%=genStn%> </b>
            </font>
          </td>
     </tr>

   <tr bgcolor="#DBF2DC">
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Sl</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>GS Id</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Vendor</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Bill Ref No</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Order No</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Bill Dt</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Bill For</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Amount</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Letter Ref</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Recvd Dt</b></font></td>
  </tr>

<%
      


        PreparedStatement ps1 = null ;
        PreparedStatement ps2 = null ;

        ResultSet rs1         = null ;
        ResultSet rs2         = null ;


        if(!ord_num.equals("NONE"))
           Cls1 = " AND trim(o.genstn||'/'||o.tc||'/'||o.dept||'/'||LPAD(TO_CHAR(o.sl_no),5,'0')) LIKE '%"+ord_num+"%'"; 
        else
           Cls1 = "";

        if(!bill_nm.equals("NONE"))
           Cls2 = " AND b.bill_no LIKE '%"+bill_nm+"%'"; 
        else
           Cls2 = "";

        if(!vndr_nm.equals("NONE"))
           Cls3 = " AND v.v_name LIKE '%"+vndr_nm+"%'";
        else
           Cls3 = "";


        Cls_Str = Cls1+Cls2+Cls3;

        System.out.println("BILL_RLZ_SRCH Cls_Str : "+ Cls_Str);

        qry_str1= "SELECT distinct ('0/'||b.billref) GS_id,                                                                 " +
                  "       v.V_NAME VNDR,                                                                                    " +
     	          "       b.bill_no BILL_REF,                                                                               " +
                  "       trim(o.genstn||'/'||o.tc||'/'||o.dept||'/'||LPAD(TO_CHAR(o.sl_no),5,'0')) ORDER_NO,               " +
                  "       to_char(b.bill_dt,'dd-MON-YYYY') bill_dt,                                                         " +
	          "       to_char(b.JOB_DONE_1STDT,'MON-YY') bill_for,                                                      " +
	          "       to_char(b.bill_amt,'999,99,99,990.99') bill_amt,                                                  " +
	          "       o.genstn||'/IR/'||(TO_CHAR( ADD_MONTHS( TO_DATE(bill_recd_dt,'dd/mm/rr'), -3 ), 'rr' )||'-'||     " +
                  "       TO_CHAR( ADD_MONTHS( TO_DATE(bill_recd_dt,'dd/mm/rr'), 9 ), 'rr' ))||'/P'||b.billrel_id||' '||    " +
                  "       b.BILL_RECD_DT LETTER_REF_NO,                                                                     " +
                  "       to_char(b.BILL_RECD_DT,'dd-MON-yyyy') FIN_RECD_DT                                                 " +
                  "FROM   orbl_bill_dtl_old     b,                                                                          " +
                  "       orbl_ord_dtl_old      o,                                                                          " +
                  "       orbl_job_dtl_old      j,                                                                          " +
	          "       orbl_vendor_mst_old   v                                                                           " + 
                  "WHERE   o.ord_ref  = j.ord_ref                                                                           " + 
                  "AND     j.cont_ref = v.vendor_ref                                                                        " + 
                  "AND     o.ord_ref  = b.ordref                                                                            " + 
                  "AND     o.genstn = ?                                                                                     " + 
                  "AND     o.genstn = b.genstn                                                                              " + 
                  "AND     o.genstn = j.genstn                                                                              " + 
                  "AND     b.bill_recd_dt is not null " + Cls_Str                                                             ;

         ps1 = mk.con.prepareStatement(qry_str1);
        
         ps1.setString(1,genStn);

         rs1 = ps1.executeQuery() ; 

         while(rs1.next()) {
               flag = 1;
               if(srl_num>0 && srl_num % no_row_pg == 0){
%>
</table>

<p class="pgbrk">&nbsp;</p>
    <table width="97%" >
     <tr>

      <td align=left ><font color="#400040" size="4">  &nbsp Date : <%= DisplayDate %> </font> </td>
      <td align=right > <font color="#400040" size="4">  Page : <%= (srl_num / no_row_pg)+1  %> </font> </td>

    </tr>
   </table>
 
<table  border="1" width="97%" class= "rcrds" >
     <tr bgcolor="#DBF2DC">
          <td colspan="10" align="center" class= "rcrdsEle" >
            <font color="#400040" size="3">
            <b>GENERATING STATION : <%=genStn%> </b>
            </font>
          </td>
     </tr>

   <tr bgcolor="#DBF2DC">
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Sl</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>GS Id</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Vendor</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Bill Ref No</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Order No</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Bill Dt</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Bill For</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Amount</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Letter Ref</b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#400040"><b>Recvd Dt</b></font></td>
  </tr>
<%
          }

        srl_num++;
        gs_id     = rs1.getString(1); 
        vndr1     = rs1.getString(2); 
        bill_ref  = rs1.getString(3); 
        ord_num1  = rs1.getString(4); 
        bill_dt   = rs1.getString(5); 
        bill_for  = rs1.getString(6); 
        bill_amt  = rs1.getString(7); 
        lttr_ref  = rs1.getString(8); 
        fin_rcd_dt= rs1.getString(9); 


         if(srl_num % 2 == 0){

%>
        <tr bgcolor="#DBF2DC">
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=srl_num%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=gs_id%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=vndr1%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=bill_ref%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=ord_num1%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=bill_dt%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=bill_for%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=bill_amt%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=lttr_ref%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=fin_rcd_dt%></b></font></td>
        </tr>
<%
            }else{
%>
        <tr bgcolor="#ffffff">
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=srl_num%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=gs_id%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=vndr1%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=bill_ref%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=ord_num1%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=bill_dt%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=bill_for%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=bill_amt%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=lttr_ref%></b></font></td>
          <td align="center" width="25px" class= "rcrdsEle" rowspan=2><font color="#800040"><b><%=fin_rcd_dt%></b></font></td>
        </tr>

<%
     }
   }

   rs1.close();
   ps1.close();

   qry_str2 = "SELECT  TRIM(NVL(TO_CHAR(SUM(b.bill_amt),'9999999990.99'),'0.00')) TOT_AMT   " + 
              "FROM    orbl_bill_dtl_old     b,                                             " + 
              "        orbl_ord_dtl_old      o,                                             " + 
	      "        orbl_job_dtl_old      j,                                             " + 
	      "        orbl_vendor_mst_old   v                                              " + 
              "WHERE   o.ord_ref  = j.ord_ref                                               " + 
              "AND   j.cont_ref = v.vendor_ref                                              " + 
              "AND   o.ord_ref  = b.ordref                                                  " + 
              "AND   o.genstn = ?                                                           " + 
              "AND   o.genstn = b.genstn                                                    " + 
              "AND   o.genstn = j.genstn                                                    " + 
              "AND     b.bill_recd_dt is not null " + Cls_Str                                 ;

   ps2 = mk.con.prepareStatement(qry_str2);

   ps2.setString(1,genStn);
   rs2 = ps2.executeQuery() ;

   while(rs2.next()) {
         tot_bl_amt = rs2.getString(1);
   }

%>

         <tr bgcolor="#DBF2DC">
          <td align="right" class= "rcrdsEle" colspan="7"><font color="#800040"><b>TOTAL (Rs.) :</b></font></td>
          <td align="right" class= "rcrdsEle">            <font color="#800040"><b><%=tot_bl_amt%></b></font></td>
         </tr>
</table>
<%
      
   rs2.close();
   ps2.close();


%>
 </div>
<%
    }   
    }catch(Exception E){
          E.printStackTrace();
    }finally{
            mk.con.close();
     }

%>
</center>
</body>
</html>




