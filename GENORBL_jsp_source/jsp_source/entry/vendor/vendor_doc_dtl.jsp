<%--
    Document   : test1
    Created on : Jan 10, 2013, 11:33:41 AM
    Author     : Amalesh_gole
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.io.File"%>
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



  function showPdfDoc(fileStr){
pdfReadFrm.pdfReltvPath_h.value = fileStr ;
pdfReadFrm.submit();

}


</script>




<style type="text/css" media="screen">


body { background-color: #ffffff; font: 16px Helvetica, Arial; color: #000; }
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



    #popup1 { 
    background-color:#289;
    border-radius:15px;
    color:#000;
    display:none; 
    padding:20px;
    min-width:400px;
    min-height: 180px;
}
.bClose{
    cursor:pointer;
    position:absolute;
    right:10px;
    top:5px;
}

</style>




</head>
<body>

    
    <%
LoginBean loginBn = (LoginBean) request.getSession().getAttribute("LoginBean");

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    FileHandling flhndl = new FileHandling();
   
    String vndrCdStr = request.getParameter("vndr_cd_h")==null?"":request.getParameter("vndr_cd_h");
   
    String genStn = "016";

    try {
        PreparedStatement ps = null ;
        ResultSet rs = null ;


 String ipAddress = request.getRemoteAddr();
 
  String build_dir = "/san304/j2eegen/GENORBL/genorbl/build/web/";
        
          String tmp_folder = ipAddress;
          String tmp_dir = build_dir+tmp_folder+"/";
          File theDir = new File(tmp_dir);

  // if the directory does not exist, create it
  if (!theDir.exists())
  {
    System.out.println("creating directory: " + tmp_dir);
    theDir.mkdir();
  }else{
         System.out.println("in  delete and creating directory: " + tmp_dir);
           flhndl.deleteFolder(theDir);
         System.out.println("in  delete successful  ");
         
              theDir.mkdir();
  }

       
String scnDocSrc = "";
          
          
 
String userDtls = "";
//userDtls = ipAddress+":"+loginBn.getsEmpCd();
String usrEmpCd = "977471" ;
userDtls = ipAddress+":"+"977471";
System.out.println("  userDtls :  "+userDtls);

String qryForVndrPrsnlDtls = "  select dm.DOC_TYPE_CODE,     "+
                        "         nvl(trim(dd.DOC_FILENAME),'N'),             "+
                        "          nvl(dd.DOC_FILEPATH,' '),                "+
                        "           decode(nvl(dd.DOC_STATUS,' '),'0','NA','1','<font color=#f90000 >Not Rcvd</font>','2','Received',' ','Not Uploaded'),               "+
                        "           nvl(dd.DOC_NUMBER,' ')      ,          "+                       
                        "           nvl(dm.DOC_TYPE_DESC,' ')            "+     
                        "  from ORBL_VENDOR_DOC_DTL  dd ,    "+
                        "   ORBL_VENDOR_DOC_MST dm                              "+
                        "  where dm.DOC_TYPE_CODE = dd.DOC_TYPE_CODE(+)  "+ 
                        "   and  dd.VENDOR_CODE(+) = ?                            "+
                        "  order by dm.DOC_TYPE_CODE   "+
                        "";

%>


<table class="sortable"    width="98%" id="_myTable2">
    <thead>
  <tr>
      <th >
           NAME
      </th>
       <th >
           STATUS
      </th>

      <th >
           DOC NO
      </th>
      <th >
          SCAN DOC
      </th>
  </tr>
</thead>
    <tbody>
<%

ps = mk.con.prepareStatement(qryForVndrPrsnlDtls);
 ps.setString(1, vndrCdStr);
 //ps.setString(2, genStn);
 

   rs = ps.executeQuery();

                            while(rs.next()){
if(!rs.getString(3).trim().equals("")){
scnDocSrc =  rs.getString(3) ;
}
%>




  
 
  <tr>
     <td>
          <%= rs.getString(6) %>
      </td>
     <td>
          <%= rs.getString(4) %>
      </td>
      <td>
          <%= rs.getString(5) %>
      </td>
      <td>         
           <% if(!rs.getString(2).equals("N") ){ %>
         <!-- img src="<%= tmp_folder+"/"+rs.getString(2) %>?<%= new java.util.Date() %>" width="50" height="50" class="scan_img"   /-->
<a href="#" onclick="showPdfDoc(this.src);"   width="20" height="20" src="<%= tmp_folder+"/"+ rs.getString(2) %>" >
            View
       </a> 
          <%  }else if(!rs.getString(4).equals("NA")){ %>
             No Doc
          <%  } %>
      </td>
  </tr>
    
      
   
   
      <%
           }
       rs.close();
       ps.close();
       
      System.out.println(" scnDocSrc: "+scnDocSrc); 
          File srcFolder = new File(scnDocSrc);
        File destFolder = new File(tmp_dir);
     if(srcFolder.exists()){
     flhndl.copyFolder(srcFolder , destFolder);
      } 
       
      %>
      
      
      
 
  </tbody>
 
 </table>


<form name="pdfReadFrm" action ="readPdfDoc" method=POST target="_blank" >
<input type="hidden" name ="pdfReltvPath_h" value ="" />
</form>


<div id="popup1"  >
         <a class="bClose"><img src="cancel.png" width="20" height="20" /><a/>
        <br/>
      <a href="#" >  <img src="clockimg2.jpg" width="20" height="20"  class="plus"   /></a>
 <a href="#" >  <img src="anticlockimg3.jpg" width="20" height="20"  class="minus"   /></a>
<br/>
<div id="lrgimg1cntnr"  >  
   <img id="largeImg1" src="" width="600" height="600" /> 

</div>
     </div>

      
      
      <script>
          
          $(window).bind('load', function() {
              
               $('.scan_img').bind('click', function(e) {
           document.getElementById('lrgimg1cntnr').innerHTML="<img id=\"largeImg1\" src=\""+$(this).attr('src')+"\" width=\"600\" height=\"600\" /> ";
            
             

                // Prevents the default action to be triggered. 
                e.preventDefault();

                // Triggering bPopup when click event is fired
                //$('#popup1').bPopup({opacity: 0.0});
               window.open("blank_image.jsp?scan_img_src="+$(this).attr('src'),"_blank","height=" + screen.height + ",width=" + screen.width + ",toolbar=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0") ; 
           
            });
          });
      </script>

     
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