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



table.sortable {
  background-color: #e4e4e4;
  font-size: 12px;
  
}




table.sortable td {
  color: #4d4d4d;
  padding: 5px;
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

String qryForVndrPrsnlDtls = "  select VENDOR_NAME,             "+
                        "         nvl(ADDRESS_BBGS,' '),             "+
                        "          nvl(ADDRESS1,' '),                "+
                        "           nvl(ADDRESS2,' '),               "+
                        "           nvl(ADDRESS3,' '),                "+
                        "            nvl(ADDRESS4,' '),               " +
                        "            nvl(CONTACT_PERSON,' '),          "+
                        "             nvl(TEL_NO,' '),                 "+
                        "             nvl(FAX_NO,' '),                 "+
                        "           nvl(MOBILE_NO,' '),                "+
                        "            nvl(EMAIL_ID,' '),                "+
                        "            nvl(WEBSITE,' '),                "+
                        "           nvl(WORK_AREA,' ')                "+
                        "  from ORBL_VENDOR_MST                                "+
                        "  where VENDOR_CODE = ?                            "+
                        "";




ps = mk.con.prepareStatement(qryForVndrPrsnlDtls);
 ps.setString(1, vndrCdStr);
 

   rs = ps.executeQuery();

                            if(rs.next()){

%>




  <table class="sortable"    width="98%" id="_myTable2">
 
  <tr>
      <th >
          NAME
      </th>
      <td>
          <%= rs.getString(1) %>
      </td>
  </tr>
      <tr>
      <th >
          ADDRESS
      </th>
      <td>
          <%= 
              rs.getString(3)+" <br/>  "+
              rs.getString(4)+" <br/>  "+rs.getString(5)+" <br/>  "+rs.getString(6) 
          %>
      </td>
  </tr>
      <tr>
      <th >
          CONTACT PERSON
      </th>
      <td>
          <%= rs.getString(7) %>
      </td>
  </tr>
      <tr>
      <th >
          TEL NO
      </th>
      <td>
          <%= rs.getString(8) %>
      </td>
  </tr>
       <tr>
      <th >
          FAX
      </th>
      <td>
          <%= rs.getString(9) %>
      </td>
  </tr>
       <tr>
      <th >
          MOB NO
      </th>
      <td>
          <%= rs.getString(10) %>
      </td>
  </tr>
       <tr>
      <th >
          EMAIL ID 
      </th>
      <td>
          <%= rs.getString(11) %>
      </td>
  </tr>
       <tr>
      <th >
          WEBSITE
      </th>
      <td>
          <%= rs.getString(12) %>
      </td>
  </tr>
        <tr>
      <th >
          WORK AREA
      </th>
      <td>
          <%= rs.getString(13) %>
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
