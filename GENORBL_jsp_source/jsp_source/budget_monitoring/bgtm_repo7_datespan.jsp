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
				background-color: #FFE391;
}
.style14 {
                                text-align: left;
				border-style: solid;
				border-color: #FFE391;
				background-color: #FFE391;
}
.style3 {
                                text-align: right;
				border-style: solid;
				border-color: #FFFFBF;
				background-color: #FFFFBF;
}

.style13 {
                                text-align: left;
				border-style: solid;
				border-color: #FFFFBF;
				background-color: #FFFFBF;
}
.style4 {
                                text-align: left;
				border-style: solid;
				border-color:  #D9F2F0;
				background-color:#D9F2F0;
				font-family: Arial;
				font-size: 9pt;
}
.style16 {
                                text-align: center;
				border-style: solid;
				border-color:  #D9F2F0;
				background-color:#D9F2F0;
				font-family: Arial;
				font-size: 9pt;
}
.style17 {
                                text-align: right;
				border-style: solid;
				border-color:  #D9F2F0;
				background-color:#D9F2F0;
				font-family: Arial;
				font-size: 9pt;
}
.style18 {
                                text-align: left;
				border-style: solid;
				border-color:  #CACAFF;
				background-color:#CACAFF;
				font-family: Arial;
				font-size: 9pt;
}
.style19 {
                                text-align: center;
				border-style: solid;
				border-color: #CACAFF 
				background-color:#CACAFF;
				font-family: Arial;
				font-size: 9pt;
}
.style20 {
                                text-align: right;
				border-style: solid;
				border-color:  #CACAFF;
				background-color:#CACAFF;
				font-family: Arial;
				font-size: 9pt;
}
.style15 {
				border-width: 1px;
				text-align: left;
				color: #800000;
				font-family: Arial;
				font-size: 10pt;
				background-color: #FFDD95;
}
.style8 {
                                text-align: center;
                                color: #ffffff;
                                font-family: Arial;
                                font-size: 10pt;
                                background-color:#008080;
}
.style9 {
                                text-align: center;
				font-family: Arial;
				font-size: 9pt;
				background-color: #86AEAE;
}
.style10 {
                                text-align: right;
				font-family: Arial;
				font-size: 9pt;
				background-color: #86AEAE;
}
.style25 {
                                text-align: center;
				font-family: Arial;
				font-size: 9pt;
				background-color:  #9393FF;
}
.style26 {
                                text-align: right;
				font-family: Arial;
				font-size: 9pt;
				background-color:  #9393FF;
}
</style>



</style>

<script type='text/JavaScript' src='best_cal_budget_mon.js'></script>

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

function check_date_less(f,f1){
      var day1,mon1,yr1,day2,mon2,yr2;

      var entry1 = f.value;
        day2= parseInt(entry1.substring(0, 2)-0);
        mon2= parseInt(entry1.substring(3, 5)-0);
        yr2 = parseInt(entry1.substring(6, 8)-0);
      var entry = f1.value;
        day1= parseInt(entry.substring(0, 2)-0);
        mon1= entry.substring(3,6);
        yr1 = parseInt(entry.substring(9, 11)-0);
if(mon1 == 'Apr'){
  mon1='04';
}else if(mon1 == 'May'){
  mon1='05';
}else if(mon1 == 'Jun'){
  mon1='06';
}else if(mon1 == 'Jul'){
  mon1='07';
}else if(mon1 == 'Aug'){
  mon1='08';
}else if(mon1 == 'Sep'){
  mon1='09';
}else if(mon1 == 'Oct'){
  mon1='10';
}else if(mon1 == 'Nov'){
  mon1='11';
}else if(mon1 == 'Dec'){
  mon1='12';
}else if(mon1 == 'Jan'){
  mon1='01';
}else if(mon1 == 'Feb'){
  mon1='02';
}else{
  mon1='03';
}

mon1=parseInt(mon1);
//alert(day1);
//alert(mon1);
//alert(yr1);
//alert(day2);
//alert(mon2);
//alert(yr2);

       if(yr2<yr1){
       f1.focus();
       return false;
       }
       else if(mon2<mon1 && yr2<=yr1){
       f1.focus();
       return false;
       }
       else if(day2<day1 && mon2<=mon1 && yr2<=yr1){
       f1.focus();
       return false;
       }
       else
           return true;
}

function check_date_less_st(f,f1){
      var day1,mon1,yr1,day2,mon2,yr2;

      var entry1 = f.value;
        day2= parseInt(entry1.substring(0, 2)-0);
        mon2= parseInt(entry1.substring(3, 5)-0);
        yr2 = parseInt(entry1.substring(6, 8)-0);
      var entry = f1.value;
        day1= parseInt(entry.substring(0, 2)-0);
        mon1= entry.substring(3, 6);
        yr1 = parseInt(entry.substring(9, 11)-0);

if(mon1 == 'Apr'){
  mon1='04';
}else if(mon1 == 'May'){
  mon1='05';
}else if(mon1 == 'Jun'){
  mon1='06';
}else if(mon1 == 'Jul'){
  mon1='07';
}else if(mon1 == 'Aug'){
  mon1='08';
}else if(mon1 == 'Sep'){
  mon1='09';
}else if(mon1 == 'Oct'){
  mon1='10';
}else if(mon1 == 'Nov'){
  mon1='11';
}else if(mon1 == 'Dec'){
  mon1='12';
}else if(mon1 == 'Jan'){
  mon1='01';
}else if(mon1 == 'Feb'){
  mon1='02';
}else{
  mon1='03';
}

mon1=parseInt(mon1);
//alert(day1);
//alert(mon1);
//alert(yr1);
//alert(day2);
//alert(mon2);
//alert(yr2);

       if(yr1<yr2){
       f1.focus();
       return false;
       }
       else if(mon1<mon2 && yr1<=yr2){
       f1.focus();
       return false;
       }
       else if(day1<day2 && mon1<=mon2 && yr1<=yr2){
       f1.focus();
       return false;
       }
       else
           return true;
}

var http  = getHTTPObject();
var http1 = getHTTPObject();

function getHTTPObject() {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}

function popl_section(obj,str) {
var xmldiffrnciator = Math.floor(Math.random() * 100000);
var params = "stn_cd="+str;
params += "&xmldiffrnciator="+xmldiffrnciator;
var url = "popl_gen_section.jsp";
http.open("POST", url, true);
http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http.onreadystatechange = function()
   {
        if(http.readyState == 4 && http.status == 200)
        {
             var results = http.responseText.split("~");
              obj.options.length=0;
if(str != 'ALL'){
              var opt2=document.createElement("option")
              opt2.text='ALL';
              opt2.value='ALL';
              obj.add(opt2);
}

              for(var i=0;i<results.length-1;i++)
              {
              var opt1=document.createElement("option")
              results1 = results[i].split("@");
              opt1.text=results1[1];
              opt1.value=results1[1];
              obj.add(opt1);
              }

        }
  }
http.send(params);
}

