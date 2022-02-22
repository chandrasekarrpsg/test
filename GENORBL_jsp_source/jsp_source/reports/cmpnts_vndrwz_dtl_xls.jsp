<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType= "application/vnd.ms-excel"  %>
<%  response.setHeader("Content-Disposition", "attachment; filename=component_dtl.xls");%>

<head>
<title>VENDORWISE COMPONENTS OF BILLS</title>

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

        String qry_str = new String();

        String cls      = new String();
        String whr_cls1 = new String();
        String whr_cls2 = new String();

        String job_desc1 = new String();
        String job_desc2 = new String();

        int    flag    = 0;
        int    srl     = 0;

        String ord_num = new String();
        String bill_id = new String();
        String bill_no = new String();
        String bill_dt = new String();
        String rlzd_dt = new String();
        String fin_dt  = new String();
        String mtrl    = new String();
        String lbr     = new String();
        String s_tax   = new String();
        String vat     = new String();
        String ovr_tm  = new String();
        String othr    = new String();
        String bill_amt= new String();
        String ord_desc= new String();
        String cert_by = new String();
        String urgnt_p = new String();

        PreparedStatement ps = null ;
        ResultSet rs         = null ;

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
        disp_basis = " COMPONENTS OF BILLS FOR "+vnd_nm+" RELEASED  BY "+genstn2+" ON THE BASIS OF BILL RELEASED DATE";
}else{
        disp_basis = " COMPONENTS OF BILLS FOR "+vnd_nm+" RELEASED  BY "+genstn2+" ON THE BASIS OF FINANCE RECEIVED DATE";
}

