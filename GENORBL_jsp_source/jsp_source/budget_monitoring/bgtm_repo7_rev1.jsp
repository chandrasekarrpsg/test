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


function submitdata(){
  var parameter='';
   parameter = parameter + 'empcd='+document.f1.empcd.value;
   parameter = parameter + '&month='+document.f1.month.value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&mon_basis='+document.f1.mon_basis.value;
   parameter = parameter + '&station='+document.f1.station.value;
   parameter = parameter + '&section='+document.f1.section.value;
   parameter = parameter + '&group='+document.f1.group.value;
//alert(parameter);
window.open("bgtm_repo7.jsp?"+parameter,"_self");
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

  PreparedStatement ps11            = null;
  ResultSet rs11                    = null;
  PreparedStatement ps12            = null;
  ResultSet rs12                    = null;
  PreparedStatement ps13            = null;
  ResultSet rs13                    = null;
  PreparedStatement ps14            = null;
  ResultSet rs14                    = null;
  PreparedStatement ps15            = null;
  ResultSet rs15                    = null;
  PreparedStatement ps16            = null;
  ResultSet rs16                    = null;

  PreparedStatement ps21            = null;
  ResultSet rs21                    = null;
  PreparedStatement ps22            = null;
  ResultSet rs22                    = null;
  PreparedStatement ps23            = null;
  ResultSet rs23                    = null;
  PreparedStatement ps24            = null;
  ResultSet rs24                    = null;
  PreparedStatement ps25            = null;
  ResultSet rs25                    = null;
  PreparedStatement ps26            = null;
  ResultSet rs26                    = null;
  MakeConnectionGENORBL mk          = null;

int iSl_No = 0;
  
  String finyr                      = new String("");
  String prev_gr_desc               = new String("");
  String finyr1                     = new String("");
  String finyr2                     = new String("");
  String month                      = new String("");
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

  String [][] ArraySmDown = new String[200][4];
  int indx = 0 ;
  int k = 0 ;

  List l1 = new ArrayList() ;
  List l2 = new ArrayList() ;
  List rows = new ArrayList() ;

  String var1 = new String() ;
  String var2 = new String() ;
  String var3 = new String() ;
  String var4 = new String() ;

try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);
     empcd     = request.getParameter("empcd");
     month     = request.getParameter("month");
     finyr     = request.getParameter("finyr");
     finyr1    = finyr.substring(0,4);
     mon_basis = request.getParameter("mon_basis");
     station   = request.getParameter("station");
     section   = request.getParameter("section");
     group     = request.getParameter("group");
     prev_gr_cd="99999";

System.out.println("empcd:"+empcd);
System.out.println("month:"+month);
System.out.println("finyr:"+finyr);
System.out.println("finyr1:"+finyr1);
System.out.println("mon_basis:"+mon_basis);
System.out.println("station:"+station);
System.out.println("section:"+section);
System.out.println("group:"+group);

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
       
       ps = mk.con.prepareStatement(" select distinct bgt_yr||'-'||to_char(add_months(to_date(bgt_yr,'YYYY'),12),'YYYY'),bgt_yr "+ 
                                    " from bgt_form2b_data where bgt_yr <>? order by bgt_yr desc ");
       ps.setString(1,finyr1);
       rs = ps.executeQuery();

%>
<form method="post" name="f1" action="bgtm_repo7.jsp">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:250px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">Budget Head wise MTD and YTD Expenditures Compared To Budget Target And Floor Values</font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
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
<%
       ps = mk.con.prepareStatement(" select station_sht_desc from cd_station "+
                                    " where station_sht_desc <> ? "+
                                    " order by decode('BBGS','1','TGS','2','SGS','3','NCGS','4','CTM','5','EDGE','E') ");
       ps.setString(1,station);
       rs = ps.executeQuery();
%>
           <td style="width: 25%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Station :&nbsp;&nbsp;&nbsp; 
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
           <td style="width: 25%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Section :&nbsp;&nbsp;&nbsp; 
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
           <td style="width: 25%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Section :&nbsp;&nbsp;&nbsp; 
           <select size="1" name="section" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
              <option selected value="ALL">ALL</option>
           </select>
           </strong></td>
<%
}
%>
<%
       ps = mk.con.prepareStatement(" select to_char(to_date(mm_val,'MM'),'Mon') "+
                                    " from  BGTM_MM_VAL_STRUCT "+
                                    " where mm_val <> to_char(to_date(?,'Mon'),'MM') "+
                                    " and  mm_val <> '13' "+
                                    " order by mm_val ");
       ps.setString(1,month);
       rs = ps.executeQuery();
