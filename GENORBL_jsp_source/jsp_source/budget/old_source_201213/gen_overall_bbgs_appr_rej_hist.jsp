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
  MakeConnectionGENORBL mk          = null;
  String finyr                      = new String("");
  String finyr1                     = new String("");
  String stn_cd                     = new String("");
  String sec_cd                     = new String("");
  String empcd                      = new String("");
  String sysdate                    = new String("");
  String your_desg                  = new String("");
  String station                    = new String("");
  String entry_started_dt           = new String("");
  String entry_consolidated_exist   = new String("");
  String entry_consolidated_exist1  = new String("");
  String entry_published_dt         = new String("");
  String stn_lvl_bgt_compile_dt     = new String("");
  String bgt_finalized_dt           = new String("");
  String cur_bgt_ver                = new String("");
  String app_hist_exist             = new String("");
  String pub_emp_desg               = new String("");
  String pub_exist                  = new String("");
  String forward_emp_desg           = new String("");
  String rej_emp_desg               = new String("");
  
  String rmks                       = new String("");
  String sStyle                     = new String("");
int cnt=1;
try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);
     finyr  = request.getParameter("finyr");
     finyr1 = request.getParameter("finyr1");
     empcd  = request.getParameter("empcd");
     stn_cd = "B";
finyr=finyr1.substring(0,4);
System.out.println("aafinyr:"+finyr);
System.out.println("aafinyr1:"+finyr1);
System.out.println("aaempcd:"+empcd);
System.out.println("aastncd:"+stn_cd);

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

       
       ps = mk.con.prepareStatement("select nvl(max(bgt_ver),'1') from BGT_POSITION where stn_cd=? and sec_cd=? and bgt_yr=?");
       ps.setString(1,stn_cd);
       ps.setString(2,sec_cd);
       ps.setString(3,finyr);
       rs = ps.executeQuery();
       while(rs.next()){
            cur_bgt_ver = rs.getString(1);
       }
       rs.close();
       ps.close();

%>
<form name="f1">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:250px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="3">OVERALL BUDGET HISTORY OF BBGS FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>
<br>
<table style="width: 100%" border="0">
        <tr>
                <td style="width: 20%"  colspan="7" align="right" size="4"><strong><a href="#" onClick="window.open('gen_spec_budget_dtl.jsp?stn_cd=<%=stn_cd%>&finyr=<%=finyr%>&finyr1=<%=finyr1%>&empcd=<%=empcd%>','_self');">Back</strong></font></b></strong></td>
        </tr>
</table>

