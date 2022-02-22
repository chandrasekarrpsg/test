<%-- 
    Document   : doVndrEntry
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
String usrEmpNm = loginBn.getsEmpFNm().trim()+" "+ loginBn.getsEmpLNm().trim() ;
//String usrEmpCd = "977471" ;
userDtls = ipAddress+":"+usrEmpCd;
//System.out.println("  userDtls :  "+userDtls);

String vndr_ref=request.getParameter("vndr_cd_h")== null?"":request.getParameter("vndr_cd_h");
String action_tp =request.getParameter("action_type_h")== null?"I":request.getParameter("action_type_h");
String entry_mode=request.getParameter("entry_mode_h");
String genStn = loginBn.getsGenStn();
//String genStn = "016";
int vndr_ref_no =0;
int prev_vndr_ref_no = 0 ;


if(entry_mode.equals("E") || action_tp.equals("NAC")){

ps = null ;
rs = null ;
ps = mk.con.prepareStatement(" select genorbl_vndr_entr.dfn_get_vendor_ref() from dual");
//ps.setString(1, genStn);
rs = ps.executeQuery();

if(rs.next()){
vndr_ref_no = rs.getInt(1);
}

rs.close();
ps.close();
if(action_tp.equals("NAC")){
prev_vndr_ref_no = Integer.parseInt(vndr_ref);
}

}else {
vndr_ref_no = Integer.parseInt(vndr_ref);
}

//System.out.println(" vndr_ref_no  :  "+vndr_ref_no+" prev_vndr_ref_no : "+prev_vndr_ref_no);

File srcFolder = new File(scnDocTmpDir);
    	File destFolder = new File(scnDocDir+vndr_ref_no+"/");

fhndl.copyFolder(srcFolder , destFolder);



String vendor_entry_str ="";

