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


function enable_btn(str,str1,str2,str3,str4,str5){
if(str != '0'){
   if(str1 !='0'){
    for(var j=1;j<14;j++){
      if(j == parseInt(str5)){
        document.getElementById("B"+j).disabled=false;
      }
    }
   }
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

function popl_bgt_head(obj,str) {

var xmldiffrnciator = Math.floor(Math.random() * 100000);
var params = "stn_cd="+str;
params += "&xmldiffrnciator="+xmldiffrnciator;
var url = "popl_bgt_head.jsp";
http.open("POST", url, true);
http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http.onreadystatechange = function()
   {
        if(http.readyState == 4 && http.status == 200)
        {
             var results = http.responseText.split("~");
              obj.options.length=0;
              var opt2=document.createElement("option")
              opt2.text='SELECT';
              opt2.value='0';
              obj.add(opt2);

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


function add_rows(){
table = document.getElementById("mytable") ;
i = table.rows.length ;
y = parseInt(i)-2;
cnt = parseInt(y)+1;
tr = table.insertRow(parseInt(i,10));

td = tr.insertCell(tr.cells.length);
td.innerHTML = "<input type='text' id='srl_no"+cnt+"' name='srl_no"+cnt+"' value='' size='4' maxlength='2'/> ";
td = tr.insertCell(tr.cells.length);
td.innerHTML = "<select size='1' name='bgt_head"+cnt+"' id='bgt_head"+cnt+"' style='font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold' onClick=''/></select>";
td = tr.insertCell(tr.cells.length);
td.innerHTML = "<input type='text' id='amt"+cnt+"' name='amt"+cnt+"' value='' size='15' maxlength='12'/> ";
td = tr.insertCell(tr.cells.length);
td.innerHTML = "<input type='text' id='desc"+cnt+"' name='desc"+cnt+"' value='' size='100' maxlength='100'/> ";
popl_bgt_head(document.getElementById("bgt_head"+cnt),document.f1.stn_cd.value);

}

function sv_data(){
table = document.getElementById("mytable") ;
i = table.rows.length ;
var rowcnt=parseInt(i)-2;
var srlset='';
var bgthdset ='';
var amtset='';
var descset='';
var y=0;
var cursrl='';
var curbgthd='';
var curamt='';
var curdesc='';
var curdesc1='';

for (var z=1;z<=parseInt(rowcnt);z++) {

cursrl   = document.getElementById("srl_no"+z).value;
curbgthd = document.getElementById("bgt_head"+z).value;
curamt   = document.getElementById("amt"+z).value;
curdesc  = document.getElementById("desc"+z).value;

if(document.getElementById("srl_no"+z).value == ''){
   cursrl='@';
}
if(document.getElementById("bgt_head"+z).value == ''){
   curbgthd='@';
}
if(document.getElementById("amt"+z).value == ''){
   curamt='@';
}
if(document.getElementById("desc"+z).value == ''){
   curdesc='@';
}

curdesc1=ReplaceAll(curdesc,'&','amperssion');
curdesc=ReplaceAll(curdesc1,'%','percentspl');

   srlset   = srlset+cursrl+'|';
   bgthdset = bgthdset+curbgthd+'|';
   amtset   = amtset+curamt+'|';
   descset  = descset+curdesc+'|';

if(document.getElementById("srl_no"+z).value!=''){
  y++;
  if(document.getElementById("bgt_head"+z).value=='SELECT'){
         alert('Please Select Budget Head.');
         document.getElementById("bgt_head"+z).focus();
         return false;
  }
  if(document.getElementById("amt"+z).value==''){
         alert('Please Specify Amount.');
         document.getElementById("amt"+z).focus();
         document.getElementById("amt"+z).select();
         return false;
  }
  if(parseFloat(document.getElementById("amt"+z).value-0)==0){
         alert('Amount cannot Be Zero.');
         document.getElementById("amt"+z).focus();
         document.getElementById("amt"+z).select();
         return false;
  }
  if(!isPosInt(document.getElementById("amt"+z).value)){
         alert('Amount Should Be Numeric.');
         document.getElementById("amt"+z).focus();
         document.getElementById("amt"+z).select();
         return false;
  }
  if(document.getElementById("desc"+z).value==''){
         alert('Please Specify Description.');
         document.getElementById("desc"+z).focus();
         document.getElementById("desc"+z).select();
         return false;
  }

}

}
if(y==0){
    alert('Please Specify Atleast 1 Record With Serial Number For Insertion.');
    return false;
}else{
  var parameter='';
   parameter = parameter + 'stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&sec_cd='+document.f1.sec_cd.value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
   parameter = parameter + '&stn_long_desc='+document.f1.stn_long_desc.value;
   parameter = parameter + '&bgt_lvl='+document.f1.bgt_lvl.value;
   parameter = parameter + '&bgt_ver=1';
   parameter = parameter + '&srlset='+srlset;
   parameter = parameter + '&bgthdset='+bgthdset;
   parameter = parameter + '&amtset='+amtset;
   parameter = parameter + '&descset='+descset;
   parameter = parameter + '&counter='+rowcnt;
  // alert(parameter);
   window.open("gen_spec_notes_insrt.jsp?"+parameter,"_self");

}
}

</script>
</head>

<body background="green1.jpg">

<%

  PreparedStatement ps              = null;
  ResultSet rs                      = null;
  PreparedStatement ps1             = null;
  ResultSet rs1                     = null;
  PreparedStatement ps2             = null;
  ResultSet rs2                     = null;
  MakeConnectionGENORBL mk          = null;
  String finyr                      = new String("");
  String stn_sht_desc               = new String("");
  String stn_sht_desc1              = new String("");
  String stn_sht_desc2              = new String("");
  String finyr1                     = new String("");
  String stn_cd                     = new String("");
  String sec_cd                     = new String("");
  String sec_cd_spl                 = new String("");
  String section                    = new String("");
  String empcd                      = new String("");
  String sysdate                    = new String("");
  String your_desg                  = new String("");
  String station                    = new String("");
  String rmks                       = new String("");
  String sStyle                     = new String("");
  String cur_bgt_ver                = new String("");
  String notes_exist                = new String("");
  String bgt_lvl                    = new String("");
  String edit_auth                  = new String("");
  String emp_bgt_lvl                = new String("");
  String tot_amt                    = new String("");
  String tot_amt_gen                = new String("");
  String prev_stn_cd                = new String("");

  int cnt=1;
  int counter=0;
try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);
     finyr   = request.getParameter("finyr");
     finyr1  = request.getParameter("finyr1");
     empcd   = request.getParameter("username");
     stn_cd  = request.getParameter("stn_cd");
     sec_cd  = request.getParameter("sec_cd");
     station = request.getParameter("stn_long_desc");
     bgt_lvl = request.getParameter("bgt_lvl");
     section = sec_cd;
     prev_stn_cd = "B";

System.out.println("finyr:"+finyr);
System.out.println("finyr1:"+finyr1);
System.out.println("empcd:"+empcd);
System.out.println("stn_cd:"+stn_cd);
System.out.println("sec_cd:"+sec_cd);
System.out.println("station:"+station);
System.out.println("bgt_level:"+bgt_lvl);

if(section.equals("DGM1")){
  section =" UNDER DGM(I) ";
}
if(section.equals("DGM2")){
  section =" UNDER DGM(II) ";
}
if(section.equals("#")){

       ps = mk.con.prepareStatement("select distinct emp_desg from bgt_level where emp_code=?");
       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            section = rs.getString(1);
       }
       rs.close();
       ps.close();

 section = "UNDER "+section;

       ps = mk.con.prepareStatement("select distinct sec_cd from bgt_level where emp_code=? and sec_cd<>'STN' and stn_cd=? ");
       ps.setString(1,empcd);
       ps.setString(2,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            sec_cd_spl = sec_cd_spl+"#"+rs.getString(1);
       }
       rs.close();
       ps.close();

             sec_cd_spl=sec_cd_spl.substring(1);
}
     
     //finyr   = "2013";
     //finyr1  = "2013 - 2014";
     //empcd   = "000005";
     //stn_cd  = "B";
     //sec_cd  = "CTM";
     //station = "BUDGE BUDGE GENERATING STATION";
     //bgt_lvl = "2";

System.out.println("bgt_lvl:"+bgt_lvl);
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
       
       ps = mk.con.prepareStatement("select distinct bgt_level from bgt_level where emp_code=?");
       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            emp_bgt_lvl = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select count(*) from bgt_level where stn_cd=? and sec_cd=? and emp_code=? and bgt_level='1'");
       ps.setString(1,stn_cd);
       ps.setString(2,sec_cd);
       ps.setString(3,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            edit_auth = rs.getString(1);
       }
       rs.close();
       ps.close();

if(stn_cd.equals("A")){
            stn_sht_desc = "GENERATION DIVISION";
}else{
       ps = mk.con.prepareStatement("select station_sht_desc from cd_station where bgt_station_cd=?");
       ps.setString(1,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            stn_sht_desc = rs.getString(1);
       }
       rs.close();
       ps.close();
}
%>
<form name="f1">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:250px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="3">NOTES FOR SECTION(S) <%=section%>(<%=stn_sht_desc%>) FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>
<br>
<%
if(stn_cd.equals("B")){
%>
<table style="width: 100%" border="0">
        <tr>
<%
if(sec_cd.equals("#")){
System.out.println("sec_cd_spl:"+sec_cd_spl);
%>
                <td style="width: 20%"  colspan="7" align="right" size="4"><strong><a href="#" onClick="window.open('generation_budget_de_bbgs_temp.jsp?stn_cd=<%=stn_cd%>&T1=<%=finyr%>&emp_desg=<%=your_desg%>&username=<%=empcd%>&bgt_lvl=2&stn_long_desc=<%=station%>','_self');">Back</strong></font></b></strong></td>
<%
}else if(sec_cd.equals("ALL")){
%>
                <td style="width: 20%"  colspan="7" align="right" size="4"><strong><a href="#" onClick="window.open('generation_budget_de_new.jsp?stn_cd=<%=stn_cd%>&sec_cd=<%=sec_cd%>&T1=<%=finyr%>&emp_desg=<%=your_desg%>&username=<%=empcd%>&bgt_lvl=1&stn_long_desc=<%=station%>','_self');">Back</strong></font></b></strong></td>
<%
}else{
%>
                <td style="width: 20%"  colspan="7" align="right" size="4"><strong><a href="#" onClick="window.open('generation_budget_de_bbgs.jsp?stn_cd=<%=stn_cd%>&sec_cd=<%=sec_cd%>&T1=<%=finyr%>&emp_desg=<%=your_desg%>&username=<%=empcd%>&bgt_lvl=1&stn_long_desc=<%=station%>','_self');">Back</strong></font></b></strong></td>
<%
}
%>
        </tr>
</table>
<%
}else{
%>
<table style="width: 100%" border="0">
        <tr>
<%
if(sec_cd.equals("#")){
System.out.println("sec_cd_spl:"+sec_cd_spl);
%>
                <td style="width: 20%"  colspan="7" align="right" size="4"><strong><a href="#" onClick="window.open('generation_budget_de_new_temp.jsp?stn_cd=<%=stn_cd%>&T1=<%=finyr%>&emp_desg=<%=your_desg%>&username=<%=empcd%>&bgt_lvl=2&stn_long_desc=<%=station%>','_self');">Back</strong></font></b></strong></td>
<%
}else{
%>
                <td style="width: 20%"  colspan="7" align="right" size="4"><strong><a href="#" onClick="window.open('generation_budget_de_new.jsp?stn_cd=<%=stn_cd%>&sec_cd=<%=sec_cd%>&T1=<%=finyr%>&emp_desg=<%=your_desg%>&username=<%=empcd%>&bgt_lvl=1&stn_long_desc=<%=station%>','_self');">Back</strong></font></b></strong></td>
<%
}
%>
        </tr>
</table>
<%
}
if(bgt_lvl.equals("1") && !edit_auth.equals("0")){
%>
<table id="mytable" style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style3"  colspan="7" align="middle"><strong>NOTES ENTRY</strong></td>
        </tr>

        <tr>
                <td style="width: 10%" class="style3"><strong>SL NO <font color="red" size="5"> *</font></strong></td>
                <td style="width: 15%" class="style3"><strong>BUDGET HEAD</strong></td>
                <td style="width: 15%" class="style3"><strong>AMT(RS. Lakhs)</strong></td>
                <td style="width: 60%" class="style3"><strong>DESCRIPTION</strong></td>
        </tr>
<%
       ps = mk.con.prepareStatement(" select count(*) "+ 
                                    " from BGT_ADDL_DATA "+ 
                                    " where stn_cd=? and sec_cd=? and bgt_yr=? ");
       ps.setString(1,stn_cd);
       ps.setString(2,sec_cd);
       ps.setString(3,finyr);
       rs = ps.executeQuery();

while(rs.next()){
   notes_exist=rs.getString(1);
}
if(!notes_exist.equals("0")){
       ps1 = mk.con.prepareStatement(" select SRL_NO,BGT_HD,to_char(AMT,'9999990.999'),BGT_DESC "+ 
                                    " from BGT_ADDL_DATA "+ 
                                    " where stn_cd=? and sec_cd=? and bgt_yr=? order by srl_no ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,sec_cd);
       ps1.setString(3,finyr);
       rs1 = ps1.executeQuery();

while(rs1.next()){
%>
<tr>
<%
counter=counter+1;
%>
                <td style="width: 10%" align="left" class="style5" ><strong><input type="text" id="srl_no<%=counter%>" name="srl_no<%=counter%>" value="<%=rs1.getString(1)%>" size="4" maxlength="2"/></strong></td>
<%
if(stn_cd.equals("B")){
       ps = mk.con.prepareStatement(" select distinct BGT_SUBHD_ROWVAL,BGT_HD_ROWORDER, BGT_GRP_ROWORDER, BGT_SUBHD_ROWORDER "+ 
                                    " from BGT_FORM2B_STRUC_BBGS "+ 
                                    " where nvl(BGT_SUBHD_ROWVAL,' ')<>' ' "+
                                    " order by BGT_HD_ROWORDER, BGT_GRP_ROWORDER, BGT_SUBHD_ROWORDER ");
       rs = ps.executeQuery();
}else{
       ps = mk.con.prepareStatement(" select distinct BGT_HD_ROWVAL,SL_NO_ROWORDER,BGT_HD_ROWORDER "+ 
                                    " from BGT_FORM2B_STRUC where nvl(BGT_HD_ROWVAL,' ')<>' ' "+
                                    " order by SL_NO_ROWORDER,BGT_HD_ROWORDER ");
       rs = ps.executeQuery();
}
%>
                <td style="width: 15%" align="left" class="style5" ><strong><select size="1" name="bgt_head<%=counter%>" id="bgt_head<%=counter%>" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
<option selected value="<%=rs1.getString(2)%>"><%=rs1.getString(2)%></option>
<%
while(rs.next()){
%>
<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
<%
}
ps.close();
rs.close();
%>
</select>
</strong></td>
                <td style="width: 15%" align="right" class="style5" ><strong><input type="text" id="amt<%=counter%>" name="amt<%=counter%>" value="<%=rs1.getString(3).trim()%>"  style="text-align:right" size="15" maxlength="12"/></strong></td>
                <td style="width: 60%" align="left" class="style5" ><strong><input type="text" id="desc<%=counter%>" name="desc<%=counter%>" value="<%=rs1.getString(4)%>" size="100" maxlength="100"/></strong></td>
        </tr>
<%
}
rs1.close();
ps1.close();
}else{
%>
<tr>
<%
counter=counter+1;
%>
                <td style="width: 10%" align="left" class="style5" ><strong><input type="text" id="srl_no<%=counter%>" name="srl_no<%=counter%>" value="" size="4" maxlength="2"/></strong></td>
<%
if(stn_cd.equals("B")){
       ps = mk.con.prepareStatement(" select distinct BGT_SUBHD_ROWVAL,BGT_HD_ROWORDER,BGT_GRP_ROWORDER,BGT_SUBHD_ROWORDER "+ 
                                    " from BGT_FORM2B_STRUC_BBGS "+ 
                                    " where nvl(BGT_SUBHD_ROWVAL,' ')<>' ' "+
                                    " order by BGT_HD_ROWORDER, BGT_GRP_ROWORDER, BGT_SUBHD_ROWORDER ");
       rs = ps.executeQuery();
}else{
       ps = mk.con.prepareStatement(" select distinct BGT_HD_ROWVAL,SL_NO_ROWORDER,BGT_HD_ROWORDER "+ 
                                    " from BGT_FORM2B_STRUC where nvl(BGT_HD_ROWVAL,' ')<>' ' "+
                                    " order by SL_NO_ROWORDER,BGT_HD_ROWORDER ");
       rs = ps.executeQuery();
}
%>
                <td style="width: 15%" align="left" class="style5" ><strong><select size="1" name="bgt_head<%=counter%>" id="bgt_head<%=counter%>" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
<option selected value="SELECT">SELECT</option>
<%
while(rs.next()){
%>
<option value="<%=rs.getString(1)%>"><%=rs.getString(1)%></option>
<%
}
ps.close();
rs.close();
%>
</select>
</strong></td>
                <td style="width: 15%" align="center" class="style5" ><strong><input type="text" id="amt<%=counter%>" name="amt<%=counter%>" value="" size="15" maxlength="12"/></strong></td>
                <td style="width: 60%" align="center" class="style5" ><strong><input type="text" id="desc<%=counter%>" name="desc<%=counter%>" value="" size="100" maxlength="100"/></strong></td>
        </tr>
<%
}
%>
</table>
<br>
<table style="width: 100%" border="0">
<tr>
<td align="center">
<input type="button" value="ADD ROW" id="add_new_row" name="add_new_row" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="add_rows();">&nbsp;&nbsp;&nbsp;<input type="button" value="SAVE" id="save" name="save" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="sv_data();">
</td>
</tr>
</table>
<%
}else{
System.out.println("kkkklllllhere");
if(sec_cd.equals("ALL")){

if(stn_cd.equals("A")){
       ps = mk.con.prepareStatement(" select count(*) "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd in ('B','T','S','N','C','E') and sec_cd in (select distinct sec_cd from bgt_cd_section) "+ 
                                     " and bgt_yr=? order by srl_no ");
       ps.setString(1,finyr);
       rs = ps.executeQuery();

while(rs.next()){
   notes_exist=rs.getString(1);
}
rs.close();
ps.close();
}else{
       ps = mk.con.prepareStatement(" select count(*) "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? and sec_cd in (select distinct sec_cd from bgt_cd_section where stn_cd=?) "+ 
                                     " and bgt_yr=? order by srl_no ");
       ps.setString(1,stn_cd);
       ps.setString(2,stn_cd);
       ps.setString(3,finyr);
       rs = ps.executeQuery();

while(rs.next()){
   notes_exist=rs.getString(1);
}
rs.close();
ps.close();
}
}else if(sec_cd.equals("DGM1") || sec_cd.equals("DGM2")){
       ps = mk.con.prepareStatement(" select count(*) "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? "+ 
                                     " and sec_cd in (select distinct sec_cd from bgt_level where emp_desg=decode(?,'DGM1','DGM(I)-BBGS','DGM2','DGM(II)-BBGS')) "+ 
                                     " and bgt_yr=? order by srl_no ");
       ps.setString(1,stn_cd);
       ps.setString(2,sec_cd);
       ps.setString(3,finyr);
       rs = ps.executeQuery();

while(rs.next()){
   notes_exist=rs.getString(1);
}
rs.close();
ps.close();

}else if(sec_cd.equals("#")){

       ps = mk.con.prepareStatement(" select count(*) "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? "+ 
                                     " and sec_cd in (select distinct sec_cd from bgt_level where emp_code=? and sec_cd<>'STN' and stn_cd=?) "+ 
                                     " and bgt_yr=? order by srl_no ");
       ps.setString(1,stn_cd);
       ps.setString(2,empcd);
       ps.setString(3,stn_cd);
       ps.setString(4,finyr);
       rs = ps.executeQuery();

while(rs.next()){
   notes_exist=rs.getString(1);
}
rs.close();

}else{
       ps = mk.con.prepareStatement(" select count(*) "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? and sec_cd=?  "+ 
                                     " and bgt_yr=? order by srl_no ");
       ps.setString(1,stn_cd);
       ps.setString(2,sec_cd);
       ps.setString(3,finyr);
       rs = ps.executeQuery();

while(rs.next()){
   notes_exist=rs.getString(1);
}
rs.close();
ps.close();
}
if(notes_exist.equals("0")){
%>
<table style="width: 100%" border="0">
        <tr>
        <td style="width: 20%"  align="center"><b><font size="4" color="red">NO NOTES PRESENT</font></b></td>
        </tr>
</table>
<%
}else{

if(sec_cd.equals("ALL")){

if(stn_cd.equals("A")){
  
  ps1 = mk.con.prepareStatement(" select to_char(sum(AMT),'9999990.999') "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd in ('B','T','S','N','C','E') and sec_cd in (select distinct sec_cd from bgt_cd_section) "+ 
                                     " and bgt_yr=? order by decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),bgt_hd,sec_cd ");
       ps1.setString(1,finyr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
   tot_amt=rs1.getString(1);
}
rs1.close();
ps1.close();
    
ps1 = mk.con.prepareStatement(" select SRL_NO,BGT_HD,to_char(AMT,'9999990.999'),BGT_DESC,SEC_CD,STN_CD "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd in ('B','T','S','N','C','E') and sec_cd in (select distinct sec_cd from bgt_cd_section) "+ 
                                     " and bgt_yr=? order by decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),bgt_hd,sec_cd ");
       ps1.setString(1,finyr);
       rs1 = ps1.executeQuery();
}else{
   
    ps1 = mk.con.prepareStatement(" select to_char(sum(AMT),'9999990.999') "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? and sec_cd in (select distinct sec_cd from bgt_cd_section where stn_cd=?) "+ 
                                     " and bgt_yr=? order by decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),bgt_hd,sec_cd ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,stn_cd);
       ps1.setString(3,finyr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
   tot_amt=rs1.getString(1);
}
rs1.close();
ps1.close();
    
       ps1 = mk.con.prepareStatement(" select SRL_NO,BGT_HD,to_char(AMT,'9999990.999'),BGT_DESC,SEC_CD,STN_CD "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? and sec_cd in (select distinct sec_cd from bgt_cd_section where stn_cd=?) "+ 
                                     " and bgt_yr=? order by decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),bgt_hd,sec_cd ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,stn_cd);
       ps1.setString(3,finyr);
       rs1 = ps1.executeQuery();
}

}else if(sec_cd.equals("DGM1") || sec_cd.equals("DGM2")){
   
    ps1 = mk.con.prepareStatement(" select to_char(sum(AMT),'9999990.999') "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? "+ 
                                     " and sec_cd in (select distinct sec_cd from bgt_level where emp_desg=decode(?,'DGM1','DGM(I)-BBGS','DGM2','DGM(II)-BBGS')) "+ 
                                     " and bgt_yr=? order by bgt_hd,decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),sec_cd ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,sec_cd);
       ps1.setString(3,finyr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
   tot_amt=rs1.getString(1);
}
rs1.close();
ps1.close();
   
     ps1 = mk.con.prepareStatement(" select SRL_NO,BGT_HD,to_char(AMT,'9999990.999'),BGT_DESC,SEC_CD,STN_CD "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? "+ 
                                     " and sec_cd in (select distinct sec_cd from bgt_level where emp_desg=decode(?,'DGM1','DGM(I)-BBGS','DGM2','DGM(II)-BBGS')) "+ 
                                     " and bgt_yr=? order by bgt_hd,decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),sec_cd ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,sec_cd);
       ps1.setString(3,finyr);
       rs1 = ps1.executeQuery();

}else if(sec_cd.equals("#")){
   
    ps1 = mk.con.prepareStatement(" select to_char(sum(AMT),'9999990.999') "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? "+ 
                                     " and sec_cd in (select distinct sec_cd from bgt_level where emp_code=? and sec_cd<>'STN' and stn_cd=?) "+ 
                                     " and bgt_yr=? order by bgt_hd,decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),sec_cd ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,empcd);
       ps1.setString(3,stn_cd);
       ps1.setString(4,finyr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
   tot_amt=rs1.getString(1);
}
rs1.close();
ps1.close();
   
     ps1 = mk.con.prepareStatement(" select SRL_NO,BGT_HD,to_char(AMT,'9999990.999'),BGT_DESC,SEC_CD,STN_CD "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? "+ 
                                     " and sec_cd in (select distinct sec_cd from bgt_level where emp_code=? and sec_cd <>'STN' and stn_cd=?) "+ 
                                     " and bgt_yr=? order by bgt_hd,decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),sec_cd ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,empcd);
       ps1.setString(3,stn_cd);
       ps1.setString(4,finyr);
       rs1 = ps1.executeQuery();
}else{
    ps1 = mk.con.prepareStatement(" select to_char(sum(AMT),'9999990.999') "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? and sec_cd=?  "+ 
                                     " and bgt_yr=? order by bgt_hd,decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),sec_cd ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,sec_cd);
       ps1.setString(3,finyr);
       rs1 = ps1.executeQuery();
while(rs1.next()){
   tot_amt=rs1.getString(1);
}
rs1.close();
ps1.close();

       ps1 = mk.con.prepareStatement(" select SRL_NO,BGT_HD,to_char(AMT,'9999990.999'),BGT_DESC,SEC_CD,STN_CD "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? and sec_cd=?  "+ 
                                     " and bgt_yr=? order by bgt_hd,decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),sec_cd ");
       ps1.setString(1,stn_cd);
       ps1.setString(2,sec_cd);
       ps1.setString(3,finyr);
       rs1 = ps1.executeQuery();
}
%>
<table id="mytable" style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style3"  colspan="7" align="middle"><strong>NOTES </strong></td>
        </tr>

        <tr>
                <td style="width: 10%" class="style3"><strong>STATION</strong></td>
                <td style="width: 10%" class="style3"><strong>SECTION</strong></td>
                <td style="width: 10%" class="style3"><strong>SL NO</strong></td>
                <td style="width: 15%" class="style3"><strong>BUDGET HEAD</strong></td>
                <td style="width: 15%" class="style3"><strong>AMOUNT(RS. Lakhs)</strong></td>
                <td style="width: 50%" class="style3"><strong>DESCRIPTION</strong></td>
        </tr>
<%
while(rs1.next()){

if(rs1.getString(6).equals("B")){
  stn_sht_desc1="BBGS";
}
if(rs1.getString(6).equals("T")){
  stn_sht_desc1="TGS";
}
if(rs1.getString(6).equals("S")){
  stn_sht_desc1="SGS";
}
if(rs1.getString(6).equals("N")){
  stn_sht_desc1="NCGS";
}
if(rs1.getString(6).equals("C")){
  stn_sht_desc1="CTM";
}
if(rs1.getString(6).equals("E")){
  stn_sht_desc1="EDGE";
}

System.out.println("prev_stn_cd:"+prev_stn_cd);
System.out.println("cur_stn_cd:"+rs1.getString(6));

if(stn_cd.equals("A") && !prev_stn_cd.equals(rs1.getString(6))){

if(prev_stn_cd.equals("B")){
  stn_sht_desc2="BBGS";
}
if(prev_stn_cd.equals("T")){
  stn_sht_desc2="TGS";
}
if(prev_stn_cd.equals("S")){
  stn_sht_desc2="SGS";
}
if(prev_stn_cd.equals("N")){
  stn_sht_desc2="NCGS";
}
if(prev_stn_cd.equals("C")){
  stn_sht_desc2="CTM";
}
if(prev_stn_cd.equals("E")){
  stn_sht_desc2="EDGE";
}
    ps2 = mk.con.prepareStatement(" select to_char(sum(AMT),'9999990.999') "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? and sec_cd in (select distinct sec_cd from bgt_cd_section where stn_cd=?) "+ 
                                     " and bgt_yr=?  ");
       ps2.setString(1,prev_stn_cd);
       ps2.setString(2,prev_stn_cd);
       ps2.setString(3,finyr);
       rs2 = ps2.executeQuery();
while(rs2.next()){
   tot_amt_gen=rs2.getString(1);
}
rs2.close();
ps2.close();
%>
<tr>
                <td style="width: 20%" align="center" colspan="6" class="style3"><strong>TOTAL AMOUNT OF <%=stn_sht_desc2%> (In Rs. Lakhs) : <%=tot_amt_gen%> </strong></td>
</tr>
<%
}
%>
<tr>
                <td style="width: 10%" align="center"  class="style5"><strong><%=stn_sht_desc1%></strong></td>
                <td style="width: 10%" align="center"  class="style5"><strong><%=rs1.getString(5)%></strong></td>
                <td style="width: 10%" align="center"  class="style5"><strong><%=rs1.getString(1)%></strong></td>
                <td style="width: 15%" align="center"  class="style5"><strong><%=rs1.getString(2)%></strong></td>
                <td style="width: 15%" align="right"   class="style5"><strong><%=rs1.getString(3)%></strong></td>
                <td style="width: 50%" align="left"    class="style5"><strong><%=rs1.getString(4)%></strong></td>
</tr>
<%
prev_stn_cd=rs1.getString(6);
}
rs1.close();
ps1.close();

if(stn_cd.equals("A")){

if(prev_stn_cd.equals("B")){
  stn_sht_desc2="BBGS";
}
if(prev_stn_cd.equals("T")){
  stn_sht_desc2="TGS";
}
if(prev_stn_cd.equals("S")){
  stn_sht_desc2="SGS";
}
if(prev_stn_cd.equals("N")){
  stn_sht_desc2="NCGS";
}
if(prev_stn_cd.equals("C")){
  stn_sht_desc2="CTM";
}
if(prev_stn_cd.equals("E")){
  stn_sht_desc2="EDGE";
}
    ps2 = mk.con.prepareStatement(" select to_char(sum(AMT),'9999990.999') "+ 
                                     " from BGT_ADDL_DATA "+ 
                                     " where stn_cd=? and sec_cd in (select distinct sec_cd from bgt_cd_section where stn_cd=?) "+ 
                                     " and bgt_yr=?  ");
       ps2.setString(1,prev_stn_cd);
       ps2.setString(2,prev_stn_cd);
       ps2.setString(3,finyr);
       rs2 = ps2.executeQuery();
while(rs2.next()){
   tot_amt_gen=rs2.getString(1);
}
rs2.close();
ps2.close();
%>
<tr>
                <td style="width: 20%" align="center" colspan="6" class="style3"><strong>TOTAL AMOUNT OF <%=stn_sht_desc2%> (In Rs. Lakhs) : <%=tot_amt_gen%> </strong></td>
</tr>
<%
}
%>
</table>
<br>
<table id="mytable" style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style3"  colspan="7" align="left"><strong>TOTAL AMOUNT (In Rs. Lakhs) :<%=tot_amt%> </strong></td>
        </tr>
</table>
<%
}
}
%>
<input type="hidden" id= "stn_cd" name = "stn_cd" value="<%=stn_cd%>" />
<%
if(sec_cd.equals("#")){
%>
<input type="hidden" id= "sec_cd" name = "sec_cd" value="<%=sec_cd_spl%>" />
<%
}else{
%>
<input type="hidden" id= "sec_cd" name = "sec_cd" value="<%=sec_cd%>" />
<%
}
%>
<input type="hidden" id= "finyr" name = "finyr" value="<%=finyr%>" />
<input type="hidden" id= "finyr1" name = "finyr1" value="<%=finyr1%>" />
<input type="hidden" id= "counter" name = "counter" value="<%=counter%>" />
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
<input type="hidden" id= "stn_long_desc" name = "stn_long_desc" value="<%=station%>" />
<input type="hidden" id= "bgt_lvl" name = "bgt_lvl" value="<%=bgt_lvl%>" />
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
</body>
</html>