%>
           <td style="width: 25%" align="left"><strong><font face="Book Antiqua" color="blue" size="3">Month :&nbsp;&nbsp;&nbsp;
           <select size="1" name="month" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
              <option selected value=<%=month%>><%=month%></option>
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
           <td style="width: 25%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Group :&nbsp;&nbsp;&nbsp;
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
           <td style="width: 25%" align="left" ><strong>
            <input type="button" value="Submit" id="submit" name="submit" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="submitdata();">
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
                <td style="width: 20%" class="style8"  colspan="12" align="middle"><strong>For Section(s) <%=section%> In <%=month_act%>, <%=finyr%> </strong></td>
        </tr>
        <tr>
                <td colspan="2" class="style8"><strong>&nbsp; </strong></td>
                <td style="width: 30%" colspan="3" class="style8"><strong>MTD</strong></td>
                <td style="width: 30%" colspan="3" class="style8"><strong>YTD</strong></td>
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
for(int i=0;i<68;i++)
{
    for(int j=0; j<4;j++)
    {
         ArraySmDown[i][j]="0";
    }
}

       ps = mk.con.prepareStatement(" select a.gr_cd,bgt_hd,gr_desc,decode(nvl(contr_matr_mkr,'@'),'M','Materials','C','Contracts',nvl(contr_matr_mkr,'@'))  "+
                                    " from  BGTM_BGT_GROUP a,BGTM_GROUP_MST b "+
				    " where a.gr_cd=b.gr_cd "+
                                    " and a.gr_cd like  decode(?,'ALL','%',?) "+
                                    " order by gr_cd,decode(CONTR_MATR_MKR,'M','1','C','2',CONTR_MATR_MKR),seq  ");
       ps.setString(1,group);
       ps.setString(2,group);
       rs = ps.executeQuery();

while(rs.next()){
/*
    ArraySmDown[indx][0]=rs.getString(1);
    ArraySmDown[indx][1]=rs.getString(2);
    ArraySmDown[indx][2]=rs.getString(3);
    ArraySmDown[indx][3]=rs.getString(4);
    indx++ ;
*/
    l2.add(rs.getString(1)) ;
    l2.add(rs.getString(2)) ;
    l2.add(rs.getString(3)) ;
    l2.add(rs.getString(4)) ;

    l1.add(l2) ;
}

rs.close() ;
ps.close() ;

//while(rs.next()){

