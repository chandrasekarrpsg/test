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
<script type='text/JavaScript' src='js/best_cal_ag.js'></script> 
<link href="styles.css" rel="stylesheet" type="text/css" />
 <script type="text/javascript" src="js/sel_month_spbill.js"></script>
 <script type="text/javascript" src="js/date_check_ag.js"></script>
 <script type="text/javascript" src="js/common_spbill_vndr.js"></script>

<style>
.thd{
background-color:#fec58b;
}

.genStnStyle1{
              font-size: 8pt; 
              color:#bb4459; 

}
.erp_ac_style1{
              font-size: 12pt;
              color:black ;

}
.erp_ac_style2{
              font-size: 15pt;
              color:#bb4459;

}

.billRefStyle{
              font-size: 10pt bold;
              color:black;
              text-align:center;
               

}



.buttonActive{color: #F8F2AD; 
              background-color: #95004A; 
              font-family: Courier New; 
              font-size: 12pt; 
              font-weight: bold; 
              border-style: outset}





            #loadingPopup {
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



 <script>

String.prototype.trim=function(){return this.replace(/(?:(?:^|\n)\s+|\s+(?:$|\n))/g,'').replace(/\s+/g,' ');};

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
           
            
            function chkSpbillFrm(entryMode){




                
                if(vndr_entry_frm.selGenStn.value == ''){
                    alert("Please Select Generating Station !");
                    return false ;
                }
                
                 if(vndr_entry_frm.dept_fld.value == ''){
                    alert("Please select Dept Name !");
                    return false ;
                 }
                 if(vndr_entry_frm.unt_fld.value == ''){
                    alert("Please Select Unit !");
                    return false ;
                 }
                 if(vndr_entry_frm.jbTyp_Fld.value == ''){
                    alert("Please Select Job Type !");
                    return false ;
                 }
                 if(vndr_entry_frm.bill_no.value == ''){
                    alert("Please Enter Bill No !");
                    return false ;
                 }
                 if(vndr_entry_frm.bill_dt.value == ''){
                    alert("Please Enter Bill Date !");
                    return false ;
                 }else{
                    if(!isLowerDate(vndr_entry_frm.bill_dt.value) ){
                      alert("Bill date must be less than System Date !");
                       return false ;
                     }
                    
                 }

                 if(vndr_entry_frm.bill_amt.value == ''){
                    alert("Please Enter Bill Amount !");
                    return false ;
                 }else if(!IsNumeric(vndr_entry_frm.bill_amt.value) || parseInt(vndr_entry_frm.bill_amt.value) <= 0){
                    alert("Bill Amount must be numeric and greter than 0  !");
                    return false ;
                 }

                if(vndr_entry_frm.ordr_dt.value.trim() != ''){
                   if(!compareDate(vndr_entry_frm.ordr_dt.value,vndr_entry_frm.bill_dt.value)){
                      alert("Bill date must be greater than or equal to Order Date !");
                      return false ;
                   }
                 }

               if(vndr_entry_frm.bill_rcvd_on.value.trim() != ''){
                   if(!compareDate(vndr_entry_frm.bill_dt.value,vndr_entry_frm.bill_rcvd_on.value)){
                      alert("Received date must be greater than or equal to Bill Date !");
                      return false ;
                   }else if(!isLowerDate(vndr_entry_frm.bill_rcvd_on.value) ){
                      alert("Received date must be less than System Date !");
                       return false ;
                     }

                 }
               if(vndr_entry_frm.job_mnth.value.trim() != ''){
                   if(!compareDate('01-'+vndr_entry_frm.job_mnth.value,vndr_entry_frm.bill_dt.value)){
                      alert("Job month must be less than or equal to Bill Month !");
                      return false ;
                   }
                 }
 

               

                 if(vndr_entry_frm.plant_sel.value == ''){
                    alert("Please Select Plant !");
                    return false ;
                 } 
                 if(vndr_entry_frm.equip_sel.value == ''){
                    alert("Please Select Equipment !");
                    return false ;
                 }
                if(vndr_entry_frm.vndr_sel.value == ''){
                    alert("Please Select Vendor !");
                    return false ;
                 }
                 if(vndr_entry_frm.bdgt_sel.value == ''){
                    alert("Please Enter Budget !");
                    return false ;
                 }

vndr_entry_frm.entry_mode_h.value = entryMode ;
if(document.getElementById("Y1").checked){
vndr_entry_frm.urgent_basis_h.value = "Y";
}else {
vndr_entry_frm.urgent_basis_h.value = "N";
}
if(document.getElementById("Y2").checked){
vndr_entry_frm.invoice_attchd_h.value = "Y";
}else {
vndr_entry_frm.invoice_attchd_h.value = "N";
}
vndr_entry_frm.urgent_rmrks_h.value = document.getElementById("urgnt_rmrks").value ;

if(vndr_entry_frm.cncl_rmrks){
  if(vndr_entry_frm.cncl_rmrks.value == ''){
  alert(" Please Cancellation remarks !");
   return false ;
  }
}


document.getElementById("selGenStn").disabled = false ;
document.getElementById("dept_fld").disabled = false ;
document.getElementById("unt_fld").disabled = false ;
document.getElementById("jbTyp_Fld").disabled = false ;
document.getElementById("ordr_no").disabled = false ;
document.getElementById("ordr_dt").disabled = false ;
document.getElementById("bill_no").disabled = false ;
document.getElementById("bill_dt").disabled = false ;
document.getElementById("bill_rcvd_on").disabled = false ;
document.getElementById("bill_amt").disabled = false ;
document.getElementById("job_mnth").disabled = false ;
document.getElementById("bill_sts").disabled = false ;
document.getElementById("bill_desc").disabled = false ;
document.getElementById("add_rmrks").disabled = false ;
document.getElementById("plant_sel").disabled = false ;
document.getElementById("equip_sel").disabled = false ;
document.getElementById("vndr_sel").disabled = false ;
document.getElementById("bdgt_sel").disabled = false ;


                vndr_entry_frm.submit();
                
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



            $("#spn_file_"+srl).attr("value",doctp+".jpg"); 

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
 
            
            
       function sizeTbl(h,id1,id2,tblId) {
  var tbl = document.getElementById(tblId);
  tbl.style.display = h;
  document.getElementById(id2).style.display = 'block';
  document.getElementById(id1).style.display = 'none';
}     
     





function getDtlsFrmDb(typeStr)
{

var url1 ="";
var params = "";
var ajaxNm = "spbill_fetch_dtls_frmDb.jsp";

if(typeStr == 'GS'){
var genStnCd = document.getElementById("selGenStn").value ;
var lognDeptCd = document.getElementById("login_dept_h").value ;
 url1 = ajaxNm;
 params = "callName="+typeStr+"&"+
          "genStnCd="+genStnCd +"&"+
          "lognDeptCd="+lognDeptCd +
           "";
}else if(typeStr == 'P'){
select = document.getElementById("equip_sel");
             select.options.length = 0;

var genStnCd = document.getElementById("selGenStn").value ;
var untCd = document.getElementById("unt_fld").value ;
var jbType = document.getElementById("jbTyp_Fld").value ;
 url1 = ajaxNm;
 params = "callName="+typeStr+"&"+
          "genStnCd="+genStnCd +"&"+
          "untCd="+untCd +"&"+
          "jbType="+jbType +
           "";



}else if(typeStr == 'EQ'){
var genStnCd = document.getElementById("selGenStn").value ;
var plntref = document.getElementById("plant_sel").value ;
 url1 = ajaxNm;
 params = "callName="+typeStr+"&"+
          "genStnCd="+genStnCd +"&"+
          "plntref="+plntref +
           "";



} else if(typeStr == 'VNDRDTLS'){
var vndrCd = document.getElementById("vndr_sel").value ;
 url1 = ajaxNm;
 params = "callName="+typeStr+"&"+
          "vndrCd="+vndrCd +""+
           "";



}

$('#loadingPopup').bPopup({opacity: 0.4});
$('#loadingPopup').corner("15px");

http.open("POST", url1, true);
http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http.onreadystatechange = function()
   {
        if(http.readyState == 4 && http.status == 200)
        { 
         if(typeStr == 'GS'){
            //alert(http.responseText);
            results0 = http.responseText.split("$$");
           document.getElementById("genStnLongNm").innerHTML = results0[0];
            results = results0[1].split("&&");
            var select ="";
             var deptSelArr = results[0].split("|"); 
             select = document.getElementById("dept_fld");
             select.options.length = 0;

             for(var i=0;i<deptSelArr.length;i++){
                  if(deptSelArr[i].trim() != ''){
                 var deptSelTxtValArr = deptSelArr[i].split("~");
                 select.options[select.options.length] = new Option(deptSelTxtValArr[1], deptSelTxtValArr[0]); 
                  }
             }
            var untSelArr = results[1].split("|");
             select = document.getElementById("unt_fld");
             select.options.length = 0;

             for(var i=0;i<untSelArr.length;i++){
                if(untSelArr[i].trim() != ''){
                 var untSelTxtValArr = untSelArr[i].split("~");
                 select.options[select.options.length] = new Option(untSelTxtValArr[1], untSelTxtValArr[0]);
                 }
             }
 
 
         document.getElementById("plant_sel").options.length = 0;         
          }else if(typeStr == 'P'){
           results = http.responseText.split("|"); 
           if(results[0].length <= 0){
              alert("No Plant Exists !");
              return false ;
             }
           var select ="";
           select = document.getElementById("plant_sel");
             select.options.length = 0;
              for(var i=0;i<results.length;i++){
                if(results[i].trim() != ''){
                 var plntSelTxtValArr = results[i].split("~");
                 select.options[select.options.length] = new Option(plntSelTxtValArr[1], plntSelTxtValArr[0]);
                 }
             }

          }else if(typeStr == 'EQ'){
           results = http.responseText.split("|");
           
           if(results[0].length <= 0){
              alert("No Equipment Exists !");
              return false ;
           }

           var select ="";
           select = document.getElementById("equip_sel");
             select.options.length = 0;
              for(var i=0;i<results.length;i++){
                if(results[i].trim() != ''){
                 var plntSelTxtValArr = results[i].split("~");
                 select.options[select.options.length] = new Option(plntSelTxtValArr[1], plntSelTxtValArr[0]);
                 }
             }

          }else if(typeStr == 'VNDRDTLS'){
           results = http.responseText.split("|");

           if(results[0].length <= 0){
              alert("No Vendor Exists !");
              return false ;
           }
             document.getElementById("vndr_nm_ele").innerHTML = results[0] ;
             if(results[1].trim() != ''){
             document.getElementById("vndr_addr1_ele").innerHTML = results[1] ;
              document.getElementById("vndr_addr1_ttl").style.display = 'block';
             }else{
              document.getElementById("vndr_addr1_ttl").style.display = 'none';
             }
             if(results[2].trim() != ''){
             document.getElementById("vndr_addr2_ele").innerHTML = results[2] ;
              document.getElementById("vndr_addr2_ttl").style.display = 'block';
             }else{
              document.getElementById("vndr_addr2_ttl").style.display = 'none';
             }
             if(results[3].trim() != ''){
             document.getElementById("vndr_addr3_ele").innerHTML = results[3] ;
              document.getElementById("vndr_addr3_ttl").style.display = 'block';
             }else{
              document.getElementById("vndr_addr3_ttl").style.display = 'none';
             }
             if(results[4].trim() != ''){
             document.getElementById("vndr_addr4_ele").innerHTML = results[4] ;
              document.getElementById("vndr_addr4_ttl").style.display = 'block';
             }else{
              document.getElementById("vndr_addr4_ttl").style.display = 'none';
             }
             if(results[5].trim() != ''){
             document.getElementById("vndr_addr5_ele").innerHTML = results[5] ;
              document.getElementById("vndr_addr5_ttl").style.display = 'block';
             }else{
              document.getElementById("vndr_addr5_ttl").style.display = 'none';
             }
          $("#vndr_dtls_popup").bPopup();

          }
         $("#loadingPopup").bPopup().close();
        }
  }




http.send(params);



}




function sel_budg()
{
var url="budget.jsp?";
window.vndr_entry_frm.bdgt_sel.value="Please wait..........";
window.status="Opening Budget Heads Menu !. Please wait.....................";
var c=showModalDialog(url,0,"dialogWidth:950px;dialogHeight:600px");
window.status=" ";
if (c!=null) {
         var bdgt_arr = c.split("|");
        document.vndr_entry_frm.bdgt_sel.value=bdgt_arr[0];
        document.vndr_entry_frm.bdgt_sel_seq.value=bdgt_arr[1];
       // document.getElementById("bugt_pos_link").style.display = "block"; 
        //alert(bdgt_arr[1]);
}
else {
        document.vndr_entry_frm.bdgt_sel.value="";
}
}

       
            
        </script>


 <style>
     
     body{
         font-family:arial;
         color: #545bb4;
         font-weight: bold;
         font-size: small;
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

 #vndr_dtls_popup {
    background-color:#289;
    border-radius:15px;
    color:#000;
    display:none;
    padding:20px;
    min-width:100px;
    min-height: 100px;
}

.cls2{
  font-size:25px;
}
.cls3{
  font-size:25px;
  background-color:#f4f4f4;
}


.value_style_1{
color:#008080;
font-size:15px;
}

        </style>
        
        
    </head>
    <body>
        


   <%    
        String spbilref_str = request.getParameter("spbilref_h") == null ?"":request.getParameter("spbilref_h") ;
        String action_tp_str = request.getParameter("action_type_h") == null ?"I":request.getParameter("action_type_h") ;
        boolean edit_mode = false;
        boolean rjct_mode = false;
        boolean trmn_mode = false;
        boolean normal_edt_mode = false;
       if(!spbilref_str.equals("") && !action_tp_str.equals("E") && !action_tp_str.equals("T") && !action_tp_str.equals("C") ){
          edit_mode = true;
       }else if(action_tp_str.equals("E")){
         normal_edt_mode = true;
          edit_mode = true;
       }else if(action_tp_str.equals("T")){
          trmn_mode = true;
          edit_mode = true;
       }else if(action_tp_str.equals("C")){
          rjct_mode = true;
          edit_mode = true;
       } 

//System.out.println("  edit_mode "+edit_mode+" action_tp_str "+action_tp_str+" spbilref_str "+spbilref_str);
LoginBean loginBn = (LoginBean) ((request.getSession()).getAttribute("loginBean"));
    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    FileHandling flhndl = new FileHandling();
    String curdate = new String() ;
    String genStn = "";
    String genStnName = "";
    String sysdateStr = "";
    genStn = loginBn.getsGenStn();
    genStnName = loginBn.getsGenStnNm();
    String logn_dept_str =   loginBn.getsDept();
 //System.out.println(" ngenStn  : "+genStn+"  Name : "+genStnName);
    try {

        PreparedStatement ps = null ;
        ResultSet rs = null ;
        PreparedStatement ps2 = null ;
        ResultSet rs2 = null ;
 String get_sys_dt = " select to_char(sysdate,'dd/MM/yyyy') from dual ";
     ps = mk.con.prepareStatement(get_sys_dt);
                            rs = ps.executeQuery();

                            if(rs.next()){
                              sysdateStr = rs.getString(1);
                            }
                           rs.close();
                           ps.close();

rs = null ;
ps = null ;

/******  to be removed added for testing purpose ****/
//genStn = "019";


String stnShrtDesc = "";
String get_login_stn_sdesc = " select STATION_SHT_DESC  from CD_STATION where ORBL_STATION_CD = ?   ";
     ps = mk.con.prepareStatement(get_login_stn_sdesc);
                            ps.setString(1, genStn);
                            rs = ps.executeQuery();

                            if(rs.next()){
                              stnShrtDesc = rs.getString(1);
                            }
                           rs.close();
                           ps.close();
rs = null ;
ps = null ;

boolean isCTMStn = false;

if(stnShrtDesc.equals("CTM")){
isCTMStn = true;
}


int spbl_count = 0;
String spcl_stn_str = "";
String spcl_dept_str = "";
String spcl_unit_str = "";
String spcl_jbtp_str = "";
String spcl_plnt_str = "";
String spcl_eqrf_str = "";
int spbill_ref_id = 0;
String spbill_fin_rcvd_dt =  "";
String spbill_erp_ac_str =  "";

String temp_crieria = "";


if(action_tp_str.equals("E") || action_tp_str.equals("C")){

ps = null;
rs = null ;

temp_crieria = " AND STATION = '"+genStn+"'  ";

if(logn_dept_str.equals("30")){
temp_crieria = "";
}
      String chk_vndr_cd = " select  DEPT,UNIT_ERP,JOBTYPE,PLANT_REF ,EQREF ,    "+
                           "         nvl(BILL_REF_ID,0),                        "+
                           "         nvl(to_char(FINANCE_RECVD_DATE,'dd-Mon-yyyy'),' ') , "+
                           "          nvl(ERP_AC,' ') ,       "+
                           "          STATION  "+
                           " from ORBL_SPBILL_DTL                "+
                           "  where BILLREF = ?                 "+
                           "  and   DEPT in  ( select distinct  d1.DEPT    "+
                                            " from ORBL_CD_DEPT d1 ,ORBL_CD_DEPT_MST d2    "+
                                            " where d1.LOGIN_DEPT = d2.DEPT_SDESC          "+
                                            " and d1.STATION = d2.STATION                           "+
                                            " and d2.STATION = ?                           "+
                                            " and d2.DEPT = ?             )                "+
                           "  and nvl(BILL_CANCEL,'N') = 'N'  "+
                           "  and nvl(BILL_REF_ID,0) = 0   " + temp_crieria;

 //System.out.println(" chk_vndr_cd  : "+chk_vndr_cd+"  spbilref_str "+spbilref_str+" genStn "+genStn+" logn_dept_str "+logn_dept_str);
     ps = mk.con.prepareStatement(chk_vndr_cd);
                            ps.setString(1, spbilref_str);
                            ps.setString(2, genStn);
                            ps.setString(3, logn_dept_str);
                            rs = ps.executeQuery();

                            if(rs.next()){
                              spbl_count=1 ;
                              spcl_dept_str = rs.getString(1);
                              spcl_unit_str = rs.getString(2);
                              spcl_jbtp_str = rs.getString(3);
                              spcl_plnt_str = rs.getString(4);
                              spcl_eqrf_str = rs.getString(5);
                              spbill_ref_id = rs.getInt(6);
                              spbill_fin_rcvd_dt = rs.getString(7);
                              spbill_erp_ac_str = rs.getString(8);
                              spcl_stn_str = rs.getString(9);



                            } 
                           rs.close();
                           ps.close();
genStn = spcl_stn_str ;
  rs = null;
  ps = null;
}else{
spbl_count =1;
}

if(spbl_count >0){



        String build_dir = "/ltora/oracle64/j2ee/GENORBL/genorbl/build/web/";
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
        


 
        String props_dept_qry = "  select  DEPT_SDESC,DEPT from ORBL_CD_DEPT_MST  where STATION = ?   order by DEPT_SDESC";
        
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
        


<div id="loading" style="display:none;" >
        Loading....
</div>
<% if(!spbilref_str.equals("")){  %>
<p class= "billRefStyle" >Bill Reference No.: <span class="value_style_1" ><%= spbilref_str  %></span> </p>
<% }  %>

<form name="vndr_entry_frm" action="spbill_entry_intrmdt.jsp" method="POST" target="_self" >
        <table width="100%"  >
<tr>
 <td colspan=4 > <font color=#9d4f00 size=4><b> &nbsp; &nbsp; &nbsp;  <%= genStnName  %></b> </font>
                </td>

</tr>
<tr></tr>
<tr></tr>
            <tr>
                <td> Bill Certified By:</td>
                <td class="value_style_1" >
                   <%=  loginBn.getsEmpFNm() +" "+loginBn.getsEmpLNm()  %>
                </td>
                <td>
                Bill Release On :
                </td>
                <td class="value_style_1" >
               <%= sysdateStr %> 
                </td>
            </tr>
            <tr>
           <td> Station:</td>
                <td>
                   <select name="selGenStn" id="selGenStn" onchange="getDtlsFrmDb('GS');" >
                   <% 
                  if(isCTMStn){ 
                   String selGenstnQry = " select  STATION_SHT_DESC , ORBL_STATION_CD from CD_STATION order by STATION_SHT_DESC  ";  
                   rs = null;
                   ps = null;
                            ps = mk.con.prepareStatement(selGenstnQry);
                            rs = ps.executeQuery();


%>
                   <option value="" > SELECT STATION </option>

<%
                            while(rs.next()){
                   %>
                   <option value="<%=  rs.getString(2) %>" > <%= rs.getString(1) %> </option>

                   <%
                     }
                           rs.close();
                           ps.close();


                   }else{ 
                   %>
                   <option value="<%=  genStn %>" > <%= stnShrtDesc %> </option>
                   <%  } %>
                  </select>
                </td>
                <td>
                Department :
                </td>
                <td>
<select  name="dept_fld" id ="dept_fld"  >
               <%     

              rs = null;
              ps = null;


                  //System.out.println(" logn_dept_str "+logn_dept_str);
                    String get_ordr_dept  = " select distinct d1.ORDER_DEPT , d1.DEPT    "+
                                            " from ORBL_CD_DEPT d1 ,ORBL_CD_DEPT_MST d2  "+
                                            " where d1.LOGIN_DEPT = d2.DEPT_SDESC          "+
                                            " and d1.STATION = d2.STATION                           "+
                                            " and d2.STATION = ?                   "+
                                            " and d2.DEPT = ?                          "+
                                            "  order by d1.ORDER_DEPT   ";

                            ps = mk.con.prepareStatement(get_ordr_dept);
                            ps.setString(1, genStn);
                            ps.setString(2, logn_dept_str);
                            rs = ps.executeQuery();

                            while(rs.next()){
   %>
<option value="<%=rs.getString(2)  %>">  <%= rs.getString(1)  %>  </value>
<%
                            }
                           rs.close();
                           ps.close();

                 %> 
</select>
                </td>
            </tr>
             <tr>
             <td></td>
             <td colspan=3> <span id="genStnLongNm" class="genStnStyle1" >(  <%= genStnName %>  )</span></td>
            </tr>
            <tr>
                <td> Unit:<span style="color:red;font-size:14pt;">*</span></td>
                <td>

              <select name="unt_fld" id="unt_fld" onchange = "if(this.value != ''){getDtlsFrmDb('P');}" >
               <%

              rs = null;
              ps = null;

                    String get_unit  = " select UNIT_ERP , UNIT_DESC   from ORBL_CD_UNIT where STATION = ? and VALID = '1'  order by UNIT_DESC  ";
                            ps = mk.con.prepareStatement(get_unit);
                            ps.setString(1, genStn);
                            rs = ps.executeQuery();

                            while(rs.next()){
   %>
<option value="<%=rs.getString(1)  %>">  <%= rs.getString(2)  %>  </value>
<%
                            }
                           rs.close();
                           ps.close();

                 %>
</select>

                </td>
<td> Job Type:<span style="color:red;font-size:14pt;">*</span></td>
                <td>
   <select name ="jbTyp_Fld" id= "jbTyp_Fld" onchange = "if(this.value != ''){getDtlsFrmDb('P');}" >
               <%

              rs = null;
              ps = null;

                    String get_job_tp  = " select JOB_TYPE , JOB_DESCRIPTION   from ORBL_CD_JOB_TYPE where VALID = '1'  order by JOB_DESCRIPTION  ";
                            ps = mk.con.prepareStatement(get_job_tp);
                            rs = ps.executeQuery();

                            while(rs.next()){
   %>
<option value="<%=rs.getString(1)  %>">  <%= rs.getString(2)  %>  </value>
<%
                            }
                           rs.close();
                           ps.close();

                 %>

</td>

            </tr>
            <tr>
                <td> Order No.:</td>
                <td>
                    <input type="text" name="ordr_no"   />
                </td>
                <td> Order Date:</td>
                <td>
                    <input type="text" name="ordr_dt"  onclick='scwShow(this,event);'   />
                </td>
            </tr>

            <tr>
                <td> Bill Number:<span style="color:red;font-size:14pt;">*</span></td>
                <td>
                    <input type="text" name="bill_no"   />
                </td>
                <td> Bill Date:<span style="color:red;font-size:14pt;">*</span></td>
                <td>
                    <input type="text" name="bill_dt" onclick='scwShow(this,event);'  />
                </td>

            </tr>
            <tr>
                <td> Bill Received On:</td>
                <td>
                    <input type="text" name="bill_rcvd_on" onclick='scwShow(this,event);'  />
                </td>
                <td> Bill Amount(Rs.):<span style="color:red;font-size:14pt;">*</span></td>
                <td>
                    <input type="text" name="bill_amt"  />
                </td>

            </tr>
            <tr>
                <td> Job Month:</td>
                <td>
                    <input type="text" name="job_mnth" onclick="sel_month('vndr_entry_frm.job_mnth','js/');"  />
                </td>
                <td> Bill Status:</td>
                <td>
                    <select name="bill_sts" >
                      <option value ="1" > Actual </option>
                      <option value ="0" > Provisional </option>
                    </select>
                </td>

            </tr>
            <tr>
                <td> Bill Description :</td>
                <td colspan = 3 >
                    <input type="text" name="bill_desc"   maxlength=45 size=45   />
                </td>
            </tr>
            <tr>
                <td> Additional Remarks :</td>
                <td colspan = 3 >
                    <input type="text" name="add_rmrks"   maxlength=45 size=45   />
                </td>
            </tr>
            <tr>
                <td> Plant :<span style="color:red;font-size:14pt;">*</span></td>
                <td colspan = 3 >
                   <select name="plant_sel" id="plant_sel"  onclick = "if(this.options.length <= 1 && this.value == ''){getDtlsFrmDb('P');}" onchange = "getDtlsFrmDb('EQ');" >
               <% if(!edit_mode){  %>
                      <option value="">SELECT</option>
                <%  }else { 

                       String var1 = "";
       if(spcl_jbtp_str.equals("M")){
            var1 = " M_CC is not null ";
       }else if(spcl_jbtp_str.equals("O")){
            var1 = " O_CC is not null ";
       }
           String  qry1 = " select   PLANT_REF, "+
                    "          PLANT_DESC   "+
                    "  from ORBL_CD_PLANT           "+
                    "  where STATION = ? "+
                    "  AND UNIT like  ?        "+
                    "  AND VALID =  '1'        "+
                    "  AND "+  var1 +
                    "  order by PLANT_DESC  ";


      ps = null;
      rs = null;

      ps  = mk.con.prepareStatement(qry1);

      ps.setString(1,genStn);
      ps.setString(2,"%"+spcl_unit_str+"%");
      rs=ps.executeQuery();
       while(rs.next())
          {
              %>

            <option value="<%= rs.getString(1)  %>"><%=  rs.getString(2) %></option>

              <%    
          }

      rs.close();
      ps.close();


                    }
                 %>
                    </select>
                </td>
            </tr>
            <tr>
                <td> Equipment :<span style="color:red;font-size:14pt;">*</span></td>
                <td colspan = 3 >
            <select name="equip_sel" id="equip_sel" onclick = "if(this.options.length <= 1 && this.value == ''){getDtlsFrmDb('EQ');}"   >
            <% if(!edit_mode){  %>
                      <option value="">SELECT</option>
                <%  }else { 

      ps = null;
      rs = null;

                  String    qry2 = " select   EQUIPMENT, "+
                    "          EQUIPMENT_DESC   "+
                    "  from ORBL_CD_EQUIPMENT           "+
                    "  where STATION = ? "+
                    "  AND PLANT_REF = ?        "+
                    "  AND VALID = '1'        "+
                    "  order by EQUIPMENT_DESC  ";

      ps  = mk.con.prepareStatement(qry2);

      ps.setString(1,genStn);
      ps.setString(2,spcl_plnt_str);
      rs=ps.executeQuery();
       while(rs.next())
          {              %>

            <option value="<%= rs.getString(1)  %>"><%=  rs.getString(2) %></option>

              <%    

          }

      rs.close();
      ps.close();


                    }
                 %> 
                    </select>
                </td>
            </tr>
            <tr>
                <td> Vendor :<span style="color:red;font-size:14pt;">*</span></td>
                <td colspan = 3 >
                   <select name="vndr_sel" id="vndr_sel" onchange ="getDtlsFrmDb('VNDRDTLS');"   >

                      <option value="">SELECT VENDOR</option>

<%
              rs = null;
              ps = null;

                    String get_vndr_qry  = " select VENDOR_CODE , VENDOR_NAME  from ORBL_VENDOR_MST where VENDOR_STATUS in ('V','O')  order by VENDOR_NAME  ";
                            ps = mk.con.prepareStatement(get_vndr_qry);
                            rs = ps.executeQuery();

                            while(rs.next()){
    %>
           <option value="<%=rs.getString(1)  %>">  <%= rs.getString(2)  %>  </value>
<%
                            }
                           rs.close();
                           ps.close();

%>

                    </select>
                </td>
            </tr>
            <tr>
                <td> Budget Head :<span style="color:red;font-size:14pt;">*</span></td>
                <td colspan = 3 >
                  <input type=text name="bdgt_sel" id="bdgt_sel" onclick="sel_budg();" >
                  <input type=hidden name="bdgt_sel_seq" id="bdgt_sel_seq" >
                </td>
            </tr>
             <tr>
                <td colspan = 4 >
                   <span id="bugt_pos_link" style="display:none;" >
                      <a href=# target="_blank"> Click on the link to view Budget Position </a> 
                   </span>
                </td>
            </tr>

            
<%
if(rjct_mode){
%>
<tr>
                <td> Cancel Remarks <span style="color:red;font-size:14pt;">*</span> :</td>
                <td colspan = 3 >
                  <input type=text name="cncl_rmrks" id="cncl_rmrks" size=70  >
                </td>
            </tr>

<%
}
%>

        </table>


<input type="hidden" name="login_dept_h" value = "<%= logn_dept_str %>" />
<input type="hidden" name="entry_mode_h" value = "" />
<input type="hidden" name="urgent_basis_h" value = "N" />
<input type="hidden" name="invoice_attchd_h" value = "N" />
<input type="hidden" name="spbill_ref_h" value = "" />
<input type="hidden" name="spbill_erp_ac_h" value = "" />
<input type="hidden" name="urgent_rmrks_h" value = "" />
<input type="hidden" name="action_type_h" value = "<%= action_tp_str %>" />

</form>
<br/>
<script>
document.getElementById("selGenStn").value = "<%= genStn  %>";
</script>




<font color="#c25954">Expand For Urgent Payment &nbsp;</font> <br/>
  <a href="javascript:sizeTbl('none','minusimg','plusimg','tbl1')"   ><img src="download.jpg" width="20" height="20"  id="minusimg" style="display:none"   /></a> 
 
    <a href="javascript:sizeTbl('block','plusimg','minusimg','tbl1')" ><img src="contraction_img.jpg" width="20" height="20"  id="plusimg" /></a>


<br/>


<div id=tbl1 name=tbl1 style="overflow:hidden;display:none">
<table width=100% >
<tr>
<td>
Do you need this bill to be paid on Urgent basis ?
</td>
<td>
<input type=radio name=chk1 id="Y1" /> Yes
 or &nbsp;
<input type=radio name=chk1 id="N1" checked /> No 
</td>
</tr>
<tr>
<td>
Will the invoice be attached with the Urgent Payment Request Form ?
</td>
<td>
<input type=radio name=chk2 id="Y2" /> Yes
 &nbsp;  or &nbsp;
<input type=radio name=chk2 id="N2" checked /> No 
</td>
</tr>
<tr>
<td colspan = 2>
Remarks : <input type=text id="urgnt_rmrks" size=80 maxlength=85 />
</td>
</tr>
</table>

</div>



<%

if(edit_mode){
String vndr_dtls_qry = " select  BILLREF,          "+
                       "        BILL_AMT ,           "+
                       "        nvl(BILL_NO,' ') ,           "+
                       "        to_char(BILL_RELEASE_DATE,'dd-Mon-yyyy') ,           "+
                       "        nvl(to_char(BILL_RECEIVED_DATE,'dd-Mon-yyyy'),' ') ,           "+
                       "        nvl(to_char(JOB_MONTH,'Mon-yyyy'),' ') ,           "+
                       "        JOBTYPE ,           "+
                       "        nvl(to_char(ORDDT,'dd-Mon-yyyy'),' ') ,           "+
                       "        nvl(ORDNO,' ') ,           "+
                       "        UNIT_ERP ,           "+
                       "        STATION ,           "+
                       "        BILL_STATUS ,           "+
                       "        BUDG_AC ,           "+
                       "        CERT_BY ,           "+
                       "        DEPT ,           "+
                       "        nvl(DESCRIP,' ') ,           "+
                       "        nvl(REMARKS,' ') ,           "+
                       "        EQREF ,           "+
                       "        VENDOR ,           "+
                       "        BUDG_AC ,           "+
                       "        ERP_AC ,           "+
                       "        URGENT_PAYMENT ,           "+
                       "        URGENTINVOICEATTACHED ,           "+
                       "        nvl(URGENT_REMARKS,' ') ,           "+
                       "        to_char(BILL_DT,'dd-Mon-yyyy') ,           "+
                       "        BILL_REF_ID ,           "+
                       "        to_char(FINANCE_RECVD_DATE,'dd-Mon-yyyy') ,           "+
                       "        PLANT_REF ,           "+
                       "        HEAD_SEQ_NO            "+
                       "  from ORBL_SPBILL_DTL       "+
                       "   where BILLREF = ?    "+
                       "";




rs = null;
ps = null;
ps = mk.con.prepareStatement(vndr_dtls_qry);
                            ps.setString(1, spbilref_str);
                            rs = ps.executeQuery();

                            if(rs.next()){
%>
<script>

document.getElementById("spbill_ref_h").value = "<%= rs.getString(1)  %>";
document.getElementById("selGenStn").value = "<%= rs.getString(11)  %>";
document.getElementById("dept_fld").value = "<%= rs.getString(15)  %>";
document.getElementById("unt_fld").value = "<%= rs.getString(10)  %>";
document.getElementById("jbTyp_Fld").value = "<%= rs.getString(7)  %>";
document.getElementById("ordr_no").value = "<%= rs.getString(9)  %>";
document.getElementById("ordr_dt").value = "<%= rs.getString(8).trim()  %>";
document.getElementById("bill_no").value = "<%= rs.getString(3)  %>";
document.getElementById("bill_dt").value = "<%= rs.getString(25)  %>";
document.getElementById("bill_rcvd_on").value = "<%= rs.getString(5).trim()  %>";
document.getElementById("bill_amt").value = "<%= rs.getString(2)  %>";
document.getElementById("job_mnth").value = "<%= rs.getString(6).trim()  %>";
document.getElementById("bill_sts").value = "<%= rs.getString(12)  %>";
document.getElementById("bill_desc").value = "<%= rs.getString(16)  %>";
document.getElementById("add_rmrks").value = "<%= rs.getString(17)  %>";
document.getElementById("plant_sel").value = "<%= rs.getString(28)  %>";
document.getElementById("equip_sel").value = "<%= rs.getString(18)  %>";
document.getElementById("vndr_sel").value = "<%= rs.getString(19)  %>";
document.getElementById("bdgt_sel").value = "<%= rs.getString(20)  %>";
document.getElementById("bdgt_sel_seq").value = "<%= rs.getString(29)  %>";

<%
if(rs.getString(22).equals("Y")){
%>
document.getElementById("Y1").checked=true;
document.getElementById("N1").checked=false;
<%
}
if(rs.getString(23).equals("Y")){
%>
document.getElementById("Y2").checked=true;
document.getElementById("N2").checked=false;
<%
}

%>
document.getElementById("urgnt_rmrks").value = "<%= rs.getString(24)  %>";

</script>


<%
}
rs.close();
ps.close();


//System.out.println(" spbill_ref_id :  "+spbill_ref_id);

if(spbill_ref_id > 0){
// edit only urgent block 
%>

<script>
document.getElementById("selGenStn").disabled = true ;
document.getElementById("dept_fld").disabled = true ;
document.getElementById("unt_fld").disabled = true ;
document.getElementById("jbTyp_Fld").disabled = true ;
document.getElementById("ordr_no").disabled = true ;
document.getElementById("ordr_dt").disabled = true ;
document.getElementById("bill_no").disabled = true ;
document.getElementById("bill_dt").disabled = true ;
document.getElementById("bill_rcvd_on").disabled = true ;
document.getElementById("bill_amt").disabled = true ;
document.getElementById("job_mnth").disabled = true ;
document.getElementById("bill_sts").disabled = true ;
document.getElementById("bill_desc").disabled = true ;
document.getElementById("add_rmrks").disabled = true ;
document.getElementById("plant_sel").disabled = true ;
document.getElementById("equip_sel").disabled = true ;
document.getElementById("vndr_sel").disabled = true ;
document.getElementById("bdgt_sel").disabled = true ;


</script>


<%
}




}


%>


<table>
<tr>
<td class="erp_ac_style1" >
<% if(!spbill_erp_ac_str.trim().equals("")){ %>
<table>
<tr>
<td>
ERP Account No. :
</td>
<td class="cls3">
 <table class="cls2" >
                   <tr>
                <%
String[] colorArr = { "#9ce4e4", "#9ce4e4", "#9ce4e4", "#d1d795" , "#d1d795" , "#d1d795" ,"#d1d795", "#d1d795", "#a49ce4", "#a49ce4", "#a49ce4" , "#e7be6b" , "#e7be6b" ,"#e7be6b", "#9ce4e4", "#9ce4e4", "#b5d0b0", "#b5d0b0","#e7ee6c" ,"#89e499","#89e499" };
                  for(int j=0;j<spbill_erp_ac_str.length() ; j++){
                    %>
                      <td bgcolor="<%= colorArr[j] %>" ><%= spbill_erp_ac_str.charAt(j)  %> </td>
                    <%
                   }
                %>
                   </tr>
               </table>
</td>
</tr>
               </table>


<% } %>
</td>
</tr>
</table>

<center>
<table>
    <tr>
        <td align = center >
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
   text-shadow: #222222 1px 1px 0;" onClick="chkSpbillFrm('U','<%= action_tp_str %>');">
       <%  }else if(trmn_mode){  %> 
<input type="button" name="UPDATE" value="" style="width: 115px; height: 38px;background-image:url('btn_trmnt.png');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkSpbillFrm('U','<%= action_tp_str %>');">

       <%  }else{  %> 
<input type="button" name="UPDATE" value="" style="width: 86px; height: 37px;background-image:url('btn_updt.jpeg');line-height: 37px;
   vertical-align: text-middle;
   text-align: center;
   color: #ffffff;
   font-family: Calibri;
   font-size: 12px;
   font-weight: normal;
   font-style: normal;
   text-shadow: #222222 1px 1px 0;" onClick="chkSpbillFrm('U','<%= action_tp_str %>');">

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
   text-shadow: #222222 1px 1px 0;" onClick="chkSpbillFrm('E','I');">

       <%  }  %> 
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
   text-shadow: #222222 1px 1px 0;" onClick="cancel_action('blank_pg_for_sp_vndr.html','_self')">

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
</center>




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


<div id="vndr_dtls_popup"  >
         <a class="bClose"><img src="cancel.png" width="20" height="20"  onclick = '$("#vndr_dtls_popup").bPopup().close();'/><a/>
        <br/>
<table>
<tr>
<td> Name :</td>
<td> <span id="vndr_nm_ele" ></span></td>
</tr>
<tr>
<td> <span id="vndr_addr1_ttl" > Address1 :</span></td>
<td> <span id="vndr_addr1_ele" ></span></td>
</tr>
<tr>
<td> <span id="vndr_addr2_ttl" > Address2 :</span></td>
<td> <span id="vndr_addr2_ele" ></span></td>
</tr>
<tr>
<td><span id="vndr_addr3_ttl" > Address3 :</span></td>
<td> <span id="vndr_addr3_ele" ></span></td>
</tr>
<tr>
<td><span id="vndr_addr4_ttl" > Address4 :</span></td>
<td> <span id="vndr_addr4_ele" ></span></td>
</tr>
<tr>
<td><span id="vndr_addr5_ttl" > Address5 :</span></td>
<td> <span id="vndr_addr5_ele" ></span></td>
</tr>

</table>
</div>



<div id="tip2_right" style="display:none;"><img id="largeImg2" src="" width="600" height="500" />
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


<div id="loadingPopup" >
<a class="bClose"><img src="cancel.png" width="20" height="20"  id="clsImg1"  /></a>
        <br/>
         <br/>
<p align=center > Please wait ... </p>
<br/>
</div>
        
    </body>
</html>

