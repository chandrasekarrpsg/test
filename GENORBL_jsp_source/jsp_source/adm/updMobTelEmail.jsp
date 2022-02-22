<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>UPDATION OF MOBILE / TELEPHONE / E-MAIL INFORMATION</title>
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
if(isNull(f1.T1.value))
{
       document.f1.action = "updMobTelEmail.jsp?T1="+f1.T1.value;
       document.f1.submit();
}
else
{
       alert('please enter employee code')
       f1.T1.value='';
       f1.T1.focus();
       return false;

}

}
function info(){
    if(isNull(f1.T8.value))
    {
        document.f1.action = "updMobTelEmail.jsp?T1="+f1.T1.value+"&T8="+f1.T8.value;
        document.f1.submit();
    }
    else
    {
        alert('please select a date to update')
        f1.T8.value='';
        f1.T8.focus();
        return false;

    }

}
function cal()
{
   if(isNull(f1.T1.value))
       f1.T8.focus();
   else
       f1.T1.focus();
}


</script>



<body background="Back11.jpg" onload="cal();">

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:10px; top:15px" width="170" height="70">



		  <label style="POSITION: absolute; LEFT: 660px; top:575px"  class="style5" ><b>2012 © Developed by I.T. Department</b></label>

</div>


 <form  name="f1"  >
<br>
<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3"><font face="Albertus Extra Bold" size="5" color="#400040">
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;UPDATION OF MOBILE / TELEPHONE / E-MAIL INOFRMATION</b></font>
<br><br>


<label style="left: 0px; top: 95px; position: absolute">
<table  >
  <tr>
    <td colspan="4">
     <font color="660033" size="4"><b>Employee Code</b></font>
    </td>
    <td colspan="1">    
      <input type="text"  name="T1" size="6" maxlength = "6" onkeypress="if(window.event.keyCode==13){info1();}"  >
    </td>
    <td colspan="3" >
      <font color="660033" size="4"><b>Employee Name </b></font>
    </td>
    <td colspan="1"> <input type="text" name="T12" size="51" maxlength = "51" readOnly="true"   style="color: CC6600 ; border:1px solid  #FFFFCC; background-color: #FFFFCC; font-weight:bold">    
    </td>
  </tr>

  <tr>
    <td colspan="4" ></td>
    <td colspan="1"></td>
    <td colspan="3" >
      <font color="660033" size="4"><b> Mobile No. </b></font>
    </td>
    <td colspan="1" ><input type="text" name="T2" size="10" maxlength = "10" readOnly="true" style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     
    </td>
  </tr>
  <tr>
    <td colspan="4" ></td>
    <td colspan="1"></td>
    <td colspan="3" >
      <font color="660033" size="4"><b> Telephone-1</b></font>
    </td>
    <td colspan="1" ><input type="text" name="T3" size="10" maxlength = "10" readOnly="true" style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     
    </td>
  </tr>
  <tr>
    <td colspan="4" ></td>
    <td colspan="1"></td>
    <td colspan="3" >

     <font color="660033" size="4"><b>Telephone-2</b></font>
    </td>
    <td colspan="1" >    
      <input type="text"  name="T4" size="10" maxlength = "10"  readOnly="true" style="color: CC6600 ; border:1px   solid #FFFFCC;background-color: #FFFFCC"; font-weight:bold >
    </td>
</tr>
  <tr>
    <td colspan="4" ></td>
    <td colspan="1"></td>

    <td colspan="3" >
          <font color="660033" size="4"><b>E-mail Id</b></font>
    </td>
    <td  colspan="1">
    <input type="text" name="T5" size="30" maxlength = "30" readOnly="true" style="color: CC6600 ; border:1px   solid #FFFFCC;background-color: #FFFFCC; font-weight:bold">  
</td>

  </tr>


<tr>
    <td colspan="4" >
<font color="660033" size="4"><b>New&nbsp;Mobile&nbsp;No. </b></font>
</td>
    <td colspan="1">
<input type="text"  name="T8" size="10"  maxlength = "10"  onKeyup="autotab(this, document.f1.T9)"  >
    </td>
<td colspan="3" ></td>
    <td colspan="1" >
</td>

  </tr>

<tr>
    <td colspan="4" >
<font color="660033" size="4"><b>New&nbsp;Telephone-1 </b></font>
</td>
    <td colspan="1">
<input type="text"  name="T9" size="10"  maxlength = "10"  onKeyup="autotab(this, document.f1.T10)"  >
    </td>
<td colspan="3" ></td>
    <td colspan="1" >
</td>

  </tr>

<tr>
    <td colspan="4" >
<font color="660033" size="4"><b>New&nbsp;Telephone-2 </b></font>
</td>
    <td colspan="1">
<input type="text"  name="T10" size="10"  maxlength = "10"  onKeyup="autotab(this, document.f1.T11)"  >
    </td>
<td colspan="3" ></td>
    <td colspan="1" >
</td>

  </tr>

<tr>
    <td colspan="4" >
