<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>NEW EMPLOYEE INSERTION </title>


<script type="text/javascript" src="RepFunc.js"></script>
<script src="js/sel_date.js"></script>






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
       alert('PLEASE ENTER EMPLOYEE CODE');
       f1.T1.value='';
       f1.T1.focus();
       marker=1;
       return false;

}

if(! isNull(f1.T2.value))
{
       alert('PLEASE ENTER A FIRST NAME');
       f1.T2.value='';
       f1.T2.focus();
       marker=1;
       return false;

}

if(f1.T4.value==' ')
{
       alert('PLEASE SELECT A GENERATING STATION');
       f1.T4.focus();
       marker=1;
       return false;

}

if(f1.T5.value==' ')
{
       alert('PLEASE SELECT A DEPARTMENT');
       f1.T5.focus();
       marker=1;
       return false;

}

if(f1.T6.value==' ')
{
       alert('PLEASE SELECT A LEVEL');
       f1.T6.focus();
       marker=1;
       return false;

}

if(f1.T7.value==' ')
{
       alert('PLEASE SELECT A DESIGNATION');
       f1.T7.focus();
       marker=1;
       return false;

}


if(! isPosInt(f1.T1.value))
{
       alert('PLEASE ENTER INTEGER VALUES');
       f1.T1.value='';
       f1.T1.focus();
       marker=1;
       return false;

}

if(marker==0)
{
document.f1.submit();
document.f1.action='doEmpInsertion.jsp';
return true;
}
}
</script>

<body background="Back11.jpg" >

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:10px; top:15px" width="170" height="70">



		  <label style="POSITION: absolute; LEFT: 660px; top:575px"  class="style5" ><b>2012 © Developed by I.T. Department</b></label>

</div>


 <form  name="f1" >
<br>
<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3"><font face="Albertus Extra Bold" size="5" color="#400040">
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;NEW EMPLOYEE INFORMATION INPUT SCREEN</b></font>
<br><br>


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

String empcode=new String("");
String fname=new String("");
String lname=new String("");
String station=new String("");
String department=new String("");
String designation=new String("");
String level=new String("");
String birth=new String("");
String join=new String("");
String mobile=new String("");
String tel1=new String("");
String tel2=new String("");
String email=new String("");
String transfer=new String("");

