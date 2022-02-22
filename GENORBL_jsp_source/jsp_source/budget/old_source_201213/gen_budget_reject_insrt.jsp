
<html>

<head>
        <meta http-equiv="Content-Language" content="en-us" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>

<script type=text/javascript>

function back_prev(){
   window.open("budget_dash_main_dtl.jsp?","_self");
}

</script>
</head>
<body background="green1.jpg" onload="">
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*,java.util.*; " %>

 <%

                        MakeConnectionGENORBL mk = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        String cur_bgt_level  = new String("");
                        String arch_bgt_lvl   = new String("");
                        String cur_bgt_ver    = new String("");
                        String prev_bgt_level = new String("");
                        String new_bgt_ver    = new String("");
                        String sysdate        = new String("");
                        String your_desg      = new String("");
                        String station        = new String("");
                        String section        = new String("");
                        String stn_sht_desc   = new String("");
                        String finyr          = request.getParameter("finyr");
                        String finyr1         = request.getParameter("finyr1");
                        String empcd          = request.getParameter("empcd");
                        String totgen         = request.getParameter("totgen");
                        String chkset         = request.getParameter("chkset");
                        String gencdset       = request.getParameter("gencdset");
                        String rmksset        = request.getParameter("rmksset");
                        String curchk         = new String("");
                        String currmks        = new String("");
                        String curgencd       = new String("");
                        String [] chk         = new String[999];
                        String [] rmks        = new String[999];
                        String [] gencd       = new String[999];
                        rmksset = rmksset.replaceAll("amperssion","&");
                        rmksset = rmksset.replaceAll("percentspl","%");


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

<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">REJECTION STATUS OF GENERATION BUDGET FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="4">WELCOME <%=your_desg%> !!!</font></b>
</label>
<%

StringTokenizer st1 = new StringTokenizer(chkset,"|");
          int y=0;
         
          while(st1.hasMoreTokens()){
                chk[y]=(String) st1.nextToken();
                y=y+1;
          }

StringTokenizer st2 = new StringTokenizer(rmksset,"|");
          int z=0;
         
          while(st2.hasMoreTokens()){
                rmks[z]=(String) st2.nextToken();
                z=z+1;
          }

StringTokenizer st3 = new StringTokenizer(gencdset,"|");
          int x=0;
         
          while(st3.hasMoreTokens()){
                gencd[x]=(String) st3.nextToken();
                x=x+1;
          }
       
       ps = mk.con.prepareStatement(" insert into bgt_form2b_data_arc "+
                                    " select * from bgt_form2b_data "+
                                    " where stn_cd='A' and sec_cd='ALL' and bgt_yr=? ");
       ps.setString(1,finyr);
       update_count = ps.executeUpdate();
       ps.close();
       
       ps = mk.con.prepareStatement("delete bgt_form2b_data where stn_cd='A' and sec_cd='ALL' and bgt_yr=?");
       ps.setString(1,finyr);
       update_count = ps.executeUpdate();
       ps.close();

while( a < Integer.parseInt(totgen)){

curchk   = chk[a];
currmks  = rmks[a];
curgencd = gencd[a];

System.out.println("curchk:"+curchk);
System.out.println("currmks:"+currmks);
System.out.println("curgencd:"+curgencd);

if(curchk.equals("true")){


       ps = mk.con.prepareStatement("select station_sht_desc from cd_station where bgt_station_cd=?");
       ps.setString(1,curgencd);
       rs = ps.executeQuery();
       while(rs.next()){
            stn_sht_desc = rs.getString(1);
       }
       rs.close();
       ps.close();

System.out.println("curgencdhere:"+curgencd);

if(station.equals("")){
    station=stn_sht_desc;
}else{
    station=station+","+stn_sht_desc;
}

       ps = mk.con.prepareStatement(" insert into bgt_form2b_data_arc "+
                                    " select * from bgt_form2b_data "+
                                    " where stn_cd=? and sec_cd='ALL' and bgt_yr=? ");
       ps.setString(1,curgencd);
       ps.setString(2,finyr);
       update_count = ps.executeUpdate();
       ps.close();
       
       ps = mk.con.prepareStatement("delete bgt_form2b_data where stn_cd=? and sec_cd='ALL' and bgt_yr=?");
       ps.setString(1,curgencd);
       ps.setString(2,finyr);
       update_count = ps.executeUpdate();
       ps.close();

       ps = mk.con.prepareStatement("update bgt_position set SEND_TO_LOWER_LEVEL_DT=sysdate, SEND_TO_LOWER_LEVEL_BY=?, "+
                                    "remarks=? where stn_cd=? and sec_cd='ALL' and bgt_yr=?"); 
       ps.setString(1,empcd);
       ps.setString(2,currmks);
       ps.setString(3,curgencd);
       ps.setString(4,finyr);
       update_count = ps.executeUpdate();
       ps.close();
System.out.println("curgencdhere33end:"+curgencd);

}
a=a+1;
}
mk.con.commit();
mk.con.close();

if(update_count > 0){
%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="#800080">BUDGET(S) OF STATION(S) :</font></b><b><font face="Tahoma" color="#FF0000"> <%=station%> </font><font face="Tahoma" color="#800080"> FOR FINANCIAL YEAR :</font><font face="Tahoma" color="#FF0000"> <%=finyr1%></font>&nbsp;&nbsp;<font face="Tahoma" color="#800080"> HAVE BEEN REJECTED BY THE </font> <font face="Tahoma" color="#FF0000"> <%=your_desg%> </font> <font face="Tahoma" color="#800080">AND SEND FOR RECONSIDERATION  ON </font><font face="Tahoma" color="#FF0000"> <%=sysdate%></font></b></label>
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

