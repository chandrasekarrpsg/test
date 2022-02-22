<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType= "application/vnd.ms-excel"  %>
<%  response.setHeader("Content-Disposition", "attachment; filename=vnd_ord.xls");%>


<head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<script type="text/javascript" src="Common_Funcs.js"></script>
<script src="js/sel_date.js"></script>

<title>VENDOR-WISE BILLS RELEASED FOR DIFFERENT ORDER TYPES</title>

</script>

<style>
table.rcrds
{
border-collapse:collapse;
}
table.rcrds,th, td.rcrdsEle
{
border: 1px solid black;
}


.pgbrk{
page-break-after:always;
}
</style>


</head>

<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>

<%
String sLoginEmpCd = loginBean.getsEmpCd();
String sStnshrtNm  = loginBean.getsLoginStnShrtNm();
String sStnNm      = loginBean.getsGenStnNm();
String sGenstnCd   = loginBean.getsGenStn();

String genstn      =  request.getParameter("hgen_f2");
String dept1       =  request.getParameter("hdept_f2");
String st_dt1      =  request.getParameter("hst_dt_f2");
String end_dt1       =  request.getParameter("hend_dt_f2");
String basis       =  request.getParameter("hbasis_f2");

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();

%>

<body>

<center>
<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3">
<font face="Albertus Extra Bold" size="3" color="#400040">
<b>VENDORWISE BILLS RELEASED FOR DIFFERENT ORDER TYPES<b>
</font>
<br><br>


<%

System.out.println("MRITYUNJOY 4 "+sGenstnCd);

