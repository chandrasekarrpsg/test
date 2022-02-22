
<html>

<head>
        <meta http-equiv="Content-Language" content="en-us" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>

<script type=text/javascript>

function back_prev(){
  var parameter='';
   parameter = parameter + 'stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&finyr='+document.f1.finyr.value;
   parameter = parameter + '&finyr1='+document.f1.finyr1.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
window.close();
window.open("gen_spec_budget_dtl.jsp?"+parameter,"_self");
}
</script>
</head>
<body background="green1.jpg" onload="">
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.PrintWriter; " %>

 <%

                        MakeConnectionGENORBL mk = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;

                        String cur_bgt_level  = new String("");
                        String cur_bgt_ver    = new String("");
                        String nxt_bgt_level  = new String("");
                        String cur_emp_desg   = new String("");
                        String nxt_emp_desg   = new String("");
                        String sysdate        = new String("");
                        String your_desg      = new String("");
                        String station        = new String("");
                        String section        = new String("");
                        String stn_cd         = request.getParameter("stn_cd");
                        String sec_cd         = request.getParameter("sec_cd");
                        String finyr          = request.getParameter("finyr");
                        String finyr1         = request.getParameter("finyr1");
                        String empcd          = request.getParameter("empcd");

                        int iFailureFlag = 0;
                        int update_count = 0;
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
       
       ps = mk.con.prepareStatement("select STATION_SHT_DESC from CD_STATION where bgt_station_cd=?");
       ps.setString(1,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            station = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select SECTION_DESC from BGT_CD_SECTION  where section_cd=?");
       ps.setString(1,sec_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            section = rs.getString(1);
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
       
       ps = mk.con.prepareStatement("select nvl(max(bgt_ver),'1') from bgt_position where stn_cd=? and sec_cd=? and bgt_yr=?");
       ps.setString(1,stn_cd);
       ps.setString(2,sec_cd);
       ps.setString(3,finyr);
       rs = ps.executeQuery();
       while(rs.next()){
            cur_bgt_ver = rs.getString(1);
       }
       rs.close();
       ps.close();
System.out.println("station:"+station);
System.out.println("section:"+section);
System.out.println("cur_bgt_ver:"+cur_bgt_ver);
       
       ps = mk.con.prepareStatement("select max(bgt_level) from bgt_position where stn_cd=? and sec_cd=? and bgt_yr=? and bgt_ver=?");
       ps.setString(1,stn_cd);
       ps.setString(2,sec_cd);
       ps.setString(3,finyr);
       ps.setString(4,cur_bgt_ver);
       rs = ps.executeQuery();
       while(rs.next()){
            cur_bgt_level = rs.getString(1);
       }
       rs.close();
       ps.close();
System.out.println("cur_bgt_level:"+cur_bgt_level);


       ps = mk.con.prepareStatement(" select min(bgt_level) from bgt_level "+
				    " where stn_cd=? and sec_cd=? and bgt_level>?");
       ps.setString(1,stn_cd);
       ps.setString(2,sec_cd);
       ps.setString(3,cur_bgt_level);
       rs = ps.executeQuery();
       while(rs.next()){
            nxt_bgt_level = rs.getString(1);
       }
       rs.close();
       ps.close();
System.out.println("nxt_bgt_level:"+nxt_bgt_level);

       ps = mk.con.prepareStatement(" select EMP_DESG,NEXT_HIGHER_LEVEL_DESG "+
				    " from bgt_level where stn_cd=? and sec_cd=? and bgt_level=?");
       ps.setString(1,stn_cd);
       ps.setString(2,sec_cd);
       ps.setString(3,cur_bgt_level);
       rs = ps.executeQuery();
       while(rs.next()){
            cur_emp_desg  = rs.getString(1);
            nxt_emp_desg  = rs.getString(2);
       }
       rs.close();
       ps.close();
System.out.println("cur_emp_desg:"+cur_emp_desg);
System.out.println("nxt_emp_desg:"+nxt_emp_desg);

if(stn_cd.equals("B")){

       ps = mk.con.prepareStatement("UPDATE BGT_FORM2B_DATA_BBGS   "+
                                    " set  bgt_level = ?      "+
                                    " where stn_cd=? and sec_cd=? and bgt_yr=? and bgt_level=?  ");
       ps.setString(1,nxt_bgt_level);
       ps.setString(2,stn_cd);
       ps.setString(3,sec_cd);
       ps.setString(4,finyr);
       ps.setString(5,cur_bgt_level);
       update_count = ps.executeUpdate();
       ps.close();
}else{
       ps = mk.con.prepareStatement("UPDATE BGT_FORM2B_DATA   "+
                                    " set  bgt_level = ?      "+
                                    " where stn_cd=? and sec_cd=? and bgt_yr=? and bgt_level=?  ");
       ps.setString(1,nxt_bgt_level);
       ps.setString(2,stn_cd);
       ps.setString(3,sec_cd);
       ps.setString(4,finyr);
       ps.setString(5,cur_bgt_level);
       update_count = ps.executeUpdate();
       ps.close();
}

       ps = mk.con.prepareStatement("UPDATE BGT_POSITION "+
                                    " set  UPD_DT =sysdate, UPD_BY=?, SEND_TO_HIGHER_LEVEL_DT=sysdate, SEND_TO_HIGHER_LEVEL_BY=? "+
                                    " where stn_cd=? and sec_cd=? and bgt_yr=? and bgt_ver=? and bgt_level=?  ");
       ps.setString(1,empcd);
       ps.setString(2,empcd);
       ps.setString(3,stn_cd);
       ps.setString(4,sec_cd);
       ps.setString(5,finyr);
       ps.setString(6,cur_bgt_ver);
       ps.setString(7,cur_bgt_level);
       update_count = ps.executeUpdate();
       ps.close();

       ps = mk.con.prepareStatement(" INSERT INTO BGT_POSITION(BGT_YR,STN_CD,SEC_CD,BGT_VER,BGT_LEVEL,CRT_DT,CRT_BY) "+
                                    " VALUES(?,?,?,?,?,sysdate,?) ");
      ps.setString(1,finyr);
      ps.setString(2,stn_cd);
      ps.setString(3,sec_cd);
      ps.setString(4,cur_bgt_ver);
      ps.setString(5,nxt_bgt_level);
      ps.setString(6,empcd);
      update_count = ps.executeUpdate();
      ps.close();


mk.con.commit();

%>
<form name="f1">

<input type="hidden"  id="stn_cd" name ="stn_cd"  value="<%=stn_cd%>" />
<input type="hidden"  id="finyr" name ="finyr"  value="<%=finyr%>" />
<input type="hidden"  id="finyr1" name ="finyr1"  value="<%=finyr1%>" />
<input type="hidden"  id="empcd" name ="empcd"  value="<%=empcd%>" />

<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">FORM FOR SEND TO SUPERIOR AUTHORITY OF <%=station%> FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="4">WELCOME <%=cur_emp_desg%> !!!</font></b>
</label>

<%
if (update_count > 0){

%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="#800080">BUDGET OF :</font></b><b><font face="Tahoma" color="#FF0000"> <%=section%>(<%=station%>)</font>&nbsp;&nbsp;<font face="Tahoma" color="#800080">FOR FINANCIAL YEAR :</font><font face="Tahoma" color="#FF0000"> <%=finyr1%></font>&nbsp;&nbsp;<font face="Tahoma" color="#800080">HAS BEEN SUCCESSFULLY FORWARDED TO THE </font> <font face="Tahoma" color="#FF0000"> <%=nxt_emp_desg%> </font> <font face="Tahoma" color="#800080">BY THE </font><font face="Tahoma" color="#FF0000"> <%=cur_emp_desg%> </font><font face="Tahoma" color="#800080"> ON </font><font face="Tahoma" color="#FF0000"> <%=sysdate%></font></b></label>
<br>
<br>
<label style="left:250px; top:150px; position:absolute;"><b>
<input type="button" name="back" id="back" value="BACK" onClick="back_prev();">

<%
}
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

