<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : vendorSearch
    Created on : 12 Jan, 2013, 10:23:02 AM
    Author     : Sony
--%>

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
             srchFrm.vndr_nm_p_h.value = document.getElementById("vndr_nm").value ;
             srchFrm.vndr_cd_p_h.value = document.getElementById("vndr_cd").value ;
             srchFrm.vndr_sts_p_h.value = document.getElementById("vndr_sts").value ;
            document.getElementById("frm_blk1").src= "";
            document.getElementById("frm_blk2").src= "";
            document.getElementById("frm_blk3").src= "";
            
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
                     Vendor search Screen 
                 </td>
            </tr>
             <tr>
                <td  bgcolor="#944a01">
                    <table width="250px">
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
                     <iframe src="blank_pg_for_srch1_sp_vndr.html"  name="mnfrm1"  width="800" height="250"  style="border-left-width: 15px;border-top-width: 15px;border-style:solid;border-left-color:#dfe3e8  ;  border-top-color:#dfe3e8 " ></iframe>
                 </td>
            </tr>
        </table>
        <table width="100%">
             <tr>
                <td> General Details </td>
                <td> Official Details  </td>
                <td> Document Details </td>
                
            </tr>
            <tr>
                <td> <iframe src="blank_pg_for_srch3_sp_vndr.html" name="frm_blk1"  width="330" height="250" style="border-left-width: 5px;border-top-width: 5px;border-style:solid;border-left-color:#9b3e00  ;  border-top-color:#9b3e00 "  ></iframe> </td>
                <td> <iframe src="blank_pg_for_srch3_sp_vndr.html" name="frm_blk2" width="330" height="250"  style="border-left-width: 5px;border-top-width: 5px;border-style:solid;border-left-color:#ff9a35  ;  border-top-color:#ff9a35 " ></iframe> </td>
                <td> <iframe src="blank_pg_for_srch3_sp_vndr.html" name="frm_blk3" width="330" height="250"  style="border-left-width: 5px;border-top-width: 5px;border-style:solid;border-left-color:#9b3e00  ;  border-top-color:#9b3e00 " ></iframe> </td>
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
                   <input type="text"  name="vndr_nm" />
                </td>
            </tr>
            <tr>
                <td>
                   Vendor Code :  &nbsp &nbsp
                </td>
                 <td>
                    <input type="text" name="vndr_cd" />
                </td>
            </tr>
            <tr>
                <td>
                   Vendor Status :  &nbsp &nbsp 
                </td>
                <td>
                    <select name="vndr_sts"  >
                        <option value="%" > ALL</option>
                        <option value="V" selected > VALID</option>
                        <option value="R','C','A','I','O" > WORK IN PROG...</option>
                        <option value="R','C','A','I','O','T" > NOT VALID</option>
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
                     <input type="button" value="Query" onclick="searchSubmit();  $('#clsImg').click();  "    />
                </td>
            </tr>

        </table>

    </div>

<script>
Drag.init(document.getElementById("singleFltr"));
</script>



        <form name="srchFrm" action="vendor_search_result_intrmdt.jsp" target="mnfrm1" method="POST" >
              <input type="hidden" name="srch_type_h" value="multi" />
             <input type="hidden" name="vndr_nm_p_h" value=""  />
            <input type="hidden" name="vndr_cd_p_h" value=""  />
            <input type="hidden" name="vndr_sts_p_h" value=""  />
            
        </form>




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





            });
        </script>
<img alt="" src="cesclogo1.png" style="position:absolute; left:885px; top:40px" width="120" height="59"/>        
    </body>
</html>