if(st_dt1!= null && end_dt1!= null && dept1 != null){

        System.out.println("1. DEB CHAK New Rep:GS "+genstn);
        System.out.println("1. DEB CHAK New Rep:Dept "+dept1);

        String qry_str1 = new String();
        String cls      = new String();

        String  whr_cls1 = new String();

        int    flag    = 0;
        int    srl_num = 0;

        String vndr_cd = new String();
        String vndr_nm = new String();
        String blamt_O = new String();
        String blamt_T = new String();
        String blamt_R = new String();
        String blamt_C = new String();
        String blamt_L = new String();
        String bl_amt  = new String();
        
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

<div>
<center>

<%

SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
String DisplayDate= formatdate.format(new java.util.Date());
String disp_basis = new String();

if(basis.equals("B")){
	disp_basis = " VENDOR-WISE BILLS RELEASED FOR DIFFERENT ORDER TYPES ON THE BASIS OF BILL RELEASED DATE";
}else{
	disp_basis = " VENDOR-WISE BILLS RELEASED FOR DIFFERENT ORDER TYPES ON THE BASIS OF FINANCE RECEIVED DATE";
}

%>
<table width="97%" >
<tr > 
<td align=left colspan=1>  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
<td align=center colspan=7> <font color="#400040" size="3"><b><%=disp_basis%></b></font></td>
</tr>
<tr > 
<td align=center colspan=8 >
	<font color="#400040" size="3"><b>BETWEEN <%=st_dt1%> AND <%=end_dt1%></b> </font>
</td>
</tr>
</table>
     <table  border="1" width="97%" class= "rcrds" >

     <tr bgcolor="#DBF2DC">
          <td colspan="8" align="center" class= "rcrdsEle" >
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
          <td align="center"  class= "rcrdsEle" rowspan=2><font size=2 color="#400040"><b>Sl</b></font></td>
          <td align="center"  class= "rcrdsEle" rowspan=2><font size=2 color="#400040"><b>Vendor Name</b></font></td>
          <td align="center"  class= "rcrdsEle" colspan=6><font size=2 color="#400040"><b>Bill Amount(Rs.) for different order types</b></font></td>
     </tr>

     <tr bgcolor="#DBF2DC">
          <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>One Time</b></font></td>
          <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Term Contract</b></font></td>
          <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Rate Contracts</b></font></td>
          <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Capex</b></font></td>
          <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Life Extension</b></font></td>
          <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Total</b></font></td>
     </tr>

<%
        System.out.println("3.DEB CHAK  New Rep:GS "+genstn);
        System.out.println("3.DEB CHAK  New Rep:Dept "+dept1);

        if(basis.equals("B")){
                        cls =  " B.BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
                }else{
                        cls =  " B.FINANCE_RECVD_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
                }

        if(!genstn.equals("99999") && !dept1.equals("999")){

            whr_cls1= "WHERE O.station = ? "
                    + "AND    O.dept   = ?           "
                    + "AND " + cls
                    + "AND    O.order_id  = B.order_id ";

        }else if(!genstn.equals("99999") && dept1.equals("999")){

              whr_cls1= "WHERE  O.station = ? "
                      + "AND " + cls
                      + "AND    O.order_id  = B.order_id      ";

        }else if(genstn.equals("99999") && !dept1.equals("999")){

              if(!sGenstnCd.equals("019")){

                       whr_cls1 =",ORBL_CD_DEPT   D                     "
                                +"WHERE  O.dept    = ?                          "
                                +"AND    D.ORDER_DEPT = ?                       "
                                +"AND    O.DEPT = D.DEPT                        "
                                +"AND    O.STATION = D.STATION                  "
                                +"AND    O.STATION = B.STATION                  "
                                +"AND " + cls
                                +"AND    O.order_id  = B.order_id               ";
              }else{

                       whr_cls1= "WHERE  O.dept   = ?                   "
                               + "AND " + cls
                               + "AND    O.order_id  = B.order_id ";
              }


        }else{

              whr_cls1= "WHERE " + cls
                      + "AND    O.order_id  = B.order_id     ";
	}



       qry_str1= "SELECT DISTINCT                                                               " 
	       + "               V.VND_CD,                                                      " 
	       + "               V.VND_NM,                                                      "  
	       + "               NVL(O.BILL_AMT,'NP') BILL_AMT_O,                               " 
	       + "               NVL(T.BILL_AMT,'NP') BILL_AMT_T,                               " 
	       + "               NVL(R.BILL_AMT,'NP') BILL_AMT_R,                               " 
	       + "               NVL(C.BILL_AMT,'NP') BILL_AMT_C,                               " 
	       + "               NVL(L.BILL_AMT,'NP') BILL_AMT_L,                               " 
	       + "               NVL(V.BILL_AMT,'NP') BILL_AMT_V                                " 
               + " FROM                                                                         " 
	       + "            (SELECT O.VENDOR_CODE VND_CD,O.VENDOR_NAME VND_NM,TO_CHAR(SUM(NVL(B.BILL_AMOUNT,0)),'9,99,99,99,99,990.99') BILL_AMT                " 
	       + "            FROM   ORBL_BILL_DTL   B,                                         " 
	       + "                   ORBL_ORD_DTL    O                                          " 
	       +              whr_cls1
               + "            GROUP BY O.VENDOR_CODE,O.VENDOR_NAME ) V,                         "
	       + "            (SELECT O.VENDOR_CODE VND_CD, TO_CHAR(SUM(NVL(B.BILL_AMOUNT,0)),'9,99,99,99,99,990.99') BILL_AMT  "
	       + "            FROM   ORBL_BILL_DTL   B,                                         "
	       + "                   ORBL_ORD_DTL    O						" 
	       +              whr_cls1
	       + "            AND    O.ORDER_TYPE = 'O'                                         " 
	       + "            GROUP BY O.VENDOR_CODE) O,                                        " 
	       + "            (SELECT O.VENDOR_CODE VND_CD, TO_CHAR(SUM(NVL(B.BILL_AMOUNT,0)),'9,99,99,99,99,990.99') BILL_AMT  " 
	       + "            FROM   ORBL_BILL_DTL   B,                                         " 
	       + "                   ORBL_ORD_DTL    O                                          " 
	       +              whr_cls1
	       + "            AND    O.ORDER_TYPE = 'T'                                         " 
	       + "            GROUP BY O.VENDOR_CODE) T,                                        " 
	       + "            (SELECT O.VENDOR_CODE VND_CD, TO_CHAR(SUM(NVL(B.BILL_AMOUNT,0)),'9,99,99,99,99,990.99') BILL_AMT  " 
	       + "            FROM   ORBL_BILL_DTL   B,                                         " 
	       + "                   ORBL_ORD_DTL    O                                          "  
	       +              whr_cls1
	       + "            AND    O.ORDER_TYPE = 'R'                                         " 
	       + "            GROUP BY O.VENDOR_CODE) R,                                        " 
	       + "            (SELECT O.VENDOR_CODE VND_CD, TO_CHAR(SUM(NVL(B.BILL_AMOUNT,0)),'9,99,99,99,99,990.99') BILL_AMT  " 
	       + "            FROM   ORBL_BILL_DTL   B,                                         " 
	       + "                   ORBL_ORD_DTL    O                                          " 
	       +              whr_cls1
	       + "            AND    O.ORDER_TYPE = 'C'                                         "  
	       + "            GROUP BY O.VENDOR_CODE) C,                                        " 
	       + "            (SELECT O.VENDOR_CODE VND_CD, TO_CHAR(SUM(NVL(B.BILL_AMOUNT,0)),'9,99,99,99,99,990.99') BILL_AMT  " 
	       + "            FROM   ORBL_BILL_DTL   B,                                         " 
	       + "                   ORBL_ORD_DTL    O                                          "  
	       +              whr_cls1
	       + "            AND    O.ORDER_TYPE = 'L'                                         " 
	       + "            GROUP BY O.VENDOR_CODE) L                                         "
               + "    WHERE  V.VND_CD = O.VND_CD(+)                                             "
               + "    AND    V.VND_CD = T.VND_CD(+)                                             " 
               + "    AND    V.VND_CD = R.VND_CD(+)                                             " 
               + "    AND    V.VND_CD = C.VND_CD(+)                                             " 
               + "    AND    V.VND_CD = L.VND_CD(+)                                             " 
               + "    ORDER BY V.VND_CD,V.VND_NM                                                " ;


//System.out.println("RNKNG VNDRS QRY STRING " + qry_str1);

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

              ps1.setString(9,genstn);
              ps1.setString(10,dept1);
              ps1.setString(11,st_dt1);
              ps1.setString(12,end_dt1);

              ps1.setString(13,genstn);
              ps1.setString(14,dept1);
              ps1.setString(15,st_dt1);
              ps1.setString(16,end_dt1);

              ps1.setString(17,genstn);
              ps1.setString(18,dept1);
              ps1.setString(19,st_dt1);
              ps1.setString(20,end_dt1);

              ps1.setString(21,genstn);
              ps1.setString(22,dept1);
              ps1.setString(23,st_dt1);
              ps1.setString(24,end_dt1);

          }else if(!genstn.equals("99999") && dept1.equals("999")){

              ps1.setString(1,genstn);
              ps1.setString(2,st_dt1);
              ps1.setString(3,end_dt1);

              ps1.setString(4,genstn);
              ps1.setString(5,st_dt1);
              ps1.setString(6,end_dt1);

              ps1.setString(7,genstn);
              ps1.setString(8,st_dt1);
              ps1.setString(9,end_dt1);

              ps1.setString(10,genstn);
              ps1.setString(11,st_dt1);
              ps1.setString(12,end_dt1);

              ps1.setString(13,genstn);
              ps1.setString(14,st_dt1);
              ps1.setString(15,end_dt1);

              ps1.setString(16,genstn);
              ps1.setString(17,st_dt1);
              ps1.setString(18,end_dt1);

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

                   ps1.setString(9,temp_dep);
                   ps1.setString(10,dep_name);
                   ps1.setString(11,st_dt1);
                   ps1.setString(12,end_dt1);

                   ps1.setString(13,temp_dep);
                   ps1.setString(14,dep_name);
                   ps1.setString(15,st_dt1);
                   ps1.setString(16,end_dt1);

                   ps1.setString(17,temp_dep);
                   ps1.setString(18,dep_name);
                   ps1.setString(19,st_dt1);
                   ps1.setString(20,end_dt1);

                   ps1.setString(21,temp_dep);
                   ps1.setString(22,dep_name);
                   ps1.setString(23,st_dt1);
                   ps1.setString(24,end_dt1);

                }else{

                   ps1.setString(1,dept1);
                   ps1.setString(2,st_dt1);
                   ps1.setString(3,end_dt1);

                   ps1.setString(4,dept1);
                   ps1.setString(5,st_dt1);
                   ps1.setString(6,end_dt1);

                   ps1.setString(7,dept1);
                   ps1.setString(8,st_dt1);
                   ps1.setString(9,end_dt1);

                   ps1.setString(10,dept1);
                   ps1.setString(11,st_dt1);
                   ps1.setString(12,end_dt1);

                   ps1.setString(13,dept1);
                   ps1.setString(14,st_dt1);
                   ps1.setString(15,end_dt1);

                   ps1.setString(16,dept1);
                   ps1.setString(17,st_dt1);
                   ps1.setString(18,end_dt1);

                }


         }else{

              ps1.setString(1,st_dt1);
              ps1.setString(2,end_dt1);

              ps1.setString(3,st_dt1);
              ps1.setString(4,end_dt1);

              ps1.setString(5,st_dt1);
              ps1.setString(6,end_dt1);

              ps1.setString(7,st_dt1);
              ps1.setString(8,end_dt1);

              ps1.setString(9,st_dt1);
              ps1.setString(10,end_dt1);

              ps1.setString(11,st_dt1);
              ps1.setString(12,end_dt1);

         }

        rs1 = ps1.executeQuery() ;
        while(rs1.next()) {

        flag = 1;

        srl_num++  ;
        vndr_cd = rs1.getString(1);
        vndr_nm = rs1.getString(2);
        blamt_O = rs1.getString(3);
        blamt_T = rs1.getString(4);
        blamt_R = rs1.getString(5);
        blamt_C = rs1.getString(6);
        blamt_L = rs1.getString(7);
        bl_amt  = rs1.getString(8);


            if(srl_num % 2 == 0){

%>
     <tr bgcolor="#DBF2DC">

          <td align = "center" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=srl_num%></font></td>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=vndr_nm%></font></td>

<% if(!blamt_O.equals("NP")){ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=blamt_O%></font></td>
<% } else{ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040">&nbsp;</font></td>
<% } %>

<% if(!blamt_T.equals("NP")){ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=blamt_T%></font></td>
<% } else{ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040">&nbsp;</font></td>
<% } %>

<% if(!blamt_R.equals("NP")){ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=blamt_R%></font></td>
<% } else{ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040">&nbsp;</font></td>
<% } %>

<% if(!blamt_C.equals("NP")){ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=blamt_C%></font></td>
<% } else{ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040">&nbsp;</font></td>
<% } %>

<% if(!blamt_L.equals("NP")){ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=blamt_L%></font></td>
<% } else{ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040">&nbsp;</font></td>
<% } %>

          <td align = "right"  class= "rcrdsEle" ><font  size="2"  color="#800040"><%=bl_amt%></font></td>

     </tr>
<% } else{ %>
     <tr>

          <td align = "center" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=srl_num%></font></td>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=vndr_nm%></font></td>

<% if(!blamt_O.equals("NP")){ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=blamt_O%></font></td>
<% } else{ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040">&nbsp;</font></td>
<% } %>

<% if(!blamt_T.equals("NP")){ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=blamt_T%></font></td>
<% } else{ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040">&nbsp;</font></td>
<% } %>

<% if(!blamt_R.equals("NP")){ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=blamt_R%></font></td>
<% } else{ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040">&nbsp;</font></td>
<% } %>

<% if(!blamt_C.equals("NP")){ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=blamt_C%></font></td>
<% } else{ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040">&nbsp;</font></td>
<% } %>

<% if(!blamt_L.equals("NP")){ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=blamt_L%></font></td>
<% } else{ %>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040">&nbsp;</font></td>
<% } %>

          <td align = "right"  class= "rcrdsEle" ><font  size="2"  color="#800040"><%=bl_amt%></font></td>

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
</div>
</label>
</body>
</html>

