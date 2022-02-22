<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="java.io.*,javax.servlet.jsp.*,javax.ejb.EJB,javax.naming.*,java.util.*,java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="oracle.sql.*" %>
<%@ page import="oracle.jdbc.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@page import="Order.OrderProcessBeanRemote"%>
<%@page import="VO.LoginBean"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
.style4 {
        border-color: #88799D;
        font-family: Arial;
        font-size: small;
}
.style5 {
        font-family: Arial;
        font-size: 9pt;
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

function validate_form(){

var fn=document.f1.finyr1.value;
var fn1=parseInt(fn)+1;
document.f1.finyr2.value=fn1;

 if(!isNull(document.f1.finyr1.value)){
           alert('GIVE START FINANCIAL YEAR.');
           document.f1.finyr1.value = '';
           document.f1.finyr1.focus();
           return false;
        }
 else if(!isNull(document.f1.finyr2.value)){
           alert('GIVE END FINANCIAL YEAR.');
           document.f1.finyr2.value = '';
           document.f1.finyr2.focus();
           return false;
        }
 else if(!isPosInt(f1.finyr1.value)){
           alert("START FINANCIAL YEAR MUST BE NUMERIC.");
           document.f1.finyr1.value = '';
           document.f1.finyr1.focus();
           return false;
        }
 else if(!isPosInt(f1.finyr2.value)){
           alert("END FINANCIAL YEAR MUST BE NUMERIC.");
           document.f1.finyr2.value = '';
           document.f1.finyr2.focus();
           return false;
        }
    else{
            return true;
        }
}

function enable_btn_all(str,str1,str2,str3){
if(str != '0'){
   if(str1 != '0'){
          document.f1.vw_all.disabled=false;
   }
   if(str2 != '0'){
          document.f1.cmpl_all.disabled=false;
   }
   if(str3 != '0'){
          document.f1.vw_all.disabled=false;
          document.f1.rjct_all.disabled=false;
          document.f1.finalize_all.disabled=false;
   }
}
}

function enable_btn(str,str1,str2,str3,str4,str5){
if(str != '0'){
   if(str2 != '0'){
      if(str3 == '1'){
          document.f1.B1.disabled=false;
      }else if(str3 == '2'){
          document.f1.B2.disabled=false;
      }else if(str3 == '3'){
          document.f1.B3.disabled=false;
      }else if(str3 == '4'){
          document.f1.B4.disabled=false;
      }else if(str3 == '5'){
          document.f1.B5.disabled=false;
      }else{
          document.f1.B6.disabled=false;
      }
   }
   if(str1 != '0'){
      if(str3 == '1'){
          document.f1.R1.disabled=false;
      }else if(str3 == '2'){
          document.f1.R2.disabled=false;
      }else if(str3 == '3'){
          document.f1.R3.disabled=false;
      }else if(str3 == '4'){
          document.f1.R4.disabled=false;
      }else if(str3 == '5'){
          document.f1.R5.disabled=false;
      }else{
          document.f1.R6.disabled=false;
      }
   }
}
if(str5 != '0'){
   if(str4 != '0'){
      if(str3 == '1'){
          document.f1.V1.disabled=false;
      }else if(str3 == '2'){
          document.f1.V2.disabled=false;
      }else if(str3 == '3'){
          document.f1.V3.disabled=false;
      }else if(str3 == '4'){
          document.f1.V4.disabled=false;
      }else if(str3 == '5'){
          document.f1.V5.disabled=false;
      }else{
          document.f1.V6.disabled=false;
      }
   }
}
}

function consolidate_data_all(){
var flg=confirm("ARE YOU SURE TO CONSOLIDATE GENERATION BUDGET FOR FINYR "+document.f1.finyr.value);
if(flg==true){
   var parameter='';
   parameter = parameter + '&finyr='+document.f1.finyr1.value;
   parameter = parameter + '&finyr1='+document.f1.finyr.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("gen_all_consolidate.jsp?"+parameter,"_self");
}else{
  return false;
}

}

function finalize_data_all(){
var flg=confirm("ARE YOU SURE TO FINALIZE GENERATION BUDGET FOR FINYR "+document.f1.finyr.value);
if(flg==true){
   var parameter='';
   parameter = parameter + '&finyr='+document.f1.finyr1.value;
   parameter = parameter + '&finyr1='+document.f1.finyr.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("gen_all_finalize.jsp?"+parameter,"_self");
}else{
  return false;
}

}

function consolidate_data(str){
var flg=confirm("ARE YOU SURE TO CONSOLIDATE BUDGET FOR "+document.getElementById("station"+str).value);
if(flg==true){
   var parameter='';
   parameter = parameter + 'stn_cd='+document.getElementById("stn_cd"+str).value;
   parameter = parameter + '&station='+document.getElementById("station"+str).value;
   parameter = parameter + '&finyr='+document.f1.finyr1.value;
   parameter = parameter + '&finyr1='+document.f1.finyr.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("gen_spec_consolidate.jsp?"+parameter,"_self");
}else{
  return false;
}

}

function reject_gen_budget(){
var flg=confirm("ARE YOU SURE TO REJECT GENERATION BUDGET FOR FINYR "+document.f1.finyr.value);
if(flg==true){
   var parameter='';
   parameter = parameter + 'finyr='+document.f1.finyr1.value;
   parameter = parameter + '&finyr1='+document.f1.finyr.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("gen_budget_reject.jsp?"+parameter,"_self");
}else{
  return false;
}
}


function reject_data(str){
var flg=confirm("ARE YOU SURE TO REJECT BUDGET FOR "+document.getElementById("station"+str).value);
if(flg==true){

   var parameter='';
   parameter = parameter + 'stn_cd='+document.getElementById("stn_cd"+str).value;
   parameter = parameter + '&finyr='+document.f1.finyr1.value;
   parameter = parameter + '&finyr1='+document.f1.finyr.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("gen_all_rej_upd.jsp?"+parameter,"_self");
}else{
  return false;
}

}

function view_data(str){
   var parameter='';
   parameter = parameter + 'stn_cd='+document.getElementById("stn_cd"+str).value;
   parameter = parameter + '&sec_cd=ALL';
   parameter = parameter + '&T1='+document.f1.finyr1.value;
   parameter = parameter + '&username='+document.f1.empcd.value;
   parameter = parameter + '&emp_desg='+document.f1.emp_desg.value;
   parameter = parameter + '&bgt_lvl=2';
   parameter = parameter + '&stn_long_desc='+document.getElementById("station"+str).value;
//alert(parameter);
  window.open("generation_budget_de.jsp?"+parameter,"_blank");
}

function view_data_all(){
   var parameter='';
   parameter = parameter + 'stn_cd=A';
   parameter = parameter + '&sec_cd=ALL';
   parameter = parameter + '&T1='+document.f1.finyr1.value;
   parameter = parameter + '&username='+document.f1.empcd.value;
   parameter = parameter + '&emp_desg='+document.f1.emp_desg.value;
   parameter = parameter + '&bgt_lvl=2';
   parameter = parameter + '&stn_long_desc=ALL';
//alert(parameter);
window.open("generation_budget_de.jsp?"+parameter,"_blank");

}


</script>
</head>

<body background="green1.jpg" onload="">
<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session" />
<%

  PreparedStatement ps   = null;
  ResultSet rs           = null;
  PreparedStatement ps1  = null;
  ResultSet rs1          = null;
  PreparedStatement ps2  = null;
  ResultSet rs2          = null;
  MakeConnectionGENORBL mk = null;
  String finyr1            = new String("");
  String cmpl_auth         = new String("");
  String finyr2            = new String("");
  String finyr             = new String("");
  String sysdate           = new String("");
  String sysdate1          = new String("");
  String ind               = new String("");
  String rmks              = new String("");
  String rmks_all          = new String("");
  String sStyle            = new String("");
  String cur_bgt_ver       = new String("");
  String cur_bgt_yr        = new String("");
  String stn_cmpl_exist    = new String("");
  String stn_wait_compile_exist   = new String("");
  String stn_wait_auth_apprvl_exist  = new String("");
  String stn_entry_compltd_exist     = new String("");
  String stn_entry_strtd_exist       = new String("");
  String stn_cmpl_flg                = new String("");
  String stn_wait_compile_flg        = new String("");
  String stn_wait_auth_apprvl_flg    = new String("");
  String stn_entry_compltd_flg       = new String("");
  String stn_entry_strtd_flg         = new String("");
  String stn_entry_pndg_flg          = new String("");
  String cnt_stn_sec                 = new String("");
  String empcd                       = new String("");
  String auth_flg                    = new String("");
  String auth_flg1                   = new String("");
  String auth_flg_view               = new String("");
  String view_flg                    = new String("");
  String stn_max_bgt_lvl             = new String("");
  String all_finalize_exist          = new String("");
  String all_finalize_flg            = new String("");
  String all_cmpl_exist              = new String("");
  String all_cmpl_flg                = new String("");
  String counter                     = new String("");
  String gen_entry_started_exist     = new String("0");
  String gen_entry_started_flg       = new String("0");
  String gen_entry_process_exist     = new String("0");
  String gen_entry_process_flg       = new String("0");
  String gen_entry_pndg_cmpl_exist   = new String("0");
  String gen_entry_pndg_cmpl_flg     = new String("0");
  String gen_entry_compile_exist     = new String("0");
  String gen_entry_compile_flg       = new String("0");
  String gen_entry_finalize_exist    = new String("0");
  String gen_entry_finalize_flg      = new String("0");
  String your_desg                   = new String("");
  String stn_bgt_compile_dt          = new String("");
  String gen_consolidation_dt        = new String("");
  String gen_bgt_fnl_dt              = new String("");
  

  //empcd                  = "000011";
  empcd                    = loginBean.getsEmpCd();
System.out.println("empcd:"+empcd);
  String rej_flg           = new String("0");
  String cmpl_flg          = new String("0");
  stn_entry_strtd_flg      = new String("");
  stn_entry_pndg_flg       = new String("");

try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);
     

       ps = mk.con.prepareStatement("select to_char(trunc(sysdate),'DD/MM/RR'),to_char(trunc(sysdate),'DD-MON-RRRR') from dual");
       rs = ps.executeQuery();
       while(rs.next()){
            sysdate  = rs.getString(1);
            sysdate1 = rs.getString(2);
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

       
       ps = mk.con.prepareStatement("select case when to_number(to_char(trunc(sysdate),'MM')) >= 1 and  to_number(to_char(trunc(sysdate),'MM')) <= 12 then to_char(trunc(sysdate),'RRRR')||'-'||to_char(add_months(trunc(sysdate),12),'RRRR') else to_char(add_months(trunc(sysdate),-12),'RRRR')||'-'||to_char(trunc(sysdate),'RRRR') end from dual");
       rs = ps.executeQuery();
       

       while(rs.next()){
            finyr = rs.getString(1);
       }
       rs.close();
       ps.close();

%>
<form name="f1">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate1%></font></b>
</label>

<label style="left:350px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">STATUS MONITORING FORM</font></b>
</label>

<label style="left:2px; top:50px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="3">FIN-YEAR (yyyy-yyyy) :</font></b>
<input type="text" id="finyr1"  name="finyr1" size="5" maxlength="4" style="font-family: Tahoma; font-size: 10pt; color: #800080; font-weight: bold; text-transform: uppercase;" value="<%= finyr.substring(0,4) %>" onkeypress=""/>
</label>

<label style="left:270px; top:50px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="3">&nbsp;&nbsp;-&nbsp;&nbsp;</font></b>
<input type="text" id="finyr2"  name="finyr2" size="5" maxlength="4" style="font-family: Tahoma; font-size: 10pt; color: #800080; font-weight: bold; text-transform: uppercase;" value="<%= finyr.substring(5,9) %>" onkeypress=""/>
</label>

<label style="left:400px; top:50px; position: absolute" >
<input type="button" value="Submit" name="sub" id="sub" style="border:3px double #003300; font-family: Tahoma; font-size: 10pt; color: #800000; font-weight: bold" onclick="if(validate_form()) f1.submit();"/></label></p>

<label style="left:650px; top:50px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>

<input type="hidden" id= "finyr" name ="finyr" value="<%=finyr%>" />
<%

if(request.getParameter("finyr1")!=null && request.getParameter("finyr2")!=null){

finyr1 = request.getParameter("finyr1");
finyr2 = request.getParameter("finyr2");
finyr = finyr1+" - "+finyr2;


System.out.println("finyr:"+finyr);
System.out.println("finyr1:"+finyr1);
System.out.println("finyr2:"+finyr2);

       ps = mk.con.prepareStatement(" select BGT_STATION_CD,STATION_LONG_DESC from CD_STATION "+
                                     " order by decode(BGT_STATION_CD,'B','1','T','2','S','3','N','4','C','5','E','6') ");
       rs = ps.executeQuery();


%>
<script>
f1.finyr1.value="<%=finyr1%>";
f1.finyr2.value="<%=finyr2%>";
f1.finyr.value="<%=finyr%>";
</script>
<br>
<br>
<br>
<table style="width: 100%" border="0">
        <tr>
                <td style="width: 20%"  colspan="7" align="right" size="4"><strong><a href="#" onClick="window.open('gen_budget_appr_rej_hist.jsp? finyr=<%=finyr1%>&finyr1=<%=finyr%>&empcd=<%=empcd%>','_blank');">Approval/Rejection History</strong></td>
        </tr>
</table>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style3"  colspan="7" align="middle"><strong>GENERATION DEPT BUDGET STATUS</strong></td>
        </tr>

        <tr>
                <td style="width: 15%" class="style3"><strong>&nbsp;</strong></td>
                <td style="width: 15%" class="style3"><strong>INDICATOR</strong></td>
                <td style="width: 30%" class="style3"><strong>REMARKS</strong></td>
                <td style="width: 40%" class="style3"><strong>&nbsp;</strong></td>
        </tr>
        <tr>
                <td style="width: 15%" class="style5" align="left"><strong>GENERATION DEPT</strong></td>
<%
ps2 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                              " where stn_cd ='A' and nvl(bgt_fnl,' ')='F' and bgt_yr=? ");
ps2.setString(1,finyr1);
rs2 = ps2.executeQuery();

while(rs2.next()){
  gen_entry_finalize_exist = rs2.getString(1);
}
rs2.close();
ps2.close();

if(!gen_entry_finalize_exist.equals("0")){
       ps2 = mk.con.prepareStatement(" select distinct to_char(trunc(upd_dt),'dd/mm/yyyy') from BGT_FORM2B_DATA "+
                                     " where stn_cd ='A' and bgt_yr=? ");
       ps2.setString(1,finyr1);
       rs2 = ps2.executeQuery();

while(rs2.next()){
  gen_bgt_fnl_dt = rs2.getString(1);
}
rs2.close();
ps2.close();
  gen_entry_finalize_flg = "1";
  rmks_all             = "GENERATION BUDGET FINALISED ON "+gen_bgt_fnl_dt+".";
}else{
       ps2 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                     " where stn_cd ='A' and bgt_yr=? ");
       ps2.setString(1,finyr1);
       rs2 = ps2.executeQuery();

while(rs2.next()){
  gen_entry_compile_exist = rs2.getString(1);
}
rs2.close();
ps2.close();

if(!gen_entry_compile_exist.equals("0")){
       ps2 = mk.con.prepareStatement(" select to_char(trunc(crt_dt),'dd/mm/yyyy') from BGT_FORM2B_DATA "+
                                     " where stn_cd ='A' and bgt_yr=? ");
       ps2.setString(1,finyr1);
       rs2 = ps2.executeQuery();

while(rs2.next()){
  gen_consolidation_dt = rs2.getString(1);
}
rs2.close();
ps2.close();
  gen_entry_compile_flg = "1";
  rmks_all             = "GENERATION BUDGET CONSOLIDATED ON "+gen_consolidation_dt+".";
}else{
       ps2 = mk.con.prepareStatement(" select count(distinct stn_cd) from BGT_FORM2B_DATA "+
                                     " where stn_cd in ('B','T','S','N','C','E') and sec_cd='ALL' and bgt_yr=? ");
       ps2.setString(1,finyr1);
       rs2 = ps2.executeQuery();
      while(rs2.next()){
          gen_entry_pndg_cmpl_exist = rs2.getString(1);
      }
      rs2.close();
      ps2.close();
         if(Integer.parseInt(gen_entry_pndg_cmpl_exist) == Integer.parseInt("6")){
             gen_entry_pndg_cmpl_flg = "1";
             rmks_all              = "BUDGET CONSOLIDATION PENDING." ;
         }else{
               ps2 = mk.con.prepareStatement(" select cnt+cnt1 from  "+
                                             " (select count(*) cnt from BGT_FORM2B_DATA where bgt_yr=?) a, "+
                                             " (select count(*) cnt1 from BGT_FORM2B_DATA_BBGS where bgt_yr=?) b ");
               ps2.setString(1,finyr1);
               ps2.setString(2,finyr1);
               rs2 = ps2.executeQuery();
               while(rs2.next()){
                        gen_entry_process_exist = rs2.getString(1);
               }
               rs2.close();
               ps2.close();
                  if(!gen_entry_process_exist.equals("0")){
                        gen_entry_process_flg = "1";
                        rmks_all            = "GENERATION BUDGET IN PROCESS." ;
                  }else{
                        gen_entry_started_flg = "1";
                        rmks_all            = "BUDGET ENTRY NOT YET INITIATED." ;
                  }
         }
}
}
if(gen_entry_started_flg.equals("1")){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:white; width: 39px;" /></strong></td>
<%
}else if (gen_entry_process_flg.equals("1")){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:red; width: 39px;" /></strong></td>
<%
}else if (gen_entry_pndg_cmpl_flg.equals("1")){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:yellow; width: 39px;" /></strong></td>
<%
}else if (gen_entry_compile_flg.equals("1")){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:green; width: 39px;" /></strong></td>
<%
}else if (gen_entry_finalize_flg.equals("1")){
%>
                <td style="width: 15%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:green; width: 39px;" /></strong></td>
<%
}else{
}
       ps2 = mk.con.prepareStatement("select count(*) from bgt_level where stn_cd in ('B','S','T','N','C','E') and emp_code=? and CONSOLIDATE_MKR='Y' and CONSOLIDATE_STN_CD='A'");
       ps2.setString(1,empcd);
       rs2 = ps2.executeQuery();
       while(rs2.next()){
            auth_flg1 = rs2.getString(1);
       }
       rs2.close();
       ps2.close();
