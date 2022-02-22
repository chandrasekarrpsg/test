
<html>

<head>
        <meta http-equiv="Content-Language" content="en-us" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>

<script type=text/javascript>

function back_prev(){
var parameter='';
parameter = parameter + 'empcd='+document.f1.empcd.value;
window.open("ins_quarter_val_fin.jsp?"+parameter,"_self");
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
                        String genstn         = new String("");
                        String station        = new String("");
                        String finyr          = new String("");
                        String empcd          = new String("");
                        String q1             = new String("");
                        String q2             = new String("");
                        String q3             = new String("");
                        String q4             = new String("");
                        genstn                = request.getParameter("genstn");
                        finyr                 = request.getParameter("finyr");
                        q1                    = request.getParameter("q1");
                        q2                    = request.getParameter("q2");
                        q3                    = request.getParameter("q3");
                        q4                    = request.getParameter("q4");
                        empcd                 = request.getParameter("empcd");

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
       
       
       ps = mk.con.prepareStatement("select emp_desg from bgt_level where emp_code=?");
       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            your_desg = rs.getString(1);
       }
       rs.close();
       ps.close();

       ps = mk.con.prepareStatement("select STATION_SHT_DESC from cd_station where bgt_station_cd=?");
       ps.setString(1,genstn);
       rs = ps.executeQuery();
       while(rs.next()){
            station = rs.getString(1);
       }
       rs.close();
       ps.close();


       ps = mk.con.prepareStatement(" update BGTM_FIN_ENTRY_TAB set q_1=to_number(?),q_2=to_number(?),q_3=to_number(?),q_4=to_number(?), "+
                                    " total=to_number(?)+to_number(?)+to_number(?)+to_number(?),upd_dt=sysdate,upd_by=? "+  
                                    " where stn_cd=? and fin_yr=? and m_c_mkr='C'");
       ps.setString(1,q1);
       ps.setString(2,q2);
       ps.setString(3,q3);
       ps.setString(4,q4);
       ps.setString(5,q1);
       ps.setString(6,q2);
       ps.setString(7,q3);
       ps.setString(8,q4);
       ps.setString(9,empcd);
       ps.setString(10,genstn);
       ps.setString(11,finyr);
       update_count = ps.executeUpdate();
       ps.close();

System.out.println("genstn:"+genstn);
System.out.println("finyr:"+finyr);
System.out.println("q1:"+q1);
System.out.println("q2:"+q2);
System.out.println("q3:"+q3);
System.out.println("q4:"+q4);
       
       
%>
<form name="f1">

<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="3">UPDATION STATUS OF FINANCE DECLARED VALUE </font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="3">WELCOME <%=your_desg%> !!!</font></b>
</label>
<%
if(update_count > 0){
%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="#800080">FINANCE DECLARED VALUES FOR STATION :</font></b><b><font face="Tahoma" color="#FF0000"> <%=station%> </font><font face="Tahoma" color="#800080"> FOR FINAANCIAL YEAR :</font></b><b><font face="Tahoma" color="#FF0000"> <%=finyr%> </font><font face="Tahoma" color="#800080"> <font face="Tahoma" color="#800080">HAVE BEEN UPDATED SUCCESSFULLY ON </font><font face="Tahoma" color="#FF0000"> <%=sysdate%>.</font></b></label>
<br>
<%
}
%>
<br>
<label style="left:400px; top:250px; position:absolute;"><b>
<input type="button" value="Back" id="B1" name="B1" style="border: 3px double #003E00; font-family:Bell MT; color:#800000; font-weight:bold; padding-left:4; padding-right:4; padding-top:1; padding-bottom:1; background-color:#FFC68C" onClick="back_prev();">
<input type="hidden" id= "empcd" name = "empcd" value="<%=empcd%>" />
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

