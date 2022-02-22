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
window.open("gen_spec_budget_dtl.jsp?"+parameter,"bottom");

}

function con_view(){

var parameter='';
   parameter = parameter + 'T1='+document.f1.finyr.value;
   parameter = parameter + '&username='+document.f1.empcd.value;
   parameter = parameter + '&stn_cd='+document.f1.stn_cd.value;
   parameter = parameter + '&emp_desg='+document.f1.cur_emp_desg.value;
   parameter = parameter + '&bgt_lvl=2';
   parameter = parameter + '&stn_long_desc='+document.f1.station.value;
//alert(parameter);
  window.open("generation_budget_de_ovral_cnsl_temp.jsp?"+parameter,"_self");

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

                        String stn_cd         = request.getParameter("stn_cd");
                        String finyr          = request.getParameter("finyr");
                        String finyr1         = request.getParameter("finyr1");
                        String empcd          = request.getParameter("empcd");
                        String station        = request.getParameter("station");
                        String sysdate        = new String("");
                        String sMssg          = new String("");
                        String cur_emp_desg   = new String("");
                        String sec_cd         = new String("");

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

       ps = mk.con.prepareStatement("select emp_desg from bgt_level where emp_code=?");
       ps.setString(1,empcd);
       rs = ps.executeQuery();
       while(rs.next()){
            cur_emp_desg = rs.getString(1);
       }
       rs.close();
       ps.close();
       
sec_cd = "ALL SECTIONS INTERIM ( "+empcd+" )";

                             cstmt = mk.con.prepareCall( "{call DPD_POPL_STN_CNSL_VIEW(?,?,?,?)}");

                             cstmt.setString(1,finyr);
                             cstmt.setString(2,stn_cd);
                             cstmt.setString(3,empcd);
                             cstmt.registerOutParameter(4,OracleTypes.NUMBER);
                             cstmt.execute();

                             System.out.println("DPD_POPL_STN_CNSL_VIEW PROCEDURE CALLED");

                             iRet = cstmt.getInt(4);

                             System.out.println("PROCEDURE RETURNED VALUES");

                             if(iRet==1){

                                iFailureFlag = 0;

                                sMssg = "STATION CONSOLIDATION POPULATION DONE SUCCESSFULLY FOR "+station;

                             }else{

                                if(iRet==0){

                                   iFailureFlag = 1;
                                   sMssg = "ERROR OCCURRED WHILE STATION CONSOLIDATION POPULATION OF "+station;

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
<input type="hidden"  id="station" name ="station"  value="<%=station%>" />
<input type="hidden"  id="sec_cd" name ="sec_cd"  value="<%=sec_cd%>" />
<input type="hidden"  id="empcd" name ="empcd"  value="<%=empcd%>" />
<input type="hidden"  id="cur_emp_desg" name ="cur_emp_desg"  value="<%=cur_emp_desg%>" />

<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">STATUS OF <%=station%> FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="4">WELCOME <%=cur_emp_desg%> !!!</font></b>
</label>


<%
if(iFailureFlag == 0){
%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="#800080">CONSOLIDATED VIEW FOR BUDGET OF ALL SECTIONS </font></b>&nbsp;&nbsp;<font face="Tahoma" color="#800080">OF :</font></b><b><font face="Tahoma" color="#FF0000"><%=station%></font>&nbsp;<font face="Tahoma" color="#800080">FOR FINANCIAL YEAR :</font><font face="Tahoma" color="#FF0000"> <%=finyr1%></font>&nbsp;&nbsp;<font face="Tahoma" color="#800080"> HAS BEEN PREPARED BY </font> <font face="Tahoma" color="#FF0000"> <%=cur_emp_desg%> </font> <font face="Tahoma" color="#800080">ON </font><font face="Tahoma" color="#FF0000"> <%=sysdate%> </font></b></label>
<br>
<br>
<label style="left:250px; top:150px; position:absolute;"><b>
<input type="button" name="view" id="view" value="VIEW" onClick="con_view();">

<%
}else{
%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="red">DATA PREPARATION OF CONSOLIDATED VIEW FOR ALL SECTIONS OF STATION : <%=station%> FOR FINANCIAL YEAR : <%=finyr1%> FAILED!!!!!!! </font></b></label>
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
