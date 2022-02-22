<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : vendorSearch
    Created on : 12 Jan, 2013, 10:23:02 AM
    Author     : Sony
--%>

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="VO.*" %>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="js/jquery-latest.js"></script>
     <script src="js/jquery.bpopup-0.7.0.min.js" type="text/javascript"></script>
     <script src="js/jquery.corner.js" type="text/javascript"></script>
<script type="text/javascript" src="slideshowfade.js"></script>
 
<link href="styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/cssverticalmenu_for_spbill.css" />
        <script type="text/javascript" src="js/cssverticalmenu.js"></script>
<script type='text/JavaScript' src='js/best_cal_ag.js'></script>
 <link href="css/autocomplete.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="js/jquery.autocomplete.js"></script>



 
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
.menu_style_1{
background-color:#8e91f2 ;
}
.menu_div_style_1{
width:150px;
}

#logo {	
		height: 304px;
		width: 100%;
		background: url(big_img.jpg) left top no-repeat;
}




</style>

     
     <script>

String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g, "");
};

var http = getHTTPObject();

function getHTTPObject() {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}


var prev_bill_frm_dt = "";
var prev_bill_to_dt = "";


function getDtlsFrmDb(typeStr,stn,dept,empcd,admin_mkr)
{

if(document.getElementById("spbill_frm_dt_fld").value != prev_bill_frm_dt || document.getElementById("spbill_to_dt_fld").value != prev_bill_to_dt){
prev_bill_frm_dt = document.getElementById("spbill_frm_dt_fld").value ;
prev_bill_to_dt = document.getElementById("spbill_to_dt_fld").value ;
}else{
return false;
}


var url1 ="";
var params = "";
var ajaxNm = "spbill_fetch_dtls_frmDb.jsp";

 url1 = ajaxNm;
 params = "callName="+typeStr+"&"+
           "frm_dt="+document.getElementById("spbill_frm_dt_fld").value+"&"+
           "to_dt="+document.getElementById("spbill_to_dt_fld").value+"&"+
           "stn_str="+stn+"&"+
           "dept_str="+dept+"&"+
           "emp_cd_str="+empcd+"&"+
           "admin_mkr_str="+admin_mkr+"&"+
           "action_type_str="+$('#action_type_h').attr("value")+"&"+
           "";
//alert(params);
$('#loadingPopup').bPopup({opacity: 0.4});
$('#loadingPopup').corner("15px");

http.open("POST", url1, true);
http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http.onreadystatechange = function()
   {
        if(http.readyState == 4 && http.status == 200)
        { 
         if(typeStr == 'SPBILLNO_VNDRNM'){
            //alert(http.responseText);
            results = http.responseText;
            var select ="";
             var billNo_vndrNmSelArr = results.split("|"); 
             select = document.getElementById("spbill_no_sel");
             select.options.length = 0;

             for(var i=0;i<billNo_vndrNmSelArr.length;i++){
                  if(billNo_vndrNmSelArr[i].trim() != ''){
                 var billNoVndrNmSelTxtValArr = billNo_vndrNmSelArr[i].split("~");
                 select.options[select.options.length] = new Option(billNoVndrNmSelTxtValArr[1], billNoVndrNmSelTxtValArr[0]); 
                  }
             }
          }
         $("#loadingPopup").bPopup().close();
          
         $('#'+$('#sel_fld_nm').attr("value")).autocomplete({
                       source:"#spbill_no_sel",
                       wrap_div_id:"#wrap_auto_complt1",
                        onKeyPress:function(){
                        var o=this;
                        setTimeout(function(){
                                o.ac.val(o.ac.val());
                        },50);
                        },
                        fillin:true ,
                        resize_accrd : true,
                        val_store_ele : "#edt_spbl_cd_val"

                });


        }
  }




http.send(params);



}




         function submitForm(){
            

 document.getElementById('spblref_h').value =  $('#'+$('#sel_fld_nm').attr("value")).attr("value");        

document.getElementById('spblref_h').value = $('#'+$('#'+$('#sel_fld_nm').attr("value")).attr("hidden_val_fld")).attr("value");

//alert(document.getElementById('spblref_h').value+"  "+$('#sel_fld_nm').attr("value"));   
if(document.getElementById('spblref_h').value == ''){
if($('#action_type_h').attr("value") == 'E' || $('#action_type_h').attr("value") == 'T'){
alert(' Please Enter valid Special Bill Ref ! ');
}else{
alert(' No record Found! ');
$("#singleFltr").bPopup().close();
}
return false ;
}else{

var val = $("#spblref_h").val();
var orignalValue = val;
val = val.replace(/[0-9]*/g, "");
var msg = "Only Integer Values allowed.";
if (val != '') {
orignalValue = orignalValue.replace(/([^0-9].*)/g, "")
$("#spblref_h").val(orignalValue);
alert(msg);
return false ;
}

}
//alert(document.getElementById('spblref_h').value );
 srchFrm.submit();
$("#singleFltr").bPopup().close();
     
    }
         
         
         function openSpcfkPg(url){
             //alert(url);
         // window.open(url,'mnfrm1');    
          
          
         window.frames['mnfrm1'].location = url;   
         //document.getElementById('mnfrm1').reload(true);
         
         }
         
         
         
         
         
     </script>

 <style>

   #loadingPopup {
    background-color:#289;
    color:#000;
    display:none;
    padding:20px;
    min-width:100px;
    min-height: 100px;
}



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


        </style>
     
    </head>
    <body bgcolor="#ff9a35"  >



