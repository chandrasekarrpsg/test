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




</script>




<style type="text/css" media="screen">


body { background-color: #ffffff; font: 16px Helvetica, Arial; color: #000; }
table{ border-collapse: collapse; border: 1px solid #000; }
th, td { border: 1px solid #000; text-align: left; }
th { background-color: #e4e4e4; cursor: pointer;  }



table.sortable {
  background-color: #e4e4e4;
  font-size: 12px;
  
}




table.sortable td {
  color: #4d4d4d;
  padding: 5px;
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

.wglblty_cls{
  color: #d06a51;
  font-weight:bold;
}


</style>




</head>
<body>

    
    <%
LoginBean loginBn = (LoginBean) request.getSession().getAttribute("LoginBean");

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    
   
    String vndrCdStr = request.getParameter("vndr_cd_h")==null?"":request.getParameter("vndr_cd_h");
   
    

    try {
        PreparedStatement ps = null ;
        ResultSet rs = null ;


 String ipAddress = request.getRemoteAddr();
String userDtls = "";
//userDtls = ipAddress+":"+loginBn.getsEmpCd();
String usrEmpCd = "977471" ;
userDtls = ipAddress+":"+"977471";
System.out.println("  userDtls :  "+userDtls);

String qryForVndrPrsnlDtls = " select   nvl(decode(nvl(PROPOSING_DEPT,' '),' ',' ', dm.DEPT_SDESC  ),' ')     ,            "+
                        "         nvl(sm.STATION_SHT_DESC,' '),             "+
                        "          nvl(PROPOSING_NAME,' '),                "+
                        "           nvl(to_char(PROPOSING_DATE,'DD/MM/YYYY'),' '),                "+
                        "            nvl(RECOMMENDATION_NAME,' '),               " +
                        "             nvl(to_char(RECOMMENDATION_DATE,'DD/MM/YYYY'),' '),                 "+
                        "           nvl(APPROVER_NAME,' '),                "+
                        "            nvl(to_char(APPROVAL_DATE,'DD/MM/YYYY'),' '),                "+
                        "           nvl(TERMINATOR_NAME,' ')   ,             "+
                        "            decode(nvl(VENDOR_STATUS,' '),'T','TERMINATED',' '),                "+
                        "            nvl(REMARKS,' '),                "+
                        "            nvl(to_char(TERMINATION_DATE,'DD/MM/YYYY'),' '),                "+
                        "            nvl(decode(nvl(vm.WAGELIAB,' '),'Y','Yes','N','No',vm.WAGELIAB),' ')     "+
                        "  from ORBL_VENDOR_MST vm  , ORBL_CD_DEPT_MST   dm  ,  CD_STATION sm        "+
                        "  where vm.VENDOR_CODE = ?                            "+
                        "  and   dm.DEPT(+) = vm.PROPOSING_DEPT                     "+
                        "	  and sm.ORBL_STATION_CD(+) = vm.PROPOSING_STN         "+
                        "";




ps = mk.con.prepareStatement(qryForVndrPrsnlDtls);
 ps.setString(1, vndrCdStr);
 

   rs = ps.executeQuery();

                            if(rs.next()){

%>




  <table class="sortable"    width="98%" id="_myTable2">
 
  <tr>
      <th width=45% >
          Proposing Stn 
      </th>
      <td>
          <%= rs.getString(2) %>
      </td>
  </tr>
      <tr>
      <th >
          Proposing Dept
      </th>
      <td>
          <%= 
              rs.getString(1)
          %>
      </td>
  </tr>
      <tr>
      <th >
          Proposed By 
      </th>
      <td>
          <%= rs.getString(3) %>
      </td>
  </tr>
      <tr>
  </tr>
       <tr>
      <th >
          Proposing Date 
      </th>
      <td>
          <%= rs.getString(4) %>
      </td>
  </tr>
       <tr>
      <th >
          Recom By
      </th>
      <td>
          <%= rs.getString(5) %>
      </td>
  </tr>
       <tr>
      <th >
          Recom Date 
      </th>
      <td>
          <%= rs.getString(6) %>
      </td>
  </tr>
         <tr>
      <th >
          Apprvd By
      </th>
      <td>
          <%= rs.getString(7) %>
      </td>
  </tr>
        <tr>
      <th >
          Apprv Date
      </th>
      <td>
          <%= rs.getString(8) %>
      </td>
  </tr>
  <tr>
      <th >
          Wage Liability 
      </th>
      <td>
         <span class="wglblty_cls"> <%= rs.getString(13) %> </span>
      </td>
  </tr>

        <tr>
      <th >
          Terminated By
      </th>
      <td>
          <%= rs.getString(9) %>
      </td>
  </tr>
        <tr>
      <th >
          Termination Status
      </th>
      <td>
          <%= rs.getString(10) %>
      </td>
  </tr>
        <tr>
      <th >
          Terminator Remarks
      </th>
      <td>
          <%= rs.getString(11) %>
      </td>
  </tr>
      <tr>
      <th >
          Termination Date
      </th>
      <td>
          <%= rs.getString(12) %>
      </td>
  </tr>
      
      
 
 </table>
      
   
   
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