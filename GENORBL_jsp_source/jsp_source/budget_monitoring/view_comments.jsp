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
  String month_act                  = new String("");
  String empcd                      = new String("");
  String sysdate                    = new String("");
  String station                    = new String("");
  String type                       = new String("");
  String your_desg                  = new String("");
  String mtd_act                    = new String("");
  String month_budget               = new String("");
  String dev                        = new String("");
  String dev_per                    = new String("");
  String dev_per_ind                = new String("");
  String cur_month                  = new String("");
  String date_ind                   = new String("");
  String exp_type                   = new String("");

  String sStyle                     = new String("");
  int cnt=0;
  int counter=0;

try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);
     empcd     = request.getParameter("empcd");
     month     = request.getParameter("month");
     finyr     = request.getParameter("finyr");
     finyr1    = request.getParameter("finyr1");
     station   = request.getParameter("station");
     String exp_tp    = request.getParameter("exp_tp");
     String view_mkr  = request.getParameter("view_mkr");

if(exp_tp.equals("M")){
   exp_type="Materials";
}else{
   exp_type="Contracts";
}

if(view_mkr.equals("Y")){
  month_act = "Apr - "+month;
}else{
   month_act = month;
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

<label style="left:400px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">Comment Details</font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>

<br>
<br>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 25%" class="style9"><strong>Financial Year : </strong></td>
                <td style="width: 25%" class="style3"><strong><%=finyr%></strong></td>
                <td style="width: 25%" class="style9"><strong>Month :</strong></td>
                <td style="width: 25%" class="style3"><strong><%=month_act%></strong></td>
        </tr>
        <tr>
                <td style="width: 25%" class="style9"><strong>Station : </strong></td>
                <td style="width: 25%" class="style3"><strong><%=station%></strong></td>
                <td style="width: 25%" class="style9"><strong>Exp Type :</strong></td>
                <td style="width: 25%" class="style3"><strong><%=exp_type%></strong></td>
        </tr>
</table>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 10%" class="style8"><strong>Station </strong></td>
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
if(view_mkr.equals("M")){
       ps = mk.con.prepareStatement(" select FIN_YR,decode(STN_CD,'B','BBGS','T','TGS','S','SGS','N','NCGS','C','CTM','E','EDGE'),to_char(to_date(MM_VAL,'MM'),'Month'),decode(EXP_TYP,'M','Materials','C','Contracts'),COMNT,to_char(CRT_DT,'DD/MM/YY'),CRT_BY,nvl(to_char(UPD_DT,'DD/MM/YY'),'&nbsp'),nvl(UPD_BY,'&nbsp'),mm_val,exp_typ "+ 
                                    " from BGTM_USER_COMNTS "+ 
                                    " where fin_yr=? "+
                                    " and  stn_cd= decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E') "+
                                    " and  mm_val=to_char(to_date(?,'Mon'),'MM') "+
                                    " and  exp_typ=? "+
                                    " order by mm_val,decode(exp_typ,'M','1','C','2') ");
       ps.setString(1,finyr1);
       ps.setString(2,station);
       ps.setString(3,month);
       ps.setString(4,exp_tp);
       rs = ps.executeQuery();
}else{
       ps = mk.con.prepareStatement(" select FIN_YR,decode(STN_CD,'B','BBGS','T','TGS','S','SGS','N','NCGS','C','CTM','E','EDGE'),to_char(to_date(MM_VAL,'MM'),'Month'),decode(EXP_TYP,'M','Materials','C','Contracts'),COMNT,to_char(CRT_DT,'DD/MM/YY'),CRT_BY,nvl(to_char(UPD_DT,'DD/MM/YY'),'&nbsp'),nvl(UPD_BY,'&nbsp'),mm_val,exp_typ "+ 
                                    " from BGTM_USER_COMNTS "+ 
                                    " where fin_yr=? "+
                                    " and  stn_cd= decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E') "+
                                    " and  mm_val between '04' and to_char(to_date(?,'Mon'),'MM') "+
                                    " and  exp_typ=? "+
                                    " order by mm_val,decode(exp_typ,'M','1','C','2') ");
       ps.setString(1,finyr1);
       ps.setString(2,station);
       ps.setString(3,month);
       ps.setString(4,exp_tp);
       rs = ps.executeQuery();
}


while(rs.next()){
cnt = cnt+1;
%>
        <tr>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(2)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(1)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(3)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(4)%></strong></td>
           <td style="width: 20%" class="style4"><strong><%=rs.getString(5)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(7)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(6)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(9)%></strong></td>
           <td style="width: 10%" class="style15"><strong><%=rs.getString(8)%></strong></td>
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
     <input type="button" value="Close" id="close" name="close" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="window.close();">
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
