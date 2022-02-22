<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>departmental letter</title>
    </head>
    <body style="text-align: center">
        <%
        String seefor = new String (request.getParameter ("seefor"));
        String office = new String (request.getParameter ("office"));
        String month  = new String (request.getParameter ("month"));
        String year   = new String (request.getParameter ("year"));
        String user   = new String (request.getParameter ("currentuser"));
        String monthname  = new String ("");
        String officename = new String (request.getParameter ("officename"));
        String monref     = new String ("0132456789101112");
        String [] mon     = {"Udf", "January", "March" ,"February", "April", "May", "Jun", "July", "August", "September", "October", "Udf", "November", "Udf", "December"};
        monthname = mon[monref.indexOf(month)];


MakeConnectionGENORBL mk  = new MakeConnectionGENORBL();
        PreparedStatement ps   = null;
        ResultSet rs           = null;
        PreparedStatement ps1  = null;
        ResultSet rs1          = null;
        PreparedStatement ps2  = null;
        ResultSet rs2          = null;
        String sysdate   = new String("");
        String your_desg = new String("");
        String empcd     = new String("");
        empcd= request.getParameter("empcd");
        String money_to_name = new String("");
        String money_to_desg = new String("");
        String ofc_name      = new String("");
try{

        String contestid = new String ("");
        String officename_act = new String ("");
        String type = new String ("");
        String exist= new String ("");
        String case_exist= new String ("");
        String name = new String ("");
        String code = new String ("");
        String cid = new String ("");
        String ctype = new String ("");
        String amountstr = new String ("");
        int amount = 0;
        int val = 0;
        int nos = 0;
        int sl = 0;
        String query = new String ("");
        
            query = "SELECT count(*) FROM idcms_mst WHERE station=? and contest_month=? and contest_year=? and stage='7'";
            ps=mk.con.prepareStatement(query);
            ps.setString(1,office);
            ps.setString(2,month);
            ps.setString(3,year);
            rs = ps.executeQuery();

            while (rs.next ()) {
                exist = rs.getString (1);
            }
            rs.close();
            ps.close();

if(!exist.equals("0")){
            query = "SELECT station_long_desc FROM cd_station WHERE station_sht_desc=? ";
            ps=mk.con.prepareStatement(query);
            ps.setString(1,officename);
            rs = ps.executeQuery();

            while (rs.next ()) {
                officename_act = rs.getString (1);
            }
            rs.close();
            ps.close();
%>
        <h3 style="text-align: center; text-decoration: underline;">Kaizen Award : Prize Money Distribution</h3>
        <h3 style="text-align: center;">(For the Month of <%=monthname%>, <%=year%>)</h3> <br />
        <h3 style="text-align: center; text-decoration: underline"><%=officename_act%></h3>
        <table style="width:100%; border-spacing: 0">
            <tr style="border: black; border-collapse: collapse;">
                <td style="width: 10%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;">Sl.</td>
                <td style="width: 20%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;">Name</td>
                <td style="width: 30%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;">Station/Company</td>
                <td style="width: 20%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;">Amount (Rs.)</td>
                <td style="width: 20%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;">Signature with date</td>
            </tr>
<%
        if (seefor.equals("office")) {

            query = "SELECT upper(EMP_FNAME),upper(EMP_LNAME),EMP_CODE FROM adm_emp_mst WHERE emp_genstn=\'" + office + "\' and emp_desg <> '2000' and emp_level<> '0' and emp_code not in (select emp_code from IDCMS_EMP_MST)";
            ps=mk.con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next ()) {
                name = rs.getString (1)+" "+rs.getString (2);
                code = rs.getString (3);
                amount = val = 0;
                amountstr = "";
                
                query = "SELECT * FROM IDCMS_MST M INNER JOIN IDCMS_DET D ON M.CONTEST_ID=D.CONTEST_ID WHERE M.STAGE=7 AND M.CONTEST_MONTH=" + month + " AND M.CONTEST_YEAR=" + year + " AND D.CODE=\'" + code + "\'";
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    cid = rs1.getString ("CONTEST_ID");
                    type = rs1.getString ("CATEGORY_TYPE");

                    query = "SELECT * FROM IDCMS_CATEGORY_MST WHERE CATEGORY_CODE=\'" + type + "\'";
                    ps2=mk.con.prepareStatement(query);
                    rs2 = ps2.executeQuery();
                    while (rs2.next ()) {
                        val = rs2.getInt ("CATEGORY_VAL");
                    }
                    rs2.close ();
                    ps2.close ();

                    query = "SELECT COUNT(*) AS CC FROM IDCMS_DET WHERE CONTEST_ID=" + cid;
                    ps2=mk.con.prepareStatement(query);
                    rs2 = ps2.executeQuery();
                    while (rs2.next ()) {
                        nos = rs2.getInt("CC");
                    }
                    rs2.close ();
                    ps2.close ();

                    if (amount != 0) {
                        amountstr += "+";
                    }
                    val = val / nos;
                    amountstr += val + "/-";
                    amount += val;
                }
                rs1.close ();
                ps1.close ();
                if (amount != 0) {
                    if (amountstr.indexOf("+")==-1)    amountstr = amount + "/-";
                    else amountstr = amountstr + "=" + amount + "/-";
                    %>
                    <tr>
                        <td style="width: 10%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;"><%=++sl%></td>
                        <td style="width: 20%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;"><%=name%></td>
                        <td style="width: 30%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;"><%=officename_act%></td>
                        <td style="width: 20%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;"><%=amountstr%></td>
                        <td style="width: 20%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;">&nbsp;</td>
                    </tr>
                <%}
            }
rs.close();
ps.close();


            query = "SELECT upper(EMP_NAME),EMP_CODE FROM idcms_emp_mst WHERE station_cd=\'" + office + "\'";
            ps=mk.con.prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next ()) {
                name = rs.getString (1);
                code = rs.getString (2);
                amount = val = 0;
                amountstr = "";
                
                query = "SELECT * FROM IDCMS_MST M INNER JOIN IDCMS_DET D ON M.CONTEST_ID=D.CONTEST_ID WHERE M.STAGE=7 AND M.CONTEST_MONTH=" + month + " AND M.CONTEST_YEAR=" + year + " AND D.CODE=\'" + code + "\'";
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery();
                while (rs1.next()) {
                    cid = rs1.getString ("CONTEST_ID");
                    type = rs1.getString ("CATEGORY_TYPE");

                    query = "SELECT * FROM IDCMS_CATEGORY_MST WHERE CATEGORY_CODE=\'" + type + "\'";
                    ps2=mk.con.prepareStatement(query);
                    rs2 = ps2.executeQuery();
                    while (rs2.next ()) {
                        val = rs2.getInt ("CATEGORY_VAL");
                    }
                    rs2.close ();
                    ps2.close ();

                    query = "SELECT COUNT(*) AS CC FROM IDCMS_DET WHERE CONTEST_ID=" + cid;
                    ps2=mk.con.prepareStatement(query);
                    rs2 = ps2.executeQuery();
                    while (rs2.next ()) {
                        nos = rs2.getInt("CC");
                    }
                    rs2.close ();
                    ps2.close ();

                    if (amount != 0) {
                        amountstr += "+";
                    }
                    val = val / nos;
                    amountstr += val + "/-";
                    amount += val;
                }
                rs1.close ();
                ps1.close ();
                if (amount != 0) {
                    if (amountstr.indexOf("+")==-1)    amountstr = amount + "/-";
                    else amountstr = amountstr + "=" + amount + "/-";
                    %>
                    <tr>
                        <td style="width: 10%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;"><%=++sl%></td>
                        <td style="width: 20%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;"><%=name%></td>
                        <td style="width: 30%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;"><%=officename_act%></td>
                        <td style="width: 20%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;"><%=amountstr%></td>
                        <td style="width: 20%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;">&nbsp;</td>
                    </tr>
                <%}
            }
