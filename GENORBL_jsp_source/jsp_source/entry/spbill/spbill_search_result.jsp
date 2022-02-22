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
     <script src="js/dom-drag.js" type="text/javascript"></script>
     <script type="text/javascript" src="js/jquery.scrollableFixedHeaderTable.js"></script>
     <link href="css/scrollableFixedHeaderTable.css" rel="stylesheet" type="text/css"/>
     <script src="js/date.js" type="text/javascript"></script>
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
    prsnlDtlFrm.spbil_ref_h.value = vndrCd ;    
    prsnlDtlFrm.dest_pg_h.value = "spbill_whole_dtl.jsp" ;    
    prsnlDtlFrm.trgt_h.value = 'frm_blk1' ;    
    
    prsnlDtlFrm.action = "spbil_dtl_intrmdt.jsp";
    prsnlDtlFrm.target= 'frm_blk1';
    prsnlDtlFrm.submit();
   
/* 
    prsnlDtlFrm.dest_pg_h.value = "vendor_official_dtl.jsp" ;    
    prsnlDtlFrm.spbil_ref_h.value = vndrCd ;  
    prsnlDtlFrm.trgt_h.value = 'frm_blk2' ;    
    prsnlDtlFrm.action = "vendor_dtl_intrmdt.jsp";
    prsnlDtlFrm.target= 'frm_blk2';
    prsnlDtlFrm.submit();
    
    prsnlDtlFrm.dest_pg_h.value = "vendor_doc_dtl.jsp" ;    
    prsnlDtlFrm.spbil_ref_h.value = vndrCd ;  
    prsnlDtlFrm.trgt_h.value = 'frm_blk3' ;    
    prsnlDtlFrm.action = "vendor_dtl_intrmdt.jsp";
    prsnlDtlFrm.target= 'frm_blk3';
    prsnlDtlFrm.submit();
    
 */   
    

//parent.submitForm('prsnlDtlFrm');

}


function markSelectedRow(rowId){
//alert("clicked"+$('#_myTable2').html());
//$("#innrhtml1").val($('#_myTable2').html());
$(".row_common_cls").removeClass('alt');
$(".row_common_cls").removeClass('highlight-selected-row');
$('#'+rowId).addClass('highlight-selected-row');
 //$("#_myTable2 tbody tr:odd ").addClass("alt");
//document.getElementById(rowId).style.backgroundcolor = "yellow";

        $("#_myTable2 tbody tr:odd ").each(function( index ) {
            //alert($(this).hasClass("highlight-selected-row"));
            if(!$(this).hasClass("highlight-selected-row")){
                $(this).addClass("alt");
            }
        })


}

function addHoverCls(rowId){
//alert("addhover");
//$('#'+rowId).removeClass('alt');
$('#'+rowId).addClass('hover');



}

function removeHoverCls(rowId){
//alert("removehover");
//$('#'+rowId).addClass('alt');
$('#'+rowId).removeClass('hover');




}




</script>

<style>

.sortable {
                border:1px solid blue;
               /* background-color: black;*/
                font-size: 12px;
        }

l
  .sortable .header1 thead tr td {
    font-size: 14px;
    font-weight: bold;
    background-color: #CCCCCC;
  }


.highlight-selected-row{
 background-color: #d9a8b1;
}




.bgcolorEachcell{
 background-color:#aff2fa;
}





</style>



<style type="text/css" media="screen">