<%

       ps = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS "+ 
                                    " where stn_cd='B'  and sec_cd in ('DGM1','DGM2') and bgt_yr=?");
       ps.setString(1,finyr);
       rs = ps.executeQuery();
       while(rs.next()){
            entry_consolidated_exist = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement(" select count(*) from BGT_FORM2B_DATA_BBGS_ARC "+ 
                                    " where stn_cd='B'  and sec_cd in ('DGM1','DGM2') and bgt_yr=?");
       ps.setString(1,finyr);
       rs = ps.executeQuery();
       while(rs.next()){
            entry_consolidated_exist1 = rs.getString(1);
       }
       rs.close();
       ps.close();
       
if(!entry_consolidated_exist.equals("0") || !entry_consolidated_exist1.equals("0")){

       ps = mk.con.prepareStatement(" select * from ( "+
                                    " select distinct to_char(crt_dt,'dd/mm/yyyy'),crt_by,bgt_ver "+ 
                                    " from bgt_form2b_data_bbgs where stn_cd='B' and sec_cd in ('DGM1','DGM2')"+ 
                                    " and bgt_yr= ? "+ 
                                    " union all "+
                                    " select distinct to_char(crt_dt,'dd/mm/yyyy'),crt_by,bgt_ver "+ 
                                    " from bgt_form2b_data_bbgs_arc "+ 
                                    " where stn_cd='B' "+ 
                                    " and sec_cd in ('DGM1','DGM2') and bgt_yr=?  ) "+
                                    " order by bgt_ver ");
       ps.setString(1,finyr);
       ps.setString(2,finyr);
       rs = ps.executeQuery();
%>
<br>
<br>
<br>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style3"  colspan="7" align="middle"><strong>CONSOLIDATION HISTORY</strong></td>
        </tr>

        <tr>
                <td style="width: 30%" class="style3"><strong>BUDGET VERSION </strong></td>
                <td style="width: 40%" class="style3"><strong>CONSOLIDATED BY </strong></td>
                <td style="width: 30%" class="style3"><strong>CONSOLIDATED ON (DD/MM/YYYY)</strong></td>
        </tr>
<%
while(rs.next()){

       ps1 = mk.con.prepareStatement("select distinct emp_desg "+
                                    " from bgt_level "+
                                    " where emp_code=? ");
       ps1.setString(1,rs.getString(2));
       rs1 = ps1.executeQuery();
while(rs1.next()){
   pub_emp_desg=rs1.getString(1);
}
rs1.close();
ps1.close();


%>
<tr>
                <td style="width: 30%" align="center" class="style5" ><strong><%=rs.getString(3)%></strong></td>
                <td style="width: 40%" align="center" class="style5" ><strong><%=pub_emp_desg%></strong></td>
                <td style="width: 30%" align="center" class="style5" ><strong><%=rs.getString(1)%></strong></td>
</tr>
<%
}
rs.close();
ps.close();
%>
</table>
<%
}else{
%>
<TABLE height=60% width="100%" border=0 cellspacing="0">
        <TBODY>
          <TR>
            <TD align=middle width=100% height=100% ><font color="#cc3300" face="Courier New" Size=5><b>BUDGET OF BBGS NOT YET CONSOLIDATED FOR FINYR :<%=finyr1%>.</b></font></TD>
          </TR>
        </TBODY>
</TABLE>
<%
}
%>
<br>
<%
       ps = mk.con.prepareStatement(" select count(distinct bgt_ver) from BGT_POSITION "+ 
                                    " where stn_cd in ('B') and sec_cd in ('DGM1','DGM2') and bgt_yr=? ");
       ps.setString(1,finyr);
       rs = ps.executeQuery();
       while(rs.next()){
            app_hist_exist = rs.getString(1);
       }
       rs.close();
       ps.close();

if(!app_hist_exist.equals("0")){


    ps = mk.con.prepareStatement(" select bgt_ver,decode(sec_cd,'DGM1','SECTION)(S) UNDER DGM(I)','DGM2','SECTION)(S) UNDER DGM(II)'),decode(SEND_TO_LOWER_LEVEL_DT,'','ACCEPTED','REJECTED') status, "+
                                 " nvl(to_char(SEND_TO_LOWER_LEVEL_DT,'dd/mm/yyyy'),'&nbsp'),nvl(SEND_TO_LOWER_LEVEL_BY,'&nbsp'),nvl(remarks,'&nbsp') "+ 
                                 " from bgt_position "+
                                 " where stn_cd in ('B') and sec_cd  in ('DGM1','DGM2')"+ 
                                 " and bgt_yr=?  order by bgt_ver,decode(sec_cd,'DGM1','1','DGM2','2') ");
       ps.setString(1,finyr);
       rs = ps.executeQuery();
%>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style3"  colspan="7" align="middle"><strong>APPROVAL HISTORY</strong></td>
        </tr>

        <tr>
                <td style="width: 10%" class="style3"><strong>BGT VER </strong></td>
                <td style="width: 20%" class="style3"><strong>SECTION </strong></td>
                <td style="width: 15%" class="style3"><strong>STATUS (DD/MM/YYYY)</strong></td>
                <td style="width: 20%" class="style3"><strong>REJECTED BY</strong></td>
                <td style="width: 15%" class="style3"><strong>REJECTED ON(DD/MM/YYYY)</strong></td>
                <td style="width: 20%" class="style3"><strong>REMARKS</strong></td>
        </tr>
<%
while(rs.next()){
      ps1 = mk.con.prepareStatement(" select nvl(max(emp_desg),'&nbsp') from bgt_level where emp_code=? ");
      ps1.setString(1,rs.getString(5));
      rs1 = ps1.executeQuery();
while(rs1.next()){
   rej_emp_desg=rs1.getString(1);
}
rs1.close();
ps1.close();
%>
<tr>
                <td style="width: 10%" align="center" class="style5" ><strong><%=rs.getString(1)%></strong></td>
                <td style="width: 20%" align="center" class="style5" ><strong><%=rs.getString(2)%></strong></td>
                <td style="width: 15%" align="center" class="style5" ><strong><%=rs.getString(3)%></strong></td>
                <td style="width: 20%" align="center" class="style5" ><strong><%=rej_emp_desg%></strong></td>
                <td style="width: 15%" align="center" class="style5" ><strong><%=rs.getString(4)%></strong></td>
                <td style="width: 20%" align="left" class="style5"   ><strong><%=rs.getString(6)%></strong></td>
</tr>
<%
}
rs.close();
ps.close();
%>
</table>
<%
}
}catch(Exception e){
  e.printStackTrace();
}finally{
   mk.con.close();
}

%>
</body>
</html>
