<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>


<head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<script type="text/javascript" src="Common_Funcs.js"></script>
<script src="js/sel_date.js"></script>

<title>ORDER ISSSUING DELAY</title>

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

String st_dt1    = request.getParameter("frm_dt");
String end_dt1   = request.getParameter("to_dt");
String dept1     = request.getParameter("dept");
String genstn    = request.getParameter("GS");

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();

%>


<body background="GS1.jpg">

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

<div id="footer">
<div id="container">
<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:25px; top:15px" width="170" height="70">

<label style="POSITION: absolute; LEFT: 660px; top:650px"  class="style5" ><b>2012 &copy; Developed by I.T. Department</b></label>

</div>
</div>

<center>

<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3"><font face="Albertus Extra Bold" size="3" color="#400040">
  <b>ORDER ISSUING DELAY<b>
</font>
</p>
<br><br>


<TABLE>
<TR>
<TD align=right>

<input id="img1" type="image" alt="EXPORT TO EXCEL" src="excel_img.jpg"
 onClick="window.open('bill_issuing_delay_xls.jsp?gstn=<%=genstn%>&dept=<%=dept1%>&frm_dt=<%=st_dt1%>&to_dt=<%=end_dt1%>');" >

</TD>

<TD>&nbsp;&nbsp;</TD>

<TD align=left>
    <input type = "button" value="BACK" onclick="window.parent.open('bill_delay_index.jsp?userid=<%=sLoginEmpCd%>','_self');">
</TD>

</TABLE>

<%

