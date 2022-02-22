<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*" %>
<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP Page</title>
<link rel="stylesheet" type="text/css" href="view_nom_style.css" />
<style type="text/css">

.style4 {
                                text-align: center;
                                border-style: solid;
                                border-color:  #D9F2F0;
                                background-color:#D9F2F0;
                                font-family: Arial;
                                font-size: 9pt;
}
.style18 {
                                text-align: center;
                                border-style: solid;
                                border-color:  #CACAFF;
                                background-color:#CACAFF;
                                font-family: Arial;
                                font-size: 9pt;
}
.style8 {
                                text-align: center;
                                color: #ffffff;
                                font-family: Arial;
                                font-size: 10pt;
                                background-color:#008080;
}

</style>
<script type="text/javascript">
            function back() {
                window.history.back();
            }
</script>

</head>
<body  background="Pics/Order/lblue047.gif" >
<%

        MakeConnectionGENORBL mk  = new MakeConnectionGENORBL();
        PreparedStatement ps   = null;
        ResultSet rs           = null;
        PreparedStatement ps1  = null;
        ResultSet rs1          = null;
        String sysdate   = new String("");
        String your_desg = new String("");
        String empcd     = new String("");
        empcd= request.getParameter("empcd");
try{

        int count        = 0;
        boolean isand    = false;
        String year      = new String ("");
        String month     = new String ("");
        String month_year= new String (request.getParameter ("m"));
        String office    = new String (request.getParameter ("o"));
        String user      = new String (request.getParameter ("u"));
        String stage     = new String (request.getParameter ("s"));
        String sear_title  = request.getParameter ("title") == null ? "" : request.getParameter ("title");
        String sLoginStnCd = request.getParameter("sLoginStnCd");
        String sLoginStnShrtNm = request.getParameter("sLoginStnShrtNm");
        String sLoginStnLongNm = request.getParameter("sLoginStnLongNm");
        String sLoginDeptCd = request.getParameter("sLoginDeptCd");
        String sLoginDeptShrtNm = request.getParameter("sLoginDeptShrtNm");
        String sLoginDeptLongNm = request.getParameter("sLoginDeptLongNm");
        String sLoginEmpCd = request.getParameter("sLoginEmpCd");
        String sLoginEmpNm = request.getParameter("sLoginEmpNm");
        String sLoginEmpDesg = request.getParameter("sLoginEmpDesg");
        String sLoginEmpLvl = request.getParameter("sLoginEmpLvl");
        String sLoginAdmMkr = request.getParameter("sLoginAdmMkr");
        String sLoginEmpKaizenMkr = request.getParameter("sLoginEmpKaizenMkr");

        String contestid       = new String ("");
        String contestid_act   = new String ("");
        String month_act       = new String ("");
        String office_act      = new String ("");
        String contestoff      = new String ("");
        String conteststagestr = new String ("");
        String title           = new String ("");
        String category        = new String ("");
        String query           = new String ("");
        String sStyle          = new String ("");
        String proposedby      = new String ("");
        String dept            = new String ("");
        String exist_flg       = new String ("");
        String year_act        = new String ("");
        int conteststage=0;
        int iSl_No=0;
if(year.equals("")){
    year_act="0";
}

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

if(month.equals("1")){
   month_act="January";
}else if (month.equals("2")){
   month_act="February";
}else if (month.equals("3")){
   month_act="March";
}else if (month.equals("4")){
   month_act="April";
}else if (month.equals("5")){
   month_act="May";
}else if (month.equals("6")){
   month_act="June";
}else if (month.equals("7")){
   month_act="July";
}else if (month.equals("8")){
   month_act="August";
}else if (month.equals("9")){
   month_act="September";
}else if (month.equals("10")){
   month_act="October";
}else if (month.equals("11")){
   month_act="November";
}else{
   month_act="December";
}

if(office.equals("all")){
   office_act="ALL";
}else{
        query = "SELECT station_sht_desc FROM cd_station WHERE orbl_station_cd=? ";
        ps=mk.con.prepareStatement(query);
        ps.setString(1,office);
        rs = ps.executeQuery ();
        while (rs.next()) {
         office_act=rs.getString(1);
        }
        rs.close();
        ps.close();
}

System.out.println("month:"+month);
System.out.println("year:"+year);
System.out.println("office:"+office);
System.out.println("stage:"+stage);

        query = "SELECT count(*) FROM IDCMS_MST WHERE CONTEST_MONTH =? and CONTEST_YEAR=? and STATION like decode(?,'all','%',?) and STAGE like decode(?,'all','%',?) and upper(nvl(title,' ')) like '%'||upper(?)||'%' ";
        ps=mk.con.prepareStatement(query);
        ps.setString(1,month);
        ps.setString(2,year);
        ps.setString(3,office);
        ps.setString(4,office);
        ps.setString(5,stage);
        ps.setString(6,stage);
        ps.setString(7,sear_title);
        rs = ps.executeQuery ();
        while (rs.next()) {
         exist_flg=rs.getString(1);
        }
        rs.close();
        ps.close();
System.out.println("query:"+query);
System.out.println("flg:"+exist_flg);
if(!exist_flg.equals("0")){
%>
<input type="button" value="back" onclick="back();" /><br><br>
<table style="width: 100%" border="1">
          <tr>
              <td style="width: 15%; background-color: #8282FF;" class="style8" colspan="7" align="center"><strong><b>History Of Cases For Contest Month <%=month_act%>, <%=year%> Of Station <%=office_act%></b></strong></td>
          </tr>
          <tr>
              <td style="width: 10%; background-color: #8282FF;" align="center"><strong>Contest Id </strong></td>
              <td style="width: 20%; background-color: #8282FF;" align="center"><strong>Proposed By </strong></td>
              <td style="width: 15%; background-color: #8282FF;" align="center"><strong>Station/Section </strong></td>
              <td style="width: 15%; background-color: #8282FF;" align="center""><strong>Title </strong></td>
              <td style="width: 15%; background-color: #8282FF;" align="center"><strong>Category </strong></td>
              <td style="width: 15%; background-color: #8282FF;" align="center"><strong>Stage </strong></td>
              <td style="width: 20%; background-color: #8282FF;" align="center"><strong>Options </strong></td>
          </tr>

<%
        query = "SELECT CONTEST_ID_FULL,STAGE,nvl(TITLE,' ') title,nvl(CATEGORY_TYPE,'X'),proposed_by,dept,station,station_sht_desc,contest_id FROM IDCMS_MST a,cd_station b where a.station=b.orbl_station_cd and CONTEST_MONTH =? and CONTEST_YEAR=? and STATION like decode(?,'all','%',?) and STAGE like decode(?,'all','%',?) and upper(nvl(title,' ')) like '%'||upper(?)||'%'  order by decode(station_sht_desc,'BBGS','1','TGS','2','SGS','S','NCGS','N','CTM','C','EDGE','E'),proposal_date,a.contest_id";
        ps=mk.con.prepareStatement(query);
        ps.setString(1,month);
        ps.setString(2,year);
        ps.setString(3,office);
        ps.setString(4,office);
        ps.setString(5,stage);
        ps.setString(6,stage);
        ps.setString(7,sear_title);
        rs = ps.executeQuery ();
        while (rs.next()) {
            count ++;
            contestid    = rs.getString (1);
            conteststage = rs.getInt (2);
            title        = rs.getString (3);
            category     = rs.getString (4);
            proposedby   = rs.getString (5);
            dept         = rs.getString (6);
            office       = rs.getString (8);
            contestid_act= rs.getString (9);
            
            query = "SELECT emp_fname,emp_lname FROM ADM_EMP_MST WHERE emp_code=\'" + proposedby + "\'";
            ps1=mk.con.prepareStatement(query);
            rs1 = ps1.executeQuery();
            while (rs1.next()) {
                proposedby = rs1.getString(1)+" "+rs1.getString(2);
            }
            rs1.close ();
            ps1.close ();
           
            if (category.equals ("X")) {
                category = "not set yet";
            }
            contestoff = rs.getString (7);

            query = "SELECT * FROM IDCMS_STAGE WHERE STAGE_CODE=\'" + conteststage + "\'";
            ps1=mk.con.prepareStatement(query);
            rs1 = ps1.executeQuery();
            while (rs1.next()) {
                conteststagestr = rs1.getString ("STAGE_DESC");
            }
            rs1.close ();
            ps1.close ();

            query = "SELECT station_sht_desc FROM cd_station WHERE orbl_station_cd=\'" + contestoff + "\'";
            ps1=mk.con.prepareStatement(query);
            rs1 = ps1.executeQuery();
            while (rs1.next()) {
                contestoff = rs1.getString(1);
            }
            rs1.close ();
            ps1.close ();
            
            query = "SELECT * FROM IDCMS_CATEGORY_MST WHERE CATEGORY_CODE=\'" + category + "\'";
            ps1=mk.con.prepareStatement(query);
            rs1 = ps1.executeQuery();
            while (rs1.next()) {
                category = rs1.getString ("CATEGORY_DESC");
            }
            rs1.close ();
            ps1.close ();
            
            
            query = "SELECT distinct dept_sdesc FROM ORBL_CD_DEPT_MST  WHERE dept=\'" + dept + "\'";
            ps1=mk.con.prepareStatement(query);
            rs1 = ps1.executeQuery();
            while (rs1.next()) {
                dept = rs1.getString(1);
            }
            rs1.close ();
            ps1.close ();

iSl_No = iSl_No + 1;

if( iSl_No%2 == 1){

               sStyle = "style4";

}else{

               sStyle = "style18";
}
%>

<tr>
              <td style="width: 10%" class="<%=sStyle%>"><strong><%=contestid%></strong></td>
              <td style="width: 15%" class="<%=sStyle%>"><strong><%=proposedby%></strong></td>
              <td style="width: 15%" class="<%=sStyle%>"><strong><%=office%>(<%=dept%>) </strong></td>
              <td style="width: 20%" class="<%=sStyle%>"><strong><%=title%></strong></td>
              <td style="width: 15%" class="<%=sStyle%>"><strong><%=category%></strong></td>
              <td style="width: 15%" class="<%=sStyle%>"><strong><%=conteststagestr%></strong></td>
              <td style="width: 20%" class="<%=sStyle%>"><strong>
                <form action="ipicms_nomEntry_forward.jsp" method="post">
                        <input type="hidden" name="sLoginStnCd" value="<%= sLoginStnCd%>" />
                        <input type="hidden" name="sLoginStnShrtNm" value="<%= sLoginStnShrtNm%>" />
                        <input type="hidden" name="sLoginStnLongNm" value="<%= sLoginStnLongNm%>" />
                        <input type="hidden" name="sLoginDeptCd" value="<%= sLoginDeptCd%>" />
                        <input type="hidden" name="sLoginDeptShrtNm" value="<%= sLoginDeptShrtNm%>" />
                        <input type="hidden" name="sLoginDeptLongNm" value="<%= sLoginDeptLongNm%>" />
                        <input type="hidden" name="sLoginEmpCd" value="<%= sLoginEmpCd%>" />
                        <input type="hidden" name="sLoginEmpNm" value="<%= sLoginEmpNm%>" />
                        <input type="hidden" name="sLoginEmpDesg" value="<%= sLoginEmpDesg%>" />
                        <input type="hidden" name="sLoginEmpLvl" value="<%= sLoginEmpLvl%>" />
                        <input type="hidden" name="sLoginAdmMkr" value="<%= sLoginAdmMkr%>" />
                        <input type="hidden" name="sLoginEmpKaizenMkr" value="<%= sLoginEmpKaizenMkr%>" />
                        <input type="hidden" name="sContestId" value="<%= contestid_act%>" />
                        <input type="hidden" name="sMode" value="N" />
                        <input type="hidden" name="sMsg" value="" />
                        <input type="submit" value="view details" />
                </form>
            </strong></td>
      </tr>

            </form>
<%
}
        rs.close ();
        ps.close ();
%>
</table>

<%
}else{
%>
 <TABLE height=20% width="100%" border=0 cellspacing="0" style="background-color: #77FFFF;">
        <TBODY>
          <TR>
            <TD align=middle width=100% height=100% ><font color="#cc3300" face="Courier New" Size=5><b>NO CASES PRESENT.</b></font></TD>
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
