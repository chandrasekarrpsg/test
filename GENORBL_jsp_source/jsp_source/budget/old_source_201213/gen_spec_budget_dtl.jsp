<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="java.io.*,javax.servlet.jsp.*,javax.ejb.EJB,javax.naming.*,java.util.*,java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="oracle.sql.*" %>
<%@ page import="oracle.jdbc.*" %>
<%@ page import="genOrblJavaPackage.*" %>

<html>

<head>
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Budget</title>
<style type="text/css">
.style3 {
        text-align: center;
        color: #ffffff;
        font-family: Arial;
        font-size: 10pt;
        background-color:#008080;
}
.style5 {
        font-family: Arial;
        font-size: 9pt;
}
.style4 {
        border-color: #88799D;
        font-family: Arial;
        font-size: small;
}
</style>

<script type="text/javascript">

function isShort(str, len){
  if(str.length != len)
    return false;
  else return true;
}

function isNull(str){
  if(str=='')
    return false;
  return true;
}

function isPosInt(str){
  var pat="0123456789.";
  var i=0;
   do{
    var flag = 0;
    for(var j=0;j<pat.length;j++){
      if(str.charAt(i)==pat.charAt(j)){
        flag = 1;
        break;
      }
      flag = 0;
    }
    i++;
  }
  while(flag==1 && i<str.length)

  if (flag == 1)
    return true;
  return false;
}


function enable_btn(str,str1,str2,str3,str4,str5,str6){
if(str != '0'){
   if(str1 !='0'){
    for(var j=1;j<14;j++){
      if(j == parseInt(str5)){
        document.getElementById("B"+j).disabled=false;
      }
    }
   }
}
if(str6 != '0'){
   if(str2 !='0'){
    for(var j=1;j<14;j++){
      if(j == parseInt(str5)){
        document.getElementById("R"+j).disabled=false;
      }
    }
   }
}
if(str4 != '0'){
   if(str3 !='0'){
    for(var j=1;j<14;j++){
      if(j == parseInt(str5)){
        document.getElementById("V"+j).disabled=false;
      }
    }
   }
}
}

function enable_btn_all(str,str1,str2,str3,str4,str5){
//alert('rej_flg:'+str2);
if(str != '0'){
   if(str1 !='0'){
    for(var j=1;j<14;j++){
      if(j == parseInt(str5)){
        document.getElementById("consolidate"+j).disabled=false;
      }
    }
   }
   if(str2 !='0'){
    for(var j=1;j<14;j++){
      if(j == parseInt(str5)){
        document.getElementById("reject"+j).disabled=false;
      }
    }
   }
}
if(str4 != '0'){
   if(str3 !='0'){
    for(var j=1;j<14;j++){
      if(j == parseInt(str5)){
        document.getElementById("view"+j).disabled=false;
      }
    }
   }
}
}

function enable_vw(str,str1){
 if(parseInt(str)==parseInt(str1)){
        document.getElementById("CV").disabled=false;
 }else{
        document.getElementById("CV").disabled=true;
 }
}

function frwrd_higher_auth(str){

var flg=confirm("ARE YOU SURE TO FORWARD BUDGET OF SECTION "+document.getElementById("sec_cd"+str).value+" OF "+document.f1.station.value);

if(flg==true){

   var parameter='';
   parameter = parameter + 'stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&sec_cd='+document.getElementById("sec_cd"+str).value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("gen_spec_forward_upd.jsp?"+parameter,"_self");
}else{
  return false;
}

}

function rej_data(str){

var flg=confirm("ARE YOU SURE TO REJECT BUDGET OF SECTION "+document.getElementById("sec_cd"+str).value+" OF "+document.f1.station.value);

if(flg==true){

   var parameter='';
   parameter = parameter + 'stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&sec_cd='+document.getElementById("sec_cd"+str).value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("gen_spec_rej_upd.jsp?"+parameter,"_self");
}else{
  return false;
}

}

function rej_all(str){

var flg=confirm("ARE YOU SURE TO REJECT BUDGET OF SECTION(S) UNDER "+document.getElementById("secallauth"+str).value+" OF "+document.f1.station.value);

if(flg==true){

   var parameter='';
   parameter = parameter + 'stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&sec_cd='+document.getElementById("secallauth"+str).value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("gen_spec_rej_upd_all.jsp?"+parameter,"_self");
}else{
  return false;
}

}

function consolidate_all(str){

var flg=confirm("ARE YOU SURE TO CONSOLIDATE BUDGET OF SECTION(S) UNDER "+document.getElementById("secallauth"+str).value+" OF "+document.f1.station.value);

if(flg==true){

   var parameter='';
   parameter = parameter + 'stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&sec_cd='+document.getElementById("secallauth"+str).value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("gen_spec_all_consolidate.jsp?"+parameter,"_self");
}else{
  return false;
}

}

function enable_stn_lvl_cnsl_vw(str,str1){
 if(parseInt(str)!=0 && parseInt(str1)!=0){
        document.getElementById("SCV").disabled=false;
 }else{
        document.getElementById("SCV").disabled=true;
 }
}

function stn_lvl_cnsl_vw(){

var flg=confirm("ARE YOU SURE TO CONSOLIDATE BUDGET OF ALL SECTION UNDER "+document.f1.station.value);

if(flg==true){

   var parameter='';
   parameter = parameter + 'stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
   parameter = parameter + '&station='+document.f1.station.value;
//alert(parameter);
window.open("gen_stn_spec_cnsl_view.jsp?"+parameter,"_self");
}else{
  return false;
}

}
function consolidated_view(){

var flg=confirm("ARE YOU SURE TO CONSOLIDATE BUDGET OF SECTION(S) UNDER "+document.f1.station.value);

if(flg==true){

   var parameter='';
   parameter = parameter + 'stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
   parameter = parameter + '&station='+document.f1.station.value;
//alert(parameter);
window.open("gen_consolidated_view.jsp?"+parameter,"_self");
}else{
  return false;
}

}

function view_budget(str){

   var parameter='';
   parameter = parameter + 'T1='+document.f1.finyr.value;
   parameter = parameter + '&username='+document.f1.empcd.value;
   parameter = parameter + '&stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&sec_cd='+document.getElementById("sec_cd"+str).value;
   parameter = parameter + '&emp_desg='+document.f1.emp_desg.value;
   parameter = parameter + '&bgt_lvl=2';
   parameter = parameter + '&stn_long_desc='+document.f1.station.value;
//alert(parameter);
if(document.f1.stn_cd.value=='B'){
  window.open("generation_budget_de_bbgs.jsp?"+parameter,"_self");
}else{
  window.open("generation_budget_de_new.jsp?"+parameter,"_self");
}

}

function view_all(str){

   var parameter='';
   var sec='';
if(document.getElementById("secallauth"+str).value == 'DGM(I)-BBGS'){
   sec='DGM1';
}
if(document.getElementById("secallauth"+str).value == 'DGM(II)-BBGS'){
   sec='DGM2';
}
   parameter = parameter + 'T1='+document.f1.finyr.value;
   parameter = parameter + '&username='+document.f1.empcd.value;
   parameter = parameter + '&stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&sec_cd='+sec;
   parameter = parameter + '&emp_desg='+document.f1.emp_desg.value;
   parameter = parameter + '&bgt_lvl=2';
   parameter = parameter + '&stn_long_desc='+document.f1.station.value;
//alert(parameter);
window.open("generation_budget_de_bbgs.jsp?"+parameter,"_self");

}

