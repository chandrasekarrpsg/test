

<html>
<!-- #include file="mylib/adovbs.inc" -->
<!-- #include file="mylib/rowid.inc" -->



<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="VO.*" %>

<head>
<script src="js/vendor_rowid.js"></script>
<title></title>
</head>

<body>



<%
LoginBean loginBn = (LoginBean) request.getSession().getAttribute("LoginBean");

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    String curdate = new String() ;

    try {
        PreparedStatement ps = null ;
        ResultSet rs = null ;


 String ipAddress = request.getRemoteAddr(); 
String userDtls = "";
userDtls = ipAddress+":"+loginBn.getsEmpCd();
System.out.println("  userDtls :  "+userDtls);







String vndr_ref=request.getParameter("vndr_ref")== null?"":request.getParameter("vndr_ref");
String del=request.getParameter("del") == null?"":request.getParameter("del")  ;
String where_clause = "" ;
String entryMode = "";
if (vndr_ref.equals("")){
	//where_clause=" where rowid is null" ;
    entryMode = "freshEntry";
}else{
	//where_clause="where rowid='"+vndr_ref+"'";
	 entryMode = "updateExistingRecords"; 
}











/*
String sql="select * from ORBL_VENDOR_MST " + where_clause ;

String sql1="select max(vendor_ref) maxref from ORBL_VENDOR_MST" ;
 ps = mk.con.prepareStatement(sql1) ;
 rs = ps.executeQuery() ;

if(rs.next()){
ref=rs.getInt("maxref")+1 ;
}

rs.close();
ps.close();
*/



int ref=1 ;
String vendor_entry_str =  "";




if (del.equals("1")){
	
	ps = null;

vendor_entry_str = " delete from ORBL_VENDOR_MST where VENDOR_REF = ?";
ps = mk.con.prepareStatement(vendor_entry_str);
ps.setInt(1,Integer.parseInt(vndr_ref));
int dltdRows = ps.executeUpdate();
ps.close();

if(dltdRows > 0){
%>

<%
 response.sendRedirect("vendor_add_new_vendor.jsp?isDelDone=Y");
}else{
%>

<%
 response.sendRedirect("vendor_add_new_vendor.jsp?isDelDone=N");
}



	/*
	'rs.delete



	'Response.Redirect("vendor_entry.asp")
	'Response.Redirect("vendor_entry.asp?rowid="&rowid)

'Response.write("J1")

*/


}












if (entryMode.equals("freshEntry")){
ps = null ;
rs = null ;
ps = mk.con.prepareStatement(" select genorbl_vndr_entr.dfn_get_vendor_ref() from dual");
rs = ps.executeQuery();

if(rs.next()){
ref = rs.getInt(1);
}

rs.close();
ps.close();

 vendor_entry_str = " insert  into ORBL_VENDOR_MST(VENDOR_REF ,   "+
                          "                              V_NAME      ,  "+
                          "                              ADDRESS     ,  "+
						  "                              TEL     ,  "+
						  "                              FAX     ,  "+
						  "                              EMAIL     ,  "+
						  "                              SPECLSN     ,  "+
						  "                              RETN_PCT     ,  "+
						  "                              INT_EXT     ,  "+
						  "                              HS     ,  "+
						  "                              SK     ,  "+
						  "                              SS     ,  "+
						  "                              US     ,  "+
						  "                              SPCL     ,  "+
						  "                              CELL_NO     ,  "+
						  "                              PROP_DEPT     ,  "+
						  "                              PROP_CODE     ,  "+
						  "                              PROP_NAME     ,  "+
						  "                              APPR_CODE     ,  "+
						  "                              APPR_NAME     ,  "+
						  "                              APPR_REMK     ,  "+
						  "                              STATUS     ,  "+
						  "                              ELECTRICAL     ,  "+
						  "                              ELECTRONICS     ,  "+
						  "                              MECHANICAL     ,  "+
						  "                              LAB_SUPPLY     ,  "+
						  "                              GEN_ORD_SUP     ,  "+
						  "                              OTHERS     ,  "+
						  "                              INSTRUMEN     ,  "+
						  "                              termination_stat     ,  "+
						  "                              termination_remark     ,  "+
						  "                              CRT_BY     ,  "+
						  "                              CRT_DT     ) "+
						  "                              values( ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      ? ,       "+
						  "                                      '"+userDtls+"' ,       "+
						  "                                      SYSDATE )       "+
                          "";





}else if(entryMode.equals("updateExistingRecords")){
ref = Integer.parseInt(vndr_ref);



 vendor_entry_str = " update    ORBL_VENDOR_MST  set      V_NAME  = ?    ,  "+
                          "                              ADDRESS=?     ,  "+
						  "                              TEL =?    ,  "+
						  "                              FAX  =?   ,  "+
						  "                              EMAIL  =?   ,  "+
						  "                              SPECLSN  =?   ,  "+
						  "                              RETN_PCT =?    ,  "+
						  "                              INT_EXT  =?    ,  "+
						  "                              HS  = ?   ,  "+
						  "                              SK  = ?   ,  "+
						  "                              SS  = ?   ,  "+
						  "                              US  = ?   ,  "+
						  "                              SPCL  = ?   ,  "+
						  "                              CELL_NO = ?    ,  "+
						  "                              PROP_DEPT  =?    ,  "+
						  "                              PROP_CODE  = ?    ,  "+
						  "                              PROP_NAME  = ?    ,  "+
						  "                              APPR_CODE  = ?   ,  "+
						  "                              APPR_NAME  = ?   ,  "+
						  "                              APPR_REMK  =?    ,  "+
						  "                              STATUS    = ?  ,  "+
						  "                              ELECTRICAL  = ?   ,  "+
						  "                              ELECTRONICS  = ?    ,  "+
						  "                              MECHANICAL  = ?   ,  "+
						  "                              LAB_SUPPLY   = ?  ,  "+
						  "                              GEN_ORD_SUP   = ?  ,  "+
						  "                              OTHERS    = ? ,  "+
						  "                              INSTRUMEN  = ?   ,  "+
						  "                              termination_stat  = ?    ,  "+
						  "                              termination_remark  = ?   ,  "+
						  "                              UPD_BY  = '"+userDtls+"'   ,  "+
						  "                              UPD_DT = sysdate    "+
						  "          where  VENDOR_REF = ?  "+
                          "";


}


rs = null;
ps = null;





ps = mk.con.prepareStatement(vendor_entry_str);
int startIndex = 0;
if (entryMode.equals("freshEntry")){
ps.setInt(1,ref);
startIndex = 1;
}else{
ps.setInt(31,ref);
startIndex = 0;
}


ps.setString(startIndex+1,request.getParameter("name")  );
ps.setString(startIndex+2,request.getParameter("address")  );
ps.setString(startIndex+3,request.getParameter("tel")  );
ps.setString(startIndex+4,request.getParameter("fax")  );
ps.setString(startIndex+5,request.getParameter("email")  );
ps.setString(startIndex+6,request.getParameter("speclsn")  );
ps.setString(startIndex+7,request.getParameter("retn_pct")  );
ps.setString(startIndex+8,request.getParameter("int_ext")  );
ps.setString(startIndex+9,request.getParameter("hs")  );
ps.setString(startIndex+10,request.getParameter("sk")  );
ps.setString(startIndex+11,request.getParameter("ss")  );
ps.setString(startIndex+12,request.getParameter("us")  );
ps.setString(startIndex+13,request.getParameter("spcl")  );
ps.setString(startIndex+14,request.getParameter("cell_no")  );
ps.setString(startIndex+15,request.getParameter("prop_dept")  );
ps.setString(startIndex+16,request.getParameter("prop_code")  );
ps.setString(startIndex+17,request.getParameter("prop_name")  );
ps.setString(startIndex+18,request.getParameter("appr_code")  );
ps.setString(startIndex+19,request.getParameter("appr_name")  );
ps.setString(startIndex+20,request.getParameter("appr_remk")  );
ps.setString(startIndex+21,request.getParameter("status")  );
ps.setString(startIndex+22,request.getParameter("electrical")  );
ps.setString(startIndex+23,request.getParameter("electronics")  );
ps.setString(startIndex+24,request.getParameter("mechanical")  );
ps.setString(startIndex+25,request.getParameter("lab_supply")  );
ps.setString(startIndex+26,request.getParameter("gen_ord_sup")  );
ps.setString(startIndex+27,request.getParameter("others")  );
ps.setString(startIndex+28,request.getParameter("instrumen")  );
ps.setString(startIndex+29,request.getParameter("termination_stat")  );
ps.setString(startIndex+30,request.getParameter("termination_remark")  );




int k = ps.executeUpdate();


ps.close();


//Response.Redirect("vendor_entry.asp?rowid="&rd)

  response.sendRedirect("vendor_add_new_vendor.jsp?vndr_ref="+ref+"&ap=edt");



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