for ( k=0; k<l1.size(); k++ ) {

     rows = (List)l1.get(k) ;

     var1 = (String)rows.get(1) ;
     var2 = (String)rows.get(2) ;
     var3 = (String)rows.get(3) ;
     var4 = (String)rows.get(4) ;
     
       ps1 = mk.con.prepareStatement(" select desc1 "+
                                     " from bgt_form2b_struc "+
                                     " where bgt_hd_rowval=? ");
       //ps1.setString(1,rs.getString(2));
       ps1.setString(1,var2);
       rs1 = ps1.executeQuery();

while(rs1.next()){
  bgt_hd_desc = rs1.getString(1);
}
rs1.close();
ps1.close();
       
System.out.println("TEST21 = " + var2 ) ;

       ps21 = mk.con.prepareStatement(" select /*+ rule */  to_char(nvl(sum(amt),0),'9999999990.999') "+
                                     " from BGTM_REPO_STRUC_SPL "+
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+
                                     " and   target_floor ='T' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+
                                     " and   BGT_HD= ? "+
                                     " and   MM_VAL=to_char(to_date(?,'Mon'),'MM') "+
                                     " and   stn_extn is null ");

       ps21.setString(1,finyr1);
       ps21.setString(2,station);
       ps21.setString(3,section);
       ps21.setString(4,section);
       //ps21.setString(5,rs.getString(2));
       ps21.setString(5,var2);
       ps21.setString(6,month);
       rs21 = ps21.executeQuery();
while(rs21.next()){
  mtd_budget_t = rs21.getString(1);
}
rs21.close();
ps21.close();

       ps22 = mk.con.prepareStatement(" select /*+ rule */  to_char(nvl(sum(amt),0),'9999999990.999') "+
                                     " from BGTM_REPO_STRUC_SPL "+
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+
                                     " and   target_floor ='F' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+
                                     " and   BGT_HD= ? "+
                                     " and   MM_VAL=to_char(to_date(?,'Mon'),'MM') "+
                                     " and   stn_extn is null ");

       ps22.setString(1,finyr1);
       ps22.setString(2,station);
       ps22.setString(3,section);
       ps22.setString(4,section);
       //ps22.setString(5,rs.getString(2));
       ps22.setString(5,var2);
       ps22.setString(6,month);
       rs22 = ps22.executeQuery();
while(rs22.next()){
  mtd_budget_f = rs22.getString(1);
}
rs22.close();
ps22.close();

       ps23 = mk.con.prepareStatement(" select /*+ rule */  to_char(nvl(sum(amt),0),'9999999990.999') "+
                                     " from BGTM_REPO_STRUC_SPL "+
                                     " where BGT_FROM=? "+ 
                                     " and   bgt_mkr='A' "+
                                     " and   BILL_REL_RECV=? "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+
                                     " and   BGT_HD=decode(?,'2a-2','2a',?) "+
                                     " and   MM_VAL=to_char(to_date(?,'Mon'),'MM') "+
                                     " and   stn_extn is null ");
       ps23.setString(1,finyr1);
       ps23.setString(2,mon_basis);
       ps23.setString(3,station);
       ps23.setString(4,section);
       ps23.setString(5,section);
       //ps23.setString(6,rs.getString(2));
       ps23.setString(6,var2);
       //ps23.setString(7,rs.getString(2));
       ps23.setString(7,var2);
       ps23.setString(8,month);
       rs23 = ps23.executeQuery();
while(rs23.next()){
  mtd_exp_act = rs23.getString(1);
}
rs23.close();
ps23.close();


       ps24 = mk.con.prepareStatement(" select /*+ rule */  to_char(nvl(sum(amt),0),'9999999990.999')  from BGTM_REPO_STRUC_SPL "+ 
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+ 
                                     " and   target_floor ='T' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+ 
                                     " and   BGT_HD= ? "+
                                     " and   to_date(MM_VAL||YY_VAL,'mmyy') between to_date('04'||substr(?,3,2),'MMYY') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(?,'Apr',substr(?,3,2),'May',substr(?,3,2),'Jun',substr(?,3,2),'Jul',substr(?,3,2),'Aug',substr(?,3,2),'Sep',substr(?,3,2),'Oct',substr(?,3,2),'Nov',substr(?,3,2),'Dec',substr(?,3,2),'Jan',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'Feb',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'Mar',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'MMYY') "+
                                     " and   stn_extn is null ");
       ps24.setString(1,finyr1);
       ps24.setString(2,station);
       ps24.setString(3,section);
       ps24.setString(4,section);
       //ps24.setString(5,rs.getString(2));
       ps24.setString(5,var2);
       ps24.setString(6,finyr1);
       ps24.setString(7,month);
       ps24.setString(8,month);
       ps24.setString(9,finyr1);
       ps24.setString(10,finyr1);
       ps24.setString(11,finyr1);
       ps24.setString(12,finyr1);
       ps24.setString(13,finyr1);
       ps24.setString(14,finyr1);
       ps24.setString(15,finyr1);
       ps24.setString(16,finyr1);
       ps24.setString(17,finyr1);
       ps24.setString(18,finyr1);
       ps24.setString(19,finyr1);
       ps24.setString(20,finyr1);
       rs24 = ps24.executeQuery();
while(rs24.next()){
  ytd_budget_t = rs24.getString(1);
}
rs24.close();
ps24.close();
       
       ps25 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(amt),0),'9999999990.999')  from BGTM_REPO_STRUC_SPL "+ 
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+ 
                                     " and   target_floor ='F' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+ 
                                     " and   BGT_HD= ? "+ 
                                     " and   to_date(MM_VAL||YY_VAL,'mmyy') between to_date('04'||substr(?,3,2),'MMYY') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(?,'Apr',substr(?,3,2),'May',substr(?,3,2),'Jun',substr(?,3,2),'Jul',substr(?,3,2),'Aug',substr(?,3,2),'Sep',substr(?,3,2),'Oct',substr(?,3,2),'Nov',substr(?,3,2),'Dec',substr(?,3,2),'Jan',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'Feb',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'Mar',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'MMYY') "+
                                     " and   stn_extn is null ");
       ps25.setString(1,finyr1);
       ps25.setString(2,station);
       ps25.setString(3,section);
       ps25.setString(4,section);
       //ps25.setString(5,rs.getString(2));
       ps25.setString(5,var2);
       ps25.setString(6,finyr1);
       ps25.setString(7,month);
       ps25.setString(8,month);
       ps25.setString(9,finyr1);
       ps25.setString(10,finyr1);
       ps25.setString(11,finyr1);
       ps25.setString(12,finyr1);
       ps25.setString(13,finyr1);
       ps25.setString(14,finyr1);
       ps25.setString(15,finyr1);
       ps25.setString(16,finyr1);
       ps25.setString(17,finyr1);
       ps25.setString(18,finyr1);
       ps25.setString(19,finyr1);
       ps25.setString(20,finyr1);
       rs25 = ps25.executeQuery();