function popl_dt_fin_finyr() {
var xmldiffrnciator = Math.floor(Math.random() * 100000);
var params = "stn_cd="+document.f1.station.value+"&finyr="+document.f1.finyr.value;
params += "&xmldiffrnciator="+xmldiffrnciator;
var url = "popl_dt_fin_finyr.jsp";
http1.open("POST", url, true);
http1.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http1.onreadystatechange = function()
   {
        if(http1.readyState == 4 && http1.status == 200)
        {
              var results = http1.responseText.split("@");
              document.f1.fin_frmdt.value=results[0];
              document.f1.fin_endt.value=results[1];

        }
  }
http1.send(params);
}


function submitdata(){

if(!check_date_less_st(document.f1.fin_frmdt,document.f1.frmdt)){
  alert('Start Date should be '+document.f1.fin_frmdt.value+' For Finnancial Year '+document.f1.finyr.value);
  return false;
}else if(!check_date_less(document.f1.fin_endt,document.f1.todt)){
  alert('END Date should be '+document.f1.fin_endt.value+' For Finnancial Year '+document.f1.finyr.value);
  return false;
}else{
  var parameter='';
   parameter = parameter + 'empcd='+document.f1.empcd.value;
   parameter = parameter + '&frmdt='+document.f1.frmdt.value;
   parameter = parameter + '&todt='+document.f1.todt.value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&mon_basis='+document.f1.mon_basis.value;
   parameter = parameter + '&station='+document.f1.station.value;
   parameter = parameter + '&section='+document.f1.section.value;
   parameter = parameter + '&group='+document.f1.group.value;
//alert(parameter);
window.open("bgtm_repo7_datespan.jsp?"+parameter,"_self");
}
}

function loadImg(){

 document.getElementById("d1").innerHTML = '<img src="load_img.gif"/>';

}

function unloadImg(){

 document.getElementById("d1").innerHTML = "&nbsp";
 document.getElementById("d1").setAttribute("style","width:0px");

}
</script>
</head>

<body background="" onLoad="unloadImg();">

<%

  PreparedStatement ps              = null;
  ResultSet rs                      = null;
  PreparedStatement ps1             = null;
  ResultSet rs1                     = null;
  PreparedStatement ps2             = null;
  ResultSet rs2                     = null;
  MakeConnectionGENORBL mk          = null;

int iSl_No = 0;
  
  String finyr                      = new String("");
  String prev_gr_desc               = new String("");
  String finyr1                     = new String("");
  String finyr2                     = new String("");
  String month                      = new String("");

  String cur_month                  = new String("");
  String cur_yr                     = new String("");
  String frm_month                  = new String("");
  String frm_yr                     = new String("");
  String frmdt                      = new String("");
  String todt                       = new String("");

  String month_act                  = new String("");
  String mon_basis                  = new String("");
  String empcd                      = new String("");
  String sysdate                    = new String("");
  String your_desg                  = new String("");
  String station                    = new String("");
  String section                    = new String("");
  String bgt_hd                     = new String("");
  String group                      = new String("");
  String group_desc                 = new String("");
  String chk_frm_dt                 = new String("0");
  String act_frm_dt                 = new String("");
  String chk_to_dt                  = new String("");

  String sStyle                     = new String("");
  String sStyle1                    = new String("");
  String sStyle2                    = new String("");
  
  String mtd_budget_t               = new String("");
  String mtd_budget_f               = new String("");
  String mtd_exp_act                = new String("");
  String ytd_budget_t               = new String("");
  String ytd_budget_f               = new String("");
  String ytd_exp_act                = new String("");

  String bgt_hd_desc                = new String("");
  String prev_gr_cd                 = new String("");
  String prev_contr_matr_mkr        = new String("@");
 
  Double tot_mtd_budget_t           = 0.0;
  Double tot_mtd_budget_f           = 0.0;
  Double tot_mtd_exp_act            = 0.0;
  Double tot_ytd_budget_t           = 0.0;
  Double tot_ytd_budget_f           = 0.0;
  Double tot_ytd_exp_act            = 0.0;
  String stot_mtd_budget_t           = new String("");
  String stot_mtd_budget_f           = new String("");
  String stot_mtd_exp_act            = new String("");
  String stot_ytd_budget_t           = new String("");
  String stot_ytd_budget_f           = new String("");
  String stot_ytd_exp_act            = new String("");
  
  Double spl_tot_mtd_budget_t           = 0.0;
  Double spl_tot_mtd_budget_f           = 0.0;
  Double spl_tot_mtd_exp_act            = 0.0;
  Double spl_tot_ytd_budget_t           = 0.0;
  Double spl_tot_ytd_budget_f           = 0.0;
  Double spl_tot_ytd_exp_act            = 0.0;
  String spl_stot_mtd_budget_t           = new String("");
  String spl_stot_mtd_budget_f           = new String("");
  String spl_stot_mtd_exp_act            = new String("");
  String spl_stot_ytd_budget_t           = new String("");
  String spl_stot_ytd_budget_f           = new String("");
  String spl_stot_ytd_exp_act            = new String("");

  String div_tot_mtd_budget_t       = new String("");
  String div_tot_mtd_budget_f       = new String("");
  String div_tot_mtd_exp_act        = new String("");
  String div_tot_ytd_budget_t       = new String("");
  String div_tot_ytd_budget_f       = new String("");
  String div_tot_ytd_exp_act        = new String("");

  Double sub_tot_mtd_budget_t           = 0.0;
  Double sub_tot_mtd_budget_f           = 0.0;
  Double sub_tot_mtd_exp_act            = 0.0;
  Double sub_tot_ytd_budget_t           = 0.0;
  Double sub_tot_ytd_budget_f           = 0.0;
  Double sub_tot_ytd_exp_act            = 0.0;
  String ssub_tot_mtd_budget_t           = new String("");
  String ssub_tot_mtd_budget_f           = new String("");
  String ssub_tot_mtd_exp_act            = new String("");
  String ssub_tot_ytd_budget_t           = new String("");
  String ssub_tot_ytd_budget_f           = new String("");
  String ssub_tot_ytd_exp_act            = new String("");

