
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
window.open("gen_spec_budget_dtl.jsp?"+parameter,"_self");
}

</script>
</head>
<body background="green1.jpg" onload="">
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.PrintWriter; " %>

 <%

                        MakeConnectionGENORBL mk = null;
                        CallableStatement cstmt = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;
                        System.out.println("gen_send_to_superior.jsp. opened");

                        String stn_cd         = request.getParameter("stn_cd");
                        String sec_under_auth = request.getParameter("sec_cd");
                        String finyr          = request.getParameter("finyr");
                        String finyr1         = request.getParameter("finyr1");
                        String empcd          = request.getParameter("empcd");
                        String station        = new String("");
                        String sysdate        = new String("");
                        String sMssg          = new String("");
                        String cur_emp_desg   = new String("");
                        String sec_auth       = new String("");

                        int iFailureFlag = 0;
                        int update_count = 0;
                        int iRet = 0;
                        try {

                             mk = new MakeConnectionGENORBL();
                             mk.con.setAutoCommit(false);

       ps = mk.con.prepareStatement("select to_char(trunc(sysdate),'DD-MON-RRRR') from dual");
       rs = ps.executeQuery();
       while(rs.next()){
            sysdate = rs.getString(1);
       }
       rs.close();
       ps.close();
       
       ps = mk.con.prepareStatement("select station_sht_desc from cd_station where bgt_station_cd=?");
       ps.setString(1,stn_cd);
       rs = ps.executeQuery();
       while(rs.next()){
            station = rs.getString(1);
       }
       rs.close();
       ps.close();

       ps = mk.con.prepareStatement("select emp_desg from bgt_level where emp_code=? and bgt_yr=(select max(bgt_yr) from bgt_level)");
       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            cur_emp_desg = rs.getString(1);
       }
       rs.close();
       ps.close();
System.out.println("finyr:"+finyr);
System.out.println("stn_cd:"+stn_cd);
System.out.println("sec_under_auth:"+sec_under_auth);
System.out.println("empcd:"+empcd);

if(sec_under_auth.equals("DGM(I)-BBGS")){
  sec_auth="DGM1";
}
if(sec_under_auth.equals("DGM(II)-BBGS")){
  sec_auth="DGM2";
}

                             cstmt = mk.con.prepareCall( "{call DPD_GEN_SPEC_ALL_CONSOLIDATE(?,?,?,?,?,?)}");

                             cstmt.setString(1,finyr);
                             cstmt.setString(2,stn_cd);
                             cstmt.setString(3,empcd);
                             cstmt.setString(4,sec_auth);
                             cstmt.setString(5,sec_under_auth);
                             cstmt.registerOutParameter(6,OracleTypes.NUMBER);
                             cstmt.execute();

                             System.out.println("DPD_GEN_SPEC_ALL_CONSOLIDATE PROCEDURE CALLED");

                             iRet = cstmt.getInt(6);

                             System.out.println("PROCEDURE RETURNED VALUES");

                             if(iRet==1){

                                iFailureFlag = 0;

                                sMssg = "CONSOLIDATION DONE SUCCESSFULLY FOR "+station;

                             }else{

                                if(iRet==0){

                                   iFailureFlag = 1;
                                   sMssg = "ERROR OCCURRED WHILE CONSOLIDATION OF "+station;

                                }

                             }
                             cstmt.close();
                             cstmt = null;

                             System.out.println("MESSAGE:"+sMssg);
                             System.out.println("FAILURE STATUS(0-Success,1-Failure):"+iFailureFlag);

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
<b><font face="Book Antiqua" color="#800000" size="4">STATUS OF SECTION(S) UNDER <%=sec_under_auth%> (<%=station%>) FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="4">WELCOME <%=cur_emp_desg%> !!!</font></b>
</label>


<%
if(iFailureFlag == 0){
%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="#800080">BUDGET OF SECTIONS(S) UNDER :</font></b><b><font face="Tahoma" color="#FF0000"><%=sec_under_auth%> (<%=station%>)</font>&nbsp;&nbsp;<font face="Tahoma" color="#800080">FOR FINANCIAL YEAR :</font><font face="Tahoma" color="#FF0000"> <%=finyr1%></font>&nbsp;&nbsp;<font face="Tahoma" color="#800080">HAS BEEN CONSOLIDATED BY </font> <font face="Tahoma" color="#FF0000"> <%=cur_emp_desg%> </font> <font face="Tahoma" color="#800080">ON </font><font face="Tahoma" color="#FF0000"> <%=sysdate%> </font></b></label>
<br>
<br>
<label style="left:250px; top:150px; position:absolute;"><b>
<input type="button" name="back" id="back" value="BACK" onClick="back_prev();">

<%
}else{
%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="red">BUDGET OF : <%=station%> FOR FINANCIAL YEAR : <%=finyr1%> BY <%=cur_emp_desg%> FAILED!!!!!!! </font></b></label>
<br>
<br>
<label style="left:250px; top:150px; position:absolute;"><b>
<input type="button" name="back" id="back" value="BACK" onClick="back_prev();">
<%
}

mk.con.close();

}catch(Exception e){
        e.printStackTrace();
}finally{
        if (mk != null) {
            mk.con.close();
        }
}

%>
</form>
</body>
</html>