%>
                <td style="width: 30%" class="style5 " align="left"><strong><%=rmks_all%></strong></td>
                <td style="width: 40%" class="<%= sStyle %>" align="left"><strong><input type="button" value="Consolidate" id="cmpl_all" name="cmpl_all" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="consolidate_data_all();">&nbsp;&nbsp;&nbsp;<input type="button" value="Reject" id="rjct_all" name="rjct_all" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="reject_gen_budget();">&nbsp;&nbsp;<input type="button" value="Finalize" id="finalize_all" name="finalize_all" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="finalize_data_all();">&nbsp;&nbsp;<input type="button" value="View Budget" id="vw_all" name="vw_all" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="view_data_all();">
                </td>
<script>
enable_btn_all(<%=auth_flg1%>,<%=gen_entry_finalize_flg%>,<%=gen_entry_pndg_cmpl_flg%>,<%=gen_entry_compile_flg%>);
</script>
</table>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style3"  colspan="7" align="middle"><strong>BUDGET STATUS</strong></td>
        </tr>

        <tr>
                <td style="width: 30%" class="style3"><strong>STATION (Click to view details.)</strong></td>
                <td style="width: 10%" class="style3"><strong>INDICATOR</strong></td>
                <td style="width: 35%" class="style3"><strong>REMARKS</strong></td>
                <td style="width: 25%" class="style3"><strong>&nbsp;</strong></td>
        </tr>