while(rs25.next()){
  ytd_budget_f = rs25.getString(1);
}
rs25.close();
ps25.close();
       
       ps26 = mk.con.prepareStatement(" select /*+ rule */  to_char(nvl(sum(amt),0),'9999999990.999')  from BGTM_REPO_STRUC_SPL "+ 
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='A' "+ 
                                     " and   BILL_REL_RECV =? "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+ 
                                     " and   BGT_HD= decode(?,'2a-2','2a',?) "+ 
                                     " and   to_date(MM_VAL||YY_VAL,'mmyy') between to_date('04'||substr(?,3,2),'MMYY') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(?,'Apr',substr(?,3,2),'May',substr(?,3,2),'Jun',substr(?,3,2),'Jul',substr(?,3,2),'Aug',substr(?,3,2),'Sep',substr(?,3,2),'Oct',substr(?,3,2),'Nov',substr(?,3,2),'Dec',substr(?,3,2),'Jan',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'Feb',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'Mar',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'MMYY') "+
                                     " and   stn_extn is null ");
       ps26.setString(1,finyr1);
       ps26.setString(2,mon_basis);
       ps26.setString(3,station);
       ps26.setString(4,section);
       ps26.setString(5,section);
       //ps26.setString(6,rs.getString(2));
       ps26.setString(6,var2);
       //ps26.setString(7,rs.getString(2));
       ps26.setString(7,var2);
       ps26.setString(8,finyr1);
       ps26.setString(9,month);
       ps26.setString(10,month);
       ps26.setString(11,finyr1);
       ps26.setString(12,finyr1);
       ps26.setString(13,finyr1);
       ps26.setString(14,finyr1);
       ps26.setString(15,finyr1);
       ps26.setString(16,finyr1);
       ps26.setString(17,finyr1);
       ps26.setString(18,finyr1);
       ps26.setString(19,finyr1);
       ps26.setString(20,finyr1);
       ps26.setString(21,finyr1);
       ps26.setString(22,finyr1);
       rs26 = ps26.executeQuery();
while(rs26.next()){
  ytd_exp_act = rs26.getString(1);
}
rs26.close();
ps26.close();