if(request.getParameter("entry_mode_h").equals("E") || action_tp.equals("NAC") ){

if(action_tp.equals("NAC")){

vendor_entry_str =     " update   ORBL_VENDOR_MST set VENDOR_STATUS = 'O' ,   "+
                               "   UPD_BY    = ?  ,  "+
                               "   UPD_DT    = sysdate   "+
                               "  where VENDOR_CODE = ?    "+
                               "";
 ps = null;
 rs = null;
 ps = mk.con.prepareStatement(vendor_entry_str);
 ps.setString(1, userDtls);
 ps.setInt(2, prev_vndr_ref_no);
 noOfRows = ps.executeUpdate();
 ps.close();


}


  vendor_entry_str =     " insert  into ORBL_VENDOR_MST(VENDOR_CODE ,   "+
                               "   VENDOR_NAME      ,  "+
                               "   ADDRESS1     ,  "+
                               "   ADDRESS2     ,  "+
                               "   ADDRESS3     ,  "+
                               "   ADDRESS4     ,  "+
                               "   CONTACT_PERSON     ,  "+
                               "         TEL_NO     ,  "+
                               "   FAX_NO     ,  "+
                               "   MOBILE_NO     ,  "+
                               "   EMAIL_ID     ,  "+
                               "   WEBSITE     ,  "+
                               "   WORK_AREA     ,  "+
                               "   WAGELIAB     ,  "+
                               "   PROPOSING_DEPT     ,  "+
                               "   PROPOSING_STN     ,  "+
                               "   PROPOSING_CODE     ,  "+
                               "   PROPOSING_NAME     ,  "+
                               "   PROPOSING_DATE     ,  "+
                               "   RECOMMENDATION_CODE     ,  "+
                               "   RECOMMENDATION_NAME     ,  "+
                               "   RECOMMENDATION_DATE     ,    "+
                               "   APPROVER_CODE,             "+
                               "    APPROVER_NAME,           "+
                               "    APPROVAL_DATE   ,       "+
                               "   APPROVED_FOR_BBGS,      "+
                               "   APPROVED_FOR_BBGS_DATE,     "+
                               "   APPROVED_FOR_SGS,              "+
                               "    APPROVED_FOR_SGS_DATE,    "+
                               "     APPROVED_FOR_TGS,      "+
                               "      APPROVED_FOR_TGS_DATE,    "+
                               "    APPROVED_FOR_NCGS,           "+
                               "     APPROVED_FOR_NCGS_DATE,    "+
                               "    APPROVED_FOR_CTM,       "+
                               "   APPROVED_FOR_CTM_DATE,     "+
                               "    APPROVED_FOR_EDGE,     "+
                               "   APPROVED_FOR_EDGE_DATE,         "+ 
                               "   VENDOR_STATUS     ,  "+                                                            
                               "   CRT_BY     ,  "+
                               "   CRT_DT     ,  "+
                               "   ADDRESS5     ,  "+
                               "   VENDOR_CODE_PREV     ) "+
                               "   values( ? ,       "+
                               "       upper(?) ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+
                               "          ? ,       "+
                               "           ? ,       "+
                               "           ? ,       "+                                                             
                               "           SYSDATE ,       "+                                                             
                               "           ? ,       "+                                                             
                               "           ? )       "+
                                  "";


}else if(entry_mode.equals("U")){


if(action_tp.equals("I")){





vendor_entry_str =     " update   ORBL_VENDOR_MST set VENDOR_CODE = ? ,   "+
                               "    VENDOR_NAME = upper(?)      ,  "+
                               "   ADDRESS1  = ?    ,  "+
                               "   ADDRESS2  = ?    ,  "+
                               "   ADDRESS3  = ?    ,  "+
                               "   ADDRESS4   = ?   ,  "+
                               "   CONTACT_PERSON  = ?    ,  "+
                               "         TEL_NO   = ?   ,  "+
                               "   FAX_NO    = ?  ,  "+
                               "   MOBILE_NO  = ?     ,  "+
                               "   EMAIL_ID    = ?   ,  "+
                               "   WEBSITE     = ? ,  "+
                               "   WORK_AREA    = ?  ,  "+
                               "   WAGELIAB     = ? ,  "+
                               "   PROPOSING_DEPT = ?     ,  "+
                               "   PROPOSING_STN    = ?  ,  "+
                               "   PROPOSING_CODE    = ?  ,  "+
                               "   PROPOSING_NAME     = ? ,  "+
                               "   PROPOSING_DATE     = ? ,  "+
                               "   RECOMMENDATION_CODE  = ?    ,  "+
                               "   RECOMMENDATION_NAME   = ?   ,  "+
                               "   RECOMMENDATION_DATE     = ? ,  "+
                               "   APPROVER_CODE = ? ,             "+
                               "    APPROVER_NAME = ? ,           "+
                               "    APPROVAL_DATE  = ?   ,          "+ 
                               "   APPROVED_FOR_BBGS = ? ,      "+
                               "   APPROVED_FOR_BBGS_DATE = ? ,     "+
                               "   APPROVED_FOR_SGS = ? ,              "+
                               "    APPROVED_FOR_SGS_DATE = ? ,    "+
                               "     APPROVED_FOR_TGS = ? ,      "+
                               "      APPROVED_FOR_TGS_DATE = ? ,    "+
                               "    APPROVED_FOR_NCGS = ? ,           "+
                               "     APPROVED_FOR_NCGS_DATE = ? ,    "+
                               "    APPROVED_FOR_CTM = ? ,       "+
                               "   APPROVED_FOR_CTM_DATE = ? ,     "+
                               "    APPROVED_FOR_EDGE = ? ,     "+
                               "   APPROVED_FOR_EDGE_DATE = ? ,         "+ 
                               "   VENDOR_STATUS      = ?,  "+                           
                               "   UPD_BY    = ?  ,  "+
                               "   UPD_DT    = sysdate,   "+
                               "   ADDRESS5    = ?    "+
                               "  where VENDOR_CODE = ?    "+
                                  "";


}else if(action_tp.equals("R")){
  vendor_entry_str =     " update   ORBL_VENDOR_MST set  VENDOR_CODE = ? ,   "+
                               "    VENDOR_NAME = upper(?)      ,  "+
                               "   ADDRESS1  = ?    ,  "+
                               "   ADDRESS2  = ?    ,  "+
                               "   ADDRESS3  = ?    ,  "+
                               "   ADDRESS4   = ?   ,  "+
                               "   CONTACT_PERSON  = ?    ,  "+
                               "         TEL_NO   = ?   ,  "+
                               "   FAX_NO    = ?  ,  "+
                               "   MOBILE_NO  = ?     ,  "+
                               "   EMAIL_ID    = ?   ,  "+
                               "   WEBSITE     = ? ,  "+
                               "   WORK_AREA    = ?  ,  "+
                               "   WAGELIAB     = ? ,  "+
                               "   RECOMMENDATION_CODE  = ?    ,  "+
                               "   RECOMMENDATION_NAME   = ?   ,  "+
                               "   RECOMMENDATION_DATE     = ? ,  "+
                                "   VENDOR_STATUS      = ?,  "+
                               "   UPD_BY    = ?  ,  "+
                               "   UPD_DT    = sysdate,   "+
                               "   ADDRESS5    = ?    "+
                               "  where VENDOR_CODE = ?    "+
                                  "";

}else if(action_tp.equals("C")){
  vendor_entry_str =     " update   ORBL_VENDOR_MST set  VENDOR_CODE = ? ,   "+
                               "    VENDOR_NAME = upper(?)      ,  "+
                               "   ADDRESS1  = ?    ,  "+
                               "   ADDRESS2  = ?    ,  "+
                               "   ADDRESS3  = ?    ,  "+
                               "   ADDRESS4   = ?   ,  "+
                               "   CONTACT_PERSON  = ?    ,  "+
                               "         TEL_NO   = ?   ,  "+
                               "   FAX_NO    = ?  ,  "+
                               "   MOBILE_NO  = ?     ,  "+
                               "   EMAIL_ID    = ?   ,  "+
                               "   WEBSITE     = ? ,  "+
                               "   WORK_AREA    = ?  ,  "+
                               "   WAGELIAB     = ? ,  "+
                                "   VENDOR_STATUS      = ?,  "+
                               "   UPD_BY    = ?  ,  "+
                               "   UPD_DT    = sysdate,   "+
                               "   ADDRESS5    = ?    "+
                               "  where VENDOR_CODE = ?    "+
                                  "";

}else if(action_tp.equals("A")){


vendor_entry_str =     " update   ORBL_VENDOR_MST set VENDOR_STATUS = 'T' ,   "+
                               "   UPD_BY    = ?  ,  "+
                               "   UPD_DT    = sysdate   "+
                               "  where VENDOR_CODE = ( select VENDOR_CODE_PREV "+
                               "                        from ORBL_VENDOR_MST where VENDOR_CODE = ?)  "+
                               "   And VENDOR_STATUS = 'O'  "+
                               "";
 ps = null;
 rs = null;
 ps = mk.con.prepareStatement(vendor_entry_str);
 ps.setString(1, userDtls);
 ps.setInt(2, vndr_ref_no);
 noOfRows = ps.executeUpdate();
 ps.close();




  vendor_entry_str =     " update   ORBL_VENDOR_MST set VENDOR_CODE = ? ,   "+
                               "    VENDOR_NAME = upper(?)      ,  "+
                               "   ADDRESS1  = ?    ,  "+
                               "   ADDRESS2  = ?    ,  "+
                               "   ADDRESS3  = ?    ,  "+
                               "   ADDRESS4   = ?   ,  "+
                               "   CONTACT_PERSON  = ?    ,  "+
                               "         TEL_NO   = ?   ,  "+
                               "   FAX_NO    = ?  ,  "+
                               "   MOBILE_NO  = ?     ,  "+
                               "   EMAIL_ID    = ?   ,  "+
                               "   WEBSITE     = ? ,  "+
                               "   WORK_AREA    = ?  ,  "+
                               "   WAGELIAB     = ? ,  "+
                               "   APPROVER_CODE = ? ,             "+
                               "    APPROVER_NAME = ? ,           "+
                               "    APPROVAL_DATE  = ?   ,          "+
                               "   APPROVED_FOR_BBGS = ? ,      "+
                               "   APPROVED_FOR_BBGS_DATE = ? ,     "+
                               "   APPROVED_FOR_SGS = ? ,              "+
                               "    APPROVED_FOR_SGS_DATE = ? ,    "+
                               "     APPROVED_FOR_TGS = ? ,      "+
                               "      APPROVED_FOR_TGS_DATE = ? ,    "+
                               "    APPROVED_FOR_NCGS = ? ,           "+
                               "     APPROVED_FOR_NCGS_DATE = ? ,    "+
                               "    APPROVED_FOR_CTM = ? ,       "+
                               "   APPROVED_FOR_CTM_DATE = ? ,     "+
                               "    APPROVED_FOR_EDGE = ? ,     "+
                               "   APPROVED_FOR_EDGE_DATE = ? ,         "+
                               "   VENDOR_STATUS      = ?,  "+
                               "   UPD_BY    = ?  ,  "+
                               "   UPD_DT    = sysdate ,   "+
                               "   ADDRESS5   = ?   ,  "+
                               "   REMARKS   = null     "+
                               "  where VENDOR_CODE = ?    "+
                                  "";
 

}else if(action_tp.equals("E")){


vendor_entry_str =     " update   ORBL_VENDOR_MST set VENDOR_CODE = ? ,   "+
                               "    VENDOR_NAME = upper(?)      ,  "+
                               "   ADDRESS1  = ?    ,  "+
                               "   ADDRESS2  = ?    ,  "+
                               "   ADDRESS3  = ?    ,  "+
                               "   ADDRESS4   = ?   ,  "+
                               "   CONTACT_PERSON  = ?    ,  "+
                               "         TEL_NO   = ?   ,  "+
                               "   FAX_NO    = ?  ,  "+
                               "   MOBILE_NO  = ?     ,  "+
                               "   EMAIL_ID    = ?   ,  "+
                               "   WEBSITE     = ? ,  "+
                               "   WORK_AREA    = ?  ,  "+
                               "   WAGELIAB     = ? ,  "+
                               "   VENDOR_STATUS      = ?,  "+
                               "   UPD_BY    = ?  ,  "+
                               "   UPD_DT    = sysdate,   "+
                               "   ADDRESS5    = ?    "+
                               "  where VENDOR_CODE = ?    "+
                                  "";

}else if(action_tp.equals("J")){

vendor_entry_str =     " update   ORBL_VENDOR_MST set VENDOR_STATUS = 'J' ,   "+
                               "    REMARKS = ?      ,  "+
                               "   TERMINATOR_NAME  = ?    ,  "+
                               "   TERMINATOR_CODE  = ?    ,  "+
                               "   UPD_BY    = ?  ,  "+
                               "   UPD_DT    = sysdate   "+
                               "  where VENDOR_CODE = ?    "+
                               "";
 ps = null;
 rs = null;
 ps = mk.con.prepareStatement(vendor_entry_str);
 ps.setString(1, request.getParameter("rjct_rmrks"));
 ps.setString(2, usrEmpNm);
 ps.setString(3, usrEmpCd);
 ps.setString(4, userDtls);
 ps.setInt(5, vndr_ref_no);
 noOfRows = ps.executeUpdate();
 ps.close();

}else if(action_tp.equals("SB")){

vendor_entry_str =     " update   ORBL_VENDOR_MST set VENDOR_STATUS = ? ,   "+
                               "    REMARKS = ?      ,  "+
                               "   UPD_BY    = ?  ,  "+
                               "   UPD_DT    = sysdate   "+
                               "  where VENDOR_CODE = ?    "+
                               "";
 //System.out.println("in Sent Back mode : "+vendor_entry_str+"  sent_back_sts_h "+request.getParameter("sent_back_sts_h"));
 ps = null;
 rs = null;
 ps = mk.con.prepareStatement(vendor_entry_str);
 ps.setString(1, request.getParameter("sent_back_sts_h"));
 ps.setString(2, request.getParameter("sent_back_rmrks_h"));
 ps.setString(3, userDtls);
 ps.setInt(4, vndr_ref_no);
 noOfRows = ps.executeUpdate();
 ps.close();

}else if(action_tp.equals("T")){

vendor_entry_str =     " update   ORBL_VENDOR_MST set VENDOR_STATUS = 'T' ,   "+
                               "    REMARKS = ?      ,  "+
                               "   TERMINATOR_NAME  = ?    ,  "+
                               "   TERMINATOR_CODE  = ?    ,  "+
                               "   UPD_BY    = ?  ,  "+
                               "   UPD_DT    = sysdate,   "+
                               "   TERMINATION_DATE    = sysdate   "+
                               "  where VENDOR_CODE = ?    "+
                               "";

 ps = null;
 rs = null;
 ps = mk.con.prepareStatement(vendor_entry_str);
 ps.setString(1, request.getParameter("trmn_rmrks"));
 ps.setString(2, usrEmpNm);
 ps.setString(3, usrEmpCd);
 ps.setString(4, userDtls);
 ps.setInt(5, vndr_ref_no);
 noOfRows = ps.executeUpdate();
 ps.close();


}else if(action_tp.equals("D")){

vendor_entry_str =     " update   ORBL_VENDOR_MST set VENDOR_STATUS = 'V' ,   "+
                               "   UPD_BY    = ?  ,  "+
                               "   UPD_DT    = sysdate   "+
                               "  where VENDOR_CODE = ( select VENDOR_CODE_PREV "+
                               "                        from ORBL_VENDOR_MST where VENDOR_CODE = ?)  "+
                               "   And VENDOR_STATUS = 'O'  "+
                               "";
 ps = null;
 rs = null;
 ps = mk.con.prepareStatement(vendor_entry_str);
 ps.setString(1, userDtls);
 ps.setInt(2, vndr_ref_no);
 noOfRows = ps.executeUpdate();
 ps.close();



vendor_entry_str =     " delete  from  ORBL_VENDOR_MST   "+
                               "  where VENDOR_CODE = ?    "+
                               "";
 //System.out.println("in Delete mode : "+vendor_entry_str);
 ps = null;
 rs = null;
 ps = mk.con.prepareStatement(vendor_entry_str);
 ps.setInt(1, vndr_ref_no);
 noOfRows = ps.executeUpdate();
 ps.close();
}

}