if(st_dt1!= null && end_dt1!= null && dept1 != null){

%>

<form method="POST" name="frm" id="f2"  action="bill_rlzd_dptwz_xls.jsp" valign="middle" align="center" >
     <input type ="hidden" id="h_1" name="hst_dt_f2"  value="<%=st_dt1%>" >
     <input type ="hidden" id="h_2" name="hend_dt_f2" value="<%=end_dt1%>" >
     <input type ="hidden" id="h_3" name="hdept_f2"   value="<%=dept1%>" >
     <input type ="hidden" id="h_4" name="hgen_f2"    value="<%=genstn%>" >
</form>

<%
   String qry_str  = new String();
   String whr_cls  = new String();
   String job_desc = new String();
   String clsVar   = "";

   int    flag      = 0;
   int    srl_num   = 0;
   int    no_row_pg = 34;

   String ord_no        = new String();
   String ord_desc      = new String();
   String vndr_nm       = new String();
   String qtsn_on       = new String();
   String qtsn_rcv_dt   = new String();
   String ord_issd_dt   = new String();
   String ord_issd_by   = new String();

   int no_of_delay      = 0;
   int tot_delay        = 0;
   int avg_delay        = 0;


   PreparedStatement ps  = null ;
   ResultSet rs          = null ;

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
<label style="POSITION: absolute; top:210px; left:10px;">

<div id="printReady" style="overflow:scroll; width:1000px; height:430px; background:#DBF2DC;">

<center>

<%

SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
String DisplayDate= formatdate.format(new java.util.Date());

%>

<table width="100%" >
<tr >
<td align=left >  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
<td align=center> <font color="#400040" size="3"><b>DELAY (DAYS) IN ISSUING OF ORDERS</b></font></td>
<td align=right > <font color="#400040" size="3">  Page : 1 </font> </td>
</tr>

<tr >
<td align=center colspan="3"><font color="#400040" size="3"><b>BETWEEN <%=st_dt1%> AND <%=end_dt1%></b></font></td>
</tr>
</table>

<table  border="1" width="100%" class= "rcrds" >

<tr bgcolor="#DBF2DC">
    <td colspan="10" align="center" class= "rcrdsEle"><font color="#400040" size="2">
<% if(!sGenstnCd.equals("019")){ %>
                <b>GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : <%=dept2%></b>
<% } else{ %>
                <b>GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : CTM</b>
<% } %>
    </font></td>
</tr>

<tr bgcolor="#DBF2DC">
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Sl</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Order Number</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Vendor</b></font></td>
          <td align="center"  colspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Quotation</b></font></td>
          <td align="center"  colspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Order</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Delay(in days)</b></font></td>
</tr>

<tr bgcolor="#DBF2DC">
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Date</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Received On</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Released On</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Released By</b></font></td>
</tr>
<%

        if(!genstn.equals("99999") && !dept1.equals("999")){

            whr_cls = "WHERE  O.station = ?                         "
                    + "AND    O.dept    = ?                         "
                    + "AND    O.ORDER_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')" 
                    + "AND    O.ORDER_BY = A.EMP_CODE(+)            ";

        }else if(!genstn.equals("99999") && dept1.equals("999")){

            whr_cls = "WHERE  O.station = ?                         "
                    + "AND    O.ORDER_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')" 
                    + "AND    O.ORDER_BY = A.EMP_CODE(+)            ";

        }else if(genstn.equals("99999") && !dept1.equals("999")){

           if(!sGenstnCd.equals("019")){

           whr_cls =",ORBL_CD_DEPT   D                              "
                   +" WHERE  O.dept       = ?                       "
                   +" AND    D.ORDER_DEPT = ?                       "
                   +" AND    O.DEPT    = D.DEPT                     "
                   +" AND    O.STATION = D.STATION                  "
                   +" AND    O.ORDER_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')" 
                   +" AND    O.ORDER_BY = A.EMP_CODE(+)            ";

            }else{

            whr_cls=" WHERE  O.dept       = ?                       "
                   +" AND    O.ORDER_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')"
                   +" AND    O.ORDER_BY = A.EMP_CODE(+)            ";

            }

        }else{

            whr_cls=" WHERE  O.ORDER_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')"
                   +" AND    O.ORDER_BY = A.EMP_CODE(+)            ";

        }

job_desc="replace(replace(replace(replace(replace(nvl(O.JOB_DESC,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')";

        qry_str = " SELECT TRIM(NVL(O.ORDER_NO,'NP')) order_no,                                                 "
	        + job_desc + " ord_desc,                                                                        "
	        + " TRIM(O.VENDOR_NAME)  vndr,                                                                  "
	        + " NVL(TO_CHAR(O.P1_Q1_DATE,'DD-MON-RRRR'),'NP') qtsn_dt,                                      "
	        + " NVL(TO_CHAR(O.QUOTATION_RECVD_DATE,'DD-MON-RRRR'),'NP') qtsn_rcvd_dt,                       "
	        + " NVL(TO_CHAR(O.ORDER_DATE,'DD-MON-RRRR'),'NP')  ord_issd_on,                                 "
	        + " TRIM(NVL(A.EMP_FNAME,' '))||' '||TRIM(NVL(A.EMP_LNAME,' ')) ord_issd_by,                    "
	        + " NVL(TO_CHAR(TRUNC(O.ORDER_DATE)-TRUNC(O.QUOTATION_RECVD_DATE)),'0') no_of_delay            "
                + " FROM   ORBL_ORD_DTL O,                                                                      "
	        + "        ADM_EMP_MST  A                                                                       " 
                + whr_cls
                + " ORDER BY O.ORDER_DATE,                                                                      "
                + " O.ORDER_ID                                                                                  ";


         ps = mk.con.prepareStatement(qry_str);


         if(!genstn.equals("99999") && !dept1.equals("999")){

             ps.setString(1,genstn);
             ps.setString(2,dept1);
             ps.setString(3,st_dt1);
             ps.setString(4,end_dt1);

        }else if(!genstn.equals("99999") && dept1.equals("999")){

             ps.setString(1,genstn);
             ps.setString(2,st_dt1);
             ps.setString(3,end_dt1);

        }else if(genstn.equals("99999") && !dept1.equals("999")){

           if(!sGenstnCd.equals("019")){

               String temp_dep = dept1.substring(0,dept1.indexOf("-"));
               String dep_name = dept1.substring(dept1.indexOf("-")+1);

               ps.setString(1,temp_dep);
               ps.setString(2,dep_name);
               ps.setString(3,st_dt1);
               ps.setString(4,end_dt1);

            }else{

               ps.setString(1,dept1);
               ps.setString(2,st_dt1);
               ps.setString(3,end_dt1);

            }

        }else{

               ps.setString(1,st_dt1);
               ps.setString(2,end_dt1);
        }


        rs = ps.executeQuery();

        while(rs.next()){

              flag = 1;
              if(srl_num>0 && srl_num % no_row_pg == 0){
%>
</table>
   <p class="pgbrk">&nbsp;</p>
<table width="100%" >
<tr >
<td align=left >  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
<td align=center> <font color="#400040" size="3"><b>DELAY (DAYS) IN ISSUING OF ORDERS</b></font></td>
<td align=right > <font color="#400040" size="3">  Page : <%= (srl_num / no_row_pg)+1  %> </font> </td>
</tr>
<tr >
<td align=center colspan="3"><font color="#400040" size="3"><b>BETWEEN <%=st_dt1%> AND <%=end_dt1%></b></font></td>
</tr>
</table>

<table  border="1" width="100%" class= "rcrds" >

<tr bgcolor="#DBF2DC">
    <td colspan="10" align="center" class= "rcrdsEle"><font color="#400040" size="2">
<% if(!sGenstnCd.equals("019")){ %>
                <b>GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : <%=dept2%></b>
<% } else{ %>
                <b>GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : CTM</b>
<% } %>
    </font></td>
</tr>

<tr bgcolor="#DBF2DC">
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Sl</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Order Number</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Vendor</b></font></td>
          <td align="center"  colspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Quotation</b></font></td>
          <td align="center"  colspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Order</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Delay(in days)</b></font></td>
</tr>

<tr bgcolor="#DBF2DC">
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Date</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Received On</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Released On</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Released By</b></font></td>
</tr>

<%
        }

        srl_num++;
        
        ord_no        = rs.getString(1);
        ord_desc      = rs.getString(2);
        vndr_nm       = rs.getString(3);
        qtsn_on       = rs.getString(4);
        qtsn_rcv_dt   = rs.getString(5);
        ord_issd_dt   = rs.getString(6);
        ord_issd_by   = rs.getString(7);
        no_of_delay   = Integer.parseInt(rs.getString(8));

        tot_delay     = tot_delay + no_of_delay;
        
        if(srl_num%2 == 0)
           clsVar = "evenCls";
        else
           clsVar = "oddCls";

%>
<tr class="<%= clsVar %>" onMouseover="this.style.backgroundColor='#FFFF77'" onMouseout="this.style.backgroundColor=''">

    <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=srl_num%></font></td>
<%  if (!ord_no.equals("NP")){ %>
    <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><p title="<%=ord_desc%>"><%=ord_no%></p></font></td>
<% } else { %>
    <td align="left" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
<% }        %>
    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=vndr_nm%></font></td>
    <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=qtsn_on%></font></td>
    <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=qtsn_rcv_dt%></font></td>
    <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_issd_dt%></font></td>
    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_issd_by%></font></td>
    <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=no_of_delay%></font></td>

</tr>
<%
     }
        avg_delay     = (tot_delay/srl_num);
%>
<tr>
    <td align="center" class="rcrdsEle" colspan="8"><font size=2 color="#790000">AVERAGE DELAY (IN DAYS) = <%=avg_delay%></font></td>
</tr>
</table>


<% 
if(flag == 0){ %>

<font size=4 color="#400040"><b>NO RECORDS FOUND !!!</b></font>

</div>
</label>

<%

}
    rs.close();
    ps.close();

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