try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);
     empcd     = request.getParameter("empcd");
     frmdt     = request.getParameter("frmdt");
     todt      = request.getParameter("todt");
     finyr     = request.getParameter("finyr");
     mon_basis = request.getParameter("mon_basis");
     station   = request.getParameter("station");
     section   = request.getParameter("section");
     group     = request.getParameter("group");
     prev_gr_cd="99999";

System.out.println("station:"+station);
System.out.println("section:"+section);
System.out.println("group:"+group);
System.out.println("frmdt:"+frmdt);
System.out.println("todt:"+todt);

       ps = mk.con.prepareStatement("select to_char(trunc(sysdate),'DD-MON-RRRR') from dual");
       rs = ps.executeQuery();
       while(rs.next()){
            sysdate = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select to_char(to_date(?,'Mon'),'Month') from dual");
       ps.setString(1,month);
       rs = ps.executeQuery();
       while(rs.next()){
            month_act = rs.getString(1);
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

finyr1    = finyr.substring(0,4);
finyr2    = finyr.substring(5,9);
       
       ps = mk.con.prepareStatement(" select distinct bgt_yr||'-'||to_char(add_months(to_date(bgt_yr,'YYYY'),12),'YYYY'),bgt_yr "+ 
                                    " from bgt_form2b_data where bgt_yr <>? order by bgt_yr desc ");
       ps.setString(1,finyr1);
       rs = ps.executeQuery();
       
%>

<form method="post" name="f1" action="bgtm_repo7_datespan.jsp">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:180px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">Budget Head wise MTD and YTD Expenditures Compared To Budget Target And Floor Values</font></b>
</label>
<label style="left:380px; top:20px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="3">(Between A Given Datespan)</font></b>
</label>

<label style="left:50px; top:40px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>

<div id="d1" style="position:relative;left:500px;top:300px" >
</div>

<script>
 loadImg();
</script>

<label style="left:900px; top:30px; position: absolute" >
<a href="submenu_budget_mon_reports.jsp" target="_top" style="position: absolute; left: 15; top: 25"> <H1><font color="#0000CC">Back </H1></a></font></b>
</label>
<br>
<br>
<br>
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
<table id="mytable" style="width: 100%" border="0" class="style9" >
        <tr height="10">
           <td style="width: 20%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Financial Year :&nbsp;&nbsp;&nbsp;
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
<%
       ps = mk.con.prepareStatement(" select station_sht_desc from cd_station "+
                                    " where station_sht_desc <> ? "+
                                    " order by decode('BBGS','1','TGS','2','SGS','3','NCGS','4','CTM','5','EDGE','E') ");
       ps.setString(1,station);
       rs = ps.executeQuery();
%>
           <td style="width: 20%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Station :&nbsp;&nbsp;&nbsp; 
           <select size="1" name="station" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onChange="popl_section(f1.section,this.value);"/>
              <option selected value=<%=station%>><%=station%></option>
<%
           while(rs.next()){
%>
              <option value=<%=rs.getString(1)%>><%=rs.getString(1)%></option>
<%
           }
           rs.close();
           ps.close();
if(!station.equals("ALL")){
%>
              <option value="ALL">ALL</option>
<%
}
%>
           </select>
           </strong></td>
<%
if(!station.equals("ALL")){
       ps = mk.con.prepareStatement(" select section_cd    "+
                                    " from  bgt_cd_section "+
                                    " where station_cd =decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E')  "+
                                    " and section_cd <>?  "+
                                    " order by section_cd  ");
       ps.setString(1,station);
       ps.setString(2,section);
       rs = ps.executeQuery();
%>
           <td style="width: 20%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Section :&nbsp;&nbsp;&nbsp; 
           <select size="1" name="section" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
              <option selected value=<%=section%>><%=section%></option>
<%
           while(rs.next()){
%>
              <option value=<%=rs.getString(1)%>><%=rs.getString(1)%></option>
<%
           }
           rs.close();
           ps.close();
if(!section.equals("ALL")){
%>
              <option value="ALL">ALL</option>
<%
}
%>
           </select>
           </strong></td>
<%
}else{
%>
           <td style="width: 20%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Section :&nbsp;&nbsp;&nbsp; 
           <select size="1" name="section" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
              <option selected value="ALL">ALL</option>
           </select>
           </strong></td>
<%
}
%>
           <td style="width: 20%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">From Date :&nbsp;&nbsp;&nbsp;
              <INPUT name=frmdt style="HEIGHT: 22px; WIDTH: 95px" size="12" value="<%=frmdt%>" onblur="" readOnly onclick="scwShow(this,event);">
           </strong></td>
           <td style="width: 20%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">To Date :&nbsp;&nbsp;&nbsp;
              <INPUT name=todt style="HEIGHT: 22px; WIDTH: 95px" size="12" value="<%=todt%>" onblur="" readOnly onclick="scwShow(this,event);">
           </strong></td>
        </tr>
        <tr height="10">
           <td style="width: 20%" align="left" colspan="3"><strong><font face="Book Antiqua" color="#800000" size="3">Monitoring On The Basis Of :&nbsp;&nbsp;&nbsp;
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
<%

if(!group.equals("ALL")){

       ps = mk.con.prepareStatement(" select gr_desc "+
                                    " from  BGTM_GROUP_MST "+
                                    " where gr_cd = ? ");
       ps.setString(1,group);
       rs = ps.executeQuery();

while(rs.next()){
  group_desc = rs.getString(1);
}
rs.close();
ps.close();

}else{
  group_desc = "ALL";
}

       ps = mk.con.prepareStatement(" select gr_cd,gr_desc "+
                                    " from  BGTM_GROUP_MST "+
                                    " where gr_cd <> ? "+
                                    " order by gr_cd ");
       ps.setString(1,group);
       rs = ps.executeQuery();
%>
           <td style="width: 20%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Group :&nbsp;&nbsp;&nbsp;
           <select size="1" name="group" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
              <option selected value=<%=group%>><%=group_desc%></option>
<%
while(rs.next()){
%>
              <option value=<%=rs.getString(1)%>><%=rs.getString(2)%></option>
<%
}
rs.close();
ps.close();

if(!group.equals("ALL")){
%>
              <option value="ALL">ALL</option>
<%
}
%>
           </select>
           </strong></td>
<%


cur_month    = todt.substring(3,6);
frm_month    = frmdt.substring(3,6);

if(cur_month.equals("Apr")){

       ps = mk.con.prepareStatement(" select count(*) " + 
                                    " from FINNANCE_FINYR where FINANCE_FINYR=? "+ 
                                    " and STN=decode(?,'BBGS','016','SGS','002','TGS','014','NCGS','013','CTM','019','EDGE','042','016') "+
                                    " and end_date >= to_date(?,'dd/mm/rr') and substr(?,8,4) <> substr(?,1,4) ");
       ps.setString(1,finyr);
       ps.setString(2,station);
       ps.setString(3,todt);
       ps.setString(4,todt);
       ps.setString(5,finyr);
       rs = ps.executeQuery();
       while(rs.next()){
            chk_to_dt = rs.getString(1);
       }
       rs.close();
       ps.close();
}

if(chk_to_dt.equals("1")){
   cur_month ="Mar";
       
}

       ps = mk.con.prepareStatement(" select to_char(start_date,'dd/mm/rr') " + 
                                    " from FINNANCE_FINYR where FINANCE_FINYR=? "+ 
                                    " and STN=decode(?,'BBGS','016','SGS','002','TGS','014','NCGS','013','CTM','019','EDGE','042','016') ");
       ps.setString(1,finyr);
       ps.setString(2,station);
       rs = ps.executeQuery();
       while(rs.next()){
            act_frm_dt = rs.getString(1);
       }
       rs.close();
       ps.close();

       

if(cur_month.equals("Jan") || cur_month.equals("Feb") || cur_month.equals("Mar")){
    cur_yr=finyr2;
}else{
    cur_yr=finyr1;
}

if(frm_month.equals("Jan") || frm_month.equals("Feb") || frm_month.equals("Mar")){
    frm_yr=finyr2;
}else{
    frm_yr=finyr1;
}
%>

<input type="hidden" id= "chk_frm_dt" name = "chk_frm_dt" value="<%=chk_frm_dt%>" />
<input type="hidden" id= "act_frm_dt" name = "act_frm_dt" value="<%=act_frm_dt%>" />
<input type="hidden" id= "fin_frmdt" name = "fin_frmdt" value="" />
<input type="hidden" id= "fin_endt" name = "fin_endt" value="" />
           <td style="width: 20%" align="left" ><strong>
            <input type="button" value="Submit" id="submit" name="submit" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="popl_dt_fin_finyr();setTimeout('submitdata()',1000);">
           </td>
        </tr>
</table>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style8"  colspan="12" align="middle"><strong><%=station%></strong></td>
        </tr>
        <tr>
                <td style="width: 20%" class="style8"  colspan="12" align="middle"><strong>Cash Flow Monitoring Statement (in Rs. Lacs)</strong></td>
        </tr>
        <tr>
                <td style="width: 20%" class="style8"  colspan="12" align="middle"><strong>For Section(s) <%=section%> </strong></td>
        </tr>
        <tr>
                <td colspan="2" class="style8"><strong>&nbsp; </strong></td>
                <td style="width: 30%" colspan="3" class="style8"><strong>MTD (<%=cur_month%>/<%=cur_yr%>)</strong></td>
                <td style="width: 30%" colspan="3" class="style8"><strong>YTD (From <%=frm_month%>/<%=frm_yr%> To <%=cur_month%>/<%=cur_yr%>)</strong></td>
        </tr>
        <tr>
                <td style="width: 40%" class="style8"><strong>Budget Head Description </strong></td>
                <td style="width: 5%" class="style8"><strong>Sub Head</strong></td>
                <td style="width: 10%" class="style8"><strong>Budget Target</strong></td>
                <td style="width: 10%" class="style8"><strong>Budget Floor</strong></td>
                <td style="width: 10%" class="style8"><strong>Actual</strong></td>
                <td style="width: 10%" class="style8"><strong>Budget Target</strong></td>
                <td style="width: 10%" class="style8"><strong>Budget Floor</strong></td>
                <td style="width: 10%" class="style8"><strong>Actual</strong></td>
        </tr>
<%


System.out.println("cur_month:"+cur_month);
System.out.println("cur_yr:"+cur_yr);
System.out.println("frm_month:"+frm_month);
System.out.println("frm_yr:"+frm_yr);

       ps = mk.con.prepareStatement(" select a.gr_cd,bgt_hd,gr_desc,decode(nvl(contr_matr_mkr,'@'),'M','Materials','C','Contracts',nvl(contr_matr_mkr,'@'))  "+
                                    " from  BGTM_BGT_GROUP a,BGTM_GROUP_MST b "+
				    " where a.gr_cd=b.gr_cd "+
                                    " and a.gr_cd like  decode(?,'ALL','%',?) "+
                                    " order by gr_cd,decode(CONTR_MATR_MKR,'M','1','C','2',CONTR_MATR_MKR),seq  ");
       ps.setString(1,group);
       ps.setString(2,group);
       rs = ps.executeQuery();

while(rs.next()){

       ps1 = mk.con.prepareStatement(" select desc1 "+
                                     " from bgt_form2b_struc "+
                                     " where bgt_hd_rowval=? ");
       ps1.setString(1,rs.getString(2));
       rs1 = ps1.executeQuery();

while(rs1.next()){
  bgt_hd_desc = rs1.getString(1);
}
rs1.close();
ps1.close();
       
       ps1 = mk.con.prepareStatement(" select /*+ rule */  to_char(nvl(sum(amt),0),'9999999990.999') "+
                                     " from BGTM_REPO_STRUC_SPL "+
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+
                                     " and   target_floor ='T' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+
                                     " and   BGT_HD= ? "+
                                     " and   MM_VAL=to_char(to_date(?,'Mon'),'MM') "+
                                     " and   stn_extn is null ");

       ps1.setString(1,finyr1);
       ps1.setString(2,station);
       ps1.setString(3,section);
       ps1.setString(4,section);
       ps1.setString(5,rs.getString(2));
       ps1.setString(6,cur_month);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  mtd_budget_t = rs1.getString(1);
}
rs1.close();
ps1.close();
       
       ps1 = mk.con.prepareStatement(" select /*+ rule */  to_char(nvl(sum(amt),0),'9999999990.999') "+
                                     " from BGTM_REPO_STRUC_SPL "+
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+
                                     " and   target_floor ='F' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+
                                     " and   BGT_HD= ? "+
                                     " and   MM_VAL=to_char(to_date(?,'Mon'),'MM') "+
                                     " and   stn_extn is null ");

       ps1.setString(1,finyr1);
       ps1.setString(2,station);
       ps1.setString(3,section);
       ps1.setString(4,section);
       ps1.setString(5,rs.getString(2));
       ps1.setString(6,cur_month);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  mtd_budget_f = rs1.getString(1);
}
rs1.close();
ps1.close();

       ps1 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(trans_amt),0),'9999999990.999') "+
                                     " from BGTM_ACT_EXP_VIEW_SPL "+ 
                                     " where fin_yr=? "+
                                     " and   stn_name like decode(?,'ALL','%',?) "+ 
                                     " and   dept like decode(?,'ALL','%',?) and stn_extn is null "+ 
                                     " and   budget_hd= decode(?,'2a-2','2a',?) "+ 
				     " and   trns_date between to_date('01-'||?||'-'||?,'DD-Mon-yyyy') and to_date(?,'DD-Mon-yyyy') "+
                                     " and   send_recv_mkr=? order by decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),dept");

       ps1.setString(1,finyr1);
       ps1.setString(2,station);
       ps1.setString(3,station);
       ps1.setString(4,section);
       ps1.setString(5,section);
       ps1.setString(6,rs.getString(2));
       ps1.setString(7,rs.getString(2));
       ps1.setString(8,cur_month);
       ps1.setString(9,finyr1);
       ps1.setString(10,todt);
       ps1.setString(11,mon_basis);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  mtd_exp_act = rs1.getString(1);
}
rs1.close();
ps1.close();


       ps1 = mk.con.prepareStatement(" select /*+ rule */  to_char(nvl(sum(amt),0),'9999999990.999')  from BGTM_REPO_STRUC_SPL "+ 
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+ 
                                     " and   target_floor ='T' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+ 
                                     " and   BGT_HD= ? "+
                                     " and   to_date(MM_VAL||YY_VAL,'mmyy') between to_date(?||substr(?,3,2),'MMYY') and to_date(?||substr(?,3,2),'MMYY')  "+    
                                     " and   stn_extn is null ");
       ps1.setString(1,finyr1);
       ps1.setString(2,station);
       ps1.setString(3,section);
       ps1.setString(4,section);
       ps1.setString(5,rs.getString(2));
       ps1.setString(6,frm_month);
       ps1.setString(7,frm_yr);
       ps1.setString(8,cur_month);
       ps1.setString(9,cur_yr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  ytd_budget_t = rs1.getString(1);
}
rs1.close();
ps1.close();
       
       ps1 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(amt),0),'9999999990.999')  from BGTM_REPO_STRUC_SPL "+ 
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+ 
                                     " and   target_floor ='F' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+ 
                                     " and   BGT_HD= ? "+ 
                                     " and   to_date(MM_VAL||YY_VAL,'mmyy') between to_date(?||substr(?,3,2),'MMYY') and to_date(?||substr(?,3,2),'MMYY') "+
                                     " and   stn_extn is null ");
       ps1.setString(1,finyr1);
       ps1.setString(2,station);
       ps1.setString(3,section);
       ps1.setString(4,section);
       ps1.setString(5,rs.getString(2));
       ps1.setString(6,frm_month);
       ps1.setString(7,frm_yr);
       ps1.setString(8,cur_month);
       ps1.setString(9,cur_yr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  ytd_budget_f = rs1.getString(1);
}
rs1.close();
ps1.close();

