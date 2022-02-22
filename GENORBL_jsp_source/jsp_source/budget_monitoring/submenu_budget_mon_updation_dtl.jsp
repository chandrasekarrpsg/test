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
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>PDF SUB MENU</title>
<script language="JavaScript1.2" fptype="dynamicanimation" src="animate.js">
</script>
<script type="text/javascript">

function back_prev(){
   var parameter='';
   parameter = parameter + 'userid='+document.f1.empcd.value;
   window.close();
   window.open("invoke_menu_page.jsp?"+parameter,"mainWin","toolbar=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,fullscreen=1");
}

</script>
</head>
<body text="#BFB1FE" onload="dynAnimation()" background="head_0401.gif" >
<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session" />
<form name="f1">
<%
String sysdate = new String("");
String month   = new String("");
String finyr   = new String("");
String empcd   = new String("");
empcd          = loginBean.getsEmpCd();
%>
<label style="left:800px; top:25px; position: absolute" >
<input type="button" value="Back" name="back" id="back" style="border:3px double #003300; font-family: Tahoma; font-size: 10pt; color: #800000; font-weight: bold" onclick="back_prev();"/></label></p>
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,javax.swing.*,java.io.*" %>

<%

PreparedStatement ps             = null;
ResultSet rs                     = null;
MakeConnectionGENORBL mk         = null;
try{
     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);


       ps = mk.con.prepareStatement("select to_char(trunc(sysdate),'DD-MON-RRRR') from dual");
       rs = ps.executeQuery();
       while(rs.next()){
            sysdate = rs.getString(1);
       }
       rs.close();
       ps.close();
    
       ps = mk.con.prepareStatement("select to_char(to_date(trunc(sysdate),'DD/MM/YYYY'),'Mon') from dual");
       rs = ps.executeQuery();
       while(rs.next()){
            month = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select max(bgt_yr)||'-'||to_char(add_months(to_date(max(bgt_yr),'YYYY'),12),'YYYY') from bgt_form2b_data");
       rs = ps.executeQuery();
       while(rs.next()){
            finyr = rs.getString(1);
       }
       rs.close();
       ps.close();

%>
  <table border="0" width="100%" align="left" valign="top">
    <tr height="10%">
      <td>
      </td>
    </tr>
    <tr height="10%">
      <td width="100%" >
        <p align="center" dynamicanimation="fpAnimflyBottomRightFP1" id="fpAnimflyBottomRightFP1" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Arial Black" size="5" color="#0000AA">SUBMENU OF VARIOUS DATA UPDATION</font></b></td>
    </tr>
    <tr height="10%">
      <td>
      </td>
    </tr>
    <tr height="10%">
      <td width="100%" align="left"><a href="ins_quarter_val_fin.jsp?empcd=<%=empcd%>" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP2" id="fpAnimflyBottomRightFP2" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">1. Insert Finanace Declared value </font></b></p></a>
      </td>
    </tr>
    <tr height="10%">
      <td width="100%" align="left"><a href="upd_construction_data.jsp?finyr=<%=finyr%>&month=<%=month%>&station=BBGS&empcd=<%=empcd%>" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP3" id="fpAnimflyBottomRightFP3" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">2. Budget Head and Department updating module for Construction Department jobs.Updation to be done online from Station End. </font></b></p></a>
      </td>
    </tr>
    <tr height="10%">
      <td width="100%" align="left"><a href="add_comment_on_exp.jsp?finyr=<%=finyr%>&month=<%=month%>&station=BBGS&empcd=<%=empcd%>&type=select" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP3" id="fpAnimflyBottomRightFP3" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">3. Add Comments On Expenditure (If Any).</font></b></p></a>
      </td>
    </tr>
  </table>
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />

<%
}catch(Exception e){
  e.printStackTrace();
}finally{

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