<%
  int  cnt   = 1;
while(rs.next()){
  rej_flg    = "0";
  cmpl_flg   = "0";
  view_flg   = "0";
%>
<tr>
                <td style="width: 30%" class="style5" align="left"><strong><a href="#" onClick="window.open('gen_spec_budget_dtl.jsp?stn_cd=<%=rs.getString(1)%>&finyr=<%=finyr1%>&finyr1=<%=finyr%>&empcd=<%=empcd%>','_self');"><%=rs.getString(2)%></strong></td>
<%
       ps1 = mk.con.prepareStatement(" select nvl(max(bgt_ver),1) from BGT_POSITION "+
                                     " where stn_cd =? and bgt_yr = ? and SEND_TO_LOWER_LEVEL_DT is null ");
       ps1.setString(1,rs.getString(1));
       ps1.setString(2,finyr1);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  cur_bgt_ver = rs1.getString(1);
  cur_bgt_yr  = finyr1;
}
rs1.close();
ps1.close();

       ps1 = mk.con.prepareStatement(" select count(section_cd) from BGT_CD_SECTION "+
                                     " where station_cd =? ");
       ps1.setString(1,rs.getString(1));
       rs1 = ps1.executeQuery();

while(rs1.next()){
  cnt_stn_sec = rs1.getString(1);
}
rs1.close();
ps1.close();
       

ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                     " where stn_cd ='A' and nvl(bgt_fnl,' ')='F' and bgt_yr=? ");
       ps1.setString(1,finyr1);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  all_finalize_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(!all_finalize_exist.equals("0")){
  all_finalize_flg = "1";
  rmks             = "BUDGET FINALISED. " ;
  view_flg ="1";
}else{
  all_finalize_flg = "0";
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                     " where stn_cd ='A' and bgt_yr=? ");
       ps1.setString(1,finyr1);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  all_cmpl_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
