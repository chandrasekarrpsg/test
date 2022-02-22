
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
   parameter = parameter + '&type='+document.f1.type.value;
window.open("add_comment_on_exp.jsp?"+parameter,"_self");
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
                        String station        = new String("");
                        String finyr          = new String("");
                        String finyr1         = new String("");
                        String empcd          = new String("");
                        String totcnt         = new String("");
                        String chkset         = new String("");
                        String monthset       = new String("");
                        String groupset       = new String("");
                        String month          = new String("");
                        String type           = new String("");
                        

                        station          = request.getParameter("station");
                        empcd            = request.getParameter("empcd");
                        finyr            = request.getParameter("finyr");
                        finyr1           = request.getParameter("finyr1");
                        totcnt           = request.getParameter("totcnt");
                        chkset           = request.getParameter("chkset");
                        monthset         = request.getParameter("monthset");
                        groupset         = request.getParameter("groupset");
                        month            = request.getParameter("month");
                        type             = request.getParameter("type");
                        

                        String curchk         = new String("");
                        String curmonth       = new String("");
                        String curgroup       = new String("");
                        String [] chk         = new String[999];
                        String [] mnth        = new String[999];
                        String [] group       = new String[999];

                        int update_count = 0;
                        int a = 0;
try{

                             mk = new MakeConnectionGENORBL();
                             mk.con.setAutoCommit(false);


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



       
%>
<form name="f1">
<input type="hidden"  id="station" name ="station"  value="<%=station%>" />
<input type="hidden"  id="finyr"  name ="finyr"   value="<%=finyr%>" />
<input type="hidden"  id="empcd"  name ="empcd"   value="<%=empcd%>" />
<input type="hidden"  id="month"  name ="month"   value="<%=month%>" />
<input type="hidden"  id="type"  name ="type"   value="<%=type%>" />

<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="3">Comments Deletion Form Of Monthly Budget Vs Actual Deviation Analysis</font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>
<%

StringTokenizer st1 = new StringTokenizer(chkset,"|");
          int y=0;
         
          while(st1.hasMoreTokens()){
                chk[y]=(String) st1.nextToken();
                y=y+1;
          }

StringTokenizer st2 = new StringTokenizer(monthset,"|");
          int z=0;
         
          while(st2.hasMoreTokens()){
                mnth[z]=(String) st2.nextToken();
                z=z+1;
          }

StringTokenizer st3 = new StringTokenizer(groupset,"|");
          int x=0;
         
          while(st3.hasMoreTokens()){
                group[x]=(String) st3.nextToken();
                x=x+1;
          }

while( a < Integer.parseInt(totcnt)){

curchk    = chk[a];
curmonth  = mnth[a];
curgroup  = group[a];

if(curchk.equals("true")){


       ps = mk.con.prepareStatement(" DELETE BGTM_USER_COMNTS "+
                                     " where stn_cd=decode(?,'BBGS','B','TGS','T','SGS','S','NCGS','N','CTM','C','EDGE','E') and fin_yr=? and mm_val=? and exp_typ=?  ");
       ps.setString(1,station);
       ps.setString(2,finyr1);
       ps.setString(3,curmonth);
       ps.setString(4,curgroup);
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
<font face="Tahoma" color="#800080">COMMENT(S) OF STATION :</font></b><b><font face="Tahoma" color="#FF0000"> <%=station%> </font><font face="Tahoma" color="#800080"> FOR FINANCIAL YEAR :</font></b><b><font face="Tahoma" color="#FF0000"> <%=finyr%> </font><font face="Tahoma" color="#800080"> HAVE BEEN DELETED SUCCESSFULLY BY </font><font face="Tahoma" color="#FF0000"> <%=your_desg%> </font> <font face="Tahoma" color="#800080"> ON </font><font face="Tahoma" color="#FF0000"> <%=sysdate%>.</font></b></label>
<br>
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