System.out.println("frm_month:"+frm_month);
System.out.println("frm_yr:"+frm_yr);
System.out.println("cur_month:"+cur_month);
System.out.println("cur_yr:"+cur_yr);
       
       ps1 = mk.con.prepareStatement(" select /*+ rule */  to_char(nvl(sum(trans_amt),0),'9999999990.999') "+
                                     " from BGTM_ACT_EXP_VIEW_SPL "+ 
                                     " where fin_yr=? "+
                                     " and   stn_name like decode(?,'ALL','%',?) "+ 
                                     " and   dept like decode(?,'ALL','%',?) and stn_extn is null "+ 
                                     " and   budget_hd= decode(?,'2a-2','2a',?) "+ 
				     " and   trns_date between to_date(?,'DD-Mon-yyyy') and to_date(?,'DD-Mon-yyyy') "+
                                     " and   send_recv_mkr=? order by decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),dept");

       ps1.setString(1,finyr1);
       ps1.setString(2,station);
       ps1.setString(3,station);
       ps1.setString(4,section);
       ps1.setString(5,section);
       ps1.setString(6,rs.getString(2));
       ps1.setString(7,rs.getString(2));
       ps1.setString(8,frmdt);
       ps1.setString(9,todt);
       ps1.setString(10,mon_basis);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  ytd_exp_act = rs1.getString(1);
}
rs1.close();
ps1.close();

