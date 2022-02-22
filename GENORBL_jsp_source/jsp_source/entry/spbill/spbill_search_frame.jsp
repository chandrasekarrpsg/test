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
     <script src="js/dom-drag.js" type="text/javascript"></script>
<script type="text/javascript" src="slideshowfade.js"></script>
<script type='text/JavaScript' src='js/best_cal_ag.js'></script> 
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

 
</style>


  <script>
            function doClose(e) 
{
    if (!e) e = window.event; 

    if (e.keyCode) 
    {
        if (e.keyCode == "27") window.close();
    }
    else if (e.charCode) 
    {
        if (e.keyCode == "27") window.close();
    }
}
document.onkeypress = doClose;
         
         
         function submitForm(frm){
             alert('112 '+frm);
           //  mnfrm1.frm.target = 'frm_blk1';
            // mnfrm1.frm.submit();

         }
         
         function searchSubmit(){
             srchFrm.spbil_no_h.value = document.getElementById("spbil_no").value ;
             //srchFrm.spbil_ref_id_h.value = document.getElementById("spbil_ref_id").value ;
             srchFrm.spbil_ref_h.value = document.getElementById("spbil_ref").value ;
             if(document.getElementById("spbil_vendor_cd").value != ''){
             srchFrm.spbil_vendor_h.value = document.getElementById("spbil_vendor_cd_val").value ;
            
             }else {
             srchFrm.spbil_vendor_h.value = '' ;
             }
            // alert(srchFrm.spbil_vendor_h.value);
             srchFrm.spbil_urgnt_pmnt_h.value = document.getElementById("spbil_urgnt_pmnt").value ;
             srchFrm.spbil_fin_rcvd_sts_h.value = document.getElementById("spbil_finance_rcvd").value ;
             srchFrm.spbil_cancelled_bill_h.value = document.getElementById("spbil_cncelld_bill").value ;
             srchFrm.spbil_bill_frm_dt_h.value = document.getElementById("frm_date").value ;
             srchFrm.spbil_bill_to_dt_h.value = document.getElementById("to_date").value ;
            document.getElementById("frm_blk1").src= "";
            
           srchFrm.submit();
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
    <body bgcolor="#ff9a35">

         <script type="text/javascript">
 
      var imgArray = new Array();
      imgArray[0] = "k1118050.jpg";
      imgArray[1] = "k1451470.jpg";
      imgArray[2] = "k4777200.jpg";
      imgArray[3] = "k7067130.jpg";
 
 
      slideshowFade('Slideshow1','',imgArray,20,5000);
    
    </script>
     
<%  
 MakeConnectionGENORBL mk = new MakeConnectionGENORBL();


    try {
        PreparedStatement ps = null ;
        ResultSet rs = null ;
%>
   
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
                     Special Bill search  
                 </td>
            </tr>
             <tr>
                <td  bgcolor="#944a01">
                    <table width="180px">
                         <tr>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td align="center"> <input type="button" value="        SEARCH       "  class="snglfilter" /> </td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td align="center"> <input type="button" value="        CLOSE          " onclick="window.close();" /> </td>
                        </tr>
                        
                        
                         <tr>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                 <td> 
                     <iframe src="blank_pg_for_srch1_sp_vndr.html"  name="mnfrm1"  width="800" height="180"  style="border-left-width: 15px;border-top-width: 15px;border-style:solid;border-left-color:#dfe3e8  ;  border-top-color:#dfe3e8;" ></iframe>
                 </td>
            </tr>
        </table>
        <table width="100%">
             <tr>
                <td align=center > Special Bill Details </td>
                
            </tr>
            <tr>
                <td> <iframe src="blank_pg_for_srch2_sp_vndr.html" name="frm_blk1"  width="990" height="350" style="border-left-width: 5px;border-top-width: 5px;border-style:solid;border-left-color:#9b3e00  ;  border-top-color:#9b3e00;"  ></iframe> </td>
            </tr>
        </table>




         <div id="singleFltr"    >
          <a class="bClose"><img src="cancel.png" width="20" height="20" id="clsImg" /></a>
        <br/>
         <br/>
        <table>
            <!-- tr>
                <td>
                   Vendor Name :  &nbsp &nbsp
                </td>
                 <td>
                   <input type="text"  name="vndr_nm" />
                </td>
            </tr -->
            <tr>
                <td>
                   From Release Date :  &nbsp &nbsp </td><td><input type=text id="frm_date" onclick='scwShow(this,event);' /> 
                </td>
                 <td>
                   To Release Date :  &nbsp &nbsp </td><td> <input type=text id="to_date" onclick='scwShow(this,event);' /> 
                </td>
            </tr>

            <tr>
                <td >
                   Bill Number :  &nbsp &nbsp</td><td>
                    <input type="text" name="spbil_no" />
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td >
                    Bill Id :  &nbsp &nbsp</td><td>
                    <input type="text" name="spbil_ref" />
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td >
                    Party :  &nbsp &nbsp</td>
                 <td colspan = 3>
                <div  id="wrap_auto_complt1" >
                    <input type="text" id="spbil_vendor_cd" />
                    <input type="hidden" id="spbil_vendor_cd_val" />
                   <select id="valid_vndr_cd" style="display:none;" >
                    <%   String vendor_code_name_str = "";
                      String valid_vndr_cd_for_edit_Qry = "  select distinct  VENDOR_CODE , VENDOR_NAME from ORBL_VENDOR_MST where  VENDOR_STATUS = 'V' order by VENDOR_NAME ";

                    ps = mk.con.prepareStatement(valid_vndr_cd_for_edit_Qry);


                    rs = ps.executeQuery();
                     int tmp_counter = 0 ;
                            while(rs.next()){
%>
<option value="<%= rs.getString(1)  %>"><%= rs.getString(2) %> </option>
<%
                            }

                    rs.close();
                    ps.close();

%>
                     </select>
 
                </div>
                </td>
            </tr>
             <tr>
                <td >
                   Urgent Payment ?  &nbsp &nbsp  </td><td>
                    <select name="spbil_urgnt_pmnt"  >
                        <option value="" >ALL</option>
                        <option value="N" > No</option>
                        <option value="Y" > Yes</option>
                    </select>
                </td>
                <td></td>
                <td></td>
            </tr>



            <tr>
                <td >
                   Finance Received ?  &nbsp &nbsp  </td><td>
                    <select name="spbil_finance_rcvd"  >
                        <option value="" >ALL</option>
                        <option value="N" > No</option>
                        <option value="Y" > Yes</option>
                    </select>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td >
                   Cancelled Bill ?  &nbsp &nbsp  </td><td>
                    <select name="spbil_cncelld_bill"  >
                        <option value="" >ALL</option>
                        <option value="N" > No</option>
                        <option value="Y" > Yes</option>
                    </select>
                </td>
                <td></td>
                <td></td>
            </tr>

             <tr>
                 <td colspan="2"  align="center">
                   &nbsp;
                </td>
            </tr>
            <tr>
                 <td colspan="4"  align="center">
                     <input type="button" value="Query" onclick="searchSubmit();  $('#clsImg').click();  "    />
                </td>
            </tr>

        </table>

    </div>

<script>
Drag.init(document.getElementById("singleFltr"));
</script>



        <form name="srchFrm" action="spbil_search_result_intrmdt.jsp" target="mnfrm1" method="POST" >
              <input type="hidden" name="srch_type_h" value="multi" />
             <input type="hidden" name="spbil_no_h" value=""  />
             <input type="hidden" name="spbil_ref_id_h" value=""  />
             <input type="hidden" name="spbil_vendor_h" value=""  />
             <input type="hidden" name="spbil_urgnt_pmnt_h" value=""  />
             <input type="hidden" name="spbil_ref_h" value=""  />
            <input type="hidden" name="spbil_fin_rcvd_sts_h" value=""  />
            <input type="hidden" name="spbil_cancelled_bill_h" value=""  />
            <input type="hidden" name="spbil_bill_frm_dt_h" value=""  />
            <input type="hidden" name="spbil_bill_to_dt_h" value=""  />
            
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
                $('#singleFltr').bPopup({opacity: 0.0 });
                    $('#singleFltr').corner("15px");
                  
                $("#spbil_vendor_cd").autocomplete({
                       source:"#valid_vndr_cd",
                       wrap_div_id:"#wrap_auto_complt1",
                        onKeyPress:function(){
                        var o=this;
                        setTimeout(function(){
                                o.ac.val(o.ac.val());
                        },50);
                        },
                        fillin:true ,
                        resize_accrd : true,
                        val_store_ele : "#spbil_vendor_cd_val"

                });




            });
        </script>
<img alt="" src="cesclogo1.png" style="position:absolute; left:885px; top:40px" width="120" height="59"/>        
    </body>
</html>

