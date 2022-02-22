
<html>

<head>
        <meta http-equiv="Content-Language" content="en-us" />
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title></title>

<script type=text/javascript>

function loadDEPage(){

}

</script>
</head>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.PrintWriter; " %>

 <%

                        MakeConnectionGENORBL mk = null;
                        CallableStatement cstmt = null;
                        ResultSet rs = null;
                        System.out.println("gen_send_to_superior_bbgs.jsp. opened");

                        String sIns_Upd_Mkr = new String("");
                        String sDB_String = new String("");
                        String sDB_String1 = new String("");

                        String sBgt_yr        = request.getParameter("bgt_yr");
                        String sSec_cd        = request.getParameter("sec_cd");
                        String sUsername      = request.getParameter("username");
                        String sStn_cd        = request.getParameter("stn_cd");
                        String sBgt_lvl        = request.getParameter("bgt_lvl");
                        String sIp_ecode        = request.getRemoteAddr()+"_"+sUsername;

                        System.out.println(sBgt_yr+","+sSec_cd+","+sUsername+","+sStn_cd+","+sBgt_lvl+","+sIp_ecode);

                        String sMssg = new String(" ");
                        String sMssg1 = new String(" ");
                        int iRet = 0;
                        int iFailureFlag = 0;
                        try {

                             mk = new MakeConnectionGENORBL();
                             mk.con.setAutoCommit(false);


                             cstmt = mk.con.prepareCall( "{call DPD_SEND_TO_SUPERIOR_BBGS(?,?,?,?,?,?)}");

                             cstmt.setString(1,sBgt_yr);
                             cstmt.setString(2,sSec_cd);
                             cstmt.setString(3,sStn_cd);
                             cstmt.setString(4,sBgt_lvl);
                             cstmt.setString(5,sUsername);
                             cstmt.registerOutParameter(6,OracleTypes.NUMBER);
                             cstmt.execute();

                             System.out.println("DPD_SEND_TO_SUPERIOR_BBGS PROCEDURE CALLED");

                             iRet = cstmt.getInt(6);

                             System.out.println("PROCEDURE RETURNED VALUES");

                             if(iRet==1){

                                iFailureFlag = 0;

                                sMssg = "RECORDS UPDATED SUCCESSFULLY";

                             }else{

                                if(iRet==0){

                                   iFailureFlag = 1;
                                   sMssg = "ERROR OCCURRED WHILE UPDATING BGT_LEVEL,SEND_TO_SUPERIOR_DT,SEND_TO_SUPERIOR_BY IN BGT_FORM2B_DATA_BBGS,BGT_POSITION";

                                }

                             }
                             cstmt.close();
                             cstmt = null;

                             System.out.println("MESSAGE:"+sMssg);
                             System.out.println("FAILURE STATUS(0-Success,1-Failure):"+iFailureFlag);

                             if(iFailureFlag == 0){


%>
<script>

     alert("Sending to superior done successfully");
     window.parent.selfSubmit(); 

</script>
<%



                             }else{

%>
<script>

     alert("Error Occured While sending to superior");
     window.parent.selfSubmit(); 

</script>
<%
                             }

                             mk.con.close();

                } catch (Exception e) {
                    e.printStackTrace();
                    System.out.println("In EXCEPTION of gen_send_to_superior_bbgs.jsp");
                    System.out.println("MESSAGE:"+sMssg);

                } finally {

                    System.out.println("In Finally of gen_send_to_superior_bbgs.jsp");
                    try {
                        if (cstmt != null) {
                            cstmt.close();
                        }
                        if (mk != null) {
                            mk.con.close();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }


                }


%>

</html>
