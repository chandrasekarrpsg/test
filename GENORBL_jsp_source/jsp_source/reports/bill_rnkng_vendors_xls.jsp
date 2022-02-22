<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java"   %>
<%@ page contentType= "application/vnd.ms-excel"  %>
<%  response.setHeader("Content-Disposition", "attachment; filename=vendors.xls");%>

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

String sLoginEmpCd =  loginBean.getsEmpCd();
String sGenstnCd   = loginBean.getsGenStn();
String genstn      =  request.getParameter("hgen_f2");
String dept        =  request.getParameter("hdept_f2");
String frm_dt      =  request.getParameter("hst_dt_f2");
String to_dt       =  request.getParameter("hend_dt_f2");
String basis       =  request.getParameter("hbasis_f2");

System.out.println("GENSTN :"+ genstn);
System.out.println("DEPT :"+ dept);
System.out.println("FROM DATE :"+ frm_dt);
System.out.println("TO DATE :"+ to_dt);
System.out.println("BASIS :"+ basis);

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
	disp_basis = " BILL RELEASED BY "+genstn2+" ON THE BASIS OF BILL RELEASED DATE";
}else{
	disp_basis = " BILL RELEASED BY "+genstn2+" ON THE BASIS OF FINANCE RECEIVED DATE";
}

%>


<div id="xls_spcl" style="overflow:scroll; height:450px;" >

    <table>
    <tr>
    <td align=left >  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
    </tr>
    <tr>
    <td align=center colspan="4"> <font color="#400040" size="3"><b><%=disp_basis%></b></font></td>
    </tr>
    <tr > 
    <td align=center colspan="4" >
	<font color="#400040" size="3"><b>BETWEEN <%=frm_dt%> AND <%=to_dt%></b> </font>
    </td>
    </tr>
	 <tr>
     <td colspan="4" align="center" > <font color="#400040" size="3">
<% if(!sGenstnCd.equals("019")){ %>
                <b>GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : <%=dept2%></b>
<% } else{ %>
                <b>GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : CTM</b>
<% } %>
       </font> </td>
     </tr>
    </table>

<center>
   <table  border="1" width="100%" class= "rcrds" >

	<tr bgcolor="#DBF2DC">
          <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Sl</b></font></td>
          <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Vendor Name</b></font></td>
          <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Vendor Ref</b></font></td>
          <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Bill Amount(Rs.)</b></font></td>
        </tr>
<%