if(!all_cmpl_exist.equals("0")){
  all_cmpl_flg = "1";
  rmks="BUDGET READY";
  view_flg ="1";
}else{
  all_cmpl_flg = "0";
       ps1 = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA "+
                                     " where stn_cd =? and bgt_yr = ? and sec_cd ='ALL' and bgt_ver=? ");
       ps1.setString(1,rs.getString(1));
       ps1.setString(2,cur_bgt_yr);
       ps1.setString(3,cur_bgt_ver);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  stn_cmpl_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

if(stn_cmpl_exist.equals("0")){
    
   stn_cmpl_flg = "0";

if(rs.getString(1).equals("B")){

   ps1 = mk.con.prepareStatement(" select count(*) from "+ 
                                               " (select sec_cd,max(bgt_level) lvl "+
                                               "  from BGT_level "+
                                               "  where stn_cd = ? "+
                                               "  and sec_cd <>'ALL' "+
                                               "  group by sec_cd) a, "+
                                               " (select sec_cd,max(bgt_level) lvl "+
                                               "  from BGT_FORM2B_DATA_BBGS "+
                                               "  where stn_cd = ? "+
                                               "  and sec_cd <>'ALL' "+
                                               "  and bgt_yr = ? "+
                                               "  and bgt_ver = ? "+
                                               "  and publish_mkr='Y' "+
                                               "  group by sec_cd) b "+
                                      "  where a.sec_cd=b.sec_cd "+
                                      "  and a.lvl=b.lvl ");
       ps1.setString(1,rs.getString(1));
       ps1.setString(2,rs.getString(1));
       ps1.setString(3,cur_bgt_yr);
       ps1.setString(4,cur_bgt_ver);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  stn_wait_compile_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

}else{
   ps1 = mk.con.prepareStatement(" select count(*) from "+ 
                                               " (select sec_cd,max(bgt_level) lvl "+
                                               "  from BGT_level "+
                                               "  where stn_cd = ? "+
                                               "  and sec_cd <>'ALL' "+
                                               "  group by sec_cd) a, "+
                                               " (select sec_cd,max(bgt_level) lvl "+
                                               "  from BGT_FORM2B_DATA "+
                                               "  where stn_cd = ? "+
                                               "  and sec_cd <>'ALL' "+
                                               "  and bgt_yr = ? "+
                                               "  and bgt_ver = ? "+
                                               "  and publish_mkr='Y' "+
                                               "  group by sec_cd) b "+
                                      "  where a.sec_cd=b.sec_cd "+
                                      "  and a.lvl=b.lvl ");
       ps1.setString(1,rs.getString(1));
       ps1.setString(2,rs.getString(1));
       ps1.setString(3,cur_bgt_yr);
       ps1.setString(4,cur_bgt_ver);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  stn_wait_compile_exist = rs1.getString(1);
}
rs1.close();
ps1.close();
}
  if (Integer.parseInt(stn_wait_compile_exist) == Integer.parseInt(cnt_stn_sec)){

   ps1 = mk.con.prepareStatement(" select distinct emp_desg from BGT_LEVEL "+ 
                                      "  where stn_cd = ? "+
                                      "  and CONSOLIDATE_MKR = 'Y' AND CONSOLIDATE_STN_CD =? ");
       ps1.setString(1,rs.getString(1));
       ps1.setString(2,rs.getString(1));
       rs1 = ps1.executeQuery();
while(rs1.next()){
  cmpl_auth = rs1.getString(1);
}
rs1.close();
ps1.close();
      rmks="CONSOLIDATION BY THE "+cmpl_auth+" PENDING.";
      rej_flg      = "1";
      cmpl_flg     = "1";
      stn_wait_compile_flg = "1";

  }else{

      stn_wait_compile_flg = "0";
    if(rs.getString(1).equals("B")){

          ps1 = mk.con.prepareStatement(" select count(*) from "+ 
                                               " (select sec_cd "+
                                               "  from BGT_level "+
                                               "  where stn_cd = ? "+
                                               "  and sec_cd <>'ALL' "+
                                               "  group by sec_cd) a, "+
                                               " (select sec_cd "+
                                               "  from BGT_FORM2B_DATA_BBGS "+
                                               "  where stn_cd = ? "+
                                               "  and sec_cd <>'ALL' "+
                                               "  and bgt_yr = ? "+
                                               "  and bgt_ver = ? "+
                                               "  and publish_mkr='Y' "+
                                               "  group by sec_cd) b "+
                                      "  where a.sec_cd=b.sec_cd ");
       ps1.setString(1,rs.getString(1));
       ps1.setString(2,rs.getString(1));
       ps1.setString(3,cur_bgt_yr);
       ps1.setString(4,cur_bgt_ver);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  stn_wait_auth_apprvl_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

       if(Integer.parseInt(stn_wait_auth_apprvl_exist) == Integer.parseInt(cnt_stn_sec)){
          rmks="AUTHORITY INTERVENTION PENDING.";
          stn_wait_auth_apprvl_flg = "1";
       }else{
          stn_wait_auth_apprvl_flg = "0";
          ps1 = mk.con.prepareStatement(" select decode((a.cnt-b.cnt),'0','1','0') from "+
                                     "      (select count(station_cd) cnt "+ 
                                     "       from BGT_CD_SECTION "+
                                     "       where station_cd=? and section_cd <>'ALL') a, "+
                                     "      (select count(distinct stn_cd) cnt "+ 
                                     "       from BGT_FORM2B_DATA_BBGS "+
                                     "       where stn_cd=? "+
                                     "       and sec_cd <>'ALL' "+
                                     "       and bgt_yr=? "+
                                     "       and bgt_ver=? "+
                                     "       and publish_mkr='Y') b ");

          ps1.setString(1,rs.getString(1));
          ps1.setString(2,rs.getString(1));
          ps1.setString(3,cur_bgt_yr);
          ps1.setString(4,cur_bgt_ver);
          rs1 = ps1.executeQuery();

          while(rs1.next()){
             stn_entry_compltd_exist = rs1.getString(1);
          }
          rs1.close();
          ps1.close();
        

          if(Integer.parseInt(stn_entry_compltd_exist) == Integer.parseInt(cnt_stn_sec)){
              rmks="ENTRY COMPLETED.";
              stn_entry_compltd_flg = "1";
          }else{
              stn_entry_compltd_flg = "0";
               ps1 = mk.con.prepareStatement(" select count(*) "+
                                     "       from BGT_FORM2B_DATA_BBGS "+
                                     "       where stn_cd=? "+
                                     "       and bgt_yr=? "+
                                     "       and bgt_ver=? ");

                 ps1.setString(1,rs.getString(1));
                 ps1.setString(2,cur_bgt_yr);
                 ps1.setString(3,cur_bgt_ver);
                 rs1 = ps1.executeQuery();

                while(rs1.next()){
                   stn_entry_strtd_exist = rs1.getString(1);
                }
                rs1.close();
                ps1.close();
                
                if(!stn_entry_strtd_exist.equals("0")){
                      rmks="ENTRY IN PROGRESS.";
                      stn_entry_strtd_flg = "1";
                }else {
                      rmks="ENTRY NOT YET INITIATED.";
                      stn_entry_strtd_flg = "0";
                      stn_entry_pndg_flg  = "1";
                }
       }

  }

 }else{

          ps1 = mk.con.prepareStatement(" select count(*) from "+ 
                                               " (select sec_cd "+
                                               "  from BGT_level "+
                                               "  where stn_cd = ? "+
                                               "  and sec_cd <>'ALL' "+
                                               "  group by sec_cd) a, "+
                                               " (select sec_cd "+
                                               "  from BGT_FORM2B_DATA "+
                                               "  where stn_cd = ? "+
                                               "  and sec_cd <>'ALL' "+
                                               "  and bgt_yr = ? "+
                                               "  and bgt_ver = ? "+
                                               "  and publish_mkr='Y' "+
                                               "  group by sec_cd) b "+
                                      "  where a.sec_cd=b.sec_cd ");
       ps1.setString(1,rs.getString(1));
       ps1.setString(2,rs.getString(1));
       ps1.setString(3,cur_bgt_yr);
       ps1.setString(4,cur_bgt_ver);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  stn_wait_auth_apprvl_exist = rs1.getString(1);
}
rs1.close();
ps1.close();

       if(Integer.parseInt(stn_wait_auth_apprvl_exist) == Integer.parseInt(cnt_stn_sec)){
          rmks="AUTHORITY INTERVENTION PENDING.";
          stn_wait_auth_apprvl_flg = "1";
       }else{
          stn_wait_auth_apprvl_flg = "0";
          ps1 = mk.con.prepareStatement(" select decode((a.cnt-b.cnt),'0','1','0') from "+
                                     "      (select count(station_cd) cnt "+ 
                                     "       from BGT_CD_SECTION "+
                                     "       where station_cd=? and section_cd <>'ALL') a, "+
                                     "      (select count(distinct stn_cd) cnt "+ 
                                     "       from BGT_FORM2B_DATA "+
                                     "       where stn_cd=? "+
                                     "       and sec_cd <>'ALL' "+
                                     "       and bgt_yr=? "+
                                     "       and bgt_ver=? "+
                                     "       and publish_mkr='Y') b ");

          ps1.setString(1,rs.getString(1));
          ps1.setString(2,rs.getString(1));
          ps1.setString(3,cur_bgt_yr);
          ps1.setString(4,cur_bgt_ver);
          rs1 = ps1.executeQuery();

          while(rs1.next()){
             stn_entry_compltd_exist = rs1.getString(1);
          }
          rs1.close();
          ps1.close();
        

          if(Integer.parseInt(stn_entry_compltd_exist) == Integer.parseInt(cnt_stn_sec)){
              rmks="ENTRY COMPLETED.";
              stn_entry_compltd_flg = "1";
          }else{
              stn_entry_compltd_flg = "0";
               ps1 = mk.con.prepareStatement(" select count(*) "+
                                     "       from BGT_FORM2B_DATA "+
                                     "       where stn_cd=? "+
                                     "       and bgt_yr=? "+
                                     "       and bgt_ver=? ");

                 ps1.setString(1,rs.getString(1));
                 ps1.setString(2,cur_bgt_yr);
                 ps1.setString(3,cur_bgt_ver);
                 rs1 = ps1.executeQuery();

                while(rs1.next()){
                   stn_entry_strtd_exist = rs1.getString(1);
                }
                rs1.close();
                ps1.close();
                
                if(!stn_entry_strtd_exist.equals("0")){
                      rmks="ENTRY IN PROGRESS.";
                      stn_entry_strtd_flg = "1";
                }else {
                      rmks="ENTRY NOT YET INITIATED.";
                      stn_entry_strtd_flg = "0";
                      stn_entry_pndg_flg  = "1";
                }
       }

  }
}
}
}else{
               ps1 = mk.con.prepareStatement(" select distinct to_char(trunc(crt_dt),'dd/mm/yyyy') "+
                                     "       from BGT_FORM2B_DATA "+
                                     "       where stn_cd=? "+
                                     "       and   sec_cd='ALL' "+
                                     "       and bgt_yr=? "+
                                     "       and bgt_ver=? ");

                 ps1.setString(1,rs.getString(1));
                 ps1.setString(2,cur_bgt_yr);
                 ps1.setString(3,cur_bgt_ver);
                 rs1 = ps1.executeQuery();

                while(rs1.next()){
                   stn_bgt_compile_dt = rs1.getString(1);
                }
                rs1.close();
                ps1.close();
   rmks ="STATION LEVEL BUDGET COMPLETED.BUDGET CONSOLIDATED ON "+stn_bgt_compile_dt+".";
   stn_cmpl_flg = "1";
   view_flg = "1";
}
}
}

