<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>UPDATION OF SEPERATION DATE </title>
<SCRIPT type="text/javascript" src="calender.js"></SCRIPT>
<link rel="stylesheet" type="text/css" href="calender.css"/>
</head>

<script language="javascript">

function autotab(original,destination){
if (original.getAttribute&&original.value.length==original.getAttribute("maxlength"))
destination.focus()
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
  }while(flag==1 && i<str.length)
  if (flag == 1)
    return true;
  return false;
}


function disableField(myField)
{
myField.disabled = true
return true
}
function enableField(myField)
{
myField.disabled = false
return true
}

function info1(){
var  marker=0;

if(! isNull(f1.T1.value))
{
       alert('PLEASE ENTER EMPLOYEE CODE')
       f1.T1.value='';
       f1.T1.focus();
       marker=1;
       return false;

}

if(! isPosInt(f1.T1.value))
{
       alert('PLEASE ENTER INTEGER VALUES')
       f1.T1.value='';
       f1.T1.focus();
       marker=1;
       return false;

}

if(marker==0)
{
document.f1.action='doEmpSeperation.jsp';
document.f1.submit();


}
}

function info2(){
var  marker=0;

if(! isNull(f1.T6.value))
{
       alert('PLEASE ENTER THE DATE OF SEPERATION')
       f1.T6.value='';
       f1.T6.focus();
       marker=1;
       return false;

}


if(marker==0)
{
document.f1.submit();
document.f1.action='doEmpSeperation.jsp';
return true;
}
}





</script>



<body background="Back11.jpg"  onload="f1.T1.focus();">

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:10px; top:15px" width="170" height="70">



		  <label style="POSITION: absolute; LEFT: 660px; top:575px"  class="style5" ><b>2012 © Developed by I.T. Department</b></label>

</div>


 <form  name="f1" action="doEmpSeperation.jsp">
<br>
<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3"><font face="Albertus Extra Bold" size="5" color="#400040">
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EMPLOYEE SEPERATION INPUT SCREEN</b></font>
<br><br>

<center>
<table  >
  <tr>
    <td colspan="4">
     <font color="660033" size="4"><b>Employee Code</b></font>




    </td>
    <td colspan="1">    
<input type="text"  name="T1" size="6" maxlength = "6" onkeypress="if(window.event.keyCode==13){info1();}" >
    </td>
  </tr>
</table  >
</center>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="java.io.*,javax.servlet.jsp.*,javax.ejb.EJB,javax.naming.*,java.util.*,java.lang.*" %>
<%@ page language="java" import="java.io.*,javax.servlet.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,javax.swing.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="oracle.sql.*" %>
<%@ page import="oracle.jdbc.*" %>
<%@ page import="genOrblJavaPackage.*" %>

<% 

String empcode =new String("");
String designation =new String("");
String department =new String("");
String name =new String("");
String name1 =new String("");
String designation1 =new String("");
String department1 =new String("");
String station1 =new String("");
String station =new String("");
String termination=new String("");

