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
.style3 {
        text-align: center;
        color: #ffffff;
        font-family: Arial;
        font-size: 10pt;
        background-color:#008080;
}
.style4 {
        border-color: #88799D;
        font-family: Arial;
        font-size: small;
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

function ReplaceAll(Source,stringToFind,stringToReplace){

  var temp = Source;

    var index = temp.indexOf(stringToFind);

        while(index != -1){

            temp = temp.replace(stringToFind,stringToReplace);

            index = temp.indexOf(stringToFind);

        }

        return temp;

}

function reject_data(){

var y=0;
var x=0;
var chkset='';
var rmksset='';
var seccdset='';
var currmks='';
var currmks1='';
 for (var z=1;z<=f1.totsec.value;z++) {
     chkset=chkset+document.getElementById("chk"+z).checked+'|';
     currmks=document.getElementById("rmks"+z).value;
if(currmks == ''){
  currmks ='@';
}

currmks1=ReplaceAll(currmks,'&','amperssion');
currmks=ReplaceAll(currmks1,'%','percentspl');

     rmksset=rmksset+currmks+'|';
     seccdset=seccdset+document.getElementById("seccd"+z).value+'|';
    
     if(document.getElementById("chk"+z).checked==1) {
      x++;
       if(document.getElementById("rmks"+z).value==''){
         alert('Please Enter Remarks For Rejected Sections.');
         document.getElementById("rmks"+z).focus();
         return false;
         y++;
       }
     }
 }
if(y==0){
  if(x==0){
    alert('ATLEAST SELECT 1 SECTION FOR REJECTION');
    return false;
  }else{
   var parameter='';
   parameter = parameter + 'stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
   parameter = parameter + '&totsec='+document.f1.totsec.value;
   parameter = parameter + '&chkset='+chkset;
   parameter = parameter + '&rmksset='+rmksset;
   parameter = parameter + '&seccdset='+seccdset;
   parameter = parameter + '&sec_under_auth='+document.f1.sec_under_auth.value;
//alert(parameter);
window.open("gen_spec_rej_upd_all_insrt.jsp?"+parameter,"_self");
 }
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
  PreparedStatement ps3             = null;
  ResultSet rs3                     = null;
  MakeConnectionGENORBL mk          = null;
  String finyr                      = new String("");
  String emp_desg                   = new String("");
  String stn_cd                     = new String("");
  String sec_under_auth             = new String("");
  String cur_bgt_ver                = new String("");
  String cur_bgt_level              = new String("");
  String cur_bgt_yr                 = new String("");
  String sec_bgt_finalized          = new String("");
  String max_bgt_level              = new String("");
  String max_bgt_level1             = new String("");
  String sec_bgt_ready              = new String("");
  String sec_bgt_pndg_apprvl        = new String("");
  String sec_bgt_pndg_auth          = new String("");
  String sec_bgt_pub                = new String("");
  String sec_bgt_entry_started      = new String("");
  String rmks                       = new String("");
  String sStyle                     = new String("");
  String station                    = new String("");
  String sysdate                    = new String("");
  String finyr1                     = new String("");
  String sec_all_auth               = new String("");
  String entry_emp_desg             = new String("");
  String empcd                      = new String("");
  String auth_flg                   = new String("0");
  String view_auth_flg              = new String("0");
  String forward_flg                = new String("0");
  String rej_flg                    = new String("0");
  String view_flg                   = new String("0");
  String sec_bgt_finalized_flg      = new String("0");
  String sec_bgt_pndg_apprvl_flg    = new String("0");
  String sec_bgt_entry_started_flg  = new String("0");
  String sec_bgt_ready_flg          = new String("0");
  String sec_bgt_pub_flg            = new String("0");
  String view_exist                 = new String("");
  String rej_exist                  = new String("");
  String forward_exist              = new String("");
  String auth_exist                 = new String("");
  String view_auth_exist            = new String("");
  String your_desg                  = new String("");
int cnt=0;
try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);
     stn_cd = request.getParameter("stn_cd");
     sec_under_auth = request.getParameter("sec_cd");
     finyr  = request.getParameter("finyr");
     finyr1 = request.getParameter("finyr1");
     empcd  = request.getParameter("empcd");

System.out.println("stn_cd:"+stn_cd);
System.out.println("sec_cd:"+sec_under_auth);
System.out.println("finyr:"+finyr);
System.out.println("finyr1:"+finyr1);
System.out.println("empcd:"+empcd);

       ps = mk.con.prepareStatement("select to_char(trunc(sysdate),'DD-MON-RRRR') from dual");
       rs = ps.executeQuery();
       while(rs.next()){
            sysdate = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select emp_desg from bgt_level where emp_code=? and bgt_yr=(select max(bgt_yr) from bgt_level)");
       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            your_desg = rs.getString(1);
       }
       rs.close();
       ps.close();

       ps = mk.con.prepareStatement("select STATION_SHT_DESC from CD_STATION where BGT_STATION_CD=? ");
       ps.setString(1,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            station = rs.getString(1);
       }
       rs.close();
       ps.close();

%>
<form name="f1">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="3">REJECTION FORM OF SECTION(S) UNDER <%=sec_under_auth%> OF <%=station%> FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>

<%

       ps = mk.con.prepareStatement("select distinct emp_desg from bgt_level where emp_code=? and bgt_yr=(select max(bgt_yr) from bgt_level )");
       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            emp_desg = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement(" select distinct sec_cd from bgt_level where emp_desg=? and bgt_yr=(select max(bgt_yr) from bgt_level) order by sec_cd "); 
       ps.setString(1,sec_under_auth);
       rs = ps.executeQuery();
%>
<br>
<br>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 20%" class="style3"  colspan="7" align="middle"><strong>SECTION(S) UNDER <%=emp_desg%></strong></td>
        </tr>

        <tr>
                <td style="width: 20%" class="style3"><strong>(Click to reject)</strong></td>
                <td style="width: 30%" class="style3"><strong>SECTION NAME</strong></td>
                <td style="width: 50%" class="style3"><strong>REMARKS</strong></td>
        </tr>
<%
while(rs.next()){
cnt=cnt+1;
%>
<tr>
<input type="hidden" id="seccd<%=cnt%>" name ="seccd<%=cnt%>" value="<%=rs.getString(1)%>" />
                <td style="width: 20%" class="style5" align="center"><strong><input id="chk<%=cnt%>" name="chk<%=cnt%>" type="checkbox" /></strong></td>
                <td style="width: 30%" class="style5" align="center"><strong><%=rs.getString(1)%></strong></td>
                <td style="width: 50%" class="style5" align="center"><strong><input type="text" id="rmks<%=cnt%>" name="rmks<%=cnt%>" value="" size="70"/></strong></td>
</tr>
<%
}
rs.close();
ps.close();
%>
</table>
<br>
<table style="width: 100%" border="0">
<tr width="100%"><td align="center">
<input type="button" value="Reject" id="B" name="B" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="reject_data();");">
</td></tr>
</table>
<input type="hidden" id= "stn_cd" name = "stn_cd" value="<%=stn_cd%>" />
<input type="hidden" id= "finyr" name = "finyr" value="<%=finyr%>" />
<input type="hidden" id= "finyr1" name = "finyr1" value="<%=finyr1%>" />
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
<input type="hidden" id= "totsec" name = "totsec" value="<%=cnt%>" />
<input type="hidden" id= "sec_under_auth" name = "sec_under_auth" value="<%=sec_under_auth%>" />

<%
}catch(Exception e){
  e.printStackTrace();
}finally{
   mk.con.close();
}

%>
</body>
</html>
