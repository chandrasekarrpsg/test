<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IPICMS - print certificates</title>
        <link rel="stylesheet" type="text/css" href="print_cert_style.css" />
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
        PreparedStatement ps1  = null;
        ResultSet rs1          = null;
        PreparedStatement ps2  = null;
        ResultSet rs2          = null;
        String query = new String ("");

        String contestmonthstr = new String ("");
        String contestyear     = new String ("");
        String month_year      = new String (request.getParameter ("job_mnth"));
        String user            = new String (request.getParameter ("currentuser"));
        
        query = "select to_char(to_date(?,'MON-YY'),'Mon'),to_char(to_date(?,'MON-YY'),'YYYY') from dual";
        ps=mk.con.prepareStatement(query);
        ps.setString(1,month_year);
        ps.setString(2,month_year);
        rs = ps.executeQuery ();
        while (rs.next()) {
         contestmonthstr    = rs.getString(1);
         contestyear     = rs.getString(2);
        }
        rs.close();
        ps.close();

        String contestid = new String ("");
        int contestmonth = 0;
        String[] mon = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug",
                        "Sep", "Oct", "Nov", "Dec"};
        int x = 1;
        while (x<13 && !mon[x-1].equals (contestmonthstr)) {
            x ++;
        }
        contestmonth = x;
        
        String name = new String ("");
        String vendoffice = new String ("");
        String office = new String ("");
        String desg = new String ("");
        String code = new String ("");
        String type = new String ("");
        String category = new String ("");
        String category_desc = new String ("");
        String case_exist = new String ("");



            
       if (contestmonthstr.equals("") || contestyear.equals("")) {
%>
            <script>
                alert ("msg from IPICMS\ninvalid month and year");
                history.back ();
            </script>
            <%} else {%>
            <script>
                function validate (b) {
                    var exp = "0123456789";
                    var yearval = 0;
                    for (var i=0; i<4; i++) {
                        if (exp.indexOf(b.slice(i,(i+1))) == -1) {
                            alert ("msg from IPICMS\ninvalid year");
                            history.back ();
                        }
                        else {
                            yearval += Math.pow(10,(b.length-i-1)) * exp.indexOf(b.slice(i,(i+1)));
                        }
                    }
                    if (yearval<1000 || yearval >3000) {
                        alert ("msg from IPICMS\nabsurd year");
                        history.back ();
                    }
                }
                validate ("<%=contestyear%>");
            </script>
            <%}
        %>
        
        <span style="text-align: right;"><input type="button" value="back" onclick="back();" /></span>
        <br />
        <h1 style="color:blue">Welcome to certificate printing wizard</h1>
        <h3 style="color:black">Here Follows A List Of Persons Qualifying For A Certificate For <%=contestmonthstr%>, <%=contestyear%></h3>
        <br />