try{
 MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
 mk.con.setAutoCommit(false);

 try{

PreparedStatement  ps0=null;
         ResultSet rs0=null;

PreparedStatement  ps=null;
         ResultSet rs=null;

PreparedStatement ps1=null;
ResultSet rs1=null;

PreparedStatement ps2=null;
ResultSet rs2=null;

PreparedStatement ps3=null;
ResultSet rs3=null;
PreparedStatement ps4=null;
ResultSet rs4=null;
PreparedStatement ps5=null;
ResultSet rs5=null;
PreparedStatement ps6=null;
ResultSet rs6=null;
  
int cnt=0;
int length1=0;
int length2=0;
int counter=1;

empcode=request.getParameter("T1");
if(empcode != null ) {
ps0  = mk.con.prepareStatement(" SELECT COUNT(*) FROM ADM_EMP_MST  WHERE  emp_code='"+empcode+"'");
rs0=ps0.executeQuery();
while(rs0.next())
{ 
cnt=rs0.getInt(1);
if(cnt==0)
{
counter=0;
}
}
rs0.close();
ps0.close();
if(cnt>=1)
{
ps1  = mk.con.prepareStatement(" SELECT NVL(emp_code,'N/A'), "+
                               " NVL(emp_genstn,'N/A'),      "+ 
                               " NVL(emp_dept,'N/A'),      "+ 
                               " NVL(emp_desg,'N/A'),        "+ 
                               " TRIM(UPPER(emp_fname))||' '||TRIM(UPPER(emp_lname))         "+ 
                               " FROM ADM_EMP_MST "+ 
                               " WHERE  emp_code='"+empcode+"'");

rs1=ps1.executeQuery();
while(rs1.next())
{
station=rs1.getString(2);
department=rs1.getString(3);
designation=rs1.getString(4);
name1=rs1.getString(5);
}
rs1.close();
ps1.close();
%>
<%
ps2=mk.con.prepareStatement("SELECT nvl(STATION_LONG_DESC,' ') FROM CD_STATION WHERE  ORBL_STATION_CD=lpad("+station+",3,'0')");
rs2=ps2.executeQuery();
while(rs2.next())
{
station1=rs2.getString(1);
}
rs2.close();
ps2.close();
%>
<%
ps3=mk.con.prepareStatement("SELECT nvl(DEPT_LDESC,' ') FROM ORBL_CD_DEPT_MST WHERE STATION=lpad("+station+",3,'0') and  DEPT=lpad("+department+",2,'0')");
rs3=ps3.executeQuery();
while(rs3.next())
{
department1=rs3.getString(1);
}
rs3.close();
ps3.close();
%>
<%
ps4=mk.con.prepareStatement("SELECT DESG_DESC FROM ADM_DESG_MST WHERE  DESG_CODE='"+designation+"'");
rs4=ps4.executeQuery();
while(rs4.next())
{
designation1=rs4.getString(1);
}
rs4.close();
ps4.close();
%>
<center>
<table>
<tr>   
 <td colspan="1" align="left">
      <font color="660033" size="4"><b>Date Of Seperation </b></font>
    
</td>
 <td colspan="2" align="center">
     <input type="text" name="T6" size="15" maxlength = "15"    style="color: CC6600 ; border:1px solid  #FFFFCC; background-color: #FFFFCC; font-weight:bold" value="">    
<a href="JavaScript:;" onClick="toggleCalendar('T6')">
        <img border="0" src="calButton.bmp" width="18" height="24"></a>    
</td>
  </tr>
<tr>   
 <td colspan="1" align="left">
      <font color="660033" size="4"><b>Employee Name </b></font>
</td>
 <td colspan="2" align="center">
     <input type="text" name="T2" size="51" maxlength = "51" readOnly="true"   style="color: CC6600 ; border:1px solid  #FFFFCC; background-color: #FFFFCC; font-weight:bold">    
    </td>
  </tr>
  <tr>
 <td colspan="1" align="left">
      <font color="660033" size="4"><b> Designation </b></font>
</td>
 <td colspan="2" align="center">
    <input type="text" name="T3" size="51" maxlength = "51" readOnly="true" style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     
    </td>
  </tr>
  
<tr>
 <td colspan="1" align="left">
      <font color="660033" size="4"><b> Employee Generation Unit</b></font>
</td>
 <td colspan="2" align="center">
    
   <input type="text" name="T4" size="51" maxlength = "51" readOnly="true" style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     
    </td>
  </tr>
  <tr>
 <td colspan="1" align="left">
     <font color="660033" size="4"><b>Department</b></font>
</td>
 <td colspan="2" align="center">
        
      <input type="text"  name="T5" size="51" maxlength = "51"  readOnly="true" style="color: CC6600 ; border:1px   solid #FFFFCC;background-color: #FFFFCC; font-weight:bold">
    </td>
</tr>

</table>
</center>
<br>
<br>
<br>




<center>
<table>
<tr  >
   <td colspan="3"  align ="center"> 
      <input type= "button" name = "b1"  value = "UPDATE" onClick="info2()" style="color: CC0000 ; border:1px   solid #FFFFCC;background-color: ffcc66; font-weight:bold;  border-style: outset"  >  &nbsp;&nbsp;&nbsp; 

      <input type= "reset" name = "b2"  value = "RESET" onClick="window.open('doEmpSeperation.jsp','_self');" style="color: CC0000 ; border:1px   solid #FFFFCC;background-color: ffcc66; font-weight:bold; border-style: outset" > &nbsp;&nbsp;&nbsp;

      <input type= "button" name = "b4"  value = "BACK"  onclick="window.open('close.html','_self');"  style="color: CC0000 ; border:1px   solid #FFFFCC;background-color: ffcc66; font-weight:bold; border-style: outset">
   </td>    
  </tr>
</table>
</center>
<script>
f1.T1.value='<%=empcode %>';
f1.T2.value='<%=name1 %>';
f1.T3.value='<%=designation1 %>';
f1.T4.value='<%=station1 %>';
f1.T5.value='<%=department1 %>';
</script>
<%
int noupd=0;
termination=request.getParameter("T6");
if(!(termination.equals("")))
{
empcode=request.getParameter("T1");
name1=request.getParameter("T2");
designation1=request.getParameter("T3");
station1=request.getParameter("T4");
department1=request.getParameter("T5");
%>
<%
ps1=mk.con.prepareStatement("UPDATE ADM_EMP_MST SET  emp_term_dt=to_date('"+termination+"','dd/mm/rrrr') WHERE emp_code ='"+empcode+"'");

noupd=ps1.executeUpdate();
ps1.close();
mk.con.commit();

ps2=mk.con.prepareStatement("UPDATE ADM_LOGIN_MST SET login_temination_dt=to_date('"+termination+"','dd/mm/rrrr') WHERE login_id ='"+empcode+"'");
noupd=ps2.executeUpdate();
ps2.close();
mk.con.commit();
%>
<script>
alert('UPDATION  DONE  SUCCESSFULLY');
f1.T1.value='<%=empcode %>';
f1.T2.value='<%=name1 %>';
f1.T3.value='<%=designation1 %>';
f1.T4.value='<%=station1 %>';
f1.T5.value='<%=department1 %>';
f1.T6.value='<%=termination %>';
</script>
<%
}
}
if(counter==0)
{
%>
<script>
alert('EMPLOYEE DOES  NOT  EXIST');
</script>
<%
}
}
}
catch(Exception e)
 { }
finally{
  try{
     mk.con.close();
     }
  catch(Exception e){}
}

}
catch(Exception e1){}

