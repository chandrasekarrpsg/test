<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : change_dept      
    Created on : 19 Jan, 2013, 10:23:02 AM
    Author     : TAPAS 
--%>

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="VO.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/jquery-latest.js"></script>
        <script src="js/jquery.bpopup-0.7.0.min.js" type="text/javascript"></script>
        <script src="js/jquery.corner.js" type="text/javascript"></script>
        <script type="text/javascript" src="slideshowfade.js"></script>
 
        <link href="styles.css" rel="stylesheet" type="text/css" />
 
        <style type="text/css"> 
               #Slideshow1 img {position:absolute; left:20px;top:5px; width:150px;}
.style3 {
	font-size: 50px;
}
.style4 {
	text-align: center;
	padding-right: 5px;
	padding-top: 10px;
	font-weight: bold;
	font-size: 12px;
}

#logo {	
	height: 304px;
	width: 100%;
	background: url(big_img.jpg) left top no-repeat;
}
        </style>

        <script>
               function submitForm(){
 
                   document.getElementById('vndr_cd_h').value =  $('#'+$('#sel_fld_nm').attr("value")).attr("value");           
                   if(document.getElementById('vndr_cd_h').value == ''){
                       alert(' No record Found! ');
                       return false ;
                   }
                   //alert(document.getElementById('action_type_h').value );
                   srchFrm.submit();
               }
         
               function openSpcfkPg(url){
                        //alert(url);
                        // window.open(url,'mnfrm1');    
          
                        window.frames['mnfrm1'].location = url;   

                        //document.getElementById('mnfrm1').reload(true);
               }
         </script>

 <style>

    #singleFltr {
                 background-color:#289;
                 color:#000;
                 display:none;
                 padding:20px;
                 min-width:100px;
                 min-height: 100px;
    }

.bClose{
        cursor:pointer;
        position:absolute;
        right:10px;
        top:5px;
}
?

 </style>
    </head>
    <body bgcolor="#ff9a35"  >
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
%>

        <script type="text/javascript">
 
                var imgArray = new Array();
                imgArray[0] = "k1118050.jpg";
                imgArray[1] = "k1451470.jpg";
                imgArray[2] = "k4777200.jpg";
                imgArray[3] = "k7067130.jpg";
 
 
                slideshowFade('Slideshow1','',imgArray,20,5000);
    
        </script>

    <table width="100%" bgcolor="#ff9a35">
            <tr>
                <td colspan="2" height="100px" bgcolor="#8080c0" align="center">
                    
                    <div id="header" style="height: 100px">
	
	                 <div id="logo" style="height: 100px">
             <h2 style="height: 97px" class="style3">GENERATING STATION SYSTEMS</h2>
                         </div>  
                    </div>

                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                     Main Block 
                </td>
            </tr>
            <tr>
                <td  bgcolor="#cc5e87">
                    <table width="250px">
                         <tr>
                            <td>&nbsp;</td>
                         </tr>
                         <tr>
                            <td align="center"> <input type="button" value="   CHANGE DEPARTMENT     "  onclick="openSpcfkPg('change_dept.jsp');"  /> </td>
                         </tr>
                         <tr>
                            <td>&nbsp;</td>
                         </tr>
                         <tr>
                            <td>&nbsp;</td>
                         </tr>
                         <tr>
                            <td>&nbsp;</td>
                         </tr>
                         <tr>
                            <td>&nbsp;</td>
                         </tr>
                         <tr>
                            <td align="center"> <input type="button" value="               CLOSE               " onclick="window.close();" /> </td>
                         </tr>
                         <tr>
                            <td>&nbsp;</td>
                         </tr>
                         <tr>
                            <td>&nbsp;</td>
                         </tr>
                         <tr>
                            <td>&nbsp;</td>
                         </tr>
                         <tr>
                            <td>&nbsp;</td>
                         </tr>
                         <tr>
                            <td>&nbsp;</td>
                         </tr>
                         <tr>
                            <td>&nbsp;</td>
                         </tr>
                    </table>
                </td>
                <td> 
                     <iframe  src=""  name="mnfrm1"  width="800" height="500" style="border-left-width: 15px;border-top-width: 15px;border-style:solid;border-left-color:#dfe3e8  ;  border-top-color:#dfe3e8 "  ></iframe>
                </td>
            </tr>
        </table>

               <div id="singleFltr"    >
      <a class="bClose"><img src="cancel.png" width="20" height="20" id="clsImg" /></a>
        <br/>
        <br/>
        <table>
            <tr>
                <td>
                   Vendor Ref No :  &nbsp &nbsp
                </td>
                <td>
                    <select class="sel_flds" id="intrmdt_vndr_cd" style="display:none" action_tp ="I" >
