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


</script>



<style type="text/css" media="screen">


body { background-color: #ffffff ; font: 16px Helvetica, Arial; color: #000; }
table{ border-collapse: collapse; border: 1px solid #000; }
th, td { border: 1px solid #000;text-align: left; }
th { background-color: #e4e4e4; cursor: pointer; }

.ugntTbl1{
  background-color: #f4f295;

}
.cnclTbl1{
  background-color: #d8d7cd;
}

table.sortable {
  background-color: #e4e4e4;
  font-size: 12px;
  
}


.dataStyle1{
font-size: 12px;
color: #0606ff ;
}

table.sortable td {
  color: #4d4d4d;
  padding: 5px;
}


.spl_stl_1{
color:blue;
}


   .header1 thead tr th{
    font-size: 12px;
    font-weight: bold;
    background-color: #CCCCCC;
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
LoginBean loginBn = (LoginBean) request.getSession().getAttribute("LoginBean");

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    
   
    String vndrCdStr = request.getParameter("spbil_ref_h")==null?"":request.getParameter("spbil_ref_h");
   
    

    try {
        PreparedStatement ps = null ;
        ResultSet rs = null ;
        PreparedStatement ps2 = null ;
        ResultSet rs2 = null ;


 String ipAddress = request.getRemoteAddr();
String userDtls = "";
//userDtls = ipAddress+":"+loginBn.getsEmpCd();
String usrEmpCd = "977471" ;
userDtls = ipAddress+":"+"977471";
System.out.println("  userDtls :  "+userDtls);




String qryForVndrPrsnlDtls =   "          select distinct  BILLREF,                                     "+
                               "                  trim(amp.EMP_FNAME)||'  '||trim(amp.EMP_LNAME),       "+       
                               "                 to_char(BILL_RELEASE_DATE,'dd-Mon-yyyy'),              "+
                               "                 ocu.UNIT_DESC,              "+
                               "                  decode(JOBTYPE,'M','Maintenance','O','Operational'),              "+
                               "                 nvl(ORDNO,' '),              "+
                               "                nvl(to_char(ORDDT,'dd-Mon-yyyy'),' '),              "+
                               "               BILL_NO,              "+
                               "              nvl(to_char(BILL_DT,'dd-Mon-yyyy'),' '),              "+
                               "             to_char(BILL_AMT,'99999999999.09'),              "+
                               "                 nvl(to_char(JOB_MONTH,'dd-Mon-yyyy'),' '),              "+
                               "                decode(BILL_STATUS,'1','Actual','0','Provisional'),              "+
                               "               nvl(DESCRIP,' '),              "+
                               "              nvl(osb.REMARKS,' '),            "+  
                               "             ocp.PLANT_DESC,              "+
                               "            oce.EQUIPMENT_DESC,            "+  
                               "           ovm.VENDOR_NAME         ,     "+
                               "          nvl(ohds.SUB_MENU,' '),              "+
                               "         nvl(ERP_AC,' '),              "+
                               "        nvl(to_char(BILL_REF_ID),' '),           "+   
                               "       nvl(to_char(FINANCE_RECVD_DATE,'dd-Mon-yyyy'),' '),      "+        
                               "      decode(nvl(URGENT_PAYMENT,' '),'Y','Yes','N','No',nvl(URGENT_PAYMENT,' ')),            "+  
                               "       decode(nvl(URGENTINVOICEATTACHED,' '),'Y','Yes','N','No',nvl(URGENTINVOICEATTACHED,' ')),  "+       
                               "       nvl(URGENT_REMARKS,' '),              "+
                               "       decode(nvl(BILL_CANCEL,'N'),'N','No','Y','Yes'),              "+
                               "      nvl(BILL_CANCEL_BY,' '),             "+ 
                               "      nvl(to_char(BILL_CANCEL_DATE,'dd-Mon-yyyy'),' '),             "+ 
                               "      nvl(BILL_CANCEL_REMARKS,' '),            "+  
                               "      osb.CRT_BY,              "+
                               "      to_char(osb.CRT_DT,'dd-Mon-yyyy'),              "+
                               "      to_char(osb.UPD_DT,'dd-Mon-yyyy'),              "+
                               "      to_char(BILL_RECEIVED_DATE,'dd-Mon-yyyy')   ,"+
                               "				  cs.STATION_LONG_DESC ,          "+
                               "				  ocd.ORDER_DEPT           "+
                               "      from ORBL_SPBILL_DTL  osb , ADM_EMP_MST amp , "+
                               "			   ORBL_CD_PLANT ocp   , ORBL_CD_EQUIPMENT oce ,"+
                               "			   ORBL_VENDOR_MST ovm , ORBL_CD_DEPT ocd ,  "+
                               "                            CD_STATION cs , ORBL_CD_UNIT ocu , ORBL_HEADS ohds "+ 
                               "       where osb.BILLREF = ?  "+
                               "			   and amp.EMP_CODE(+) = osb.CERT_BY "+
                               "			   and ocp.PLANT_REF(+) = osb.PLANT_REF   "+
                               "			   and ocp.STATION(+) = osb.STATION   "+
                               "			   and oce.EQUIPMENT(+) = osb.EQREF  "+
                               "			   and oce.STATION(+) = osb.STATION  "+
                               "			   and ovm.VENDOR_CODE(+) = osb.VENDOR   "+
                               "			   and cs.ORBL_STATION_CD(+) = osb.STATION   "+
                               "			   and ocd.DEPT(+) = osb.DEPT   "+
                               "                           and ocd.STATION(+) = osb.STATION "+
                               "			   and ocu.UNIT_NO(+) = osb.UNIT_NO   "+
                               "                           and ocu.STATION(+) = osb.STATION "+
                               "			   and ohds.BUDGET_HEAD(+) = osb.BUDG_AC   "+
                               "";
 




String userNameQry = " select trim(EMP_FNAME)||'  '||trim(EMP_LNAME)  from ADM_EMP_MST where EMP_CODE = ?";

String cancl_by_str = "";

System.out.println("  qryForVndrPrsnlDtls:   "+qryForVndrPrsnlDtls+"  billref :  "+vndrCdStr);
ps = mk.con.prepareStatement(qryForVndrPrsnlDtls);
 ps.setString(1, vndrCdStr);
 

   rs = ps.executeQuery();

                            if(rs.next()){


ps2 = mk.con.prepareStatement(userNameQry);
 ps2.setString(1, rs.getString(26) );


   rs2 = ps2.executeQuery();

                            if(rs2.next()){
                               cancl_by_str = rs2.getString(1) ;
                            }

rs2.close();
ps2.close();
%>



<p align =center>  &nbsp; &nbsp <span class="dataStyle1" ><%=  rs.getString(33) %> </span>  &nbsp;&nbsp&nbsp;
 Department : &nbsp; &nbsp; <span class="dataStyle1" > <%=  rs.getString(34) %> </span>  &nbsp; &nbsp; Reference Number  &nbsp: &nbsp<span class="dataStyle1" > <%=  rs.getString(1) %>  </span> </p>
  <table class="sortable"    width="98%" id="_myTable2">
 
  <tr>
      <th>
         Bill Certified By  
      </th>
      <td>
         <%=  rs.getString(2) %> 
      </td>
     <th>
         Bill Release Date 
      </th>
      <td>
         <%=  rs.getString(3) %> 
      </td>
     <th> 
         Unit 
      </th>
      <td>
         <%=  rs.getString(4) %> 
      </td>
     <th> 
         Job Type 
      </th>
      <td>
         <%=  rs.getString(5) %> 
      </td>
     
</tr>
<tr>
      <th>
         Order No
      </th>
      <td>
         <%=  rs.getString(6) %> 
      </td>
     <th> 
        Order Date
      </th>
      <td>
         <%=  rs.getString(7) %> 
      </td>
     <th> 
         Bill No 
      </th>
      <td>
       <span class="spl_stl_1" >  <%=  rs.getString(8) %>  </span>
      </td>
     <th> 
        Bill Date
      </th>
      <td>
        <span class="spl_stl_1" > <%=  rs.getString(9) %> </span>
      </td>
     
</tr>
<tr>
      <th>
         Bill Amount 
      </th>
      <td>
        <span class="spl_stl_1" > <%=  rs.getString(10) %>  </span>
      </td>
     <th> 
        Job Month
      </th>
      <td>
         <%=  rs.getString(11) %> 
      </td>
     <th> 
         Bill Status 
      </th>
      <td>
         <%=  rs.getString(12) %> 
      </td>
     <th> 
      </th>
      <td>
      </td>
     
</tr>

<tr>
      <th>
        Description
      </th>
      <td colspan = 7>
         <%=  rs.getString(13) %>
      </td>

</tr>
<tr>
      <th>
        Remarks
      </th>
      <td colspan = 7>
         <%=  rs.getString(14) %>
      </td>

</tr>
<tr>
      <th>
        Plant
      </th>
      <td colspan = 3>
         <%=  rs.getString(15) %>
      </td>
      <th>
        Equipment
      </th>
      <td colspan = 3>
         <%=  rs.getString(16) %>
      </td>
</tr>
<tr>
      <th>
        Vendor
      </th>
      <td colspan = 7>
         <%=  rs.getString(17) %>
      </td>

</tr>

<tr>
      <th>
        Budget Head
      </th>
      <td colspan = 3>
         <%=  rs.getString(18) %>
      </td>
      <th>
        ERP A/c. 
      </th>
      <td colspan = 3  >
        <span class="spl_stl_1" >  <%=  rs.getString(19) %> </span>
      </td>
</tr>
<tr>
      <th>
          Bill ref Id
      </th>
      <td colspan = 3>
         <%=  rs.getString(20) %>
      </td>
      <th>
        Finance Received Date
      </th>
      <td colspan = 3>
         <%=  rs.getString(21) %>
      </td>
</tr>



 </table>
<table width=98% class="ugntTbl1" >
<tr>
<td width=60% align=left>
Urgent Payment Required  : <%=  rs.getString(22) %>  
<%  if(rs.getString(22).equals("Yes")){
%>

<a href="spbill_urgnt_pymnt_form.jsp?spbil_ref_h=<%= rs.getString(1) %>&billtype_h=S" target='_blank' > View Urgent Payment Request Form </a>
<%
     }
  %>  
<br/> 
 Will Invoice be attached  : <%=  rs.getString(23) %>   
<br/>
Urgent Payment Remarks : <%= rs.getString(24)  %> 
</td>
</tr>
</table>
<%  if(rs.getString(25).equals("Yes")){  %>
<table width=98% class="cnclTbl1" >
<tr>
<td width=60% >
Bill Cancelled : <%=  rs.getString(25) %>
<br/>
Cancelled By  : <%=  cancl_by_str  %> 
<br/>
Cancellation Date  : <%=  rs.getString(27) %>
<br/>
Cancellation Remarks  : <%=  rs.getString(28) %> 
</td>
  </tr>
</table> 
<%  } %>
      <%
           }else{
%>
<p align =center> No Record Exists</p>
<%
    }
       rs.close();
       ps.close();
       
      %>
      
      
      
 




     
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
