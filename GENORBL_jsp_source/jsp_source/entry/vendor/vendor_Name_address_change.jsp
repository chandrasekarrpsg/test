<%-- 
    Document   : vendorSearch
    Created on : 12 Jan, 2013, 10:23:02 AM
    Author     : Sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.io.File"%>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="VO.*" %>


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
 <script type="text/javascript" src="js/jQueryRotate.js"></script>
<script type="text/javascript" src="js/common_spbill_vndr.js"></script> 
<link href="styles.css" rel="stylesheet" type="text/css" />

<style>
thead{
background-color:#fec58b;
}
.vndrCdStyle1{
              font-size: 13pt; 
              font-weight: bold; 
              color: black;
              text-align:center;

}

.buttonActive{color: #F8F2AD; 
              background-color: #95004A; 
              font-family: Courier New; 
              font-size: 12pt; 
              font-weight: bold; 
              border-style: outset}



.addr_line_stl{
color: #206c1c;
}
.addr_inpt_fld{
              background-color: #ffce9d;
}


</style>

 <script>
           
            
            function chkVndrFrm(entryMode,trmn_sts){
                
                
                 if(vndr_entry_frm.vndr_new_name.value == ''){
                    alert("Please Enter Vendor Name !");
                    return false ;
                 }
                 if(vndr_entry_frm.vndr_new_addr1.value == ''){
                    alert("Please Enter Vendor Address 1 !");
                    return false ;
                 }

vndr_entry_frm.termntn_sts_h.value = trmn_sts ;
                vndr_entry_frm.submit();
                
            }
            
           

function showSentBckDialog(entryMode,trmn_sts,sent_bck_sts){
document.getElementById("sent_back_entry_md").value = entryMode ;
document.getElementById("sent_back_vndr_sts").value = trmn_sts ;
document.getElementById("sent_back_sts").value = sent_bck_sts ;
$('#sentBckDialog').bPopup({opacity: 0.0});
}

function doSendBack(){
if(document.getElementById("sent_back_rmrks").value  != ""){
vndr_entry_frm.sent_back_rmrks_h.value = document.getElementById("sent_back_rmrks").value;
vndr_entry_frm.action_type_h.value = document.getElementById("sent_back_vndr_sts").value;
vndr_entry_frm.sent_back_sts_h.value = document.getElementById("sent_back_sts").value;
chkVndrFrm(document.getElementById("sent_back_entry_md").value,document.getElementById("sent_back_vndr_sts").value);
}else{
alert("Please Enter Send Back Remarks !");
return false;
}

}

 
            
            function upload2(srl,doctp){
document.getElementById('uploadform').target = 'target_iframe';
document.getElementById('upldimg'+srl).style.display='none';
document.getElementById('waitingimg'+srl).style.display='block';
document.getElementById('upldimg'+srl).src="";
document.getElementById('waitingimg'+srl).src="wait.gif";
//uploadform.file_h.value = document.getElementById('file'+srl).value  ;
//document.getElementById('file_h').innerHTML = document.getElementById('file'+srl).innerHTML  ;

//var copy = document.getElementById('file'+srl).cloneNode(1);
//uploadform.appendChild(copy);


//uploadform.file_h.value = document.getElementById('file'+srl).value  ;
uploadform.filename_h.value = document.getElementById('photoname'+srl).value  ;
uploadform.fileSrl_h.value = srl;
uploadform.doc_type_h.value = doctp;


 $('#upldimg'+srl).unbind('click');
document.getElementById('lrgimg1cntnr').innerHTML="";
//alert(' in submit ');
//document.getElementById("file_h").style.visibility = 'display' ;



            $("#spn_file_"+srl).attr("value",doctp+".pdf"); 

document.getElementById("uploadform").submit();
} 
           
		$(window).load(function(){
			
				
                                 
         
            
        
		});
	
    var newangle =0;     
        
        function addRotationToImg(filesrl,imgsrc){
            document.getElementById('upldimg'+filesrl).style.display='block';
            document.getElementById('waitingimg'+filesrl).style.display='none';
            $("#upldimg"+filesrl).removeAttr("src");
            $("#upldimg"+filesrl).attr("src",imgsrc+"?"+ new Date().getTime());
            //alert(imgsrc);
            $('#upldimg'+filesrl).unbind('click');
           $('.rotation').unbind('click');
           $('#largeImg1').unbind('rotate');
            document.getElementById('lrgimg1cntnr').innerHTML="<img id=\"largeImg1\" src=\""+imgsrc+"\" width=\"600\" height=\"600\" /> ";
            $("#largeImg1").removeAttr("src"); 
            $("#largeImg1").attr("src",imgsrc+"?"+ new Date().getTime()); 
              $('#upldimg'+filesrl).bind('click', function(e) {
               //alert($(this).attr("src")); 
                 document.getElementById('lrgimg1cntnr').innerHTML="<img id=\"largeImg1\" src=\""+imgsrc+"\" width=\"600\" height=\"600\" /> ";
                 $("#largeImg1").removeAttr("src").attr("src",$(this).attr("src")+"?"+ Math.random() );
                // Prevents the default action to be triggered. 
                e.preventDefault();

                // Triggering bPopup when click event is fired
                $('#popup1').bPopup({opacity: 0.0});

            });
           

newangle =0;

               //$('.rotation').each(function() { $(this).bind('click',function(e) {
               $('.rotation').click(function() { 
    //alert($(this).attr('action_tp'));
    if ($(this).attr('action_tp') == 'minus')
        operation = "-";
    else
        operation = "+";

    //alert(operation)
    var angle = next(operation);
   // alert(" angle "+angle);
              //  e.preventDefault();
    $("#largeImg1").rotate(angle);

});


$('.zoom_in_out').click(function() {
    if($(this).attr('action_tp') == "incr" || $(this).attr('action_tp') == "decr"){
         var w = $("#largeImg1").width();
         var h = $("#largeImg1").height();
        if ($(this).attr('action_tp') == "incr"){
            h=Math.floor(h * 1.25);
            w=Math.floor(w * 1.25);
        }else if($(this).attr('action_tp') == "decr"){
            h=Math.floor(h / 1.25);
            w=Math.floor(w / 1.25);
        }

        $("#largeImg1").css({height:h,width:w});
    }
});



        }
             



 

   