</script>
</head>

<body background="green1.jpg">

<%

  PreparedStatement ps              = null;
  ResultSet rs                      = null;
  PreparedStatement ps1             = null;
  ResultSet rs1                     = null;
  PreparedStatement ps3             = null;
  ResultSet rs3                     = null;
  MakeConnectionGENORBL mk            = null;
  String finyr                        = new String("");
  String gm_consolidate_exist         = new String("");
  String dgm_con_exist                = new String("");
  String stn_cd                       = new String("");
  String cur_bgt_ver                  = new String("");
  String cur_bgt_level                = new String("");
  String cur_bgt_yr                   = new String("");
  String sec_bgt_finalized            = new String("");
  String max_bgt_level                = new String("");
  String max_bgt_level1               = new String("");
  String sec_bgt_ready                = new String("");
  String sec_bgt_pndg_apprvl          = new String("");
  String sec_bgt_pndg_auth            = new String("");
  String sec_bgt_pub                  = new String("");
  String sec_bgt_entry_started        = new String("");
  String rmks                         = new String("");
  String sStyle                       = new String("");
  String station                      = new String("");
  String sysdate                      = new String("");
  String finyr1                       = new String("");
  String sec_all_auth                 = new String("");
  String entry_emp_desg               = new String("");
  String empcd                        = new String("");
  String auth_flg                     = new String("0");
  String view_auth_flg                = new String("0");
  String forward_flg                  = new String("0");
  String rej_flg                      = new String("0");
  String view_flg                     = new String("0");
  String sec_bgt_finalized_flg        = new String("0");
  String sec_bgt_pndg_apprvl_flg      = new String("0");
  String sec_bgt_entry_started_flg    = new String("0");
  String sec_bgt_ready_flg            = new String("0");
  String sec_bgt_pub_flg              = new String("0");
  String view_exist                   = new String("");
  String rej_exist                    = new String("");
  String forward_exist                = new String("");
  String auth_exist                   = new String("");
  String view_auth_exist              = new String("");
  String your_desg                    = new String("");
  String sec_bgt_finalized_ovral      = new String("");
  String sec_bgt_finalized_ovral_flg  = new String("");
  String rmks_all                     = new String("");
  String sec_bgt_ready_all            = new String("");
  String sec_bgt_ready_all_flg        = new String("");
  String consolidate_all_bgt_lvl      = new String("");
  String sec_cnt_under_auth           = new String("");
  String consolidate_rdy_sec_cnt      = new String("");
  String ready_for_consolidation_flg  = new String("");
  String pndg_apprvl_rdy_sec_cnt      = new String("");
  String pndg_apprvl_all_flg          = new String("");
  String entry_all_initiated          = new String("");
  String entry_all_initiated_flg      = new String("");
  String view_exist_all               = new String("");
  String rej_flg_all                  = new String("");
  String auth_all_exist               = new String("");
  String auth_all_flg                 = new String("");
  String view_all_auth_flg            = new String("");
  String view_all_flg                 = new String("");
  String rej_exist_cnt                = new String("");
  String consolidate_flg_all          = new String("");
  String view_all_auth_exist          = new String("");
  String sec_all_auth_act             = new String("");
  String con_exist                    = new String("");
  String finyrst                      = new String("");
  String finyrend                     = new String("");
  String extra_con_entry_cnt          = new String("");
  String extra_con_cnt                = new String("");
  String rej_auth_exist               = new String("");
  String rej_auth_flg                 = new String("");
  String stn_con_exist                = new String("");
  String sts_lvl_cnsl_vw_cnt          = new String("");
  String sts_lvl_cnsl_vw_auth         = new String("");
int cnt=1;
int cnt1=1;
try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);
     stn_cd = request.getParameter("stn_cd");
     finyr  = request.getParameter("finyr");
     finyr1 = request.getParameter("finyr1");
     empcd  = request.getParameter("empcd");

finyrst = finyr1.substring(0,4);
finyrend = finyr1.substring(7,11);


       ps = mk.con.prepareStatement("select to_char(trunc(sysdate),'DD-MON-RRRR') from dual");
       rs = ps.executeQuery();
       while(rs.next()){
            sysdate = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select emp_desg from bgt_level where emp_code=?");
       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            your_desg = rs.getString(1);
       }
       rs.close();
       ps.close();

       ps = mk.con.prepareStatement("select STATION_LONG_DESC from CD_STATION where BGT_STATION_CD=?");
       ps.setString(1,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            station = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement(" select nvl(sum(cnt),0) from( "+
                                    " select emp_desg,stn_cd,count(*) cnt "+
                                    " from bgt_level "+
                                    " where nvl(consolidate_mkr,' ')<>'Y' "+
                                    " and emp_code=? "+
                                    " and stn_cd=? "+
                                    " and sec_cd <> 'STN' "+
                                    " group by emp_code,emp_desg,stn_cd) ");
       ps.setString(1,empcd);
       ps.setString(2,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            extra_con_cnt    = rs.getString(1);
       }
       rs.close();
       ps.close();

%>
<form name="f1">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="3">STATUS OF <%=station%> FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>
<%
if(!extra_con_cnt.equals("1") && !extra_con_cnt.equals("0")){
if(stn_cd.equals("B")){
       ps = mk.con.prepareStatement(" select nvl(count(distinct sec_cd),0) "+
                                    " from bgt_form2b_data_bbgs "+
                                    " where nvl(publish_mkr,' ')='Y'  "+
                                    " and bgt_yr=?  "+
                                    " and sec_cd in (select distinct sec_cd from bgt_level where emp_code=? and stn_cd=? and sec_cd<>'STN' ) ");
       ps.setString(1,finyr);
       ps.setString(2,empcd);
       ps.setString(3,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            extra_con_entry_cnt    = rs.getString(1);
       }
       rs.close();
       ps.close();
}else{
       ps = mk.con.prepareStatement(" select nvl(count(distinct sec_cd),0) "+
                                    " from bgt_form2b_data "+
                                    " where nvl(publish_mkr,' ')='Y' "+
                                    " and bgt_yr=?  "+
                                    " and sec_cd in (select distinct sec_cd from bgt_level where emp_code=? and stn_cd=? and sec_cd<>'STN' ) ");
       ps.setString(1,finyr);
       ps.setString(2,empcd);
       ps.setString(3,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            extra_con_entry_cnt    = rs.getString(1);
       }
       rs.close();
       ps.close();
}

%>
<br>
<table style="width: 100%" border="0">
        <tr>
                <td style="width: 50%"  colspan="7" align="middle" size="4" ><strong><b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</strong></font></b></strong></td>
                <td style="width: 50%"  colspan="7" align="left" size="4"><input type="button" value="Consolidated View" name="CV" id="CV" style="border:3px double #003300; font-family: Tahoma; font-size: 10pt; color: #800000; font-weight: bold" onclick="consolidated_view();"/></td>
        </tr>
<script>
enable_vw(<%=extra_con_cnt%>,<%=extra_con_entry_cnt%>);
</script>
</table>
<%
}else{
%>
<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>
<br>
<br>
<%
}
       ps = mk.con.prepareStatement(" select count(*) from ADM_EMP_MST a,bgt_level b "+
                                    " where a.emp_code=b.emp_code "+
                                    " and b.emp_code=? "+
                                    " and emp_level >='2' "+
                                    " and emp_genstn=decode(?,'B','016','T','014','S','002','N','013','C','019','E','042') ");
       ps.setString(1,empcd);
       ps.setString(2,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            sts_lvl_cnsl_vw_auth    = rs.getString(1);
       }
       rs.close();
       ps.close();
if(sts_lvl_cnsl_vw_auth.equals("0")){
       ps = mk.con.prepareStatement(" select count(*) from ADM_EMP_MST a,bgt_level b "+
                                    " where a.emp_code=b.emp_code "+
                                    " and b.emp_code=? "+
                                    " and b.view_all_mkr='Y' ");
       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            sts_lvl_cnsl_vw_auth    = rs.getString(1);
       }
       rs.close();
       ps.close();
}

