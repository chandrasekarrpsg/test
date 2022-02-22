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
                                text-align: right;
				border-style: solid;
				border-color: #FFE391;
				background-color: #FFE391;
}
.style14 {
                                text-align: left;
				border-style: solid;
				border-color: #FFE391;
				background-color: #FFE391;
}
.style3 {
                                text-align: right;
				border-style: solid;
				border-color: #FFFFBF;
				background-color: #FFFFBF;
}

.style13 {
                                text-align: left;
				border-style: solid;
				border-color: #FFFFBF;
				background-color: #FFFFBF;
}
.style4 {
                                text-align: center;
				border-style: solid;
				border-color:  #D9F2F0;
				background-color:#D9F2F0;
}
.style5 {
                                text-align: right;
				border-style: solid;
				border-color: #75D0C7;
				background-color: #75D0C7;
}
.style6 {
                                text-align: right;
				border-style: solid;
				border-color: #D9D9FF;
				background-color: #D9D9FF;
}
.style7 {
                                text-align: right;
				border-style: solid;
				border-color: #B9B9FF;
				background-color: #B9B9FF;
}

.style8 {
                                text-align: center;
                                color: #ffffff;
                                font-family: Arial;
                                font-size: 10pt;
                                background-color:#008080;
}
.style9 {
				background-color: #86AEAE;
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

function validate_data(){

  var temp = Source;

    var index = temp.indexOf(stringToFind);

        while(index != -1){

            temp = temp.replace(stringToFind,stringToReplace);

            index = temp.indexOf(stringToFind);

        }

        return temp;

}


function updatedata(){

if(validate_data()){
  var parameter='';
   parameter = parameter + 'finyr='+document.f1.finyr.value;
   parameter = parameter + '&genstn='+document.f1.genstn.value;
   parameter = parameter + '&q1='+document.f1.q1.value;
   parameter = parameter + '&q2='+document.f1.q2.value;
   parameter = parameter + '&q3='+document.f1.q3.value;
   parameter = parameter + '&q4='+document.f1.q4.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("quarter_val_fin_update.jsp?"+parameter,"_self");
}else{
  return false;
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
  String finyr1                     = new String("");
  String month                      = new String("");
  String compare                    = new String("");
  String mon_basis                  = new String("");
  String empcd                      = new String("");
  String sysdate                    = new String("");
  String your_desg                  = new String("");
  String updated_upto               = new String("");
  String sStyle                     = new String("");
  int cnt=1;
  int counter=0;

try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);
     empcd     = request.getParameter("empcd");

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
      
       ps = mk.con.prepareStatement(" select distinct bgt_yr||'-'||to_char(add_months(to_date(bgt_yr,'YYYY'),12),'YYYY'),bgt_yr "+ 
                                    " from bgt_form2b_data order by bgt_yr desc ");
       rs = ps.executeQuery();

       
%>

<form method="post" name="f1" action="ins_quarter_val_fin.jsp">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:250px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Insertion Of Finance Declared Value</font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>

<label style="left:900px; top:30px; position: absolute" >
<a href="submenu_budget_mon_updation.jsp" target="_top" style="position: absolute; left: 15; top: 25"> <H1><font color="#0000CC">Back </H1></a></font></b>
</label>
<br>
<br>
<br>
<table id="mytable" style="width: 100%" border="0" class="style9" >
        <tr height="10">
           <td style="width: 50%" align="center"><strong><font face="Book Antiqua" color="#800000" size="3">Station :&nbsp;&nbsp;&nbsp;
           <select size="1" name="genstn" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
              <option selected value="B">BBGS</option>
              <option value="T">TGS</option>
              <option value="S">SGS</option>
              <option value="N">NCGS</option>
              <option value="C">CTM</option>
              <option value="E">ED(G)E</option>
           </select>
           </strong></td>
           <td style="width: 50%" align="center" colspan="2"><strong><font face="Book Antiqua" color="#800000" size="3">Financial Year :&nbsp;&nbsp;&nbsp;
           <select size="1" name="finyr" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
             <% 
                while(rs.next()){
             %>
              <option value=<%=rs.getString(2)%>><%=rs.getString(1)%></option>
             <%
                }
                rs.close();
                ps.close();
             %>
           </select>
           </strong></td>
           </tr>
</table>
<br>
<table style="width: 70%" border="1" align="center">
        <tr>
                <td style="width: 20%" class="style8"  colspan="12" align="middle"><strong>Quarters and value(Finance) </strong></td>
        </tr>
        <tr>
                <td style="width: 25%" class="style8"><strong>Q1</strong></td>
                <td style="width: 25%" class="style8"><strong>Q2</strong></td>
                <td style="width: 25%" class="style8"><strong>Q3</strong></td>
                <td style="width: 25%" class="style8"><strong>Q4</strong></td>
        </tr>
        <tr>
		<td class="style4" style="width: 7%"><input type="text" id="q1" name="q1" value="" size= "15" maxlength="13"/></td>
		<td class="style4" style="width: 7%"><input type="text" id="q2" name="q2" value="" size= "15" maxlength="13"/></td>
		<td class="style4" style="width: 8%"><input type="text" id="q3" name="q3" value="" size= "15" maxlength="13"/></td>
		<td class="style4" style="width: 8%"><input type="text" id="q4" name="q4" value="" size= "15" maxlength="13"/></td>
       </tr>
</table>
<br>

<table style="width: 100%" border="0" align="center">
  <tr width="100%">
  <td align="center">
     <input type="button" value="Update" id="update" name="update" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="updatedata();">
  </td>
  </tr>
</table>

<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
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
</form>
</body>
</html>