if(!action_tp.equals("T") && !action_tp.equals("J") && !action_tp.equals("D") && !action_tp.equals("SB") && !action_tp.equals("DU")){

 ps = null;
 rs = null;
 ps = mk.con.prepareStatement(vendor_entry_str);
 ps.setInt(1, vndr_ref_no);
 ps.setString(2, request.getParameter("vndr_name"));
 ps.setString(3, request.getParameter("vndr_addr1"));
 ps.setString(4, request.getParameter("vndr_addr2"));
 ps.setString(5, request.getParameter("vndr_addr3"));
 ps.setString(6, request.getParameter("vndr_addr4"));
 ps.setString(7, request.getParameter("vndr_cntct_persn"));
 ps.setString(8, request.getParameter("vndr_tel"));
 ps.setString(9, request.getParameter("vndr_fax"));
 ps.setString(10, request.getParameter("vndr_mbl"));
 ps.setString(11, request.getParameter("vndr_eml"));
 ps.setString(12, request.getParameter("vndr_wbst"));
 ps.setString(13, request.getParameter("vndr_wrkarea"));
 ps.setString(14, request.getParameter("vndr_wgliab"));
//System.out.println("  props_dept   *** :  "+request.getParameter("props_dept"));


if(action_tp.equals("I") ||  action_tp.equals("NAC") ){
 ps.setString(15, request.getParameter("props_dept"));
 ps.setString(16, genStn);
 ps.setString(17, usrEmpCd);
 ps.setString(18, usrEmpNm);
 ps.setTimestamp(19, new java.sql.Timestamp(System.currentTimeMillis()));
 ps.setString(20, "");
 ps.setString(21, "");
 ps.setTimestamp(22, null ); 
 ps.setString(23, "");
 ps.setString(24, "");
 ps.setTimestamp(25, null);
 ps.setString(26, "");
 ps.setTimestamp(27, null);
 ps.setString(28, "");
 ps.setTimestamp(29, null);
 ps.setString(30, "");
 ps.setTimestamp(31, null);
 ps.setString(32, "");
 ps.setTimestamp(33, null);
 ps.setString(34, "");
 ps.setTimestamp(35, null);
 ps.setString(36, "");
 ps.setTimestamp(37, null);
if(action_tp.equals("E")){
 ps.setString(38, "V");
}else{
 ps.setString(38, request.getParameter("termntn_sts_h"));
}
 ps.setString(39, userDtls);
 ps.setString(40, request.getParameter("vndr_addr5"));
if(action_tp.equals("NAC")){
ps.setInt(41,prev_vndr_ref_no );
}else if(entry_mode.equals("E")) {
ps.setString(41,"");
}
if(entry_mode.equals("U")){
 ps.setInt(41, vndr_ref_no);
} 


}else if(action_tp.equals("E")){

 ps.setString(15, "V");
 ps.setString(16, userDtls);
 ps.setString(17, request.getParameter("vndr_addr5"));
 ps.setInt(18, vndr_ref_no);

}else if(action_tp.equals("R")){

ps.setString(15, usrEmpCd);
 ps.setString(16, usrEmpNm);
 ps.setTimestamp(17, new java.sql.Timestamp(System.currentTimeMillis()));
 ps.setString(18, request.getParameter("termntn_sts_h"));
 ps.setString(19, usrEmpCd );
 ps.setString(20, request.getParameter("vndr_addr5") );
 ps.setInt(21, vndr_ref_no);


}else if(action_tp.equals("C")){

 ps.setString(15, request.getParameter("termntn_sts_h"));
 ps.setString(16, usrEmpCd );
 ps.setString(17, request.getParameter("vndr_addr5") );
 ps.setInt(18, vndr_ref_no);


}else if(action_tp.equals("A")){

ps.setString(15, usrEmpCd);
 ps.setString(16, usrEmpNm);
 ps.setTimestamp(17, new java.sql.Timestamp(System.currentTimeMillis()));
 ps.setString(18, "Y");
 ps.setTimestamp(19, new java.sql.Timestamp(System.currentTimeMillis()));
 ps.setString(20, "Y");
 ps.setTimestamp(21, new java.sql.Timestamp(System.currentTimeMillis()));
 ps.setString(22, "Y");
 ps.setTimestamp(23, new java.sql.Timestamp(System.currentTimeMillis()));
 ps.setString(24, "Y");
 ps.setTimestamp(25, new java.sql.Timestamp(System.currentTimeMillis()));
 ps.setString(26, "Y");
 ps.setTimestamp(27, new java.sql.Timestamp(System.currentTimeMillis()));
 ps.setString(28, "Y");
 ps.setTimestamp(29, new java.sql.Timestamp(System.currentTimeMillis()));
 ps.setString(30, request.getParameter("termntn_sts_h"));
 ps.setString(31, usrEmpCd );
 ps.setString(32, request.getParameter("vndr_addr5") );
 ps.setInt(33, vndr_ref_no);


}


 
System.out.println("  vendor_entry_str  "+vendor_entry_str); 
 noOfRows = ps.executeUpdate();
 ps.close();

}



