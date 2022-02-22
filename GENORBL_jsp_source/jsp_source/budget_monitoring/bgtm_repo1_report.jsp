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
.style1 {
                                text-align: right;
				border-style: solid;
				border-color: #FFE391;
                                font-size: 9pt;
				background-color: #FFE391;
}
.style14 {
                                text-align: left;
				border-style: solid;
				border-color: #FFE391;
                                font-size: 9pt;
				background-color: #FFE391;
}
.style3 {
                                text-align: right;
				border-style: solid;
				border-color: #FFFFBF;
                                font-size: 9pt;
				background-color: #FFFFBF;
}

.style13 {
                                text-align: left;
				border-style: solid;
				border-color: #FFFFBF;
                                font-size: 9pt;
				background-color: #FFFFBF;
}
.style4 {
                                text-align: right;
				border-style: solid;
				border-color:  #D9F2F0;
                                font-size: 9pt;
				background-color:#D9F2F0;
}
.style5 {
                                text-align: right;
				border-style: solid;
				border-color: #75D0C7;
                                font-size: 9pt;
				background-color: #75D0C7;
}
.style6 {
                                text-align: right;
				border-style: solid;
				border-color: #D9D9FF;
                                font-size: 9pt;
				background-color: #D9D9FF;
}
.style7 {
                                text-align: right;
				border-style: solid;
				border-color: #B9B9FF;
                                font-size: 9pt;
				background-color: #B9B9FF;
}

.style8 {
                                text-align: center;
                                color: #ffffff;
                                font-family: Arial;
                                font-size: 10pt;
                                background-color:#008080;
}
.style9 {
				background-color: #86AEAE;
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
  var pat="0123456789.-";
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

function ReplaceAll(Source,stringToFind,stringToReplace){

  var temp = Source;

    var index = temp.indexOf(stringToFind);

        while(index != -1){

            temp = temp.replace(stringToFind,stringToReplace);

            index = temp.indexOf(stringToFind);

        }

        return temp;

}


function submitdata(){
  var parameter='';
   parameter = parameter + 'finyr='+document.f1.finyr.value;
   parameter = parameter + '&month='+document.f1.month.value;
   parameter = parameter + '&compare='+document.f1.compare.value;
   parameter = parameter + '&mon_basis='+document.f1.mon_basis.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("bgtm_repo1_report.jsp?"+parameter,"_self");
}

</script>
</head>

<body background="">

<%

  PreparedStatement ps              = null;
  ResultSet rs                      = null;
  PreparedStatement ps1             = null;
  ResultSet rs1                     = null;
  PreparedStatement ps2             = null;
  ResultSet rs2                     = null;
  MakeConnectionGENORBL mk          = null;
  String finyr                      = new String("");
  String finyr1                     = new String("");
  String month                      = new String("");
  String compare                    = new String("");
  String mon_basis                  = new String("");
  String empcd                      = new String("");
  String sysdate                    = new String("");
  String your_desg                  = new String("");
  String updated_upto               = new String("");

  String annual_budget_m            = new String("");
  String annual_budget_c            = new String("");
  String tot_annual_budget          = new String("");

  String mnthly_bud_mon_spec_m      = new String("");
  String mnthly_bud_mon_spec_c      = new String("");
  String tot_mnthly_bud_mon_spec    = new String("");

  String mnthly_act_mon_spec_m      = new String("");
  String mnthly_act_mon_spec_c      = new String("");
  String tot_mnthly_act_mon_spec    = new String("");

  String mnthly_spec_dev_m          = new String("");
  String mnthly_spec_dev_c          = new String("");
  String tot_mnthly_spec_dev        = new String("");

  String mnthly_spec_dev_per_m      = new String("");
  String mnthly_spec_dev_per_c      = new String("");
  String tot_mnthly_spec_dev_per    = new String("");
  
  String mnthly_spec_dev_per_m_ind   = new String("");
  String mnthly_spec_dev_per_c_ind   = new String("");
  String tot_mnthly_spec_dev_per_ind = new String("");

  String yrly_bud_mon_spec_m        = new String("");
  String yrly_bud_mon_spec_c        = new String("");
  String tot_yrly_bud_mon_spec      = new String("");

  String yrly_act_mon_spec_m        = new String("");
  String yrly_act_mon_spec_c        = new String("");
  String tot_yrly_act_mon_spec      = new String("");

  String yrly_spec_dev_m            = new String("");
  String yrly_spec_dev_c            = new String("");
  String tot_yrly_spec_dev          = new String("");

  String yrly_spec_dev_per_m        = new String("");
  String yrly_spec_dev_per_c        = new String("");
  String tot_yrly_spec_dev_per      = new String("");

  String yrly_spec_dev_per_m_ind    = new String("");
  String yrly_spec_dev_per_c_ind    = new String("");
  String tot_yrly_spec_dev_per_ind  = new String("");
  

  String div_annual_budget_m            = new String("");
  String div_annual_budget_c            = new String("");
  String div_tot_annual_budget          = new String("");

  String div_mnthly_bud_mon_spec_m      = new String("");
  String div_mnthly_bud_mon_spec_c      = new String("");
  String div_tot_mnthly_bud_mon_spec    = new String("");

  String div_mnthly_act_mon_spec_m      = new String("");
  String div_mnthly_act_mon_spec_c      = new String("");
  String div_tot_mnthly_act_mon_spec    = new String("");

  String div_mnthly_spec_dev_m          = new String("");
  String div_mnthly_spec_dev_c          = new String("");
  String div_tot_mnthly_spec_dev        = new String("");

  String div_mnthly_spec_dev_per_m      = new String("");
  String div_mnthly_spec_dev_per_c      = new String("");
  String div_tot_mnthly_spec_dev_per    = new String("");
  
  String div_mnthly_spec_dev_per_m_ind   = new String("");
  String div_mnthly_spec_dev_per_c_ind   = new String("");
  String div_tot_mnthly_spec_dev_per_ind = new String("");

  String div_yrly_bud_mon_spec_m      = new String("");
  String div_yrly_bud_mon_spec_c      = new String("");
  String div_tot_yrly_bud_mon_spec    = new String("");

  String div_yrly_act_mon_spec_m      = new String("");
  String div_yrly_act_mon_spec_c      = new String("");
  String div_tot_yrly_act_mon_spec    = new String("");

  String div_yrly_spec_dev_m            = new String("");
  String div_yrly_spec_dev_c            = new String("");
  String div_tot_yrly_spec_dev          = new String("");

  String div_yrly_spec_dev_per_m        = new String("");
  String div_yrly_spec_dev_per_c        = new String("");
  String div_tot_yrly_spec_dev_per      = new String("");

  String div_yrly_spec_dev_per_m_ind    = new String("");
  String div_yrly_spec_dev_per_c_ind    = new String("");
  String div_tot_yrly_spec_dev_per_ind  = new String("");
  
  String monthly_comm_ind_m  = new String("");
  String monthly_comm_ind_c  = new String("");
  String yrly_comm_ind_m     = new String("");
  String yrly_comm_ind_c     = new String("");

  String sStyle                         = new String("");
  int cnt=1;
  int counter=0;

  String val_m_q1                       = new String("");
  String val_m_q2                       = new String("");
  String val_m_q3                       = new String("");
  String val_m_q4                       = new String("");
  String val_m_tot                      = new String("");
  String val_c_q1                       = new String("");
  String val_c_q2                       = new String("");
  String val_c_q3                       = new String("");
  String val_c_q4                       = new String("");
  String val_c_tot                      = new String("");
  String val_tot_q1                     = new String("");
  String val_tot_q2                     = new String("");
  String val_tot_q3                     = new String("");
  String val_tot_q4                     = new String("");
  String val_tot_tot                    = new String("");
  String div_val_m_q1                   = new String("");
  String div_val_m_q2                   = new String("");
  String div_val_m_q3                   = new String("");
  String div_val_m_q4                   = new String("");
  String div_val_m_tot                  = new String("");
  String div_val_c_q1                   = new String("");
  String div_val_c_q2                   = new String("");
  String div_val_c_q3                   = new String("");
  String div_val_c_q4                   = new String("");
  String div_val_c_tot                  = new String("");
  String div_val_tot_q1                 = new String("");
  String div_val_tot_q2                 = new String("");
  String div_val_tot_q3                 = new String("");
  String div_val_tot_q4                 = new String("");
  String div_val_tot_tot                = new String("");
  String finyr2                         = new String("");
  String month_act                      = new String("");


try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);
     empcd     = request.getParameter("empcd");
     month     = request.getParameter("month");
     finyr     = request.getParameter("finyr");
     finyr1    = finyr.substring(0,4);
     compare   = request.getParameter("compare");
     mon_basis = request.getParameter("mon_basis");

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
       
       ps = mk.con.prepareStatement("select distinct bgt_yr||'-'||to_char(add_months(to_date(bgt_yr,'YYYY'),12),'YYYY'),bgt_yr from bgt_form2b_data where bgt_yr <>? order by bgt_yr desc ");
       ps.setString(1,finyr1);
       rs = ps.executeQuery();