rs.close();
ps.close();

            query = "SELECT D.VENDOR_CODE, upper(D.VENDOR_NAME) VENDOR_NAME, M.CONTEST_ID FROM IDCMS_MST M INNER JOIN IDCMS_DET D ON M.CONTEST_ID=D.CONTEST_ID WHERE M.STAGE=7 AND M.CONTEST_MONTH=" + month + " AND M.CONTEST_YEAR=" + year + " AND M.station=\'" + office + "\' AND D.CONTESTANT_TYPE=\'v\' ORDER BY D.VENDOR_NAME";
            ps=mk.con.prepareStatement(query);
            rs = ps.executeQuery ();
            while (rs.next ()) {
                name = rs.getString ("VENDOR_NAME");
                code = rs.getString ("VENDOR_CODE");
                contestid = rs.getString ("CONTEST_ID");

                query = "SELECT COUNT(*) AS CC FROM IDCMS_DET WHERE CONTEST_ID=" + contestid;
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery ();
                while (rs1.next ()) {
                    nos = rs1.getInt ("CC");
                }
                rs1.close ();
                ps1.close ();

                query = "SELECT C.CATEGORY_VAL FROM IDCMS_MST M INNER JOIN IDCMS_CATEGORY_MST C ON M.CATEGORY_TYPE=C.CATEGORY_CODE AND M.CONTEST_ID=" + contestid;
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery ();
                while (rs1.next ()) {
                    val = rs1.getInt ("CATEGORY_VAL");
                }
                rs1.close ();
                ps1.close ();

                query = "SELECT * FROM orbl_vendor_mst WHERE VENDOR_CODE=\'" + code + "\'";
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery ();
                while (rs1.next ()){
                    officename = rs1.getString ("VENDOR_NAME");
                }
                rs1.close ();
                ps1.close ();

                amount = val / nos;
                amountstr = amount + "/-";
                %>
                <tr>
                        <td style="width: 10%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;"><%=++sl%></td>
                        <td style="width: 20%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;"><%=name%></td>
                        <td style="width: 30%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;"><%=officename%></td>
                        <td style="width: 20%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;"><%=amountstr%></td>
                        <td style="width: 20%; border-color: black; border-collapse: collapse; border-style: solid; border-width: 1px; border-spacing: 0;">&nbsp;</td>
                    </tr>
            <%}
            rs.close ();
            ps.close ();
        }%> 
        </table>
        <br /><br />
        <h3 style="text-align: right;text-decoration: underline;">Signature of GM/DGM/Sr. Manager/Manager</h3>
        <br />