<%
                    String intrmdt_vndr_cdQry = "  select distinct  VENDOR_CODE from ORBL_VENDOR_MST  where trim(TERMINATION_STATUS) = 'I' order by VENDOR_CODE "; 
                    ps = mk.con.prepareStatement(intrmdt_vndr_cdQry);
                    rs = ps.executeQuery();
                    while(rs.next()){
%>
                    <option value="<%= rs.getString(1)  %>"><%= rs.getString(1) %></option>
<%  } 
                    rs.close();
                    ps.close();
%>
                    </select>
                    <select id="recmmn_vndr_cd" style="display:none" class="sel_flds" action_tp ="R" >
<%
                    String recmnd_vndr_cdQry = "  select distinct  VENDOR_CODE from ORBL_VENDOR_MST  where TERMINATION_STATUS = 'R' order by VENDOR_CODE "; 
                    ps = mk.con.prepareStatement(recmnd_vndr_cdQry);
                    rs = ps.executeQuery();
                    while(rs.next()){
%>
                    <option value="<%= rs.getString(1)  %>"><%= rs.getString(1) %></option>
<%  } 
                    rs.close();
                    ps.close();
%>
                   </select>
                   <select id="apprv_vndr_cd" style="display:none" class="sel_flds" action_tp ="A"  >
<%
                    String apprv_vndr_cdQry = "  select distinct  VENDOR_CODE from ORBL_VENDOR_MST  where TERMINATION_STATUS = 'A' order by VENDOR_CODE "; 
                    ps = mk.con.prepareStatement(apprv_vndr_cdQry);
                    rs = ps.executeQuery();
                    while(rs.next()){
%>
                    <option value="<%= rs.getString(1)  %>"><%= rs.getString(1) %></option>
<%  } 
                    rs.close();
                    ps.close();
%>
                   </select>
                </td>
             </tr>
            
             <tr>
                 <td colspan="2"  align="center">
                   &nbsp;
                 </td>
            </tr>
            <tr>
               <td colspan="2"  align="center">
                     <input type="button" value="Query" onclick="submitForm(); $('#clsImg').click(); " />
               </td>
            </tr>
          </table>
        </div>

        <form name="srchFrm" action="vendor_pre_entry_intrmdt.jsp" target="mnfrm1" method="POST" >
           <input type=hidden  name="vndr_cd_h"  value="" />
           <input type=hidden  id= "action_type_h" name="action_type_h"   value="" />
           <input type=hidden  id="sel_fld_nm"   value="" />
        </form>

<%
    }
    catch(Exception e){
        e.printStackTrace();
    }
    finally {
        mk.con.close() ;
    }
%>
        <script>

            $('.snglfilter').bind('click', function(e) {

            // Prevents the default action to be triggered.

            e.preventDefault();

            //  var nm = $(this).attr("name");
            // alert(nm);
            //  $("#singleFltr_fldNm").text(nm);
            //  document.getElementById("singleFltr_fldNm").innerHTML = nm ;
            // Triggering bPopup when click event is fired
            // $('#singleFltr').css({display:'block'});
                           
            // $('#singleFltr').css({display:'none'});

            $('.sel_flds').css({display:'none'});

            //  alert($(this).attr("sel_mode"));

            $('#sel_fld_nm').attr("value",$(this).attr("sel_mode"));
            $('#action_type_h').attr("value",$('#'+$(this).attr("sel_mode")).attr('action_tp'));
            $('#'+$(this).attr("sel_mode")).css({display:'block'});
            $('#singleFltr').bPopup({opacity: 0.0});
            $('#singleFltr').corner("15px");

            });
        </script>
        <img alt="" src="cesclogo1.png" style="position:absolute; left:885px; top:40px" width="120" height="59"/>        

    </body>
</html>
 