if(month.equals("Apr")){
   finyr2= finyr1;
   month_act="4";
}else if (month.equals("May")){
   finyr2= finyr1;
   month_act="5";
}else if (month.equals("Jun")){
   finyr2= finyr1;
   month_act="6";
}else if (month.equals("Jul")){
   finyr2= finyr1;
   month_act="7";
}else if (month.equals("Aug")){
   finyr2= finyr1;
   month_act="8";
}else if (month.equals("Sep")){
   finyr2= finyr1;
   month_act="9";
}else if (month.equals("Oct")){
   finyr2= finyr1;
   month_act="10";
}else if (month.equals("Nov")){
   finyr2= finyr1;
   month_act="11";
}else if (month.equals("Dec")){
   finyr2= finyr1;
   month_act="12";
}else if (month.equals("Jan")){
   finyr2    = finyr.substring(5,9);
   month_act="1";
}else if (month.equals("Feb")){
   finyr2    = finyr.substring(5,9);
   month_act="2";
}else{
   finyr2    = finyr.substring(5,9);
   month_act="3";
}
       
%>
<form method="post" name="f1" action="bgtm_repo1_report.jsp">
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:250px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">Station wise MTD and YTD Expenditures Compared To Budget Target And Floor Values</font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>

<label style="left:900px; top:30px; position: absolute" >
<a href="submenu_budget_mon_reports.jsp" target="_top" style="position: absolute; left: 15; top: 25"> <H1><font color="#0000CC">Back </H1></a></font></b>
</label>
<br>
<br>
<br>
<table id="mytable" style="width: 100%" border="0" class="style9" >
        <tr height="10">
           <td style="width: 25%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Financial Year :&nbsp;&nbsp;&nbsp;
           <select size="1" name="finyr" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
              <option selected value=<%=finyr%>><%=finyr%></option>
             <% 
                while(rs.next()){
             %>
              <option value=<%=rs.getString(1)%>><%=rs.getString(1)%></option>
             <%
                }
                rs.close();
                ps.close();
             %>
           </select>
           </strong></td>
           <td style="width: 25%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Month :&nbsp;&nbsp;&nbsp; 
           <select size="1" name="month" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onChange=""/>
              <option selected value=<%=month%>><%=month%></option>
              <option value="Jan">Jan</option>
              <option value="Feb">Feb</option>
              <option value="Mar">Mar</option>
              <option value="Apr">Apr</option>
              <option value="May">May</option>
              <option value="Jun">Jun</option>
              <option value="Jul">Jul</option>
              <option value="Aug">Aug</option>
              <option value="Sep">Sep</option>
              <option value="Oct">Oct</option>
              <option value="Nov">Nov</option>
              <option value="Dec">Dec</option>
           </select>
           </strong></td>
           <td style="width: 35%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Compare with :&nbsp;&nbsp;&nbsp; 
           <select size="1" name="compare" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
<%
if(compare.equals("F")){
%>
              <option selected value=<%=compare%>>Budgeted Floor Value</option>
<%
}else{
%>
              <option selected value=<%=compare%>>Budgeted Target Value</option>
<%
}
%>
              <option value="F">Budgeted Floor Value</option>
              <option value="T">Budgeted Target Value</option>
           </select>
           </strong></td>
           <td style="width: 15%" align="Center"><strong><font face="Book Antiqua" color="blue" size="3">&nbsp; </strong></td>
        </tr>
        <tr height="10">
           <td style="width: 25%" align="left" colspan="2"><strong><font face="Book Antiqua" color="#800000" size="3">Monitoring On The Basis Of :&nbsp;&nbsp;&nbsp;
           <select size="1" name="mon_basis" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
<%
if(mon_basis.equals("2")){
%>
              <option selected value=<%=mon_basis%>>Bill Received Date By Finance Dept.</option>
<%
}else{
%>
              <option selected value=<%=mon_basis%>>Bill Release Date By Stn/Dept.</option>
<%
}
%>
              <option value="1">Bill Release Date By Stn/Dept.</option>
              <option value="2">Bill Received Date By Finance Dept.</option>
           </select>
           </strong></td>
           <td style="width: 25%" align="left" colspan="2"><strong>
            <input type="button" value="Submit" id="submit" name="submit" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="submitdata();">
           </td>
        </tr>
</table>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style8"  colspan="12" align="middle"><strong>Click on Station to drill down further. (All amount in Rs Lakhs)</strong></td>
        </tr>
        <tr>
                <td colspan="4" class="style8"><strong>&nbsp; </strong></td>
                <td style="width: 35%" colspan="4" class="style8"><strong>MTD actual expenditure</strong></td>
                <td style="width: 35%" colspan="4" class="style8"><strong>YTD actual expenditure</strong></td>
        </tr>
        <tr>
                <td style="width: 7%" class="style8"><strong>Stn/Dept </strong></td>
                <td style="width: 6%" class="style8"><strong>Area</strong></td>
                <td style="width: 7%" class="style8"><strong>Updated upto</strong></td>
                <td style="width: 7%" class="style8"><strong>Annual Budget</strong></td>
                <td style="width: 8%" class="style8"><strong>Monthly Budget For <%=month%> <%=finyr2%></strong></td>
                <td style="width: 8%" class="style8"><strong>MTD Actual</strong></td>
                <td style="width: 8%" class="style8"><strong>Dev(Lakhs)</strong></td>
                <td style="width: 7%" class="style8"><strong>Dev(%)</strong></td>
                <td style="width: 10%" class="style8"><strong>YTD Budget till <%=month%> <%=finyr2%></strong></td>
                <td style="width: 10%" class="style8"><strong>YTD Actual</strong></td>
                <td style="width: 8%" class="style8"><strong>Dev(Lakhs)</strong></td>
                <td style="width: 7%" class="style8"><strong>Dev(%)</strong></td>
        </tr>
<%
       ps = mk.con.prepareStatement(" select distinct STATION_SHT_DESC,BGT_STATION_CD from cd_station  "+
                                    " order by decode(BGT_STATION_CD,'B','1','T','2','S','3','N','4','C','5','E','6') ");
       rs = ps.executeQuery();