if (stn_cd.equals("B")){

       ps = mk.con.prepareStatement(" select count(*) from bgt_form2b_data_bbgs "+
                                    " where bgt_yr=? "+
                                    " and stn_cd=? and sec_cd in (select sec_cd from bgt_cd_section where stn_cd=?) "+
                                    " and publish_mkr='Y' ");
       ps.setString(1,finyr);
       ps.setString(2,stn_cd);
       ps.setString(3,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            sts_lvl_cnsl_vw_cnt    = rs.getString(1);
       }
       rs.close();
       ps.close();
}else{

       ps = mk.con.prepareStatement(" select count(*) from bgt_form2b_data "+
                                    " where bgt_yr=? "+
                                    " and stn_cd=? and sec_cd in (select sec_cd from bgt_cd_section where stn_cd=?) "+
                                    " and publish_mkr='Y' ");
       ps.setString(1,finyr);
       ps.setString(2,stn_cd);
       ps.setString(3,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            sts_lvl_cnsl_vw_cnt    = rs.getString(1);
       }
       rs.close();
       ps.close();
}
if(!sts_lvl_cnsl_vw_cnt.equals("0") && !sts_lvl_cnsl_vw_auth.equals("0")){
%>
<table style="width: 100%" border="0">
        <tr>
                <td style="width: 50%"  align="left" size="4"><input type="button" value="Station Level Consolidated View Of All Published Sections" name="SCV" id="SCV" style="border:3px double #003300; font-family: Tahoma; font-size: 10pt; color: #800000; font-weight: bold" onclick="stn_lvl_cnsl_vw();"/></td>
                <td style="width: 50%"  align="right" size="4"><strong><a href="#" onClick="window.open('budget_dash_main_dtl.jsp?finyr1=<%=finyrst%>&finyr2=<%=finyrend%>','_self');">Back</strong></font></b></strong></td>
        </tr>
<script>
enable_stn_lvl_cnsl_vw(<%=sts_lvl_cnsl_vw_cnt%>,<%=sts_lvl_cnsl_vw_auth%>);
</script>
</table>
<%
}else{
%>
<table style="width: 100%" border="0">
        <tr>
                <td style="width: 100%"  align="right" size="4"><strong><a href="#" onClick="window.open('budget_dash_main_dtl.jsp?finyr1=<%=finyrst%>&finyr2=<%=finyrend%>','_self');">Back</strong></font></b></strong></td>
        </tr>
</table>
<%
}
if(stn_cd.equals("B")){
%>
<br>
<table style="width: 100%" border="0">
        <tr>
                <td style="width: 20%"  colspan="7" align="right" size="4"><strong><a href="#" onClick="window.open('gen_overall_bbgs_appr_rej_hist.jsp? finyr=<%=finyr%>&finyr1=<%=finyr1%>&empcd=<%=empcd%>','_self');">Approval/Rejection History</strong></td>
        </tr>
</table>
<br>
<%

       ps3 = mk.con.prepareStatement(" select distinct emp_desg from BGT_LEVEL "+
                                     " where STN_CD=? and bgt_level='3' ");
       ps3.setString(1,stn_cd);
       rs3 = ps3.executeQuery();

while(rs3.next()){
  
sec_all_auth = rs3.getString(1);
if(sec_all_auth.equals("DGM(I)-BBGS")){
  sec_all_auth_act="DGM1";
}
if(sec_all_auth.equals("DGM(II)-BBGS")){
  sec_all_auth_act="DGM2";
}
       
       ps = mk.con.prepareStatement(" select SEC_CD from BGT_LEVEL "+
                                     " where STN_CD=? and emp_desg=? ORDER BY sec_cd ");
       ps.setString(1,stn_cd);
       ps.setString(2,sec_all_auth);
       rs = ps.executeQuery();
  
  sec_bgt_finalized_ovral        = "0";
  sec_bgt_finalized_ovral_flg    = "0";
  rmks_all                       = "0";
  sec_bgt_ready_all              = "0";
  sec_bgt_ready_all_flg          = "0";
  consolidate_all_bgt_lvl        = "0";
  sec_cnt_under_auth             = "0";
  consolidate_rdy_sec_cnt        = "0";
  ready_for_consolidation_flg    = "0";
  pndg_apprvl_rdy_sec_cnt        = "0";
  pndg_apprvl_all_flg            = "0";
  entry_all_initiated            = "0";
  entry_all_initiated_flg        = "0";
  view_exist_all                 = "0";
  rej_flg_all                    = "0";
  auth_all_exist                 = "0";
  auth_all_flg                   = "0";
  view_all_auth_flg              = "0";
  view_all_flg                   = "0";
  rej_exist_cnt                  = "0";
  consolidate_flg_all            = "0";
  view_all_auth_exist            = "0";

%>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style3"  colspan="7" align="middle"><strong>OVERALL STATUS OF SECTION(S) UNDER <%=sec_all_auth%></strong></td>
        </tr>
        <tr>
                <td style="width: 30%" class="style3"><strong>OVERALL STATUS </strong></td>
                <td style="width: 10%" class="style3"><strong>INDICATOR</strong></td>
                <td style="width: 30%" class="style3"><strong>REMARKS</strong></td>
                <td style="width: 30%" class="style3"><strong>&nbsp;</strong></td>
        </tr>
        <tr>
                <td style="width: 30%" class="style5" align="center"><strong>SECTION(S) UNDER <%=sec_all_auth%></strong></td>
<%
            cur_bgt_yr  = finyr;
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+
                                     " where stn_cd =? and bgt_yr = ? "+
                                     " and   sec_cd in (select distinct sec_cd from bgt_level where emp_desg=?) "+ 
                                     " and   nvl(bgt_fnl,' ')='F' ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       ps1.setString(3,sec_all_auth);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  sec_bgt_finalized_ovral = rs1.getString(1);
}
rs1.close();
ps1.close();

    if(!sec_bgt_finalized_ovral.equals("0")){
      sec_bgt_finalized_ovral_flg="1";
      rmks_all = "BUDGET FINALIZED.";
    }else{
if(sec_all_auth.equals("DGM(I)-BBGS")){
  sec_all_auth_act="DGM1";
}
if(sec_all_auth.equals("DGM(II)-BBGS")){
  sec_all_auth_act="DGM2";
}
       ps1 = mk.con.prepareStatement(" select count(*) from bgt_form2b_data_bbgs "+
                                     " where stn_cd='B' and sec_cd=? and bgt_yr=? ");
       ps1.setString(1,sec_all_auth_act);
       ps1.setString(2,cur_bgt_yr);
       rs1 = ps1.executeQuery();

       while(rs1.next()){
            sec_bgt_ready_all = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
 
    
      if(!sec_bgt_ready_all.equals("0")){
            sec_bgt_ready_all_flg = "1";
            rmks_all="BUDGET OF SECTION(S) UNDER "+sec_all_auth+" IS READY";
      }else{
          ps1 = mk.con.prepareStatement(" select distinct bgt_level from bgt_level "+
                                        " where nvl(consolidate_mkr,' ') ='Y' "+
                                        " and emp_desg=? ");
          ps1.setString(1,sec_all_auth);
          rs1 = ps1.executeQuery();

          while(rs1.next()){
              consolidate_all_bgt_lvl = rs1.getString(1);
          }
          rs1.close();
          ps1.close();
          ps1 = mk.con.prepareStatement(" select count(distinct sec_cd) "+
                                        " from bgt_level where emp_desg=? ");
          ps1.setString(1,sec_all_auth);
          rs1 = ps1.executeQuery();
          while(rs1.next()){
              sec_cnt_under_auth = rs1.getString(1);
          }
          rs1.close();
          ps1.close();
          ps1 = mk.con.prepareStatement(" select count(distinct sec_cd) from bgt_form2b_data_bbgs "+
                                        " where bgt_yr=? and sec_cd in (select distinct sec_cd from bgt_level where emp_desg=?) "+
                                        " and bgt_level=? ");
          ps1.setString(1,cur_bgt_yr);
          ps1.setString(2,sec_all_auth);
          ps1.setString(3,consolidate_all_bgt_lvl);
          rs1 = ps1.executeQuery();
          while(rs1.next()){
              consolidate_rdy_sec_cnt = rs1.getString(1);
          }
          rs1.close();
          ps1.close();
          if(Integer.parseInt(consolidate_rdy_sec_cnt) == Integer.parseInt(sec_cnt_under_auth)){
              ready_for_consolidation_flg = "1";
              rmks_all="READY FOR CONSOLIDATION BY "+sec_all_auth;
          }else{
             ps1 = mk.con.prepareStatement(" select count(distinct sec_cd) from bgt_form2b_data_bbgs "+
                                           " where bgt_yr=? and sec_cd in (select distinct sec_cd from bgt_level where emp_desg=?) "+
                                           " and bgt_level> '1' ");
             ps1.setString(1,cur_bgt_yr);
             ps1.setString(2,sec_all_auth);
             rs1 = ps1.executeQuery();
             while(rs1.next()){
                pndg_apprvl_rdy_sec_cnt = rs1.getString(1);
             }
             rs1.close();
             ps1.close();
             if(Integer.parseInt(pndg_apprvl_rdy_sec_cnt) == Integer.parseInt(sec_cnt_under_auth)){
                  pndg_apprvl_all_flg = "1";
                  rmks_all="PENDING AUTHORITY INTERVENTION";
             }else{
                ps1 = mk.con.prepareStatement(" select count(distinct sec_cd) from bgt_form2b_data_bbgs "+
                                              " where bgt_yr=? and sec_cd in (select distinct sec_cd from bgt_level where emp_desg=?) ");
                ps1.setString(1,cur_bgt_yr);
                ps1.setString(2,sec_all_auth);
                rs1 = ps1.executeQuery();
                while(rs1.next()){
                    entry_all_initiated = rs1.getString(1);
                }
                rs1.close();
                ps1.close();
                if(!entry_all_initiated.equals("0")){
                     entry_all_initiated_flg = "1";
                     rmks_all="ENTRY INITIATED";
                }else{
                     entry_all_initiated_flg = "0";
                     rmks_all="ENTRY NOT YET INITIATED";
                }
             }
          }
      }
   }
if(sec_bgt_finalized_ovral_flg.equals("1") || sec_bgt_ready_all_flg.equals("1")){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:green; width: 39px;" /></strong></td>
<%
}else if(ready_for_consolidation_flg.equals("1") || pndg_apprvl_all_flg.equals("1")){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:yellow; width: 39px;" /></strong></td>
<%
}else if(entry_all_initiated_flg.equals("1") ){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:red; width: 39px;" /></strong></td>
<%
}else{
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:white; width: 39px;" /></strong></td>
<%
}
%>
                <td style="width: 12%" class="style5" align="left"><strong><%=rmks_all%></strong></td>
<%
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+
                                     " where stn_cd ='B' and bgt_yr = ? and sec_cd=? ");
       ps1.setString(1,cur_bgt_yr);
       ps1.setString(2,sec_all_auth_act);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  view_exist_all = rs1.getString(1);
}
rs1.close();
ps1.close();
if(!view_exist_all.equals("0")){
   view_all_flg="1";
}
       ps1 = mk.con.prepareStatement(" select count(distinct sec_cd) from BGT_FORM2B_DATA_BBGS "+
                                     " where stn_cd ='B' and bgt_yr = ? and bgt_level=?"+ 
                                     " and sec_cd in (select distinct sec_cd from bgt_level where emp_desg=?) ");
       ps1.setString(1,finyr);
       ps1.setString(2,consolidate_all_bgt_lvl);
       ps1.setString(3,sec_all_auth);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  rej_exist_cnt = rs1.getString(1);
}
rs1.close();
ps1.close();
       
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+
                                     " where stn_cd ='B' and bgt_yr = ? "+ 
                                     " and sec_cd =?  ");
       ps1.setString(1,finyr);
       ps1.setString(2,sec_all_auth_act);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  con_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