function next(oper) {
   if (oper == "+")
      newangle += 90;
    else
      newangle -= 90;
    
   if (newangle >= 360) newangle = 0;
    
    return newangle;
 
}
 
            
            
       function sizeTbl(h,id1,id2) {
  var tbl = document.getElementById('tbl');
  tbl.style.display = h;
  document.getElementById(id2).style.display = 'block';
  document.getElementById(id1).style.display = 'none';
}  


function showPdfDoc(fileStr){
pdfReadFrm.pdfReltvPath_h.value = fileStr ;
pdfReadFrm.submit();

}   
            
            
        </script>


 <style>
     
     body{
         font-family:arial;
         color: #545bb4;
         font-weight: bold;
         font-size: small;
     }
            
 #sentBckDialog {
    background-color:#289;
    border-radius:15px;
    color:#000;
    display:none;
    padding:20px;
    min-width:100px;
    min-height: 100px;
}

            #popup1 { 
    background-color:#289;
    border-radius:15px;
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

.style1{
    background-color:#ffb76f;

}

.style2{
    background-color:#c8ce7b;

}

        </style>
        
        
    </head>
    <body>
        


   <%    
        String vndr_cd_str = request.getParameter("vndr_cd_h") == null ?"":request.getParameter("vndr_cd_h") ;
        String action_tp_str = request.getParameter("action_type_h") == null ?"I":request.getParameter("action_type_h") ;
        boolean edit_mode = false;
        boolean rjct_mode = false;
        boolean delt_mode = false;
        boolean trmn_mode = false;
        boolean normal_edt_mode = false;