while(rs.next()){
       ps1 = mk.con.prepareStatement(" select distinct to_char(max(crt_dt),'dd/mm/yyyy') from bgtm_repo_struc ");
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           updated_upto = rs1.getString(1);
       }
       rs1.close();
       ps1.close();

       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    contr_matr_mkr='M' "+
                                     " and    bgt_mkr='B' "+
                                     " and    stn_extn is null "+
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           annual_budget_m = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    contr_matr_mkr='C' "+
                                     " and    bgt_mkr='B' "+
                                     " and    stn_extn is null "+
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           annual_budget_c = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    bgt_mkr='B' "+
                                     " and    stn_extn is null "+
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           tot_annual_budget = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
      ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    contr_matr_mkr='M' "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    mm_val = to_char(to_date(?,'mon'),'MM') "+
                                     " and    yy_val =substr(?,3,2) "+
                                     " and    stn_extn is null "+
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,month);
       ps1.setString(4,finyr2);
       ps1.setString(5,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           mnthly_bud_mon_spec_m = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    contr_matr_mkr='C' "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    mm_val = to_char(to_date(?,'mon'),'MM') "+
                                     " and    yy_val =substr(?,3,2) "+
                                     " and    stn_extn is null "+
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,month);
       ps1.setString(4,finyr2);
       ps1.setString(5,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           mnthly_bud_mon_spec_c = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    mm_val = to_char(to_date(?,'mon'),'MM') "+
                                     " and    yy_val =substr(?,3,2) "+
                                     " and    stn_extn is null "+
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,month);
       ps1.setString(4,finyr2);
       ps1.setString(5,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           tot_mnthly_bud_mon_spec = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    contr_matr_mkr='M' "+
                                     " and    bgt_mkr='A' "+
                                     " and    bill_rel_recv=? "+
                                     " and    mm_val=to_char(to_date(?,'mon'),'MM') "+
                                     " and    stn_extn is null "+
                                     " and    yy_val=substr(?,3,2) ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,mon_basis);
       ps1.setString(4,month);
       ps1.setString(5,finyr2);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           mnthly_act_mon_spec_m = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    contr_matr_mkr='C' "+
                                     " and    bgt_mkr='A' "+
                                     " and    bill_rel_recv=? "+
                                     " and    mm_val=to_char(to_date(?,'mon'),'MM') "+
                                     " and    stn_extn is null "+
                                     " and    yy_val=substr(?,3,2) ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,mon_basis);
       ps1.setString(4,month);
       ps1.setString(5,finyr2);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           mnthly_act_mon_spec_c = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    bgt_mkr='A' "+
                                     " and    bill_rel_recv=? "+
                                     " and    mm_val=to_char(to_date(?,'mon'),'MM') "+
                                     " and    stn_extn is null "+
                                     " and    yy_val=substr(?,3,2) ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,mon_basis);
       ps1.setString(4,month);
       ps1.setString(5,finyr2);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           tot_mnthly_act_mon_spec = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select count(*) from BGTM_USER_COMNTS "+
                                     " where  fin_yr=? "+
                                     " and    stn_cd=? "+
                                     " and    mm_val=to_char(to_date(?,'mon'),'MM') "+
                                     " and    exp_typ='M' ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,month);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           monthly_comm_ind_m = rs1.getString(1);
       }
       rs1.close();
       ps1.close();

       
       ps1 = mk.con.prepareStatement(" select count(*) from BGTM_USER_COMNTS "+
                                     " where  fin_yr=? "+
                                     " and    stn_cd=? "+
                                     " and    mm_val=to_char(to_date(?,'mon'),'MM') "+
                                     " and    exp_typ='C' ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,month);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           monthly_comm_ind_c = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
      ps1 = mk.con.prepareStatement(" select count(*) from BGTM_USER_COMNTS "+
                                     " where  fin_yr=? "+
                                     " and    stn_cd=? "+
                                     " and    exp_typ='M' ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           yrly_comm_ind_m = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select count(*) from BGTM_USER_COMNTS "+
                                     " where  fin_yr=? "+
                                     " and    stn_cd=? "+
                                     " and    exp_typ='C' ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           yrly_comm_ind_c = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps1.setString(1,mnthly_act_mon_spec_m);
       ps1.setString(2,mnthly_bud_mon_spec_m);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           mnthly_spec_dev_m = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps1.setString(1,mnthly_act_mon_spec_c);
       ps1.setString(2,mnthly_bud_mon_spec_c);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           mnthly_spec_dev_c = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps1.setString(1,tot_mnthly_act_mon_spec);
       ps1.setString(2,tot_mnthly_bud_mon_spec);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           tot_mnthly_spec_dev = rs1.getString(1);
       }
       rs1.close();
       ps1.close();


if(Double.parseDouble(mnthly_bud_mon_spec_m) == 0.0){
           mnthly_spec_dev_per_m = "N/A";
           mnthly_spec_dev_per_m_ind = "B";
}else{
       
       ps1 = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+ 
                                     " from dual ");
       ps1.setString(1,mnthly_spec_dev_m);
       ps1.setString(2,mnthly_bud_mon_spec_m);
       ps1.setString(3,mnthly_spec_dev_m);
       ps1.setString(4,mnthly_bud_mon_spec_m);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           mnthly_spec_dev_per_m = rs1.getString(1);
           mnthly_spec_dev_per_m_ind = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
}

if(Double.parseDouble(mnthly_bud_mon_spec_c) == 0.0){
           mnthly_spec_dev_per_c = "N/A";
           mnthly_spec_dev_per_c_ind = "B";
}else{
       
       ps1 = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+                 
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+ 
                                     " from dual ");
       ps1.setString(1,mnthly_spec_dev_c);
       ps1.setString(2,mnthly_bud_mon_spec_c);
       ps1.setString(3,mnthly_spec_dev_c);
       ps1.setString(4,mnthly_bud_mon_spec_c);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           mnthly_spec_dev_per_c = rs1.getString(1);
           mnthly_spec_dev_per_c_ind = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
}       

if(Double.parseDouble(tot_mnthly_bud_mon_spec) == 0.0){
           tot_mnthly_spec_dev_per = "N/A";
           tot_mnthly_spec_dev_per_ind = "B";
}else{
       ps1 = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+ 
                                     " from dual ");
       ps1.setString(1,tot_mnthly_spec_dev);
       ps1.setString(2,tot_mnthly_bud_mon_spec);
       ps1.setString(3,tot_mnthly_spec_dev);
       ps1.setString(4,tot_mnthly_bud_mon_spec);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           tot_mnthly_spec_dev_per = rs1.getString(1);
           tot_mnthly_spec_dev_per_ind = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
}

      ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    contr_matr_mkr='M' "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    stn_extn is null "+
                                     " and    to_date(mm_val||yy_val,'mmyy') between to_date('04'||substr(?,3,2),'mmyy') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(to_char(to_date(?,'Mon'),'MM'),'04',substr(?,3,2),'05',substr(?,3,2),'06',substr(?,3,2),'07',substr(?,3,2),'08',substr(?,3,2),'09',substr(?,3,2),'10',substr(?,3,2),'11',substr(?,3,2),'12',substr(?,3,2),'01',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'02',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'03',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'mmyy') "+ 
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,finyr1);
       ps1.setString(4,month);
       ps1.setString(5,month);
       ps1.setString(6,finyr1);
       ps1.setString(7,finyr1);
       ps1.setString(8,finyr1);
       ps1.setString(9,finyr1);
       ps1.setString(10,finyr1);
       ps1.setString(11,finyr1);
       ps1.setString(12,finyr1);
       ps1.setString(13,finyr1);
       ps1.setString(14,finyr1);
       ps1.setString(15,finyr1);
       ps1.setString(16,finyr1);
       ps1.setString(17,finyr1);
       ps1.setString(18,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           yrly_bud_mon_spec_m = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    contr_matr_mkr='C' "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    stn_extn is null "+
                                     " and    to_date(mm_val||yy_val,'mmyy') between to_date('04'||substr(?,3,2),'mmyy') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(to_char(to_date(?,'Mon'),'MM'),'04',substr(?,3,2),'05',substr(?,3,2),'06',substr(?,3,2),'07',substr(?,3,2),'08',substr(?,3,2),'09',substr(?,3,2),'10',substr(?,3,2),'11',substr(?,3,2),'12',substr(?,3,2),'01',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'02',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'03',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'mmyy') "+ 
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,finyr1);
       ps1.setString(4,month);
       ps1.setString(5,month);
       ps1.setString(6,finyr1);
       ps1.setString(7,finyr1);
       ps1.setString(8,finyr1);
       ps1.setString(9,finyr1);
       ps1.setString(10,finyr1);
       ps1.setString(11,finyr1);
       ps1.setString(12,finyr1);
       ps1.setString(13,finyr1);
       ps1.setString(14,finyr1);
       ps1.setString(15,finyr1);
       ps1.setString(16,finyr1);
       ps1.setString(17,finyr1);
       ps1.setString(18,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           yrly_bud_mon_spec_c = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    stn_extn is null "+
                                     " and    to_date(mm_val||yy_val,'mmyy') between to_date('04'||substr(?,3,2),'mmyy') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(to_char(to_date(?,'Mon'),'MM'),'04',substr(?,3,2),'05',substr(?,3,2),'06',substr(?,3,2),'07',substr(?,3,2),'08',substr(?,3,2),'09',substr(?,3,2),'10',substr(?,3,2),'11',substr(?,3,2),'12',substr(?,3,2),'01',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'02',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'03',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'mmyy') "+ 
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,finyr1);
       ps1.setString(4,month);
       ps1.setString(5,month);
       ps1.setString(6,finyr1);
       ps1.setString(7,finyr1);
       ps1.setString(8,finyr1);
       ps1.setString(9,finyr1);
       ps1.setString(10,finyr1);
       ps1.setString(11,finyr1);
       ps1.setString(12,finyr1);
       ps1.setString(13,finyr1);
       ps1.setString(14,finyr1);
       ps1.setString(15,finyr1);
       ps1.setString(16,finyr1);
       ps1.setString(17,finyr1);
       ps1.setString(18,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           tot_yrly_bud_mon_spec = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    contr_matr_mkr='M' "+
                                     " and    bgt_mkr='A' "+
                                     " and    stn_extn is null "+
                                     " and    bill_rel_recv=? "+
                                     " and    to_date(mm_val||yy_val,'mmyy') between to_date('04'||substr(?,3,2),'mmyy') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(to_char(to_date(?,'Mon'),'MM'),'04',substr(?,3,2),'05',substr(?,3,2),'06',substr(?,3,2),'07',substr(?,3,2),'08',substr(?,3,2),'09',substr(?,3,2),'10',substr(?,3,2),'11',substr(?,3,2),'12',substr(?,3,2),'01',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'02',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'03',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'mmyy') "); 
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,mon_basis);
       ps1.setString(4,finyr1);
       ps1.setString(5,month);
       ps1.setString(6,month);
       ps1.setString(7,finyr1);
       ps1.setString(8,finyr1);
       ps1.setString(9,finyr1);
       ps1.setString(10,finyr1);
       ps1.setString(11,finyr1);
       ps1.setString(12,finyr1);
       ps1.setString(13,finyr1);
       ps1.setString(14,finyr1);
       ps1.setString(15,finyr1);
       ps1.setString(16,finyr1);
       ps1.setString(17,finyr1);
       ps1.setString(18,finyr1);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           yrly_act_mon_spec_m = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    contr_matr_mkr='C' "+
                                     " and    bgt_mkr='A' "+
                                     " and    stn_extn is null "+
                                     " and    bill_rel_recv=? "+
                                     " and    to_date(mm_val||yy_val,'mmyy') between to_date('04'||substr(?,3,2),'mmyy') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(to_char(to_date(?,'Mon'),'MM'),'04',substr(?,3,2),'05',substr(?,3,2),'06',substr(?,3,2),'07',substr(?,3,2),'08',substr(?,3,2),'09',substr(?,3,2),'10',substr(?,3,2),'11',substr(?,3,2),'12',substr(?,3,2),'01',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'02',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'03',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'mmyy') "); 
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,mon_basis);
       ps1.setString(4,finyr1);
       ps1.setString(5,month);
       ps1.setString(6,month);
       ps1.setString(7,finyr1);
       ps1.setString(8,finyr1);
       ps1.setString(9,finyr1);
       ps1.setString(10,finyr1);
       ps1.setString(11,finyr1);
       ps1.setString(12,finyr1);
       ps1.setString(13,finyr1);
       ps1.setString(14,finyr1);
       ps1.setString(15,finyr1);
       ps1.setString(16,finyr1);
       ps1.setString(17,finyr1);
       ps1.setString(18,finyr1);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           yrly_act_mon_spec_c = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=? "+
                                     " and    bgt_mkr='A' "+
                                     " and    bill_rel_recv=? "+
                                     " and    stn_extn is null "+
                                     " and    to_date(mm_val||yy_val,'mmyy') between to_date('04'||substr(?,3,2),'mmyy') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(to_char(to_date(?,'Mon'),'MM'),'04',substr(?,3,2),'05',substr(?,3,2),'06',substr(?,3,2),'07',substr(?,3,2),'08',substr(?,3,2),'09',substr(?,3,2),'10',substr(?,3,2),'11',substr(?,3,2),'12',substr(?,3,2),'01',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'02',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'03',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'mmyy') "); 
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       ps1.setString(3,mon_basis);
       ps1.setString(4,finyr1);
       ps1.setString(5,month);
       ps1.setString(6,month);
       ps1.setString(7,finyr1);
       ps1.setString(8,finyr1);
       ps1.setString(9,finyr1);
       ps1.setString(10,finyr1);
       ps1.setString(11,finyr1);
       ps1.setString(12,finyr1);
       ps1.setString(13,finyr1);
       ps1.setString(14,finyr1);
       ps1.setString(15,finyr1);
       ps1.setString(16,finyr1);
       ps1.setString(17,finyr1);
       ps1.setString(18,finyr1);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           tot_yrly_act_mon_spec = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps1.setString(1,yrly_act_mon_spec_m);
       ps1.setString(2,yrly_bud_mon_spec_m);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           yrly_spec_dev_m = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps1.setString(1,yrly_act_mon_spec_c);
       ps1.setString(2,yrly_bud_mon_spec_c);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           yrly_spec_dev_c = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps1.setString(1,tot_yrly_act_mon_spec);
       ps1.setString(2,tot_yrly_bud_mon_spec);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           tot_yrly_spec_dev = rs1.getString(1);
       }
       rs1.close();
       ps1.close();