<font color="660033" size="4"><b>New&nbsp;E-mail&nbsp;Id </b></font>
</td>
    <td colspan="1">
<input type="text"  name="T11" size="30"  maxlength = "30"  onKeyup="autotab(this, document.f1.b1)"  >
    </td>
<td colspan="3" ></td>
    <td colspan="1" >
</td>

  </tr>


	  </table>
</label>
<label style="left:0px; top:450px; position:absolute"><table>

  <tr bgcolor="#ACCCCC" >
   <td width ="100%" bgcolor="#FFFFCC" align ="center"> 
      <input type= "button" name = "b1"  value = "UPDATE" onClick="info()" style="color: CC6600 ; border:1px   solid #FFFFCC;background-color: #CC9900; font-weight:bold;  border-style: outset"  >

      <input type= "reset" name = "b2"  value = "RESET" onClick="window.open('updMobTelEmail.jsp','_self');" style="color: CC6600 ; border:1px   solid #FFFFCC;background-color: #CC9900; font-weight:bold; border-style: outset" >

      <input type= "button" name = "b4"  value = "BACK"  onclick="window.open('close.html','_self');"  style="color: CC6600 ; border:1px   solid #FFFFCC;background-color: #CC9900; font-weight:bold; border-style: outset">

   </td>    
  </tr>
</table>
</label>

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

<% try{
 MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
 mk.con.setAutoCommit(false);

 try{

PreparedStatement  ps0=null;
         ResultSet rs0=null;

PreparedStatement  ps=null;
         ResultSet rs=null;

PreparedStatement ps1=null;
ResultSet rs1=null;

String empcode =  request.getParameter("T1");

String newmob   =  request.getParameter("T8");
String newtel1  =  request.getParameter("T9");
String newtel2  =  request.getParameter("T10");
String newemail =  request.getParameter("T11");

  
int cnt=0;


if ( empcode != null ) {
if(newmob != null && newmob.length()>1)
{

  ps1  = mk.con.prepareStatement(" UPDATE ADM_EMP_MST "+
                                 " SET  emp_mobileno   = ? , "+
                                 "      emp_telephone2 = ? , "+
                                 "      emp_telephone3 = ? , "+
                                 "      emp_email_id   = ?   "+
                                 " WHERE emp_code ='"+empcode+"'  ");


  ps1.setString(1,newmob);
  ps1.setString(2,newtel1);
  ps1.setString(3,newtel2);
  ps1.setString(4,newemail);

ps1.executeUpdate();
ps1.close();
mk.con.commit();
%>
<script>
         alert('Updation Completed')
         document.f1.action=window.open('updMobTelEmail.jsp','_self')
</script>
<%
}

else
{ 

ps1  = mk.con.prepareStatement(" SELECT NVL(emp_mobileno,'N/A'), "+
                               " NVL(emp_telephone2,'N/A'),      "+ 
                               " NVL(emp_telephone3,'N/A'),      "+ 
                               " NVL(emp_email_id,'N/A'),        "+ 
                               " TRIM(UPPER(emp_fname))||' '||TRIM(UPPER(emp_lname))         "+ 
                               " FROM ADM_EMP_MST                "+ 
                               " WHERE  emp_code='"+empcode+"'   ",
                               ResultSet.TYPE_SCROLL_INSENSITIVE,
                               ResultSet.CONCUR_READ_ONLY );

rs1=ps1.executeQuery();

ps0  = mk.con.prepareStatement(" SELECT COUNT(*)                           "+
                               " FROM ADM_EMP_MST                          "+ 
                               " WHERE  emp_code='"+empcode+"'             ",
                               ResultSet.TYPE_SCROLL_INSENSITIVE,
                               ResultSet.CONCUR_READ_ONLY );

rs0=ps0.executeQuery();
while(rs0.next())
{ cnt=rs0.getInt(1);
}
rs0.close();
ps0.close();


if(cnt>=1)
{


while(rs1.next()){

%>
<script  language="JavaScript">
document.f1.T2.value='<%=rs1.getString(1)%>';
document.f1.T3.value='<%=rs1.getString(2)%>';
document.f1.T4.value='<%=rs1.getString(3)%>';
document.f1.T5.value='<%=rs1.getString(4)%>';
document.f1.T12.value='<%=rs1.getString(5)%>';

document.f1.T8.value='<%=rs1.getString(1)%>';
document.f1.T9.value='<%=rs1.getString(2)%>';
document.f1.T10.value='<%=rs1.getString(3)%>';
document.f1.T11.value='<%=rs1.getString(4)%>';


</script>




<%
}


}
else{
%>
<label style="left: 50px;top: 360px;position: absolute">
<font color="red" size="6"><p align="center"> No record found with given employee code</p> </font></label>

<%
}


rs1.close();
ps1.close();


%>
<SCRIPT language="JavaScript">
document.f1.T1.value = '<%= empcode %>' ;
f1.T1.focus();

</SCRIPT>





<%
}
}

}
catch(Exception e)
 { out.print(e);}
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