if(!rs.getString(4).equals(prev_contr_matr_mkr) ){

if(!prev_contr_matr_mkr.equals("@")){
       
       ps1 = mk.con.prepareStatement("  select to_char(?,'9999999990.999'), to_char(?,'9999999990.999'), "+
                                     "         to_char(?,'9999999990.999'),to_char(?,'9999999990.999'), "+
                                     "         to_char(?,'9999999990.999'),to_char(?,'9999999990.999') from dual  ");
       ps1.setDouble(1,sub_tot_mtd_budget_t);
       ps1.setDouble(2,sub_tot_mtd_budget_f);
       ps1.setDouble(3,sub_tot_mtd_exp_act);
       ps1.setDouble(4,sub_tot_ytd_budget_t);
       ps1.setDouble(5,sub_tot_ytd_budget_f);
       ps1.setDouble(6,sub_tot_ytd_exp_act);
       rs1 = ps1.executeQuery();

while(rs1.next()){
       ssub_tot_mtd_budget_t = rs1.getString(1);
       ssub_tot_mtd_budget_f = rs1.getString(2);
       ssub_tot_mtd_exp_act  = rs1.getString(3);
       ssub_tot_ytd_budget_t = rs1.getString(4);
       ssub_tot_ytd_budget_f = rs1.getString(5);
       ssub_tot_ytd_exp_act  = rs1.getString(6);
}
rs1.close();
ps1.close();

%>
        <tr>
                <td style="width: 30%" class="style25"><strong><%=prev_contr_matr_mkr%> Total</strong></td>
                <td style="width: 10%" class="style25"><strong>&nbsp;</strong></td>
                <td style="width: 10%" class="style26"><strong><%=ssub_tot_mtd_budget_t%></strong></td>
                <td style="width: 10%" class="style26"><strong><%=ssub_tot_mtd_budget_f%></strong></td>
                <td style="width: 10%" class="style26"><strong><%=ssub_tot_mtd_exp_act%></strong></td>
                <td style="width: 10%" class="style26"><strong><%=ssub_tot_ytd_budget_t%></strong></td>
                <td style="width: 10%" class="style26"><strong><%=ssub_tot_ytd_budget_f%></strong></td>
                <td style="width: 10%" class="style26"><strong><%=ssub_tot_ytd_exp_act%></strong></td>
        </tr>
<%
}
sub_tot_mtd_budget_t = 0.0;
sub_tot_mtd_budget_f = 0.0;
sub_tot_mtd_exp_act  = 0.0;
sub_tot_ytd_budget_t = 0.0;
sub_tot_ytd_budget_f = 0.0;
sub_tot_ytd_exp_act  = 0.0;
ssub_tot_mtd_budget_t = "0.000";
ssub_tot_mtd_budget_f = "0.000";
ssub_tot_mtd_exp_act  = "0.000";
ssub_tot_ytd_budget_t = "0.000";
ssub_tot_ytd_budget_f = "0.000";
ssub_tot_ytd_exp_act  = "0.000";
}

