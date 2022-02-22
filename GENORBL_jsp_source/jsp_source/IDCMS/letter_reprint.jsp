<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.util.Calendar"%>
<%@page import="java.sql.*, java.io.*" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IPICMS - requisition</title>
        <link rel="stylesheet" type="text/css" href="letter_style.css" />
        <script type="text/javascript">
            function prnt() {
                window.print();
            }
            function clos() {
                window.close();
            }
        </script>
    </head>
    <body class="bg">
<%
        MakeConnectionGENORBL mk  = new MakeConnectionGENORBL();
        PreparedStatement ps  = null;
        ResultSet rs          = null;
        PreparedStatement ps1  = null;
        ResultSet rs1          = null;

        // initiate necessary strings:
try{
      
 String name    = new String ("");
 String query   = new String ("");
 name           = request.getParameter ("currentuser");
 String letter_sent_to = new String ("lettersentto");
 String letter_exist   = new String ("");
 String letter_ref     = new String ("letterref");
 String letter_addr1   = new String ("letteraddr1");
 String letter_fy      = new String ("letterfy");
 letter_fy             = request.getParameter ("finyr");
        
        String letter_month = new String ("");
        String letter_yr    = new String ("");
        String month_year = new String ("");
        month_year        = request.getParameter("job_mnth");

        query = "select to_char(to_date(?,'MON-YY'),'MM'),to_char(to_date(?,'MON-YY'),'YYYY') from dual";
        ps=mk.con.prepareStatement(query);
        ps.setString(1,month_year);
        ps.setString(2,month_year);
        rs = ps.executeQuery ();
        while (rs.next()) {
         letter_month=rs.getString(1);
         letter_yr   =rs.getString(2);
        }
        rs.close();
        ps.close();

if(letter_month.equals("01")){
   letter_month="1";
}else if(letter_month.equals("02")){
   letter_month="2";
}else if(letter_month.equals("03")){
   letter_month="3";
}else if(letter_month.equals("04")){
   letter_month="4";
}else if(letter_month.equals("05")){
   letter_month="5";
}else if(letter_month.equals("06")){
   letter_month="6";
}else if(letter_month.equals("07")){
   letter_month="7";
}else if(letter_month.equals("08")){
   letter_month="8";
}else if(letter_month.equals("09")){
   letter_month="9";
}else{
   letter_month = letter_month;
}

 String monthname    = new String ("");
 String monref       = new String ("0132456789101112");
 String [] mon       = {"Udf", "January", "March" ,"February", "April", "May", "Jun", "July", "August", "September", "October", "Udf", "November", "Udf", "December"};
 monthname           = mon[monref.indexOf(letter_month)];
        
        String money_to_name = new String ("moneytoname");
        String money_to_desg = new String ("moneytodesg");
        String money_to_code = new String ("moneytocode");
        String office_name   = new String ("officename");
        String let_sig_name  = new String ("letsigname");
        String let_sig_desg  = new String ("letsigdesg");
        String let_sig_addr1 = new String ("letsigaddr1");
        String let_sig_addr2 = new String ("letsigaddr2");
        String let_sig_addr3 = new String ("letsigaddr3");
        
        //using java.util.Calendar class to get date
        String months[] = { "Jan", "Feb", "Mar", "Apr",
                            "May", "Jun", "Jul", "Aug",
                            "Sep", "Oct", "Nov", "Dec"};
        Calendar calendar = Calendar.getInstance();
        String date = new String ("");
        date = calendar.get(Calendar.DATE) + "-";
        date += months[calendar.get(Calendar.MONTH)] + "-";
        date += calendar.get(Calendar.YEAR);
        
        //create query
        query = new String ("SELECT * from IDCMS_FIN where rec_typ='1'");
        ps=mk.con.prepareStatement(query);
        rs = ps.executeQuery();
        
        //populate local strings
        while (rs.next()) {
            letter_sent_to = rs.getString ("LETTER_SENT_TO");
            letter_addr1   = rs.getString ("LETTER_ADDR1");
            money_to_name  = rs.getString ("MONEY_TO_NAME");
            money_to_desg  = rs.getString ("MONEY_TO_DESG");
            money_to_code  = rs.getString ("MONEY_TO_CODE");
            office_name    = rs.getString ("OFFICE_NAME");
            let_sig_name   = rs.getString ("LET_SIG_NAME");
            let_sig_desg   = rs.getString ("LET_SIG_DESG");
            let_sig_addr1  = rs.getString ("LET_SIG_ADDR1");
            let_sig_addr2  = rs.getString ("LET_SIG_ADDR2");
            let_sig_addr3  = rs.getString ("LET_SIG_ADDR3");
        }
        
        //colse db connections
        rs.close();
        ps.close ();
        
        //insert letter referrence to database (table: IDCMS_LET_REF)
        query = "SELECT count(*) FROM IDCMS_LET_REF WHERE CONTEST_MONTH=";
        query += letter_month + " AND CONTEST_YEAR=" + letter_yr;
        ps=mk.con.prepareStatement(query);
        rs = ps.executeQuery();

        while (rs.next()) {
            letter_exist = rs.getString (1);
        }
        rs.close ();
        ps.close ();

if(!letter_exist.equals("0")){
        
        query = "SELECT * FROM IDCMS_LET_REF WHERE CONTEST_MONTH=";
        query += letter_month + " AND CONTEST_YEAR=" + letter_yr;
        ps=mk.con.prepareStatement(query);
        rs = ps.executeQuery();

        while (rs.next()) {
            letter_ref = rs.getString ("LETTER_REF");
            //date = rs.getString ("LETTER_DT");
        }
        rs.close ();
        ps.close ();
        
String dt = new String ();
        
        query = "SELECT to_char(LETTER_DT,'DD-MON-YYYY') AS DD FROM IDCMS_LET_REF WHERE CONTEST_MONTH=" + letter_month + " AND CONTEST_YEAR=" + letter_yr;
        ps=mk.con.prepareStatement(query);
        rs = ps.executeQuery();

        while (rs.next ()) {
            dt = rs.getString ("DD");
        }
        rs.close();
        ps.close();
        
        String offname = new String ("");
        String offid = new String ("");
        int sum = 0;
        int prize = 0;
        int count1 = 0, count2 = 0, count3 = 0;
        int val = 0;
        int sl = 0;
        int stot=0, htot=0, ntot=0;
        %>
        
        <br />
        <div class="ref">
            <%=letter_ref%>
        </div>
        
        <div class="dt">
            Date: <%=dt%> <br />
        </div>
        
        <div class="letter_to">
            <%=letter_sent_to%> <br />
            <u><%=letter_addr1%></u> <br />
        </div>
        <br />
        <div class="subj">
            Requisition of Prize Money for Generation Division Kaizen <br />
            Contest (FY. <%=letter_fy%>), held for the month of <%=monthname%>,<%=letter_yr%><br />
        </div>
        <br />
        <div class="tabhead">
            &nbsp;&nbsp;&nbsp;&nbsp;
            A Department-wise detail of prize money is given below: <br />
        </div>
        <div class="tab1">
            <table>
             <tr>
               <td style="width:20%; border:solid white">&nbsp;</td>
               <td>
                <table class="tab_style" cellspacing="0">
                 <tr>
                    <td class="xtd" style="width: 2.1%;"><b>Sl. No.</b></td>
                    <td class="xtd" style="width: 32.6%;"><b>Department</b></td>
                    <td class="xtd" style="width: 26.08%;"><b>Improvement Suggestion</b></td>
                    <td class="xtd" style="width: 13.04%;"><b>No. of High Impact Kaizen</b></td>
                    <td class="xtd" style="width: 13.04%;"><b>No. of Kaizen</b></td>
                    <td class="xtd" style="width: 13.04%;"><b>Prize Money (Rs.)</b></td>
                 </tr>
                 <%
                  query = "SELECT * FROM cd_station ORDER BY decode(station_sht_desc,'BBGS','1','TGS','2','SGS','3','NCGS','4','CTM','5','EDGE','6') ";
                  ps=mk.con.prepareStatement(query);
                  rs = ps.executeQuery();
                  while (rs.next ()) {
                     sl ++;
                     prize = 0;
                     offid = rs.getString ("orbl_station_cd");
                     offname = rs.getString ("station_sht_DESC");
                     
                     query = "SELECT * FROM IDCMS_CATEGORY_MST WHERE CATEGORY_CODE='S'";
                     ps1=mk.con.prepareStatement(query);
                     rs1 = ps1.executeQuery();
                     while (rs1.next ()) {
                         val = rs1.getInt ("CATEGORY_VAL");
                     }
                     rs1.close ();
                     ps1.close ();
                    
                     ps1 = mk.con.prepareStatement(" SELECT COUNT(*) AS CC FROM IDCMS_MST WHERE STAGE=7 "+ 
                                                   " AND CATEGORY_TYPE='S' AND station=? "+ 
                                                   " AND CONTEST_MONTH=? AND CONTEST_YEAR=? ");
                     ps1.setString(1,offid);
                     ps1.setString(2,letter_month);
                     ps1.setString(3,letter_yr);
                     rs1 = ps1.executeQuery();
                     while (rs1.next ()) {
                         count1 = rs1.getInt ("CC");
                     }
                     prize += count1 * val;
                     stot += count1;
                     rs1.close ();
                     ps1.close ();
                     
                     query = "SELECT * FROM IDCMS_CATEGORY_MST WHERE CATEGORY_CODE='H'";
                     ps1=mk.con.prepareStatement(query);
                     rs1 = ps1.executeQuery();
                     while (rs1.next ()) {
                         val = rs1.getInt ("CATEGORY_VAL");
                     }
                     rs1.close ();
                     ps1.close ();

                     ps1 = mk.con.prepareStatement(" SELECT COUNT(*) AS CC FROM IDCMS_MST WHERE STAGE=7 "+ 
                                                   " AND CATEGORY_TYPE='H' AND station=? "+ 
                                                   " AND CONTEST_MONTH=? AND CONTEST_YEAR=? ");
                     ps1.setString(1,offid);
                     ps1.setString(2,letter_month);
                     ps1.setString(3,letter_yr);
                     rs1 = ps1.executeQuery();
                     while (rs1.next ()) {
                         count2 = rs1.getInt ("CC");
                     }
                     prize += count2 * val;
                     htot += count2;
                     rs1.close ();
                     ps1.close ();

                     query = "SELECT * FROM IDCMS_CATEGORY_MST WHERE CATEGORY_CODE='N'";
                     ps1=mk.con.prepareStatement(query);
                     rs1 = ps1.executeQuery();
                     while (rs1.next ()) {
                         val = rs1.getInt ("CATEGORY_VAL");
                     }
                     rs1.close ();
                     ps1.close ();

                     ps1 = mk.con.prepareStatement(" SELECT COUNT(*) AS CC FROM IDCMS_MST WHERE STAGE=7 "+ 
                                                   " AND CATEGORY_TYPE='N' AND station=? "+ 
                                                   " AND CONTEST_MONTH=? AND CONTEST_YEAR=?  ");
                     ps1.setString(1,offid);
                     ps1.setString(2,letter_month);
                     ps1.setString(3,letter_yr);
                     rs1 = ps1.executeQuery();
                     while (rs1.next ()) {
                         count3 = rs1.getInt ("CC");
                     }
                     prize += count3 * val;
                     ntot += count3;
                     sum += prize;
                     rs1.close ();
                     ps1.close ();

                     if (count1+count2+count3 > 0) {
                     %>
                     <tr>
                         <td class="xtd"><%=sl%></td>
                         <td class="xtd"><%=offname%></td>
                     <td class="xtd"><%=count1%></td>
                     <td class="xtd"><%=count2%></td>
                     <td class="xtd"><%=count3%></td>
                     <td class="xtd"><%=prize%></td>
                     </tr>
                 <%
                    }
                 }
                 rs.close ();
                 ps.close ();
                 %>
                 <tr style="font-weight: bold">
                     <td class="xtd" colspan="2">Total</td>
                     <td class="xtd"><%=stot%></td>
                     <td class="xtd"><%=htot%></td>
                     <td class="xtd"><%=ntot%></td>
                     <td class="xtd"><%=sum%></td>
                 </tr>
                </table>
              </td>
              <td style="width:20%; border: solid white;">&nbsp;</td>
             </tr>
            </table>
        </div>
        <br />
        <div class="body">
            &nbsp;&nbsp;&nbsp;&nbsp;
            Please pay Mr. <%=money_to_name%>, <%=money_to_desg%>, Code No. <%=money_to_code%>,
            the above sum of Rs. <b><%=sum%>/-</b> Payable at <%=office_name%>, on account of reimbursement of prize 
            money for Generation Division Kaizen Contest for <b>FY.<%=letter_fy%></b> held for the month of 
            <b><%=monthname%></b>,<b><%=letter_yr%></b> <br />
        </div>
        <br />
        <div class="footer">
            <b>&nbsp;</b><br /><br /><br />
            <%=let_sig_name%><br />
            <%=let_sig_desg%><br />
            <%=let_sig_addr1%><br />
            <%=let_sig_addr2%><br />
            <%=let_sig_addr3%><br />
        </div>
        
        <br /><br />
<%
}else{
%>
 <TABLE height=20% width="100%" border=0 cellspacing="0" style="background-color: #77FFFF;">
        <TBODY>
          <TR>
            <TD align=middle width=100% height=100% ><font color="#cc3300" face="Courier New" Size=5><b>No Letter Have Been Generated For <%=monthname%>, <%=letter_yr%>.</b></font></TD>
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
     if(mk!=null){
        mk.con.close();
     }
}
%>        
</body>
</html>
