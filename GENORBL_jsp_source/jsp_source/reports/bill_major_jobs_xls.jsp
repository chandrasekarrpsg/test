<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType= "application/vnd.ms-excel"  %>
<%  response.setHeader("Content-Disposition", "attachment; filename=mjr_jobs.xls");%>


<head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<script type="text/javascript" src="Common_Funcs.js"></script>
<script src="js/sel_date.js"></script>

<title>LIST OF MAJOR JOBS DONE FOR ONE TIME ORDERS</title>

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

.evenCls{
background-color: #DBF2DC;
}
.oddCls{
background-color: #FFFFFF;
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
String ord_amt   = request.getParameter("hordamt_f2");

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();

%>

<body>

<%

if(st_dt1!= null && end_dt1!= null && dept1 != null){

        System.out.println("1. DEB CHAK MAJOR JOBS:ST DT "+st_dt1);
        System.out.println("1. DEB CHAK MAJOR JOBS:END DT "+end_dt1);
        System.out.println("1. DEB CHAK MAJOR JOBS:DEPT "+dept1);
        System.out.println("1. DEB CHAK MAJOR JOBS:GENSTN "+genstn);
        System.out.println("1. DEB CHAK MAJOR JOBS:BASIS "+basis);
        System.out.println("1. DEB CHAK MAJOR JOBS:ORDER AMT "+ord_amt);


   try{

        String qry_str     = new String();
        String cls         = new String();
        String whr_cls     = new String();
        String disp_basis  = new String();
        String job_desc    = new String();

        int    flag      = 0;
        int    srl_num   = 0;

        String bl_amt  = new String();

        PreparedStatement ps = null ;
        ResultSet rs         = null ;

        String genstn2 = new String();
        String dept2   = new String();

        String ord_gs    = new String(); 
        String ord_dpt   = new String(); 
        String ord_no    = new String(); 
        String ord_dt    = new String(); 
        String scope     = new String(); 
        String vendr     = new String(); 
        Double ordr_amt  = 0.00; 
        Double bill_amt  = 0.00; 

        String clsVar = "";

        Double temp_amt  = 0.0;

        temp_amt = Double.parseDouble(ord_amt)*100000;

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

        }catch(Exception e){
               e.printStackTrace();
        }

        if(basis.equals("B")){
           disp_basis = " LIST OF MAJOR ONE TIME JOBS ABOVE Rs."+ord_amt+" Lacs DONE BY "+dept2+" FOR "+genstn2+" ON THE BASIS OF BILL RELEASED AMOUNT";
        }else{
           disp_basis = " LIST OF MAJOR ONE TIME JOBS ABOVE Rs."+ord_amt+" Lacs DONE BY "+dept2+" FOR "+genstn2+" ON THE BASIS OF FINANCE RECEIVED AMOUNT";
        }


%>
<br>
<br>
<label style="POSITION: absolute; top:210px; left:10px;">

<div>

<center>

<%

SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
String DisplayDate= formatdate.format(new java.util.Date());

%>

<table width="97%" >
<tr >
<td align=left   colspan="1">  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
<td align=center colspan="8"> <font color="#400040" size="3"><b><%=disp_basis%></b></font></td>
</tr>
<tr >
<td align=center colspan="9" >
        <font color="#400040" size="3"><b>BETWEEN <%=st_dt1%> AND <%=end_dt1%></b> </font>
</td>
</tr>
</table>

<table  border="1" width="97%" class= "rcrds" >

<tr bgcolor="#DBF2DC">
    <td colspan="9" align="center" class= "rcrdsEle" >
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
    <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Sl</b></font></td>
    <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Station</b></font></td>
    <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Dept</b></font></td>
    <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Order No.</b></font></td>
    <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Order Date</b></font></td>
    <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Scope</b></font></td>
    <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Vendor Name</b></font></td>
    <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Order Amount(Rs.)</b></font></td>
    <td align="center"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Bill Amount(Rs.)</b></font></td>
</tr>

<%

        if(basis.equals("B")){
                 cls =  " B.BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
        }else{
                 cls =  " B.FINANCE_RECVD_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
        }


        if(!genstn.equals("99999") && !dept1.equals("999")){
            
            whr_cls =" WHERE "+ cls
                    +" AND    o.STATION     = ?             "
                    +" AND    o.DEPT        = ?             "
                    +" AND    o.P1_TOTAL   >= ?             "
                    +" AND    o.ORDER_TYPE  = 'O'           "
                    +" AND    NVL(b.BILL_CANCEL,'N') = 'N'  "
                    +" AND    o.STATION     = d.STATION     "
                    +" AND    o.DEPT        = d.DEPT        "
                    +" AND    o.STATION     = c.ORBL_STATION_CD"
                    +" AND    o.ORDER_ID    = b.ORDER_ID(+) ";

        }else if(!genstn.equals("99999") && dept1.equals("999")){

            whr_cls =" WHERE "+ cls
                    +" AND    o.STATION     = ?             "
                    +" AND    o.P1_TOTAL   >= ?             "
                    +" AND    o.ORDER_TYPE  = 'O'           "
                    +" AND    NVL(b.BILL_CANCEL,'N') = 'N'  "
                    +" AND    o.STATION     = d.STATION     "
                    +" AND    o.DEPT        = d.DEPT        "
                    +" AND    o.STATION     = c.ORBL_STATION_CD"
                    +" AND    o.ORDER_ID    = b.ORDER_ID(+) ";

        }else if(genstn.equals("99999") && !dept1.equals("999")){

              if(!sGenstnCd.equals("019")){

                      whr_cls   =" WHERE "+ cls 
                                +" AND    o.DEPT        = ?             "
                                +" AND    d.ORDER_DEPT  = ?             "
                                +" AND    o.P1_TOTAL   >= ?             "
                                +" AND    o.ORDER_TYPE  = 'O'           "
                                +" AND    NVL(b.BILL_CANCEL,'N') = 'N'  "
                                +" AND    o.STATION     = d.STATION     "
                                +" AND    o.DEPT        = d.DEPT        "
                                +" AND    o.STATION     = c.ORBL_STATION_CD"
                                +" AND    o.ORDER_ID    = b.ORDER_ID(+) ";

              }else{

                       whr_cls  =" WHERE "+ cls 
                                +" AND    o.DEPT        = ?             "
                                +" AND    o.P1_TOTAL   >= ?             "
                                +" AND    o.ORDER_TYPE  = 'O'           "
                                +" AND    NVL(b.BILL_CANCEL,'N') = 'N'  "
                                +" AND    o.STATION     = d.STATION     "
                                +" AND    o.DEPT        = d.DEPT        "
                                +" AND    o.STATION     = c.ORBL_STATION_CD"
                                +" AND    o.ORDER_ID    = b.ORDER_ID(+) ";

              }
        }else{

            whr_cls  =" WHERE "+ cls
                     +" AND    o.P1_TOTAL   >= ?             "
                     +" AND    o.ORDER_TYPE  = 'O'           "
                     +" AND    NVL(b.BILL_CANCEL,'N') = 'N'  "
                     +" AND    o.STATION     = d.STATION     "
                     +" AND    o.DEPT        = d.DEPT        "
                     +" AND    o.STATION     = c.ORBL_STATION_CD"
                     +" AND    o.ORDER_ID    = b.ORDER_ID(+) ";

        }

job_desc="replace(replace(replace(replace(replace(nvl(O.JOB_DESC,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')";
    
        qry_str = " SELECT DISTINCT                                                        "
                + " c.STATION_SHT_DESC STN,                                                "
                + " d.ORDER_DEPT ORD_DEPT,                                                 "
                + " o.order_no ORDER_NO,                                                   "                     
                + " TRIM(TO_CHAR(o.order_date,'DD-MON-YY')) ORDER_DT,                      " 
                +   job_desc + " SCOPE,                                                    " 
                + " trim(o.vendor_name) VENDOR,                                            " 
                + " nvl(o.P1_TOTAL,0) ORD_AMT,                                             "
                + " sum(nvl(b.bill_amount,0)) BILL_AMT,                                    "       
                + " o.order_id                                                             " 
                + " FROM   ORBL_ORD_DTL   o,                                               " 
                + "        ORBL_BILL_DTL  b,                                               " 
                + "        ORBL_CD_DEPT   d,                                               " 
                + "        CD_STATION     c                                                " 
                + whr_cls
                + " GROUP BY c.STATION_SHT_DESC,                                           "     
                + "          d.ORDER_DEPT,                                                 "     
                + "          o.order_no,                                                   "     
                + "          TRIM(TO_CHAR(o.order_date,'DD-MON-YY')),                      " 
                +            job_desc + ",                                                 "
                + "          TRIM(o.VENDOR_NAME),                                          " 
                + "          nvl(o.P1_TOTAL,0),                                            " 
                + "          o.ORDER_ID                                                    " 
                + " ORDER BY NVL(o.P1_TOTAL,0) DESC                                        ";

        ps = mk.con.prepareStatement(qry_str);

        if(!genstn.equals("99999") && !dept1.equals("999")){
           
            ps.setString(1,st_dt1);
            ps.setString(2,end_dt1);
            ps.setString(3,genstn);
            ps.setString(4,dept1);
            ps.setDouble(5,temp_amt);

        }else if(!genstn.equals("99999") && dept1.equals("999")){

            ps.setString(1,st_dt1);
            ps.setString(2,end_dt1);
            ps.setString(3,genstn);
            ps.setDouble(4,temp_amt);

        }else if(genstn.equals("99999") && !dept1.equals("999")){

              if(!sGenstnCd.equals("019")){

                        String temp_dep = dept1.substring(0,dept1.indexOf("-"));
                        String dep_name = dept1.substring(dept1.indexOf("-")+1);

                        ps.setString(1,st_dt1);
                        ps.setString(2,end_dt1);
                        ps.setString(3,temp_dep);
                        ps.setString(4,dep_name);
                        ps.setDouble(5,temp_amt);


              }else{
                        ps.setString(1,st_dt1);
                        ps.setString(2,end_dt1);
                        ps.setString(3,dept1);
                        ps.setDouble(4,temp_amt);

              }
        }else{

                        ps.setString(1,st_dt1);
                        ps.setString(2,end_dt1);
                        ps.setDouble(3,temp_amt);

        }

        rs = ps.executeQuery() ;        

        while(rs.next()){

             flag = 1;

             srl_num++;
             ord_gs    = rs.getString(1); 
             ord_dpt   = rs.getString(2); 
             ord_no    = rs.getString(3); 
             ord_dt    = rs.getString(4); 
             scope     = rs.getString(5); 
             vendr     = rs.getString(6); 
             ordr_amt  = rs.getDouble(7); 
             bill_amt  = rs.getDouble(8); 

        if(srl_num%2==0){
           clsVar = "evenCls";
        }else{
           clsVar = "oddCls";
        }
%>

<tr class="<%= clsVar %>" onMouseover="this.style.backgroundColor='#FFFF77'" onMouseout="this.style.backgroundColor=''">

    <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=srl_num%></font></td>
    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_gs%></font></td>
    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_dpt%></font></td>
    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_no%></font></td>
    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_dt%></font></td>
    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=scope%></font></td>
    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=vendr%></font></td>
    <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=ordr_amt%></font></td>
    <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_amt%></font></td>


</tr>

<%
        }

%> 

</table> 

<% if(flag == 0){  %>

<font size=3> NO RECORDS FOUND </font>

<% } %>

</div>

<%
   ps.close();
   rs.close();

  }catch(Exception ef){
           ef.printStackTrace();
    }finally{
          mk.con.close();
     }
}

%>


</center>
</label>
</body>
</html>