if(!rs.getString(1).equals(prev_gr_cd) && !prev_gr_cd.equals("99999")){

       ps1 = mk.con.prepareStatement("  select to_char(?,'9999999990.999'), to_char(?,'9999999990.999'), "+
                                     "         to_char(?,'9999999990.999'),to_char(?,'9999999990.999'), "+
                                     "         to_char(?,'9999999990.999'),to_char(?,'9999999990.999') from dual  ");
       ps1.setDouble(1,tot_mtd_budget_t);
       ps1.setDouble(2,tot_mtd_budget_f);
       ps1.setDouble(3,tot_mtd_exp_act);
       ps1.setDouble(4,tot_ytd_budget_t);
       ps1.setDouble(5,tot_ytd_budget_f);
       ps1.setDouble(6,tot_ytd_exp_act);
       rs1 = ps1.executeQuery();

while(rs1.next()){
       stot_mtd_budget_t = rs1.getString(1);
       stot_mtd_budget_f = rs1.getString(2);
       stot_mtd_exp_act  = rs1.getString(3);
       stot_ytd_budget_t = rs1.getString(4);
       stot_ytd_budget_f = rs1.getString(5);
       stot_ytd_exp_act  = rs1.getString(6);
}
rs1.close();
ps1.close();
  
%>
        <tr>
                <td style="width: 30%" class="style9"><strong><%=prev_gr_desc%> TOTAL</strong></td>
                <td style="width: 10%" class="style9"><strong>&nbsp;</strong></td>
                <td style="width: 10%" class="style10"><strong><%=stot_mtd_budget_t%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=stot_mtd_budget_f%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=stot_mtd_exp_act%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=stot_ytd_budget_t%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=stot_ytd_budget_f%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=stot_ytd_exp_act%></strong></td>
        </tr>
<%
tot_mtd_budget_t = 0.0;
tot_mtd_budget_f = 0.0;
tot_mtd_exp_act  = 0.0;
tot_ytd_budget_t = 0.0;
tot_ytd_budget_f = 0.0;
tot_ytd_exp_act  = 0.0;
stot_mtd_budget_t = "0.000";
stot_mtd_budget_f = "0.000";
stot_mtd_exp_act  = "0.000";
stot_ytd_budget_t = "0.000";
stot_ytd_budget_f = "0.000";
stot_ytd_exp_act  = "0.000";

if(prev_gr_cd.equals("8")){

       ps1 = mk.con.prepareStatement("  select to_char(?,'9999999990.999'), to_char(?,'9999999990.999'), "+
                                     "         to_char(?,'9999999990.999'),to_char(?,'9999999990.999'), "+
                                     "         to_char(?,'9999999990.999'),to_char(?,'9999999990.999') from dual  ");
       ps1.setDouble(1,spl_tot_mtd_budget_t);
       ps1.setDouble(2,spl_tot_mtd_budget_f);
       ps1.setDouble(3,spl_tot_mtd_exp_act);
       ps1.setDouble(4,spl_tot_ytd_budget_t);
       ps1.setDouble(5,spl_tot_ytd_budget_f);
       ps1.setDouble(6,spl_tot_ytd_exp_act);
       rs1 = ps1.executeQuery();

while(rs1.next()){
       spl_stot_mtd_budget_t = rs1.getString(1);
       spl_stot_mtd_budget_f = rs1.getString(2);
       spl_stot_mtd_exp_act  = rs1.getString(3);
       spl_stot_ytd_budget_t = rs1.getString(4);
       spl_stot_ytd_budget_f = rs1.getString(5);
       spl_stot_ytd_exp_act  = rs1.getString(6);
}
rs1.close();
ps1.close();
  
%>
        <tr>
                <td style="width: 30%" class="style9"><strong>TOTAL O&M EXPENSES(WITHOUT CAPEX)</strong></td>
                <td style="width: 10%" class="style9"><strong>&nbsp;</strong></td>
                <td style="width: 10%" class="style10"><strong><%=spl_stot_mtd_budget_t%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=spl_stot_mtd_budget_f%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=spl_stot_mtd_exp_act%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=spl_stot_ytd_budget_t%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=spl_stot_ytd_budget_f%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=spl_stot_ytd_exp_act%></strong></td>
        </tr>
<%
}
}
if(!rs.getString(1).equals(prev_gr_cd)){  
%>
        <tr >
                <td style="width: 30%" class="style15" colspan="10"><strong><%=rs.getString(3)%></strong></td>
        </tr>
<%
}

iSl_No = iSl_No + 1;
if( iSl_No%2 == 1){

               sStyle = "style4";
               sStyle1 = "style4";
               sStyle2 = "style17";

}else{

               sStyle = "style18";
               sStyle1 = "style18";
               sStyle2 = "style20";

}

%>
        <tr>
                <td style="width: 30%" class="<%=sStyle %>"><strong><%=bgt_hd_desc%></strong></td>
                <td style="width: 10%" class="<%=sStyle1%>"><strong><%=rs.getString(2)%></strong></td>
                <td style="width: 10%" class="<%=sStyle2%>"><strong><%=mtd_budget_t%></strong></td>
                <td style="width: 10%" class="<%=sStyle2%>"><strong><%=mtd_budget_f%></strong></td>
<%
if(Double.parseDouble(mtd_exp_act) != 0.0){
%>
                <td style="width: 10%" class="<%=sStyle2%>"><strong><a href="#" onClick="window.open('view_act_exp_dtl_datespan.jsp?finyr1=<%=finyr1%>&cur_month=<%=cur_month%>&cur_yr=<%=cur_yr%>&frm_month=<%=frm_month%>&frm_yr=<%=frm_yr%>&station=<%=station%>&dept=<%=section%>&finyr=<%=finyr%>&bgt_hd=<%=rs.getString(2)%>&empcd=<%=empcd%>&view_mkr=M&mon_basis=<%=mon_basis%>&frmdt=<%=frmdt%>&todt=<%=todt%>','_new');"><%=mtd_exp_act%></strong></td>
<%
}else{
%>
                <td style="width: 10%" class="<%=sStyle2%>"><strong><%=mtd_exp_act%></strong></td>
<%
}
%>
                <td style="width: 10%" class="<%=sStyle2%>"><strong><%=ytd_budget_t%></strong></td>
                <td style="width: 10%" class="<%=sStyle2%>"><strong><%=ytd_budget_f%></strong></td>