<%
        try {
                query = "SELECT count(*) FROM idcms_mst WHERE contest_month=? and contest_year=? and stage='7'";
                ps1=mk.con.prepareStatement(query);
                ps1.setInt(1,contestmonth);
                ps1.setString(2,contestyear);
                rs1 = ps1.executeQuery ();

                while (rs1.next()) {
                    case_exist   = rs1.getString(1);
                }
                 rs1.close();
                 ps1.close();

if(!case_exist.equals("0")){
%>
        <table border="1">
            <tr>
                <td style="background: blue; color: white;"><b>NAME</b></td>
                <td style="background: blue; color: white;"><b>DESIGNATION</b></td>
                <td style="background: blue; color: white;"><b>OFFICE</b></td>
                <td style="background: blue; color: white;"><b>CATEGORY</b></td>
                <td style="background: blue; color: white;"><b>GET CERTIFICATE</b></td>
            </tr>
        
        <%
        ps=mk.con.prepareStatement("SELECT CONTEST_ID,CONTESTANT_TYPE,CODE,vendor_code,initcap(vendor_name) FROM IDCMS_DET "+ 
                                   " WHERE CONTEST_ID IN (SELECT CONTEST_ID FROM IDCMS_MST WHERE STAGE=7 "+ 
                                                       " AND CONTEST_MONTH=? AND CONTEST_YEAR=? ) "+
                                   " order by contest_id,srl_no ");
        ps.setInt(1,contestmonth);
        ps.setString(2,contestyear);
        rs = ps.executeQuery ();
        while (rs.next ()) {
            contestid = rs.getString(1);
            type = rs.getString(2);
            if (type.equals ("O") || type.equals ("o")) {
                desg = "OFFICER";
                code = rs.getString (3);

                query = "SELECT initcap(emp_fname),initcap(emp_lname),emp_genstn FROM ADM_EMP_MST WHERE EMP_CODE=\'" + code + "\'";
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery ();
                while (rs1.next()) {
                    name = rs1.getString(1)+" "+rs1.getString(2);
                    office = rs1.getString(3);
                }
                 rs1.close();
                 ps1.close();
 
                query = "SELECT * FROM cd_station WHERE orbl_station_cd=\'" + office + "\'";
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery ();
                while (rs1.next ()) {
                    office = rs1.getString ("STATION_SHT_DESC");
                }
                rs1.close ();
                ps1.close ();
            }
            if (type.equals ("E") || type.equals ("e")) {
                desg = "EMPLOYEE";
                code = rs.getString (3);

                query = "SELECT initcap(EMP_NAME),STATION_CD FROM idcms_emp_mst WHERE emp_code=\'" + code + "\'";
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery ();
                while (rs1.next()) {
                    name   = rs1.getString(1);
                    office = rs1.getString(2);
                } 
                rs1.close ();
                ps1.close ();

                query = "SELECT * FROM cd_station WHERE orbl_station_cd=\'" + office + "\'";
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery ();
                while (rs1.next ()) {
                    office = rs1.getString ("STATION_SHT_DESC");
                }
                rs1.close ();
                ps1.close ();
            }
            if (type.equals ("V") || type.equals ("v")) {
                desg = "VENDOR";
                code = rs.getString (4);
                name = rs.getString (5);

                query = "SELECT * FROM orbl_vendor_mst WHERE VENDOR_CODE=\'" + code + "\'";
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery ();
                while (rs1.next ()) {
                     vendoffice = rs1.getString ("VENDOR_NAME");
                }
                rs1.close ();
                ps1.close ();

                query = "SELECT * FROM IDCMS_MST WHERE CONTEST_ID=" + contestid;
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery ();
                while (rs1.next ()) {
                    office = rs1.getString ("station");
                }
                rs1.close ();
                ps1.close ();

                query = "SELECT * FROM cd_station WHERE orbl_station_cd=\'" + office + "\'";
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery ();
                while (rs1.next ()) {
                    office = rs1.getString ("STATION_SHT_DESC");
                }
                rs1.close ();
                ps1.close ();
            }
            
            query = "SELECT category_type,decode(category_type,'S','Suggetion','H','High Impact','N','Kaizen') FROM IDCMS_MST WHERE CONTEST_ID=" + contestid;
            ps2=mk.con.prepareStatement(query);
            rs2 = ps2.executeQuery ();
            while (rs2.next ()) {
                category = rs2.getString (1);
                category_desc = rs2.getString (2);
            }
            rs2.close ();
            ps2.close ();
            
            %>
            <tr>
                <td><b><%=name%></b></td>
                <td><b><%=desg%></b></td>
                <%if (type.equals("V") || type.equals("v")) {%>
                <td><b><%=vendoffice%></b></td>
                <%} else {%>
                <td><b><%=office%></b></td>
                <%}%>
                <td><b><%=category_desc%></b></td>
                <td>
                    <form action="certificate.jsp" method="get" target="_blank">
                        <input type="hidden" name="currentuser" value="<%=user%>" />
                        <input type="hidden" name="code" value="<%=code%>" />
                        <input type="hidden" name="contestid" value="<%=contestid%>" />
                        <input type="hidden" name="name" value="<%=name%>" />
                        <input type="hidden" name="office" value="<%=office%>" />
                        <input type="hidden" name="month" value="<%=contestmonthstr%>" />
                        <input type="hidden" name="year" value="<%=contestyear%>" />
                        <input type="hidden" name="category" value="<%=category%>" />
                        <input type="hidden" name="desg" value="<%=desg%>" />
                        <input type="submit" value="Certificate" />
                    </form>
                </td>
            </tr>
        <%}
        rs.close ();
        ps.close ();
}else{
%>
<TABLE height=20% width="100%" border=0 cellspacing="0" style="background-color: #77FFFF;">
        <TBODY>
          <TR>
            <TD align=middle width=100% height=100% ><font color="#cc3300" face="Courier New" Size=5><b>No Cases Have Been Matured Till Award For <%=contestmonthstr%>, <%=contestyear%>.</b></font></TD>
          </TR>
        </TBODY>
     </TABLE>
<%
}
} catch (Exception e) {
            out.println (e);
}finally{
if(rs!=null){
        rs.close();
     }
     if(ps!=null){
        ps.close();
     }
     if(rs1!=null){
        rs1.close();
     }
     if(ps1!=null){
        ps1.close();
     }
     if(rs2!=null){
        rs2.close();
     }
     if(ps2!=null){
        ps2.close();
     }
     if(mk!=null){
        mk.con.close();
     }
}
%>
        </table>
</body>
</html>
