
<html>

<head>
        <meta http-equiv="Content-Language" content="en-us" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>

<script type=text/javascript>

function back_prev(){
var parameter='';
   parameter = parameter + 'station='+document.f1.station.value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&month='+document.f1.month.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
   window.open("upd_construction_data.jsp?"+parameter,"_self");
}

</script>
</head>
<body background="green1.jpg" onload="">
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*,java.util.*; " %>

 <%

                        MakeConnectionGENORBL mk = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        String sysdate        = new String("");
                        String your_desg      = new String("");
                        String station_long_desc      = new String("");
                        String month_act      = new String("");
                        String station        = request.getParameter("station");
                        String finyr          = request.getParameter("finyr");
                        String month          = request.getParameter("month");
                        String empcd          = request.getParameter("empcd");
                        String totcnt         = request.getParameter("totcnt");
                        String row_id         = request.getParameter("row_id");
                        String bgthdset       = request.getParameter("bgthdset");
                        String deptset        = request.getParameter("deptset");
                        String rowidset       = request.getParameter("rowidset");
                        String curbgthd       = new String("");
                        String curdept        = new String("");
                        String currowid       = new String("");
                        String [] bgthd       = new String[999];
                        String [] dept        = new String[999];
                        String [] rowid       = new String[999];

                        int update_count = 0;
                        int a = 0;
try{

                             mk = new MakeConnectionGENORBL();
                             mk.con.setAutoCommit(false);

if(month.equals("Jan")){
  month_act="1";
}else if(month.equals("Feb")){
  month_act="2";
}else if(month.equals("Mar")){
  month_act="3";
}else if(month.equals("Apr")){
  month_act="4";
}else if(month.equals("May")){
  month_act="5";
}else if(month.equals("Jun")){
  month_act="6";
}else if(month.equals("Jul")){
  month_act="7";
}else if(month.equals("Aug")){
  month_act="8";
}else if(month.equals("Sep")){
  month_act="9";
}else if(month.equals("Oct")){
  month_act="10";
}else if(month.equals("Nov")){
  month_act="11";
}else{
  month_act="12";
}

       ps = mk.con.prepareStatement("select to_char(trunc(sysdate),'DD-MON-RRRR') from dual");
       rs = ps.executeQuery();
       while(rs.next()){
            sysdate = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select STATION_LONG_DESC from CD_STATION where bgt_station_cd=?");
       ps.setString(1,station);
       rs = ps.executeQuery();
       while(rs.next()){
            station_long_desc = rs.getString(1);
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
       
%>
<form name="f1">

<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">UPDATION STATUS OF CONSTRUCTION DATA</font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="4">WELCOME <%=your_desg%> !!!</font></b>
</label>
<%

StringTokenizer st1 = new StringTokenizer(bgthdset,"|");
          int y=0;
         
          while(st1.hasMoreTokens()){
                bgthd[y]=(String) st1.nextToken();
                y=y+1;
          }

StringTokenizer st2 = new StringTokenizer(deptset,"|");
          int z=0;
         
          while(st2.hasMoreTokens()){
                dept[z]=(String) st2.nextToken();
                z=z+1;
          }

StringTokenizer st3 = new StringTokenizer(rowidset,"|");
          int b=0;
         
          while(st3.hasMoreTokens()){
                rowid[b]=(String) st3.nextToken();
                b=b+1;
          }

while( a < Integer.parseInt(totcnt)){

curbgthd   = bgthd[a];
curdept    = dept[a];
currowid   = rowid[a];

if(!curbgthd.equals("Select")){

       ps = mk.con.prepareStatement("UPDATE IL_RM_STNORDERS_CONSTRUCTION   "+
                                    " set  budget_head = ?,dept=?,upd_mrk='1' "+
                                    " where finyear=? and station=? and s_month=? and rec_id=to_number(?) ");
       ps.setString(1,curbgthd);
       ps.setString(2,curdept);
       ps.setString(3,finyr);
       ps.setString(4,station);
       ps.setString(5,month_act);
       ps.setString(6,currowid);
       update_count = ps.executeUpdate();
       ps.close();
}

a=a+1; 
}

mk.con.commit();
mk.con.close();

if(update_count > 0){

%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="#800080">CONSTRUCTION DATA OF :</font></b><b><font face="Tahoma" color="#FF0000"> <%=station%> </font><font face="Tahoma" color="#800080"> FOR FINANCIAL YEAR :</font></b><b><font face="Tahoma" color="#FF0000"> <%=finyr%> </font>&nbsp;<font face="Tahoma" color="#800080"> HAVE BEEN UPDATED SUCCESSFULLY. </font></b></label>
<br>
<input type="hidden" id= "finyr" name = "finyr" value="<%=finyr%>" />
<input type="hidden" id= "month" name = "month" value="<%=month%>" />
<input type="hidden" id= "station" name = "station" value="<%=station%>" />
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
<%
}
%>
<br>
<label style="left:400px; top:250px; position:absolute;"><b>
<input type="button" value="Back" id="B1" name="B1" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="back_prev();">
<%
}catch(Exception e) {
                    e.printStackTrace();
}finally{
                        if (mk != null) {
                            mk.con.close();
                        }
}

%>
</body>
</html>