<%
if(Double.parseDouble(ytd_exp_act) != 0.0){
%>
                <td style="width: 10%" class="<%=sStyle2%>"><strong><a href="#" onClick="window.open('view_act_exp_dtl_datespan.jsp?finyr1=<%=finyr1%>&cur_month=<%=cur_month%>&cur_yr=<%=cur_yr%>&frm_month=<%=frm_month%>&frm_yr=<%=frm_yr%>&station=<%=station%>&dept=<%=section%>&finyr=<%=finyr%>&bgt_hd=<%=rs.getString(2)%>&empcd=<%=empcd%>&view_mkr=Y&mon_basis=<%=mon_basis%>&frmdt=<%=frmdt%>&todt=<%=todt%>','_new');"><%=ytd_exp_act%></strong></td>
<%
}else{
%>
                <td style="width: 10%" class="<%=sStyle2%>"><strong><%=ytd_exp_act%></strong></td>
<%
}
%>
        </tr>
<%
prev_gr_cd = rs.getString(1);
prev_gr_desc = rs.getString(3);
prev_contr_matr_mkr = rs.getString(4);

tot_mtd_budget_t = tot_mtd_budget_t+Double.parseDouble(mtd_budget_t);
tot_mtd_budget_f = tot_mtd_budget_f+Double.parseDouble(mtd_budget_f);
tot_mtd_exp_act  = tot_mtd_exp_act+Double.parseDouble(mtd_exp_act);
tot_ytd_budget_t = tot_ytd_budget_t+Double.parseDouble(ytd_budget_t);
tot_ytd_budget_f = tot_ytd_budget_f+Double.parseDouble(ytd_budget_f);
tot_ytd_exp_act  = tot_ytd_exp_act+Double.parseDouble(ytd_exp_act);

sub_tot_mtd_budget_t = sub_tot_mtd_budget_t+Double.parseDouble(mtd_budget_t);
sub_tot_mtd_budget_f = sub_tot_mtd_budget_f+Double.parseDouble(mtd_budget_f);
sub_tot_mtd_exp_act  = sub_tot_mtd_exp_act+Double.parseDouble(mtd_exp_act);
sub_tot_ytd_budget_t = sub_tot_ytd_budget_t+Double.parseDouble(ytd_budget_t);
sub_tot_ytd_budget_f = sub_tot_ytd_budget_f+Double.parseDouble(ytd_budget_f);
sub_tot_ytd_exp_act  = sub_tot_ytd_exp_act+Double.parseDouble(ytd_exp_act);

if(!rs.getString(1).equals("0")){

spl_tot_mtd_budget_t = spl_tot_mtd_budget_t+Double.parseDouble(mtd_budget_t);
spl_tot_mtd_budget_f = spl_tot_mtd_budget_f+Double.parseDouble(mtd_budget_f);
spl_tot_mtd_exp_act  = spl_tot_mtd_exp_act+Double.parseDouble(mtd_exp_act);
spl_tot_ytd_budget_t = spl_tot_ytd_budget_t+Double.parseDouble(ytd_budget_t);
spl_tot_ytd_budget_f = spl_tot_ytd_budget_f+Double.parseDouble(ytd_budget_f);
spl_tot_ytd_exp_act  = spl_tot_ytd_exp_act+Double.parseDouble(ytd_exp_act);

}

}
rs.close();
ps.close();

if(group.equals("1")){
       ps1 = mk.con.prepareStatement("  select to_char(?,'9999999990.999'), to_char(?,'9999999990.999'), "+
                                     "         to_char(?,'9999999990.999'),to_char(?,'9999999990.999'), "+
                                     "         to_char(?,'9999999990.999'),to_char(?,'9999999990.999') from dual  ");
       ps1.setDouble(1,sub_tot_mtd_budget_t);
       ps1.setDouble(2,sub_tot_mtd_budget_f);
       ps1.setDouble(3,sub_tot_mtd_exp_act);
       ps1.setDouble(4,sub_tot_ytd_budget_t);
       ps1.setDouble(5,sub_tot_ytd_budget_f);
       ps1.setDouble(6,sub_tot_ytd_exp_act);
       rs1 = ps1.executeQuery();

while(rs1.next()){
       ssub_tot_mtd_budget_t = rs1.getString(1);
       ssub_tot_mtd_budget_f = rs1.getString(2);
       ssub_tot_mtd_exp_act  = rs1.getString(3);
       ssub_tot_ytd_budget_t = rs1.getString(4);
       ssub_tot_ytd_budget_f = rs1.getString(5);
       ssub_tot_ytd_exp_act  = rs1.getString(6);
}
rs1.close();
ps1.close();
  
%>
        <tr>
                <td style="width: 30%" class="style25"><strong><%=prev_contr_matr_mkr%> Total</strong></td>
                <td style="width: 10%" class="style25"><strong>&nbsp;</strong></td>
                <td style="width: 10%" class="style26"><strong><%=ssub_tot_mtd_budget_t%></strong></td>
                <td style="width: 10%" class="style26"><strong><%=ssub_tot_mtd_budget_f%></strong></td>
                <td style="width: 10%" class="style26"><strong><%=ssub_tot_mtd_exp_act%></strong></td>
                <td style="width: 10%" class="style26"><strong><%=ssub_tot_ytd_budget_t%></strong></td>
                <td style="width: 10%" class="style26"><strong><%=ssub_tot_ytd_budget_f%></strong></td>
                <td style="width: 10%" class="style26"><strong><%=ssub_tot_ytd_exp_act%></strong></td>
        </tr>
<%
}
       ps1 = mk.con.prepareStatement("  select to_char(?,'9999999990.999'), to_char(?,'9999999990.999'), "+
                                     "         to_char(?,'9999999990.999'),to_char(?,'9999999990.999'), "+
                                     "         to_char(?,'9999999990.999'),to_char(?,'9999999990.999') from dual  ");
       ps1.setDouble(1,tot_mtd_budget_t);
       ps1.setDouble(2,tot_mtd_budget_f);
       ps1.setDouble(3,tot_mtd_exp_act);
       ps1.setDouble(4,tot_ytd_budget_t);
       ps1.setDouble(5,tot_ytd_budget_f);
       ps1.setDouble(6,tot_ytd_exp_act);
       rs1 = ps1.executeQuery();