<%
                query = "SELECT MONEY_TO_NAME, MONEY_TO_DESG, OFFICE_NAME from IDCMS_FIN where REC_TYP='2'";
                ps1=mk.con.prepareStatement(query);
                rs1 = ps1.executeQuery ();
                while (rs1.next ()){
                    money_to_name = rs1.getString(1);
                    money_to_desg = rs1.getString(2);
                    ofc_name = rs1.getString(3);
                }
                rs1.close ();
                ps1.close ();
%>
        <div style="text-align: center">
            <ul>
                <li>Note: Please send back this receipt to <%=money_to_name%>, <%=money_to_desg%>, at <%=ofc_name%></li>
            </ul>
        </div>
<%
}else{
%>
 <TABLE height=20% width="100%" border=0 cellspacing="0" style="background-color: #77FFFF;">
        <TBODY>
          <TR>
            <TD align=middle width=100% height=100% ><font color="#cc3300" face="Courier New" Size=5><b>No Prize Have Been Alloted For <%=officename%> For The Month Of <%=monthname%>, <%=year%>.</b></font></TD>
          </TR>
          <TR>
            <TD align=middle width=100% height=100% ><input type="button" value="CLOSE" name="close" onClick="window.close();" ></b></font></TD>
          </TR>
        </TBODY>
     </TABLE>
<%
}
}catch(Exception e){
    e.printStackTrace();
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
    </body>
</html>
