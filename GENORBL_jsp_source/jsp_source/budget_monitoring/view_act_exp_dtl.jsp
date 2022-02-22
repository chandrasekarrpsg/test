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
                                font-size: 9pt;
				background-color: #FFE391;
}
.style3 {
                                text-align: left;
				border-style: solid;
				border-color: #B0B0D9;
                                font-size: 9pt;
				background-color: #B0B0D9;
}
.style19 {
                                text-align: right;
				border-style: solid;
				border-color: #B0B0D9;
                                font-size: 9pt;
				background-color: #B0B0D9;
}

.style13 {
                                text-align: left;
				border-style: solid;
				border-color: #FFFFBF;
                                font-size: 9pt;
				background-color: #FFFFBF;
}
.style4 {
                                text-align: left;
				border-style: solid;
				border-color:  #D9F2F0;
                                font-size: 9pt;
				background-color:#D9F2F0;
}
.style14 {
                                text-align: right;
				border-style: solid;
				border-color:  #D9F2F0;
                                font-size: 9pt;
				background-color:#D9F2F0;
}
.style15 {
                                text-align: center;
				border-style: solid;
				border-color:  #D9F2F0;
                                font-size: 9pt;
				background-color:#D9F2F0;
}
.style5 {
                                text-align: right;
				border-style: solid;
				border-color: #75D0C7;
                                font-size: 9pt;
				background-color: #75D0C7;
}
.style6 {
                                text-align: right;
				border-style: solid;
				border-color: #D9D9FF;
                                font-size: 9pt;
				background-color: #D9D9FF;
}
.style7 {
                                text-align: right;
				border-style: solid;
				border-color: #B9B9FF;
                                font-size: 9pt;
				background-color: #B9B9FF;
}

.style8 {
                                text-align: center;
                                color: #ffffff;
                                font-family: Arial;
                                font-size: 9pt;
                                background-color:#008080;
}

