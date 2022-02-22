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
<script type="text/javascript" src="Common_Funcs.js"></script>
<script src="js/sel_date.js"></script>

<title>ORDERS HAVING PENDING BILLS </title>

</script>

<style>

table.rcrds{
      border-collapse:collapse;
}
table.rcrds,th, td.rcrdsEle{
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

String st_dt  = request.getParameter("st_dt");
String end_dt = request.getParameter("end_dt");

MakeConnectionGENORBL mk = null;

try{

mk = new MakeConnectionGENORBL();

%>

<body onLoad="">

<div id="footer">
<div id="container">
<div class="left">

</div>
</div>

<%

String st_dt1    = request.getParameter("hst_dt");
String end_dt1   = request.getParameter("hend_dt");
String genstn    = request.getParameter("hgen");
String dept1     = request.getParameter("hdept");
String ord       = request.getParameter("hord");
String vnd_cd    = request.getParameter("hvndr");

System.out.println("BILL PENDING:GS "+genstn);
System.out.println("BILL PENDING:Dept "+dept1);
System.out.println("BILL PENDING:ST DT "+st_dt1);
System.out.println("BILL PENDING:END DT "+end_dt1);
System.out.println("BILL PENDING:ORD "+ord);
System.out.println("BILL PENDING:VND "+vnd_cd);

if(st_dt1!= null && end_dt1!= null && dept1 != null){

        String qry_str  = new String();
        String cls      = new String();

        String  whr_cls1 = new String();
        String  whr_cls2 = new String();
        String  job_dsc  = new String();
        String  vendor   = new String();
        String  order_no = new String();

        int    srl_num   = 0;
        int    no_row_pg = 34 ;

        String ord_dpt = new String();
        String ord_by  = new String();
        String ord_num = new String();
        String scope   = new String();
        String vndr_nm = new String();
        String ord_dt  = new String();
        String ord_amt = new String();
        String ord_typ = new String();

        int cnt_rs = 0;

        String clsVar = "";

        ResultSet rs         = null;
        PreparedStatement ps = null;

%>

<!--

<form method="POST" name="frm" id="f2"  action="bill_pending_xls.jsp" valign="middle" align="center" >
     <input type ="hidden" id="h_1" name="hst_dt_f2"  value="<%=st_dt1%>" >
     <input type ="hidden" id="h_2" name="hend_dt_f2" value="<%=end_dt1%>" >
     <input type ="hidden" id="h_3" name="hgen_f2"    value="<%=genstn%>" >
</form>

<input id="img1" type="image" alt="EXPORT TO EXCEL" onclick="func_to_xls();" src="excel_img.jpg"
 style="position:absolute; left:930px; top:180px">

<br>
<br>

-->

<%
try{
   
    if(!genstn.equals("99999") && !dept1.equals("999")){

      whr_cls1 = "  where  o.STATION = ? "
               + "  and    o.DEPT    = ? "
               + "  and    to_char(o.VENDOR_CODE)  like decode(?,'000000','%',?) "
               + "  and    to_char(o.ORDER_STATUS) like decode(substr(?,0,1),'9','%',substr(?,0,1)) "
               + "  and    o.ORDER_DATE between to_date(?,'dd-mon-rrrr') and to_date(?,'dd-mon-rrrr') "
               + "  and    nvl(o.CANCEL,'N') = 'N' ";

      whr_cls2 = "   where p.ORDER_ID = q.ORDER_ID(+) "
               + "   and   p.STATION = ?  "
               + "   and   p.DEPT    = ?  "
               + "   and   to_char(p.VENDOR_CODE)  like decode(?,'000000','%',?) "
               + "  and    to_char(p.ORDER_STATUS) like decode(substr(?,0,1),'9','%',substr(?,0,1)) "
               + "   and   p.ORDER_DATE between to_date(?,'dd-mon-rrrr') and to_date(?,'dd-mon-rrrr')  "
               + "   and   nvl(p.CANCEL,'N') = 'N'  ";

    }else if(!genstn.equals("99999") && dept1.equals("999")){

      whr_cls1 = "  where  o.STATION = ? "
               + "  and    to_char(o.VENDOR_CODE)  like decode(?,'000000','%',?) "
               + "  and    to_char(o.ORDER_STATUS) like decode(substr(?,0,1),'9','%',substr(?,0,1)) "
               + "  and    o.ORDER_DATE between to_date(?,'dd-mon-rrrr') and to_date(?,'dd-mon-rrrr') "
               + "  and    nvl(o.CANCEL,'N') = 'N' ";

      whr_cls2 = "   where p.ORDER_ID = q.ORDER_ID(+) "
               + "   and   p.STATION = ?  "
               + "   and   to_char(p.VENDOR_CODE)  like decode(?,'000000','%',?) "
               + "  and    to_char(p.ORDER_STATUS) like decode(substr(?,0,1),'9','%',substr(?,0,1)) "
               + "   and   p.ORDER_DATE between to_date(?,'dd-mon-rrrr') and to_date(?,'dd-mon-rrrr')  "
               + "   and   nvl(p.CANCEL,'N') = 'N'  ";

    }else if(genstn.equals("99999") && !dept1.equals("999")){

      whr_cls1 = "  where  o.DEPT    = ? "
               + "  and    to_char(o.VENDOR_CODE)  like decode(?,'000000','%',?) "
               + "  and    to_char(o.ORDER_STATUS) like decode(substr(?,0,1),'9','%',substr(?,0,1)) "
               + "  and    o.ORDER_DATE between to_date(?,'dd-mon-rrrr') and to_date(?,'dd-mon-rrrr') "
               + "  and    nvl(o.CANCEL,'N') = 'N' ";

      whr_cls2 = "   where p.ORDER_ID = q.ORDER_ID(+) "
               + "   and   p.DEPT = ?  "
               + "   and   to_char(p.VENDOR_CODE)  like decode(?,'000000','%',?) "
               + "   and   to_char(p.ORDER_STATUS) like decode(substr(?,0,1),'9','%',substr(?,0,1)) "
               + "   and   p.ORDER_DATE between to_date(?,'dd-mon-rrrr') and to_date(?,'dd-mon-rrrr')  "
               + "   and   nvl(p.CANCEL,'N') = 'N'  ";
    }else{

     /* whr_cls1 = "  where  o.STATION = ? "
               + "  and    o.DEPT    = ? " */

      whr_cls1 = "  where  to_char(o.VENDOR_CODE)  like decode(?,'000000','%',?) "
               + "  and    to_char(o.ORDER_STATUS) like decode(substr(?,0,1),'9','%',substr(?,0,1)) "
               + "  and    o.ORDER_DATE between to_date(?,'dd-mon-rrrr') and to_date(?,'dd-mon-rrrr') "
               + "  and    nvl(o.CANCEL,'N') = 'N' ";

             /* + "   and   p.STATION = ?  "
               + "   and   p.DEPT    = ?  " */

      whr_cls2 = "   where p.ORDER_ID = q.ORDER_ID(+) "
               + "   and   to_char(p.VENDOR_CODE)  like decode(?,'000000','%',?) "
               + "   and   to_char(p.ORDER_STATUS) like decode(substr(?,0,1),'9','%',substr(?,0,1)) "
               + "   and   p.ORDER_DATE between to_date(?,'dd-mon-rrrr') and to_date(?,'dd-mon-rrrr')  "
               + "   and   nvl(p.CANCEL,'N') = 'N'  ";
    }


job_dsc="replace(replace(replace(replace(replace(nvl(o.JOB_DESC,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')"; 
vendor="replace(replace(replace(replace(replace(nvl(o.VENDOR_NAME,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')"; 
order_no="replace(replace(replace(replace(replace(nvl(o.ORDER_NO,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')"; 

qry_str = " select distinct" 
	+ "        nvl(d.ORDER_DEPT,'NP')," 
	+ "        nvl(a.ORD_NO,'NP'), "
	+ "        nvl(a.ORD_DT,'NP'), "
	+ "        a.SCOPE, "
	+ "        trim(NVL(m.EMP_FNAME,' '))||' '||trim(NVL(m.EMP_LNAME,' ')) ORD_BY, "
	+ "        nvl(a.VNDR_NM,'NP'), "
        + "        to_char(a.TOT_ORD_AMT) "
        + " from "
        + " (select o.STATION  STN, "
	+ "         o.DEPT     DEPT, "
	+           order_no + " ORD_NO," 
	+ "         o.ORDER_ID  ORD_ID, "
	+ "         o.ORDER_BY  ORD_BY, "
	+ "         to_char(o.ORDER_DATE,'DD-MON-RRRR') ORD_DT, "
        +           job_dsc + " SCOPE, "
	+           vendor  + " VNDR_NM, "
	+ "         case when  o.ORDER_TYPE = 'O' OR o.ORDER_TYPE = 'C' OR o.ORDER_TYPE = 'L' "
        + "              then  nvl(o.P1_TOTAL,0) "
        + "              else (nvl(o.P1_TOTAL,0)*o.BILL_FREQUENCY_REV) "
        + "         end  TOT_ORD_AMT "
        + "  from   ORBL_ORD_DTL  o "
        +    whr_cls1
        + "  ) a, "
        + "  (select p.STATION  STN, "
	+ "          q.ORDER_ID ORD_ID, "
	+ "          case when p.ORDER_TYPE = 'O' OR p.ORDER_TYPE = 'C' OR p.ORDER_TYPE = 'L' "
        + "               then sum(nvl(q.GROSS_AMOUNT,0)) "
	+ "               else sum(nvl(q.BILL_AMOUNT,0)) "
	+ "               end  BILLED_AMT "
        + "   from  ORBL_ORD_DTL  p, "
	+ "         ORBL_BILL_DTL q "
        +     whr_cls2
        + "   group by p.STATION, "
	+ "            q.ORDER_ID, "
	+ "            p.ORDER_TYPE "
        + "   ) b, "
        + "    ORBL_CD_DEPT  d, "
        + "    ADM_EMP_MST   m "
        + "    where a.ORD_ID  = b.ORD_ID(+) "
        + "    and   d.STATION = a.STN(+) "
        + "    and   d.DEPT    = a.DEPT(+) "
        + "    and   a.ORD_BY  = m.EMP_CODE(+) "
        + "    and   (0.95*a.TOT_ORD_AMT) > nvl(b.BILLED_AMT,0)"
        + "    order by 2";

    ps = mk.con.prepareStatement(qry_str,ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

/*System.out.println("BILL PENDING:QUERY "+qry_str);*/

    if(!genstn.equals("99999") && !dept1.equals("999")){

          ps.setString(1,genstn);
          ps.setString(2,dept1);
          ps.setString(3,vnd_cd);
          ps.setString(4,vnd_cd);
          ps.setString(5,ord);
          ps.setString(6,ord);
          ps.setString(7,st_dt1);
          ps.setString(8,end_dt1);

          ps.setString(9,genstn);
          ps.setString(10,dept1);
          ps.setString(11,vnd_cd);
          ps.setString(12,vnd_cd);
          ps.setString(13,ord);
          ps.setString(14,ord);
          ps.setString(15,st_dt1);
          ps.setString(16,end_dt1);

    
    }else if(!genstn.equals("99999") && dept1.equals("999")){

          ps.setString(1,genstn);
          ps.setString(2,vnd_cd);
          ps.setString(3,vnd_cd);
          ps.setString(4,ord);
          ps.setString(5,ord);
          ps.setString(6,st_dt1);
          ps.setString(7,end_dt1);

          ps.setString(8,genstn);
          ps.setString(9,vnd_cd);
          ps.setString(10,vnd_cd);
          ps.setString(11,ord);
          ps.setString(12,ord);
          ps.setString(13,st_dt1);
          ps.setString(14,end_dt1);

    }else if(genstn.equals("99999") && !dept1.equals("999")){

          ps.setString(1,dept1);
          ps.setString(2,vnd_cd);
          ps.setString(3,vnd_cd);
          ps.setString(4,ord);
          ps.setString(5,ord);
          ps.setString(6,st_dt1);
          ps.setString(7,end_dt1);

          ps.setString(8,dept1);
          ps.setString(9,vnd_cd);
          ps.setString(10,vnd_cd);
          ps.setString(11,ord);
          ps.setString(12,ord);
          ps.setString(13,st_dt1);
          ps.setString(14,end_dt1);


    }else{

          ps.setString(1,vnd_cd);
          ps.setString(2,vnd_cd);
          ps.setString(3,ord);
          ps.setString(4,ord);
          ps.setString(5,st_dt1);
          ps.setString(6,end_dt1);

          ps.setString(7,vnd_cd);
          ps.setString(8,vnd_cd);
          ps.setString(9,ord);
          ps.setString(10,ord);
          ps.setString(11,st_dt1);
          ps.setString(12,end_dt1);


    }

    rs = ps.executeQuery();

    while(rs.next()){
          cnt_rs++;
    }

    if(cnt_rs > 0){
%>
<label style="POSITION: absolute; top:210px; left:10px;">
<div id="printReady" style="overflow:scroll; height:430px; background:#DBF2DC;">
<center>

<%
    SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
    String DisplayDate          = formatdate.format(new java.util.Date());
    String disp_basis           = new String();
   
    String genstn2 = new String();
    String dept2 = new String();

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

<table width="100%" >
<tr >
<td align=left >  <font color="#400040" size="3"> Date : <%= DisplayDate %> </font> </td>
<td align=center> <font color="#400040" size="3"><b>ORDERS HAVING PENDING BILLS</b></font></td>
<td align=right > <font color="#400040" size="3">Page :1</font> </td>
</tr>
<tr >
<td align=center colspan="3">
    <font color="#400040" size="3"><b>BETWEEN <%=st_dt1%> AND <%=end_dt1%></b> </font>
</td>
</tr>
</table>

<table  border="1" width="100%" class= "rcrds">

<tr bgcolor="#DBF2DC">
    <td colspan="7" align="center" class= "rcrdsEle" >
        <font color="#400040" size="2">
<% if(!sGenstnCd.equals("019")){ %>
       <b>GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : <%=dept2%></b>
<% } else{ %>
       <b>GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : CTM</b>
<% } %>
       </font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font color="RED" size="1">
      * IN CASE OF TERM OR RATE CONTRACT TOTAL ORDER AMOUNT = ORDER AMOUNTxNO OF TERM 
</font>
    </td>
</tr>

      <tr bgcolor="#DBF2DC">
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Srl</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Dept</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Order No.</b></font></td>
     	  <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Order Dt.</b></font></td>
     	  <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Issued By</b></font></td>
     	  <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Vendor</b></font></td>
     	  <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Total Order Amount(Rs.)*</b></font></td>
     </tr>
<%
    rs.beforeFirst();


    while(rs.next()){
    if(srl_num>0 && srl_num % no_row_pg == 0){
%>
</table>
<p class="pgbrk">&nbsp;</p>
<table width="98%" >
<tr >
<td align=left >  <font color="#400040" size="3"> Date : <%= DisplayDate %> </font> </td>
<td align=center> <font color="#400040" size="3"><b>ORDERS HAVING PENDING BILLS</b></font></td>
<td align=right > <font color="#400040" size="3">Page :<%= (srl_num / no_row_pg)+1%></font> </td>
</tr>
<tr >
<td align=center colspan="3" >
    <font color="#400040" size="3"><b>BETWEEN <%=st_dt1%> AND <%=end_dt1%></b> </font>
</td>
</tr>
</table>

<table  border="1" width="100%" class= "rcrds">

<tr bgcolor="#DBF2DC">
    <td colspan="7" align="center" class= "rcrdsEle" >
        <font color="#400040" size="2">
<% if(!sGenstnCd.equals("019")){ %>
       <b>GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : <%=dept2%></b>
<% } else{ %>
       <b>GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : CTM</b>
<% } %>
       </font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font color="RED" size="1">
      * IN CASE OF TERM OR RATE CONTRACT TOTAL ORDER AMOUNT = ORDER AMOUNTxNO OF TERM 
</font>
    </td>
</tr>
      <tr bgcolor="#DBF2DC">
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Srl</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Dept</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Order No.</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Order Dt.</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Issued By</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Vendor</b></font></td>
          <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Total Order Amount(Rs.)*</b></font></td>
     </tr>

<%
    } 
          srl_num++;
          ord_dpt = rs.getString(1);
          ord_num = rs.getString(2);
          ord_dt  = rs.getString(3);
          scope   = rs.getString(4);
          ord_by  = rs.getString(5);
          vndr_nm = rs.getString(6);
          ord_amt = rs.getString(7);

      if(srl_num%2 == 0)
           clsVar = "evenCls";
      else
           clsVar = "oddCls";

%>
 <tr class="<%= clsVar %>" onMouseover="this.style.backgroundColor='#FFFF77'" onMouseout="this.style.backgroundColor=''">

     <td align="center" class= "rcrdsEle"><font size=2 color="#800040"><%=srl_num%></font></td>
     <td align="center" class= "rcrdsEle"><font size=2 color="#800040"><%=ord_dpt%></font></td>
     <td align="center" class= "rcrdsEle"><font size=2 color="#800040">
                                          <p title='<%=scope%>'>'<%=ord_num.trim()%>'</p></font></td>
     <td align="center" class= "rcrdsEle"><font size=2 color="#800040"><%=ord_dt%></font></td>
     <td align="left"   class= "rcrdsEle"><font size=2 color="#800040"><%=ord_by%></font></td>
     <td align="left"   class= "rcrdsEle"><font size=2 color="#800040"><%=vndr_nm%></font></td>
     <td align="right"  class= "rcrdsEle"><font size=2 color="#800040"><%=ord_amt%></font></td>

 </tr>

<% } 
   rs.close();
   ps.close();
%>

</table>


</center>
</div>
</label>
<%  }else{ %>

<br><br>
<font  size="4"  color="#400000">
<b>NO RECORDS FOUND</b>
</font>

<%
    }
  
      
}catch(Exception ef){
 ef.printStackTrace();
}

}

}catch(Exception ef1){
 ef1.printStackTrace();
}finally{
 mk.con.close();
}
%>


</body>
</html>
