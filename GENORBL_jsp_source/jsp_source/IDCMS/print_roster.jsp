<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IPICMS - print roster</title>
        <style type="text/css">
            legend {
                color: yellow;
            }
        </style>
        <script type="text/javascript">
            function back() {
                window.history.back();
            }
        </script>
    </head>
    <body background="Pics/Order/lblue047.gif">

<%
        MakeConnectionGENORBL mk  = new MakeConnectionGENORBL();
        PreparedStatement ps  = null;
        ResultSet rs          = null;
try{
        String month = new String ("");
        String year  = new String ("");
        String month_year = new String (request.getParameter ("job_mnth"));
        String user  = new String (request.getParameter ("currentuser"));
        
        String query = new String ("");
        %>
        <input type="button" value="back" onclick="back();" />
<center>
        <div style="color:black; text-align: center">
            <h3>Please Select Station To Print Corresponding Letters </h3>
            <table>
                <tr>
                    <td style="width: 30%"></td>
                    <td style="width: 40%;">
                        <fieldset>
                            <legend style="color: blue; " ><font size="4">Station Name</font></legend>
                            <%

        query = "select to_char(to_date(?,'MON-YY'),'MM'),to_char(to_date(?,'MON-YY'),'YYYY') from dual";
        ps=mk.con.prepareStatement(query);
        ps.setString(1,month_year);
        ps.setString(2,month_year);
        rs = ps.executeQuery ();
        while (rs.next()) {
         month=rs.getString(1);
         year =rs.getString(2);
        }
        rs.close();
        ps.close();


if(month.equals("01")){
   month="1";
}else if(month.equals("02")){
   month="2";
}else if(month.equals("03")){
   month="3";
}else if(month.equals("04")){
   month="4";
}else if(month.equals("05")){
   month="5";
}else if(month.equals("06")){
   month="6";
}else if(month.equals("07")){
   month="7";
}else if(month.equals("08")){
   month="8";
}else if(month.equals("09")){
   month="9";
}else{
   month=month;
}

                            String officename = new String ("");
                            String officecode = new String ("");
                            query = "SELECT * FROM cd_station ORDER BY decode(station_sht_desc,'BBGS','1','TGS','2','SGS','3','NCGS','4','CTM','5','EDGE','6')";
                            ps=mk.con.prepareStatement(query);
                            rs = ps.executeQuery();
                            while (rs.next ()) {
                                officecode = rs.getString ("orbl_station_cd");
                                officename = rs.getString ("station_sht_desc");
                            %>
                            <form action="dept_let.jsp" method="post" target="_blank" >
                                <input type="hidden" name="currentuser" value="<%=user%>" />
                                <input type="hidden" name="month" value="<%=month%>" />
                                <input type="hidden" name="year" value="<%=year%>" />
                                <input type="hidden" name="office" value="<%=officecode%>" />
                                <input type="hidden" name="seefor" value="office" />
                                <input type="hidden" name="officename" value="<%=officename%>" />
                                <input type="submit" value="<%=officename%>" style="width: 150pt;" />
                            </form>
                            <br />
                            <%}
                            rs.close ();
                            ps.close ();
                            %>
                        </fieldset>
                    </td>
                    <td style="width: 30%"></td>
                </tr>
            </table>
        </div>
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
</center>
</body>
</html>