<%
LoginBean loginBn = (LoginBean) request.getSession().getAttribute("loginBean");

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    FileHandling flhndl = new FileHandling();
   
    String vndrCdStr = request.getParameter("vndr_cd_h")==null?"":request.getParameter("vndr_cd_h");

    String userCdStr = loginBn.getsEmpCd();
    String userStation = loginBn.getsGenStn();
    String userdept  = loginBn.getsDept();
    String adminMkr  = request.getParameter("admin_mkr_h")==null?"":request.getParameter("admin_mkr_h");
    

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
    <h2 style="height: 97px" class="style3">GENERATION DIVISION</h2>
    </div>  
 </div>

                    
                    
                </td>
            </tr>
            <tr>
                <td>

                </td>
                 <td align=center >
                     Special Bill Entry Screen 
                 </td>
            </tr>
             <tr>
                <td  class="menu_style_1" >
                    <div class="menu_div_style_1" >

                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#" onclick="openSpcfkPg('spbillEntry.jsp');" id="btn1"  >NEW ENTRY</a></li>
                              </ul>
                         <br/>
                         <br/>
                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#" class="snglfilter" sel_mode="edt_spbl_cd"  action_tp="C"  >BILL CANCEL</a></li>
                              </ul>
                         <br/>
                         <br/>
                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#"  class="snglfilter" sel_mode="edt_spbl_cd"  action_tp="E"  >EDIT</a></li>
                              </ul>
                         <br/>
                         <br/>
                             <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#" onclick="window.close();" >CLOSE</a></li>
                              </ul>

            </div>
                </td>
                 <td> 
                     <iframe  src="blank_pg_for_sp_vndr.html"  name="mnfrm1"  width="810" height="540" style="border-left-width: 15px;border-top-width: 15px;border-style:solid;border-left-color:#dfe3e8  ;  border-top-color:#dfe3e8 "  ></iframe>
                 </td>
            </tr>
        </table>
        




         <div id="singleFltr"    >
          <a class="bClose"><img src="cancel.png" width="20" height="20" id="clsImg" /></a>
        <br/>
         <br/>
        <table>
           
            <tr>
                <td>  Bill Release From Date </td>
                <td> <input type=text id="spbill_frm_dt_fld"  onclick='scwShow(this,event);'  /> </td>
                <td>  Bill Release To Date </td>
                <td> <input type=text id="spbill_to_dt_fld"  onclick='scwShow(this,event);'  /> </td>
             </tr>
             <tr>
                <td>
                   Special Bill No :  &nbsp &nbsp
                </td>
                 <td colspan=3 >
             <div  id="wrap_auto_complt1" >
            <input id="edt_spbl_cd" class="sel_flds" type=text hidden_val_fld="edt_spbl_cd_val" style="display:none" onclick="getDtlsFrmDb('SPBILLNO_VNDRNM','<%= userStation %>','<%= userdept  %>','<%= userCdStr %>','<%= adminMkr %>')" related_sel_fld = "spbill_no_sel"  />
            <input id="edt_spbl_cd_val" type=hidden  />
               <select id="spbill_no_sel"  style="display:none;"  >


                        <%
                       String edt_spbl_qry = "  select  nvl(osd.BILL_NO,' ')||'-'||ovm.VENDOR_NAME , osd.BILLREF  "+
                                           "  from ORBL_SPBILL_DTL osd , ORBL_VENDOR_MST ovm    "+
                                           "  where osd.BILL_STATUS = '1' and osd.BILL_NO is not null   "+
                                          "       and  osd.STATION = '"+userStation+"' and osd.DEPT in( select distinct d1.DEPT    "+
                                          "                                          from ORBL_CD_DEPT d1 ,   "+
                                           "                                              ORBL_CD_DEPT_MST d2  "+
                                           "                                          where d1.LOGIN_DEPT = d2.DEPT_SDESC  "+
                                           "                                           and d1.STATION = d2.STATION  "+
                                           "                                           and d2.STATION = '"+userStation+"'  "+
                                           "                                           and d2.DEPT = '"+userdept+"' )      "+
                                           "  and ovm.VENDOR_CODE = osd.VENDOR  order by osd.BILL_DT ";


                    System.out.println(" edt_spbl_qry:  "+edt_spbl_qry); 
                    ps = mk.con.prepareStatement(edt_spbl_qry);

                    rs = ps.executeQuery();

                            while(rs.next()){


                        %>
                 <%  } 
                    rs.close();
                    ps.close();
                  %>
                     </select>
           </div>
                  <input type=text id="cancel_spl_bill" class="sel_flds" style="display:none" action_tp ="C" /> 

