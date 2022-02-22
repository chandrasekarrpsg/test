<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.util.Calendar"%>
<%@page import="java.sql.*, java.io.*" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="certificate_style.css" />
        <title>IPICMS - Certificate</title>
        <script>
            function change() {
                var x = document.getElementById("dept").value;
                document.getElementById("temp").innerHTML = "";
                document.getElementById("dept1").innerHTML = x;
                document.getElementById("dept2").innerHTML = x;
            }
        </script>
    </head>
    <body align="center" >
        <%
        MakeConnectionGENORBL mk  = new MakeConnectionGENORBL();
        PreparedStatement ps  = null;
        ResultSet rs          = null;
        PreparedStatement ps1  = null;
        ResultSet rs1          = null;
        PreparedStatement ps2  = null;
        ResultSet rs2          = null;
        String month_act   = new String ("");
        String user   = new String (request.getParameter ("currentuser"));
        String code   = new String (request.getParameter ("code"));
        String contestid   = new String (request.getParameter ("contestid"));
        String name   = new String (request.getParameter ("name"));
        String office = new String (request.getParameter ("office"));
        String month  = new String (request.getParameter ("month"));
        String year   = new String (request.getParameter ("year"));
        String category = new String (request.getParameter ("category"));
        String desg = new String (request.getParameter ("desg"));
        
        String officecode = new String ("");
        String sal_code   = new String ("");
        String cert_date  = new String ("");
        String office_desc1 = new String ("");
        String office_desc  = new String ("");
        String sign = new String ("signatory");
        String query = new String ("");
        String sign_id = new String ("");
        
       ps=mk.con.prepareStatement(" select to_char(to_date(?,'Mon'),'Month') from dual ");
       ps.setString(1,month);
       rs = ps.executeQuery ();
       while (rs.next ()) {
            month_act = rs.getString (1);
       }
       rs.close();
       ps.close();
       
        query = "select to_char(add_months(to_date('10'||?||?,'DD/MM/YYYY'),1),'ddth Month,YYYY')  from dual";
                ps=mk.con.prepareStatement(query);
                ps.setString(1,month);
                ps.setString(2,year);
                rs = ps.executeQuery ();
        while (rs.next ()) {
            cert_date = rs.getString(1);
        }
            rs.close ();
            ps.close ();
        
        ps=mk.con.prepareStatement(" select salutation_value "+
                                   " from idcms_det a,IDCMS_SALUTATION b "+
                                   " where a.SALUTATION_CODE=b.SALUTATION_CODE "+
                                   " and code=? "+
                                   " and contest_id=? ");
                ps.setString(1,code);
                ps.setString(2,contestid);
                rs = ps.executeQuery ();
        while (rs.next ()) {
            sal_code = rs.getString (1);
        }
            rs.close ();
            ps.close ();

if(desg.equals("VENDOR")){
       query = "SELECT vendor_name  FROM orbl_vendor_mst WHERE vendor_code=?";
                ps=mk.con.prepareStatement(query);
                ps.setString(1,code);
                rs = ps.executeQuery ();
        while (rs.next ()) {
            office_desc1 = rs.getString(1);
        }
            rs.close ();
            ps.close ();
       
       query = "SELECT initcap(station_long_desc)  FROM cd_station WHERE station_sht_desc=?";
                ps=mk.con.prepareStatement(query);
                ps.setString(1,office);
                rs = ps.executeQuery ();
        while (rs.next ()) {
            office_desc  = rs.getString(1);
        }
            rs.close ();
            ps.close ();
}else{
       query = "SELECT initcap(station_long_desc)  FROM cd_station WHERE station_sht_desc=?";
                ps=mk.con.prepareStatement(query);
                ps.setString(1,office);
                rs = ps.executeQuery ();
        while (rs.next ()) {
            office_desc1 = rs.getString(1);
            office_desc  = rs.getString(1);
        }
            rs.close ();
            ps.close ();
}

if(category.equals("H")){
        %>
      <div id="cert" style="background-image:url('hi_impact_cert.jpg'); background-repeat:no-repeat; height:800px; width:970px;" align="center"> 
<%
}else if(category.equals("S")){
%> 
      <div id="cert" style="background-image:url('suggestion_cert.jpg'); background-repeat:no-repeat; height:650px; width:900px;" align="center"> 
<%
}else{
%>
      <div id="cert" style="background-image:url('low_impact_cert.jpg'); background-repeat:no-repeat; height:650px; width:950px;" align="center"> 
<%
}
%>
        <div id="temp"></div>
        <br /><br /><br/><br/>
