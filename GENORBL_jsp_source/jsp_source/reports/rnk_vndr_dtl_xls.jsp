<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java"   %>
<%@ page contentType= "application/vnd.ms-excel"  %>
<%  response.setHeader("Content-Disposition", "attachment; filename=dd.xls");%>

<head>
<!--meta http-equiv="Content-Type" content="application/vnd.ms-excel; charset=ISO-8859-1"-->

<title>RANKING OF VENDORS</title>

<style>
table.rcrds
{
border-collapse:collapse;
}

table.rcrds,th, td.rcrdsEle
{
border: 1px solid black;
}

</style>

</head>

<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>

<%
String sLoginEmpCd = loginBean.getsEmpCd();
String sGenstnCd   = loginBean.getsGenStn();
String genstn = request.getParameter("gstn");
String dept   = request.getParameter("dept");
String frm_dt = request.getParameter("frm_dt");
String to_dt  = request.getParameter("to_dt");
String basis  = request.getParameter("basis");
String vnd_id = request.getParameter("vnd_id");
String vnd_nm = request.getParameter("vnd_nm");

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();

%>
<body>
<center>

<%

SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
String DisplayDate= formatdate.format(new java.util.Date());

String genstn2 = new String();
String dept2   = new String();
String disp_basis =  new String();

try{

	ResultSet rs51=null;
	PreparedStatement ps51=null;

        ps51 = mk.con.prepareStatement(" SELECT DISTINCT "
             + " DECODE(?,'99999','ALL',(select distinct station_sht_desc from CD_STATION where orbl_station_cd = ?)) GS, "
             + " DECODE(?,'999','ALL', DECODE(?,'99999',substr(?,instr(?,'-')+1), "
             + "                        (select distinct order_dept from ORBL_CD_DEPT where  DEPT = ? AND STATION = ?))) DEP "
             + " FROM  CD_STATION c, "
             + "       ORBL_CD_DEPT d "
             + " WHERE  d.station = c.orbl_station_cd ",ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );


        ps51.setString(1,genstn);
        ps51.setString(2,genstn);
        ps51.setString(3,dept);
        ps51.setString(4,genstn);
        ps51.setString(5,dept);
        ps51.setString(6,dept);
        ps51.setString(7,dept);
        ps51.setString(8,genstn);



	rs51=ps51.executeQuery();

	while(rs51.next()){
	      genstn2 = rs51.getString(1) ;
	      dept2   = rs51.getString(2) ;
	}

	rs51.close() ;
	ps51.close() ;

}catch(Exception e){
       e.printStackTrace();
}

if(basis.equals("B")){
	disp_basis = " BILL RELEASED FOR "+vnd_nm+"  BY "+genstn2+" ON THE BASIS OF BILL RELEASED DATE";
}else{
	disp_basis = " BILL RELEASED FOR "+vnd_nm+"  BY "+genstn2+" ON THE BASIS OF FINANCE RECEIVED DATE";
}
%>

<div id="xls_spcl" style="overflow:scroll; height:450px; background:#DBF2DC;">

<table width="97%">
<tr>
    <td align=left >  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
    <td align=center colspan="8"> <font color="#400040" size="3"><b><%=disp_basis%></b></font></td>
</tr>
<tr > 
<td align=center colspan="9" >
	<font color="#400040" size="3"><b>BETWEEN <%=frm_dt%> AND <%=to_dt%></b> </font>
</td>
</tr>
</table>

<table width="97%" style="border: 1px solid black"; class="rcrds">

     <tr bgcolor="#DBF2DC">
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Sl</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Order Number</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Order Desc</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Dept</b></font></td>
          <td align="center"  colspan="7" class= "rcrdsEle"><font size=2 color="#400040"><b>Bill Details</b></font></td>
     </tr>

     <tr bgcolor="#DBF2DC">
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Id</b></font></td>
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Number</b></font></td>
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Date</b></font></td>
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Released On</b></font></td>
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Released By</b></font></td>
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Finance Received On</b></font></td>
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Amount (In Rs.)</b></font></td>
    </tr>

<%