try{
 MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
 mk.con.setAutoCommit(false);

 try{

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

int cnt=0;
int length1=0;
int length2=0;
int counter=0;
String counter1=new String("");

ps2=mk.con.prepareStatement("SELECT nvl(STATION_LONG_DESC,' '),ORBL_STATION_CD FROM CD_STATION");
rs2=ps2.executeQuery();



ps3=mk.con.prepareStatement("SELECT nvl(DEPT_LDESC,' '),DEPT FROM ORBL_CD_DEPT_MST"); 
rs3=ps3.executeQuery();


ps4=mk.con.prepareStatement("SELECT nvl(DESG_DESC,' '),DESG_CODE FROM ADM_DESG_MST");
rs4=ps4.executeQuery();

%>

<center>
<table>

<tr>   
 <td colspan="1" align="left">
      <font color="660033" size="4"><b>Employee Code </b></font>
</td>
 <td colspan="5" align="left">
     <input type="text" name="T1" size="6" maxlength = "6"    style="color: CC6600 ; border:1px solid  #FFFFCC; background-color: #FFFFCC; font-weight:bold">    
    </td>
  </tr>



<tr>   
 <td colspan="1" align="left">
      <font color="660033" size="4"><b>First Name </b></font>
</td>
 <td colspan="2" align="left">
     <input type="text" name="T2" size="25" maxlength = "25"    style="color: CC6600 ; border:1px solid  #FFFFCC; background-color: #FFFFCC; font-weight:bold">    
    </td>
  

 <td colspan="1" align="left">
      <font color="660033" size="4"><b>Last Name </b></font>
</td>
 <td colspan="2" align="left">
     <input type="text" name="T3" size="25" maxlength = "25"   style="color: CC6600 ; border:1px solid  #FFFFCC; background-color: #FFFFCC; font-weight:bold">    
    </td>

</tr>


  <tr>
 <td colspan="1" align="left">
      <font color="660033" size="4"><b> Generation Unit </b></font>
</td>
 <td colspan="2" align="left">
    <select  name="T4" size="1"  style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     
    
<option selected value=" ">Select</option>    

<%
while(rs2.next())
{
%>
<option value="<%=rs2.getString(2) %>"><%=rs2.getString(1) %></option>

<%
}
rs2.close();
ps2.close();
%>

</select>
</td>
  

 <td colspan="1" align="left">
      <font color="660033" size="4"><b> Department </b></font>
</td>
 <td colspan="2" align="left">
    <select  name="T5" size="1"  style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     
    
<option selected value=" ">Select</option>    

<%
while(rs3.next())
{
%>

<option value="<%=rs3.getString(2) %>"><%=rs3.getString(1) %></option>

<%
}
rs3.close();
ps3.close();
%>



</select>
</td>
</tr>
  
  <tr>
 <td colspan="1" align="left">
      <font color="660033" size="4"><b> Designation </b></font>
</td>
 
 <td colspan="2" align="left">
    <select  name="T7" size="1"  style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     

<option selected value=" ">Select</option>    
<%
while(rs4.next())
{
%>

<option value="<%=rs4.getString(2) %>"><%=rs4.getString(1) %></option>

<%
}
rs4.close();
ps4.close();
%>

</select>
    </td>


 <td colspan="1" align="left">
      <font color="660033" size="4"><b> Level </b></font>
</td>


<td colspan="2" align="left">
    <select name="T6" size="1"   style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     
<option selected value=" ">Select</option>    
<option value="0">Supervisor</option>
<option value="1">Senior DM</option>
<option value="2">Manager/Sr.Manager</option>
<option value="3">DGM/Station Manager</option>
<option value="4">General Manager</option>
<option value="5">Vice President</option>
<option value="6">Executive Director</option>
</select>
    </td>
  

</tr>
  
  <tr>
 <td colspan="1" align="left">
      <font color="660033" size="4"><b> Birth Date </b></font>
</td>
 <td colspan="2" align="left">
    <input type="text" name="T8"  size="11"  id="T8" value=""    style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold" >     
    </td>
  

 <td colspan="1" align="left">
      <font color="660033" size="4"><b> Joining Date </b></font>
</td>
 <td colspan="2" align="left">
    <input type="text" name="T9"  size="11"  id="T9" value=""    style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold" >     
    </td>
</tr>
  

  <tr>
 <td colspan="1" align="left">
      <font color="660033" size="4"><b> Mobile No </b></font>
</td>
 <td colspan="2" align="left">
    <input type="text" name="T10" size="25" maxlength = "51"  style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     
    </td>


 <td colspan="1" align="left">
      <font color="660033" size="4"><b> Date Of Transfer </b></font>
</td>
 <td colspan="2" align="left">
    <input type="text" name="T14"  size="11"   id="T14"  value=""    style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold" >     
    </td>




</tr>
  
  <tr>
 <td colspan="1" align="left">
      <font color="660033" size="4"><b> Telephone No </b></font>
</td>
 <td colspan="2" align="left">
    <input type="text" name="T11" size="20" maxlength = "51"  style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     
    </td>
  

 <td colspan="3" align="left">
    <input type="text" name="T12" size="20" maxlength = "51"  style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     
    </td>
</tr>
  

  <tr>
 <td colspan="1" align="left">
      <font color="660033" size="4"><b> Email id </b></font>
</td>
 <td colspan="5" align="left">
    <input type="text" name="T13" size="25" maxlength = "51"  style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     
    </td>
</tr>


</table>
</center>



<center>
<table>
<tr  >
   <td colspan="3"  align ="center">
      <input type= "button" name = "b1"  value = "INSERT" onClick="info1();" style="color: CC0000 ; border:1px   solid #FFFFCC;background-color: ffcc66; font-weight:bold;  border-style: outset">&nbsp;&nbsp;&nbsp;

      <input type= "reset" name = "b2"  value = "RESET" onClick="window.open('doEmpInsertion.jsp','_self');" style="color: CC0000 ; border: 1px   solid #FFFFCC;background-color: ffcc66; font-weight:bold; border-style: outset" > &nbsp;&nbsp;&nbsp;
      <input type= "button" name = "b4"  value = "BACK"  onclick="window.open('close.html','_self');"  style="color: CC0000 ; border:1px  solid #FFFFCC;background-color: ffcc66; font-weight:bold; border-style: outset">
   </td>
  </tr>
</table>
</center>


<%
int noupd=0;

empcode=request.getParameter("T1");
if(empcode !=null)
{
empcode=request.getParameter("T1");
fname=request.getParameter("T2");
lname=request.getParameter("T3");
station=request.getParameter("T4");
department=request.getParameter("T5");
designation=request.getParameter("T7");
level=request.getParameter("T6");
birth=request.getParameter("T8");
join=request.getParameter("T9");
mobile=request.getParameter("T10");
tel1=request.getParameter("T11");
tel2=request.getParameter("T12");
email=request.getParameter("T13");
transfer=request.getParameter("T14");

if(fname.equals(""))
{
fname="";
}
if(lname.equals(""))
{
lname="";
}
if(station.equals(""))
{
station="";
}
if(department.equals(""))
{
department="";
}
if(designation.equals(""))
{
designation="";
}
if(level.equals(""))
{
level="";
}
if(birth.equals(""))
{
birth="";
}
if(join.equals(""))
{
join="";
}
if(mobile.equals(""))
{
mobile="";
}
if(tel1.equals(""))
{
tel1="";
}
if(tel2.equals(""))
{
tel2="";
}
if(email.equals(""))
{
email="";
}
if(transfer.equals(""))
{
transfer="";
}
counter1="0";
counter=0;

ps2=mk.con.prepareStatement("select count(*) from  adm_emp_mst where emp_code='"+empcode+"'");
rs2=ps2.executeQuery();
while(rs2.next())
{
counter1=rs2.getString(1);
counter=Integer.parseInt(counter1);

}
rs2.close();
ps2.close();

if(counter==0)
{
if((!(join.equals("")))&&(!(birth.equals(""))))
{
ps2=mk.con.prepareStatement("insert into adm_emp_mst(emp_code,emp_fname,emp_lname,emp_genstn,emp_dept,emp_desg,emp_join_dt,emp_birth_dt,emp_level,emp_mobileno,emp_telephone2,emp_telephone3,emp_email_id,crt_by,crd_dt)values('"+empcode+"','"+fname+"','"+lname+"','"+station+"','"+department+"','"+designation+"',to_date('"+join+"','dd/mm/rrrr'),to_date('"+birth+"','dd/mm/rrrr'),'"+level+"','"+mobile+"','"+tel1+"','"+tel2+"','"+email+"','doEmpInsertion',sysdate)");

noupd=ps2.executeUpdate();
ps2.close();

mk.con.commit();

}


if((!(join.equals("")))&&((birth.equals(""))))
{
ps2=mk.con.prepareStatement("insert into adm_emp_mst(emp_code,emp_fname,emp_lname,emp_genstn,emp_dept,emp_desg,emp_join_dt,emp_level,emp_mobileno,emp_telephone2,emp_telephone3,emp_email_id,crt_by,crd_dt)values('"+empcode+"','"+fname+"','"+lname+"','"+station+"','"+department+"','"+designation+"',to_date('"+join+"','dd/mm/rrrr'),'"+level+"','"+mobile+"','"+tel1+"','"+tel2+"','"+email+"','doEmpInsertion',sysdate)");

noupd=ps2.executeUpdate();
ps2.close();
mk.con.commit();
}

if(((join.equals("")))&&(!(birth.equals(""))))
{

ps2=mk.con.prepareStatement("insert into adm_emp_mst(emp_code,emp_fname,emp_lname,emp_genstn,emp_dept,emp_desg,emp_birth_dt,emp_level,emp_mobileno,emp_telephone2,emp_telephone3,emp_email_id,crt_by,crd_dt)values('"+empcode+"','"+fname+"','"+lname+"','"+station+"','"+department+"','"+designation+"',to_date('"+birth+"','dd/mm/rrrr'),'"+level+"','"+mobile+"','"+tel1+"','"+tel2+"','"+email+"','doEmpInsertion',sysdate)");



noupd=ps2.executeUpdate();
ps2.close();
mk.con.commit();
}

if(((join.equals("")))&&((birth.equals(""))))
{
ps2=mk.con.prepareStatement("insert into adm_emp_mst(emp_code,emp_fname,emp_lname,emp_genstn,emp_dept,emp_desg,emp_level,emp_mobileno,emp_telephone2,emp_telephone3,emp_email_id,crt_by,crd_dt)values('"+empcode+"','"+fname+"','"+lname+"','"+station+"','"+department+"','"+designation+"','"+level+"','"+mobile+"','"+tel1+"','"+tel2+"','"+email+"','doEmpInsertion',sysdate)");
noupd=ps2.executeUpdate();
ps2.close();
mk.con.commit();
}

if(!(transfer.equals("")))
{
ps2=mk.con.prepareStatement("update adm_emp_mst set emp_transfer_dt=to_date('"+transfer+"','dd/mm/rrrr') where emp_code='"+empcode+"'");
noupd=ps2.executeUpdate();
ps2.close();
mk.con.commit();
}

ps2=mk.con.prepareStatement("insert into adm_login_mst(login_id,login_passwd,crt_by,crd_dt,login_level,login_effective_dt)values('"+empcode+"','cesc123','doEmpInsertion',sysdate,'"+level+"',sysdate)");


noupd=ps2.executeUpdate();
ps2.close();
mk.con.commit();

%>

<script>
alert('DATA INSERTED SUCCESSFULLY');
f1.T1.value='<%=empcode %>';
f1.T2.value='<%=fname %>';
f1.T3.value='<%=lname %>';
f1.T4.value='<%=station %>';
f1.T5.value='<%=department %>';
f1.T7.value='<%=designation %>';
f1.T6.value='<%=level %>';
f1.T8.value='<%=birth %>';
f1.T9.value='<%=join %>';
f1.T10.value='<%=mobile %>';
f1.T11.value='<%=tel1 %>';
f1.T12.value='<%=tel2 %>';
f1.T13.value='<%=email %>';
</script>

<%
}
else
{
%>
<script>
alert('DETAILS OF THIS EMPLOYEE ALREADY EXISTS');
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


</html>





