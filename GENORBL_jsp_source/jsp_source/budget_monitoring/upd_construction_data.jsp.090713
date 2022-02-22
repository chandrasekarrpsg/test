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
  var parameter='';
   parameter = parameter + 'finyr='+document.f1.finyr.value;
   parameter = parameter + '&month='+document.f1.month.value;
   parameter = parameter + '&station='+document.f1.station.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("upd_construction_data.jsp?"+parameter,"_self");
}

function updatedata(){

var bgthdset='';
var deptset='';
var recidset='';
 for (var z=1;z<=f1.totcnt.value;z++) {

     bgthdset=bgthdset+document.getElementById("bgthd"+z).value+'|';
     deptset=deptset+document.getElementById("dept"+z).value+'|';
     recidset=recidset+document.getElementById("recid"+z).value+'|';
 }
   var parameter='';
   parameter = parameter + 'station='+document.f1.station.value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&month='+document.f1.month.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
   parameter = parameter + '&totcnt='+document.f1.totcnt.value;
   parameter = parameter + '&bgthdset='+bgthdset;
   parameter = parameter + '&deptset='+deptset;
   parameter = parameter + '&rowidset='+recidset;
   //alert(parameter);
   window.open("upd_construction_data_update.jsp?"+parameter,"_self");
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
  String month                      = new String("");
  String compare                    = new String("");
  String mon_basis                  = new String("");
  String empcd                      = new String("");
  String sysdate                    = new String("");
  String station                    = new String("");
  String your_desg                  = new String("");
  String updated_upto               = new String("");

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
     finyr1    = finyr.substring(0,4);

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
       
       ps = mk.con.prepareStatement("select distinct bgt_yr||'-'||to_char(add_months(to_date(bgt_yr,'YYYY'),12),'YYYY'),bgt_yr from bgt_form2b_data where bgt_yr <>? order by bgt_yr desc ");
       ps.setString(1,finyr1);
       rs = ps.executeQuery();

%>
<form method="post" name="f1" action="">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:250px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">Updation Of Values Received From Construction</font></b>
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
           <td style="width: 25%" align="left"><strong><font face="Book Antiqua" color="#800000" size="3">Financial Year :&nbsp;&nbsp;&nbsp;
           <select size="1" name="finyr" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onkeypress=""/>
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
           <select size="1" name="month" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onChange=""/>
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
           <select size="1" name="station" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onChange=""/>
              <option selected value=<%=station%>><%=station%></option>
              <option value="BBGS">BBGS</option>
              <option value="TGS">TGS</option>
              <option value="SGS">SGS</option>
              <option value="NCGS">NCGS</option>
              <option value="CTM">CTM</option>
              <option value="EDGE">EDGE</option>
           </select>
           </strong></td>
           <td style="width: 25%" align="left" colspan="2"><strong>
            <input type="button" value="Submit" id="submit" name="submit" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="submitdata();">
           </td>
        </tr>
</table>
<br>
<%
       ps = mk.con.prepareStatement(" select count(*) "+
                                    " from IL_RM_STNORDERS_CONSTRUCTION "+
                                    " where to_char(to_date(s_month,'MM'),'Mon')=? "+
                                    " and finyear=? "+
                                    " and  station=? and upd_mrk is null "+
                                    " order by to_date(order_date,'dd-mon-yyyy') ");
       ps.setString(1,month);
       ps.setString(2,finyr);
       ps.setString(3,station);
       rs = ps.executeQuery();
while(rs.next()){
 cnt_flg=rs.getString(1);
}

if(!cnt_flg.equals("0")){
%>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 10%" class="style8"><strong>Bgt Head </strong></td>
                <td style="width: 10%" class="style8"><strong>Dept</strong></td>
                <td style="width: 10%" class="style8"><strong>Ord Date</strong></td>
                <td style="width: 10%" class="style8"><strong>Ord To</strong></td>
                <td style="width: 5%" class="style8"><strong>Ord Type</strong></td>
                <td style="width: 10%" class="style8"><strong>Order For</strong></td>
                <td style="width: 15%" class="style8"><strong>Bill No</strong></td>
                <td style="width: 10%" class="style8"><strong>Bill Date</strong></td>
                <td style="width: 10%" class="style8"><strong>Bill value Net</strong></td>
                <td style="width: 10%" class="style8"><strong>Bill Release Date</strong></td>
        </tr>
<%
       ps = mk.con.prepareStatement(" select ORDER_DATE,ORDER_TO,ORDER_VAL,BILL_NO,BILL_DATE,to_char(BILLVAL_NET,'9999999990.99'),BILL_RELEASE_DATE,ORDER_FOR,dept,rec_id "+
                                    " from IL_RM_STNORDERS_CONSTRUCTION "+
                                    " where to_char(to_date(s_month,'MM'),'Mon')=? "+
                                    " and finyear=? "+
                                    " and  station=? and upd_mrk is null "+
                                    " order by to_date(order_date,'dd-mon-yyyy') ");
       ps.setString(1,month);
       ps.setString(2,finyr);
       ps.setString(3,station);
       rs = ps.executeQuery();
while(rs.next()){
cnt=cnt+1;
%>
        <tr>
           <td style="width: 10%" class="style4"><strong>
           <select size="1" name="bgthd<%=cnt%>" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onChange=""/>
              <option selected value="Select">Select</option>
              <option value="Exclude">Exclude</option>
              <option value="15">15</option>
              <option value="19">19</option>
              <option value="20a">20a</option>
              <option value="20b">20b</option>
              <option value="20c">20c</option>
              <option value="20f">20f</option>
              <option value="5a">5a</option>
              <option value="5b">5b</option>
              <option value="5c">5c</option>
              <option value="5d">5d</option>
              <option value="5e">5e</option>
              <option value="5f">5f</option>
              <option value="5g">5g</option>
              <option value="5h">5h</option>
              <option value="Construction">Construction</option>
           </select></strong></td>
           <td style="width: 10%" class="style4"><strong>
           <select size="1" name="dept<%=cnt%>" style="font-family: Tahoma; font-size: 8pt; color: #800080; font-weight: bold" onChange=""/>
              <option selected value="<%=rs.getString(9)%>"><%=rs.getString(9)%></option>
<%
       ps1 = mk.con.prepareStatement("select distinct section_cd from bgt_cd_section where station_cd=decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E')");
       ps1.setString(1,station);
       rs1 = ps1.executeQuery();
       while(rs1.next()){
%>
              <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>
<%
}
rs1.close();
ps1.close();
%>
              <option value="ConC">ConC</option>
              <option value="ConE">ConE</option>
              <option value="ConM">ConM</option>
              <option value="Unspecified">Unspecified</option>
           </select></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(1)%></strong></td>
           <td style="width: 10%" class="style4"><strong><%=rs.getString(2)%></strong></td>
           <td style="width: 5%" class="style15"><strong><%=rs.getString(3)%></strong></td>
           <td style="width: 10%" class="style4"><strong><%=rs.getString(8)%></strong></td>
           <td style="width: 15%" class="style4"><strong><%=rs.getString(4)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(5)%></strong></td>
           <td style="width: 10%" class="style14"><strong><%=rs.getString(6)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(7)%></strong></td>
           <input type="hidden" id= "recid<%=cnt%>" name = "rec_id<%=cnt%>" value="<%=rs.getString(10)%>" />
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
     <input type="button" value="Update" id="update" name="update" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="updatedata();">
  </td>
  </tr>
</table>

<%
}else{
%>
<TABLE height=20% width="100%" border=0 cellspacing="0">
        <TBODY>
          <TR>
            <TD align=middle width=100% height=100% ><font color="#cc3300" face="Courier New" Size=5><b>NO DATA FOUND.</b></font></TD>
          </TR>
        </TBODY>
     </TABLE>
<%
}
%>
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
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