if(Double.parseDouble(yrly_bud_mon_spec_m) == 0.0){
           yrly_spec_dev_per_m = "N/A";
           yrly_spec_dev_per_m_ind = "B";
}else{       
       ps1 = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+ 
                                     " from dual ");
       ps1.setString(1,yrly_spec_dev_m);
       ps1.setString(2,yrly_bud_mon_spec_m);
       ps1.setString(3,yrly_spec_dev_m);
       ps1.setString(4,yrly_bud_mon_spec_m);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           yrly_spec_dev_per_m = rs1.getString(1);
           yrly_spec_dev_per_m_ind = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
}
       
if(Double.parseDouble(yrly_bud_mon_spec_c) == 0.0){
           yrly_spec_dev_per_c = "N/A";
           yrly_spec_dev_per_c_ind = "B";
}else{       
       ps1 = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+                 
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+ 
                                     " from dual ");
       ps1.setString(1,yrly_spec_dev_c);
       ps1.setString(2,yrly_bud_mon_spec_c);
       ps1.setString(3,yrly_spec_dev_c);
       ps1.setString(4,yrly_bud_mon_spec_c);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           yrly_spec_dev_per_c = rs1.getString(1);
           yrly_spec_dev_per_c_ind = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
}       

if(Double.parseDouble(tot_yrly_bud_mon_spec) == 0.0){
           tot_yrly_spec_dev_per = "N/A";
           tot_yrly_spec_dev_per_ind = "B";
}else{       
       ps1 = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+ 
                                     " from dual ");
       ps1.setString(1,tot_yrly_spec_dev);
       ps1.setString(2,tot_yrly_bud_mon_spec);
       ps1.setString(3,tot_yrly_spec_dev);
       ps1.setString(4,tot_yrly_bud_mon_spec);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           tot_yrly_spec_dev_per = rs1.getString(1);
           tot_yrly_spec_dev_per_ind = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
}
%>
				<tr>
								<td class="style14" rowspan="3" style="width: 7%"><a href="#" onClick="window.open('budgRept1.jsp?sFinYr=<%=finyr1%>&sMon=<%=month_act%>&sMontr=<%=mon_basis%>&sStn=<%=rs.getString(1)%>&finyr=<%=finyr%>&month=<%=month%>&empcd=<%=empcd%>&compare=<%=compare%>','_self');"><%=rs.getString(1)%></td>
								<td class="style13" style="width: 6%"> Materials&nbsp;&nbsp;&nbsp;</td>
								<td class="style3" style="width: 7%"><%=updated_upto%></td>
								<td class="style3" style="width: 7%"><%=annual_budget_m%></td>
								<td class="style4" style="width: 8%"><%=mnthly_bud_mon_spec_m%></td>
								<td class="style4" style="width: 8%"><%=mnthly_act_mon_spec_m%></td>
<%
  if(!monthly_comm_ind_m.equals("0")){
%>
								<td class="style4" style="width: 8%"><a href="#" onClick="window.open('view_comments.jsp?finyr=<%=finyr%>&finyr1=<%=finyr1%>&month=<%=month%>&station=<%=rs.getString(1)%>&exp_tp=M&empcd=<%=empcd%>&view_mkr=M','_new');"><%=mnthly_spec_dev_m%></td>
<%
}else{
%>
								<td class="style4" style="width: 8%"><%=mnthly_spec_dev_m%></td>
<%
}
  if(mnthly_spec_dev_per_m_ind.equals("G")){
%>
								<td class="style4" style="width: 7%"><font face="Book Antiqua" color="green" ><%=mnthly_spec_dev_per_m%></td>
<%
}else if(mnthly_spec_dev_per_m_ind.equals("R")){
%>
								<td class="style4" style="width: 7%"><font face="Book Antiqua" color="red" ><%=mnthly_spec_dev_per_m%></td>
<%
}else{
%>
								<td class="style4" style="width: 7%"><%=mnthly_spec_dev_per_m%></td>
<%
}
%>
								<td class="style6" style="width: 10%"><%=yrly_bud_mon_spec_m%></td>
								<td class="style6" style="width: 10%"><%=yrly_act_mon_spec_m%></td>