if((Integer.parseInt(rej_exist_cnt) == Integer.parseInt(sec_cnt_under_auth)) && con_exist.equals("0")){
   rej_flg_all="1";
   consolidate_flg_all="1";
}
       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level "+
                                     " where emp_desg=? "+
                                     " and emp_code=? ");
       ps1.setString(1,sec_all_auth);
       ps1.setString(2,empcd);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  auth_all_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
if(!auth_all_exist.equals("0")){
   auth_all_flg="1";
}
       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level   "+
                                     " where nvl(view_all_mkr,' ')='Y'  "+
                                     " and emp_code=? ");
       ps1.setString(1,empcd);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  view_all_auth_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(!view_all_auth_exist.equals("0")){
   view_all_auth_flg="1";
}else{

       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level "+
                                     " where stn_cd='B' and sec_cd<>'CTM'  "+
                                     " and emp_code=? ");
       ps1.setString(1,empcd);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  view_all_auth_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(!view_all_auth_exist.equals("0")){
   view_all_auth_flg="1";
}
}

       ps1 = mk.con.prepareStatement(" select count(*) from bgt_form2b_data "+
                                     " where stn_cd='B' and sec_cd='ALL' and bgt_yr=?  ");
       ps1.setString(1,finyr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  gm_consolidate_exist = rs1.getString(1);
}
rs1.close();
ps1.close();


       ps1 = mk.con.prepareStatement(" select count(*) from bgt_form2b_data_bbgs "+
                                     " where stn_cd='B' and sec_cd=? and bgt_yr=?  ");
       ps1.setString(1,sec_all_auth_act);
       ps1.setString(2,finyr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  dgm_con_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(gm_consolidate_exist.equals("0") && !dgm_con_exist.equals("0")){
   rej_flg_all="1";
}

%>
<input type="hidden" id= "secallauth<%=cnt1%>" name = "secallauth<%=cnt1%>" value="<%=sec_all_auth%>" />
                <td style="width: 25%" class="<%= sStyle %>" align="left"><strong><input type="button" value="Consolidate" id="consolidate<%=cnt1%>" name="consolidate<%=cnt1%>" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="consolidate_all(<%= cnt1%>);">&nbsp;&nbsp;&nbsp;<input type="button" value="Reject" id="reject<%=cnt1%>" name="reject<%=cnt1%>" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="rej_all(<%= cnt1%>);">&nbsp;&nbsp;<input type="button" value="View " id="view<%=cnt1%>" name="view<%=cnt1%>" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="view_all(<%= cnt1%>);">
 </strong></td>

<script>
enable_btn_all(<%=auth_all_flg%>,<%=consolidate_flg_all%>,<%=rej_flg_all%>,<%=view_all_flg%>,<%=view_all_auth_flg%>,<%=cnt1%>);
</script>

</tr>
<%
cnt1=cnt1+1;
%>
</table>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style3"  colspan="7" align="middle"><strong>DETAILS OF SECTION(S) UNDER <%=sec_all_auth%></strong></td>
        </tr>

        <tr>
                <td style="width: 30%" class="style3"><strong>SECTION NAME (Click to view history)</strong></td>
                <td style="width: 10%" class="style3"><strong>INDICATOR</strong></td>
                <td style="width: 30%" class="style3"><strong>REMARKS</strong></td>
                <td style="width: 30%" class="style3"><strong>&nbsp;</strong></td>
        </tr>
<%
while(rs.next()){
  auth_flg                   = "0";
  rej_auth_flg               = "0";
  view_auth_flg              = "0";
  forward_flg                = "0";
  rej_flg                    = "0";
  view_flg                   = "0";
  sec_bgt_finalized_flg      = "0";
  sec_bgt_pndg_apprvl_flg    = "0";
  sec_bgt_entry_started_flg  = "0";
  sec_bgt_ready_flg          = "0";
  sec_bgt_pub_flg            = "0";
%>
<tr>
                <td style="width: 30%" class="style5" align="center"><strong><a href="#" onClick="window.open('sec_bgt_hist.jsp?stn_cd=<%=stn_cd%>&sec_cd=<%=rs.getString(1)%>&finyr=<%=finyr%>&finyr1=<%=finyr1%>&empcd=<%=empcd%>','_self');"><%=rs.getString(1)%></strong></td>
<%
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd=? and nvl(bgt_fnl,' ')='F' ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       ps1.setString(3,rs.getString(1));
       rs1 = ps1.executeQuery();

while(rs1.next()){
  sec_bgt_finalized = rs1.getString(1);
}
rs1.close();
ps1.close();

    if(!sec_bgt_finalized.equals("0")){
      sec_bgt_finalized_flg="1";
      rmks = "BUDGET FINALIZED.";
    }else{

       ps1 = mk.con.prepareStatement(" select nvl(max(bgt_ver),'1') from BGT_POSITION "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd=? and SEND_TO_LOWER_LEVEL_DT is null ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       ps1.setString(3,rs.getString(1));
       rs1 = ps1.executeQuery();

       while(rs1.next()){
            cur_bgt_ver = rs1.getString(1);
            cur_bgt_yr  = finyr;
       }
       rs1.close();
       ps1.close();
       

       ps1 = mk.con.prepareStatement(" select max(bgt_level) from BGT_LEVEL "+
                                     " where stn_cd =? and nvl(consolidate_mkr,' ') = 'Y' and sec_cd=? ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,rs.getString(1));
       rs1 = ps1.executeQuery();

        while(rs1.next()){
           max_bgt_level = rs1.getString(1);
        }
        rs1.close();
        ps1.close();
       
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+
                                     " where stn_cd =? and sec_cd=? and bgt_level = ? and bgt_yr=? and bgt_ver=? ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,rs.getString(1));
       ps1.setString(3,max_bgt_level);
       ps1.setString(4,finyr);
       ps1.setString(5,cur_bgt_ver);
       rs1 = ps1.executeQuery();

        while(rs1.next()){
           sec_bgt_ready = rs1.getString(1);
        }
        rs1.close();
        ps1.close();
           if(!sec_bgt_ready.equals("0")){
              sec_bgt_ready_flg = "1";
              rmks              = "SECTION BUDGET READY";
           }else{
                 ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+
                                               " where stn_cd =? and sec_cd=?  and bgt_level < ? and bgt_level>'1' and bgt_yr=? and bgt_ver=? ");
                 ps1.setString(1,stn_cd);
                 ps1.setString(2,rs.getString(1));
                 ps1.setString(3,max_bgt_level);
                 ps1.setString(4,finyr);
                 ps1.setString(5,cur_bgt_ver);
                 rs1 = ps1.executeQuery();

                 while(rs1.next()){
                 sec_bgt_pndg_apprvl = rs1.getString(1);
                 }
                 rs1.close();
                 ps1.close();
                
                if(!sec_bgt_pndg_apprvl.equals("0")){
                     ps1 = mk.con.prepareStatement(" select EMP_DESG from BGT_LEVEL "+
                                                   " where stn_cd =? and sec_cd=?  and bgt_level = (select distinct bgt_level from BGT_FORM2B_DATA_BBGS where stn_cd=? and sec_cd=? and bgt_yr=?)");
                     ps1.setString(1,stn_cd);
                     ps1.setString(2,rs.getString(1));
                     ps1.setString(3,stn_cd);
                     ps1.setString(4,rs.getString(1));
                     ps1.setString(5,finyr);
                     rs1 = ps1.executeQuery();

                     while(rs1.next()){
                       sec_bgt_pndg_auth = rs1.getString(1);
                     }
                     rs1.close();
                     ps1.close();
                     sec_bgt_pndg_apprvl_flg="1";
                     rmks="PENDING INTERVENTION OF "+sec_bgt_pndg_auth;
                }else{
                   ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+
                                                 " where stn_cd =? and bgt_ver=? and sec_cd=?  and bgt_level= '1' and bgt_yr=? and nvl(publish_mkr,' ')='Y' ");
                   ps1.setString(1,stn_cd);
                   ps1.setString(2,cur_bgt_ver);
                   ps1.setString(3,rs.getString(1));
                   ps1.setString(4,finyr);
                   rs1 = ps1.executeQuery();

                   while(rs1.next()){
                      sec_bgt_pub = rs1.getString(1);
                   }
                   rs1.close();
                   ps1.close();
                    if(!sec_bgt_pub.equals("0")){
                   ps1 = mk.con.prepareStatement(" select distinct emp_desg FROM BGT_LEVEL "+
                                                 " where stn_cd =?  and sec_cd=?  and bgt_level= '1' and emp_code=(select distinct upd_by from bgt_form2b_data_bbgs where stn_cd=? and sec_cd=? and bgt_yr=? and crt_by <>'IT') ");
                   ps1.setString(1,stn_cd);
                   ps1.setString(2,rs.getString(1));
                   ps1.setString(3,stn_cd);
                   ps1.setString(4,rs.getString(1));
                   ps1.setString(5,finyr);
                   rs1 = ps1.executeQuery();

                   while(rs1.next()){
                      entry_emp_desg = rs1.getString(1);
                   }
                   rs1.close();
                   ps1.close();
                        sec_bgt_pub_flg="1";
                        rmks="BUDGET PUBLISHED BUT PENDING INTERVENTION OF "+entry_emp_desg;
                    }else{
                        ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+
                                                      " where stn_cd =? and bgt_ver=? and sec_cd=?  and bgt_level= '1' "+ 
                                                      " and bgt_yr=? and nvl(publish_mkr,' ')='N' ");
                        ps1.setString(1,stn_cd);
                        ps1.setString(2,cur_bgt_ver);
                        ps1.setString(3,rs.getString(1));
                        ps1.setString(4,finyr);
                        rs1 = ps1.executeQuery();

                        while(rs1.next()){
                          sec_bgt_entry_started = rs1.getString(1);
                        }
                        rs1.close();
                        ps1.close();
                          if(!sec_bgt_entry_started.equals("0")){
                             sec_bgt_entry_started_flg="1";
                             rmks="ENTRY INITIATED";
                          }else{
                             sec_bgt_entry_started_flg="0";
                             rmks="ENTRY NOT YET INITIATED.";
                          }
                    }
                }
           }
    }

if(sec_bgt_finalized_flg.equals("1") || sec_bgt_ready_flg.equals("1")){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:green; width: 39px;" /></strong></td>
<%
}else if(sec_bgt_pndg_apprvl_flg.equals("1") || sec_bgt_pub_flg.equals("1")){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:yellow; width: 39px;" /></strong></td>
<%
}else if(sec_bgt_entry_started_flg.equals("1") ){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:red; width: 39px;" /></strong></td>
<%
}else{
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:white; width: 39px;" /></strong></td>
<%
}
%>
                <td style="width: 12%" class="style5" align="left"><strong><%=rmks%></strong></td>
<%
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd=? and nvl(publish_mkr,' ')='Y' ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       ps1.setString(3,rs.getString(1));
       rs1 = ps1.executeQuery();

while(rs1.next()){
  view_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
if(!view_exist.equals("0")){
   view_flg="1";
}
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd=? and nvl(publish_mkr,' ')='Y' and bgt_level>'1' and nvl(bgt_fnl,' ')<>'F' ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       ps1.setString(3,rs.getString(1));
       rs1 = ps1.executeQuery();

while(rs1.next()){
  rej_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
       
      ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd=decode(?,'DGM(I)-BBGS','DGM1','DGM2')");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       ps1.setString(3,sec_all_auth);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  stn_con_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(!rej_exist.equals("0") && stn_con_exist.equals("0")){
   rej_flg="1";
}
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd=? and nvl(publish_mkr,' ')='Y' and bgt_level>='1' and bgt_level < ? and nvl(bgt_fnl,' ')<>'F' ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       ps1.setString(3,rs.getString(1));
       ps1.setString(4,max_bgt_level);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  forward_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
if(!forward_exist.equals("0")){
   forward_flg="1";
}
       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level "+
                                     " where stn_cd=? and sec_cd=? "+
                                     " and nvl(consolidate_mkr,' ')<>'Y' "+
                                     " and emp_code=? "+
                                     " and bgt_level=(select distinct bgt_level from bgt_form2b_data_bbgs where stn_cd=? and sec_cd=? and bgt_yr=?) ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,rs.getString(1));
       ps1.setString(3,empcd);
       ps1.setString(4,stn_cd);
       ps1.setString(5,rs.getString(1));
       ps1.setString(6,finyr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  auth_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
if(!auth_exist.equals("0")){
   auth_flg="1";
}

       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level "+
                                     " where stn_cd=? and sec_cd=? "+
                                     " and bgt_level in ('2','3') "+
                                     " and emp_code=? "+
                                     " and bgt_level=(select distinct bgt_level from bgt_form2b_data_bbgs where stn_cd=? and sec_cd=? and bgt_yr=?) ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,rs.getString(1));
       ps1.setString(3,empcd);
       ps1.setString(4,stn_cd);
       ps1.setString(5,rs.getString(1));
       ps1.setString(6,finyr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  rej_auth_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
if(!rej_auth_exist.equals("0")){
   rej_auth_flg="1";
}
       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level "+
                                     " where nvl(view_all_mkr,' ')='Y'  "+
                                     " and emp_code=? ");
       ps1.setString(1,empcd);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  view_auth_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(!view_auth_exist.equals("0")){
   view_auth_flg="1";
}else{

if(rs.getString(1).equals("CTM")){
       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level "+
                                     " where stn_cd in (?,'C')  "+
                                     " and emp_code=? ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,empcd);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  view_auth_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(!view_auth_exist.equals("0")){
   view_auth_flg="1";
}
}else{
       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level "+
                                     " where stn_cd=? and sec_cd <>'CTM'  "+
                                     " and emp_code=? ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,empcd);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  view_auth_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(!view_auth_exist.equals("0")){
   view_auth_flg="1";
}
}
}
ps1 = mk.con.prepareStatement(" select max(bgt_level) from bgt_position "+
                                     " where stn_cd=? and sec_cd=? and bgt_yr=? and bgt_ver=?  ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,rs.getString(1));
       ps1.setString(3,finyr);
       ps1.setString(4,cur_bgt_ver);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  cur_bgt_level = rs1.getString(1);
}
rs1.close();
ps1.close();
%>
<input type="hidden" id= "sec_cd<%=cnt%>" name = "sec_cd<%=cnt%>" value="<%=rs.getString(1)%>" />
<input type="hidden" id= "bgt_lvl<%=cnt%>" name = "bgt_lvl<%=cnt%>" value="<%=cur_bgt_level%>" />
                <td style="width: 25%" class="<%= sStyle %>" align="left"><strong><input type="button" value="Forward" id="B<%=cnt%>" name="B<%=cnt%>" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="frwrd_higher_auth(<%= cnt%>);">&nbsp;&nbsp;&nbsp;<input type="button" value="Reject" id="R<%=cnt%>" name="R<%=cnt%>" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="rej_data(<%= cnt%>);">&nbsp;&nbsp;<input type="button" value="View " id="V<%=cnt%>" name="V<%=cnt%>" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="view_budget(<%= cnt%>);">
 </strong></td>

<script>
enable_btn(<%=auth_flg%>,<%=forward_flg%>,<%=rej_flg%>,<%=view_flg%>,<%=view_auth_flg%>,<%=cnt%>,<%=rej_auth_flg%>);
</script>

</tr>
<%
cnt=cnt+1;
}
rs.close();
ps.close();
%>
</table>
&nbsp;
<%
}
rs3.close();
ps3.close();

}else{
       ps1 = mk.con.prepareStatement(" select emp_desg from BGT_LEVEL "+
                                     " where stn_cd =?  and nvl(consolidate_mkr,' ') ='Y' and nvl(consolidate_stn_cd,' ') =? ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,stn_cd);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  sec_all_auth = rs1.getString(1);
}
rs1.close();
ps1.close();

       ps = mk.con.prepareStatement(" select SECTION_CD,SECTION_DESC from BGT_CD_SECTION "+
                                     " where STATION_CD=? ORDER BY SECTION_CD ");
       ps.setString(1,stn_cd);
       rs = ps.executeQuery();


%>
<br>
<br>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style3"  colspan="7" align="middle"><strong>SECTION(S) UNDER <%=sec_all_auth%></strong></td>
        </tr>

        <tr>
                <td style="width: 30%" class="style3"><strong>SECTION NAME (Click to view history)</strong></td>
                <td style="width: 10%" class="style3"><strong>INDICATOR</strong></td>
                <td style="width: 30%" class="style3"><strong>REMARKS</strong></td>
                <td style="width: 30%" class="style3"><strong>&nbsp;</strong></td>
        </tr>
<%
while(rs.next()){
  auth_flg                   = "0";
  rej_auth_flg               = "0";
  view_auth_flg              = "0";
  forward_flg                = "0";
  rej_flg                    = "0";
  view_flg                   = "0";
  sec_bgt_finalized_flg      = "0";
  sec_bgt_pndg_apprvl_flg    = "0";
  sec_bgt_entry_started_flg  = "0";
  sec_bgt_ready_flg          = "0";
  sec_bgt_pub_flg            = "0";
%>
<tr>
                <td style="width: 30%" class="style5" align="center"><strong><a href="#" onClick="window.open('sec_bgt_hist.jsp?stn_cd=<%=stn_cd%>&sec_cd=<%=rs.getString(1)%>&finyr=<%=finyr%>&finyr1=<%=finyr1%>&empcd=<%=empcd%>','_self');"><%=rs.getString(1)%></strong></td>
<%
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd=? and nvl(bgt_fnl,' ')='F' ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       ps1.setString(3,rs.getString(1));
       rs1 = ps1.executeQuery();

while(rs1.next()){
  sec_bgt_finalized = rs1.getString(1);
}
rs1.close();
ps1.close();

    if(!sec_bgt_finalized.equals("0")){
      sec_bgt_finalized_flg="1";
      rmks = "BUDGET FINALIZED.";
    }else{

       ps1 = mk.con.prepareStatement(" select nvl(max(bgt_ver),'1') from BGT_POSITION "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd=? and SEND_TO_LOWER_LEVEL_DT is null ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       ps1.setString(3,rs.getString(1));
       rs1 = ps1.executeQuery();

       while(rs1.next()){
            cur_bgt_ver = rs1.getString(1);
            cur_bgt_yr  = finyr;
       }
       rs1.close();
       ps1.close();
       

       ps1 = mk.con.prepareStatement(" select max(bgt_level) from BGT_LEVEL "+
                                     " where stn_cd =? and nvl(consolidate_mkr,' ') = 'Y' and sec_cd=? ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,rs.getString(1));
       rs1 = ps1.executeQuery();

        while(rs1.next()){
           max_bgt_level = rs1.getString(1);
        }
        rs1.close();
        ps1.close();
       
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                     " where stn_cd =? and sec_cd=? and bgt_level = ? and bgt_yr=? and bgt_ver=? ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,rs.getString(1));
       ps1.setString(3,max_bgt_level);
       ps1.setString(4,finyr);
       ps1.setString(5,cur_bgt_ver);
       rs1 = ps1.executeQuery();

        while(rs1.next()){
           sec_bgt_ready = rs1.getString(1);
        }
        rs1.close();
        ps1.close();
           if(!sec_bgt_ready.equals("0")){
              sec_bgt_ready_flg = "1";
              rmks              = "SECTION BUDGET READY";
           }else{
                 ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                               " where stn_cd =? and sec_cd=?  and bgt_level < ? and bgt_level>'1' and bgt_yr=? and bgt_ver=? ");
                 ps1.setString(1,stn_cd);
                 ps1.setString(2,rs.getString(1));
                 ps1.setString(3,max_bgt_level);
                 ps1.setString(4,finyr);
                 ps1.setString(5,cur_bgt_ver);
                 rs1 = ps1.executeQuery();

                 while(rs1.next()){
                 sec_bgt_pndg_apprvl = rs1.getString(1);
                 }
                 rs1.close();
                 ps1.close();
                
                if(!sec_bgt_pndg_apprvl.equals("0")){
                     ps1 = mk.con.prepareStatement(" select EMP_DESG from BGT_LEVEL "+
                                                   " where stn_cd =? and sec_cd=?  and bgt_level = (select distinct bgt_level from BGT_FORM2B_DATA where stn_cd=? and sec_cd=? and bgt_yr=?)");
                     ps1.setString(1,stn_cd);
                     ps1.setString(2,rs.getString(1));
                     ps1.setString(3,stn_cd);
                     ps1.setString(4,rs.getString(1));
                     ps1.setString(5,finyr);
                     rs1 = ps1.executeQuery();

                     while(rs1.next()){
                       sec_bgt_pndg_auth = rs1.getString(1);
                     }
                     rs1.close();
                     ps1.close();
                     sec_bgt_pndg_apprvl_flg="1";
                     rmks="PENDING INTERVENTION OF "+sec_bgt_pndg_auth;
                }else{
                   ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                                 " where stn_cd =? and bgt_ver=? and sec_cd=?  and bgt_level= '1' and bgt_yr=? and nvl(publish_mkr,' ')='Y' ");
                   ps1.setString(1,stn_cd);
                   ps1.setString(2,cur_bgt_ver);
                   ps1.setString(3,rs.getString(1));
                   ps1.setString(4,finyr);
                   rs1 = ps1.executeQuery();

                   while(rs1.next()){
                      sec_bgt_pub = rs1.getString(1);
                   }
                   rs1.close();
                   ps1.close();
                    if(!sec_bgt_pub.equals("0")){
                   ps1 = mk.con.prepareStatement(" select distinct emp_desg FROM BGT_LEVEL "+
                                                 " where stn_cd =?  and sec_cd=?  and bgt_level= '1' and emp_code=(select distinct upd_by from bgt_form2b_data where stn_cd=? and sec_cd=? and bgt_yr=? and crt_by <>'IT') ");
                   ps1.setString(1,stn_cd);
                   ps1.setString(2,rs.getString(1));
                   ps1.setString(3,stn_cd);
                   ps1.setString(4,rs.getString(1));
                   ps1.setString(5,finyr);
                   rs1 = ps1.executeQuery();

                   while(rs1.next()){
                      entry_emp_desg = rs1.getString(1);
                   }
                   rs1.close();
                   ps1.close();
                        sec_bgt_pub_flg="1";
                        rmks="BUDGET PUBLISHED BUT PENDING INTERVENTION OF "+entry_emp_desg;
                    }else{
                        ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                                      " where stn_cd =? and bgt_ver=? and sec_cd=?  and bgt_level= '1' "+ 
                                                      " and bgt_yr=? and nvl(publish_mkr,' ')='N' ");
                        ps1.setString(1,stn_cd);
                        ps1.setString(2,cur_bgt_ver);
                        ps1.setString(3,rs.getString(1));
                        ps1.setString(4,finyr);
                        rs1 = ps1.executeQuery();

                        while(rs1.next()){
                          sec_bgt_entry_started = rs1.getString(1);
                        }
                        rs1.close();
                        ps1.close();
                          if(!sec_bgt_entry_started.equals("0")){
                             sec_bgt_entry_started_flg="1";
                             rmks="ENTRY INITIATED";
                          }else{
                             sec_bgt_entry_started_flg="0";
                             rmks="ENTRY NOT YET INITIATED.";
                          }
                    }
                }
           }
    }

if(sec_bgt_finalized_flg.equals("1") || sec_bgt_ready_flg.equals("1")){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:green; width: 39px;" /></strong></td>
<%
}else if(sec_bgt_pndg_apprvl_flg.equals("1") || sec_bgt_pub_flg.equals("1")){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:yellow; width: 39px;" /></strong></td>
<%
}else if(sec_bgt_entry_started_flg.equals("1")){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:red; width: 39px;" /></strong></td>
<%
}else{
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:white; width: 39px;" /></strong></td>
<%
}
%>
                <td style="width: 12%" class="style5" align="left"><strong><%=rmks%></strong></td>
<%
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd=? and nvl(publish_mkr,' ')='Y' ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       ps1.setString(3,rs.getString(1));
       rs1 = ps1.executeQuery();

while(rs1.next()){
  view_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
if(!view_exist.equals("0")){
   view_flg="1";
}
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd=? and nvl(publish_mkr,' ')='Y' and bgt_level>'1' and nvl(bgt_fnl,' ')<>'F' ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       ps1.setString(3,rs.getString(1));
       rs1 = ps1.executeQuery();

while(rs1.next()){
  rej_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
       
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd='ALL' ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  stn_con_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(!rej_exist.equals("0") && stn_con_exist.equals("0")){
   rej_flg="1";
}

       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd=? and nvl(publish_mkr,' ')='Y' and bgt_level>='1' and bgt_level < ? and nvl(bgt_fnl,' ')<>'F' ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,finyr);
       ps1.setString(3,rs.getString(1));
       ps1.setString(4,max_bgt_level);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  forward_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
if(!forward_exist.equals("0")){
   forward_flg="1";
}
       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level "+
                                     " where stn_cd=? and sec_cd=? "+
                                     " and nvl(consolidate_mkr,' ')<>'Y' "+
                                     " and emp_code=? "+
                                     " and bgt_level=(select distinct bgt_level from bgt_form2b_data where stn_cd=? and sec_cd=? and bgt_yr=?) ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,rs.getString(1));
       ps1.setString(3,empcd);
       ps1.setString(4,stn_cd);
       ps1.setString(5,rs.getString(1));
       ps1.setString(6,finyr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  auth_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
if(!auth_exist.equals("0")){
   auth_flg="1";
}
       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level "+
                                     " where stn_cd=? and sec_cd=? "+
                                     " and bgt_level in ('2','3') "+
                                     " and emp_code=? "+
                                     " and bgt_level=(select distinct bgt_level from bgt_form2b_data where stn_cd=? and sec_cd=? and bgt_yr=?) ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,rs.getString(1));
       ps1.setString(3,empcd);
       ps1.setString(4,stn_cd);
       ps1.setString(5,rs.getString(1));
       ps1.setString(6,finyr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  rej_auth_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
if(!rej_auth_exist.equals("0")){
   rej_auth_flg="1";
}
       
       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level "+
                                     " where nvl(view_all_mkr,' ')='Y'  "+
                                     " and emp_code=? ");
       ps1.setString(1,empcd);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  view_auth_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(!view_auth_exist.equals("0")){
   view_auth_flg="1";
}else{

if(rs.getString(1).equals("CTM")){
       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level "+
                                     " where stn_cd in (?,'C')  "+
                                     " and emp_code=? ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,empcd);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  view_auth_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(!view_auth_exist.equals("0")){
   view_auth_flg="1";
}
}else{
       ps1 = mk.con.prepareStatement(" select count(*) from bgt_level "+
                                     " where stn_cd=? and sec_cd <>'CTM'  "+
                                     " and emp_code=? ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,empcd);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  view_auth_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(!view_auth_exist.equals("0")){
   view_auth_flg="1";
}
}
}
       
ps1 = mk.con.prepareStatement(" select max(bgt_level) from bgt_position "+
                                     " where stn_cd=? and sec_cd=? and bgt_yr=? and bgt_ver=?  ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,rs.getString(1));
       ps1.setString(3,finyr);
       ps1.setString(4,cur_bgt_ver);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  cur_bgt_level = rs1.getString(1);
}
rs1.close();
ps1.close();
%>
<input type="hidden" id= "sec_cd<%=cnt%>" name = "sec_cd<%=cnt%>" value="<%=rs.getString(1)%>" />
<input type="hidden" id= "bgt_lvl<%=cnt%>" name = "bgt_lvl<%=cnt%>" value="<%=cur_bgt_level%>" />
                <td style="width: 25%" class="<%= sStyle %>" align="left"><strong><input type="button" value="Forward" id="B<%=cnt%>" name="B<%=cnt%>" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="frwrd_higher_auth(<%= cnt%>);">&nbsp;&nbsp;&nbsp;<input type="button" value="Reject" id="R<%=cnt%>" name="R<%=cnt%>" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="rej_data(<%= cnt%>);">&nbsp;&nbsp;<input type="button" value="View " id="V<%=cnt%>" name="V<%=cnt%>" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="view_budget(<%= cnt%>);">
 </strong></td>

<script>
enable_btn(<%=auth_flg%>,<%=forward_flg%>,<%=rej_flg%>,<%=view_flg%>,<%=view_auth_flg%>,<%=cnt%>,<%=rej_auth_flg%>);
</script>

</tr>
<%
cnt=cnt+1;
}
rs.close();
ps.close();

}
%>
</table>
<input type="hidden" id= "stn_cd" name = "stn_cd" value="<%=stn_cd%>" />
<input type="hidden" id= "finyr" name = "finyr" value="<%=finyr%>" />
<input type="hidden" id= "finyr1" name = "finyr1" value="<%=finyr1%>" />
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
<input type="hidden" id= "station" name = "station" value="<%=station%>" />
<input type="hidden" id= "emp_desg" name = "emp_desg" value="<%=your_desg%>" />

<%
}catch(Exception e){
  e.printStackTrace();
}finally{
     if(rs1!=null){
        rs1.close();
     }
     if(ps1!=null){
        ps1.close();
     }
     if(rs!=null){
        rs.close();
     }
     if(ps!=null){
        ps.close();
     }
     if(rs3!=null){
        rs3.close();
     }
     if(ps3!=null){
        ps3.close();
     }
     if(mk!=null){
        mk.con.close();
     }

}

%>
</body>
</html>