.style9 {
                                text-align: left;
                                color: #ffffff;
                                font-family: Arial;
                                font-size: 9pt;
                                background-color:#008080;
}
.style21 {
                                text-align: right;
                                border-style: solid;
                                border-color:  #82B4FF;
                                font-size: 9pt;
                                background-color:#82B4FF;
}
.style20 {
                                text-align: left;
                                border-style: solid;
                                border-color:  #82B4FF;
                                font-size: 9pt;
                                background-color:#82B4FF;
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

<body background="">

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
  String month_act                  = new String("");
  String empcd                      = new String("");
  String sysdate                    = new String("");
  String station                    = new String("");
  String dept                       = new String("");
  String bgt_hd                     = new String("");
  String cont_matr_desc             = new String("");
  String view_mkr                   = new String("");
  

  String your_desg                  = new String("");
  String sStyle                     = new String("");
  String sStyle1                    = new String("");
  String sStyle2                    = new String("");
  String bud_desc                   = new String("");
  String mon_basis                  = new String("");
  int cnt=0;
  int counter=0;
  int iSl_No=0;

try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);
     empcd     = request.getParameter("empcd");
     month     = request.getParameter("month");
     finyr     = request.getParameter("finyr");
     finyr1    = request.getParameter("finyr1");
     station   = request.getParameter("station");
     dept      = request.getParameter("dept");
     bgt_hd    = request.getParameter("bgt_hd");
     view_mkr  = request.getParameter("view_mkr");
     mon_basis  = request.getParameter("mon_basis");


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

       ps = mk.con.prepareStatement(" select distinct decode(contr_matr_mkr,'M','Materials','C','Contracts')  "+
                                    " from BGTM_ACT_EXP_VIEW_SPL "+
                                    " where fin_yr=? and stn_extn is null "+
                                    " and budget_hd=decode(?,'2a-2','2a',?) ");
       ps.setString(1,finyr1);
       ps.setString(2,bgt_hd);
       ps.setString(3,bgt_hd);
       rs = ps.executeQuery();
       while(rs.next()){
            cont_matr_desc = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement(" select distinct budget_desc  "+
                                    " from BGTM_ACT_EXP_VIEW_SPL "+
                                    " where fin_yr=? and stn_extn is null "+
                                    " and budget_hd=decode(?,'2a-2','2a',?) ");
       ps.setString(1,finyr1);
       ps.setString(2,bgt_hd);
       ps.setString(3,bgt_hd);
       rs = ps.executeQuery();
       while(rs.next()){
            bud_desc = rs.getString(1);
       }
       rs.close();
       ps.close();

if(view_mkr.equals("M")){
   month_act=month;
}else{
   month_act="Apr - "+month;
}


%>
<form method="post" name="f1" action="add_comment_on_exp.jsp">
<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:400px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">Actual Expenditure Details</font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>
<label style="left:850px; top:30px; position: absolute" >
     <input type="button" value="Close" id="close" name="close" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="window.close();">
</label>

<br>
<br>
<br>
<br>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 10%" class="style9"><strong>Financial Year : </strong></td>
                <td style="width: 10%" class="style3"><strong><%=finyr%></strong></td>
                <td style="width: 10%" class="style9"><strong>Month :</strong></td>
                <td style="width: 10%" class="style3"><strong><%=month_act%></strong></td>
                <td style="width: 15%" class="style9"><strong>Station : </strong></td>
                <td style="width: 15%" class="style3"><strong><%=station%></strong></td>
                <td style="width: 15%" class="style9"><strong>Section :</strong></td>
                <td style="width: 15%" class="style3"><strong><%=dept%></strong></td>
        </tr>
        <tr>
                <td style="width: 10%" class="style9"><strong>Contract/Material :</strong></td>
                <td style="width: 10%" class="style3"><strong><%=cont_matr_desc%></strong></td>
                <td style="width: 10%" class="style9"><strong>Budget Head :</strong></td>
                <td style="width: 10%" class="style3"><strong><%=bgt_hd%></strong></td>
                <td style="width: 15%" class="style9"><strong>Budget Desc :</strong></td>
                <td style="width: 15%" class="style3" colspan="3"><strong><%=bud_desc%></strong></td>
        </tr>
</table>
<br>
<%

if(cont_matr_desc.equals("Materials")){

if(view_mkr.equals("M")){
       
       ps = mk.con.prepareStatement(" select stn_name,DEPT,BUDGET_HD,nvl(description,'&nbsp'),nvl(QTY,'&nbsp'),nvl(UNIT_RATE,'&nbsp'),to_char(TRANS_AMT,'99999999990.999') "+ 
                                    " from BGTM_ACT_EXP_VIEW_SPL "+
                                    " where fin_yr=? "+
                                    " and   stn_name like decode(?,'ALL','%',?) "+
                                    " and   lpad(mm_val,2,'0')=to_char(to_date(?,'Mon'),'MM') "+
                                    " and   dept like decode(?,'ALL','%',?) and stn_extn is null "+
                                    " and   budget_hd= decode(?,'2a-2','2a',?) "+
                                    " and   send_recv_mkr=? order by decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),dept ");
       ps.setString(1,finyr1);
       ps.setString(2,station);
       ps.setString(3,station);
       ps.setString(4,month);
       ps.setString(5,dept);
       ps.setString(6,dept);
       ps.setString(7,bgt_hd);
       ps.setString(8,bgt_hd);
       ps.setString(9,mon_basis);
       rs = ps.executeQuery();
}else{
       ps = mk.con.prepareStatement(" select stn_name,DEPT,BUDGET_HD,nvl(description,'&nbsp'),nvl(QTY,'&nbsp'),nvl(UNIT_RATE,'&nbsp'),to_char(TRANS_AMT,'99999999990.999') "+ 
                                    " from BGTM_ACT_EXP_VIEW_SPL "+
                                    " where fin_yr=? "+
                                    " and   stn_name like decode(?,'ALL','%',?) "+
                                    " and   dept like decode(?,'ALL','%',?) and stn_extn is null "+
                                    " and   budget_hd= decode(?,'2a-2','2a',?) "+
                                    " and   to_date(lpad(MM_VAL,2,'0')||YY_VAL,'mmyyyy') between to_date('04'||?,'MMYYYY') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(?,'Apr',?,'May',?,'Jun',?,'Jul',?,'Aug',?,'Sep',?,'Oct',?,'Nov',?,'Dec',?,'Jan',to_char(add_months(to_date(?,'YYYY'),12),'YYYY'),'Feb',to_char(add_months(to_date(?,'YYYY'),12),'YYYY'),'Mar',to_char(add_months(to_date(?,'YYYY'),12),'YYYY')),'MMYYYY')    "+
                                    " and   send_recv_mkr=? order by decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),dept ");
       ps.setString(1,finyr1);
       ps.setString(2,station);
       ps.setString(3,station);
       ps.setString(4,dept);
       ps.setString(5,dept);
       ps.setString(6,bgt_hd);
       ps.setString(7,bgt_hd);
       ps.setString(8,finyr1);
       ps.setString(9,month);
       ps.setString(10,month);
       ps.setString(11,finyr1);
       ps.setString(12,finyr1);
       ps.setString(13,finyr1);
       ps.setString(14,finyr1);
       ps.setString(15,finyr1);
       ps.setString(16,finyr1);
       ps.setString(17,finyr1);
       ps.setString(18,finyr1);
       ps.setString(19,finyr1);
       ps.setString(20,finyr1);
       ps.setString(21,finyr1);
       ps.setString(22,finyr1);
       ps.setString(23,mon_basis);
       rs = ps.executeQuery();
}
%>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 10%" class="style9"><strong>Station </strong></td>
                <td style="width: 10%" class="style9"><strong>Dept</strong></td>
                <td style="width: 10%" class="style9"><strong>Bgt Head</strong></td>
                <td style="width: 40%" class="style9"><strong>Description</strong></td>
                <td style="width: 10%" class="style9"><strong>Quantity</strong></td>
                <td style="width: 10%" class="style9"><strong>Qty Rate</strong></td>
                <td style="width: 10%" class="style9"><strong>Total</strong></td>
        </tr>
<%
while(rs.next()){

iSl_No = iSl_No + 1;

if( iSl_No%2 == 1){

               sStyle = "style3";
               sStyle1 = "style19";

}else{

               sStyle = "style20";
               sStyle1 = "style21";

}

%>
        <tr>
                <td style="width: 10%" class="<%=sStyle%>"><strong><%=rs.getString(1)%></strong></td>
                <td style="width: 10%" class="<%=sStyle%>"><strong><%=rs.getString(2)%></strong></td>
                <td style="width: 10%" class="<%=sStyle%>"><strong><%=rs.getString(3)%></strong></td>
                <td style="width: 40%" class="<%=sStyle%>"><strong><%=rs.getString(4)%></strong></td>
                <td style="width: 10%" class="<%=sStyle1%>"><strong><%=rs.getString(5)%></strong></td>
                <td style="width: 10%" class="<%=sStyle1%>"><strong><%=rs.getString(6)%></strong></td>
                <td style="width: 10%" class="<%=sStyle1%>"><strong><%=rs.getString(7)%></strong></td>
        </tr>
<%
}
rs.close();
ps.close();
%>
</table>
<br>
<%
}else{

if(view_mkr.equals("M")){

       ps = mk.con.prepareStatement("  select BUDGET_HD,nvl(ORDER_NO,'&nbsp'),nvl(description,'&nbsp'),BILL_NO,to_char(BILL_DATE,'DD-MON-YYYY'),BILL_ID, "+
                                    "         to_char(BILL_RELEASE_DATE,'DD-MON_YYYY'),nvl(to_char(SEND_TO_FIN_DATE,'DD-MON-YYYY'),'&nbsp'), "+
                                    "  to_char(trans_amt,'99999999990.999'),nvl(order_to,'&nbsp') "+
                                    "  from BGTM_ACT_EXP_VIEW_SPL "+
                                    "  where fin_yr=? "+
                                    "  and   stn_name like decode(?,'ALL','%',?) "+
                                    "  and   lpad(mm_val,2,'0') = to_char(to_date(?,'Mon'),'MM') "+
                                    "  and   dept like decode(?,'ALL','%',?) and stn_extn is null "+
                                    "  and   budget_hd=decode(?,'2a-2','2a',?) "+
                                    "  and   send_recv_mkr=? order by decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),dept,bill_date ");
       ps.setString(1,finyr1);
       ps.setString(2,station);
       ps.setString(3,station);
       ps.setString(4,month);
       ps.setString(5,dept);
       ps.setString(6,dept);
       ps.setString(7,bgt_hd);
       ps.setString(8,bgt_hd);
       ps.setString(9,mon_basis);
       rs = ps.executeQuery();
}else{
       ps = mk.con.prepareStatement("  select BUDGET_HD,nvl(ORDER_NO,'&nbsp'),nvl(description,'&nbsp'),BILL_NO,to_char(BILL_DATE,'DD-MON-YYYY'),BILL_ID, "+
                                    "         to_char(BILL_RELEASE_DATE,'DD-MON-YYYY'),nvl(to_char(SEND_TO_FIN_DATE,'DD-MON-YYYY'),'&nbsp'), "+
                                    "  to_char(trans_amt,'99999999990.999'),nvl(order_to,'&nbsp') "+
                                    "  from BGTM_ACT_EXP_VIEW_SPL "+
                                    "  where fin_yr=? "+
                                    "  and   stn_name like decode(?,'ALL','%',?) "+
                                    "  and   dept like decode(?,'ALL','%',?) "+
                                    "  and   budget_hd=decode(?,'2a-2','2a',?) and stn_extn is null "+
                                    "  and   to_date(lpad(MM_VAL,2,'0')||YY_VAL,'mmyyyy') between to_date('04'||?,'MMYYYY') and to_date(to_char(to_date(?,'Mon'),'MM')||decode(?,'Apr',?,'May',?,'Jun',?,'Jul',?,'Aug',?,'Sep',?,'Oct',?,'Nov',?,'Dec',?,'Jan',to_char(add_months(to_date(?,'YYYY'),12),'YYYY'),'Feb',to_char(add_months(to_date(?,'YYYY'),12),'YYYY'),'Mar',to_char(add_months(to_date(?,'YYYY'),12),'YYYY')),'MMYYYY') "+
                                    "  and   send_recv_mkr=? order by decode(stn_cd,'B','1','T','2','S','3','N','4','C','5','E','6'),dept,bill_date ");
       ps.setString(1,finyr1);
       ps.setString(2,station);
       ps.setString(3,station);
       ps.setString(4,dept);
       ps.setString(5,dept);
       ps.setString(6,bgt_hd);
       ps.setString(7,bgt_hd);
       ps.setString(8,finyr1);
       ps.setString(9,month);
       ps.setString(10,month);
       ps.setString(11,finyr1);
       ps.setString(12,finyr1);
       ps.setString(13,finyr1);
       ps.setString(14,finyr1);
       ps.setString(15,finyr1);
       ps.setString(16,finyr1);
       ps.setString(17,finyr1);
       ps.setString(18,finyr1);
       ps.setString(19,finyr1);
       ps.setString(20,finyr1);
       ps.setString(21,finyr1);
       ps.setString(22,finyr1);
       ps.setString(23,mon_basis);
       rs = ps.executeQuery();
}
%>
<table style="width: 100%" border="1">
        <tr>
                <td style="width: 5%" class="style9"><strong>Bgt Head</strong></td>
                <td style="width: 10%" class="style9"><strong>Order No</strong></td>
                <td style="width: 10%" class="style9"><strong>Order To</strong></td>
                <td style="width: 15%" class="style9"><strong>Job Description</strong></td>
                <td style="width: 10%" class="style9"><strong>Bill No</strong></td>
                <td style="width: 10%" class="style9"><strong>Bill Date</strong></td>
                <td style="width: 10%" class="style9"><strong>Bill Ref Id</strong></td>
                <td style="width: 10%" class="style9"><strong>Released On</strong></td>
                <td style="width: 10%" class="style9"><strong>Finance Recvd Date</strong></td>
                <td style="width: 10%" class="style9"><strong>Total</strong></td>
        </tr>
<%
while(rs.next()){
iSl_No = iSl_No + 1;

if( iSl_No%2 == 1){

               sStyle = "style3";
               sStyle1 = "style19";

}else{

               sStyle = "style20";
               sStyle1 = "style21";

}
%>
        <tr>
                <td style="width: 5%" class="<%=sStyle%>"><strong><%=rs.getString(1)%> </strong></td>
                <td style="width: 10%" class="<%=sStyle%>"><strong><%=rs.getString(2)%> </strong></td>
                <td style="width: 10%" class="<%=sStyle%>"><strong><%=rs.getString(10)%> </strong></td>
                <td style="width: 15%" class="<%=sStyle%>"><strong><%=rs.getString(3)%> </strong></td>
                <td style="width: 10%" class="<%=sStyle%>"><strong><%=rs.getString(4)%> </strong></td>
                <td style="width: 10%" class="<%=sStyle%>"><strong><%=rs.getString(5)%> </strong></td>
                <td style="width: 10%" class="<%=sStyle%>"><strong><%=rs.getString(6)%> </strong></td>
                <td style="width: 10%" class="<%=sStyle%>"><strong><%=rs.getString(7)%> </strong></td>
                <td style="width: 10%" class="<%=sStyle%>"><strong><%=rs.getString(8)%> </strong></td>
                <td style="width: 10%" class="<%=sStyle1%>"><strong><%=rs.getString(9)%> </strong></td>
        </tr>
<%
}
rs.close();
ps.close();
%>
</table>
<br>
<%
}
%>
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