//if(!rs.getString(4).equals(prev_contr_matr_mkr) ){
if(!var4.equals(prev_contr_matr_mkr) ){

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

//if(!rs.getString(1).equals(prev_gr_cd) && !prev_gr_cd.equals("99999")){
if(!var1.equals(prev_gr_cd) && !prev_gr_cd.equals("99999")){

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
//if(!rs.getString(1).equals(prev_gr_cd)){  
if(!var1.equals(prev_gr_cd)){  
%>
        <tr >
                <td style="width: 30%" class="style15" colspan="10"><strong><%=var3%></strong></td>
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
                <td style="width: 10%" class="<%=sStyle1%>"><strong><%=var2%></strong></td>
                <td style="width: 10%" class="<%=sStyle2%>"><strong><%=mtd_budget_t%></strong></td>
                <td style="width: 10%" class="<%=sStyle2%>"><strong><%=mtd_budget_f%></strong></td>
<%
if(Double.parseDouble(mtd_exp_act) != 0.0){
%>
                <td style="width: 10%" class="<%=sStyle2%>"><strong><a href="#" onClick="window.open('view_act_exp_dtl.jsp?finyr1=<%=finyr1%>&month=<%=month%>&station=<%=station%>&dept=<%=section%>&finyr=<%=finyr%>&bgt_hd=<%=var2%>&empcd=<%=empcd%>&view_mkr=M&mon_basis=<%=mon_basis%>','_new');"><%=mtd_exp_act%></strong></td>
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
                <td style="width: 10%" class="<%=sStyle2%>"><strong><a href="#" onClick="window.open('view_act_exp_dtl.jsp?finyr1=<%=finyr1%>&month=<%=month%>&station=<%=station%>&dept=<%=section%>&finyr=<%=finyr%>&bgt_hd=<%=var2%>&empcd=<%=empcd%>&view_mkr=Y&mon_basis=<%=mon_basis%>','_new');"><%=ytd_exp_act%></strong></td>
<%
}else{
%>
                <td style="width: 10%" class="<%=sStyle2%>"><strong><%=ytd_exp_act%></strong></td>
<%
}
%>
        </tr>
<%
/*
prev_gr_cd = rs.getString(1);
prev_gr_desc = rs.getString(3);
prev_contr_matr_mkr = rs.getString(4);
*/
prev_gr_cd = var1 ;
prev_gr_desc = var3 ;
prev_contr_matr_mkr = var4 ;

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

//if(!rs.getString(1).equals("0")){
if(!var1.equals("0")){

spl_tot_mtd_budget_t = spl_tot_mtd_budget_t+Double.parseDouble(mtd_budget_t);
spl_tot_mtd_budget_f = spl_tot_mtd_budget_f+Double.parseDouble(mtd_budget_f);
spl_tot_mtd_exp_act  = spl_tot_mtd_exp_act+Double.parseDouble(mtd_exp_act);
spl_tot_ytd_budget_t = spl_tot_ytd_budget_t+Double.parseDouble(ytd_budget_t);
spl_tot_ytd_budget_f = spl_tot_ytd_budget_f+Double.parseDouble(ytd_budget_f);
spl_tot_ytd_exp_act  = spl_tot_ytd_exp_act+Double.parseDouble(ytd_exp_act);

}

}
//rs.close();
//ps.close();

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

       ps11 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(amt),0),'9999999990.999') "+
                                     " from BGTM_REPO_STRUC_SPL "+
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+
                                     " and   target_floor ='T' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+
                                     " and   MM_VAL=to_char(to_date(?,'Mon'),'MM') "+
                                     " and   stn_extn is null ");

       ps11.setString(1,finyr1);
       ps11.setString(2,station);
       ps11.setString(3,section);
       ps11.setString(4,section);
       ps11.setString(5,month);
       rs11 = ps11.executeQuery();
while(rs11.next()){
  div_tot_mtd_budget_t = rs11.getString(1);
}
rs11.close();
ps11.close();
       
       ps12 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(amt),0),'9999999990.999') "+
                                     " from BGTM_REPO_STRUC_SPL "+
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+
                                     " and   target_floor ='F' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+
                                     " and   MM_VAL=to_char(to_date(?,'Mon'),'MM') "+
                                     " and   stn_extn is null ");

       ps12.setString(1,finyr1);
       ps12.setString(2,station);
       ps12.setString(3,section);
       ps12.setString(4,section);
       ps12.setString(5,month);
       rs12 = ps12.executeQuery();
while(rs12.next()){
  div_tot_mtd_budget_f = rs12.getString(1);
}
rs12.close();
ps12.close();

       ps13 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(amt),0),'9999999990.999') "+
                                     " from BGTM_REPO_STRUC_SPL "+
                                     " where BGT_FROM=? "+ 
                                     " and   bgt_mkr='A' "+
                                     " and   BILL_REL_RECV=? "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+
                                     " and   MM_VAL=to_char(to_date(?,'Mon'),'MM') "+
                                     " and   stn_extn is null ");
       ps13.setString(1,finyr1);
       ps13.setString(2,mon_basis);
       ps13.setString(3,station);
       ps13.setString(4,section);
       ps13.setString(5,section);
       ps13.setString(6,month);
       rs13 = ps13.executeQuery();
while(rs13.next()){
  div_tot_mtd_exp_act = rs13.getString(1);
}
rs13.close();
ps13.close();


       ps14 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(amt),0),'9999999990.999')  from BGTM_REPO_STRUC_SPL "+ 
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+ 
                                     " and   target_floor ='T' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+ 
                                     " and   to_date(MM_VAL||YY_VAL,'mmyy') between to_date('04'||substr(?,3,2),'MMYY') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(?,'Apr',substr(?,3,2),'May',substr(?,3,2),'Jun',substr(?,3,2),'Jul',substr(?,3,2),'Aug',substr(?,3,2),'Sep',substr(?,3,2),'Oct',substr(?,3,2),'Nov',substr(?,3,2),'Dec',substr(?,3,2),'Jan',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'Feb',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'Mar',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'MMYY') "+
                                     " and   stn_extn is null ");
       ps14.setString(1,finyr1);
       ps14.setString(2,station);
       ps14.setString(3,section);
       ps14.setString(4,section);
       ps14.setString(5,finyr1);
       ps14.setString(6,month);
       ps14.setString(7,month);
       ps14.setString(8,finyr1);
       ps14.setString(9,finyr1);
       ps14.setString(10,finyr1);
       ps14.setString(11,finyr1);
       ps14.setString(12,finyr1);
       ps14.setString(13,finyr1);
       ps14.setString(14,finyr1);
       ps14.setString(15,finyr1);
       ps14.setString(16,finyr1);
       ps14.setString(17,finyr1);
       ps14.setString(18,finyr1);
       ps14.setString(19,finyr1);
       rs14 = ps14.executeQuery();
