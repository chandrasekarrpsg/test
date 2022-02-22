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
}
.buttonActive{color :#F8F2AD; 
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
                
                if(vndr_entry_frm.props_dept.value == ''){
                    alert("Please Select Proposing Dept!");
                    return false ;
                }
                
                 if(vndr_entry_frm.vndr_name.value == ''){
                    alert("Please Enter Vendor Name !");
                    return false ;
                 }
                 if(vndr_entry_frm.vndr_addr1.value == ''){
                    alert("Please Enter Vendor Address 1 !");
                    return false ;
                 }
                 if(vndr_entry_frm.vndr_addr2.value == ''){
                    alert("Please Enter Vendor Address 2 !");
                    return false ;
                 }

vndr_entry_frm.termntn_sts_h.value = trmn_sts ;
vndr_entry_frm.entry_mode_h.value = entryMode ;
vndr_entry_frm.vndr_wgliab_chkbx.disabled = false ;
if(vndr_entry_frm.vndr_wgliab_chkbx.checked){
vndr_entry_frm.vndr_wgliab.value = "Y";
}else {
vndr_entry_frm.vndr_wgliab.value = "N";

}

if(vndr_entry_frm.trmn_rmrks){
if(vndr_entry_frm.trmn_rmrks.value == ''){
alert("Termination Remarks is mandatory !");
                    return false ;

}

}

var arr1 =vndr_entry_frm.doc_all_srl_h.value.split("|");
var x = ""; 
for (y in arr1){
x = arr1[y] ;
if(x != ''){

if(document.getElementById('spn_file_'+x).value != ''  && document.getElementById('spn_file_'+x).value != 'N' ){
vndr_entry_frm.doc_type_h.value += document.getElementById('doc_tp_'+x).value+"|" ;
vndr_entry_frm.doc_name_h.value += document.getElementById('doc_tp_'+x).value+".pdf|" ;
vndr_entry_frm.doc_no_h.value += document.getElementById('photoname'+x).value +" |"  ;
vndr_entry_frm.doc_sts_h.value += document.getElementById('doc_sts'+x).value +"|"  ;

}else{
vndr_entry_frm.doc_type_h.value += document.getElementById('doc_tp_'+x).value+"|" ;
vndr_entry_frm.doc_name_h.value += " |" ;
vndr_entry_frm.doc_no_h.value += document.getElementById('photoname'+x).value +" |"  ;
vndr_entry_frm.doc_sts_h.value += document.getElementById('doc_sts'+x).value +"|"  ;

}

}

}
   vndr_entry_frm.props_dept.disabled = false;
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




function controlBrowseBtn(val,rowNo){
if(val == 2 ){
document.getElementById("file"+rowNo).disabled = false;
document.getElementById("photoname"+rowNo).disabled = false;
}else{
document.getElementById("file"+rowNo).disabled = true;
document.getElementById("photoname"+rowNo).disabled = true;
return false;
}
return true;
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
?

        </style>
        
        
    </head>
    <body>
        


   <%    
        String vndr_cd_str = request.getParameter("vndr_cd_h") == null ?"":request.getParameter("vndr_cd_h") ;
        String action_tp_str = request.getParameter("action_type_h") == null ?"I":request.getParameter("action_type_h") ;
        String stn_dept_constrnt_str = request.getParameter("stn_dept_constrnt") == null ?" ":request.getParameter("stn_dept_constrnt") ;
        boolean edit_mode = false;
        boolean docUpld_mode = false;
        boolean rjct_mode = false;
        boolean delt_mode = false;
        boolean trmn_mode = false;
        boolean name_addrs_chng_mode = false;
        boolean normal_edt_mode = false;
        boolean edit_md_any_rcrd_exist = false;
        // NAC    -->  Name & Address Change **
        // DU    -->    Document Upload   **
       if(!vndr_cd_str.equals("") && !action_tp_str.equals("E") && !action_tp_str.equals("T") && !action_tp_str.equals("J") && !action_tp_str.equals("D") && !action_tp_str.equals("NAC")  && !action_tp_str.equals("DU")  ){
          edit_mode = true;
       }else if(action_tp_str.equals("E")){
         normal_edt_mode = true;
          edit_mode = true;
       }else if(action_tp_str.equals("T")){
          trmn_mode = true;
          edit_mode = true;
       }else if(action_tp_str.equals("J")){
          rjct_mode = true;
          edit_mode = true;
       }else if(action_tp_str.equals("D")){
          delt_mode = true;
          edit_mode = true;
       }else if(action_tp_str.equals("NAC")){
                     name_addrs_chng_mode = true ;
       }else if(action_tp_str.equals("DU")){
          docUpld_mode = true;
          edit_mode = true;
       } 

    LoginBean loginBn = (LoginBean) ((request.getSession()).getAttribute("loginBean"));
    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    FileHandling flhndl = new FileHandling();
    String curdate = new String() ;
    String genStn = "";
    String sdeptcdStr = "";
    String sdeptDescStr = "";
    String genStnName = "";
    genStn = loginBn.getsGenStn();
    sdeptcdStr = loginBn.getsDept();
    genStnName = loginBn.getsGenStnNm();
 //System.out.println(" ngenStn  : "+genStn+"  Name : "+genStnName+"  vndr_cd_str:  "+vndr_cd_str+" action_tp_str: "+action_tp_str+" edit_mode: "+edit_mode+" normal_edt_mode: "+normal_edt_mode);
    try {

        PreparedStatement ps = null ;
        ResultSet rs = null ;
        PreparedStatement ps2 = null ;
        ResultSet rs2 = null ;
int vendr_count = 0;
if(action_tp_str.equals("E") || action_tp_str.equals("T") || action_tp_str.equals("NAC") ){
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
}else{
vendr_count =1;
}

if(vendr_count >0){



        String build_dir = "/san304/j2eegen/GENORBL/genorbl/build/web/";
        String ipAddress = request.getRemoteAddr();
          String tmp_folder = ipAddress;
          String tmp_dir = build_dir+tmp_folder+"/";          
          File theDir = new File(tmp_dir);

  // if the directory does not exist, create it
  if (!theDir.exists())
  {
    //System.out.println("creating directory: " + tmp_dir);
    theDir.mkdir();
  }else{
         //System.out.println("in  delete and creating directory: " + tmp_dir);
           flhndl.deleteFolder(theDir); 
         //System.out.println("in  vendorEntry.jsp  delete successful  ");
          
              theDir.mkdir();
  }
        


 
        String props_dept_qry = "  select distinct  ORDER_DEPT,DEPT from ORBL_CD_DEPT  where STATION = ?   order by ORDER_DEPT";
 
        String props_dept_qry_sdept = "  select   ORDER_DEPT,DEPT from ORBL_CD_DEPT  where STATION = ? and DEPT=?  order by ORDER_DEPT";
       
ps = mk.con.prepareStatement(props_dept_qry_sdept);
                            ps.setString(1, genStn);
                            ps.setString(2, sdeptcdStr);
                            rs = ps.executeQuery();
while(rs.next()){
sdeptDescStr = rs.getString(1);
}
rs.close();
ps.close();
 
        String doc_qry = " select DOC_TYPE_DESC , DOC_SRL , DOC_TYPE_CODE   from ORBL_VENDOR_DOC_MST where STATION = ?  order by DOC_SRL ";
        String doc_dtl_qry =  " select dm.DOC_TYPE_DESC ,   "+
                              "        dm.DOC_SRL  ,        "+
                              "        dm.DOC_TYPE_CODE ,    "+
                              "        nvl(trim(dd.DOC_FILENAME),'N') ,   "+
                              "       nvl(dd.DOC_FILEPATH,' ') ,   "+
                              " nvl(dd.DOC_STATUS,'0') ,           "+
                              "  nvl(dd.DOC_NUMBER,' ')             "+
                              " from ORBL_VENDOR_DOC_DTL dd ,  "+
                              "   ORBL_VENDOR_DOC_MST dm   "+
                              " where dd.DOC_TYPE_CODE(+) = dm.DOC_TYPE_CODE  "+
                               "  and dd.VENDOR_CODE(+) = ?   "+
                              "  order by dm.DOC_SRL          "+
                              "";
%>
<%if(!vndr_cd_str.equals("")){  %>
<p class="vndrCdStyle1"> Vendor Code: <%= vndr_cd_str  %></p>        
<% }  %>
<form name="vndr_entry_frm" action="vendor_entry_intrmdt.jsp" method="POST" target="_self" >
        <table width="94%"  >
<tr>
 <td colspan=4 > <font color=#9d4f00 size=4><b> &nbsp; &nbsp; &nbsp;  <%= genStnName  %></b> </font>
                </td>

</tr>
<tr></tr>
<tr></tr>
            <tr>
                <td width="20%"> Proposing Dept:<span style="color:red;font-size:14pt;">*</span></td>
                <td colspan=3 >
                 <% if(!edit_mode){  %>
                    <!-- select name="props_dept" <% if(normal_edt_mode || rjct_mode ||delt_mode || trmn_mode){%> disabled  <%} %> >
                        <option value="" >Select</option>
                        <%
                            ps = mk.con.prepareStatement(props_dept_qry);
                            ps.setString(1, genStn);
                            rs = ps.executeQuery();

                            while(rs.next()){
                            %>
                            <option value="<%= rs.getString(2) %>"><%= rs.getString(1) %></option>
                            <%
                            }

                            rs.close();
                            ps.close();
                        %>
                        
                    </select -->
                      <input type=text name="props_dept_dup" value ="<%= sdeptDescStr %> " readonly  size=10 />
                      <input type=hidden name="props_dept" value ="<%= sdeptcdStr %>" readonly />
                    <% }else { %>
                      <input type=text name="props_dept_dup" value ="" readonly  size=10 />
                      <input type=hidden name="props_dept" value ="" readonly />
                     <%  } %>
                 <% if(edit_mode){  %>
                  <span id="proposing_stn_in_scrn" ></span>
              <% } %>
                </td>
            </tr>
            <tr>
           <td> Name:<span style="color:red;font-size:14pt;">*</span></td>
                <td colspan=3 >
                    <input type="text" name="vndr_name" maxlength=150  size=80 <% if(normal_edt_mode || rjct_mode || delt_mode || trmn_mode || docUpld_mode ){%> readonly =true  <%} %>   />
                </td>
            </tr>

            <tr>
                <td> Address:<span style="color:red;font-size:14pt;">*</span></td>
                <td colspan = 3>
                  <input type="text" name="vndr_addr1" maxlength=45 size=45 class="addr_inpt_fld" <% if(normal_edt_mode || rjct_mode || delt_mode || trmn_mode || docUpld_mode ){%> readonly =true  <%} %>  /><span class = "addr_line_stl" >( Line 1 ) </span>
                </td>
            </tr>
            <tr>
                <td> </td>
                <td colspan = 3 >
                    <input type="text" name="vndr_addr2"  maxlength=45 size=45 class="addr_inpt_fld" <% if(rjct_mode||delt_mode || trmn_mode || docUpld_mode ){%> readonly =true  <%} %>  /><span class = "addr_line_stl" >( Line 2 ) </span>
                </td>
            </tr>

            <tr>
                <td> </td>
                <td colspan = 3 >
                  <input type="text" name="vndr_addr3"  maxlength=45 size=45 class="addr_inpt_fld"  <% if(rjct_mode||delt_mode || trmn_mode || docUpld_mode ){%> readonly =true  <%} %>  /><span class = "addr_line_stl" >( Line 3 ) </span>
                </td>
            </tr>
            <tr>
                <td> </td>
                <td colspan = 3 >
                    <input type="text" name="vndr_addr4"   maxlength=45 size=45 class="addr_inpt_fld" <% if(rjct_mode||delt_mode || trmn_mode || docUpld_mode ){%> readonly =true  <%} %>  /><span class = "addr_line_stl" >( Line 4 ) </span>
                </td>
            </tr>
             <tr>
                <td> </td>
                <td colspan = 3 >
                    <input type="text" name="vndr_addr5"   maxlength=45 size=45 class="addr_inpt_fld"  <% if(rjct_mode||delt_mode || trmn_mode || docUpld_mode ){%> readonly =true  <%} %>  /><span class = "addr_line_stl" >( Line 5 ) </span>
                </td>
            </tr>

            <tr>
                <td> Contact Person:<span style="color:red;font-size:14pt;">*</span></td>
                <td>
                  <input type="text" name="vndr_cntct_persn" maxlength=50 size=45 <% if(rjct_mode||delt_mode || trmn_mode || docUpld_mode ){%> readonly =true  <%} %>  />
                </td>
                <td> Mobile No:<span style="color:red;font-size:14pt;">*</span></td>
                <td>
                    <input type="text" name="vndr_mbl" maxlength=25 size=10  <% if(rjct_mode||delt_mode || trmn_mode || docUpld_mode ){%> readonly =true  <%} %> />
                </td>
            </tr>
            <tr>
                <td> Tel:<span style="color:red;font-size:14pt;">*</span></td>
                <td>
                  <input type="text" name="vndr_tel" maxlength=50 size=10  <% if(rjct_mode||delt_mode || trmn_mode || docUpld_mode ){%> readonly =true  <%} %> />
                </td>
                <td> Fax:</td>
                <td>
                    <input type="text" name="vndr_fax" maxlength=30 size=10  <% if(rjct_mode||delt_mode || trmn_mode || docUpld_mode ){%> readonly =true  <%} %> />
                </td>
            </tr>
            <tr>
                <td> Email:</td>
                <td>
                  <input type="text" name="vndr_eml" maxlength=60 size=45 <% if(rjct_mode||delt_mode || trmn_mode || docUpld_mode ){%> readonly =true  <%} %>  />
                </td>
                <td> Wage Liability:</td>
                <td>
                    <input type="hidden" name="vndr_wgliab"  />
                    <input type="checkbox" id="vndr_wgliab_chkbx" <% if(rjct_mode||delt_mode || trmn_mode || docUpld_mode ){%> DISABLED  <%} %>  />
                </td>
            </tr>
             <tr>
                <td> Website:</td>
                <td>
                  <input type="text" name="vndr_wbst" maxlength=60 size=45  <% if(rjct_mode||delt_mode || trmn_mode || docUpld_mode){%> readonly =true  <%} %> />
                </td>
                <td> </td>
                <td>
                </td>
            </tr>
           <tr>
                <td> Work-Area :<span style="color:red;font-size:14pt;">*</span> </td>
                <td colspan="3" >
                   <input type="text" name="vndr_wrkarea"  maxlength=200 size=80 <% if(rjct_mode||delt_mode || trmn_mode || docUpld_mode ){%> readonly =true  <%} %>  />
                </td>
            </tr>

      <% if(!action_tp_str.equals("I") && !action_tp_str.equals("NAC")  ){ %>
             <tr>
                <td> Proposed By : </td>
                <td colspan="3" >
                    <input type="text" name="props_by" size="80"   readonly  />
                </td>

            </tr>
           <%  } %>

 
             <!-- tr>
                <td> Proposing Remarks :<span style="color:red;font-size:14pt;">*</span></td>
                <td colspan="3" >
                    <input type="text" name="props_rmrks" size="80" <% if(!action_tp_str.equals("I")){ %> readonly <% } %> />
                </td>
                
            </tr -->
           <% if(!action_tp_str.equals("I") ){ %> 
<% if(action_tp_str.equals("A")||action_tp_str.equals("C")||action_tp_str.equals("T") || action_tp_str.equals("E") || action_tp_str.equals("DU")){  %>
             <tr>
                <td> Recommendation By :</td>
                <td colspan="3" >
                    <input type="text" name="recmnd_by" size="80" readonly />
                </td>

            </tr>

           <% }  %>

             <!--  tr>
                <td> Recommendation Remarks :</td>
                <td colspan="3" >
                    <input type="text" name="recmnd_rmrks" size="80"  <% if(!action_tp_str.equals("R")){ %> readonly <% } %> />
                </td>
                
            </tr -->
           <%  } %>



         <% if(action_tp_str.equals("T") || action_tp_str.equals("E") || action_tp_str.equals("DU")){  %>
             <tr>
                <td> Approve By :</td>
                <td colspan="3" >
                    <input type="text" name="apprv_by" size="80" readonly />
                </td>
                
            </tr>

           <% }  %>
         <% if(action_tp_str.equals("J")){  %>
             <tr>
                <td> Rejection Remarks :</td>
                <td colspan="3" >
                    <input type="text" name="rjct_rmrks" size="80" />
                </td>

            </tr>

           <% }  %>

           <% if(action_tp_str.equals("T")){  %>
             <tr>
                <td> Termination Remarks :</td>
                <td colspan="3" >
                    <input type="text" name="trmn_rmrks" size="80" />
                </td>

            </tr>

           <% }     %>

            <tr style="display:none;" id="sentBckRow" >
                <td> Send Back Remarks :</td>
                <td colspan="3" >
                     <span id="sent_bck_rmrks" class="style1"></span>
                </td>

            </tr>


        </table>


<input type="hidden" name="doc_type_h" value = "" />
<input type="hidden" name="doc_name_h" value = "" />
<input type="hidden" name="doc_no_h" value = "" />
<input type="hidden" name="doc_sts_h" value = "" />
<input type="hidden" name="doc_all_srl_h" value = "" />
<input type="hidden" name="entry_mode_h" value = "" />
<input type="hidden" name="action_type_h" value = "<%= action_tp_str %>" />
<input type="hidden" name="vndr_cd_h" value = "<%= request.getParameter("vndr_cd_h") %>" />
<input type="hidden" name="termntn_sts_h" value = "I" />
<input type="hidden" name="sent_back_rmrks_h" value = "" />
<input type="hidden" name="sent_back_sts_h" value = "" />

</form>
<br/>



<%

if(edit_mode){
String vndr_dtls_qry = " select  VENDOR_NAME,          "+
                       "         nvl(ADDRESS_BBGS,' '),         "+
                       "          nvl(ADDRESS1,' '),            "+
                       "          nvl(ADDRESS2,' '),            "+
                       "           nvl(ADDRESS3,' '),           "+
                       "           nvl(ADDRESS4,' '),           "+
                       "           nvl(CONTACT_PERSON,' '),    "+
                       "           nvl(TEL_NO,' '),            "+
                       "          nvl(FAX_NO, ' '),             "+
                       "          nvl(MOBILE_NO,' '),        "+
                       "          nvl(EMAIL_ID,' '),         "+
                       "           nvl(WEBSITE,' '),          "+
                       "         nvl(WORK_AREA,' '),         "+
                       "        WAGELIAB,           "+
                       "        nvl(PROPOSING_DEPT,' '),     "+
                       "      nvl(PROPOSING_NAME,' ') ,   "+
                       "      nvl(RECOMMENDATION_NAME,' ') ,   "+
                       "           nvl(ADDRESS5,' ') ,          "+
                       "           nvl(REMARKS,' ') ,          "+
                       "        nvl(ocd.ORDER_DEPT,' ') ,    "+
                       "        nvl(cs.STATION_LONG_DESC,' ') ,    "+
                       "      nvl(APPROVER_NAME,' ')    "+
                       "  from ORBL_VENDOR_MST  ovm , ORBL_CD_DEPT ocd ,CD_STATION cs  "+
                       "   where ovm.VENDOR_CODE = ?    "+
                       "     and ocd.STATION = trim(ovm.PROPOSING_STN)  "+
                       "     and ocd.DEPT = trim(ovm.PROPOSING_DEPT)   "+
                       "     and cs.ORBL_STATION_CD = trim(ovm.PROPOSING_STN)   "+
                       "";

String stn_dpt_crteria =  "   and   ocd.STATION = ? and ocd.DEPT=?        ";

System.out.println(" stn_dept_constrnt_str : "+stn_dept_constrnt_str);

if(stn_dept_constrnt_str.equals("Y")){
vndr_dtls_qry = vndr_dtls_qry + stn_dpt_crteria;
}

rs = null;
ps = null;
System.out.println(" vndr_dtls_qry : "+vndr_dtls_qry);
ps = mk.con.prepareStatement(vndr_dtls_qry);
                            ps.setString(1, vndr_cd_str);
                          if(stn_dept_constrnt_str.equals("Y")){
                            ps.setString(2, genStn);
                            ps.setString(3, sdeptcdStr);
                           }
                            rs = ps.executeQuery();

                            while(rs.next()){
edit_md_any_rcrd_exist = true;
%>
<script>
if(document.getElementById("props_dept_dup")){
document.getElementById("props_dept_dup").value = "<%= rs.getString(20)  %>";
document.getElementById("props_dept").value = "<%= rs.getString(15)  %>";
}else{
document.getElementById("props_dept").value = "<%= rs.getString(15)  %>";
}


document.getElementById("vndr_name").value = "<%= rs.getString(1)  %>";
document.getElementById("vndr_addr1").value = "<%= rs.getString(3)  %>";
document.getElementById("vndr_addr2").value = "<%= rs.getString(4)  %>";
document.getElementById("vndr_addr3").value = "<%= rs.getString(5)  %>";
document.getElementById("vndr_addr4").value = "<%= rs.getString(6)  %>";
document.getElementById("vndr_addr5").value = "<%= rs.getString(18)  %>";
document.getElementById("vndr_cntct_persn").value = "<%= rs.getString(7)  %>";
document.getElementById("vndr_mbl").value = "<%= rs.getString(10)  %>";
document.getElementById("vndr_tel").value = "<%= rs.getString(8)  %>";
document.getElementById("vndr_fax").value = "<%= rs.getString(9)  %>";
document.getElementById("vndr_eml").value = "<%= rs.getString(11)  %>";
document.getElementById("vndr_wgliab").value = "<%= rs.getString(14)  %>";
if(document.getElementById("vndr_wgliab").value == 'Y'){
document.getElementById("vndr_wgliab_chkbx").checked = true;
}else{
document.getElementById("vndr_wgliab_chkbx").checked = false;
}
document.getElementById("vndr_wbst").value = "<%= rs.getString(12)  %>";
document.getElementById("vndr_wrkarea").value = "<%= rs.getString(13)  %>";
//document.getElementById("props_rmrks").value = "<%= rs.getString(16)  %>";

<%
if(!action_tp_str.equals("I")){
%>
document.getElementById("props_by").value = "<%= rs.getString(16)  %>";
//document.getElementById("recmnd_rmrks").value = "<%= rs.getString(17)  %>";
<%
}
if(action_tp_str.equals("A") || action_tp_str.equals("C")||action_tp_str.equals("T") || action_tp_str.equals("E") || action_tp_str.equals("DU") ){
%>
document.getElementById("recmnd_by").value = "<%= rs.getString(17)  %>";
//document.getElementById("apprv_rmrks").value = "<%= rs.getString(18)  %>";
<%
}
if(action_tp_str.equals("T") || action_tp_str.equals("E") || action_tp_str.equals("DU")){
%>
document.getElementById("apprv_by").value = "<%= rs.getString(22)  %>";
//document.getElementById("apprv_rmrks").value = "<%= rs.getString(18)  %>";
<%
}

if(!rs.getString(19).trim().equals("")){
%>
document.getElementById("sent_bck_rmrks").innerHTML = " <font color='#af7423' ><%= rs.getString(19)  %> </font>";
document.getElementById("sentBckRow").style.display = 'block';
<%
}
%>
document.getElementById("proposing_stn_in_scrn").innerHTML = " <span style='color:#206c1c;;font-size:13px;font-weight:bold;' ><b> "+
                                                             " (  <%= rs.getString(21)  %>  ) "+
                                                             "</b> </span>";



</script>


<%
}
rs.close();
ps.close();
if(!edit_md_any_rcrd_exist){
%>
<script>
alert("access denied !! ");
</script>
<%
}
}else if(name_addrs_chng_mode){
%>
<script>
document.getElementById("vndr_name").value = "<%= request.getParameter("vndr_new_name")  %>";
document.getElementById("vndr_addr1").value = "<%= request.getParameter("vndr_new_addr1")  %>";
document.getElementById("vndr_addr2").value = "<%= request.getParameter("vndr_new_addr2")  %>";
document.getElementById("vndr_addr3").value = "<%= request.getParameter("vndr_new_addr3")  %>";
document.getElementById("vndr_addr4").value = "<%= request.getParameter("vndr_new_addr4")  %>";
document.getElementById("vndr_addr5").value = "<%= request.getParameter("vndr_new_addr5")  %>";

</script>
<%
}


%>



Expand To Add Document Detail &nbsp;<br/>

  <a href="javascript:sizeTbl('none','minusimg','plusimg')"   ><img src="download.jpg" width="20" height="20"  id="minusimg" style="display:none"   /></a> 
 
    <a href="javascript:sizeTbl('block','plusimg','minusimg')" ><img src="contraction_img.jpg" width="20" height="20"  id="plusimg" /></a>

<br/>





<div id=tbl name=tbl style="overflow:hidden;display:none">

 <form type="hidden" id="uploadform" name="uploadform" enctype="multipart/form-data" action="Fileuploader" method="post">
                        
                        <input type="hidden" name="doc_type_h" />
                        <input type="hidden" name="filename_h" />
                        <input type="hidden" name="fileSrl_h" />

<table border=1>
<thead>
<tr>
    <th>Doc Type</th>
     <th>Status</th>
     <th> Doc No</th>
      <% if(edit_mode){ %>
     <th> Scan Doc </th>
      <% } %>
      <th>Upload Scan Doc </th>
      <th></th>
</tr>
</thead>

<tbody>
<%
ps = null;
rs = null;
String doc_srl_str = "";
String doc_scan_path = "";
String dummyVndrCd = "";
if(action_tp_str.equals("NAC")){
dummyVndrCd = "";
}else {
dummyVndrCd = vndr_cd_str ;
}
                            ps = mk.con.prepareStatement(doc_dtl_qry);
                            //ps.setString(1, genStn);
                            ps.setString(1, dummyVndrCd);
                            rs = ps.executeQuery();

                            while(rs.next()){
doc_srl_str += rs.getString(2)+"|";
                            %>
                           

<tr>
    <td> <%= rs.getString(1) %></td>
     <td>
         <select name="doc_sts<%= rs.getString(2) %>" onchange="controlBrowseBtn(this.value,'<%= rs.getString(2) %>');"  >
             <option value="0">NA</option>
             <option value="1">Not Rcvd</option>
             <option value="2">Received</option>
         </select>
     </td>
     <td> 
           <input type="text" id="photoname<%= rs.getString(2) %>"  name="photoname<%= rs.getString(2) %>" value = "<%= rs.getString(7).trim() %>" disabled />
           <input type="hidden" name="doc_tp_<%= rs.getString(2) %>" value ="<%= rs.getString(3) %>" />
     </td>
 <% 
   if(edit_mode){
%>
<script>
document.getElementById("doc_sts<%= rs.getString(2) %>").value = "<%= rs.getString(6) %>";
</script>
<%
doc_scan_path = rs.getString(5) ;
if(!rs.getString(4).equals("N")){
 %>
     <td>

    <!-- img src="<%= tmp_folder+"/"+ rs.getString(4)+"?"+(new Random()).nextInt(100) %>" class="scan_doc"  width="20" height="20"  /--> 

 <a href="#" onclick="showPdfDoc(this.src);"   width="20" height="20" src="<%= tmp_folder+"/"+ rs.getString(4) %>" >
            View
       </a>

</td>
 
    <% 
      }else if(rs.getString(6).equals("1")){
     %>
     <td> No Doc </td>
     <% 
      }else{
     %>

     <td>  </td>
<% 
       }
      }
    %>

      <td>
         <span id="spn_file_<%= rs.getString(2) %>" value = "<%= rs.getString(4).trim() %>" > 
               <input id="file<%= rs.getString(2) %>"  name="file<%= rs.getString(2) %>" type="file"   onchange= " upload2('<%= rs.getString(2) %>','<%= rs.getString(3) %>');" disabled />
         </span> 

      </td>
       <td>
      <a href="#" onclick="showPdfDoc(this.src);"  id="upldimg<%= rs.getString(2) %>" width="20" height="20" style="display:none;" src="" >
            View
       </a>
          <!-- img src="" id="upldimg<%= rs.getString(2) %>" width="20" height="20" style="display:none;"   /-->
          <img src="" id="waitingimg<%= rs.getString(2) %>" width="40" height="40" style="display:none;"  />
      </td>
</tr>


                            <%

if(edit_mode){
if(!rs.getString(4).equals("N")){
%>
<script>
document.getElementById("file<%= rs.getString(2) %>").disabled = false;
document.getElementById("photoname<%= rs.getString(2) %>").disabled = false;
</script>
<%
}
}

                            }

                            rs.close();
                            ps.close();




if(edit_mode){
File srcFolder = new File(doc_scan_path);
if( srcFolder.isDirectory()){
        File destFolder = new File(tmp_dir);

flhndl.copyFolder(srcFolder , destFolder);
}
}

                        %>

</tbody>
</table>
   

    </form>

<script>
vndr_entry_frm.doc_all_srl_h.value = "<%= doc_srl_str %>";
</script>
 
    <iframe id="target_iframe" name="target_iframe" style="display: none;" >
    
    </iframe>
</div>

<br/>
<br/>

<form name="pdfReadFrm" action ="readPdfDoc" method=POST target="_blank" >
<input type="hidden" name ="pdfReltvPath_h" value ="" />
</form>

<table>
    <tr>
        <td>
    <% if(edit_mode){ if(rjct_mode){ %>
            <!-- input type="button" value="UPDATE" class="buttonActive"  onclick="chkVndrFrm('U','<%= action_tp_str %>');" /-->
<input type="button" name="UPDATE" value="" style="width: 86px; height: 37px;background-image:url('btn_rjct.png');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkVndrFrm('U','<%= action_tp_str %>');">
       <%  }else if(trmn_mode){  %> 
<input type="button" name="UPDATE" value="" style="width: 115px; height: 38px;background-image:url('btn_trmnt.png');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkVndrFrm('U','<%= action_tp_str %>');">

       <%  }else if(delt_mode){ %>

<input type="button" name="UPDATE" value="" style="width: 86px; height: 37px;background-image:url('btn_delete.png');line-height: 3 7px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkVndrFrm('U','<%= action_tp_str %>');">

<% }else{  %> 
<input type="button" name="UPDATE" value="" style="width: 86px; height: 37px;background-image:url('btn_updt.jpeg');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkVndrFrm('U','<%= action_tp_str %>');">

       <% } }else{  %> 
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

       <%  }  %> 
        </td>
        <td>
        </td>
        <td>
        </td>

        <td>
<% if(action_tp_str.equals("I")){ %>
<% if(edit_mode){ %>
            <!-- input type="button" value="Send For Recommendation" class="buttonActive"  onclick="chkVndrFrm('U','R');"   /-->
<input type="button" name="Send For Recommendation" value="" style="width: 212px; height: 37px;background-image:url('btn_send_for_recommnd.jpeg');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkVndrFrm('U','R');">

       <%  }else{  %> 
            <!-- input type="button" value="Send For Recommendation" class="buttonActive"  onclick="chkVndrFrm('E','R');"   /-->
<input type="button" name="Send For Recommendation" value="" style="width: 212px; height: 37px;background-image:url('btn_send_for_recommnd.jpeg');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkVndrFrm('E','R');">
       <%  }  %> 
<%  }else if(action_tp_str.equals("NAC")){  %>
<input type="button" name="Send For Recommendation" value="" style="width: 212px; height: 37px;background-image:url('btn_send_for_recommnd.jpeg');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkVndrFrm('E','R');">

<%  }else if(action_tp_str.equals("R")){  %>
            <!-- input type="button" value="Send For Approval" class="buttonActive" onclick="chkVndrFrm('U','A');"   /-->

<input type="button" name="Send Back" value="" style="width: 113px; height: 37px;background-image:url('btn_sentbck.png');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="showSentBckDialog('U','SB','I');//chkVndrFrm('U','I');">

<input type="button" name="Send For Checking" value="" style="width: 152px; height: 36px;background-image:url('btn_send_for_checking.png');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkVndrFrm('U','C');">


       <%  }else if(action_tp_str.equals("C")){  %>
            <!-- input type="button" value="Send For Approval" class="buttonActive" onclick="chkVndrFrm('U','A');"   /-->
<input type="button" name="Send For Approval" value="" style="width: 146px; height: 37px;background-image:url('btn_send_for_apprv.jpeg');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkVndrFrm('U','A');">


       <%  }else if(action_tp_str.equals("A")){  %>
            <!-- input type="button" value="Approve" class="buttonActive" onclick="chkVndrFrm('U','V');"   /-->

<input type="button" name="Send Back" value="" style="width: 113px; height: 37px;background-image:url('btn_sentbck.png');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="showSentBckDialog('U','SB','R'); //chkVndrFrm('U','R');">

<input type="button" name="Approve" value="" style="width: 92px; height: 37px;background-image:url('btn_apprv.jpeg');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkVndrFrm('U','V');">

       <%  }  %> 
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
   text-shadow: #222222 1px 1px 0;"  onClick="cancel_action('blank_pg_for_sp_vndr.html','_self')" >

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





<div id="popup1"  >
         <a class="bClose"><img src="cancel.png" width="20" height="20" /><a/>
        <br/>
      <a href="#" >  <img src="clockimg2.jpg" width="20" height="20"  class="rotation" action_tp = "plus"   /></a>
 <a href="#" >  <img src="anticlockimg3.jpg" width="20" height="20"  class="rotation"  action_tp = "minus"  /></a>
&nbsp;
&nbsp;
&nbsp;
<img src="zoom_in.png" width="40" height="40" class="zoom_in_out" action_tp ="incr" />
<img src="zoom_out.png" width="40" height="40" class="zoom_in_out" action_tp ="decr"  />
<br/>
<div id="lrgimg1cntnr"  >  
   <img id="largeImg1" src="" width="600" height="600" /> 

</div>
     </div>


<div id="tip2_right" style="display:none;"><img id="largeImg2" src="" width="600" height="500" />
</div>



<div id="sentBckDialog"  >
         <a class="bClose"><img src="cancel.png" width="20" height="20" /><a/>
        <br/>

<table>
<tr>
<td>
Remarks
</td>
<td>
<input type="text" id="sent_back_rmrks"  size=40 />
<input type="hidden" id="sent_back_entry_md"  value ="" />
<input type="hidden" id="sent_back_vndr_sts"  value ="" />
<input type="hidden" id="sent_back_sts"  value ="" />
</td>
</tr>
<tr align=center>
<td colspan = 2>
<input type=button value="Submit" onclick="doSendBack();" />
<input type=button value="Cancel" onclick="$('#sentBckDialog').bPopup().close();" />
</td>
</tr>
</table>


 </div>



<%
if(edit_mode){
%>
<script>
$(window).load(function(){

$('.scan_doc').each(function(e) {

 eachElemnt = this ; 
 $(this).bind('click',function(e) {
         
 //alert($(this).attr("src"));
                 $("#largeImg1").removeAttr("src");
                 document.getElementById('lrgimg1cntnr').innerHTML="<img id=\"largeImg1\" src=\""+$(this).attr("src")+"\" width=\"600\" height=\"600\" /> ";
                 $("#largeImg1").removeAttr("src").attr("src",$(this).attr("src")+"?"+ Math.random() );
                // Prevents the default action to be triggered.
                e.preventDefault();

                // Triggering bPopup when click event is fired
                $('#popup1').bPopup({opacity: 0.0});


         

            });
            });


newangle =0;
$('.rotation').unbind('click');
$("#largeImg1").unbind('rotate');
               $('.rotation').click(function() {
    if ($(this).attr('action_tp') == 'minus')
        operation = "-";
    else
        operation = "+";

    //alert(operation)
    var angle = next(operation);
   // alert(" angle "+angle);
    $("#largeImg1").rotate(angle);
});





            });

</script>
<%
}

%>

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

