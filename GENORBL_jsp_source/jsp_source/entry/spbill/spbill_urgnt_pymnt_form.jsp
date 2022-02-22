<%--
    Document   : test1
    Created on : Jan 10, 2013, 11:33:41 AM
    Author     : Amalesh_gole
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
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
th.th1 { text-align: left;height:70px;width:220px;vertical-align:top; }
td.td1 { text-align: left;height:70px;width:260px;vertical-align:top; }
td.td2 { text-align: left;height:70px;width:20px;vertical-align:top; }
th.th2 { background-color: #e4e4e4; cursor: pointer;height:70px;width:300px;vertical-align:top; }

table.tbl_uper{ border-collapse: collapse; border: 1px solid #000;width:98%; }
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

.th1_addr{
text-align: left;height:70px;width:220px;vertical-align:top;
font-size: 13px;
}

.td2_addr{
text-align: left;height:70px;width:20px;vertical-align:top;
font-size: 13px;
}

.td1_addr{
text-align: left;height:70px;width:260px;vertical-align:top;
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


.highlight-selected-row{
 background-color: #d9a8b1;
}

td.betterhover, #_myTable2 tbody tr:hover {
 background:#e2e094;
}



.bgcolorEachcell{
 background-color:#aff2fa;
}


.vndr_nm_style_1{
font-size: 14px;
}

.invc_num_style_1{
font-size: 14px;
}


</style>




</head>
<body>

    
    <%
LoginBean loginBn = (LoginBean) request.getSession().getAttribute("loginBean");

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    
   
    String vndrCdStr = request.getParameter("spbil_ref_h")==null?"":request.getParameter("spbil_ref_h");
    String billTypeStr = request.getParameter("billtype_h")==null?"":request.getParameter("billtype_h");
   
    

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
                      "    from ORBL_CD_SEND_TO_ADDRESS  where TYP = 'U'  "+
                               "";
 

String qryForbillDtl =   "          select   ovm.VENDOR_NAME  , osb.BILL_NO ,   "+
                        "                   to_char(osb.BILL_DT,'dd-Mon-yyyy') ,  "+
                         "                  osb.BILL_AMT,  "+
                         "                  decode(osb.URGENTINVOICEATTACHED,'Y','Yes','N','No'),  "+
                        "                   nvl(to_char(osb.FINANCE_RECVD_DATE,'dd-Mon-yyyy'),' ') , to_char(sysdate,'dd-Mon-yyyy')   "+
                         "       from  ORBL_SPBILL_DTL osb , ORBL_VENDOR_MST ovm     "+
                          "       where osb.BILLREF = ?     "+
                          "      and osb.URGENT_PAYMENT = 'Y'                            "+
                         "       and ovm.VENDOR_CODE = osb.VENDOR  "+
                               "";
String qry_for_signatory = "";
String signatoryStr = "";

if(billTypeStr.equals("S")){

qryForAddr =   "    select nvl(ADDR1,' '), nvl(ADDR2,' '), nvl(ADDR3,' '), nvl(ADDR4,' ') "+
                      "    from ORBL_CD_SEND_TO_ADDRESS  where TYP = 'U'  "+
                               "";


qryForbillDtl =   "          select   ovm.VENDOR_NAME  , osb.BILL_NO ,   "+
                        "                   to_char(osb.BILL_DT,'dd-Mon-yyyy') ,  "+
                         "                  osb.BILL_AMT,  "+
                         "                  decode(osb.URGENTINVOICEATTACHED,'Y','Yes','N','No'),  "+
                        "                   nvl(to_char(osb.FINANCE_RECVD_DATE,'dd-Mon-yyyy'),' ')  ,"+
                        "                   to_char(sysdate,'dd/MM/yyyy')  ,                         "+
                         "                  nvl(osb.ORDNO,' ')  , "+
                         "                  nvl(to_char(osb.ORDDT,'dd/MM/yyyy'),' ')  "+
                         "       from  ORBL_SPBILL_DTL osb , ORBL_VENDOR_MST ovm     "+
                          "       where osb.BILLREF = ?     "+
                          "      and osb.URGENT_PAYMENT = 'Y'                            "+
                         "       and ovm.VENDOR_CODE = osb.VENDOR  "+
                               "";


qry_for_signatory = "  select SIGNATORY from ORBL_SIG_AUTH where STATION_CD = ?  ";

}else if(billTypeStr.equals("N")){

qryForAddr =   "    select nvl(ADDR1,' '), nvl(ADDR2,' '), nvl(ADDR3,' '), nvl(ADDR4,' ') "+
                      "    from ORBL_CD_SEND_TO_ADDRESS  where TYP = 'U'  "+
                               "";


qryForbillDtl =   "          select   od.VENDOR_NAME  , bd.BILL_NO ,   "+
                        "                   to_char(bd.BILL_DATE,'dd-Mon-yyyy') ,  "+
                         "                  bd.BILL_AMOUNT,  "+
                         "                  decode(bd.URGENTINVOICEATTACHED,'Y','Yes','N','No'),  "+
                        "                   nvl(to_char(bd.FINANCE_RECVD_DATE,'dd-Mon-yyyy'),' ') ,  "+
                        "                    to_char(sysdate,'dd/MM/yyyy'),              "+
                         "                  od.ORDER_NO , "+
                         "                  nvl(to_char(od.ORDER_DATE,'dd/MM/yyyy'),' ')  "+
                         "       from  ORBL_BILL_DTL bd , ORBL_ORD_DTL od     "+
                          "       where bd.BILL_ID =  ?     "+
                          "      and bd.ORDER_ID = od.ORDER_ID                            "+
                          "      and bd.URGENT_PAYMENT = 'Y'                            "+
                               "";



qry_for_signatory = "  select SIGNATORY from ORBL_SIG_AUTH where STATION_CD = ?  ";

}


%>

<div id="printBody">
<br/>
<br/>
<br/>
<br/>
<p align=right ><span class="style_annxr"> Annexure 4 </span> &nbsp;&nbsp;&nbsp;&nbsp;</p>
<center>
<table class="tbl_uper" >
<tr>
<td class="td1_upper">
  <p  align =center >  URGENT PAYMANT REQUEST FORM</p> 
</td>
</tr>
<tr>
<td class="td1_upper" >
  <table  width="98%" class="tbl1" >
<%
ps = mk.con.prepareStatement(qryForAddr);
 rs = ps.executeQuery();

                            if(rs.next()){

%>
<tr >
<th class="th1_addr"> &nbsp;&nbsp; Address To</th>
      <td class=td2_addr >:</td>
<td class=td1_addr >
<%= rs.getString(1)  %>
<br/>
<%= rs.getString(2)  %>
<br/>
<%= rs.getString(3)  %>
<br/>
<%= rs.getString(4)  %>

 </td>
</tr>
</table>
</td>
</tr>
<%

}
rs.close();
ps.close();

rs = null;
ps = null ;


ps = mk.con.prepareStatement(qry_for_signatory);
ps.setString(1,genStn);
 rs = ps.executeQuery();

                            if(rs.next()){
                              signatoryStr = rs.getString(1);   
                            }
rs.close();
ps.close();


rs = null;
ps = null ;

ps = mk.con.prepareStatement(qryForbillDtl);
 ps.setString(1, vndrCdStr);
 

   rs = ps.executeQuery();

                            if(rs.next()){

%>



<tr>
<td>
<table width="98%" class="tbl1"> 
  <tr>
      <th class="th1">
         1. &nbsp; Name Of Supplier 
      </th>
      <td class=td2 >:</td>
      <td class=td1 >
        <span class="vndr_nm_style_1" > <%=  rs.getString(1) %> </span>
      </td>
</tr>
  <tr>
     <th class="th1" >
      2. &nbsp; Invoice Number 
      </th>
      <td class=td2 >:</td>
      <td class=td1>
        <span class="invc_num_style_1" > <%=  rs.getString(2) %>  </span>
      </td>
</tr>
  <tr>
     <th class="th1" > 
      3. &nbsp;   Invoice Date 
      </th>
      <td class=td2 >:</td>
      <td class=td1 >
         <%=  rs.getString(3) %> 
      </td>
</tr>
  <tr>
     <th class="th1" > 
        4. &nbsp;  Invoice Amount(Rs.)
      </th>
      <td class=td2 >:</td>
      <td class= td1 >
<%

 DecimalFormat df = new DecimalFormat("#.00");

%>
         <%=   df.format(Double.parseDouble(rs.getString(4))) %> 
      </td>
</tr>
<tr>
     <th class="th1" >
       5. &nbsp; Whether Invoice is attached to the form
      </th>
      <td class=td2 >:</td>
      <td class=td1 >
        <div class=td1_blk_1>
         <%=  rs.getString(5) %>
        </div>
      </td>
</tr>
<tr>
     <th class="th1" >
  6. &nbsp;If Pt.(5) is NO, then date of receipt at finance of the lot in which the concerned bill was sent.
    Finance Received Date
      </th>
      <td class=td2 >:</td>
      <td class = td1 >
        <div class=td1_blk_1>
       <%  if(rs.getString(5).equals("No")){  %>
         <%=  rs.getString(6) %>
        <% }else{ %>
          NA
        <% }%>
        </div>
      </td>
</tr>





      
      
    </table>  

<br/><br/>
<br/><br/>
<br/><br/>
<table width=100% >
<tr>
<td align=left width=40% >
</td>
<td width=20% >
</td>
<td align=center  style="font-size:10pt;" width=40%  >
&nbsp;&nbsp; &nbsp;  
</td>
</tr>
<tr>
<td align=left width=40% >
------------------------------------------ 
</td>
<td width=20% >
</td>

<td align=right width=40%  >
---------------------------------------------
</td>
</tr>
<tr>
<td align=left width=40% >
Signature of Appropriate Authority
</td>
<td width=20% >
</td>

<td align=right width=40%  >
Designation of Appropriate Authority
</td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
</tr>

</table>
</td>
</tr>
</table>
<p align=left> <u>Order No.</u> &nbsp; <%= rs.getString(8)  %> &nbsp;&nbsp;  Date: &nbsp; <%= rs.getString(9)  %> </u></p>
</center>
</div>

<%
    }
       rs.close();
       ps.close();
       
      %>
 
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