LoginBean loginBn = (LoginBean) ((request.getSession()).getAttribute("loginBean"));
    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    FileHandling flhndl = new FileHandling();
    String curdate = new String() ;
    String genStn = "";
    String genStnName = "";
    genStn = loginBn.getsGenStn();
    genStnName = loginBn.getsGenStnNm();
 System.out.println(" ngenStn  : "+genStn+"  Name : "+genStnName);
    try {

        PreparedStatement ps = null ;
        ResultSet rs = null ;
        PreparedStatement ps2 = null ;
        ResultSet rs2 = null ;
int vendr_count = 0;
      String chk_vndr_cd = " select count(*) from ORBL_VENDOR_MST where VENDOR_CODE = ? and VENDOR_STATUS = 'V'  ";
     ps = mk.con.prepareStatement(chk_vndr_cd);
                            ps.setString(1, vndr_cd_str);
                            rs = ps.executeQuery();

                            if(rs.next()){
                              vendr_count = rs.getInt(1);
                            } 
                           rs.close();
                           ps.close();
  rs = null;
  ps = null;

if(vendr_count >0){



 
%>
<%if(!vndr_cd_str.equals("")){  %>
<p class="vndrCdStyle1"> Vendor Code: <%= vndr_cd_str  %></p>        
<% }  %>



<form name="vndr_entry_frm" action="vendorEntry.jsp" method="POST" target="_self" >
        <table width="94%"  >
<tr>
 <td colspan=4 > <font color=#9d4f00 size=4><b> &nbsp; &nbsp; &nbsp;  <%= genStnName  %></b> </font>
                </td>

</tr>
<tr></tr>
<tr></tr>
            <tr>
           <td>Original Name:</td>
                <td colspan=3 >
                    <input type="text" class="style2" name="vndr_org_name" maxlength=150  size=80  readonly =true   />
                </td>
            </tr>

            <tr>
                <td>Original Address:</td>
                <td colspan = 3>
                  <input type="text" class="style1" name="vndr_org_addr1" maxlength=45 size=80   readonly =true   /><span class="addr_line_stl">(Line 1)</span>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan = 3 >
                    <input type="text" class="style1"  name="vndr_org_addr2"  maxlength=45 size=80  readonly =true    />
                    <span class="addr_line_stl">(Line 2)</span>
                </td>
            </tr>

            <tr>
                <td></td>
                <td colspan = 3 >
                  <input type="text" class="style1"  name="vndr_org_addr3"  maxlength=45 size=80  readonly =true   />
                    <span class="addr_line_stl">(Line 3)</span>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan = 3 >
                    <input type="text" class="style1"  name="vndr_org_addr4"   maxlength=45 size=80  readonly =true   />
                    <span class="addr_line_stl">(Line 4)</span>
                </td>
            </tr>
             <tr>
                <td></td>
                <td colspan = 3 >
                    <input type="text" class="style1"  name="vndr_org_addr5"   maxlength=45 size=80  readonly =true   />
                    <span class="addr_line_stl">(Line 5)</span>
                </td>
            </tr>
            <tr><td colspan = 4></td> </tr>
            <tr><td colspan = 4></td> </tr>
            <tr><td colspan = 4></td> </tr>
            <tr><td colspan = 4></td> </tr>
            <tr><td colspan = 4></td> </tr>

            <tr>
           <td>New Name:<span style="color:red;font-size:14pt;">*</span></td>
                <td colspan=3 >
                    <input type="text" name="vndr_new_name" maxlength=150  size=80    />
                </td>
            </tr>

            <tr>
                <td>New Address:<span style="color:red;font-size:14pt;">*</span></td>
                <td colspan = 3>
                  <input type="text" name="vndr_new_addr1" maxlength=45 size=45    />
                    <span class="addr_line_stl">(Line 1)</span>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan = 3 >
                    <input type="text" name="vndr_new_addr2"  maxlength=45 size=45  />
                    <span class="addr_line_stl">(Line 2)</span>
                </td>
            </tr>

            <tr>
                <td></td>
                <td colspan = 3 >
                  <input type="text" name="vndr_new_addr3"  maxlength=45 size=45    />
                    <span class="addr_line_stl">(Line 3)</span>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan = 3 >
                    <input type="text" name="vndr_new_addr4"   maxlength=45 size=45  />
                    <span class="addr_line_stl">(Line 4)</span>
                </td>
            </tr>
             <tr>
                <td></td>
                <td colspan = 3 >
                    <input type="text" name="vndr_new_addr5"   maxlength=45 size=45  />
                    <span class="addr_line_stl">(Line 5)</span>
                </td>
            </tr>




        </table>


<input type="hidden" name="action_type_h" value = "<%= action_tp_str %>" />
<input type="hidden" name="vndr_cd_h" value = "<%= request.getParameter("vndr_cd_h") %>" />
<input type="hidden" name="termntn_sts_h" value = "I" />

</form>
<br/>



<%

String vndr_dtls_qry = " select  VENDOR_NAME,          "+
                       "         nvl(ADDRESS_BBGS,' '),         "+
                       "          nvl(ADDRESS1,' '),            "+
                       "          nvl(ADDRESS2,' '),            "+
                       "           nvl(ADDRESS3,' '),           "+
                       "           nvl(ADDRESS4,' '),           "+
                       "           nvl(ADDRESS5,' ')           "+
                       "  from ORBL_VENDOR_MST       "+
                       "   where VENDOR_CODE = ?    "+
                       "";



rs = null;
ps = null;
ps = mk.con.prepareStatement(vndr_dtls_qry);
                            ps.setString(1, vndr_cd_str);
                            rs = ps.executeQuery();

                            while(rs.next()){
%>
<script>

document.getElementById("vndr_org_name").value = "<%= rs.getString(1)  %>";
document.getElementById("vndr_org_addr1").value = "<%= rs.getString(3)  %>";
document.getElementById("vndr_org_addr2").value = "<%= rs.getString(4)  %>";
document.getElementById("vndr_org_addr3").value = "<%= rs.getString(5)  %>";
document.getElementById("vndr_org_addr4").value = "<%= rs.getString(6)  %>";
document.getElementById("vndr_org_addr5").value = "<%= rs.getString(7)  %>";



</script>


<%
}
rs.close();
ps.close();



%>


<br/>


            <!-- input type="button" value="ENTRY" class="buttonActive"   onclick="chkVndrFrm('E','I');" /-->
<input type="button" name="Save" value="" style="width: 75px; height: 37px;background-image:url('btn_save.png');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkVndrFrm('E','I');">

        </td>
        <td>
        </td>
        <td>
        </td>

        <td>
            <!-- input type="button" value="Cancel" class="buttonActive"  / -->
<input type="button" name="Cancel" value="" style="width: 81px; height: 37px;background-image:url('btn_cancel.jpeg');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="cancel_action('blank_pg_for_sp_vndr.html','_self');">

        </td>
        <td>
            <!-- input type="button" value="Close" class="buttonActive"  / -->
<!-- input type="button" name="Close" value="" style="width: 73px; height: 37px;background-image:url('btn_close.jpeg');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="" -->
        </td>
    </tr>
</table>





<%

        
      
       }else{
%>
<script>
alert("No Record Exists !");
</script>
<%
}
       }
    catch(Exception e){
        e.printStackTrace();
    }
    finally {
        mk.con.close() ;
    }

%>

        
    </body>
</html>

