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
        <link rel="stylesheet" type="text/css" href="css/cssverticalmenu.css" />
        <script type="text/javascript" src="js/cssverticalmenu.js"></script>
     <script src="js/jquery.bpopup-0.7.0.min.js" type="text/javascript"></script>
     <script src="js/jquery.corner.js" type="text/javascript"></script>
<script type="text/javascript" src="slideshowfade.js"></script>
 
<link href="styles.css" rel="stylesheet" type="text/css" />
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

#logo {	
		height: 304px;
		width: 100%;
		background: url(big_img.jpg) left top no-repeat;
}

.menu_style_1{
background-color:#8e91f2 ;
}
.menu_div_style_1{
width:200px;
}
 
</style>

     
     <script>

 String.prototype.fulltrim=function(){return this.replace(/(?:(?:^|\n)\s+|\s+(?:$|\n))/g,'').replace(/\s+/g,' ');};


         function submitForm(){
            

 document.getElementById('vndr_cd_h').value =  $('#'+$('#sel_fld_nm').attr("value")).attr("value");           
if($('#'+$('#sel_fld_nm').attr("value")).attr("action_tp") == 'E' || $('#'+$('#sel_fld_nm').attr("value")).attr("action_tp") == 'T'
|| $('#'+$('#sel_fld_nm').attr("value")).attr("action_tp") == 'DU' ){
if($('#'+$('#sel_fld_nm').attr("value")).attr("value") != ''){
document.getElementById('vndr_cd_h').value = $('#'+$('#'+$('#sel_fld_nm').attr("value")).attr("hidden_val_fld")).attr("value");
}else {
document.getElementById('vndr_cd_h').value = '' ;
}
}

if(document.getElementById('vndr_cd_h').value == ''){
if($('#'+$('#sel_fld_nm').attr("value")).attr("action_tp") == 'E' || $('#'+$('#sel_fld_nm').attr("value")).attr("action_tp") == 'T'
|| $('#'+$('#sel_fld_nm').attr("value")).attr("action_tp") == 'DU' ){
alert(' Please Enter valid Vendor Code ! ');
}else{
alert(' No record Found! ');
$('#clsImg').click();
}
return false ;
}else{

var val = $("#vndr_cd_h").val();
//alert(val);
var orignalValue = val;
val = val.replace(/[0-9]*/g, "");
var msg = "Only Integer Values allowed.";
if (val != '') {
orignalValue = orignalValue.replace(/([^0-9].*)/g, "")
$("#vndr_cd_h").val(orignalValue);
alert(msg);
return false ;
}

}
 //alert(document.getElementById('action_type_h').value );
 srchFrm.submit();
$('#clsImg').click();



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
LoginBean loginBn = (LoginBean) request.getSession().getAttribute("loginBean");

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    FileHandling flhndl = new FileHandling();
   
    String vndrCdStr = request.getParameter("vndr_cd_h")==null?"":request.getParameter("vndr_cd_h");
    String vndrAdminMenuFlag = request.getParameter("frmAdm")==null?"NU":request.getParameter("frmAdm");

    Boolean vndrEntryAccs = false;
    Boolean vndrEditAccs = false;
    Boolean vndrDocUpldAccs = false;
    Boolean vndrReccmndAccs = false;
    Boolean vndrChckAccs = false;
    Boolean vndrApprvAccs = false;
    Boolean vndrTermnAccs = false;
    String vndrEdtMode = "";
    String stnDeptconstrnt = "N";
    
      String usrlvlAG = "" ;
       usrlvlAG = loginBn.getsAdminMkr() ;
    

 
    if(vndrAdminMenuFlag.equals("NU")){
    
      String usrlvl1234 = "" ;

      usrlvl1234 = loginBn.getsLoginEmpVndrLvl() ;
System.out.println(" usrlvl1234: "+usrlvl1234);

System.out.println(" usrlvlAG: ****  "+usrlvlAG);
     
 /*    if(usrlvlAG.equals("A")){
       vndrEditAccs = true;
       vndrEdtMode = "normal";
       vndrTermnAccs = true;
       vndrApprvAccs = true;
     }else if(usrlvlAG.equals("G")){
      vndrEntryAccs = true; 
     } */ 

     

     if(usrlvl1234.trim().equals("3")){
        vndrChckAccs = true;
      }else if(usrlvl1234.trim().equals("4")){
        vndrChckAccs = true;
        vndrEntryAccs = true; 
        vndrReccmndAccs = true; 
        vndrApprvAccs = true;
        vndrTermnAccs = true;

      }else if(usrlvl1234.equals("1")){
          vndrEntryAccs = true;
          stnDeptconstrnt = "Y";
       }else if(usrlvl1234.equals("2")){
          vndrEntryAccs = true; 
          vndrReccmndAccs = true; 
          stnDeptconstrnt = "Y";
       }
 

      
    }else if(vndrAdminMenuFlag.equals("CD")){
       vndrEditAccs = true;
       //vndrEdtMode = "normal";
       vndrApprvAccs = true;
       vndrTermnAccs = true;
       vndrEditAccs = true;
       vndrEdtMode = "wage";
       //vndrEntryAccs = true;
    }else if(vndrAdminMenuFlag.equals("VP")){
       vndrEntryAccs = true;
    }else if(vndrAdminMenuFlag.equals("DU")){
       vndrDocUpldAccs = true;
    }
 
   if(usrlvlAG.equals("G") && vndrAdminMenuFlag.equals("NU") ){
      vndrEntryAccs = true;
        vndrReccmndAccs = true; 
          stnDeptconstrnt = "N";
     }  
 
    String genStn = "";

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
                 <td>
                     Vendor Entry Screen 
                 </td>
            </tr>
             <tr>
                <td class="menu_style_1" >
                   <div class="menu_div_style_1"  >
<%    if(vndrEntryAccs ){  %>
                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#" onclick="openSpcfkPg('vendorEntry.jsp');" id="btn1"  >NEW ENTRY</a></li>
                              </ul>
<br/>

 <!-- input type="button" id="btn1"  value="     NEW ENTRY     "  onclick="openSpcfkPg('vendorEntry.jsp');"  /--> 
                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#" id="btn2" class="snglfilter"  sel_mode="intrmdt_vndr_cd"  >Draft Stage Entry</a></li>
                              </ul>
<br/>
                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#" class="snglfilter"  sel_mode="del_vndr_cd"   >DELETION</a></li>
                              </ul>
<br/>
                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#" class="snglfilter"  sel_mode="nm_addrs_chng_vndr_cd"   >NAME & ADDRESS CHANGE</a></li>
                              </ul>

<br/>

<% } if(vndrReccmndAccs ){  %>
                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#"  class="snglfilter"  sel_mode="recmmn_vndr_cd"  >RECOMMENDATION</a></li>
                              </ul>
<br/>
<% } if(vndrChckAccs){ %>
                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#"  class="snglfilter"  sel_mode="chk_vndr_cd"  >CHECKING</a></li>
                              </ul>

<br/>
<% }  %>
<%  if(vndrApprvAccs){ %>


                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#"  class="snglfilter"  sel_mode="apprv_vndr_cd"  >APPROVE</a></li>
                              </ul>
<br/>
<% }if(vndrEditAccs){  %>
                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#" class="snglfilter"  sel_mode="edt_vndr_cd" extra_row_1="sts_row_id" span_1="sts_str" span_1_value="VALID "  >EDIT</a></li>
                              </ul>
<br/>
<%  }if(vndrDocUpldAccs){  %>
                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#" class="snglfilter"  sel_mode="edt_vndr_doc" extra_row_1="sts_row_id" span_1="sts_str" span_1_value="VALID "  >DOC UPLOAD</a></li>
                              </ul>
<br/>
<%  } if(vndrTermnAccs){  %>
                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#" class="snglfilter"  sel_mode="trmn_vndr_cd" extra_row_1="sts_row_id" span_1="sts_str" span_1_value="VALID"  >TERMINATION</a></li>
                              </ul>
<br/>
<% }   %>
                              <ul id="verticalmenu" class="glossymenu">
                                 <li><a href="#"   onclick="window.close();"  >CLOSE</a></li>
                              </ul>
</div>
                </td>
                 <td> 
                     <iframe  src="blank_pg_for_sp_vndr.html"  name="mnfrm1"  width="750" height="540" style="border-left-width: 15px;border-top-width: 15px;border-style:solid;border-left-color:#dfe3e8  ;  border-top-color:#dfe3e8 "  ></iframe>
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
                   Vendor Name :  &nbsp &nbsp
                </td>
                 <td>
                     <select class="sel_flds" id="intrmdt_vndr_cd" style="display:none" action_tp ="I" >
                        <%
                      String intrmdt_vndr_cdQry = "  select distinct  VENDOR_CODE , VENDOR_NAME from ORBL_VENDOR_MST  where VENDOR_STATUS = 'I' order by VENDOR_CODE ";
 
                    ps = mk.con.prepareStatement(intrmdt_vndr_cdQry);

                    rs = ps.executeQuery();

                            while(rs.next()){


                        %>
                         <option value="<%= rs.getString(1)  %>"><%= rs.getString(1) %> - <%= rs.getString(2) %></option>
                 <%  } 
                    rs.close();
                    ps.close();
                  %>
                     </select>

                     <select class="sel_flds" id="del_vndr_cd" style="display:none" action_tp ="D" >
                        <%
                      String del_vndr_cdQry = "  select distinct  VENDOR_CODE , VENDOR_NAME from ORBL_VENDOR_MST  where VENDOR_STATUS = 'I' order by VENDOR_CODE ";
 
                    ps = mk.con.prepareStatement(del_vndr_cdQry);

                    rs = ps.executeQuery();

                            while(rs.next()){


                        %>
                         <option value="<%= rs.getString(1)  %>"><%= rs.getString(1) %> - <%= rs.getString(2) %></option>
                 <%  } 
                    rs.close();
                    ps.close();
                  %>
                     </select>
                     <select class="sel_flds" id="nm_addrs_chng_vndr_cd" style="display:none" action_tp ="NAC" >
                        <%
                      String nm_addrs_chng_vndr_cdQry = "  select distinct  VENDOR_CODE , VENDOR_NAME from ORBL_VENDOR_MST  where VENDOR_STATUS = 'V' order by VENDOR_NAME ";
 
                    ps = mk.con.prepareStatement(nm_addrs_chng_vndr_cdQry);

                    rs = ps.executeQuery();

                            while(rs.next()){


                        %>
                         <option value="<%= rs.getString(1)  %>"><%= rs.getString(2) %> - <%= rs.getString(1) %></option>
                 <%  } 
                    rs.close();
                    ps.close();
                  %>
                     </select>


<select id="recmmn_vndr_cd" style="display:none" class="sel_flds" action_tp ="R" >
                        <%
                      String recmnd_vndr_cdQry = "  select distinct  VENDOR_CODE , VENDOR_NAME from ORBL_VENDOR_MST  where VENDOR_STATUS = 'R' order by VENDOR_CODE "; 

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

<select id="chk_vndr_cd" style="display:none" class="sel_flds" action_tp ="C"  >
                        <%
                      String chk_vndr_cdQry = "  select distinct  VENDOR_CODE , VENDOR_NAME from ORBL_VENDOR_MST  where VENDOR_STATUS = 'C' order by VENDOR_CODE "; 

                    ps = mk.con.prepareStatement(chk_vndr_cdQry);
 

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
                      String apprv_vndr_cdQry = "  select distinct  VENDOR_CODE , VENDOR_NAME from ORBL_VENDOR_MST  where VENDOR_STATUS = 'A' order by VENDOR_CODE "; 

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


<select id="rjct_vndr_cd" style="display:none" class="sel_flds" action_tp ="J"  >
                        <%
                      String rjct_vndr_cdQry = "  select distinct  VENDOR_CODE , VENDOR_NAME from ORBL_VENDOR_MST  where VENDOR_STATUS in ('I','R','C','A') order by VENDOR_CODE ";

                    ps = mk.con.prepareStatement(rjct_vndr_cdQry);


                    rs = ps.executeQuery();

                            while(rs.next()){


                        %>
                         <option value="<%= rs.getString(1)  %>"><%= rs.getString(1) %> - <%= rs.getString(2) %> </option>
                 <%  }
                    rs.close();
                    ps.close();
                   %>
                     </select>

<div  id="wrap_auto_complt1" >
            <input id="edt_vndr_cd" class="sel_flds" action_tp ="E" type=text hidden_val_fld="edt_vndr_cd_sel_val" style="display:none"  />
            <input id="edt_vndr_cd_sel_val" type=hidden  />
<select id="edt_vndr_cd_sel"  style="display:none;"  >
                        <%
                      String vendor_code_name_str = "";
                      String valid_vndr_cd_for_edit_Qry = "  select distinct  VENDOR_CODE , VENDOR_NAME from ORBL_VENDOR_MST  where VENDOR_STATUS = 'V' order by VENDOR_NAME ";

                    ps = mk.con.prepareStatement(valid_vndr_cd_for_edit_Qry);


                    rs = ps.executeQuery();
                     int tmp_counter = 0 ;
                            while(rs.next()){
%>
<option value="<%= rs.getString(1)  %>"><%= rs.getString(2) %>(<%= rs.getString(1) %>) </option>
<%
                            }

                    rs.close();
                    ps.close();

%>
                     </select>
</div>

<div  id="wrap_auto_complt2" >
            <input id="trmn_vndr_cd" class="sel_flds" action_tp ="T" type=text hidden_val_fld="trmn_vndr_cd_sel_val" style="display:none"  />
            <input id="trmn_vndr_cd_sel_val" type=hidden  />

</div>
<!--  DU  ->>  document upload -->
<div  id="wrap_auto_complt3" >
            <input id="edt_vndr_doc" class="sel_flds" action_tp ="DU" type=text hidden_val_fld="edt_vndr_doc_sel_val" style="display:none"  />
            <input id="edt_vndr_doc_sel_val" type=hidden  />

</div>


                </td>
            </tr>
           
            <tr id="sts_row_id" class="sts_row" style="display:none"  > 
              <td>
                 Status: &nbsp; &nbsp;
              </td>
              <td>
                 <span id="sts_str" ></span>
              </td>
            </tr> 
             <tr>
                 <td colspan="2"  align="center">
                   &nbsp;
                </td>
            </tr>
            <tr>
                 <td colspan="2"  align="center">
                     <input type="button" value="Query" onclick="submitForm();  " />
                </td>
            </tr>

        </table>

    </div>


        <form name="srchFrm" action="vendor_pre_entry_intrmdt.jsp" target="mnfrm1" method="POST" >
           <input type=hidden id="vndr_cd_h"  name="vndr_cd_h"  value="" />
           <input type=hidden  id= "action_type_h" name="action_type_h"   value="" />
           <input type=hidden  id= "edit_mode_h" name="edit_mode_h"   value="<%= vndrEdtMode %>" />
           <input type=hidden  id="sel_fld_nm"   value="" />
           <input type=hidden  name="stn_dept_constrnt"   value="<%=stnDeptconstrnt  %>" />
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
var counter1 = 1;
var counter2 = 1;
var counter3 = 1;

      $('.snglfilter').bind('click', function(e) {


                      /* $("#edt_vndr_cd").autocomplete("destroy");
                         $("#edt_vndr_cd").removeData('autocomplete');
                         $("#trmn_vndr_cd").autocomplete("destroy");
                         $("#trmn_vndr_cd").removeData('autocomplete');
                      */

      
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
//       alert($(this).attr("sel_mode"));

                $('#sel_fld_nm').attr("value",$(this).attr("sel_mode"));
                $('#action_type_h').attr("value",$('#'+$(this).attr("sel_mode")).attr('action_tp'));
                $('#'+$(this).attr("sel_mode")).css({display:'block'});
               if ( typeof $(this).attr("extra_row_1") !== 'undefined' && $(this).attr("extra_row_1") !== false) {
             //   alert($(this).attr("extra_row_1"));
                 $('#'+$(this).attr("extra_row_1")).css({display:'block'});
                 $('#'+$(this).attr("span_1")).html($(this).attr("span_1_value"));
                 }  
                 $("#wrap_auto_complt1").css({"display":"none"})
                 $("#wrap_auto_complt2").css({"display":"none"})

                $('#singleFltr').bPopup({opacity: 0.0});
                    $('#singleFltr').corner("15px");
                 if($(this).attr("sel_mode") == 'edt_vndr_cd' && counter1== 1){
                   counter1 = counter1+1; 
                 $("#wrap_auto_complt1").css({"display":"block"})
                 $("#edt_vndr_cd").autocomplete({
		       source:"#edt_vndr_cd_sel",
                       wrap_div_id:"#wrap_auto_complt1",
         		onKeyPress:function(){
			var o=this;
			setTimeout(function(){
				o.ac.val(o.ac.val());
			},50);
	        	},
	        	fillin:true ,
                        resize_accrd : true,
                        val_store_ele : "#edt_vndr_cd_sel_val"
                
          	});
              }else if($(this).attr("sel_mode") == 'edt_vndr_cd' && counter1>1){
                 $("#wrap_auto_complt1").css({"display":"block"});
              }
              if($(this).attr("sel_mode") == 'trmn_vndr_cd' && counter2== 1){


                   counter2 = counter2+1; 
                 $("#wrap_auto_complt2").css({"display":"block"})
                 $("#wrap_auto_complt1").css({"display":"block"});
                 $("#trmn_vndr_cd").autocomplete({
                       source:"#edt_vndr_cd_sel",
                       wrap_div_id:"#wrap_auto_complt2",
                        onKeyPress:function(){
                        var o=this;
                        setTimeout(function(){
                                o.ac.val(o.ac.val());
                        },50);
                        },
                        fillin:true ,
                        resize_accrd : true,
                        val_store_ele : "#trmn_vndr_cd_sel_val"

                });
                 $("#wrap_auto_complt1").css({"display":"none"});
              }else if($(this).attr("sel_mode") == 'trmn_vndr_cd' && counter2>1){
                 $("#wrap_auto_complt2").css({"display":"block"});
              }

             if($(this).attr("sel_mode") == 'edt_vndr_doc' && counter3== 1){


                   counter3 = counter3+1;
                 $("#wrap_auto_complt3").css({"display":"block"})
                 $("#wrap_auto_complt2").css({"display":"block"})
                 $("#wrap_auto_complt1").css({"display":"block"});
                 $("#edt_vndr_doc").autocomplete({
                       source:"#edt_vndr_cd_sel",
                       wrap_div_id:"#wrap_auto_complt3",
                        onKeyPress:function(){
                        var o=this;
                        setTimeout(function(){
                                o.ac.val(o.ac.val());
                        },50);
                        },
                        fillin:true ,
                        resize_accrd : true,
                        val_store_ele : "#edt_vndr_doc_sel_val"

                });
                 $("#wrap_auto_complt1").css({"display":"none"});
                 $("#wrap_auto_complt2").css({"display":"none"});
              }else if($(this).attr("sel_mode") == 'edt_vndr_doc' && counter3>1){
                 $("#wrap_auto_complt3").css({"display":"block"});
              }


            });


        </script>
<img alt="" src="cesclogo1.png" style="position:absolute; left:885px; top:40px" width="120" height="59"/>        

    </body>
</html>
 
