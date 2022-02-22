<%--
    Document   : test1
    Created on : Jan 10, 2013, 11:33:41 AM
    Author     : Amalesh_gole
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="VO.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <script src="js/jquery-latest.js"></script>
     <script src="js/jquery.bpopup-0.7.0.min.js" type="text/javascript"></script>
     <script src="js/jquery.corner.js" type="text/javascript"></script>
     <script type="text/javascript" src="js/jquery.scrollableFixedHeaderTable.js"></script>
     <link href="css/scrollableFixedHeaderTable.css" rel="stylesheet" type="text/css"/>
<title>Sandbox</title>
<meta http-equiv="Content-type" content="text/html; charset=utf-8" />

<script>

function getUIScreenWidthR31a(){
var theWidth, theHeight;
// Window dimensions:
if (window.innerWidth) {
theWidth=window.innerWidth;
}
else if (document.documentElement && document.documentElement.clientWidth) {
theWidth=document.documentElement.clientWidth;
}
else if (document.body) {
theWidth=document.body.clientWidth;
}
if (window.innerHeight) {
theHeight=window.innerHeight;
}
else if (document.documentElement && document.documentElement.clientHeight) {
theHeight=document.documentElement.clientHeight;
}
else if (document.body) {
theHeight=document.body.clientHeight;
}

return theWidth;
}



function showDtls(vndrCd){
    prsnlDtlFrm.vndr_cd_h.value = vndrCd ;
    prsnlDtlFrm.target= 'frm_blk1';
                             prsnlDtlFrm.submit();

//parent.submitForm('prsnlDtlFrm');

}




function printSpecial()
   {
    var gAutoPrint = true;
    if (document.getElementById != null)
     {
      var html = '<HTML>\n<HEAD>\n';

      if (document.getElementsByTagName != null)
        {
        var headTags = document.getElementsByTagName("head");
        if (headTags.length > 0)
           html += headTags[0].innerHTML;
        }

      html += '\n</HEAD>\n<BODY>\n';

      var printReadyElem = document.getElementById("printBody");

      if (printReadyElem != null)
       {
        html += printReadyElem.innerHTML;
       }
      else
       {
       // alert("Could not find the printReady function");
        return;
       }

      html += '\n</BODY>\n</HTML>';

      var printWin = window.open("","_self");
     // printWin.document.open();
    //  printWin.document.write(html);
     // printWin.document.close();
      if (gAutoPrint){

      printWin.document.open();
      printWin.document.write(html);
      printWin.print("_self");
      printWin.document.close();

}
     }
    else
     {
       alert("The print ready feature is only available if you are using an browser.  Please update your browswer.");
     }
   }



</script>



<style type="text/css" >