%>
</form>
</body>
<TABLE bgcolor=#ffffff border=1 cellPadding=0 cellSpacing=3 id=calendar style="DISPLAY: none; POSITION: absolute; Z-INDEX: 4">
  <TBODY>
  <TR>
    <TD colSpan=7 vAlign=center>
        <!-- Month combo box -->
        <SELECT id=month onchange=newCalendar()>
        <SCRIPT language=JavaScript>
                // Output months into the document.
                // Select current month.
                for (var intLoop = 0; intLoop < months.length; intLoop++)
                // Select current month.
                for (var intLoop = 0; intLoop < months.length; intLoop++)
                        document.write("<OPTION " +     (today.month == intLoop ? "Selected" : "") + ">" + months[intLoop]);
                </SCRIPT>
        </SELECT>
        <!-- Year combo box -->
        <SELECT id=year onchange=newCalendar()>
        <SCRIPT language=JavaScript>
                // Output years into the document.
                // Select current year.
                for (var intLoop = 1900; intLoop < 2028; intLoop++)
                        document.write("<OPTION " + (today.year == intLoop ? "Selected" : "") + ">" + intLoop);
                </SCRIPT>
        </SELECT>

        </TD>
  </TR>
  <TR class=days>
        <!-- Generate column for each day. -->
    <SCRIPT language=JavaScript>
        // Output days.
        for (var intLoop = 0; intLoop < days.length; intLoop++)
                document.write("<TD>" + days[intLoop] + "</TD>");
        </SCRIPT>
  </TR>
  </TBODY>
  <TBODY class=dates id=dayList onclick="getDate('')" vAlign=center>
  <!-- Generate grid for individual days. -->
  <SCRIPT language=JavaScript>
        for (var intWeeks = 0; intWeeks < 6; intWeeks++)
        {
                document.write("<TR>");
                for (var intDays = 0; intDays < days.length; intDays++)
                        document.write("<TD></TD>");
                document.write("</TR>");
        }
  </SCRIPT>

  <!-- Generate today day. -->
  </TBODY>

  <TBODY>
  <TR>
    <TD class=today colSpan=5 id=todayday onclick=getTodayDay()></TD>
    <TD align=right colSpan=2><A href="javascript:HideCalendar();"><SPAN style="COLOR: black; FONT-SIZE: 10px"><B>Hide</B></SPAN></A></TD>
  </TR>
  </TBODY>

</TABLE>
</html>