try{

        String qry_str   = new String();
        String cls       = new String();
        String whr_cls1  = new String();
        String whr_cls2  = new String();

        String  job_desc1 = new String();
        String  job_desc2 = new String();

        int    srl =  0;

        String ord_num = new String();
        String bill_id = new String();
        String bill_no = new String();
        String bill_dt = new String();
        String rlzd_dt = new String();
        String fin_dt  = new String();
        Double bill_amt= 0.00;
        String ord_desc= new String();
        String cert_by = new String();
        String urgnt_p = new String();

        PreparedStatement ps = null ;
        ResultSet rs         = null ;

        if(basis.equals("B")){
                 cls =  "  B.BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
        }else{
                 cls =  "  B.FINANCE_RECVD_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
            }

                 if(!genstn.equals("99999") && !dept.equals("999")){
                   whr_cls1 =  " WHERE  O.station = ? "
                        + " AND       O.dept    = ? "
                        + " AND " + cls
                        + " AND    O.order_id  = B.order_id "
                        + " AND    V.VENDOR_CODE = ?        "
                        + " AND    O.vendor_code = V.vendor_code "
                        + " AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+) ";

                  whr_cls2 =  " WHERE  B.station =  ? "
                        + " AND    B.dept    =  ? "
                        + "AND " + cls
                        + " AND    V.VENDOR_CODE = ? "
                        + " AND    B.VENDOR      = V.VENDOR_CODE "
                        + " AND    B.CERT_BY     = A.EMP_CODE(+) ";

                 }else if(!genstn.equals("99999") && dept.equals("999")){
                   whr_cls1 =  " WHERE  O.station = ? "
                        + "AND " + cls
                        + " AND    O.order_id  = B.order_id "
                        + " AND    V.VENDOR_CODE = ?        "
                        + " AND    O.vendor_code = V.vendor_code "
                        + " AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+) ";

                  whr_cls2 =  " WHERE  B.station =  ? "
                        +  "AND " + cls
                        + " AND    V.VENDOR_CODE = ? "
                        + " AND    B.VENDOR      = V.VENDOR_CODE "
                        + " AND    B.CERT_BY     = A.EMP_CODE(+) ";

                 }else if(genstn.equals("99999") && !dept.equals("999")){

                          if(!sGenstnCd.equals("019")){
                               whr_cls1 = ",ORBL_CD_DEPT D "
                                        + " WHERE  O.dept    = ? "
                                        + " AND D.ORDER_DEPT = ? "
                                        + " AND O.DEPT = D.DEPT "
                                        + " AND O.STATION = D.STATION "
                                        + " AND O.STATION = B.STATION "
                                        + "AND " + cls
                                        + " AND    O.order_id  = B.order_id "
                                        + " AND    V.VENDOR_CODE = ?        "
                                        + " AND    O.vendor_code = V.vendor_code "
                                        + " AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+) ";

                               whr_cls2 = ",ORBL_CD_DEPT   D                             "
                                        + "WHERE  B.DEPT    = ?                          "
                                        + "AND    D.ORDER_DEPT = ?                       "
                                        + "AND    B.DEPT = D.DEPT                        "
                                        + "AND    B.STATION = D.STATION                  "
                                        + "AND " + cls
                                        + " AND    V.VENDOR_CODE = ? "
                                        + " AND     B.VENDOR      = V.VENDOR_CODE "
                                        + " AND    B.CERT_BY     = A.EMP_CODE(+) ";
                          }else{
                               whr_cls1 = " WHERE O.dept    = ? "
                                        + " AND " + cls
                                        + " AND    O.order_id  = B.order_id "
                                        + " AND    V.VENDOR_CODE = ?        "
                                        + " AND    O.vendor_code = V.vendor_code "
                                        + " AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+) ";

                               whr_cls2 = " WHERE  B.dept    =  ? "
                                        + " AND " + cls
                                        + " AND    V.VENDOR_CODE = ? "
                                        + " AND    B.VENDOR      = V.VENDOR_CODE "
                                        + " AND    B.CERT_BY     = A.EMP_CODE(+) ";
                        }
                 }else{
                               whr_cls1 = " WHERE  " + cls
                                        + " AND    O.order_id  = B.order_id "
                                        + " AND    V.VENDOR_CODE = ?        "
                                        + " AND    O.vendor_code = V.vendor_code "
                                        + " AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+) ";

                               whr_cls2 = " WHERE   " +  cls
                                        + " AND    V.VENDOR_CODE = ? "
                                        + " AND    B.VENDOR      = V.VENDOR_CODE "
                                        + " AND    B.CERT_BY     = A.EMP_CODE(+) ";

                 }

job_desc1="replace(replace(replace(replace(replace(nvl(O.JOB_DESC,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')"
;
job_desc2="replace(replace(replace(replace(replace(nvl(B.DESCRIP,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')";

                qry_str = " SELECT  "
                        + " NVL(O.ORDER_NO,'NP')      ORD_NUM, "
                        + " 'N-'||B.BILL_ID       ID,"
                        + " to_char(B.BILL_NO)       NUM, "
                        + " TO_CHAR(B.BILL_DATE,'DD-MON-YYYY') DT,"
                        + " TO_CHAR(B.BILL_RELEASE_DATE,'DD-MON-YYYY') RLZ_DT,"
                        + " NVL(TRIM(TO_CHAR(B.FINANCE_RECVD_DATE,'DD-MON-YYYY')),'NP') FIN_RCV,"
                        + " NVL(B.BILL_AMOUNT,0.00)  BILL_AMT,"
                        +  job_desc1 + "  ORDR_DESC,"
                        + " trim(A.EMP_FNAME)||' '||trim(A.EMP_LNAME)  BILL_RLZD_BY, "
                        + " DECODE(B.URGENT_PAYMENT,'Y','Y','NP')  URGNT_PMNT "
                        + " FROM   ORBL_BILL_DTL   B,"
                        + "        ORBL_ORD_DTL    O,"
                        + "        ORBL_VENDOR_MST V,"
                        + "        ADM_EMP_MST     A "
                        +  whr_cls1
                        + " UNION "
                        + " SELECT "
                        + " NVL(B.ORDNO,'NP')      ORD_NUM,"
                        + " 'S-'||B.BILLREF       ID,"
                        + " to_char(B.BILL_NO)       NUM,"
                        + " TO_CHAR(B.BILL_DT,'DD-MON-YYYY') DT,"
                        + " TO_CHAR(B.BILL_RELEASE_DATE,'DD-MON-YYYY') RLZ_DT,"
                        + " NVL(TRIM(TO_CHAR(B.FINANCE_RECVD_DATE,'DD-MON-YYYY')),'NP') FIN_RCV,"
                        + " NVL(B.BILL_AMT,0.00)  BILL_AMT,"
                        + job_desc2 + "  ORDR_DESC,"
                        + " trim(A.EMP_FNAME)||' '||trim(A.EMP_LNAME)  BILL_RLZD_BY,"
                        + " DECODE(B.URGENT_PAYMENT,'Y','Y','NP')  URGNT_PMNT "
                        + " FROM   ORBL_SPBILL_DTL B,"
                        + "        ORBL_VENDOR_MST V,"
                        + "        ADM_EMP_MST     A "
                        + whr_cls2
                        + " ORDER BY 1 " ;

        ps = mk.con.prepareStatement(qry_str);

//System.out.println("RNKNG VNDRS QRY STRING DTL" + qry_str);

                 if(!genstn.equals("99999") && !dept.equals("999")){
                                ps.setString(1,genstn);
                                ps.setString(2,dept);
                                ps.setString(3,frm_dt);
                                ps.setString(4,to_dt);
                                ps.setString(5,vnd_id);

                                ps.setString(6,genstn);
                                ps.setString(7,dept);
                                ps.setString(8,frm_dt);
                                ps.setString(9,to_dt);
                                ps.setString(10,vnd_id);

                 }else if(!genstn.equals("99999") && dept.equals("999")){
                                ps.setString(1,genstn);
                                ps.setString(2,frm_dt);
                                ps.setString(3,to_dt);
                                ps.setString(4,vnd_id);

                                ps.setString(5,genstn);
                                ps.setString(6,frm_dt);
                                ps.setString(7,to_dt);
                                ps.setString(8,vnd_id);

                 }else if(genstn.equals("99999") && !dept.equals("999")){

                       if(!sGenstnCd.equals("019")){

                        String temp_dep = dept.substring(0,dept.indexOf("-"));
                        String dep_name = dept.substring(dept.indexOf("-")+1);


                        ps.setString(1,temp_dep);
                        ps.setString(2,dep_name);
                        ps.setString(3,frm_dt);
                        ps.setString(4,to_dt);
                        ps.setString(5,vnd_id);

                        ps.setString(6,temp_dep);
                        ps.setString(7,dep_name);
                        ps.setString(8,frm_dt);
                        ps.setString(9,to_dt);
                        ps.setString(10,vnd_id);

                      }else{

                        ps.setString(1,dept);
                        ps.setString(2,frm_dt);
                        ps.setString(3,to_dt);
                        ps.setString(4,vnd_id);

                        ps.setString(5,dept);
                        ps.setString(6,frm_dt);
                        ps.setString(7,to_dt);
                        ps.setString(8,vnd_id);

                     }

                 }else{
                        ps.setString(1,frm_dt);
                        ps.setString(2,to_dt);
                        ps.setString(3,vnd_id);

                        ps.setString(4,frm_dt);
                        ps.setString(5,to_dt);
                        ps.setString(6,vnd_id);
                 }


		rs = ps.executeQuery() ;	

		while(rs.next()){

		srl++ ;
		ord_num = rs.getString(1);
		bill_id = rs.getString(2);
		bill_no = rs.getString(3);
		bill_dt = rs.getString(4);
		rlzd_dt = rs.getString(5);
		fin_dt  = rs.getString(6);
		bill_amt= rs.getDouble(7);
		ord_desc= rs.getString(8);
		cert_by = rs.getString(9);
		urgnt_p = rs.getString(10);

                if(srl%2 == 0){
%>
<tr bgcolor="#DBF2DC">

         <td align="center" class= "rcrdsEle" ><font size=2 color="#400040"><%=srl%></font></td>

<%  if (!ord_num.equals("NP")){ %>
            <td align="left"   class= "rcrdsEle" ><font size=2 color="#400040"><%=ord_num%></font></td>
            <td align="left"   class= "rcrdsEle" ><font size=2 color="#400040"><%=ord_desc%></font></td>
<% } else { %>
            <td align="center" class= "rcrdsEle" ><font size=2 color="#400040">&nbsp;</font></td>
            <td align="center" class= "rcrdsEle" ><font size=2 color="#400040">&nbsp;</font></td>
<% } %>

         <td align="center" class= "rcrdsEle" ><font size=2 color="#400040"><%=dept2%></font></td>
         <td align="center" class= "rcrdsEle" ><font size=2 color="#400040"><%=bill_id%></font></td>

<% if(urgnt_p.equals("Y")){ %>
         <td align="left"   class= "rcrdsEle" ><font size=2 color="#400040"><%=bill_no%><sup>*</sup></font></td>
<% } else{ %>
         <td align="left"   class= "rcrdsEle" ><font size=2 color="#400040"><%=bill_no%></font></td>
<% } %>
         <td align="left" class= "rcrdsEle" ><font size=2 color="#400040"><%=bill_dt%></font></td>
         <td align="left" class= "rcrdsEle" ><font size=2 color="#400040"><%=rlzd_dt%></font></td>
	 <td align="center" class= "rcrdsEle" ><font size=2 color="#400040"><%=cert_by%></font></td>

<%  if (!fin_dt.equals("NP")){ %>
         <td align="left" class= "rcrdsEle" ><font size=2 color="#400040"><%=fin_dt%></font></td>
<% } else { %>
         <td align="left" class= "rcrdsEle" ><font size=2 color="#400040">&nbsp;</font></td>
<% } %>
         <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><%=bill_amt%></font></td>
</tr>

<% } else { %>

<tr bgcolor="#FFFFFF">

         <td align="center" class= "rcrdsEle" ><font size=2 color="#400040"><%=srl%></font></td>

<%  if (!ord_num.equals("NP")){ %>
            <td align="left"   class= "rcrdsEle" ><font size=2 color="#400040"><%=ord_num%></font></td>
            <td align="left"   class= "rcrdsEle" ><font size=2 color="#400040"><%=ord_desc%></font></td>
<% } else { %>
         <td align="center" class= "rcrdsEle" ><font size=2 color="#400040">&nbsp;</font></td>
         <td align="center" class= "rcrdsEle" ><font size=2 color="#400040">&nbsp;</font></td>
<% } %>

         <td align="center" class= "rcrdsEle" ><font size=2 color="#400040"><%=dept2%></font></td>
         <td align="center" class= "rcrdsEle" ><font size=2 color="#400040"><%=bill_id%></font></td>

<% if(urgnt_p.equals("Y")){ %>
         <td align="left"   class= "rcrdsEle" ><font size=2 color="#400040"><%=bill_no%><sup>*</sup></font></td>
<% } else{ %>
         <td align="left"   class= "rcrdsEle" ><font size=2 color="#400040"><%=bill_no%></font></td>
<% } %>
         <td align="left" class= "rcrdsEle" ><font size=2 color="#400040"><%=bill_dt%></font></td>
         <td align="left" class= "rcrdsEle" ><font size=2 color="#400040"><%=rlzd_dt%></font></td>
	 <td align="center" class= "rcrdsEle" ><font size=2 color="#400040"><%=cert_by%></font></td>

<%  if (!fin_dt.equals("NP")){ %>
         <td align="left" class= "rcrdsEle" ><font size=2 color="#400040"><%=fin_dt%></font></td>
<% } else { %>
         <td align="left" class= "rcrdsEle" ><font size=2 color="#400040">&nbsp;</font></td>
<% } %>
         <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><%=bill_amt%></font></td>

</tr>

<%

               }
         }
         ps.close();
         rs.close();


  }catch(Exception e1){
            e1.printStackTrace();
}finally{
	mk.con.close();
}

%>
</tbody>
</table>
</div>

</center>

</body>

</html>
