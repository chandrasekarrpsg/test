
<html>

<head>
        <meta http-equiv="Content-Language" content="en-us" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>

<script type=text/javascript>

function back_prev(){
  
     window.open("budget_dash_main_dtl.jsp?","_self");

}

function view_bgt(){

var parameter='';
   parameter = parameter + 'stn_cd=A';
   parameter = parameter + '&sec_cd=ALL';
   parameter = parameter + '&finyr='+document.f1.finyr1.value;
   parameter = parameter + '&finyr1='+document.f1.finyr.value;
   parameter = parameter + '&empcd='+document.f1.empcd.value;
//alert(parameter);
window.open("gen_div_compl_bgt_menu1.jsp?"+parameter,"_self");

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

                        String finyr          = request.getParameter("finyr");
                        String finyr1         = request.getParameter("finyr1");
                        String empcd          = request.getParameter("empcd");
                        String sysdate        = new String("");
                        String sMssg          = new String("");
                        String cur_emp_desg   = new String("");

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
System.out.println("finyr:"+finyr);
System.out.println("empcd:"+empcd);

                             cstmt = mk.con.prepareCall( "{call DPD_GEN_ALL_CONSOLIDATE_DMY(?,?,?)}");

                             cstmt.setString(1,finyr);
                             cstmt.setString(2,empcd);
                             cstmt.registerOutParameter(3,OracleTypes.NUMBER);
                             cstmt.execute();

                             System.out.println("DPD_GEN_ALL_CONSOLIDATE_DMY PROCEDURE CALLED");

                             iRet = cstmt.getInt(3);

                             System.out.println("PROCEDURE RETURNED VALUES");

                             if(iRet==1){

                                iFailureFlag = 0;

                                sMssg = "GEN DUMMY CONSOLIDATION DONE SUCCESSFULLY ";

                             }else{

                                if(iRet==0){

                                   iFailureFlag = 1;
                                   sMssg = "ERROR OCCURRED!!!!! ";

                                }

                             }
                             cstmt.close();
                             cstmt = null;
                             System.out.println("MESSAGE:"+sMssg);
                             System.out.println("FAILURE STATUS(0-Success,1-Failure):"+iFailureFlag);
                            
                             cstmt = mk.con.prepareCall( "{call DPD_GEN_ALL_SPL_VIEW_DMY(?,?,?)}");
                             cstmt.setString(1,finyr);
                             cstmt.setString(2,empcd);
                             cstmt.registerOutParameter(3,OracleTypes.NUMBER);
                             cstmt.execute();
                             
                             System.out.println("DPD_GEN_ALL_SPL_VIEW_DMY PROCEDURE CALLED");

                             iRet = cstmt.getInt(3);

                             System.out.println("PROCEDURE RETURNED VALUES");

                             if(iRet==1){

                                iFailureFlag = 0;

                                sMssg = "DPD_GEN_ALL_SPL_VIEW_DMY PROCEDURE DONE SUCCESSFULLY. ";

                             }else{

                                if(iRet==0){

                                   iFailureFlag = 1;
                                   sMssg = "ERROR OCCURRED!!!!! ";

                                }

                             }

                             System.out.println("MESSAGE:"+sMssg);
                             System.out.println("FAILURE STATUS(0-Success,1-Failure):"+iFailureFlag);
                             
                             cstmt = mk.con.prepareCall( "{call DPD_GEN_COMPUTE_ALL_NEW(?,?)}");
                             cstmt.setString(1,finyr);
                             cstmt.registerOutParameter(2,OracleTypes.NUMBER);
                             cstmt.execute();
                             
                             System.out.println("DPD_GEN_COMPUTE_ALL_NEW PROCEDURE CALLED");

                             iRet = cstmt.getInt(2);

                             System.out.println("PROCEDURE RETURNED VALUES");

                             if(iRet==1){

                                iFailureFlag = 0;

                                sMssg = "DPD_GEN_COMPUTE_ALL_NEW  PROCEDURE DONE SUCCESSFULLY. ";

                             }else{

                                if(iRet==0){

                                   iFailureFlag = 1;
                                   sMssg = "ERROR OCCURRED!!!!! ";

                                }

                             }

                             System.out.println("MESSAGE:"+sMssg);
                             System.out.println("FAILURE STATUS(0-Success,1-Failure):"+iFailureFlag);

%>
<form name="f1">
<input type="hidden"  id="finyr" name ="finyr"  value="<%=finyr%>" />
<input type="hidden"  id="finyr1" name ="finyr1"  value="<%=finyr1%>" />
<input type="hidden"  id="empcd" name ="empcd"  value="<%=empcd%>" />

<label style="left:2px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000">Date : <%=sysdate%></font></b>
</label>

<label style="left:150px; top:5px; position: absolute" >
<b><font face="Book Antiqua" color="#800000" size="4">DUMMY CONSOLIDATION OF GENERATION BUDGET FOR FINANCIAL YEAR <%=finyr1%></font></b>
</label>

<label style="left:50px; top:30px; position: absolute" >
<b><font face="Book Antiqua" color="blue" size="4">WELCOME <%=cur_emp_desg%> !!!</font></b>
</label>


<%
if(iFailureFlag == 0){
%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="#800080">DUMMY CONSOLIDATION OF GENERATION DIVISION </font></font>&nbsp;&nbsp;<font face="Tahoma" color="#800080">FOR FINANCIAL YEAR :</font><font face="Tahoma" color="#FF0000"> <%=finyr1%></font>&nbsp;&nbsp;<font face="Tahoma" color="#800080">HAS BEEN DONE BY </font> <font face="Tahoma" color="#FF0000"> <%=cur_emp_desg%> </font> <font face="Tahoma" color="#800080">ON </font><font face="Tahoma" color="#FF0000"> <%=sysdate%> </font></b></label>
<br>
<br>
<label style="left:250px; top:150px; position:absolute;"><b>
<input type="button" name="view" id="view" value="VIEW" onClick="view_bgt();">

<%
}else{
%>
<label style="left:5px; top:100px; position:absolute;"><b>
<font face="Tahoma" color="red">DUMMY CONSOLIDATION OF GENERATION BUDGET FOR FINANCIAL YEAR : <%=finyr1%> BY <%=cur_emp_desg%> FAILED!!!!!!! </font></b></label>
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