<%
  if(!yrly_comm_ind_m.equals("0")){
%>
								<td class="style4" style="width: 8%"><a href="#" onClick="window.open('view_comments.jsp?finyr=<%=finyr%>&finyr1=<%=finyr1%>&month=<%=month%>&station=<%=rs.getString(1)%>&exp_tp=M&empcd=<%=empcd%>&view_mkr=Y','_new');"><%=yrly_spec_dev_m%></td>
<%
}else{
%>
								<td class="style6" style="width: 8%"><%=yrly_spec_dev_m%></td>
<%
}
  if(yrly_spec_dev_per_m_ind.equals("G")){
%>
								<td class="style6" style="width: 7%"><font face="Book Antiqua" color="green" ><%=yrly_spec_dev_per_m%></td>
<%
}else if(yrly_spec_dev_per_m_ind.equals("R")){
%>
								<td class="style6" style="width: 7%"><font face="Book Antiqua" color="red" ><%=yrly_spec_dev_per_m%></td>
<%
}else{
%>
								<td class="style6" style="width: 7%"><%=yrly_spec_dev_per_m%></td>
<%
}
%>
				</tr>
				<tr>
								<td class="style13" style="width: 8%"> Contracts&nbsp;&nbsp;</td>
								<td class="style3" style="width: 7%"><%=updated_upto%></td>
								<td class="style3" style="width: 7%"><%=annual_budget_c%></td>
								<td class="style4" style="width: 8%"><%=mnthly_bud_mon_spec_c%></td>
								<td class="style4" style="width: 8%"><%=mnthly_act_mon_spec_c%></td>
<%
  if(!monthly_comm_ind_c.equals("0")){
%>
								<td class="style4" style="width: 8%"><a href="#" onClick="window.open('view_comments.jsp?finyr=<%=finyr%>&finyr1=<%=finyr1%>&month=<%=month%>&station=<%=rs.getString(1)%>&exp_tp=C&empcd=<%=empcd%>&view_mkr=M','_new');"><%=mnthly_spec_dev_c%></td>
<%
}else{
%>
								<td class="style4" style="width: 8%"><%=mnthly_spec_dev_c%></td>
<%
}
  if(mnthly_spec_dev_per_c_ind.equals("G")){
%>
								<td class="style4" style="width: 7%"><font face="Book Antiqua" color="green" ><%=mnthly_spec_dev_per_c%></td>
<%
}else{
%>
								<td class="style4" style="width: 7%"><font face="Book Antiqua" color="red" ><%=mnthly_spec_dev_per_c%></td>
<%
}
%>
								<td class="style6" style="width: 10%"><%=yrly_bud_mon_spec_c%></td>
								<td class="style6" style="width: 10%"><%=yrly_act_mon_spec_c%></td>
<%
  if(!yrly_comm_ind_c.equals("0")){
%>
								<td class="style4" style="width: 8%"><a href="#" onClick="window.open('view_comments.jsp?finyr=<%=finyr%>&finyr1=<%=finyr1%>&month=<%=month%>&station=<%=rs.getString(1)%>&exp_tp=C&empcd=<%=empcd%>&view_mkr=Y','_new');"><%=yrly_spec_dev_c%></td>
<%
}else{
%>
								<td class="style6" style="width: 8%"><%=yrly_spec_dev_c%></td>
<%
}
  if(yrly_spec_dev_per_c_ind.equals("G")){
%>
								<td class="style6" style="width: 7%"><font face="Book Antiqua" color="green" ><%=yrly_spec_dev_per_c%></td>
<%
}else if(yrly_spec_dev_per_c_ind.equals("R")){
%>
								<td class="style6" style="width: 7%"><font face="Book Antiqua" color="red" ><%=yrly_spec_dev_per_c%></td>
<%
}else{
%>
								<td class="style6" style="width: 7%"><%=yrly_spec_dev_per_c%></td>
<%
}
%>
				</tr>
				<tr>
								<td class="style14" style="width: 8%"> Total&nbsp;&nbsp;</td>
								<td class="style1" style="width: 7%">&nbsp;</td>
								<td class="style1" style="width: 7%"><%=tot_annual_budget%></td>
								<td class="style5" style="width: 8%"><%=tot_mnthly_bud_mon_spec%></td>
								<td class="style5" style="width: 8%"><%=tot_mnthly_act_mon_spec%></td>
								<td class="style5" style="width: 8%"><%=tot_mnthly_spec_dev%></td>
<%
  if(tot_mnthly_spec_dev_per_ind.equals("G")){
%>
								<td class="style5" style="width: 7%"><font face="Book Antiqua" color="green" ><%=tot_mnthly_spec_dev_per%></td>
<%
}else if(tot_mnthly_spec_dev_per_ind.equals("R")){
%>
								<td class="style5" style="width: 7%"><font face="Book Antiqua" color="red" ><%=tot_mnthly_spec_dev_per%></td>
<%
}else{
%>
								<td class="style5" style="width: 7%"><%=tot_mnthly_spec_dev_per%></td>
<%
}
%>
								<td class="style7" style="width: 10%"><%=tot_yrly_bud_mon_spec%></td>
								<td class="style7" style="width: 10%"><%=tot_yrly_act_mon_spec%></td>
								<td class="style7" style="width: 8%"><%=tot_yrly_spec_dev%></td>
<%
  if(tot_yrly_spec_dev_per_ind.equals("G")){
%>
								<td class="style7" style="width: 7%"><font face="Book Antiqua" color="green" ><%=tot_yrly_spec_dev_per%></td>
<%
}else if(tot_yrly_spec_dev_per_ind.equals("R")){
%>
								<td class="style7" style="width: 7%"><font face="Book Antiqua" color="red" ><%=tot_yrly_spec_dev_per%></td>
<%
}else{
%>
								<td class="style7" style="width: 7%"><%=tot_yrly_spec_dev_per%></td>
<%
}
%>
				</tr>