while(rs1.next()){
       stot_mtd_budget_t = rs1.getString(1);
       stot_mtd_budget_f = rs1.getString(2);
       stot_mtd_exp_act  = rs1.getString(3);
       stot_ytd_budget_t = rs1.getString(4);
       stot_ytd_budget_f = rs1.getString(5);
       stot_ytd_exp_act  = rs1.getString(6);
}
rs1.close();
ps1.close();
%>
        <tr>
                <td style="width: 30%" class="style9"><strong><%= prev_gr_desc%> TOTAL</strong></td>
                <td style="width: 10%" class="style9"><strong>&nbsp;</strong></td>
                <td style="width: 10%" class="style10"><strong><%=stot_mtd_budget_t%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=stot_mtd_budget_f%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=stot_mtd_exp_act%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=stot_ytd_budget_t%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=stot_ytd_budget_f%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=stot_ytd_exp_act%></strong></td>
        </tr>
<%
if(group.equals("ALL")){

       ps1 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(amt),0),'9999999990.999') "+
                                     " from BGTM_REPO_STRUC_SPL "+
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+
                                     " and   target_floor ='T' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+
                                     " and   MM_VAL=to_char(to_date(?,'Mon'),'MM') "+
                                     " and   stn_extn is null ");

       ps1.setString(1,finyr1);
       ps1.setString(2,station);
       ps1.setString(3,section);
       ps1.setString(4,section);
       ps1.setString(5,cur_month);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  div_tot_mtd_budget_t = rs1.getString(1);
}
rs1.close();
ps1.close();
       
       ps1 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(amt),0),'9999999990.999') "+
                                     " from BGTM_REPO_STRUC_SPL "+
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+
                                     " and   target_floor ='F' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+
                                     " and   MM_VAL=to_char(to_date(?,'Mon'),'MM') "+
                                     " and   stn_extn is null ");

       ps1.setString(1,finyr1);
       ps1.setString(2,station);
       ps1.setString(3,section);
       ps1.setString(4,section);
       ps1.setString(5,cur_month);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  div_tot_mtd_budget_f = rs1.getString(1);
}
rs1.close();
ps1.close();

      ps1 = mk.con.prepareStatement(" select /*+ rule */  to_char(nvl(sum(trans_amt),0),'9999999990.999') "+
                                     " from BGTM_ACT_EXP_VIEW_SPL "+ 
                                     " where fin_yr=? "+
                                     " and   stn_name like decode(?,'ALL','%',?) "+ 
                                     " and   dept like decode(?,'ALL','%',?) and stn_extn is null "+ 
				     " and   trns_date between to_date('01-'||?||'-'||?,'DD-Mon-yyyy') and to_date(?,'DD-Mon-yyyy') "+
                                     " and   send_recv_mkr=? order by decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),dept");

       ps1.setString(1,finyr1);
       ps1.setString(2,station);
       ps1.setString(3,station);
       ps1.setString(4,section);
       ps1.setString(5,section);
       ps1.setString(6,cur_month);
       ps1.setString(7,finyr1);
       ps1.setString(8,todt);
       ps1.setString(9,mon_basis);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  div_tot_mtd_exp_act = rs1.getString(1);
}
rs1.close();
ps1.close();


       ps1 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(amt),0),'9999999990.999')  from BGTM_REPO_STRUC_SPL "+ 
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+ 
                                     " and   target_floor ='T' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+ 
                                     " and   to_date(MM_VAL||YY_VAL,'mmyy') between to_date(?||substr(?,3,2),'MMYY') and to_date(?||substr(?,3,2),'MMYY') "+
                                     " and   stn_extn is null ");
       ps1.setString(1,finyr1);
       ps1.setString(2,station);
       ps1.setString(3,section);
       ps1.setString(4,section);
       ps1.setString(5,frm_month);
       ps1.setString(6,frm_yr);
       ps1.setString(7,cur_month);
       ps1.setString(8,cur_yr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  div_tot_ytd_budget_t = rs1.getString(1);
}
rs1.close();
ps1.close();
       
       ps1 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(amt),0),'9999999990.999')  from BGTM_REPO_STRUC_SPL "+ 
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+ 
                                     " and   target_floor ='F' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+ 
                                     " and   to_date(MM_VAL||YY_VAL,'mmyy') between to_date(?||substr(?,3,2),'MMYY') and to_date(?||substr(?,3,2),'MMYY') "+
                                     " and   stn_extn is null ");
       ps1.setString(1,finyr1);
       ps1.setString(2,station);
       ps1.setString(3,section);
       ps1.setString(4,section);
       ps1.setString(5,frm_month);
       ps1.setString(6,frm_yr);
       ps1.setString(7,cur_month);
       ps1.setString(8,cur_yr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  div_tot_ytd_budget_f = rs1.getString(1);
}
rs1.close();
ps1.close();
       
      ps1 = mk.con.prepareStatement(" select /*+ rule */  to_char(nvl(sum(trans_amt),0),'9999999990.999') "+
                                     " from BGTM_ACT_EXP_VIEW_SPL "+ 
                                     " where fin_yr=? "+
                                     " and   stn_name like decode(?,'ALL','%',?) "+ 
                                     " and   dept like decode(?,'ALL','%',?) and stn_extn is null "+ 
				     " and   trns_date between to_date(?,'DD-Mon-yyyy') and to_date(?,'DD-Mon-yyyy') "+
                                     " and   send_recv_mkr=? order by decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),dept");

       ps1.setString(1,finyr1);
       ps1.setString(2,station);
       ps1.setString(3,station);
       ps1.setString(4,section);
       ps1.setString(5,section);
       ps1.setString(6,frmdt);
       ps1.setString(7,todt);
       ps1.setString(8,mon_basis);
       rs1 = ps1.executeQuery();
while(rs1.next()){
  div_tot_ytd_exp_act = rs1.getString(1);
}
rs1.close();
ps1.close();
%>
        <tr>
        <tr>
                <td style="width: 30%" class="style9"><strong>TOTAL O&M EXPENSES</strong></td>
                <td style="width: 10%" class="style9"><strong>&nbsp;</strong></td>
                <td style="width: 10%" class="style10"><strong><%=div_tot_mtd_budget_t%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=div_tot_mtd_budget_f%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=div_tot_mtd_exp_act%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=div_tot_ytd_budget_t%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=div_tot_ytd_budget_f%></strong></td>
                <td style="width: 10%" class="style10"><strong><%=div_tot_ytd_exp_act%></strong></td>
        </tr>
<%
}
%>
</table>
<br>
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