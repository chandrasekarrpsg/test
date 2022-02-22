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
	border: 1px solid #525252;
	background-color: #A3E0C1;
}
.style2 {
	font-size: medium;
	font-family: "Arial Narrow";
	color: #6F0000;
	border: 1px solid #525252;
}
.style4 {
	font-size: medium;
	font-family: "Arial Narrow";
	color: #003300;
	border: 1px solid #525252;
}
.style3 {
        text-align: center;
        color: #ffffff;
        font-family: Arial;
        font-size: 10pt;
        background-color:#008080;
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

function pro_data(){

  var parameter='';
  var stn='';
  var station=document.f1.station.value;
if(document.f1.sec_cd.value=='CTM'){
 stn= document.f1.Sstn_cd.value;
 if(document.f1.Sstn_cd.value=='B'){
   station='BUDGE BUDGE GENERATING STATION';
 }
 if(document.f1.Sstn_cd.value=='T'){
   station='TITAGARH GENERATING STATION';
 }
 if(document.f1.Sstn_cd.value=='S'){
   station='SOUTHERN GENERATING STATION';
 }
 if(document.f1.Sstn_cd.value=='N'){
   station='NEW COSSIPORE GENERATING STATION';
 }
 if(document.f1.Sstn_cd.value=='C'){
   station='CENTRAL TURBINE MAINTENANCE';
 }
}else{
 stn= document.f1.stn_cd.value;
}
   parameter = parameter + 'stn_cd='+stn;
   parameter = parameter + '&sec_cd='+document.f1.sec_cd.value;
   parameter = parameter + '&T1='+document.f1.finyr.value;
   parameter = parameter + '&username='+document.f1.empcd.value;
   parameter = parameter + '&emp_desg='+document.f1.emp_desg.value;
   parameter = parameter + '&bgt_lvl=1';
   parameter = parameter + '&stn_long_desc='+station;
//alert(parameter);
if(stn == 'B'){
window.close();
window.open("generation_budget_de_bbgs.jsp?"+parameter,"bottom");
}else{
window.close();
window.open("generation_budget_de.jsp?"+parameter,"bottom");
}
}

</script>
</head>

<body background="green1.jpg">
<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session" />

<%
  MakeConnectionGENORBL mk          = new MakeConnectionGENORBL();
  mk.con.setAutoCommit(false);

  PreparedStatement ps              = null;
  ResultSet rs                      = null;
  PreparedStatement ps1             = null;
  ResultSet rs1                     = null;
  PreparedStatement ps3             = null;
  ResultSet rs3                     = null;
  String finyr                      = new String("");
  String auth_exist                 = new String("");
  String finyr1                     = new String("");
  String stn_cd                     = new String("");
  String sec_cd                     = new String("");
  String empcd                      = loginBean.getsEmpCd();
  String sysdate                    = new String("");
  String your_desg                  = new String("");
  String station                    = new String("");
  String sStyle                     = new String("");

try{

       ps = mk.con.prepareStatement("select to_char(trunc(sysdate),'DD-MON-RRRR') from dual");
       rs = ps.executeQuery();
       while(rs.next()){
            sysdate = rs.getString(1);
       }
       rs.close();
       ps.close();

      ps = mk.con.prepareStatement(" select STATION_LONG_DESC,DEPT_SDESC "+
                                    " from ADM_EMP_MST  a,CD_STATION b ,ORBL_CD_DEPT_MST c "+
                                    " where a.emp_genstn= b.orbl_station_cd "+
                                    " and   a.emp_genstn= c.station "+
                                    " and   a.EMP_DEPT  = c.DEPT "+
                                    " and emp_code=? ");

       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            station = rs.getString(1);
            sec_cd  = rs.getString(2);
       }
       rs.close();
       ps.close();

       ps = mk.con.prepareStatement("select bgt_station_cd from cd_station where station_long_desc=?");
       ps.setString(1,station);
       rs = ps.executeQuery();
       while(rs.next()){
            stn_cd = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select distinct emp_desg from bgt_level where emp_code=?");
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
            finyr1 = rs.getString(1);
       }
       rs.close();
       ps.close();

finyr=finyr1.substring(0,4);

         ps=mk.con.prepareStatement(" SELECT count(*)"+
                                     " FROM   BGT_LEVEL "+
                                     " WHERE  emp_code = ? "+
                                     " AND    bgt_level = '1' ");
         ps.setString(1,empcd);
         rs=ps.executeQuery();

         while(rs.next()){
               auth_exist  = rs.getString(1);
         }

         rs.close();
         ps.close();


%>
<form name="f1">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:180px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="3">BUDGET ENTRY FORM FOR <%=station%> (<%=sec_cd%>) FOR FIN YEAR: <%=finyr1%></font></b>
</label>

<label style="left:50px; top:50px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>

<%
if(!auth_exist.equals("0")){

if(sec_cd.equals("CTM")){
%>
<label style="left:50px; top:110px; position: absolute" > <b>ENTRY FOR STATION : </b>
<select size="1" name="Sstn_cd" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
    <option value="B">BUDGE BUDGE GENERATING STATION</option>
    <option value="T">TITAGARH GENERATING STATION</option>
    <option value="S">SOUTHERN GENERATING STATION</option>
    <option value="N">NEW COSSIPORE GENERATING STATION</option>
    <option value="C">CENTRAL TURBINE MAINTENANCE</option>
</select>
</label>

<label style="left:450px; top:170px; position: absolute" >
<input type="button" value="Proceed" id="proceed" name="proceed" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="pro_data();">
</label>

<%
}else{
%>
<label style="left:450px; top:110px; position: absolute" >
<input type="button" value="Proceed" id="proceed" name="proceed" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="pro_data();">
</label>
<%
}
}else{
%>
<label style="left:450px; top:110px; position: absolute" >
<b><font face="Book Antiqua" color="red" size="3">Sorry you are not authorised for entry!!!</font></b>
</label>
<%
}
%>
<input type="hidden" id= "stn_cd" name = "stn_cd" value="<%=stn_cd%>" />
<input type="hidden" id= "sec_cd" name = "sec_cd" value="<%=sec_cd%>" />
<input type="hidden" id= "station" name = "station" value="<%=station%>" />
<input type="hidden" id= "finyr" name = "finyr" value="<%=finyr%>" />
<input type="hidden" id= "finyr1" name = "finyr1" value="<%=finyr1%>" />
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
<input type="hidden" id= "emp_desg" name ="emp_desg" value="<%=your_desg%>" />
<%
}catch(Exception e){
  e.printStackTrace();
}finally{
   mk.con.close();
}

%>
</body>
</html>