<%
}
rs.close();
ps.close();

       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    contr_matr_mkr='M' "+
                                     " and    bgt_mkr='B' "+
                                     " and    stn_extn is null "+
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_annual_budget_m = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    contr_matr_mkr='C' "+
                                     " and    bgt_mkr='B' "+
                                     " and    stn_extn is null "+
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_annual_budget_c = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    bgt_mkr='B' "+
                                     " and    stn_extn is null "+
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_tot_annual_budget = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
      ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    contr_matr_mkr='M' "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    mm_val = to_char(to_date(?,'mon'),'MM') "+
                                     " and    yy_val =substr(?,3,2) "+
                                     " and    stn_extn is null "+
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,month);
       ps1.setString(3,finyr2);
       ps1.setString(4,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_mnthly_bud_mon_spec_m = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    contr_matr_mkr='C' "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    mm_val = to_char(to_date(?,'mon'),'MM') "+
                                     " and    yy_val =substr(?,3,2) "+
                                     " and    stn_extn is null "+
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,month);
       ps1.setString(3,finyr2);
       ps1.setString(4,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_mnthly_bud_mon_spec_c = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    mm_val = to_char(to_date(?,'mon'),'MM') "+
                                     " and    yy_val =substr(?,3,2) "+
                                     " and    stn_extn is null "+
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,month);
       ps1.setString(3,finyr2);
       ps1.setString(4,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_tot_mnthly_bud_mon_spec = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    contr_matr_mkr='M' "+
                                     " and    bgt_mkr='A' "+
                                     " and    bill_rel_recv=? "+
                                     " and    mm_val=to_char(to_date(?,'mon'),'MM') "+
                                     " and    stn_extn is null "+
                                     " and    yy_val=substr(?,3,2) ");
       ps1.setString(1,finyr1);
       ps1.setString(2,mon_basis);
       ps1.setString(3,month);
       ps1.setString(4,finyr2);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_mnthly_act_mon_spec_m = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    contr_matr_mkr='C' "+
                                     " and    bgt_mkr='A' "+
                                     " and    bill_rel_recv=? "+
                                     " and    mm_val=to_char(to_date(?,'mon'),'MM') "+
                                     " and    stn_extn is null "+
                                     " and    yy_val=substr(?,3,2) ");
       ps1.setString(1,finyr1);
       ps1.setString(2,mon_basis);
       ps1.setString(3,month);
       ps1.setString(4,finyr2);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_mnthly_act_mon_spec_c = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    bgt_mkr='A' "+
                                     " and    bill_rel_recv=? "+
                                     " and    mm_val=to_char(to_date(?,'mon'),'MM') "+
                                     " and    stn_extn is null "+
                                     " and    yy_val=substr(?,3,2) ");
       ps1.setString(1,finyr1);
       ps1.setString(2,mon_basis);
       ps1.setString(3,month);
       ps1.setString(4,finyr2);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_tot_mnthly_act_mon_spec = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
      ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    contr_matr_mkr='M' "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    stn_extn is null "+
                                     " and    to_date(mm_val||yy_val,'mmyy') between to_date('04'||substr(?,3,2),'mmyy') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(to_char(to_date(?,'Mon'),'MM'),'04',substr(?,3,2),'05',substr(?,3,2),'06',substr(?,3,2),'07',substr(?,3,2),'08',substr(?,3,2),'09',substr(?,3,2),'10',substr(?,3,2),'11',substr(?,3,2),'12',substr(?,3,2),'01',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'02',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'03',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'mmyy') "+ 
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,finyr1);
       ps1.setString(3,month);
       ps1.setString(4,month);
       ps1.setString(5,finyr1);
       ps1.setString(6,finyr1);
       ps1.setString(7,finyr1);
       ps1.setString(8,finyr1);
       ps1.setString(9,finyr1);
       ps1.setString(10,finyr1);
       ps1.setString(11,finyr1);
       ps1.setString(12,finyr1);
       ps1.setString(13,finyr1);
       ps1.setString(14,finyr1);
       ps1.setString(15,finyr1);
       ps1.setString(16,finyr1);
       ps1.setString(17,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_yrly_bud_mon_spec_m = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    contr_matr_mkr='C' "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    stn_extn is null "+
                                     " and    to_date(mm_val||yy_val,'mmyy') between to_date('04'||substr(?,3,2),'mmyy') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(to_char(to_date(?,'Mon'),'MM'),'04',substr(?,3,2),'05',substr(?,3,2),'06',substr(?,3,2),'07',substr(?,3,2),'08',substr(?,3,2),'09',substr(?,3,2),'10',substr(?,3,2),'11',substr(?,3,2),'12',substr(?,3,2),'01',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'02',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'03',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'mmyy') "+ 
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,finyr1);
       ps1.setString(3,month);
       ps1.setString(4,month);
       ps1.setString(5,finyr1);
       ps1.setString(6,finyr1);
       ps1.setString(7,finyr1);
       ps1.setString(8,finyr1);
       ps1.setString(9,finyr1);
       ps1.setString(10,finyr1);
       ps1.setString(11,finyr1);
       ps1.setString(12,finyr1);
       ps1.setString(13,finyr1);
       ps1.setString(14,finyr1);
       ps1.setString(15,finyr1);
       ps1.setString(16,finyr1);
       ps1.setString(17,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_yrly_bud_mon_spec_c = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    stn_extn is null "+
                                     " and    to_date(mm_val||yy_val,'mmyy') between to_date('04'||substr(?,3,2),'mmyy') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(to_char(to_date(?,'Mon'),'MM'),'04',substr(?,3,2),'05',substr(?,3,2),'06',substr(?,3,2),'07',substr(?,3,2),'08',substr(?,3,2),'09',substr(?,3,2),'10',substr(?,3,2),'11',substr(?,3,2),'12',substr(?,3,2),'01',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'02',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'03',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'mmyy') "+ 
                                     " and    target_floor=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,finyr1);
       ps1.setString(3,month);
       ps1.setString(4,month);
       ps1.setString(5,finyr1);
       ps1.setString(6,finyr1);
       ps1.setString(7,finyr1);
       ps1.setString(8,finyr1);
       ps1.setString(9,finyr1);
       ps1.setString(10,finyr1);
       ps1.setString(11,finyr1);
       ps1.setString(12,finyr1);
       ps1.setString(13,finyr1);
       ps1.setString(14,finyr1);
       ps1.setString(15,finyr1);
       ps1.setString(16,finyr1);
       ps1.setString(17,compare);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_tot_yrly_bud_mon_spec = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    contr_matr_mkr='M' "+
                                     " and    bgt_mkr='A' "+
                                     " and    bill_rel_recv=? "+
                                     " and    stn_extn is null "+
                                     " and    to_date(mm_val||yy_val,'mmyy') between to_date('04'||substr(?,3,2),'mmyy') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(to_char(to_date(?,'Mon'),'MM'),'04',substr(?,3,2),'05',substr(?,3,2),'06',substr(?,3,2),'07',substr(?,3,2),'08',substr(?,3,2),'09',substr(?,3,2),'10',substr(?,3,2),'11',substr(?,3,2),'12',substr(?,3,2),'01',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'02',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'03',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'mmyy') "); 
       ps1.setString(1,finyr1);
       ps1.setString(2,mon_basis);
       ps1.setString(3,finyr1);
       ps1.setString(4,month);
       ps1.setString(5,month);
       ps1.setString(6,finyr1);
       ps1.setString(7,finyr1);
       ps1.setString(8,finyr1);
       ps1.setString(9,finyr1);
       ps1.setString(10,finyr1);
       ps1.setString(11,finyr1);
       ps1.setString(12,finyr1);
       ps1.setString(13,finyr1);
       ps1.setString(14,finyr1);
       ps1.setString(15,finyr1);
       ps1.setString(16,finyr1);
       ps1.setString(17,finyr1);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_yrly_act_mon_spec_m = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    contr_matr_mkr='C' "+
                                     " and    bgt_mkr='A' "+
                                     " and    bill_rel_recv=? "+
                                     " and    stn_extn is null "+
                                     " and    to_date(mm_val||yy_val,'mmyy') between to_date('04'||substr(?,3,2),'mmyy') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(to_char(to_date(?,'Mon'),'MM'),'04',substr(?,3,2),'05',substr(?,3,2),'06',substr(?,3,2),'07',substr(?,3,2),'08',substr(?,3,2),'09',substr(?,3,2),'10',substr(?,3,2),'11',substr(?,3,2),'12',substr(?,3,2),'01',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'02',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'03',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'mmyy') "); 
       ps1.setString(1,finyr1);
       ps1.setString(2,mon_basis);
       ps1.setString(3,finyr1);
       ps1.setString(4,month);
       ps1.setString(5,month);
       ps1.setString(6,finyr1);
       ps1.setString(7,finyr1);
       ps1.setString(8,finyr1);
       ps1.setString(9,finyr1);
       ps1.setString(10,finyr1);
       ps1.setString(11,finyr1);
       ps1.setString(12,finyr1);
       ps1.setString(13,finyr1);
       ps1.setString(14,finyr1);
       ps1.setString(15,finyr1);
       ps1.setString(16,finyr1);
       ps1.setString(17,finyr1);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_yrly_act_mon_spec_c = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    bgt_mkr='A' "+
                                     " and    bill_rel_recv=? "+
                                     " and    stn_extn is null "+
                                     " and    to_date(mm_val||yy_val,'mmyy') between to_date('04'||substr(?,3,2),'mmyy') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(to_char(to_date(?,'Mon'),'MM'),'04',substr(?,3,2),'05',substr(?,3,2),'06',substr(?,3,2),'07',substr(?,3,2),'08',substr(?,3,2),'09',substr(?,3,2),'10',substr(?,3,2),'11',substr(?,3,2),'12',substr(?,3,2),'01',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'02',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'03',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'mmyy') "); 
       ps1.setString(1,finyr1);
       ps1.setString(2,mon_basis);
       ps1.setString(3,finyr1);
       ps1.setString(4,month);
       ps1.setString(5,month);
       ps1.setString(6,finyr1);
       ps1.setString(7,finyr1);
       ps1.setString(8,finyr1);
       ps1.setString(9,finyr1);
       ps1.setString(10,finyr1);
       ps1.setString(11,finyr1);
       ps1.setString(12,finyr1);
       ps1.setString(13,finyr1);
       ps1.setString(14,finyr1);
       ps1.setString(15,finyr1);
       ps1.setString(16,finyr1);
       ps1.setString(17,finyr1);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_tot_yrly_act_mon_spec = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       


       ps1 = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps1.setString(1,div_mnthly_act_mon_spec_m);
       ps1.setString(2,div_mnthly_bud_mon_spec_m);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_mnthly_spec_dev_m = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps1.setString(1,div_mnthly_act_mon_spec_c);
       ps1.setString(2,div_mnthly_bud_mon_spec_c);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_mnthly_spec_dev_c = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps1.setString(1,div_tot_mnthly_act_mon_spec);
       ps1.setString(2,div_tot_mnthly_bud_mon_spec);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_tot_mnthly_spec_dev = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+ 
                                     " from dual ");
       ps1.setString(1,div_mnthly_spec_dev_m);
       ps1.setString(2,div_mnthly_bud_mon_spec_m);
       ps1.setString(3,div_mnthly_spec_dev_m);
       ps1.setString(4,div_mnthly_bud_mon_spec_m);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_mnthly_spec_dev_per_m = rs1.getString(1);
           div_mnthly_spec_dev_per_m_ind = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+                 
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+ 
                                     " from dual ");
       ps1.setString(1,div_mnthly_spec_dev_c);
       ps1.setString(2,div_mnthly_bud_mon_spec_c);
       ps1.setString(3,div_mnthly_spec_dev_c);
       ps1.setString(4,div_mnthly_bud_mon_spec_c);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_mnthly_spec_dev_per_c = rs1.getString(1);
           div_mnthly_spec_dev_per_c_ind = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+ 
                                     " from dual ");
       ps1.setString(1,div_tot_mnthly_spec_dev);
       ps1.setString(2,div_tot_mnthly_bud_mon_spec);
       ps1.setString(3,div_tot_mnthly_spec_dev);
       ps1.setString(4,div_tot_mnthly_bud_mon_spec);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_tot_mnthly_spec_dev_per = rs1.getString(1);
           div_tot_mnthly_spec_dev_per_ind = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
      
       ps1 = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps1.setString(1,div_yrly_act_mon_spec_m);
       ps1.setString(2,div_yrly_bud_mon_spec_m);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_yrly_spec_dev_m = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps1.setString(1,div_yrly_act_mon_spec_c);
       ps1.setString(2,div_yrly_bud_mon_spec_c);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_yrly_spec_dev_c = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps1.setString(1,div_tot_yrly_act_mon_spec);
       ps1.setString(2,div_tot_yrly_bud_mon_spec);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_tot_yrly_spec_dev = rs1.getString(1);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+ 
                                     " from dual ");
       ps1.setString(1,div_yrly_spec_dev_m);
       ps1.setString(2,div_yrly_bud_mon_spec_m);
       ps1.setString(3,div_yrly_spec_dev_m);
       ps1.setString(4,div_yrly_bud_mon_spec_m);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_yrly_spec_dev_per_m = rs1.getString(1);
           div_yrly_spec_dev_per_m_ind = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+                 
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+ 
                                     " from dual ");
       ps1.setString(1,div_yrly_spec_dev_c);
       ps1.setString(2,div_yrly_bud_mon_spec_c);
       ps1.setString(3,div_yrly_spec_dev_c);
       ps1.setString(4,div_yrly_bud_mon_spec_c);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_yrly_spec_dev_per_c = rs1.getString(1);
           div_yrly_spec_dev_per_c_ind = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
       
       ps1 = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+ 
                                     " from dual ");
       ps1.setString(1,div_tot_yrly_spec_dev);
       ps1.setString(2,div_tot_yrly_bud_mon_spec);
       ps1.setString(3,div_tot_yrly_spec_dev);
       ps1.setString(4,div_tot_yrly_bud_mon_spec);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_tot_yrly_spec_dev_per = rs1.getString(1);
           div_tot_yrly_spec_dev_per_ind = rs1.getString(2);
       }
       rs1.close();
       ps1.close();