String vendor_doc_entry_str ="";

if(request.getParameter("entry_mode_h").equals("E")){

        vendor_doc_entry_str =" INSERT INTO ORBL_VENDOR_DOC_DTL(VENDOR_CODE,  "+
                              "                                 DOC_TYPE_CODE, "+
                              "                                 DOC_FILENAME,   "+
                              "                                 DOC_FILEPATH,   "+
                              "                                 DOC_STATUS,      "+
                              "                                 DOC_NUMBER,       "+
                               "                                 CRT_BY,         "+
                              "                                  CRT_DT)          "+
                              "                      values( ? ,?, ? , ? ,? ,?,?,sysdate )                  "+
                               "";

}else if(request.getParameter("entry_mode_h").equals("U")){

vendor_doc_entry_str =" update  ORBL_VENDOR_DOC_DTL set  VENDOR_CODE= ? , "+
                              "                                 DOC_TYPE_CODE = ?, "+
                              "                                 DOC_FILENAME = ? ,   "+
                              "                                 DOC_FILEPATH = ? ,   "+
                              "                                 DOC_STATUS = ?,      "+
                              "                                 DOC_NUMBER = ?,       "+
                               "                                 UPD_BY = ? ,         "+
                               "                                  UPD_DT = sysdate          "+
                               "  where VENDOR_CODE = ?                                     "+
                               "  and DOC_TYPE_CODE = ?                                     "+
                               "";



}



