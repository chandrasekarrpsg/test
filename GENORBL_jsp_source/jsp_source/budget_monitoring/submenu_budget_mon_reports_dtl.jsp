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

String repo7frmdt   = new String("");
String repo7todt    = new String("");

empcd          = loginBean.getsEmpCd();

%>
<label style="left:800px; top:25px; position: absolute" >
<input type="button" value="Back" name="back" id="back" style="border:3px double #003300; font-family: Tahoma; font-size: 10pt; color: #800000; font-weight: bold" onClick="back_prev();"/></label></p>
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,javax.swing.*,java.io.*" %>

<%

PreparedStatement ps             = null;
ResultSet rs                     = null;
MakeConnectionGENORBL mk         = null;
try{
     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);


//empcd          = loginBean.getsEmpCd();

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


ps = mk.con.prepareStatement("select case when to_number(to_char(trunc(sysdate),'MM')) >= 4  then to_char(trunc(sysdate),'RRRR')||'-'||to_char(add_months(trunc(sysdate),12),'RRRR') else to_char(add_months(trunc(sysdate),-12),'RRRR')||'-'||to_char(trunc(sysdate),'RRRR') end "+ 
" from dual ");
       rs = ps.executeQuery();
       while(rs.next()){
            finyr = rs.getString(1);
       }
       rs.close();
       ps.close();

System.out.println("finyr:"+finyr);

       ps = mk.con.prepareStatement("select to_char(start_date,'DD-Mon-YYYY') from FINNANCE_FINYR where stn='016' and FINANCE_FINYR=?");
       ps.setString(1,finyr);
       rs = ps.executeQuery();
       while(rs.next()){
            repo7frmdt = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select to_char(trunc(sysdate),'DD-Mon-RRRR') from dual");
       rs = ps.executeQuery();
       while(rs.next()){
            repo7todt = rs.getString(1);
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
        <p align="center" dynamicanimation="fpAnimflyBottomRightFP1" id="fpAnimflyBottomRightFP1" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Arial Black" size="5" color="#0000AA">SUBMENU OF VARIOUS REPORTS REGARDING BUDGET MONITOTING</font></b></td>
    </tr>
    <tr height="10%">
      <td>
      </td>
    </tr>
    <tr height="10%">
      <td width="100%" align="left"><a href="bgtm_repo1_report.jsp?finyr=<%=finyr%>&month=<%=month%>&compare=T&mon_basis=2&empcd=<%=empcd%>" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP2" id="fpAnimflyBottomRightFP2" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">1. Stationwise MTD YTD Expenditures Compared to Budgeted Target and Floor value </font></b></p></a>
      </td>
    </tr>
    <tr height="10%">
      <td width="100%" align="left"><a href="budgRept2.jsp" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP3" id="fpAnimflyBottomRightFP3" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">2. Station wise,Department wise Monthly Material and Contracts Expenditure.(BBGS #1,2,#3 breakup available) </font></b></p></a>
      </td>
    </tr>
    <tr height="10%">
      <td width="100%" align="left"><a href="budgRept3.jsp" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP4" id="fpAnimflyBottomRightFP4" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">3. Station wise,Department wise Monthly Expenditure Under valrious Budget Heads.(BBGS #1,2,#3 breakup available) </font></b></p></a>
      </td>
    </tr>
    <tr height="10%">
      <td width="100%" align="left"><a href="budgRept4.jsp" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP5" id="fpAnimflyBottomRightFP5" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">4. Station wise,Group wise (Materials and Contacts) Monthly departmental Expenditures.(BBGS #1,2,#3 breakup available) </font></b></p></a>
      </td>
    </tr>
    <tr height="10%">
      <td width="100%" align="left"><a href="budgRept5.jsp" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP6" id="fpAnimflyBottomRightFP6" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">5. Station wise,Group wise (Materials and Contacts) Monthly Expenditures Under Various Budget Descriptions and Heads.(BBGS #1,2,#3 breakup available)</font></b></p></a>
      </td>
    </tr>
    <tr height="10%">
      <td width="100%" align="left"><a href="bgtm_repo6_report.jsp" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP7" id="fpAnimflyBottomRightFP7" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">6. Station wise/Department Wise target Vs Actual Cash Flow Statement</font></b></p></a>
      </td>
    </tr>
    <tr height="10%">
      <td width="100%" align="left"><a href="bgtm_repo7.jsp?finyr=<%=finyr%>&month=<%=month%>&mon_basis=2&empcd=<%=empcd%>&station=BBGS&section=ALL&group=ALL" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP7" id="fpAnimflyBottomRightFP7" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">7. Budget Head Wise MTD YTD Expenditures Compared to Budgeted Target and Floor value</font></b></p></a>
      </td>
    </tr>

<tr height="10%">
      <td width="100%" align="left"><a href="bgtm_repo7a.jsp?finyr=<%=finyr%>&month=<%=month%>&mon_basis=2&empcd=<%=empcd%>&station=BBGS&section=ALL&group=ALL" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP7" id="fpAnimflyBottomRightFP7" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">7a. Controllable O &amp; M Budget MTD YTD Expenditures Compared to Budgeted Target and Floor value</font></b></p></a>
      </td>
    </tr>

    <tr height="10%">
      <td width="100%" align="left"><a href="bgtm_repo7b.jsp?finyr=<%=finyr%>&frmdt_C=<%=repo7frmdt%>&todt_C=<%=repo7todt%>&frmdt_M=<%=repo7frmdt%>&todt_M=<%=repo7todt%>&mon_basis=2&empcd=<%=empcd%>&station=BBGS&section=ALL&group=ALL" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP7" id="fpAnimflyBottomRightFP7" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">7b. Budget Head Wise MTD YTD Expenditures Compared to Budgeted Target and Floor value (Between Given Datespans For Materials and Contract)</font></b></p></a>
      </td>
    </tr>

    <tr height="10%">
      <td width="100%" align="left"><a href="bgtm_repo7_datespan.jsp?finyr=<%=finyr%>&frmdt=<%=repo7frmdt%>&todt=<%=repo7todt%>&mon_basis=2&empcd=<%=empcd%>&station=BBGS&section=ALL&group=ALL" target="_self">
        <p dynamicanimation="fpAnimflyBottomRightFP7" id="fpAnimflyBottomRightFP7" style="position: relative !important; visibility: hidden" language="Javascript1.2"><b><font face="Times New Roman" size="4" color="#0000AA">8. Budget Head Wise MTD YTD Expenditures Compared to Budgeted Target and Floor value (Between A Given Datespan)</font></b></p></a>
      </td>
    </tr>

    <tr height="10%">
      <td>
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