body { background-color: #fff; font: 16px Helvetica, Arial; color: #000; }
table{ border-collapse: collapse; border: 1px solid #000; }
th, td { border: 1px solid #000; }
th { background-color: #e4e4e4; cursor: pointer; }

table.sortable tbody tr.alt td {
   background-color: #e6EEEE;
}

.high_light{
background-color: #91bf9a;
}


table.sortable {
  background-color: #e4e4e4;
  font-size: 12px;
    width: 700px; 
}


table.sortable .sort-alpha {
  background: #e4e4e4 url("table-sorter-bg.jpg") no-repeat 0 -3px;
  cursor: pointer;
  height: auto;
  padding: 5px 0 5px 30px;
  text-align: left;
}

table.sortable .asc {
  background-image: url("table-sorter-asc.jpg");
}
table.sortable .desc {
  background-image: url("table-sorter-desc.jpg");
}
table.sortable td {
  color: #4d4d4d;
  padding: 5px;
}





   .header1 thead tr th{
    font-size: 14px;
    font-weight: bold;
    background-color: #CCCCCC;
  }


.highlight-selected-row{
 background-color: #d9a8b1;
}

td.betterhover, #_myTable2 tbody tr:hover {
 background:#e2e094;
}

.hover{
background:#e2e094;
}
.cellHovered{
background:green;
}

.bgcolorEachcell{
 background-color:#aff2fa;
}



</style>


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
<body>

    
    <%
LoginBean loginBn = (LoginBean) request.getSession().getAttribute("loginBean");

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    String curdate = new String() ;
    String srchTypeStr = request.getParameter("srch_type_h");
    String spbillrefStr = request.getParameter("spbil_ref_h")==null?"":request.getParameter("spbil_ref_h");
    String spbillStsStr = request.getParameter("spbil_sts_h")==null?"":request.getParameter("spbil_sts_h");
   

    String spbillrefPStr = request.getParameter("spbill_ref_p_h")==null?"":request.getParameter("spbill_ref_p_h");
    String spbillNoPStr = request.getParameter("spbil_no_h")==null?"":request.getParameter("spbil_no_h");
    String spbillrefidPStr = request.getParameter("spbil_ref_id_h")==null?"":request.getParameter("spbil_ref_id_h");
    String spbillvndrPStr = request.getParameter("spbil_vendor_h")==null?"":request.getParameter("spbil_vendor_h");
    String spbillurgntpmntPStr = request.getParameter("spbil_urgnt_pmnt_h")==null?"":request.getParameter("spbil_urgnt_pmnt_h");
    String spbillStsPStr = request.getParameter("spbillStsPStr")==null?"":request.getParameter("spbillStsPStr");
    String spbillFinStsPStr = request.getParameter("spbil_fin_rcvd_sts_p_h")==null?"":request.getParameter("spbil_fin_rcvd_sts_p_h");
    String spbillCancelldPStr = request.getParameter("spbil_cancelled_bill_h")==null?"":request.getParameter("spbil_cancelled_bill_h");
    String spbillbillFrmDtPStr = request.getParameter("spbil_bill_frm_dt_p_h")==null?"":request.getParameter("spbil_bill_frm_dt_p_h");
    String spbillbillToDtPStr = request.getParameter("spbil_bill_to_dt_p_h")==null?"":request.getParameter("spbil_bill_to_dt_p_h");

System.out.println(" spbillFinStsPStr: "+request.getParameter("spbil_fin_rcvd_sts_p_h")+" spbillrefPStr: "+request.getParameter("spbill_ref_p_h"));
 

    try {

 PreparedStatement ps = null ;
        ResultSet rs = null ;


 String ipAddress = request.getRemoteAddr();
String userDtls = "";
//userDtls = ipAddress+":"+loginBn.getsEmpCd();
String usrEmpCd = loginBn.getsEmpCd() ;
String userStation = loginBn.getsGenStn();
String userdept  = loginBn.getsDept();

//String usrEmpCd = "977471" ;

userDtls = ipAddress+":"+ usrEmpCd ;
System.out.println("  userDtls :  "+userDtls+" spbillrefPStr:  "+spbillrefPStr+" spbillFinStsPStr: "+spbillFinStsPStr+"  spbillCancelldPStr: "+spbillCancelldPStr);
String tmp_crtria_str = "";

if(!userStation.trim().equals("")){
if(userdept.equals("30")){
if(tmp_crtria_str.length() >0){
tmp_crtria_str = tmp_crtria_str+" and DEPT in( select distinct d1.DEPT    "+
                                          "                                          from ORBL_CD_DEPT d1 ,   "+
                                           "                                              ORBL_CD_DEPT_MST d2  "+
                                           "                                          where d1.LOGIN_DEPT = d2.DEPT_SDESC  "+
                                           "                                           and d1.STATION = d2.STATION "+
                                           "                                           and d2.STATION = '"+userStation+"'  "+
                                           "                                           and d2.DEPT = '"+userdept+"' )      ";
}else {
tmp_crtria_str = tmp_crtria_str +" DEPT in( select distinct d1.DEPT    "+
                                          "                                          from ORBL_CD_DEPT d1 ,   "+
                                           "                                              ORBL_CD_DEPT_MST d2  "+
                                           "                                          where d1.LOGIN_DEPT = d2.DEPT_SDESC  "+
                                           "                                           and d1.STATION = d2.STATION "+
                                           "                                           and d2.STATION = '"+userStation+"'  "+
                                           "                                           and d2.DEPT = '"+userdept+"' )      ";
}

}else{
if(tmp_crtria_str.length() >0){
tmp_crtria_str = tmp_crtria_str+" and  "+" STATION = '"+userStation+"' and DEPT in( select distinct d1.DEPT    "+ 
                                          "                                          from ORBL_CD_DEPT d1 ,   "+
                                           "                                              ORBL_CD_DEPT_MST d2  "+
                                           "                                          where d1.LOGIN_DEPT = d2.DEPT_SDESC  "+        
                                           "                                           and d1.STATION = d2.STATION "+
                                           "                                           and d2.STATION = '"+userStation+"'  "+
                                           "                                           and d2.DEPT = '"+userdept+"' )      ";
}else {
tmp_crtria_str = tmp_crtria_str +" STATION = '"+userStation+"' and DEPT in( select distinct d1.DEPT    "+ 
                                          "                                          from ORBL_CD_DEPT d1 ,   "+
                                           "                                              ORBL_CD_DEPT_MST d2  "+
                                           "                                          where d1.LOGIN_DEPT = d2.DEPT_SDESC  "+
                                           "                                           and d1.STATION = d2.STATION "+
                                           "                                           and d2.STATION = '"+userStation+"'  "+               
                                           "                                           and d2.DEPT = '"+userdept+"' )      ";
}
}
}



if(!spbillbillFrmDtPStr.trim().equals("")){
if(tmp_crtria_str.length() >0){
tmp_crtria_str = tmp_crtria_str+" and  "+" trunc(BILL_RELEASE_DATE) >= to_date('"+spbillbillFrmDtPStr+"','dd-Mon-yyyy') ";
}else {
tmp_crtria_str = tmp_crtria_str+""+" trunc(BILL_RELEASE_DATE) >= to_date('"+spbillbillFrmDtPStr+"','dd-Mon-yyyy')" ;
}
}

if(!spbillbillToDtPStr.trim().equals("")){
if(tmp_crtria_str.length() >0){
tmp_crtria_str = tmp_crtria_str+" and  "+" trunc(BILL_RELEASE_DATE) <= to_date('"+spbillbillToDtPStr+"','dd-Mon-yyyy') ";
}else {
tmp_crtria_str = tmp_crtria_str+""+" trunc(BILL_RELEASE_DATE) <= to_date('"+spbillbillToDtPStr+"','dd-Mon-yyyy')" ;
}
}



if(!spbillrefPStr.trim().equals("")){
if(tmp_crtria_str.length() >0){
tmp_crtria_str  = tmp_crtria_str+"" +" and   BILLREF like  '"+spbillrefPStr+"%'";
}else{
tmp_crtria_str  = tmp_crtria_str+"" +"   BILLREF like  '"+spbillrefPStr+"%' ";
}
}

if(!spbillNoPStr.trim().equals("")){
if(tmp_crtria_str.length() >0){
tmp_crtria_str  = tmp_crtria_str+"" +" and   BILL_NO like  '"+spbillNoPStr+"%'";
}else{
tmp_crtria_str  = tmp_crtria_str+"" +"   BILL_NO like  '"+spbillNoPStr+"%' ";
}
}

if(!spbillrefidPStr.trim().equals("")){
if(tmp_crtria_str.length() >0){
tmp_crtria_str  = tmp_crtria_str+"" +" and   BILL_REF_ID like  '"+spbillrefidPStr+"%'";
}else{
tmp_crtria_str  = tmp_crtria_str+"" +"   BILL_REF_ID like  '"+spbillrefidPStr+"%' ";
}
}

if(!spbillvndrPStr.trim().equals("")){
if(tmp_crtria_str.length() >0){
tmp_crtria_str  = tmp_crtria_str+"" +" and   VENDOR =  '"+spbillvndrPStr+"'";
}else{
tmp_crtria_str  = tmp_crtria_str+"" +"   VENDOR =  '"+spbillvndrPStr+"' ";
}
}

if(!spbillurgntpmntPStr.trim().equals("")){
if(tmp_crtria_str.length() >0){
tmp_crtria_str  = tmp_crtria_str+"" +" and   URGENT_PAYMENT =  '"+spbillurgntpmntPStr+"'";
}else{
tmp_crtria_str  = tmp_crtria_str+"" +"   URGENT_PAYMENT =  '"+spbillurgntpmntPStr+"' ";
}
}


System.out.println("  spbillFinStsPStr :  "+spbillFinStsPStr+"  spbillCancelldPStr:  "+spbillCancelldPStr);

if(!spbillFinStsPStr.trim().equals("")){
if(tmp_crtria_str.length() >0){
tmp_crtria_str  = tmp_crtria_str+"" +" and   decode(FINANCE_RECVD_DATE,null,'N','Y') = '"+spbillFinStsPStr.trim()+"' ";
}else{
tmp_crtria_str  = tmp_crtria_str+"" +"  decode(FINANCE_RECVD_DATE,null,'N','Y') = '"+spbillFinStsPStr.trim()+"'   ";
}
}

if(!spbillCancelldPStr.trim().equals("")){
if(tmp_crtria_str.length() >0){
tmp_crtria_str  = tmp_crtria_str+"" +" and   nvl(BILL_CANCEL,'N') = '"+spbillCancelldPStr.trim()+"' ";
}else{
tmp_crtria_str  = tmp_crtria_str+"" +" nvl(BILL_CANCEL,'N') = '"+spbillCancelldPStr.trim()+"' ";
}
}


if(tmp_crtria_str.trim().length()>0){
tmp_crtria_str = "  where                            "+
                 "    "+tmp_crtria_str ;
}

String qryForVndrDtls = "  select BILLREF, to_char(BILL_AMT,'99999999999.09'), nvl(BILL_STATUS,0) , "+
                        "         nvl(BILL_REF_ID,0)  , nvl(to_char(BILL_DT,'dd-Mon-yyyy'),' ') ,   "+
                        "         nvl(to_char(FINANCE_RECVD_DATE,'dd-Mon-yyyy'),' ')  ,              "+
                        "         nvl(DESCRIP,' ')   "+
                        "  from ORBL_SPBILL_DTL                                                     "+
                        "                             "+
                        "    "+tmp_crtria_str+"  order by BILLREF    ";



if(srchTypeStr.equals("single")  ){
    
    
    
    
    qryForVndrDtls = "  select p.VENDOR_CODE , p.VENDOR_NAME , decode(nvl(p.sts,' '),'I','INTER MEDIATE','R','SENT FOR RECOMMENDATION','V','VALID','A','SENT FOR APPROVAL',' ')  from  "+
                     " (   select VENDOR_CODE, VENDOR_NAME, VENDOR_STATUS sts "+
                        "  from ORBL_VENDOR_MST                                "+
                        "  where VENDOR_CODE like ?                            "+
                        "  and lower(VENDOR_NAME) like lower(?)   "+
                        "  and VENDOR_STATUS "+tmp_crtria_str+" ('"+spbillStsPStr+"')   ) p  "+
                        "  where    p.VENDOR_CODE like ?                            "+
                        "  and lower(p.VENDOR_NAME) like lower(?)   "+
                        "  and p.sts like ?               order by VENDOR_NAME     ";
}


System.out.println(" qryForVndrDtls:  "+qryForVndrDtls);

ps = mk.con.prepareStatement(qryForVndrDtls);

if(srchTypeStr.equals("multi") ){
    

// ps.setString(1, spbillrefPStr+"%");
// ps.setString(3, vndrStsPStr+"");
 
} else if(srchTypeStr.equals("single")  ){
    
    System.out.println("spbillrefPStr  "+spbillrefPStr+"  spbillStsPStr "+spbillStsPStr);
    System.out.println("spbillrefStr  "+spbillrefStr+"  spbillStsStr "+spbillStsStr);   

 ps.setString(1, spbillrefPStr+"%");
 //ps.setString(3, vndrStsPStr+"");
    ps.setString(2, spbillrefStr+"%");
 ps.setString(3, spbillStsStr+"%");
}


%>




  <table class="sortable"    width="98%" id="_myTable2">
 <thead class= "header1" >
  <tr>
      <th >
          <span class="sort-alpha" data_type="Number"  ><strong>Bill Id</strong></span>
          <span class="snglfilter" name="Bill Id" type="int" input_type="ipbx" ipfieldName="singleFltrIpBx" value ="<%= spbillrefStr %>" hdnFldName="spbil_ref_h" >
              <img src="filter1.jpg" width="15" height="15" />
          </span>
      </th>
      <th>
          <span class="sort-alpha" data_type="String" ><strong> Description </strong></span>
      </th>
      <th >
          <span class="sort-alpha" data_type="Number" ><strong> Bill Amount </strong></span>
          <span class="snglfilter" name="Bill Amount" type="int" input_type="ipbx"  ipfieldName="singleFltrIpBx" hdnFldName="" >
          </span>
      </th>
      <th >
          <span class="sort-alpha" data_type="Date" ><strong>Bill Date</strong></span>
      </th>
      <th >
          <span class="sort-alpha" data_type="Date"  ><strong>Fin Rcvd Date</strong></span>
      </th>
  </tr>
 </thead>
  <tbody class="tbd1">
      
      <%
       rs = ps.executeQuery();
       int counter1 = 0;
                            while(rs.next()){
                       counter1++;         
                           
      %>
      
      
      
   <tr id="tr_<%=counter1 %>" class="row_common_cls" onclick="markSelectedRow('tr_<%=counter1 %>');showDtls('<%= rs.getString(1)  %>');" onmouseover="addHoverCls('tr_<%=counter1 %>');" onmouseout="removeHoverCls('tr_<%=counter1 %>');"  >
    <td align=center  class="col_cls_<%=counter1 %>" class="col_common_cls" width=15% ><%= rs.getString(1)  %></td>
    <td align=left class="col_cls_<%=counter1 %>" class="col_common_cls" width=38% >  
              <%= rs.getString(7)  %>  
    </td>
    <td align=right class="col_cls_<%=counter1 %>" class="col_common_cls" width=15%  ><%= rs.getString(2)  %></td>
    <td align=center class="col_cls_<%=counter1 %>" class="col_common_cls" width=15%  >
        <%= rs.getString(5)  %>
    </td>
    <td align=center class="col_cls_<%=counter1 %>" class="col_common_cls" width=17% ><%= rs.getString(6)  %></td>
   </tr>
   
      <%
           }
        rs.close();
        ps.close();
  if(counter1 == 0){
%>
<tr>
<td colspan=5>
<p align=center> <font color=red > No Record Found ! </font> </p>
</td>
</tr>
<%
   }
      
      %>
      
      
      
  </tbody>
</table>


    <div id="singleFltr"    >
          <a class="bClose"><img src="cancel.png" width="20" height="20" /></a>
        <br/>
         <br/>
        <table>
            <tr>
                <td>
                    <span id="singleFltr_fldNm" ></span> :  &nbsp &nbsp
                </td>
                <td>
                     <span class="ipbx" ><input type="text" id="singleFltrIpBx" /></span>
                      <span class="combx" >
                          <select id="singleFltrCombx">
                        <option value="V" > VALID</option>
                        <option value="%" > ALL</option>
                        <option value="A" > SENT TO FINANACE</option>
                        </select>
                    </span>
                </td>

                        
                
                 <td>
                     <input type="button" value="Query" class="singleFltrQry"    />
                </td>
            </tr>

        </table>

    </div>

<script>
Drag.init(document.getElementById("singleFltr"));

</script>
  
    <form name="snglSrchFrm" action="spbill_search_result.jsp" target="_self" method="POST" >
        
        <input type="hidden" name="srch_type_h" value="single" />
        <input type="hidden" name="spbill_ref_p_h" value="<%= request.getParameter("spbill_ref_p_h") %>" />
        <input type="hidden" name="spbill_sts_p_h" value="<%= request.getParameter("spbill_sts_p_h") %>" />
        <input type="hidden" name="spbil_ref_h" value="" />
        <input type="hidden" name="spbil_sts_h" value="" />
        
        

    </form>
    <form name="prsnlDtlFrm" action=""  method="POST" >
      <input type="hidden" name="spbil_ref_h" value=""  />
      <input type="hidden" name="dest_pg_h" value=""  />
      <input type="hidden" name="trgt_h" value=""  />
    </form>

    <script>
$(document).ready(function () {


     $("tbody tr:odd ").addClass("alt");
  var maxWindowSize = getUIScreenWidthR31a()-40;

          $('.sortable').scrollableFixedHeaderTable(720,150,null,null,1);
                         

 //alert($('.sfhtTable')[0].innerHTML);
 //alert($('.sfhtTable:eq(0)').html());
 //$('#testdiv1').attr('value', $('.sfhtTable:eq(0)').html() );
  var rows = $('.sfhtData').find('tbody > tr').get();
   var rows1 = $('.sfhtHeader')[0].innerHTML;
  // alert("  rows1 : "+rows1);


$('.sortable',$('.sfhtHeader')).each(function() {
   // var $table1 = $(this);
    //alert($table1[0].innerHTML);
    //$('table.sortable',$table1).each(function() {

        var $table = $(this);
       // alert($table[0].innerHTML);
         //alert('111 $table '+$table);
        $('.sort-alpha', $table).each(function(column) {
         //   alert("11 "+rows);
            // var $header = $(this);
             var $header = $(this);
             var data_type_str = $(this).attr("data_type");

  //alert("hdr 1 "+$header[0].innerHTML);
                $header
                    .addClass('clickable')
                    .hover(
                        function() { $header.addClass('hover') },
                        function() { $header.removeClass('hover');
                        })
                    .click(function() {

                     //   alert("22 ");

                        $header.hasClass('asc')?
                          $header.removeClass('asc').addClass('desc'):
                          $header.removeClass('desc').addClass('asc');
                       // var rows1 = $table.find('tbody > tr').get();
                        var rows = $('.sfhtData').find('table > tbody > tr').get();


      //  alert('111 rows '+rows);
                        rows.sort(function(a, b) {
                            if(data_type_str == 'Date'){
                                var keyA = Date.parse($(a).children('td').eq(column).text());
                                var keyB = Date.parse($(b).children('td').eq(column).text());
                            }else if(data_type_str == 'Number'){
                            var keyA = new Number($(a).children('td').eq(column).text());
                            var keyB = new Number($(b).children('td').eq(column).text());
                            }else if(data_type_str == 'String'){
                            var keyA = $(a).children('td').eq(column).text().toUpperCase();
                            var keyB = $(b).children('td').eq(column).text().toUpperCase();
                            }else{
                            var keyA = $(a).children('td').eq(column).text().toUpperCase();
                            var keyB = $(b).children('td').eq(column).text().toUpperCase();
                            }

                            if (keyA > keyB) {
                                return ($header.hasClass('asc')) ? 1 : -1;
                              }
                            if (keyA < keyB) {
                              return ($header.hasClass('asc')) ? -1 : 1;
                            }
                            return 0;
                        });

                        $.each(rows, function(index, row) {
                            $('.sfhtData').find('table > tbody').append(row);
                        });

                        // it is for alternative color
                         $("tbody tr").removeClass("alt");
                         $("tbody tr:odd ").addClass("alt");



                        //alert($('.sfhtTable')[0].innerHTML);
                     //   $('.sfhtHeader').css({overflow:'auto'  });
                     //   $('.sfhtData').css({ position: 'absolute',overflow:'hidden' });
                      //   $('.sortable',$('.sfhtData')).scrollableFixedHeaderTable(400,50,null,null,1);

                    });

        });
    });
   // });





      $('.snglfilter').bind('click', function(e) {

                // Prevents the default action to be triggered.
                e.preventDefault();
                var nm = $(this).attr("name");
                var inptTp = $(this).attr("input_type");
                var inptFldNm = $(this).attr("ipfieldName");
                var inptFldVal = $(this).attr("value");
                var hdnFldNm = $(this).attr("hdnFldName");
                
               // alert(nm);
               $("#singleFltr_fldNm").text(nm);
               $(".ipbx").css({display:'none'});
               $(".combx").css({display:'none'});
                $("."+inptTp).css({display:'block'});
                
                $("#"+inptFldNm).attr("value",inptFldVal);
                
                $('.singleFltrQry').bind('click', function(e) {
                    document.getElementById(hdnFldNm).value = $("#"+inptFldNm).attr("value");
                    snglSrchFrm.submit();
                    
                 });
                
             //  document.getElementById("singleFltr_fldNm").innerHTML = nm ;
                // Triggering bPopup when click event is fired
               // $('#singleFltr').css({display:'block'});

                // $('#singleFltr').css({display:'none'});
                $('#singleFltr').bPopup({opacity: 0.0});
                    $('#singleFltr').corner("15px");

            });


//    $("tbody tr:odd ").addClass("alt");

/*
  
$(".tbd1 tr").each({$(this).bind('click', function(e) {
//e.preventDefault();
alert(" onclick tbody tr");
$("tbody tr").removeClass("high_light");
$(this).addClass("high_light");
});
});



$('.sfhtData td').click(function(e){
//e.preventDefault();
//alert(" onclick tbody tr");
$(this).addClass("high_light").siblings().removeClass("high_light");
//alert($(this));

});



*/


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