StringTokenizer st_doc_tp = new StringTokenizer(request.getParameter("doc_type_h"), "|"); 
StringTokenizer st_doc_nm = new StringTokenizer(request.getParameter("doc_name_h"), "|"); 
StringTokenizer st_doc_no = new StringTokenizer(request.getParameter("doc_no_h"), "|"); 
StringTokenizer st_doc_sts = new StringTokenizer(request.getParameter("doc_sts_h"), "|"); 

//System.out.println(request.getParameter("doc_type_h"));
//System.out.println(request.getParameter("doc_name_h"));
//System.out.println(request.getParameter("doc_no_h"));
//System.out.println(request.getParameter("doc_sts_h"));

String doc_typ_tkn = "";

while(st_doc_nm.hasMoreTokens()) { 
 
doc_typ_tkn = st_doc_tp.nextToken().toString() ;
ps=null;
ps = mk.con.prepareStatement(vendor_doc_entry_str);
 //ps.setString(1, genStn);
 ps.setInt(1, vndr_ref_no);
 ps.setString(2, doc_typ_tkn);
 ps.setString(3, st_doc_nm.nextToken().toString());
 ps.setString(4, scnDocDir+vndr_ref_no);
 ps.setString(5, st_doc_sts.nextToken().toString());
 ps.setString(6, st_doc_no.nextToken().toString());
 ps.setString(7, usrEmpCd);
if(entry_mode.equals("U")){
 ps.setInt(8, vndr_ref_no);
 ps.setString(9, doc_typ_tkn);
}
 
 noOfRows = ps.executeUpdate();
ps.close();
} 