%>
				<tr>
								<td class="style14" rowspan="3" style="width: 7%">DIVISION TOTAL</td>
								<td class="style13" style="width: 6%"> Materials&nbsp;&nbsp;&nbsp;</td>
								<td class="style3" style="width: 7%">&nbsp;</td>
								<td class="style3" style="width: 7%"><%=div_annual_budget_m%></td>
								<td class="style4" style="width: 8%"><%=div_mnthly_bud_mon_spec_m%></td>
								<td class="style4" style="width: 8%"><%=div_mnthly_act_mon_spec_m%></td>
								<td class="style4" style="width: 8%"><%=div_mnthly_spec_dev_m%></td>
<%
  if(div_mnthly_spec_dev_per_m_ind.equals("G")){
%>
								<td class="style4" style="width: 7%"><font face="Book Antiqua" color="green" ><%=div_mnthly_spec_dev_per_m%></td>
<%
}else{
%>
								<td class="style4" style="width: 7%"><font face="Book Antiqua" color="red" ><%=div_mnthly_spec_dev_per_m%></td>
<%
}
%>
								<td class="style6" style="width: 10%"><%=div_yrly_bud_mon_spec_m%></td>
								<td class="style6" style="width: 10%"><%=div_yrly_act_mon_spec_m%></td>
								<td class="style6" style="width: 8%"><%=div_yrly_spec_dev_m%></td>
<%
  if(div_yrly_spec_dev_per_m_ind.equals("G")){
%>
								<td class="style6" style="width: 7%"><font face="Book Antiqua" color="green" ><%=div_yrly_spec_dev_per_m%></td>
<%
}else{
%>
								<td class="style6" style="width: 7%"><font face="Book Antiqua" color="red" ><%=div_yrly_spec_dev_per_m%></td>
<%
}
%>
				</tr>
				<tr>
								<td class="style13" style="width: 8%"> Contracts&nbsp;&nbsp;</td>
								<td class="style3" style="width: 7%">&nbsp;</td>
								<td class="style3" style="width: 7%"><%=div_annual_budget_c%></td>
								<td class="style4" style="width: 8%"><%=div_mnthly_bud_mon_spec_c%></td>
								<td class="style4" style="width: 8%"><%=div_mnthly_act_mon_spec_c%></td>
								<td class="style4" style="width: 8%"><%=div_mnthly_spec_dev_c%></td>
<%
  if(div_mnthly_spec_dev_per_c_ind.equals("G")){
%>
								<td class="style4" style="width: 7%"><font face="Book Antiqua" color="green" ><%=div_mnthly_spec_dev_per_c%></td>
<%
}else{
%>
								<td class="style4" style="width: 7%"><font face="Book Antiqua" color="red" ><%=div_mnthly_spec_dev_per_c%></td>
<%
}
%>
								<td class="style6" style="width: 10%"><%=div_yrly_bud_mon_spec_c%></td>
								<td class="style6" style="width: 10%"><%=div_yrly_act_mon_spec_c%></td>
								<td class="style6" style="width: 8%"><%=div_yrly_spec_dev_c%></td>
<%
  if(div_yrly_spec_dev_per_c_ind.equals("G")){
%>
								<td class="style6" style="width: 7%"><font face="Book Antiqua" color="green" ><%=div_yrly_spec_dev_per_c%></td>
<%
}else{
%>
								<td class="style6" style="width: 7%"><font face="Book Antiqua" color="red" ><%=div_yrly_spec_dev_per_c%></td>
<%
}
%>
				</tr>
				<tr>
								<td class="style14" style="width: 8%"> Total&nbsp;&nbsp;</td>
								<td class="style1" style="width: 7%">&nbsp;</td>
								<td class="style1" style="width: 7%"><%=div_tot_annual_budget%></td>
								<td class="style5" style="width: 8%"><%=div_tot_mnthly_bud_mon_spec%></td>
								<td class="style5" style="width: 8%"><%=div_tot_mnthly_act_mon_spec%></td>
								<td class="style5" style="width: 8%"><%=div_tot_mnthly_spec_dev%></td>
<%
  if(div_tot_mnthly_spec_dev_per_ind.equals("G")){
%>
								<td class="style5" style="width: 7%"><font face="Book Antiqua" color="green" ><%=div_tot_mnthly_spec_dev_per%></td>
<%
}else{
%>
								<td class="style5" style="width: 7%"><font face="Book Antiqua" color="red" ><%=div_tot_mnthly_spec_dev_per%></td>
<%
}
%>
								<td class="style7" style="width: 10%"><%=div_tot_yrly_bud_mon_spec%></td>
								<td class="style7" style="width: 10%"><%=div_tot_yrly_act_mon_spec%></td>
								<td class="style7" style="width: 8%"><%=div_tot_yrly_spec_dev%></td>
<%
  if(div_tot_yrly_spec_dev_per_ind.equals("G")){
%>
								<td class="style7" style="width: 7%"><font face="Book Antiqua" color="green" ><%=div_tot_yrly_spec_dev_per%></td>
<%
}else{
%>
								<td class="style7" style="width: 7%"><font face="Book Antiqua" color="red" ><%=div_tot_yrly_spec_dev_per%></td>
<%
}
%>
				</tr>
</table>
<br>
<table id="mytable" style="width: 100%" border="0" class="" >
  <tr height="10">
   <td style="width: 100%" align="left"><strong><font face="Book Antiqua" color="red" size="3">Red Color : if deviation is more than +/- 20 % </font>&nbsp;&nbsp;<font face="Book Antiqua" color="green" size="3">Green Color : if deviation is less than +/- 20 % </font></td>
  </tr>
</table>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style8"  colspan="12" align="middle"><strong>Quarterly Audited R & M Cost from Finance Department </strong></td>
        </tr>
        <tr>
                <td style="width: 10%" class="style8"><strong>Stn/Dept </strong></td>
                <td style="width: 30%" class="style8"><strong>Source</strong></td>
                <td style="width: 12%" class="style8"><strong>Q1</strong></td>
                <td style="width: 12%" class="style8"><strong>Q2</strong></td>
                <td style="width: 12%" class="style8"><strong>Q3</strong></td>
                <td style="width: 12%" class="style8"><strong>Q4</strong></td>
                <td style="width: 12%" class="style8"><strong>Total</strong></td>
        </tr>
<%
       ps = mk.con.prepareStatement(" select distinct STATION_SHT_DESC,BGT_STATION_CD from cd_station "+
                                    " order by decode(BGT_STATION_CD,'B','1','T','2','S','3','N','4','C','5','E','6') ");
       rs = ps.executeQuery();