while(rs14.next()){
  div_tot_ytd_budget_t = rs14.getString(1);
}
rs14.close();
ps14.close();
       
       ps15 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(amt),0),'9999999990.999')  from BGTM_REPO_STRUC_SPL "+ 
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='B' "+ 
                                     " and   target_floor ='F' "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+ 
                                     " and   to_date(MM_VAL||YY_VAL,'mmyy') between to_date('04'||substr(?,3,2),'MMYY') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(?,'Apr',substr(?,3,2),'May',substr(?,3,2),'Jun',substr(?,3,2),'Jul',substr(?,3,2),'Aug',substr(?,3,2),'Sep',substr(?,3,2),'Oct',substr(?,3,2),'Nov',substr(?,3,2),'Dec',substr(?,3,2),'Jan',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'Feb',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'Mar',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'MMYY') "+
                                     " and   stn_extn is null ");
       ps15.setString(1,finyr1);
       ps15.setString(2,station);
       ps15.setString(3,section);
       ps15.setString(4,section);
       ps15.setString(5,finyr1);
       ps15.setString(6,month);
       ps15.setString(7,month);
       ps15.setString(8,finyr1);
       ps15.setString(9,finyr1);
       ps15.setString(10,finyr1);
       ps15.setString(11,finyr1);
       ps15.setString(12,finyr1);
       ps15.setString(13,finyr1);
       ps15.setString(14,finyr1);
       ps15.setString(15,finyr1);
       ps15.setString(16,finyr1);
       ps15.setString(17,finyr1);
       ps15.setString(18,finyr1);
       ps15.setString(19,finyr1);
       rs15 = ps15.executeQuery();
while(rs15.next()){
  div_tot_ytd_budget_f = rs15.getString(1);
}
rs15.close();
ps15.close();
       
       ps16 = mk.con.prepareStatement(" select /*+ rule */ to_char(nvl(sum(amt),0),'9999999990.999')  from BGTM_REPO_STRUC_SPL "+ 
                                     " where BGT_FROM = ? "+ 
                                     " and   bgt_mkr='A' "+ 
                                     " and   BILL_REL_RECV =? "+
                                     " and   STN_CD like decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E','ALL','%') "+ 
                                     " and   SEC_CD like decode(?,'ALL','%',?) "+ 
                                     " and   to_date(MM_VAL||YY_VAL,'mmyy') between to_date('04'||substr(?,3,2),'MMYY') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(?,'Apr',substr(?,3,2),'May',substr(?,3,2),'Jun',substr(?,3,2),'Jul',substr(?,3,2),'Aug',substr(?,3,2),'Sep',substr(?,3,2),'Oct',substr(?,3,2),'Nov',substr(?,3,2),'Dec',substr(?,3,2),'Jan',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'Feb',to_char(add_months(to_date(?,'YYYY'),12),'YY'),'Mar',to_char(add_months(to_date(?,'YYYY'),12),'YY')),'MMYY') "+
                                     " and   stn_extn is null ");
       ps16.setString(1,finyr1);
       ps16.setString(2,mon_basis);
       ps16.setString(3,station);
       ps16.setString(4,section);
       ps16.setString(5,section);
       ps16.setString(6,finyr1);
       ps16.setString(7,month);
       ps16.setString(8,month);
       ps16.setString(9,finyr1);
       ps16.setString(10,finyr1);
       ps16.setString(11,finyr1);
       ps16.setString(12,finyr1);
       ps16.setString(13,finyr1);
       ps16.setString(14,finyr1);
       ps16.setString(15,finyr1);
       ps16.setString(16,finyr1);
       ps16.setString(17,finyr1);
       ps16.setString(18,finyr1);
       ps16.setString(19,finyr1);
       ps16.setString(20,finyr1);
       rs16 = ps16.executeQuery();
while(rs16.next()){
  div_tot_ytd_exp_act = rs16.getString(1);
}
rs16.close();
ps16.close();
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