String after_entry_msg = "";

if(noOfRows > 0){

String tmp1 = "INSERTION  SUCCESSFUL  ";
String tmp2 = "";


if(entry_mode.equals("U") && !action_tp.equals("D") && !action_tp.equals("SB") && !action_tp.equals("DU")){
tmp1 = "UPDATION  SUCCESSFUL  ";
}else if(action_tp.equals("D")){
tmp1 = "DELETION  SUCCESSFUL  ";
}else if(action_tp.equals("SB")){
tmp1 = "SENT BACK  SUCCESSFUL  ";
}else if(action_tp.equals("DU")){
tmp1 = "DOCS SUCCESSFULLY UPLOADED  ";
}
if(action_tp.equals("I") && request.getParameter("termntn_sts_h").equals("R")){
tmp1 = "  SENT  FOR RECOMMENDATION ";
}else if(action_tp.equals("R") && request.getParameter("termntn_sts_h").equals("A") ){
tmp1 = "  SENT  FOR APPROVAL ";
}else if(action_tp.equals("A") && request.getParameter("termntn_sts_h").equals("V") ){
tmp1 = "   APPROVAL  ";
tmp2 = "  DONE ";
}


    %>

    <p align=center > <b> <font color="green" size=5px ><%= tmp1 %>   FOR VENDOR CODE   <u> <%= vndr_ref_no %> </u>  <%= tmp2  %>  </font></b> </p>

    <%
after_entry_msg = " <b> <font color=\"green\" size=5px >"+ tmp1 +"   FOR VENDOR CODE   <u> "+ vndr_ref_no +" </u> "+
  tmp2+" </font></b>   ";
    response.sendRedirect("after_vndr_entry.jsp?after_entry_msg="+after_entry_msg);
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
    
    
    
    //response.sendRedirect("vendorEntry.jsp?isDelDone=Y");
%>



    </body>
</html>