try{

        int flag    = 0;
        int srl_num = 0;
               
        String vndr_nm = new String();
        String vndr_rf = new String();
        String totamt  = new String();

        String qry_str1 = new String();
        String cls         = new String();
        String  whr_cls1 = new String();
        String  whr_cls2 = new String();

        ResultSet rs1=null;
        PreparedStatement ps1=null;

        if(basis.equals("B")){
	   cls =  "   B.BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
	}else{
	   cls =  "   B.FINANCE_RECVD_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
	}

        if(!genstn.equals("99999") && !dept.equals("999")){

                        whr_cls1= "WHERE O.station = ? "
                               + "AND    O.dept   = ?           "
                               + "AND " + cls
                               + "AND    O.order_id  = B.order_id ";

                        whr_cls2= "WHERE B.station = ? "
                               + "AND    B.dept   = ?           "
                               + "AND " + cls
                               + "AND    B.VENDOR = V.VENDOR_CODE ";

        }else if(!genstn.equals("99999") && dept.equals("999")){

                        whr_cls1= "WHERE  O.station = ? "
                               + "AND " + cls
                               + "AND    O.order_id  = B.order_id      ";

                        whr_cls2= "WHERE B.station = ? "
                               + "AND " + cls
                               + "AND    B.VENDOR = V.VENDOR_CODE ";

        }else if(genstn.equals("99999") && !dept.equals("999")){

              if(sGenstnCd.equals("019")){

                       whr_cls1= "WHERE  O.dept   = ?                   "
                               + "AND " + cls
                               + "AND    O.order_id  = B.order_id ";

                       whr_cls2 = "WHERE  B.dept    = ?                          "
                                + "AND " + cls
                                + "AND    B.VENDOR  = V.VENDOR_CODE              "; 
             } else {

                       whr_cls1 =",ORBL_CD_DEPT   D                     "
                                +"WHERE  O.dept    = ?                          "
                                +"AND    D.ORDER_DEPT = ?                       "
                                +"AND    O.DEPT = D.DEPT                        "
                                +"AND    O.STATION = D.STATION                  "
                                +"AND    O.STATION = B.STATION                  "
                                +"AND " + cls
                                +"AND    O.order_id  = B.order_id               ";

                       whr_cls2 = ",ORBL_CD_DEPT   D                     "
                                + "WHERE  B.dept    = ?                          "
                                + "AND    D.ORDER_DEPT = ?                       "
                                + "AND    B.DEPT       = D.DEPT                  "
                                + "AND " + cls
                                + "AND    B.VENDOR     = V.VENDOR_CODE           ";  

              }


        }else{

                        whr_cls1= "WHERE " + cls
                               + "AND    O.order_id  = B.order_id     ";

                       whr_cls2 = "WHERE " + cls
                                + "AND    B.VENDOR  = V.VENDOR_CODE              ";
        }


          qry_str1 = "SELECT A.VENDOR,                                                    "
                   + "       A.REFERENCE,                                                 "
                   + "       TO_CHAR(SUM(BILL_AMT),'99,99,99,99,990.99')                    "
                   + "FROM(                                                               "
                   + "SELECT TRIM(O.vendor_name)    VENDOR,                               "
                   + "       TRIM(O.vendor_code) REFERENCE,                               "
                   + "       NVL(B.BILL_amount,0) BILL_AMT,                               "
                   + "       B.BILL_ID                                                    "
                   + "FROM    ORBL_BILL_DTL   B,                                          "
                   + "        ORBL_ORD_DTL    O                                           "
                   +  whr_cls1
                   + " UNION                                                               "
                   + "SELECT TRIM(V.vendor_name)     VENDOR,                              "
                   + "       TRIM(V.vendor_code) REFERENCE,                               "
                   + "       NVL(B.BILL_AMT,0) BILL_AMT,                                  "
                   + "       B.BILLREF                                                    "
                   + "FROM   ORBL_SPBILL_DTL B,                                           "
                   + "       ORBL_VENDOR_MST V                                            "
                   +  whr_cls2
                   + ") A                                                                 "
                   + "GROUP BY A.VENDOR,                                                  "
                   + "         A.REFERENCE                                                "
                   + "ORDER BY SUM(A.BILL_AMT) DESC                                       ";

System.out.println("RNKNG VNDRS XLS  QRY STRING " + qry_str1);

          ps1 = mk.con.prepareStatement(qry_str1);

          if(!genstn.equals("99999") && !dept.equals("999")){

System.out.println("BILL RNK XLS : In block 1" );

              ps1.setString(1,genstn);
              ps1.setString(2,dept);
              ps1.setString(3,frm_dt);
              ps1.setString(4,to_dt);

              ps1.setString(5,genstn);
              ps1.setString(6,dept);
              ps1.setString(7,frm_dt);
              ps1.setString(8,to_dt);

          }else if(!genstn.equals("99999") && dept.equals("999")){

System.out.println("BILL RNK XLS : In block 2" );

              ps1.setString(1,genstn);
              ps1.setString(2,frm_dt);
              ps1.setString(3,to_dt);

              ps1.setString(4,genstn);
              ps1.setString(5,frm_dt);
              ps1.setString(6,to_dt);

          }else if(genstn.equals("99999") && !dept.equals("999")){

                if(!sGenstnCd.equals("019")){

System.out.println("BILL RNK XLS : In block 3a" );
System.out.println("BILL RNK XLS : " + dept);

                   String temp_dep = dept.substring(0,dept.indexOf("-"));
                   String dep_name = dept.substring(dept.indexOf("-")+1);

System.out.println("BILL RNK XLS : " + dept + " -- " + temp_dep + "--" + dep_name );

                   ps1.setString(1,temp_dep);
                   ps1.setString(2,dep_name);
                   ps1.setString(3,frm_dt);
                   ps1.setString(4,to_dt);


                   ps1.setString(5,temp_dep);
                   ps1.setString(6,dep_name);
                   ps1.setString(7,frm_dt);
                   ps1.setString(8,to_dt);

                }else{

System.out.println("BILL RNK XLS : In block 3b" );

                   ps1.setString(1,dept);
                   ps1.setString(2,frm_dt);
                   ps1.setString(3,to_dt);

                   ps1.setString(4,dept);
                   ps1.setString(5,frm_dt);
                   ps1.setString(6,to_dt);

                }


         }else{

System.out.println("BILL RNK XLS : In block 4" );

              ps1.setString(1,frm_dt);
              ps1.setString(2,to_dt);

              ps1.setString(3,frm_dt);
              ps1.setString(4,to_dt);
         }



        rs1 = ps1.executeQuery() ;

        while(rs1.next()) {
	      flag = 1;
	      srl_num++  ;
	      vndr_nm = rs1.getString(1); 
	      vndr_rf = rs1.getString(2); 
	      totamt  = rs1.getString(3); 

	  if(srl_num % 2 == 0){

%>
     <tr bgcolor="#DBF2DC">
          <td align = "center" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=srl_num%></font></td>
          <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=vndr_nm%> </font></td>
          <td align = "center" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=vndr_rf%></font></td>
          <td align = "right"  class= "rcrdsEle" ><font  size="2"  color="#800040"><%=totamt%></font></td>
     </tr>
<%
            }else{
%>
     <tr bgcolor="#ffffff">
         <td align = "center" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=srl_num%></font></td>
         <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040"> <%=vndr_nm%></font></td>
         <td align = "center" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=vndr_rf%></font></td>
         <td align = "right"  class= "rcrdsEle" ><font  size="2"  color="#800040"><%=totamt%></font></td>
     </tr>

<%
            }
        }
%>
   </table>
</center>
<%
       
		ps1.close();
		rs1.close();

        if(flag == 0){
%>
          <br><br>
            <font  size="4"  color="#400000">
                  <b>NO RECORDS FOUND</b>
            </font>


</div>

<%
        }

}catch(Exception ef){
       ef.printStackTrace();
}finally{
       mk.con.close();
}

%>

</body>
</html>