if(stn_cmpl_flg.equals("1") || all_finalize_flg.equals("1")||all_cmpl_flg.equals("1")){
%>
                <td style="width: 10%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:green; width: 39px;" /></strong></td>
<%
}else if(stn_wait_compile_flg.equals("1") || stn_wait_auth_apprvl_flg.equals("1") || stn_entry_compltd_flg.equals("1") ){
%>
                <td style="width: 10%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:yellow; width: 39px;" /></strong></td>
<%
}else if(stn_entry_strtd_flg.equals("1")){
%>
                <td style="width: 10%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:red; width: 39px;" /></strong></td>
<%
}else{
%>
                <td style="width: 10%" class="style5" align="center"><strong><input name="Text1" type="text" style="background:white; width: 39px;" /></strong></td>
<%
}
%>
                <td style="width: 35%" class="style5" align="left"><strong><%=rmks%></strong></td>
<%
       ps1 = mk.con.prepareStatement("select distinct (bgt_level) from ( "+
                                                          " select max(bgt_level) bgt_level,sec_cd,max(emp_code) "+
                                                          " from bgt_level where stn_cd=? "+
                                                          " and sec_cd <>'ALL' group by sec_cd) ");
       ps1.setString(1,rs.getString(1));
       rs1 = ps1.executeQuery();
       while(rs1.next()){
            stn_max_bgt_lvl = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement("select count(*) from bgt_level where stn_cd=? and emp_code=? and CONSOLIDATE_MKR='Y' and CONSOLIDATE_STN_CD=?");
       ps1.setString(1,rs.getString(1));
       ps1.setString(2,empcd);
       ps1.setString(3,rs.getString(1));
       rs1 = ps1.executeQuery();
       while(rs1.next()){
            auth_flg = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement("select count(*) from bgt_level where stn_cd=? and emp_code=?");
       ps1.setString(1,rs.getString(1));
       ps1.setString(2,empcd);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
            auth_flg_view = rs1.getString(1);
       }
       rs1.close();
       ps1.close();

%>
<input type="hidden" id= "stn_cd<%=cnt%>" name = "stn_cd<%=cnt%>" value="<%=rs.getString(1)%>" />
<input type="hidden" id= "station<%=cnt%>" name = "station<%=cnt%>" value="<%=rs.getString(2)%>" />
                <td style="width: 25%" class="<%= sStyle %>" align="left"><strong><input type="button" value="Consolidate" id="B<%=cnt%>" name="B<%=cnt%>" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="consolidate_data(<%=cnt%>);">&nbsp;&nbsp;&nbsp;<input type="button" value="Reject" id="R<%=cnt%>" name="R<%=cnt%>" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="reject_data(<%=cnt%>);">&nbsp;&nbsp;<input type="button" value="View Budget" id="V<%=cnt%>" name="V<%=cnt%>" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" disabled="true" onClick="view_data(<%=cnt%>);">
 </strong></td>
<%
  counter   = cnt+"";
%>
<script>
enable_btn(<%=auth_flg%>,<%=rej_flg%>,<%=cmpl_flg%>,<%=cnt%>,<%=view_flg%>,<%=auth_flg_view%>);
</script>
</tr>
<%
cnt = cnt+1;
}
rs.close();
ps.close();
%>
</table>
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
<input type="hidden" id= "emp_desg" name = "emp_desg" value="<%=your_desg%>" />
<%
}
}catch(Exception e){
  e.printStackTrace();
}finally{
   mk.con.close();
}

%>
</form>
</body>
</html>
