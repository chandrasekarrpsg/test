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
.style3 {
                                text-align: left;
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
                                text-align: left;
				border-style: solid;
				border-color:  #D9F2F0;
				background-color:#D9F2F0;
}
.style14 {
                                text-align: right;
				border-style: solid;
				border-color:  #D9F2F0;
				background-color:#D9F2F0;
}
.style15 {
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
                                text-align: left;
                                color: #ffffff;
                                font-family: Arial;
                                font-size: 10pt;
                                background-color:#008080;
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


function ReplaceAll(Source,stringToFind,stringToReplace){

  var temp = Source;

    var index = temp.indexOf(stringToFind);

        while(index != -1){

            temp = temp.replace(stringToFind,stringToReplace);

            index = temp.indexOf(stringToFind);

        }

        return temp;

}

function submitdata(){
var comments =document.f1.comments.value;
var comments1='';
comments1=ReplaceAll(comments,'&','amperssion');
comments=ReplaceAll(comments1,'%','percentspl');
  var parameter='';
   parameter = parameter + 'finyr='+document.f1.finyr.value;
   parameter = parameter + '&month='+document.f1.month.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&station='+document.f1.station.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
   parameter = parameter + '&comments='+document.f1.comments.value;
   parameter = parameter + '&type='+document.f1.type.value;
//alert(parameter);
window.open("add_comment_on_exp_insert.jsp?"+parameter,"_self");
}

function sb_data(){
  var parameter='';
   parameter = parameter + 'finyr='+document.f1.finyr.value;
   parameter = parameter + '&month='+document.f1.month.value;
   parameter = parameter + '&station='+document.f1.station.value;
   parameter = parameter + '&type='+document.f1.type.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("add_comment_on_exp.jsp?"+parameter,"_self");
}

function delete_data(){

var y=0;
var x=0;
var chkset='';
var monthset='';
var groupset='';
 for (var z=1;z<=f1.totcnt.value;z++) {
     chkset=chkset+document.getElementById("chk"+z).checked+'|';
     monthset=monthset+document.getElementById("mnth"+z).value+'|';
     groupset=groupset+document.getElementById("grp"+z).value+'|';

     if(document.getElementById("chk"+z).checked==1) {
      x++;
     }
 }
  if(x==0){
    alert('ATLEAST SELECT 1 DETAIL FOR DELETION');
    return false;
  }else{
   var parameter='';
   parameter = parameter + 'station='+document.f1.station.value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
   parameter = parameter + '&totcnt='+document.f1.totcnt.value;
   parameter = parameter + '&chkset='+chkset;
   parameter = parameter + '&monthset='+monthset;
   parameter = parameter + '&groupset='+groupset;
   parameter = parameter + '&month='+document.f1.month.value;
   parameter = parameter + '&type='+document.f1.type.value;
alert(parameter);
window.open("delete_comment_on_exp.jsp?"+parameter,"_self");
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
  MakeConnectionGENORBL mk          = null;
  String finyr                      = new String("");
  String cnt_flg                    = new String("");
  String finyr1                     = new String("");
  String finyr2                     = new String("");
  String month                      = new String("");
  String empcd                      = new String("");
  String sysdate                    = new String("");
  String station                    = new String("");
  String type                       = new String("");
  String your_desg                  = new String("");
  String updated_upto               = new String("");
  String mtd_act                    = new String("");
  String month_budget               = new String("");
  String dev                        = new String("");
  String dev_per                    = new String("");
  String dev_per_ind                = new String("");
  String date_ind                   = new String("");
  String cur_month                  = new String("");

  String sStyle                     = new String("");
  int cnt=0;
  int counter=0;

try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);
     empcd     = request.getParameter("empcd");
     month     = request.getParameter("month");
     finyr     = request.getParameter("finyr");
     station   = request.getParameter("station");
     type      = request.getParameter("type");
     finyr1    = finyr.substring(0,4);

if(month.equals("Apr")){
   finyr2= finyr1;
}else if (month.equals("May")){
   finyr2= finyr1;
}else if (month.equals("Jun")){
   finyr2= finyr1;
}else if (month.equals("Jul")){
   finyr2= finyr1;
}else if (month.equals("Aug")){
   finyr2= finyr1;
}else if (month.equals("Sep")){
   finyr2= finyr1;
}else if (month.equals("Oct")){
   finyr2= finyr1;
}else if (month.equals("Nov")){
   finyr2= finyr1;
}else if (month.equals("Dec")){
   finyr2= finyr1;
}else if (month.equals("Jan")){
   finyr2    = finyr.substring(5,9);
}else if (month.equals("Feb")){
   finyr2    = finyr.substring(5,9);
}else{
   finyr2    = finyr.substring(5,9);
}


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
       
      ps = mk.con.prepareStatement(" select case when to_char(trunc(sysdate),'dd') > 25 then 'N' else 'B'end from dual ");
      rs = ps.executeQuery();
      while(rs.next()){
            date_ind = rs.getString(1);
      }
      rs.close();
      ps.close();
      
      ps = mk.con.prepareStatement(" select to_char(trunc(sysdate),'Mon') from dual ");
      rs = ps.executeQuery();
      while(rs.next()){
            cur_month = rs.getString(1);
      }
      rs.close();
      ps.close();
       
       ps = mk.con.prepareStatement("select distinct bgt_yr||'-'||to_char(add_months(to_date(bgt_yr,'YYYY'),12),'YYYY'),bgt_yr from bgt_form2b_data where bgt_yr <>? order by bgt_yr desc ");
       ps.setString(1,finyr1);
       rs = ps.executeQuery();

%>
<form method="post" name="f1" action="add_comment_on_exp.jsp">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:200px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">Monthly Budget Vs Actual Deviation Analysis.(Add Comment if deviation is more than +/- 20)</font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>

<label style="left:900px; top:5px; position: absolute" >
<a href="submenu_budget_mon_updation.jsp" target="_top" style="position: absolute; left: 15; top: 25"> <H1><font color="#0000CC">Back </H1></a></font></b>
</label>
<br>
<br>
<br>
<table id="mytable" style="width: 100%" border="0" class="style9" >
        <tr height="10">
           <td style="width: 25%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Financial Year :&nbsp;&nbsp;&nbsp;
           <select size="1" name="finyr" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onChange="sb_data();"/>
              <option selected value=<%=finyr%>><%=finyr%></option>
             <% 
                while(rs.next()){
             %>
              <option value=<%=rs.getString(1)%>><%=rs.getString(1)%></option>
             <%
                }
                rs.close();
                ps.close();
             %>
           </select>
           </strong></td>
           <td style="width: 25%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Month :&nbsp;&nbsp;&nbsp; 
           <select size="1" name="month" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onChange="sb_data();"/>
              <option selected value=<%=month%>><%=month%></option>
              <option value="Jan">Jan</option>
              <option value="Feb">Feb</option>
              <option value="Mar">Mar</option>
              <option value="Apr">Apr</option>
              <option value="May">May</option>
              <option value="Jun">Jun</option>
              <option value="Jul">Jul</option>
              <option value="Aug">Aug</option>
              <option value="Sep">Sep</option>
              <option value="Oct">Oct</option>
              <option value="Nov">Nov</option>
              <option value="Dec">Dec</option>
           </select>
           </strong></td>
           <td style="width: 25%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Station :&nbsp;&nbsp;&nbsp; 
           <select size="1" name="station" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onChange="sb_data();"/>
              <option selected value=<%=station%>><%=station%></option>
              <option value="BBGS">BBGS</option>
              <option value="TGS">TGS</option>
              <option value="SGS">SGS</option>
              <option value="NCGS">NCGS</option>
              <option value="CTM">CTM</option>
              <option value="EDGE">EDGE</option>
           </select>
           </strong></td>
           <td style="width: 25%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Type :&nbsp;&nbsp;&nbsp; 
           <select size="1" name="type" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onChange="sb_data();"/>
              <option selected value=<%=type%>><%=type%></option>
<%
if(!type.equals("select")){
%>
              <option value="select">select</option>
<%
}
%>
              <option value="Materials">Materials</option>
              <option value="Contracts">Contracts</option>
           </select>
           </strong></td>
        </tr>
</table>
<%
if(!type.equals("select")){

       ps = mk.con.prepareStatement(" select to_char(sum(amt),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E') "+
                                     " and    contr_matr_mkr=decode(?,'Materials','M','Contracts','C') "+
                                     " and    bgt_mkr = 'B' "+
                                     " and    mm_val = to_char(to_date(?,'mon'),'MM') "+
                                     " and    yy_val =substr(?,3,2) "+
                                     " and    stn_extn is null "+
                                     " and    target_floor='F' ");
       ps.setString(1,finyr1);
       ps.setString(2,station);
       ps.setString(3,type);
       ps.setString(4,month);
       ps.setString(5,finyr2);
       rs = ps.executeQuery();
       while(rs.next()){
           month_budget = rs.getString(1);
       }
       rs.close();
       ps.close();

      ps = mk.con.prepareStatement(" select nvl(sum(amt),0), to_char(nvl(sum(amt),0),'99990.999') from bgtm_repo_struc "+
                                     " where  bgt_from=? "+
                                     " and    stn_cd=decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E') "+
                                     " and    contr_matr_mkr=decode(?,'Materials','M','Contracts','C') "+
                                     " and    bgt_mkr='A' "+
                                     " and    bill_rel_recv='2' "+
                                     " and    mm_val=to_char(to_date(?,'mon'),'MM') "+
                                     " and    stn_extn is null "+
                                     " and    yy_val=substr(?,3,2) ");
       ps.setString(1,finyr1);
       ps.setString(2,station);
       ps.setString(3,type);
       ps.setString(4,month);
       ps.setString(5,finyr2);
       rs = ps.executeQuery();
       while(rs.next()){
           mtd_act = rs.getString(2);
       }
       rs.close();
       ps.close();

       ps = mk.con.prepareStatement(" select to_char(to_number(?)-to_number(?),'99990.999') from dual ");
       ps.setString(1,mtd_act);
       ps.setString(2,month_budget);
       rs = ps.executeQuery();
       while(rs.next()){
           dev = rs.getString(1);
       }
       rs.close();
       ps.close();

       ps = mk.con.prepareStatement(" select to_char((to_number(?)/to_number(?))*100,'99990.99'), "+
                                     " case when to_number(abs(to_char((to_number(?)/to_number(?))*100,'99990.99')))>20 then 'R' ELSE 'G' END "+
                                     " from dual ");
       ps.setString(1,dev);
       ps.setString(2,month_budget);
       ps.setString(3,dev);
       ps.setString(4,month_budget);
       rs = ps.executeQuery();
       while(rs.next()){
          dev_per = rs.getString(1);
          dev_per_ind = rs.getString(2);
       }
       rs.close();
       ps.close();

if(date_ind.equals("B") && cur_month.equals(month)){
   dev_per_ind = "B";
}


}
%>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 40%" class="style9"><strong>MTD Actuals (In Lakhs) : </strong></td>
                <td style="width: 60%" class="style3"><strong><%=mtd_act%></strong></td>
        </tr>
        <tr>
                <td style="width: 40%" class="style9"><strong>Monthly Budget (In Lakhs) :</strong></td>
                <td style="width: 60%" class="style3"><strong><%=month_budget%></strong></td>
        </tr>
        <tr>
                <td style="width: 40%" class="style9"><strong>Monthly Budget Vs MTD Actual Dev (In Lakhs) :</strong></td>
                <td style="width: 60%" class="style3"><strong><%=dev%></strong></td>
        </tr>
        <tr>
                <td style="width: 40%" class="style9"><strong>Monthly Budget Vs MTD Actual Dev (%) :</strong></td>
<%
if(dev_per_ind.equals("B")){
%>
                <td style="width: 60%" class="style3"><strong><font face="Book Antiqua" color="black" ><%=dev_per%></font></strong></td>
<%
}else if(dev_per_ind.equals("G")){
%>
                <td style="width: 60%" class="style3"><strong><font face="Book Antiqua" color="green" ><%=dev_per%></font></strong></td>
<%
}else{
%>
                <td style="width: 60%" class="style3"><strong><font face="Book Antiqua" color="red" ><%=dev_per%></font></strong></td>
<%
}
%>
        </tr>
</table>
<br>
<table id="mytable" style="width: 100%" border="0" class="" >
  <tr height="10">
   <td style="width: 100%" align="left"><strong>Enter comments only after 25th of current month if the deviation % value appears in red . Black Color :- Before 26th of the current month.<font face="Book Antiqua" color="red" size="3"> Red Color :-After 25th of the current month & > +/- 20 %.</font><font face="Book Antiqua" color="green" size="3">Green Color :-After 25th of the current month & < +/- 20 %. </font> </strong></ td>
  </tr>
</table>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 40%" class="style9"><strong>Comments : </strong></td>
                <td style="width: 60%" class="style8"><strong><textarea rows="5" cols="100" id="comments" name="comments" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold;" onkeypress=""/></textarea> </strong></td>
        </tr>
</table>
<br>
<table style="width: 100%" border="0">
        <tr>
                <td style="width: 60%" class="" align="center"><strong><input type="button" value="Save" id="save" name="save" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="submitdata();"> </textarea> </strong></td>
        </tr>
<%
if(type.equals("select")){
%>
<script>
document.f1.save.disabled=true;
</script>
<%
}
%>
</table>
<%
       ps = mk.con.prepareStatement(" select count(*) "+ 
                                    " from BGTM_USER_COMNTS "+ 
                                    " where fin_yr=? "+
                                    " and  stn_cd= decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E') ");
       ps.setString(1,finyr1);
       ps.setString(2,station);
       rs = ps.executeQuery();
while(rs.next()){
 cnt_flg=rs.getString(1);
}

if(!cnt_flg.equals("0")){
%>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 5%" class="style8"><strong>(Click to delete)</strong></td>
                <td style="width: 5%" class="style8"><strong>Station </strong></td>
                <td style="width: 10%" class="style8"><strong>Year</strong></td>
                <td style="width: 10%" class="style8"><strong>Month</strong></td>
                <td style="width: 10%" class="style8"><strong>Group</strong></td>
                <td style="width: 20%" class="style8"><strong>Comments</strong></td>
                <td style="width: 10%" class="style8"><strong>Created By </strong></td>
                <td style="width: 10%" class="style8"><strong>Created Date</strong></td>
                <td style="width: 10%" class="style8"><strong>Modified By</strong></td>
                <td style="width: 10%" class="style8"><strong>Modified date</strong></td>
        </tr>
<%
       ps = mk.con.prepareStatement(" select FIN_YR,decode(STN_CD,'B','BBGS','T','TGS','S','SGS','N','NCGS','C','CTM','E','EDGE'),to_char(to_date(MM_VAL,'MM'),'Month'),decode(EXP_TYP,'M','Materials','C','Contracts'),COMNT,to_char(CRT_DT,'DD/MM/YY'),CRT_BY,nvl(to_char(UPD_DT,'DD/MM/YY'),'&nbsp'),nvl(UPD_BY,'&nbsp'),mm_val,exp_typ "+ 
                                    " from BGTM_USER_COMNTS "+ 
                                    " where fin_yr=? "+
                                    " and  stn_cd= decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E') "+
                                    " order by mm_val,decode(exp_typ,'M','1','C','2') ");
       ps.setString(1,finyr1);
       ps.setString(2,station);
       rs = ps.executeQuery();
while(rs.next()){
cnt = cnt+1;
%>
        <tr>
           <td style="width: 5%" class="style15"><strong><input id="chk<%=cnt%>" name="chk<%=cnt%>" type="checkbox" /></strong></td>
           <td style="width: 5%" class="style15"><strong><%=rs.getString(2)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(1)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(3)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(4)%></strong></td>
           <td style="width: 20%" class="style4"><strong><%=rs.getString(5)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(7)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(6)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(9)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(8)%></strong></td>
           <input type="hidden" id= "mnth<%=cnt%>" name = "mnth<%=cnt%>" value="<%=rs.getString(10)%>" />
           <input type="hidden" id= "grp<%=cnt%>" name = "grp<%=cnt%>" value="<%=rs.getString(11)%>" />
        </tr>
<%
}
rs.close();
ps.close();
%>
</table>
<br>

<table style="width: 100%" border="0" align="center">
  <tr width="100%">
  <td align="center">
     <input type="button" value="Delete" id="delete" name="delete" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="delete_data();">
  </td>
  </tr>
</table>

<%
}else{
%>
<TABLE height=20% width="100%" border=0 cellspacing="0">
        <TBODY>
          <TR>
            <TD align=middle width=100% height=100% ><font color="#cc3300" face="Courier New" Size=5><b>NO COMMENTS FOUND.</b></font></TD>
          </TR>
        </TBODY>
     </TABLE>
<%
}
%>
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
<input type="hidden" id= "finyr1" name = "finyr1" value="<%=finyr1%>" />
<input type="hidden" id= "totcnt" name = "totcnt" value="<%=cnt%>" />
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