<select id="recmmn_vndr_cd" style="display:none" class="sel_flds" action_tp ="R" >
                        <%
/*

                      String recmnd_vndr_cdQry = "  select distinct  VENDOR_CODE , VENDOR_NAME from ORBL_VENDOR_MST  where TERMINATION_STATUS = 'R' order by VENDOR_CODE "; 

                    ps = mk.con.prepareStatement(recmnd_vndr_cdQry);
 

                    rs = ps.executeQuery();

                            while(rs.next()){


                        %>
                         <option value="<%= rs.getString(1)  %>"><%= rs.getString(1) %> - <%= rs.getString(2) %> </option>
                 <%  } 
                    rs.close();
                    ps.close();
                   %>
                     </select>


<select id="apprv_vndr_cd" style="display:none" class="sel_flds" action_tp ="A"  >
                        <%
                      String apprv_vndr_cdQry = "  select distinct  VENDOR_CODE , VENDOR_NAME from ORBL_VENDOR_MST  where TERMINATION_STATUS = 'A' order by VENDOR_CODE "; 

                    ps = mk.con.prepareStatement(apprv_vndr_cdQry);
 

                    rs = ps.executeQuery();

                            while(rs.next()){


                        %>
                         <option value="<%= rs.getString(1)  %>"><%= rs.getString(1) %> - <%= rs.getString(2) %> </option>
                 <%  } 
                    rs.close();
                    ps.close();
                   %>
                     </select>


                  <input type=text id="rjct_vndr_cd" class="sel_flds" style="display:none" action_tp ="C" /> 
<select id="rjct_vndr_cd1" style="display:none" class="sel_flds" action_tp ="C"  >
                        <%
                      String rjct_vndr_cdQry = "  select distinct  VENDOR_CODE , VENDOR_NAME from ORBL_VENDOR_MST  where TERMINATION_STATUS in ('I','R','A') order by VENDOR_CODE ";

                    ps = mk.con.prepareStatement(rjct_vndr_cdQry);


                    rs = ps.executeQuery();

                            while(rs.next()){


                        %>
                         <option value="<%= rs.getString(1)  %>"><%= rs.getString(1) %> - <%= rs.getString(2) %> </option>
                 <%  }
                    rs.close();
                    ps.close();
*/
                   %>
                     </select>
                 
                  <input type=text id="edt_vndr_cd" class="sel_flds" style="display:none" action_tp ="E" />

                </td>
            </tr>
           
            <tr id="sts_row_id" class="sts_row" style="display:none"  > 
              <td>
                 Status: &nbsp; &nbsp;
              </td>
              <td colspan="3"  >
                 <span id="sts_str" ></span>
              </td>
            </tr> 
             <tr>
                 <td colspan="4"  align="center">
                   &nbsp;
                </td>
            </tr>
            <tr>
                 <td colspan="4"  align="center">
                     <input type="button" value="Query" onclick="submitForm();  " />
                </td>
            </tr>

        </table>

    </div>




        <form name="srchFrm" action="spbill_pre_entry_intrmdt.jsp" target="mnfrm1" method="POST" >
           <input type=hidden id="spblref_h"  name="spblref_h"  value="" />
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
                 $('.sts_row').css({display:'none'});
       //alert($(this).attr("sel_mode"));
               // $( "#edt_spbl_cd" ).autocomplete({display:'none'});
               // $( "#cancel_spl_bill" ).autocomplete({display:'none'});

                $('#sel_fld_nm').attr("value",$(this).attr("sel_mode"));
                $('#action_type_h').attr("value",$(this).attr("action_tp"));
                $('#'+$(this).attr("sel_mode")).css({display:'block'});
               if ( typeof $(this).attr("extra_row_1") !== 'undefined' && $(this).attr("extra_row_1") !== false) {
             //   alert($(this).attr("extra_row_1"));
                 $('#'+$(this).attr("extra_row_1")).css({display:'block'});
                 $('#'+$(this).attr("span_1")).html($(this).attr("span_1_value"));
                 }  
                $('#singleFltr').bPopup({opacity: 0.0});
                    $('#singleFltr').corner("15px");

               if($(this).attr("sel_mode") == 'edt_spbl_cd12'){
                 $("#edt_spbl_cd").autocomplete({
                       source:"#spbill_no_sel",
                       wrap_div_id:"#wrap_auto_complt1",
                        onKeyPress:function(){
                        var o=this;
                        setTimeout(function(){
                                o.ac.val(o.ac.val());
                        },50);
                        },
                        fillin:true ,
                        resize_accrd : true,
                        val_store_ele : "#edt_spbl_cd_val"

                });
              }



            });
        </script>
<img alt="" src="cesclogo1.png" style="position:absolute; left:855px; top:40px" width="120" height="59"/>        

<div id="loadingPopup" >
<a class="bClose"><img src="cancel.png" width="20" height="20"  id="clsImg1"  /></a>
        <br/>
         <br/>
<p align=center > Please wait ... </p>
<br/>
</div>
        

    </body>
</html>
 