<div id="logo" style="width: 800px; height:100px">
<table width="100%" height="10%" >
                <tr width="100%">
                    <td width="20%"></td>
                    <td width="10%" align="left">
                       <img src="rpsg-logo1.png" class="logo_img" alt="RP-Sanjiv Goenka Group"/>
                    </td>
                    <td width="70%" align="right">
                       <img src="cesc-logo1.png" class="logo_img" alt="RP-Sanjiv Goenka Group"/>
                    </td>
                </tr>
</table>
</div>

        <div class="head">
        <span style="font-size: 48pt; font-weight: bolder;" id="dept1"></span> <br />
        <span style="font-size: 30pt;">Generation Division Kaizen</span><br/>
        <span style="font-size: 30pt;">Certificate of Appreciation</span>
        </div><br /><br /> <br />
<%
if(category.equals("H")){
%>
        <div class="body"><span style="font-size: 20pt; " >
            Heartiest congratulation to <span style="color:green"><%=sal_code%> <%=name%></span> <br />
            &nbsp;of <span style="color:green"><%=office_desc1%></span> for your valuable contribution <br />
            in quality improvement in the month of <span style="color:green"><%=month_act%>,<%=year%>.</span></span> 
        </div><br /><br /><br /> <br /><br />
<%
}else if(category.equals("S")){
%>
        <div class="body"><span style="font-size: 20pt; " >
            Heartiest congratulation to <span style="color:#002D59"><%=sal_code%> <%=name%></span> <br />
            &nbsp;of <span style="color:#002D59"><%=office_desc1%></span> for your valuable contribution <br />
            in quality improvement in the month of <span style="color:#002D59"><%=month_act%>,<%=year%>.</span></span> 
        </div><br /><br /><br />
<%
}else{
%>
        <div class="body"><span style="font-size: 20pt; " >
            Heartiest congratulation to <span style="color:#007EBB"><%=sal_code%> <%=name%></span> <br />
            &nbsp;of <span style="color:#007EBB"><%=office_desc1%></span> for your valuable contribution <br />
            in quality improvement in the month of <span style="color:#007EBB"><%=month_act%>,<%=year%>.</span></span> 
        </div><br /><br /><br /><br /><br />
<%
}
%>
        
        <%
        String months[] = { "January", "February", "March", "April",
                            "May", "Jun", "July", "August",
                            "September", "October", "November", "December"};
        String date = new String ("");
        Calendar calendar = Calendar.getInstance();
        date = calendar.get(Calendar.DATE) + "";
        if (date.equals ("1") || date.equals ("21") || date.equals ("31"))   date += "st ";
        else if (date.equals ("2") || date.equals ("22"))    date += "nd ";
        else date+= "th ";
        date += months[calendar.get(Calendar.MONTH)] + ", ";
        date += calendar.get(Calendar.YEAR);
        try {
       
                query = "SELECT *  FROM cd_station WHERE station_sht_desc=\'" + office + "\'";
                ps=mk.con.prepareStatement(query);
                rs = ps.executeQuery ();
        
        while (rs.next ()) {
            officecode = rs.getString ("orbl_station_cd");
        }
            rs.close ();
            ps.close ();
                

        if (!officecode.equals("")){
                
                query = "SELECT * FROM IDCMS_SIGNATORY WHERE orbl_station_cd=\'" + officecode + "\' AND CATEGORY_CODE=\'" + category + "\'";
                ps=mk.con.prepareStatement(query);
                rs = ps.executeQuery ();
            while (rs.next ()) {
                sign_id = rs.getString ("SIGNATORY_ID");
            }
            rs.close ();
            ps.close ();

                query = "SELECT * FROM IDCMS_SIGNATORY_MST WHERE SIGNATORY_ID=" + sign_id;
                ps=mk.con.prepareStatement(query);
                rs = ps.executeQuery ();
            while (rs.next ()) {
                sign = rs.getString ("SIGNATORY_DESC");
            }
            rs.close ();
            ps.close ();
mk.con.close();

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
         if(mk!=null){
            mk.con.close();
         }

        } 
        %>
        
        <div class="footer">
            <table>
                <tr>
                    <td width="30%"></td>
                    <td width="10%"></td>
                    <td><font size="4"><b><%=sign%></b></font></td>
                </tr>
<%
if(sign_id.equals("1")){
%>
                <tr>
                    <td width="30%"><font size="4"><b><%=cert_date%></b></font></td>
                    <td width="10%"></td>
                    <td ><font size="4"><b>Generation Division</b></font></td>
                </tr>
<%
}else{
%>
                <tr>
                    <td width="30%"><font size="4"><b><%=cert_date%></b></font></td>
                    <td width="10%"></td>
                    <td ><font size="4"><b><%=office_desc%></b></font></td>
                </tr>
<%
}
%>
                <tr>
                    <td></td>
                    <td></td>
                    <td><font size="4"><b>CESC Limited</b></font></td>
                </tr>
            </table>
        </div>
</div>
    </body>
</html>
