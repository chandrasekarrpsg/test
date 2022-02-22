<HTML>

<HEAD>
<title> PASSWORD RESET  </title>
<SCRIPT LANGUAGE="JavaScript">

function autotab(original,destination){
if (original.getAttribute&&original.value.length==original.getAttribute("maxlength"))
destination.focus()
}

function isPosInt(str){
  var pat="0123456789"
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
    i++
  }while(flag==1 && i<str.length)
  if (flag == 1)
    return true;
  return false;
}

function isNumber(str){
  var pat="0123456789."
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
    i++
  }while(flag==1 && i<str.length)
  if (flag == 1)
    return true;
  return false;
}

function isNull(str){
  if(str=='')
    return false;
  return true;
}

function isAmt(str){
    var count=0;
   for (var i=0;i<str.length;i++)
    {
      if(str.charAt(i)==".")
       {
       count=i;
       break; }
    }
   if(count==0||(count==(str.length-3)))
    return true;
  return false;
}

function isValidEmpcd(str){

  if(str.length!=6)
    return false;

  return true;
}

function validateForm(theForm){

  if(!isNull(theForm.T1.value)){
    alert('Please enter a value in the field');
    theForm.T1.value='';
    theForm.T1.focus();
    return false;
  }
  if(!isNumber(theForm.T1.value)){
    alert('Employee code must be numeric');
    theForm.T1.value='';
    theForm.T1.focus();
    return false;
  }
  if(!isValidEmpcd(theForm.T1.value)){
    alert('Employee code should be of 6 characters');
    theForm.T1.value='';
    theForm.T1.focus();
    return false;
  }

    theForm.T1.focus();
}

</SCRIPT>
</HEAD>


<BODY  background="forgot.jpg" onload="javascript:sampleform.T1.focus()">

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:880px; top:15px" width="89" height="47"/>&nbsp;

<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:15px; top:15px" width="170" height="70">


		  <label style="POSITION: absolute; LEFT: 780px; top:575px"  class="style5" ><b>2012 © Developed by I.T. Department</b></label>

</div>


<br><br>

<center>
<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3"><font face="Albertus Extra Bold" size="5" color="#FFFF66">
<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PASSWORD RESET</b></font>
<br><br>

<table border="0" width="100%" height="15%" cellspacing="0">
  <tr>
   <td width="100%" height="50%" >
    <form method="POST" name="sampleform" action="passwd_reset.jsp" onSubmit='return validateForm(this)' valign="middle" align="center" >
     <p valign="middle" align="center">
      <font face="Arial Narrow" size="3" color="#FFFF66"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EMPLOYEE CODE : &nbsp;</b></font>
      <input type="text" name="T1" size="6" maxlength="6" onKeyup="autotab(this, document.sampleform.B1)">
       </p>
     <p valign="middle" align="center">
      <input type="submit" value="Submit" name="B1">&nbsp;&nbsp;
      <input type = "button" value="BACK" onclick="window.open('close.html','_self');">
       </p>
   </form>
  </td>
 </tr>
</table>


<%
if (request.getParameter("T1") != null)
 {
%>

<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>

<%
      String flag="0";

      MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{

      PreparedStatement ps0  = mk.con.prepareStatement(" SELECT login_id FROM ADM_LOGIN_MST "+
                                                       " WHERE  login_id = ? ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps0.setString(1,request.getParameter("T1"));

      ResultSet rs0=ps0.executeQuery();

       while(rs0.next())
          {
            flag="1";
          }

      rs0.close();
      ps0.close();

      if (flag=="1")
      {

      PreparedStatement ps1  = mk.con.prepareStatement(" UPDATE ADM_LOGIN_MST "+
                                                       " SET  login_passwd = enc_dec.encrypt('cesc123') "+
                                                       " WHERE  login_id = ? ",
                                                      ResultSet.TYPE_SCROLL_INSENSITIVE,
                                                      ResultSet.CONCUR_READ_ONLY );

      ps1.setString(1,request.getParameter("T1"));

      int c0=ps1.executeUpdate();

      ps1.close();

      mk.con.commit();

      mk.con.close();

%>

<script>
alert("DEFAULT PASSWORD SET");
</script>

<%

      }

     else

      {

%>

<script>
alert("INVALID EMPLOYEE CODE !!!");
</script>

<%

      }



   }catch(Exception e){System.out.println(e); }
        finally{
                 if(mk.con!=null)
                    {
                    mk.con.close();
                    System.out.println("    CLOSED !!!!!");
                    }
               }

}

%>

</BODY>

</HTML>
