<html>

    <head>
       <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
       <meta name="GENERATOR" content="Microsoft FrontPage 4.0">
       <meta name="ProgId" content="FrontPage.Editor.Document">
       <title> CHANGE DEPARTMENT (WITHIN G/S) </title>
       <SCRIPT type="text/javascript" src="calender.js"></SCRIPT>
       <link rel="stylesheet" type="text/css" href="calender.css"/>
    </head>

    <script language="javascript">

    function isNull(str){
          if (str=='')
              return false;
          return true;
    }

    function disableField(myField){
             myField.disabled = true
             return true
    }

    function enableField(myField){
             myField.disabled = false
             return true
    }

    function autotab(original,destination){
             if (original.getAttribute && original.value.length==original.getAttribute("maxlength"))
             destination.focus()
    }

    function info1(){
             if (isNull(f1.T1.value)){
                 document.f1.action = "doChangeDept.jsp?T1="+f1.T1.value;
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
             if (isNull(f1.T8.value)){
                 document.f1.action = "doChangeDept.jsp?T1="+f1.T1.value+"&T8="+f1.T8.value;
                 document.f1.submit();
             }
             else
             {
                 alert('Please Select New Department to update')
                 f1.T8.value='';
                 f1.T8.focus();
                 return false;
             }
     }

     function cal(){
              if (isNull(f1.T1.value))
                  f1.T8.focus();
              else
                  f1.T1.focus();
     }

     </script>

     <body background="Back11.jpg" onload="cal();">

           <img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

           <div class="left">
                <p><img border="0" src="rlogo.png" style="position:absolute; left:10px; top:15px" width="170" height="70">


	        <label style="POSITION: absolute; LEFT: 780px; top:575px"  class="style5" ><b>2012 © Developed by I.T. Department</b></label>

           </div>

           <form  name="f1"  >

                  <p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3">
                     <font face="Albertus Extra Bold" size="5" color="#400040">
                           <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;CHANGE DEPARTMENT (WITHIN UNIT / GEN. STN.</b>
                     </font>
                  <br><br>
                  <label style="left: 0px; top: 95px; position: absolute">
                  <table>
                        <tr>
                           <td colspan="4">
                               <font color="660033" size="4"><b>Employee Code</b></font>
                           </td>
                           <td colspan="1">    
                               <input type="text"  name="T1" size="6" maxlength = "6" onkeypress="if(window.event.keyCode==13){info1(); }" >
                           </td>
                           <td colspan="3">
                               <font color="660033" size="4"><b>Employee Name </b></font>
                           </td>
                           <td colspan="1"> <input type="text" name="T2" size="50" maxlength = "50" readOnly="true"   style="color: CC6600 ; border:1px solid  #FFFFCC; background-color: #FFFFCC; font-weight:bold">    
                           </td>
                        </tr>
                        <tr>
                           <td colspan="3">
                               <font color="660033" size="4"><b>Designation </b></font>
                           </td>
                           <td colspan="1" ><input type="text" name="T3" size="30" maxlength = "30" readOnly="true" style="color: CC6600 ; border:1px   solid #FFFFCC; background-color: #FFFFCC; font-weight:bold">     
                           </td>
                        </tr>
                        <tr>
                           <td colspan="3">
                               <font color="660033" size="4"><b>Unit/Gen.Stn.</b></font>
                           </td>
                           <td colspan="1">    
                               <input type="text"  name="T4" size="30" maxlength = "30"  readOnly="true" style="color: CC6600 ; border:1px   solid #FFFFCC;background-color: #FFFFCC"; font-weight:bold >
                           </td>
                        </tr>
                        <tr>
                           <td colspan="3">
                               <font color="660033" size="4"><b>Department</b></font>
                           </td>
                           <td  colspan="1">
                                <input type="text" name="T5" size="30" maxlength = "30" readOnly="true" style="color: CC6600 ; border:1px   solid #FFFFCC;background-color: #FFFFCC; font-weight:bold">  
                           </td>
                        </tr>
                        <tr>
                           <td colspan="4">
                               <font color="660033" size="4"><b>Enter&nbsp;New&nbsp;Department&nbsp;&nbsp;</b></font>
                           </td>
                           <td colspan="1">
                               <input type="text"  name="T8" size="02"  maxlength = "02"  onKeyup="autotab(this,document.f1.b1)">                                        
                           </td>
                        </tr>
         	  </table>
                  </label>
                  <label style="left:0px; top:450px; position:absolute">
                  <table>
                        <tr bgcolor="#ACCCCC" >
                            <td width ="100%" bgcolor="#FFFFCC" align ="center"> 
                                <input type= "button" name = "b1"  value = "UPDATE" onClick="info()" style="color: CC6600 ; border:1px   solid #FFFFCC;background-color: #CC9900; font-weight:bold;  border-style: outset"  >

                                <input type= "reset" name = "b2"  value = "RESET" onClick="window.open('doChangeDept.jsp','_self');" style="color: CC6600 ; border:1px   solid #FFFFCC;background-color: #CC9900; font-weight:bold; border-style: outset" >

                                <input type= "button" name = "b3"  value = "BACK"  onclick="window.open('close.html','_self');"  style="color: CC6600 ; border:1px   solid #FFFFCC;background-color: #CC9900; font-weight:bold; border-style: outset">

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

<%  
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
              String empcode =  request.getParameter("T1");
              String upddept =  request.getParameter("T8");
              
              int cnt=0;

              if ( empcode != null ) {
                   if (upddept != null && upddept.length()>1) {
                       ps1  = mk.con.prepareStatement(" UPDATE ADM_EMP_MST "+
                                                      " SET  emp_dept = ?  "+
                                                      " WHERE emp_code ='"+empcode+"'  ");
                       ps1.setString(1,upddept);
                       ps1.executeUpdate();
                       ps1.close();
                       mk.con.commit();
%>
     <script>
         alert('Updation Successful')
         document.f1.action=window.open('doChangeDept.jsp','_self')
     </script>
<%
     }
     else
     { 
         ps1  = mk.con.prepareStatement(" SELECT TRIM(emp_fname)||' '||TRIM(emp_lname), "+
                                        " emp_desg||'-'||desg_desc,"+ 
                                        " emp_genstn||'-'||station_long_desc,"+ 
                                        " emp_dept||'-'||dept_ldesc"+ 
                                        " FROM ADM_EMP_MST,ADM_DESG_MST,CD_STATION,ORBL_CD_DEPT_MST"+ 
                                        " WHERE  emp_code='"+empcode+"'   "+
                                        " AND ADM_EMP_MST.emp_desg = ADM_DESG_MST.desg_code "+
                                        " AND ADM_EMP_MST.emp_genstn = CD_STATION.ORBL_STATION_CD "+
                                        " AND ADM_EMP_MST.emp_genstn = ORBL_CD_DEPT_MST.station "+
                                        " AND ADM_EMP_MST.emp_dept   = ORBL_CD_DEPT_MST.dept_ldesc ",
                                        ResultSet.TYPE_SCROLL_INSENSITIVE,
                                        ResultSet.CONCUR_READ_ONLY );
         rs1=ps1.executeQuery();
         ps0=mk.con.prepareStatement(" SELECT COUNT(*)               "+
                                     " FROM ADM_EMP_MST              "+ 
                                     " WHERE  emp_code='"+empcode+"' ",
                                     ResultSet.TYPE_SCROLL_INSENSITIVE,
                                     ResultSet.CONCUR_READ_ONLY );
         rs0=ps0.executeQuery();
         while (rs0.next()) { 
                cnt=rs0.getInt(1);
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
     </script>
<%
           }
     }
     else{
%>
     <label style="left: 50px;top: 360px;position: absolute">
          <font color="red" size="6"><p align="center"> No record found with given employee code</p> 
          </font>
     </label>

<%
     }

     rs1.close();
     ps1.close();

%>
     <SCRIPT language="JavaScript">
          document.f1.T1.value = '<%= empcode %>' ;
          f1.T8.focus();
     </SCRIPT>
<%
              }
         }

     }
     catch(Exception e){ out.print(e);}
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
