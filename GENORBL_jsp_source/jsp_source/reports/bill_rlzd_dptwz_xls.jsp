<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType= "application/vnd.ms-excel"  %>
<%  response.setHeader("Content-Disposition", "attachment; filename=dd.xls");%>

<head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">

<title>DEPARTMENT-WISE BILL RELEASED</title>

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
String sStnshrtNm  = loginBean.getsLoginStnShrtNm();
String sStnNm      = loginBean.getsGenStnNm();
String sGenstnCd   = loginBean.getsGenStn();

String st_dt1    = request.getParameter("hst_dt_f2");
String end_dt1   = request.getParameter("hend_dt_f2");
String dept1     = request.getParameter("hdept_f2");
String genstn    = request.getParameter("hgen_f2");
String basis     = request.getParameter("hbasis_f2");

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();

%>

<body>

<center>


<%

System.out.println("MRITYUNJOY 4 "+sGenstnCd);


if(st_dt1!= null && end_dt1!= null && dept1 != null){

        System.out.println("1. DEB CHAK New Rep:GS "+genstn);
        System.out.println("1. DEB CHAK New Rep:Dept "+dept1);

        String qry_str1 = new String();

        String cls      = new String();
        String whr_cls1 = new String();
        String whr_cls2 = new String();

        String job_desc1 = new String();
        String job_desc2 = new String();

        int    flag    = 0;
        int    srl_num = 0;

        String stn_nm  = new String();
	String ord_num = new String();
	String bill_id = new String();
	String bill_no = new String();
	String bill_dt = new String();
	String rlzd_dt = new String();
	String fin_dt  = new String();
	String vnd_nm  = new String();
	Double bill_amt= 0.00;
	String ord_desc= new String();
	String cert_by = new String();
	String urgnt_p = new String();
	String budget_head = new String();
	String erp_code    = new String();

        PreparedStatement ps1 = null ;
        ResultSet rs1         = null ;

        String genstn2 = new String();
        String dept2   = new String();

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
       ps51.setString(3,dept1);
       ps51.setString(4,genstn);
       ps51.setString(5,dept1);
       ps51.setString(6,dept1);
       ps51.setString(7,dept1);
       ps51.setString(8,genstn);

       rs51=ps51.executeQuery();


       while(rs51.next()){
             genstn2 = rs51.getString(1) ;
             dept2   = rs51.getString(2) ;
       }

       rs51.close() ;
       ps51.close() ;

%>
<br>
<br>

<center>

<%

SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
String DisplayDate= formatdate.format(new java.util.Date());
String disp_basis = new String();

if(basis.equals("B")){
        disp_basis = " BILLS RELEASED ON THE BASIS OF BILL RELEASED DATE";
}else{
        disp_basis = " BILLS RELEASED ON THE BASIS OF FINANCE RECEIVED DATE";
}

%>
<table width="100%" >
<tr >
<td align=left >  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
<td align=center colspan=11> <font color="#400040" size="3"><b><%=disp_basis%></b></font></td>
</tr>

<tr >
<td align=center colspan="12" >
        <font color="#400040" size="3"><b>BETWEEN <%=st_dt1%> AND <%=end_dt1%></b> </font>
</td>
</tr>
</table>
     <table  border="1" width="100%" class= "rcrds" >

     <tr bgcolor="#DBF2DC">
          <td colspan="12" align="center" class= "rcrdsEle" >
            <font color="#400040" size="2">

<% if(!sGenstnCd.equals("019")){ %>
                <b>GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : <%=dept2%></b>
<% } else{ %>
                <b>GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : CTM</b>
<% } %>

            </font>
          </td>
     </tr>

      <tr bgcolor="#DBF2DC">
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Sl</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Station</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Order Number</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Order Description</b></font></td>
          <td align="center"  colspan="6" class= "rcrdsEle"><font size=2 color="#400040"><b>Bill Details</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Budget Head</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>ERP Code</b></font></td>
     	  <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Vendor</b></font></td>
     	  <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Amount (In Rs.)</b></font></td>
     </tr>

     <tr bgcolor="#DBF2DC">
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Id</b></font></td>
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Number</b></font></td>
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Date</b></font></td>
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Released On</b></font></td>
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Bill Released By</b></font></td>
	  <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Finance Received On</b></font></td>
    </tr>



<%
        System.out.println("3.DEB CHAK  New Rep:GS "+genstn);
        System.out.println("3.DEB CHAK  New Rep:Dept "+dept1);

        if(basis.equals("B")){
                        cls =  "B.BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
                }else{
                        cls =  "B.FINANCE_RECVD_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
                }

        if(!genstn.equals("99999") && !dept1.equals("999")){

            whr_cls1= "WHERE  O.station = ?                         "
                    + "AND    O.dept    = ?                         "
                    + "AND " + cls
                    + "AND    O.order_id  = B.order_id              "
                    + "AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+)   ";

            whr_cls2="WHERE   B.station = ?                                 "
                    + "AND    B.dept    = ?                         "
                    + "AND " + cls
                    + "AND    B.VENDOR      = V.VENDOR_CODE         "
                    + "AND    B.CERT_BY     = A.EMP_CODE(+)         ";

        }else if(!genstn.equals("99999") && dept1.equals("999")){

            whr_cls1= "WHERE  O.station = ?                         "
                    + "AND " + cls
                    + "AND    O.order_id  = B.order_id              "
                    + "AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+)   ";

            whr_cls2="WHERE   B.station = ?                                 "
                    +"AND " +  cls
                    +"AND    B.VENDOR      = V.VENDOR_CODE          "
                    +"AND    B.CERT_BY     = A.EMP_CODE(+)          ";

        }else if(genstn.equals("99999") && !dept1.equals("999")){

           if(!sGenstnCd.equals("019")){

           whr_cls1= ",ORBL_CD_DEPT   D                             "
                    +"WHERE  O.dept    = ?                          "
                    +"AND    D.ORDER_DEPT = ?                       "
                    +"AND    O.DEPT = D.DEPT                        "
                    +"AND    O.STATION = D.STATION                  "
                    +"AND    O.STATION = B.STATION                  "
                    +"AND " + cls
                    +"AND    O.order_id  = B.order_id               "
                    +"AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+)   ";

           whr_cls2= ",ORBL_CD_DEPT   D                             "
                    +"WHERE  B.DEPT    = ?                          "
                    +"AND    D.ORDER_DEPT = ?                       "
                    +"AND    B.DEPT = D.DEPT                        "
                    +"AND    B.STATION = D.STATION                  "
                    +"AND " +  cls
                    +"AND    B.VENDOR      = V.VENDOR_CODE          "
                    +"AND    B.CERT_BY     = A.EMP_CODE(+)          ";

          }else{

           whr_cls1 ="WHERE  O.dept    = ?                         "
                    +"AND " + cls
                    +"AND    O.order_id  = B.order_id               "
                    +"AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+)    ";

           whr_cls2 ="WHERE  B.DEPT    = ?                          "
                    +"AND " +  cls
                    +"AND    B.VENDOR      = V.VENDOR_CODE          "
                    +"AND    B.CERT_BY     = A.EMP_CODE(+)          ";
          }


        }else{

            whr_cls1= "WHERE "  +  cls
                    + "AND    O.order_id  = B.order_id              "
                    + "AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+)   ";

            whr_cls2= "WHERE "  +  cls
                    + "AND    B.VENDOR      = V.VENDOR_CODE         "
                    + "AND    B.CERT_BY     = A.EMP_CODE(+)         ";

        }
job_desc1="replace(replace(replace(replace(replace(nvl(O.JOB_DESC,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')";
job_desc2="replace(replace(replace(replace(replace(nvl(B.DESCRIP,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')";

        qry_str1= "SELECT DISTINCT "
                + "DECODE(O.ORD_ORGN_STN,'002','SGS','013','NCGS','014','TGS','016','BBGS','019','CTM','042','ED(GE)') STN, "
                + "          NVL(O.ORDER_NO,'NP')      ORD_NUM,                         "
                + "         'N-'||B.BILL_ID       ID,                                   "
                + "          to_char(B.BILL_NO)       NUM,                              "
                + "          TO_CHAR(B.BILL_DATE,'DD-MON-YYYY') DT,                     "
                + "          TO_CHAR(B.BILL_RELEASE_DATE,'DD-MON-YYYY') RLZ_DT,         "
                + "          NVL(TRIM(TO_CHAR(B.FINANCE_RECVD_DATE,'DD-MON-YYYY')),'NP') FIN_RCV, "
                + "          O.VENDOR_NAME VND_NM,                                      "
                + "          NVL(B.BILL_AMOUNT,0.00)  BILL_AMT,                         "
                + job_desc1 + " ORDR_DESC,        "
                + "          trim(NVL(A.EMP_FNAME,' '))||' '||trim(NVL(A.EMP_LNAME,' '))  BILL_RLZD_BY,         "
                + "          DECODE(TRIM(B.URGENT_PAYMENT),'Y','Y','NP')  URGNT_PMNT,   "
                + "          O.budget_head budget_head,                                      "
                + "          '*   ' ||O.erp_code|| '   *'    erp_code                                          "
                + "FROM    ORBL_BILL_DTL   B,                                           "
                + "        ORBL_ORD_DTL    O,                                           "
                + "        ADM_EMP_MST     A                                            "
                + whr_cls1
                + "UNION                                                                "
                + "SELECT DISTINCT "
                + "DECODE(B.STATION,'002','SGS','013','NCGS','014','TGS','016','BBGS','019','CTM','042','ED(GE)') STN, "
                + "NVL(TRIM(B.ORDNO),'NP')       ORD_NUM,                               "
                + "      'S-'||B.BILLREF       ID,                                      "
                + "       to_char(B.BILL_NO)       NUM,                                 "
                + "       TO_CHAR(B.BILL_DT,'DD-MON-YYYY') DT,                          "
                + "       TO_CHAR(B.BILL_RELEASE_DATE,'DD-MON-YYYY') RLZ_DT,            "
                + "NVL(TRIM(TO_CHAR(B.FINANCE_RECVD_DATE,'DD-MON-YYYY')),'NP') FIN_RCV, "
                + "       V.VENDOR_NAME VND_NM,                                         "
                + "       NVL(B.BILL_AMT,0.00)  BILL_AMT,                               "
                + job_desc2 + " ORDR_DESC,        "
                + "       trim(NVL(A.EMP_FNAME,' '))||' '||trim(NVL(A.EMP_LNAME,' '))  BILL_RLZD_BY,    "
                + "       DECODE(TRIM(B.URGENT_PAYMENT),'Y','Y','NP')  URGNT_PMNT,      "
                + "       B.budg_ac    budget_head,                                      "
                + "       '*   '|| B.erp_ac||'   *'     erp_code                                          "
                + "FROM    ORBL_SPBILL_DTL B,                                           "
                + "        ORBL_VENDOR_MST V,                                           "
                + "        ADM_EMP_MST     A                                            "
                + whr_cls2
                + "ORDER BY 1,3 DESC                                                    " ;


        ps1 = mk.con.prepareStatement(qry_str1);


  if(!genstn.equals("99999") && !dept1.equals("999")){

        ps1.setString(1,genstn);
        ps1.setString(2,dept1);
        ps1.setString(3,st_dt1);
        ps1.setString(4,end_dt1);

        ps1.setString(5,genstn);
        ps1.setString(6,dept1);
        ps1.setString(7,st_dt1);
        ps1.setString(8,end_dt1);

  }else if(!genstn.equals("99999") && dept1.equals("999")){

        ps1.setString(1,genstn);
        ps1.setString(2,st_dt1);
        ps1.setString(3,end_dt1);

        ps1.setString(4,genstn);
        ps1.setString(5,st_dt1);
        ps1.setString(6,end_dt1);

  }else if(genstn.equals("99999") && !dept1.equals("999")){


        if(!sGenstnCd.equals("019")){

        String temp_dep = dept1.substring(0,dept1.indexOf("-"));
        String dep_name = dept1.substring(dept1.indexOf("-")+1);


        ps1.setString(1,temp_dep);
        ps1.setString(2,dep_name);
        ps1.setString(3,st_dt1);
        ps1.setString(4,end_dt1);

        ps1.setString(5,temp_dep);
        ps1.setString(6,dep_name);
        ps1.setString(7,st_dt1);
        ps1.setString(8,end_dt1);

        }else{

        ps1.setString(1,dept1);
        ps1.setString(2,st_dt1);
        ps1.setString(3,end_dt1);

        ps1.setString(4,dept1);
        ps1.setString(5,st_dt1);
        ps1.setString(6,end_dt1);

        }

  }else{

        ps1.setString(1,st_dt1);
        ps1.setString(2,end_dt1);

        ps1.setString(3,st_dt1);
        ps1.setString(4,end_dt1);

  }
        rs1 = ps1.executeQuery() ;

        while(rs1.next()) {

                flag = 1;
                srl_num++  ;
                stn_nm    = rs1.getString(1);
                ord_num   = rs1.getString(2);
                bill_id   = rs1.getString(3);
                bill_no   = rs1.getString(4);
                bill_dt   = rs1.getString(5);
                rlzd_dt   = rs1.getString(6);
                fin_dt    = rs1.getString(7);
                vnd_nm    = rs1.getString(8);
                bill_amt  = rs1.getDouble(9);
                ord_desc  = rs1.getString(10);
                cert_by   = rs1.getString(11);
                urgnt_p   = rs1.getString(12);
                budget_head   = rs1.getString(13);
                erp_code      = rs1.getString(14);

            if(srl_num % 2 == 0){

%>
	<tr bgcolor="#DBF2DC" >
            <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=srl_num%></font></td>
	    <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=stn_nm%></font></td>

<% if(!ord_num.equals("NP")){ %>

	    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_num%></font></td>
	    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040">"<%=ord_desc%>"</font></td>

<% } else { %>

	    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
	    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>

<% } %>

		<%  if(urgnt_p.equals("Y")){    %>

	       <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_id%><sup>*</sup></font></td>

		<%   }else{  %>
	       <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_id%></font></td>

		<%  }  %>

	     <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_no%></font></td>
             <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_dt%></font></td>
	     <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=rlzd_dt%></font></td>
	     <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=cert_by%></font></td>

<% if(!fin_dt.equals("NP")){ %>

	     <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=fin_dt%></font></td>

<% } else { %>

	     <td align="center" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>

<% } %>
	     <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=budget_head%></font></td>
	     <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=erp_code%></font></td>
	     <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=vnd_nm%></font></td>
	     <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_amt%></font></td>
</tr>
<%
            }else{
%>
	<tr bgcolor="#FFFFFF" >
            <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=srl_num%></font></td>
	    <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=stn_nm%></font></td>

<% if(!ord_num.equals("NP")){ %>

	    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_num%></font></td>
	    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040">"<%=ord_desc%>"</font></td>

<% } else{ %>

	    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
	    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>

<% } %>

        <%   if(urgnt_p.equals("Y")){  %>

		<td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_id%><sup>*</sup></font></td>

		<%   }else{  %>
	    
		<td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_id%></font></td>
         
		<%  }  %>
		
	      <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_no%></font></td>
	      <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_dt%></font></td>
	      <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=rlzd_dt%></font></td>
	      <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=cert_by%></font></td>

<% if(!fin_dt.equals("NP")){ %>

	     <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=fin_dt%></font></td>

<% } else{ %>

	     <td align="center" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>

<% } %>
	      <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=budget_head%></font></td>
	      <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=erp_code%></font></td>
	      <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=vnd_nm%></font></td>
	      <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_amt%></font></td>
</tr>

  <%
            }

        }
%>
</table>
<%

                ps1.close();
                rs1.close();
        if(flag == 0){
%>
          <br><br>
            <font  size="4"  color="#400000">
                  <b>NO RECORDS FOUND</b>
            </font>
<%
        }


   }catch(Exception ef){
           ef.printStackTrace();
    }finally{
          mk.con.close();
     }

}

%>


</center>

</body>
</html>