while(rs.next()){
       
      ps1 = mk.con.prepareStatement(" select to_char(Q_1,'999999990.999'), to_char(Q_2,'999999990.999'), to_char(Q_3,'999999990.999'), to_char(Q_4,'999999990.999'), to_char(TOTAL,'999999990.999') "+ 
                                    " from BGTM_FIN_ENTRY_TAB "+ 
                                    " where fin_yr=? "+
                                    " and m_c_mkr='M' "+
                                    " and  stn_cd=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           val_m_q1 = rs1.getString(1);
           val_m_q2 = rs1.getString(2);
           val_m_q3 = rs1.getString(3);
           val_m_q4 = rs1.getString(4);
           val_m_tot = rs1.getString(5);
       }
       rs1.close();
       ps1.close();
      
      ps1 = mk.con.prepareStatement(" select to_char(Q_1,'999999990.999'), to_char(Q_2,'999999990.999'), to_char(Q_3,'999999990.999'), to_char(Q_4,'999999990.999'), to_char(TOTAL,'999999990.999') "+ 
                                    " from BGTM_FIN_ENTRY_TAB "+ 
                                    " where fin_yr=? "+
                                    " and m_c_mkr='C' "+
                                    " and  stn_cd=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           val_c_q1 = rs1.getString(1);
           val_c_q2 = rs1.getString(2);
           val_c_q3 = rs1.getString(3);
           val_c_q4 = rs1.getString(4);
           val_c_tot = rs1.getString(5);
       }
       rs1.close();
       ps1.close();
       
      ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(Q_1),0),'999999990.999'), to_char(nvl(sum(Q_2),0),'999999990.999'), to_char(nvl(sum(Q_3),0),'999999990.999'), to_char(nvl(sum(Q_4),0),'999999990.999'), to_char(nvl(sum(TOTAL),0),'999999990.999') "+ 
                                    " from BGTM_FIN_ENTRY_TAB "+ 
                                    " where fin_yr=? "+
                                    " and  stn_cd=? ");
       ps1.setString(1,finyr1);
       ps1.setString(2,rs.getString(2));
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           val_tot_q1 = rs1.getString(1);
           val_tot_q2 = rs1.getString(2);
           val_tot_q3 = rs1.getString(3);
           val_tot_q4 = rs1.getString(4);
           val_tot_tot = rs1.getString(5);
       }
       rs1.close();
       ps1.close();
%>
				<tr>
								<td class="style14" rowspan="3" style="width: 5%"><%=rs.getString(1)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td class="style13" style="width: 8%"> Materials (From ERP)&nbsp;&nbsp;&nbsp;</td>
								<td class="style4" style="width: 7%"><%=val_m_q1%></td>
								<td class="style4" style="width: 7%"><%=val_m_q2%></td>
								<td class="style4" style="width: 8%"><%=val_m_q3%></td>
								<td class="style4" style="width: 8%"><%=val_m_q4%></td>
								<td class="style4" style="width: 8%"><%=val_m_tot%></td>
                                </tr>
				<tr>
								<td class="style13" style="width: 8%"> Contracts (Finance Declared Quarter End Value)&nbsp;&nbsp;&nbsp;</td>
								<td class="style4" style="width: 7%"><%=val_c_q1%></td>
								<td class="style4" style="width: 7%"><%=val_c_q2%></td>
								<td class="style4" style="width: 8%"><%=val_c_q3%></td>
								<td class="style4" style="width: 8%"><%=val_c_q4%></td>
								<td class="style4" style="width: 8%"><%=val_c_tot%></td>
                                </tr>
				<tr>
								<td class="style14" style="width: 8%"> Total&nbsp;&nbsp;&nbsp;</td>
								<td class="style5" style="width: 7%"><%=val_tot_q1%></td>
								<td class="style5" style="width: 7%"><%=val_tot_q2%></td>
								<td class="style5" style="width: 8%"><%=val_tot_q3%></td>
								<td class="style5" style="width: 8%"><%=val_tot_q4%></td>
								<td class="style5" style="width: 8%"><%=val_tot_tot%></td>
                                </tr>
<%
}
rs.close();
ps.close();
      
      ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(Q_1),0),'999999990.999'), to_char(nvl(sum(Q_2),0),'999999990.999'), to_char(nvl(sum(Q_3),0),'999999990.999'), to_char(nvl(sum(Q_4),0),'999999990.999'), to_char(nvl(sum(TOTAL),0),'999999990.999') "+ 
                                    " from BGTM_FIN_ENTRY_TAB "+ 
                                    " where fin_yr=? "+
                                    " and m_c_mkr='M' ");
       ps1.setString(1,finyr1);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_val_m_q1 = rs1.getString(1);
           div_val_m_q2 = rs1.getString(2);
           div_val_m_q3 = rs1.getString(3);
           div_val_m_q4 = rs1.getString(4);
           div_val_m_tot = rs1.getString(5);
       }
       rs1.close();
       ps1.close();
      
      ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(Q_1),0),'999999990.999'), to_char(nvl(sum(Q_2),0),'999999990.999'), to_char(nvl(sum(Q_3),0),'999999990.999'), to_char(nvl(sum(Q_4),0),'999999990.999'), to_char(nvl(sum(TOTAL),0),'999999990.999') "+ 
                                    " from BGTM_FIN_ENTRY_TAB "+ 
                                    " where fin_yr=? "+
                                    " and m_c_mkr='C' ");
       ps1.setString(1,finyr1);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_val_c_q1 = rs1.getString(1);
           div_val_c_q2 = rs1.getString(2);
           div_val_c_q3 = rs1.getString(3);
           div_val_c_q4 = rs1.getString(4);
           div_val_c_tot = rs1.getString(5);
       }
       rs1.close();
       ps1.close();
       
      ps1 = mk.con.prepareStatement(" select to_char(nvl(sum(Q_1),0),'999999990.999'), to_char(nvl(sum(Q_2),0),'999999990.999'), to_char(nvl(sum(Q_3),0),'999999990.999'), to_char(nvl(sum(Q_4),0),'999999990.999'), to_char(nvl(sum(TOTAL),0),'999999990.999') "+ 
                                    " from BGTM_FIN_ENTRY_TAB "+ 
                                    " where fin_yr=? ");
       ps1.setString(1,finyr1);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
           div_val_tot_q1 = rs1.getString(1);
           div_val_tot_q2 = rs1.getString(2);
           div_val_tot_q3 = rs1.getString(3);
           div_val_tot_q4 = rs1.getString(4);
           div_val_tot_tot = rs1.getString(5);
       }
       rs1.close();
       ps1.close();
%>

				<tr>
								<td class="style14" rowspan="3" style="width: 5%">DIVISION TOTAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td class="style13" style="width: 8%"> Materials (From ERP)&nbsp;&nbsp;&nbsp;</td>
								<td class="style4" style="width: 7%"><%=div_val_m_q1%></td>
								<td class="style4" style="width: 7%"><%=div_val_m_q2%></td>
								<td class="style4" style="width: 8%"><%=div_val_m_q3%></td>
								<td class="style4" style="width: 8%"><%=div_val_m_q4%></td>
								<td class="style4" style="width: 8%"><%=div_val_m_tot%></td>
                                </tr>
				<tr>
								<td class="style13" style="width: 8%"> Contracts (Finance Declared Quarter End Value)&nbsp;&nbsp;&nbsp;</td>
								<td class="style4" style="width: 7%"><%=div_val_c_q1%></td>
								<td class="style4" style="width: 7%"><%=div_val_c_q2%></td>
								<td class="style4" style="width: 8%"><%=div_val_c_q3%></td>
								<td class="style4" style="width: 8%"><%=div_val_c_q4%></td>
								<td class="style4" style="width: 8%"><%=div_val_c_tot%></td>
                                </tr>
				<tr>
								<td class="style14" style="width: 8%"> Total&nbsp;&nbsp;&nbsp;</td>
								<td class="style5" style="width: 7%"><%=div_val_tot_q1%></td>
								<td class="style5" style="width: 7%"><%=div_val_tot_q2%></td>
								<td class="style5" style="width: 8%"><%=div_val_tot_q3%></td>
								<td class="style5" style="width: 8%"><%=div_val_tot_q4%></td>
								<td class="style5" style="width: 8%"><%=div_val_tot_tot%></td>
                                </tr>
</table>
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
     if(rs2!=null){
        rs2.close();
     }
     if(ps2!=null){
        ps2.close();
     }
     if(rs!=null){
        rs.close();
     }
     if(ps!=null){
        ps.close();
     }
     if(mk!=null){
        mk.con.close();
     }

}

%>
</form>
</body>
</html>