body { font-family:"Times New Roman",Georgia,Serif,Arial; background-color: #ffffff ; font: 16px; color: #000; }
th.th1, td.td1 { text-align: left;height:70px;width:250px;vertical-align:top; }
td.td2 { text-align: left;height:70px;width:20px;vertical-align:top; }
th.th2 { background-color: #e4e4e4; cursor: pointer;height:70px;width:300px;vertical-align:top; }

table.tbl_uper{ border-collapse: collapse; border: 1px solid #000;width:100%; }
th.th1_upper, td.td1_upper { border: 1px solid #000;text-align: left;vertical-align:top; }
th.th2_upper { background-color: #e4e4e4; cursor: pointer; vertical-align:top; }


table.sortable {
  background-color: #e4e4e4;
  font-size: 12px;
  
}


.style_annxr{
font-size: 10px;
text-decoration:underline;
text-align:right;
}


.sub_style_1{

font-size: 14px;
text-decoration:underline;
font-weight:bold;
text-align:center;
}
.stn_style_1{
font-size: 12px;
color:blue;
}

.print_style_1{
color:blue;
}




.th1_addr{
text-align: left;height:70px;width:250px;vertical-align:top;
font-size: 13px;
}

.td2_addr{
text-align: left;height:70px;width:20px;vertical-align:top;
font-size: 13px;
}

.td1_addr{
text-align: left;height:70px;width:250px;vertical-align:top;
font-size: 13px;
}

.td1_blk_1{
border:2px solid;
border-color:black;
text-align: center;
width:150px;
height:40px;
vertical-align:middle;
}

.tbl_1_style{
border-collapse: collapse; 
border:2px solid;
border-color:black;
text-align: left;
width:450px;
height:60px;
vertical-align:middle;

}

.tbl_1_td1_style{
border:2px solid;
border-color:black;

width:200px;
height:30px;
}


.tbl_1_td2_style{
border:2px solid;
border-color:black;

text-align: center;
width:200px;
height:30px;
}

.tbl_1_td5_style{
border:2px solid;
border-color:black;
color:#2e005b; 
width:200px;
height:30px;
}


.tbl_1_td6_style{
border:2px solid;
border-color:black;
color:#2e005b; 

text-align: center;
width:200px;
height:30px;
}



table.dtl_tbl, td.dtl_td, th.dtl_th
{
border-collapse: collapse;
border:1px solid green;
}
th.dtl_th
{
background-color:green;
color:white;
vertical-align:vertical;
}

.td.dtl_td{
font-size: 12px;
}


.highlight-selected-row{
 background-color: #d9a8b1;
}

td.betterhover, #_myTable2 tbody tr:hover {
 background:#e2e094;
}



.bgcolorEachcell{
 background-color:#aff2fa;
}



</style>




</head>
<body>

    
    <%
LoginBean loginBn = (LoginBean) request.getSession().getAttribute("loginBean");

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    
   
    String vndrCdStr = request.getParameter("spbil_ref_h")==null?"":request.getParameter("spbil_ref_h");
    String billTypeStr = request.getParameter("billtype_h")==null?"":request.getParameter("billtype_h");
    String fin_ref_str = "";
    String fin_date_str = "";
    String gen_stn_cd_str = "";
    String fin_ref_id_str = request.getParameter("fin_ref_id_h")==null?"":request.getParameter("fin_ref_id_h");
   
    

    try {
        PreparedStatement ps = null ;
        ResultSet rs = null ;


 String ipAddress = request.getRemoteAddr();
String userDtls = "";
userDtls = ipAddress+":"+loginBn.getsEmpCd();
String usrEmpCd = "977471" ;
//userDtls = ipAddress+":"+"977471";
System.out.println("  userDtls :  "+userDtls);
String genStn = loginBn.getsGenStn();




String qryForAddr =   "    select nvl(ADDR1,' '), nvl(ADDR2,' '), nvl(ADDR3,' '), nvl(ADDR4,' ') "+
                      "    from ORBL_CD_SEND_TO_ADDRESS where TYP = 'B'                               "+
                      "";
 

String qryForbillDtl =   "          select   ovm.VENDOR_NAME  , osb.BILL_NO ,   "+
                         "                   to_char(osb.BILL_DT,'DD-MON-RRRR') ,  "+
                         "                  osb.BILL_AMT,  "+
                         "                  decode(osb.URGENTINVOICEATTACHED,'Y','Yes','N','No'),  "+
                         "                   nvl(to_char(osb.FINANCE_RECVD_DATE,'DD-MON-RRRR'),' ') , to_char(sysdate,'DD-MON-RRRR')   "+
                         "       from  ORBL_SPBILL_DTL osb , ORBL_VENDOR_MST ovm     "+
                         "       where osb.BILLREF = ?     "+
                         "      and osb.URGENT_PAYMENT = 'Y'                            "+
                         "       and ovm.VENDOR_CODE = osb.VENDOR  "+
                               "";
String qry_for_signatory = "";
String signatoryStr = "";

if(billTypeStr.equals("S")){

qryForAddr =   "          select ADDR1, ADDR2, ADDR3, ADDR4  from CD_SEND_TO_ADDRESS where TYP = 'B'    "+
                               "";


qryForbillDtl =   "          select   ovm.VENDOR_NAME  , osb.BILL_NO ,   "+
                        "                   to_char(osb.BILL_DT,'DD-MON-RRRR') ,  "+
                         "                  osb.BILL_AMT,  "+
                         "                  decode(osb.URGENTINVOICEATTACHED,'Y','Yes','N','No'),  "+
                        "                   nvl(to_char(osb.FINANCE_RECVD_DATE,'DD-MON-RRRR'),' ')  ,  to_char(sysdate,'DD-MON-RRRR')  "+
                         "       from  ORBL_SPBILL_DTL osb , ORBL_VENDOR_MST ovm     "+
                          "       where osb.BILLREF = ?     "+
                          "      and osb.URGENT_PAYMENT = 'Y'                            "+
                         "       and ovm.VENDOR_CODE = osb.VENDOR  "+
                               "";


qry_for_signatory = "  select SIGNATORY from ORBL_SIG_AUTH where STATION_CD = ?  ";

}else if(billTypeStr.equals("N")){

qryForAddr =   "          select ADDR1, ADDR2, ADDR3, ADDR4  from CD_SEND_TO_ADDRESS where TYP = 'B'    "+
                               "";


qryForbillDtl =   "          select   od.VENDOR_NAME  , bd.BILL_NO ,   "+
                        "                   to_char(bd.BILL_DATE,'DD-MON-RRRR') ,  "+
                         "                  bd.BILL_AMOUNT,  "+
                         "                  decode(bd.URGENTINVOICEATTACHED,'Y','Yes','N','No'),  "+
                        "                   nvl(to_char(bd.FINANCE_RECVD_DATE,'DD-MON-RRRR'),' ') ,to_char(sysdate,'DD-MON-RRRR')  "+
                         "       from  ORBL_BILL_DTL bd , ORBL_ORD_DTL od     "+
                          "       where bd.BILL_ID =  ?     "+
                          "      and bd.ORDER_ID = od.ORDER_ID                            "+
                          "      and bd.URGENT_PAYMENT = 'Y'                            "+
                               "";



qry_for_signatory = "  select SIGNATORY from ORBL_SIG_AUTH where STATION_CD = ?  ";

}



ps = null;
rs = null;

String  all_requrd_val_qry = "  select STATION_CD, BILL_REF_ID,  "+
                             "           LETTER2FINANCE_REF, to_char(LETTER2FINANCE_DT,'DD-MON-RRRR')   "+
                             "     from ORBL_FIN_RCD_DT                         "+
                             "       where BILL_REF_ID=?  ";


ps = mk.con.prepareStatement(all_requrd_val_qry);
ps.setString(1,fin_ref_id_str);
 rs = ps.executeQuery();

                            if(rs.next()){

 gen_stn_cd_str = rs.getString(1);
 fin_ref_str = rs.getString(3);
 fin_date_str = rs.getString(4);

}
rs.close();
ps.close();
ps = null;
rs = null;






qry_for_signatory = "  select SIGNATORY from ORBL_SIG_AUTH where STATION_CD = ?  ";

ps = null;
rs = null;

ps = mk.con.prepareStatement(qry_for_signatory);
ps.setString(1,gen_stn_cd_str);
 rs = ps.executeQuery();

                            if(rs.next()){

 signatoryStr = rs.getString(1);
}
rs.close();
ps.close();
ps = null;
rs = null;


String gen_stn_long_na_qry = " select STATION_LONG_DESC , to_char(sysdate,'DD-MON-RRRR') from CD_STATION where ORBL_STATION_CD = ? ";
String gen_stn_long_name = "";
String sysdateStr = "";
ps = null;
rs = null;

ps = mk.con.prepareStatement(gen_stn_long_na_qry);
ps.setString(1,gen_stn_cd_str);
 rs = ps.executeQuery();

                            if(rs.next()){

 gen_stn_long_name = rs.getString(1);
 sysdateStr = rs.getString(2);
}
rs.close();
ps.close();
ps = null;
rs = null;

int total_bill = 0;
String total_bill_amt = "";
int total_urgnt_pymnt_bill = 0;
String total_bill_qry = " select sum(num) , to_char(sum(bill_amt),'99999999999.09') from "+
                        "  ( select count(*) num ,sum(BILL_AMT)    "+
                        "           bill_amt from ORBL_SPBILL_DTL   "+
                         "     where BILL_REF_ID = ?     "+
                          //"          and nvl(URGENT_PAYMENT,'N') <>  'Y'                          "+
                        "   union all "+
                        "   select count(*) num ,sum(BILL_AMOUNT) bill_amt       "+
                        "         from ORBL_BILL_DTL                "+
                        "         where BILL_REF_ID = ?     "+
                          //"          and nvl(URGENT_PAYMENT,'N') <> 'Y'                         "+
                        " )"; 

ps = mk.con.prepareStatement(total_bill_qry);
ps.setString(1,fin_ref_id_str);
ps.setString(2,fin_ref_id_str);
 rs = ps.executeQuery();

                            if(rs.next()){

 total_bill = rs.getInt(1);
 total_bill_amt = rs.getString(2);

}
rs.close();
ps.close();
ps = null;
rs = null;

String total_urgnt_pymnt_bill_qry =  "  select sum(num1) from   "+
                                 " (select count(*) num1     "+
                                 "      from ORBL_SPBILL_DTL   "+
                                 "      where BILL_REF_ID = ?   "+
                                 "    and URGENT_PAYMENT = 'Y'         "+
                                 "  union all                           "+
                                 "    select count(*) num1          "+
                                 "    from ORBL_BILL_DTL             "+
                                  "    where BILL_REF_ID = ?    "+
                                  "    and URGENT_PAYMENT = 'Y' ) ";



ps = mk.con.prepareStatement(total_urgnt_pymnt_bill_qry);
ps.setString(1,fin_ref_id_str);
ps.setString(2,fin_ref_id_str);
 rs = ps.executeQuery();

                            if(rs.next()){

 total_urgnt_pymnt_bill = rs.getInt(1);

}
rs.close();
ps.close();
ps = null;
rs = null;



String all_bill_dtl_qry = "  select 'S-'||osb.BILLREF bill_ref ,    "+
                          "          ovm.VENDOR_NAME ,osb.BILL_NO ,    "+ 
                          "          to_char(osb.BILL_DT,'DD-MON-RRRR'),  "+
                          "          to_char(osb.BILL_AMT,'99999999999.09'),                        "+
                          "          'NA'              "+
                          "           from ORBL_SPBILL_DTL osb , ORBL_VENDOR_MST ovm    "+
                          "          where osb.BILL_REF_ID = ?                   "+
                          "          and ovm.VENDOR_CODE = osb.VENDOR                      "+
                          //"          and osb.URGENT_PAYMENT <> 'Y'                          "+
                          "          union all                                             "+
                          "          select 'N-'||BILL_ID bill_ref,                        "+
                          "          ood.VENDOR_NAME ,                                     "+
                          "          obd.BILL_NO ,                                         "+
                          "          to_char(obd.BILL_DATE,'DD-MON-RRRR'),                   "+
                          "          to_char(obd.BILL_AMOUNT,'99999999999.09'),                                       "+
                          "          decode(nvl(ood.ANNEX,'N'),'Y','Yes','N','No','Yes')    "+
                          "          from ORBL_BILL_DTL obd , ORBL_ORD_DTL ood              "+
                          "          where obd.BILL_REF_ID =  ?                         "+
                          "          and obd.ORDER_ID = ood.ORDER_ID                        "+
                          //"          and obd.URGENT_PAYMENT <> 'Y'                         "+
                          "          order by vendor_name ,bill_ref                                      "+
                          " ";   


%>

<div id="printBody">
<br/>
<br/>
<center>
<table class="tbl_1_style"  >
<tr>
<td class= "tbl_1_td1_style" > Date of Receipt at Finance</td>
<td class= "tbl_1_td2_style" > &nbsp;</td>
</tr>
<tr>
<td class= "tbl_1_td1_style" > Signature of Finance Executive </td>
<td class= "tbl_1_td2_style" > &nbsp; </td>
</tr>
<tr>
<td class= "tbl_1_td5_style" > Station Code </td>
<td class= "tbl_1_td6_style" > <%= gen_stn_cd_str  %> </td>
</tr>
</table>
<br/>
<table width=100% >
<tr>
<td align=left ><b>Ref :</b> &nbsp;&nbsp; <span class="print_style_1"><%= fin_ref_str  %></span> </td>
<td align=right> <b>Date :</b> <span class="print_style_1">  <%= fin_date_str  %> </span> </td>
</tr>
</table>
<br/>
<br/>

<table width=100%>
<tr>
<td align=left >
<%
ps = mk.con.prepareStatement(qryForAddr);
 rs = ps.executeQuery();

                            if(rs.next()){

%>
<%= rs.getString(1)  %>
<br/>
<%= rs.getString(2)  %>
<br/>
<%= rs.getString(3)  %>
<br/>
<%= rs.getString(4)  %>

<%

}
rs.close();
ps.close();

rs = null;
ps = null ;

%>
</td>
</tr>
</table>


<table width=100% >
<tr>
<td align=center class="sub_style_1" > Sub :<span class="stn_style_1" > Bills from &nbsp;<%= gen_stn_long_name  %> </span> </td>
</tr>
</table>
<br/>
<br/>
<table width=100% >
<tr>
<td align=left > &nbsp;&nbsp;&nbsp; Please find enclosed &nbsp; <%= total_bill %> &nbsp; number of bills amounting to Rs &nbsp; <%= total_bill_amt %>  a summary of which is given below.</td>
</tr>
<tr>
<td>
<% if(total_urgnt_pymnt_bill > 0){  %>
<!-- The bills for which Urgent Payment is required is mentioned in the last column. -->

<% } %>
</td>
</tr>
</table>

<br/>

<table width=100% class="dtl_tbl" >
<tr>
<th class="dtl_th" >
Sl
</th>
<th class="dtl_th">
Station Bill Ref
</th>
<th class="dtl_th" >Vendor Name</th>
<th class="dtl_th" >Bill Number </th>
<th class="dtl_th" >Bill Date</th>
<th class="dtl_th" >Bill Amount</th>
<th class="dtl_th" >Annexure attached</th>
</tr>
<%

ps = mk.con.prepareStatement(all_bill_dtl_qry);
ps.setString(1,fin_ref_id_str);
ps.setString(2,fin_ref_id_str);
 rs = ps.executeQuery();
int row_counter = 0;
                            while(rs.next()){
row_counter++;

%>

<tr>
<td class="dtl_td">
<%= row_counter  %>
</td>
<td class="dtl_td" >
<%= rs.getString(1)  %>
</td>
<td class="dtl_td" >
<%= rs.getString(2)  %>
</td>
<td class="dtl_td" >
<%= rs.getString(3)  %>
</td>
<td class="dtl_td"  >
<%= rs.getString(4)  %>
</td>
<td class="dtl_td" align=right >
<%= rs.getString(5)  %>
</td>
<td class="dtl_td" align=center >
<%= rs.getString(6)  %>
</td>



</tr>



<%
}
rs.close();
ps.close();
ps = null;
rs = null;


%>
<tr>
<td colspan=5 align=center class="dtl_td">
Total Bill Amount
</td>
<td class="dtl_td" align=right  >
<%= total_bill_amt  %>
</td>
<td class="dtl_td" >
</td>
</tr>
</table>

<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<table width=100% >
<tr>
<td align=left> <%= sysdateStr  %> </td>
<td align=right >-------------------------------------- </td>
</tr>
<tr>
<td align=right colspan=2 ><%= signatoryStr  %> &nbsp;&nbsp; </td>
</tr>

</table>

<br/>
<br/>
</div>

<p align=center> <input type=button value ="PRINT" onclick="printSpecial();"  /></p>



     
<%
}
    catch(Exception e){
        e.printStackTrace();
    }
    finally {
        mk.con.close() ;
    }
    
    
    
    //response.sendRedirect("vendorEntry.jsp?isDelDone=Y");
%>

</body>
</html>
