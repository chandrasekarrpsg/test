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
<title>Budget submenu</title>
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


<script language="JavaScript" fptype="dynamicanimation">
</script>

<script language="JavaScript1.2" fptype="dynamicanimation" src="animate.js">
</script>

</head>

<body text="#BFB1FE" onload="dynAnimation()" background="green1.jpg" width="100%" height="100%">

<%

  PreparedStatement ps              = null;
  ResultSet rs                      = null;
  PreparedStatement ps1             = null;
  ResultSet rs1                     = null;
  MakeConnectionGENORBL mk          = null;
  String finyr                      = new String("");
  String finyr1                     = new String("");
  String stn_sht_desc               = new String("");
  String stn_cd                     = new String("");
  String sec_cd                     = new String("");
  String empcd                      = new String("");
  String sysdate                    = new String("");
  String your_desg                  = new String("");
  String sStyle                     = new String("");
  String con_exist                  = new String("");

try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);

stn_cd = request.getParameter("stn_cd");
sec_cd = request.getParameter("sec_cd");
finyr  = request.getParameter("finyr");
finyr1 = request.getParameter("finyr1");
empcd  = request.getParameter("empcd");

System.out.println("stn_cd:"+stn_cd);
System.out.println("sec_cd:"+sec_cd);
System.out.println("finyr:"+finyr);
System.out.println("finyr1:"+finyr1);
System.out.println("empcd:"+empcd);

//stn_cd = "A";
//sec_cd = "ALL";
//finyr  = "2013";
//finyr1 = "2013 - 2014";
//empcd  = "000005";

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

       ps = mk.con.prepareStatement("select count(*) from BGT_FORM2B_DATA_TMP_OVRAL_CNSL where stn_cd='A' and sec_cd='ALL SECTIONS INTERIM ( '||?||' )' and bgt_yr=? and crt_by=?");
       ps.setString(1,empcd);
       ps.setString(2,finyr1);
       ps.setString(3,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            con_exist = rs.getString(1);
       }
       rs.close();
       ps.close();
%>

<form name="f1">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:250px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="3">GENERATION DIVISION COMPILED BUDGET SUBMENU FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>
<br>
<table style="width: 100%" border="0">
        <tr>
                <td style="width: 20%"  colspan="7" align="right" size="4"><strong><a href="#" onClick="window.open('budget_dash_main_dtl.jsp?','_self');">Back</strong></font></b></strong></td>
        </tr>
</table>
<%
if(con_exist.equals("0")){
%>

<TABLE height=60% width="100%" border=0 cellspacing="0">
        <TBODY>
          <TR>
            <TD align=middle width=100% height=100% ><font color="#cc3300" face="Courier New" Size=5><b>GENERATION BUDGET NOT YET CONSOLIDATED FOR FINYR :<%=finyr1%>.</b></font></TD>
          </TR>
        </TBODY>
</TABLE>

<%
}else{
%>
<br>
<center>
  <div align="left">
  <table border="0" cellpadding="0" cellspacing="0" width="87%" height="30%" align="left" valign="top">
    <tr>
      <td width="100%" height="15%" align="left"><a href="generation_budget_compiled.jsp?stn_cd=A&sec_cd=ALL&bgt_hdr=INTERIM&T1=<%=finyr1%>&username=<%=empcd%>&emp_desg=<%=your_desg%>&bgt_ver=1" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP2" id="fpAnimflyBottomRightFP2" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="3" color="#0000AA">1. GENERATION DIVISION COMPILED BUDGET </font></b></p></a>
      </td>
    </tr>
    <tr>
      <td width="100%" height="15%" align="left"><a href="generation_budget_finance.jsp?stn_cd=A&sec_cd=ALL&bgt_hdr=INTERIM&T1=<%=finyr1%>&username=<%=empcd%>&emp_desg=<%=your_desg%>&bgt_ver=1" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP2" id="fpAnimflyBottomRightFP2" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="3" color="#0000AA">2. FINANCE FORMAT </font></b></p></a>
      </td>
    </tr>
    <tr>
      <td width="100%" height="15%" align="left"><a href="generation_budget_de_ovral_cnsl_temp.jsp?stn_cd=A&T1=<%=finyr1%>&username=<%=empcd%>&emp_desg=<%=your_desg%>&bgt_lvl=2&stn_long_desc=GENERATION DIVISION" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP2" id="fpAnimflyBottomRightFP2" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="3" color="#0000AA">3. COMPILED BUDGET WITH NOTES </font></b></p></a>
      </td>
    </tr>
</table>
</div>
</center>
<%
}
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
     if(mk!=null){
        mk.con.close();
     }

}

%>
</body>
</html>
