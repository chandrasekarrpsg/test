<%-- 
    Document   : doSpbillEntry
    Created on : Jan 14, 2013, 2:25:44 PM
    Author     : Amalesh_gole
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@page import="java.io.File"%>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="VO.*" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
LoginBean loginBn = (LoginBean) request.getSession().getAttribute("loginBean");

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    FileHandling fhndl = new FileHandling();
    String curdate = new String() ;

    try {
       int noOfRows  = 0;
        String scnDocDir = "/san304/j2eegen/GENORBL/scan_doc/";
        String scnDocTmpDir = "";
        String buildPath = "/san304/j2eegen/GENORBL/genorbl/build/web/";

        PreparedStatement ps = null ;
        ResultSet rs = null ;
        

 String ipAddress = request.getRemoteAddr();
scnDocTmpDir = buildPath+ipAddress+"/";

String userDtls = "";
userDtls = ipAddress+":"+loginBn.getsEmpCd();
String usrEmpCd = loginBn.getsEmpCd() ;
String usrEmpNm = loginBn.getsEmpFNm()+" "+ loginBn.getsEmpLNm() ;
//String usrEmpCd = "977471" ;
userDtls = ipAddress+":"+usrEmpCd;
//System.out.println("  userDtls :  "+userDtls);

String spbill_ref=request.getParameter("spbill_ref_h")== null?"":request.getParameter("spbill_ref_h");
String action_tp =request.getParameter("action_type_h")== null?"I":request.getParameter("action_type_h");
String entry_mode=request.getParameter("entry_mode_h");
String genStn = loginBn.getsGenStn();
String selgenStn = request.getParameter("selGenStn")== null?"":request.getParameter("selGenStn");;
int spbill_ref_no =0;
String bill_released_dt ="";

String erp_ac_no = "";
int unt_erp =  Integer.parseInt(request.getParameter("unt_fld").trim()) ;
int unt_no = 0;
ps = null;
rs = null;

ps = null ;
rs = null ;
ps = mk.con.prepareStatement(" select UNIT_NO , to_char(sysdate,'dd-Mon-yyyy') from ORBL_CD_UNIT where STATION = ? and UNIT_ERP = ?  ");
ps.setString(1, selgenStn);
ps.setString(2, request.getParameter("unt_fld").trim());
rs = ps.executeQuery();

if(rs.next()){
unt_no = rs.getInt(1);
bill_released_dt = rs.getString(2);
}

rs.close();
ps.close();



String erp_gen ="select dfn_derive_erp_acc('"+request.getParameter("selGenStn")+"','"+request.getParameter("bdgt_sel")+"','"+request.getParameter("dept_fld")+"',"+request.getParameter("equip_sel")+",'"+request.getParameter("jbTyp_Fld")+"','',"+unt_erp+","+request.getParameter("bdgt_sel_seq")+",'"+genStn+"') erp_ac_no from dual"  ;

//System.out.println("  erp_gen :   "+erp_gen);

ps = mk.con.prepareStatement(erp_gen) ;
rs = ps.executeQuery();
if(rs.next()){
erp_ac_no = rs.getString(1);
}
rs.close();
ps.close();




if(entry_mode.equals("E")){

ps = null ;
rs = null ;
ps = mk.con.prepareStatement(" select genorbl_spbl_entr.dfn_get_spbl_billref(?) from dual");
ps.setString(1, selgenStn);
rs = ps.executeQuery();

if(rs.next()){
spbill_ref_no = rs.getInt(1);
}

rs.close();
ps.close();

}else {
spbill_ref_no = Integer.parseInt(spbill_ref);
}

//System.out.println(" spbill_ref_no  :  "+spbill_ref_no+" action_tp : "+action_tp+" entry_mode : "+entry_mode);




String spbill_entry_str ="";

if(request.getParameter("entry_mode_h").equals("E")){


  spbill_entry_str =     " insert  into ORBL_SPBILL_DTL(BILLREF ,   "+
                               "   BILL_AMT      ,  "+
                               "   BILL_DT     ,  "+
                               "   BILL_NO     ,  "+
                               "   BILL_RECEIVED_DATE     ,  "+
                               "   BILL_REF_ID     ,  "+
                               "   BILL_RELEASE_DATE     ,  "+
                               "         BILL_STATUS     ,  "+
                               "   BUDG_AC     ,  "+
                               "   CERT_BY     ,  "+
                               "   DEPT     ,  "+
                               "   DESCRIP     ,  "+
                               "   EQREF     ,  "+
                               "   ERP_AC     ,  "+
                               "   FINANCE_RECVD_DATE     ,  "+
                               "   JOB_MONTH     ,  "+
                               "   JOBTYPE     ,  "+
                               "   ORDDT     ,  "+
                               "   ORDNO     ,  "+
                               "   REMARKS     ,  "+
                               "   STATION     ,  "+
                               "   UNIT_NO     ,  "+
                               "   URGENT_PAYMENT     ,  "+
                               "   URGENT_REMARKS     ,    "+
                               "   URGENTINVOICEATTACHED,        "+
                               "   VENDOR,             "+
                               "   CRT_BY     ,  "+
                               "   CRT_DT     ,  "+
                               "   PLANT_REF     ,  "+
                               "   UNIT_ERP     ,  "+
                               "   BILL_CANCEL     ,  "+
                               "   HEAD_SEQ_NO     ) "+
                               "   values( ? ,       "+
                               "           ? ,       "+
                               "           to_date(?,'dd-Mon-yyyy') ,       "+
                               "           ? ,       "+
                               "           to_date(?,'dd-Mon-yyyy') ,       "+
                               "           ? ,       "+
                               "           to_date(?,'dd-Mon-yyyy') ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           to_date(?,'dd-Mon-yyyy') ,       "+
                               "           to_date(?,'dd-Mon-yyyy') ,       "+
                               "           ? ,       "+
                               "           to_date(?,'dd-Mon-yyyy') ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           SYSDATE ,       "+
                               "           ?,       "+
                               "           ?,       "+
                               "           'N',       "+
                               "           ? )       "+
                                  "";



}else if(entry_mode.equals("U")){


if(action_tp.equals("E")){





spbill_entry_str =     " update   ORBL_SPBILL_DTL set BILLREF = ?,   "+
                               "   BILL_AMT = ?     ,  "+
                               "   BILL_DT = to_date(?,'dd-Mon-yyyy')     ,  "+
                               "   BILL_NO = ?    ,  "+
                               "   BILL_RECEIVED_DATE = to_date(?,'dd-Mon-yyyy')    ,  "+
                               "   BILL_REF_ID   = ?  ,  "+
                               "   BILL_RELEASE_DATE  = to_date(?,'dd-Mon-yyyy')   ,  "+
                               "         BILL_STATUS   = ?  ,  "+
                               "   BUDG_AC   = ?  ,  "+
                               "   CERT_BY   = ?  ,  "+
                               "   DEPT  = ?   ,  "+
                               "   DESCRIP  = ?   ,  "+
                               "   EQREF   = ?  ,  "+
                               "   ERP_AC   = ?  ,  "+
                               "   FINANCE_RECVD_DATE  = to_date(?,'dd-Mon-yyyy')   ,  "+
                               "   JOB_MONTH    =  to_date(?,'dd-Mon-yyyy')  ,  "+
                               "   JOBTYPE  = ?   ,  "+
                               "   ORDDT  =  to_date(?,'dd-Mon-yyyy')   ,  "+
                               "   ORDNO  = ?   ,  "+
                               "   REMARKS  = ?   ,  "+
                               "   STATION   = ?  ,  "+
                               "   UNIT_NO   = ?  ,  "+
                               "   URGENT_PAYMENT = ?    ,  "+
                               "   URGENT_REMARKS  = ?   ,    "+
                               "   URGENTINVOICEATTACHED = ? ,        "+
                               "   VENDOR = ?   ,             "+
                               "   UPD_BY   = ?  ,  "+
                               "   UPD_DT   = sysdate  ,  "+
                               "   PLANT_REF   = ?  ,  "+
                               "   UNIT_ERP   = ? ,   "+
                               "   BILL_CANCEL   = 'N' ,   "+
                               "   HEAD_SEQ_NO   = ?    "+
                               "  where BILLREF = ?    "+
                                  "";


}else if(action_tp.equals("C")){
        



spbill_entry_str =     " update   ORBL_SPBILL_DTL set BILLREF = ?,   "+
                               "   BILL_AMT = ?     ,  "+
                               "   BILL_DT = to_date(?,'dd-Mon-yyyy')     ,  "+
                               "   BILL_NO = ?    ,  "+
                               "   BILL_RECEIVED_DATE = to_date(?,'dd-Mon-yyyy')    ,  "+
                               "   BILL_REF_ID   = ?  ,  "+
                               "   BILL_RELEASE_DATE  = to_date(?,'dd-Mon-yyyy')   ,  "+
                               "         BILL_STATUS   = ?  ,  "+
                               "   BUDG_AC   = ?  ,  "+
                               "   CERT_BY   = ?  ,  "+
                               "   DEPT  = ?   ,  "+
                               "   DESCRIP  = ?   ,  "+
                               "   EQREF   = ?  ,  "+
                               "   ERP_AC   = ?  ,  "+
                               "   FINANCE_RECVD_DATE  = to_date(?,'dd-Mon-yyyy')   ,  "+
                               "   JOB_MONTH    =  to_date(?,'dd-Mon-yyyy')  ,  "+
                               "   JOBTYPE  = ?   ,  "+
                               "   ORDDT  =  to_date(?,'dd-Mon-yyyy')   ,  "+
                               "   ORDNO  = ?   ,  "+
                               "   REMARKS  = ?   ,  "+
                               "   STATION   = ?  ,  "+
                               "   UNIT_NO   = ?  ,  "+
                               "   URGENT_PAYMENT = ?    ,  "+
                               "   URGENT_REMARKS  = ?   ,    "+
                               "   URGENTINVOICEATTACHED = ? ,        "+
                               "   VENDOR = ?   ,             "+
                               "   UPD_BY   = ?  ,  "+
                               "   UPD_DT   = sysdate  ,  "+
                               "   PLANT_REF   = ?  ,  "+
                               "   UNIT_ERP = ?,     "+
                               "   BILL_CANCEL   = 'Y' ,   "+
                               "   HEAD_SEQ_NO   = ? ,   "+
                               "    BILL_CANCEL_BY = ? ,   "+
                               "   BILL_CANCEL_DATE = sysdate,   "+
                               "   BILL_CANCEL_REMARKS = ?     "+
                               "  where BILLREF = ?    "+
                                  "";



}

}

if(action_tp.equals("I") || action_tp.equals("E") || action_tp.equals("C")){

//System.out.println(" job_mnth:  "+request.getParameter("job_mnth")+"  vndr_sel:  "+request.getParameter("vndr_sel"));


String job_month_str = request.getParameter("job_mnth") ;
if(!job_month_str.trim().equals("")){
job_month_str = "01-"+job_month_str ;
}else{
job_month_str = null;
}
//System.out.println(" job_mnth:  "+job_month_str+"  vndr_sel:  "+request.getParameter("vndr_sel"));

 ps = null;
 rs = null;
 ps = mk.con.prepareStatement(spbill_entry_str);
 ps.setInt(1, spbill_ref_no);
 ps.setString(2, request.getParameter("bill_amt"));
 ps.setString(3, request.getParameter("bill_dt"));
 ps.setString(4, request.getParameter("bill_no"));
 ps.setString(5, request.getParameter("bill_rcvd_on"));
 ps.setString(6,"0");
 ps.setString(7, bill_released_dt);
 ps.setString(8, request.getParameter("bill_sts"));
 ps.setString(9, request.getParameter("bdgt_sel"));
 ps.setString(10,usrEmpCd );
 ps.setString(11, request.getParameter("dept_fld"));
 ps.setString(12, request.getParameter("bill_desc"));
 ps.setString(13, request.getParameter("equip_sel"));
 ps.setString(14, erp_ac_no);
 ps.setString(15, "");
 ps.setString(16, job_month_str);
 ps.setString(17, request.getParameter("jbTyp_Fld"));
 ps.setString(18, request.getParameter("ordr_dt"));
 ps.setString(19, request.getParameter("ordr_no"));
 ps.setString(20, request.getParameter("add_rmrks"));
 ps.setString(21, request.getParameter("selGenStn"));
 ps.setString(22, unt_no+"");
 ps.setString(23, request.getParameter("urgent_basis_h"));
 ps.setString(24, request.getParameter("urgent_rmrks_h"));
 ps.setString(25, request.getParameter("invoice_attchd_h"));
 ps.setString(26, request.getParameter("vndr_sel"));
 ps.setString(27, userDtls);
 ps.setString(28, request.getParameter("plant_sel"));
 ps.setString(29, unt_erp+"");
 ps.setString(30, request.getParameter("bdgt_sel_seq")+"");

if(entry_mode.equals("U")){

if(action_tp.equals("E")){
ps.setInt(31, spbill_ref_no);
}else if(action_tp.equals("C")){
ps.setString(31, usrEmpCd);
ps.setString(32, request.getParameter("cncl_rmrks"));
ps.setInt(33, spbill_ref_no);

}

}



 
//System.out.println("  spbill_ref_no  "+spbill_ref_no+" bill_amt  "+request.getParameter("bill_amt")+"  bill_dt "+request.getParameter("bill_dt") +" bill_rcvd_on "+request.getParameter("bill_rcvd_on")+" bill_sts "+request.getParameter("bill_sts")+" bdgt_sel "+request.getParameter("bdgt_sel")+" dept_fld "+request.getParameter("dept_fld")+" add_rmrks "+request.getParameter("add_rmrks")+" ordr_no  "+request.getParameter("ordr_no")+" unt_fld  "+request.getParameter("unt_fld")+" vndr_sel "+request.getParameter("vndr_sel")+" invoice_attchd_h "+request.getParameter("invoice_attchd_h")+" urgent_rmrks_h  "+request.getParameter("urgent_rmrks_h")+" urgent_basis_h  "+request.getParameter("urgent_basis_h")+" selGenStn "+request.getParameter("selGenStn")+" bill_desc  "+request.getParameter("bill_desc")+" jbTyp_Fld  "+request.getParameter("jbTyp_Fld")+" job_mnth  "+request.getParameter("job_mnth")); 

//System.out.println("  spbill_entry_str  "+spbill_entry_str); 
 noOfRows = ps.executeUpdate();
 ps.close();

}




String after_entry_msg = "";

if(noOfRows > 0){

String tmp1 = "INSERTION  SUCCESSFUL  ";
String tmp2 = "";


if(entry_mode.equals("U") && !action_tp.equals("C")){
tmp1 = "UPDATION  SUCCESSFUL  ";
}else if(action_tp.equals("C")){
tmp1 = "CANCELLATION  SUCCESSFUL  ";

}
if(action_tp.equals("I") ){
//tmp1 = "  SENT  FOR RECOMMENDATION ";
}else if(action_tp.equals("R")  ){
//tmp1 = "  SENT  FOR APPROVAL ";
}else if(action_tp.equals("A")  ){
//tmp1 = "   APPROVAL  ";
tmp2 = "  DONE ";
}


    %>

    <p align=center > <b> <font color="green" size=5px ><%= tmp1 %>   FOR Special Bill    <u> <%= spbill_ref_no %> </u>  <%= tmp2  %>  </font></b> </p>

    <%
after_entry_msg = " <b> <font color=\"green\" size=5px >"+ tmp1 +"   FOR Special Bill   <u> "+ spbill_ref_no +" </u> "+
  tmp2+" </font></b>   ";
    response.sendRedirect("after_spbill_entry.jsp?after_entry_msg="+tmp1+"&spblref="+spbill_ref_no+"&spblamt="+request.getParameter("bill_amt")+"&spblno="+request.getParameter("bill_no")+"&spbldt="+request.getParameter("bill_dt")+"&erp_ac="+erp_ac_no+"&urgnt_mkr="+request.getParameter("urgent_basis_h"));
}

%>
        
        
<%
}
    catch(Exception e){
        e.printStackTrace();
    }
    finally {
        mk.con.close() ;
    }
    
    
    
%>



    </body>
</html>