try{
%>

<br><br>

<div id="xls_spcl" style="overflow:scroll; height:500px; background:#DBF2DC;">

<table width="100%">
<tr>
    <td align=left   colspan="1"> <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
    <td align=center colspan="15"><font color="#400040" size="3"><b><%=disp_basis%></b></font></td>
</tr>
<tr >
<td align=center colspan="16" >
        <font color="#400040" size="3"><b>BETWEEN <%=frm_dt%> AND <%=to_dt%></b> </font>
</td>
</tr>
</table>

<table width="100%" style="border: 1px solid black"; class="rcrds">

     <tr bgcolor="#DBF2DC">
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Sl</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Order Number</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Order Description</b></font></td>
          <td align="center"  colspan="5" class= "rcrdsEle"><font size=2 color="#400040"><b>Bill Details</b></font></td>
          <td align="center"  colspan="8" class= "rcrdsEle"><font size=2 color="#400040"><b>Bill Components (in Rs.)</b></font></td>
     </tr>

     <tr bgcolor="#DBF2DC">
          <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Id</b></font></td>
          <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Number</b></font></td>
          <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Date</b></font></td>
          <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Released On</b></font></td>
          <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Released By</b></font></td>
          <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Finance Received On</b></font></td>

          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Material</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Labour</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Service Tax</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>VAT</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Over-time</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Others</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Total</b></font></td>
     </tr>

<%


        if(basis.equals("B")){
                 cls =  " B.BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
        }else{
                 cls =  " B.FINANCE_RECVD_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
        }

        if(!genstn.equals("99999") && !dept.equals("999")){
              whr_cls1 =  " WHERE  O.station = ? "
                        + " AND       O.dept    = ? "
                        + " AND " + cls
                        + " AND    O.order_id  = B.order_id "
                        + " AND    O.VENDOR_CODE = ?        "
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
                        + " AND    O.VENDOR_CODE = ?        "
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
                                        + " AND    O.VENDOR_CODE = ?        "
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
                                        + " AND    O.VENDOR_CODE = ?        "
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
                           + " AND    O.VENDOR_CODE = ?        "
                           + " AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+) ";

                  whr_cls2 = " WHERE   " +  cls
                           + " AND    V.VENDOR_CODE = ? "
                           + " AND    B.VENDOR      = V.VENDOR_CODE "
                           + " AND    B.CERT_BY     = A.EMP_CODE(+) ";

         }


job_desc1="replace(replace(replace(replace(replace(nvl(O.JOB_DESC,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')";
job_desc2="replace(replace(replace(replace(replace(nvl(B.DESCRIP,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')";


        qry_str = "SELECT DISTINCT "
                + "          NVL(TRIM(O.ORDER_NO),'NP')      ORD_NUM,                   "
                + "         'N-'||B.BILL_ID       ID,                                   "
                + "          to_char(B.BILL_NO)       NUM,                              "
                + "          TO_CHAR(B.BILL_DATE,'DD-MON-YYYY') DT,                     "
                + "          TO_CHAR(B.BILL_RELEASE_DATE,'DD-MON-YYYY') RLZ_DT,         "
                + "          NVL(TRIM(TO_CHAR(B.FINANCE_RECVD_DATE,'DD-MON-YYYY')),'NP') FIN_RCV,       "
                + "          NVL(B.MATERIAL,0) MTRL,              "
                + "          NVL(B.LABOUR,0)  LBR,                "
                + "          NVL(B.SERVICE_TAX,0) S_TAX,          "
                + "          NVL(B.VAT,0) VAT,                    "
                + "          NVL(B.OT,0) OVR_TM,                  "
                + "          NVL(B.OTHER_AMOUNT,0) OTHR,          "
                + "          NVL(B.BILL_AMOUNT,0) BILL_AMT,"
                + job_desc1 + " ORDR_DESC,"
                + "          trim(NVL(A.EMP_FNAME,' '))||' '||trim(NVL(A.EMP_LNAME,' '))  BILL_RLZD_BY,         "
                + "          DECODE(TRIM(B.URGENT_PAYMENT),'Y','Y','NP')  URGNT_PMNT    "
                + "FROM    ORBL_BILL_DTL   B,                                           "
                + "        ORBL_ORD_DTL    O,                                           "
                + "        ADM_EMP_MST     A                                            "
                + whr_cls1
                + "UNION                                                                "
                + "SELECT DISTINCT "
                + "       NVL(TRIM(B.ORDNO),'NP')       ORD_NUM,                               "
                + "      'S-'||B.BILLREF       ID,                                              "
                + "       to_char(B.BILL_NO)       NUM,                         "
                + "       TO_CHAR(B.BILL_DT,'DD-MON-YYYY') DT,                          "
                + "       TO_CHAR(B.BILL_RELEASE_DATE,'DD-MON-YYYY') RLZ_DT,            "
                + "       NVL(TRIM(TO_CHAR(B.FINANCE_RECVD_DATE,'DD-MON-YYYY')),'NP') FIN_RCV, "
                + "       0.00 MTRL,                              "
                + "       0.00 LBR,                               "
                + "       0.00 S_TAX,                             "
                + "       0.00 VAT,                               "
                + "       0.00 OVR_TM,                            "
                + "       0.00 OTHR,                              "
                + "       NVL(B.BILL_AMT,0.00) BILL_AMT,      "
                + job_desc2 + " ORDR_DESC,"
                + "       trim(NVL(A.EMP_FNAME,' '))||' '||trim(NVL(A.EMP_LNAME,' '))  BILL_RLZD_BY,    "
                + "       DECODE(TRIM(B.URGENT_PAYMENT),'Y','Y','NP')  URGNT_PMNT       "
                + "FROM    ORBL_SPBILL_DTL B,                                           "
                + "        ORBL_VENDOR_MST V,                                           "
                + "        ADM_EMP_MST     A                                            "
                + whr_cls2
                + "ORDER BY 1                                                    " ;


ps = mk.con.prepareStatement(qry_str);

System.out.println("RNKNG VNDRS QRY STRING DTL" + qry_str);

                 if(!genstn.equals("99999") && !dept.equals("999")){

System.out.println("RNKNG VNDRS DTL : In block 1 " );

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

System.out.println("RNKNG VNDRS DTL : In block 2 " );

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

System.out.println("RNKNG VNDRS DTL : In block 3a " );

                        String temp_dep = dept.substring(0,dept.indexOf("-"));
                        String dep_name = dept.substring(dept.indexOf("-")+1);

System.out.println("RNKNG VNDRS DTL : " + temp_dep + "--" + dep_name);


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

System.out.println("RNKNG VNDRS DTL : In block 3b " );

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

System.out.println("RNKNG VNDRS DTL : In block 4 " );

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
        mtrl    = rs.getString(7);
        lbr     = rs.getString(8);
        s_tax   = rs.getString(9);
        vat     = rs.getString(10);
        ovr_tm  = rs.getString(11);
        othr    = rs.getString(12);
        bill_amt= rs.getString(13);
        ord_desc= rs.getString(14);
        cert_by = rs.getString(15);
        urgnt_p = rs.getString(16);


                if(srl%2 == 0){
%>
<tr bgcolor="#DBF2DC" onMouseover="this.style.backgroundColor='#FFFF77'" onMouseout="this.style.backgroundColor=''">

         <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=srl%></font></td>

<%  if (!ord_num.equals("NP")){ %>
            <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_num%></font></td>
            <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_desc%></font></td>
<% } else { %>
            <td align="left" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
            <td align="left" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
<% 
   }

   if(urgnt_p.equals("Y")){ 
%>
         <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_id%><sup>*</sup></font></td>
<% } else{ %>
         <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_id%></font></td>
<% } %>
         <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_no%></font></td>
         <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_dt%></font></td>
         <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><%=rlzd_dt%></font></td>
         <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><%=cert_by%></font></td>

<%  if (!fin_dt.equals("NP")){ %>
         <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><%=fin_dt%></font></td>
<% } else { %>
         <td align="left" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
<% } %>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=mtrl%></font></td>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=lbr%></font></td>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=s_tax%></font></td>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=vat%></font></td>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=ovr_tm%></font></td>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=othr%></font></td>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_amt%></font></td>
</tr>

<% } else { %>

<tr bgcolor="#FFFFFF" onMouseover="this.style.backgroundColor='#FFFF77'" onMouseout="this.style.backgroundColor=''">

         <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=srl%></font></td>

<%  if (!ord_num.equals("NP")){ %>
            <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_num%></font></td>
            <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_desc%></font></td>
<% } else { %>
            <td align="left" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
            <td align="left" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
<% 
   }

   if(urgnt_p.equals("Y")){ 
%>
         <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_id%><sup>*</sup></font></td>
<% } else{ %>
         <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_id%></font></td>
<% } %>
         <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_no%></font></td>
         <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_dt%></font></td>
         <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><%=rlzd_dt%></font></td>
         <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><%=cert_by%></font></td>

<%  if (!fin_dt.equals("NP")){ %>
         <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><%=fin_dt%></font></td>
<% } else { %>
         <td align="left" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
<% } %>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=mtrl%></font></td>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=lbr%></font></td>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=s_tax%></font></td>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=vat%></font></td>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=ovr_tm%></font></td>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=othr%></font></td>
         <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_amt%></font></td>

</tr>

<%
               }
         }

         ps.close();
         rs.close();

%>

</table>
</div>

<%

}catch(Exception e1){
       e1.printStackTrace();
}finally{
   mk.con.close();
}

%>

</center>

</body>
</html>
