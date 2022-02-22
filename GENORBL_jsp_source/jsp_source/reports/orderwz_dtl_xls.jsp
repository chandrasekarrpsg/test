<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType= "application/vnd.ms-excel"  %>
<%  response.setHeader("Content-Disposition", "attachment; filename=vnd_ord_dtl.xls");%>


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

String genstn    = request.getParameter("gstn");
String dept1     = request.getParameter("dept");
String st_dt1    = request.getParameter("frm_dt");
String end_dt1   = request.getParameter("to_dt");
String basis     = request.getParameter("basis");
String vnd_cd    = request.getParameter("vnd_cd");
String vnd_nm    =request.getParameter("vnd_nm");
String ord_tp    =request.getParameter("ord_tp");
String ord_dsc   =request.getParameter("ord_desc");

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

if(st_dt1!= null && end_dt1!= null && dept1 != null){

        System.out.println("1. DEB CHAK New Rep:GS "+genstn);
        System.out.println("1. DEB CHAK New Rep:Dept "+dept1);

        PreparedStatement ps = null ;
        ResultSet rs         = null ;

        String qry_str  = new String();
        String cls      = new String();
        String whr_cls  = new String();
        String job_dsc  = new String();

        int    flag    = 0;
        int    srl_num = 0;

        String genstn2    = new String();
        String dept2      = new String();
        String disp_basis = new String();

        String ord_num   = new String();
        String ord_desc  = new String();
        String ord_dept  = new String();
        String bill_id   = new String();
        String bill_no   = new String();
        String bill_dt   = new String();
        String bl_rlz_dt = new String();
        String bl_rlz_by = new String();
        String fn_rcv_dt = new String();
        Double bill_amt  = 0.00;


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
        disp_basis = " BILLS RELEASED FOR "+vnd_nm+" BY "+genstn2+" FOR "+ord_dsc+" ORDER ON THE BASIS OF BILL RELEASED AMOUNT";
}else{
        disp_basis = " BILLS RELEASED FOR "+vnd_nm+" BY "+genstn2+" FOR "+ord_dsc+" ORDER ON THE BASIS OF FINANCE RECEIVED AMOUNT";
}

try{

SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
String DisplayDate= formatdate.format(new java.util.Date());

%>

<br><br>

<label style="POSITION: absolute; top:160px; left:10px;">

<div id="xls_spcl" style="overflow:scroll; height:480px; background:#DBF2DC;">


<table width="100%">
<tr>
    <td align=left   colspan="1"> <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
    <td align=center colspan="8"><font color="#400040" size="3"><b><%=disp_basis%></b></font></td>
</tr>
<tr >
<td align=center colspan="9">
    <font color="#400040" size="3"><b>BETWEEN <%=st_dt1%> AND <%=end_dt1%></b> </font>
</td>
</tr>
</table>

<table width="100%" style="border: 1px solid black"; class="rcrds">

     <tr bgcolor="#DBF2DC">
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Sl</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Order Number</b></font></td>
          <td align="center"  rowspan="2" class= "rcrdsEle"><font size=2 color="#400040"><b>Dept</b></font></td>
          <td align="center"  colspan="6" class= "rcrdsEle"><font size=2 color="#400040"><b>Bill Details</b></font></td>
     </tr>

     <tr bgcolor="#DBF2DC">
          <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Id</b></font></td>
          <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Number</b></font></td>
          <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Date</b></font></td>
          <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Released On</b></font></td>
          <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Finance Received On</b></font></td>
          <td align="center" class= "rcrdsEle"><font size=2 color="#400040"><b>Amount</b></font></td>
     </tr>

<%
        if(basis.equals("B")){
                 cls =  " B.BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
        }else{
                 cls =  " B.FINANCE_RECVD_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
        }

        if(!genstn.equals("99999") && !dept1.equals("999")){
           
            whr_cls =" WHERE  O.ORDER_ID= B.ORDER_ID               " 
                    +" AND    O.STATION = D.STATION                " 
                    +" AND    O.DEPT    = D.DEPT                   " 
                    +" AND    O.STATION = ?                        " 
                    +" AND    O.DEPT    = ?                        " 
                    +" AND " + cls              
                    +" AND    O.VENDOR_CODE = ?                    " 
                    +" AND    O.ORDER_TYPE = ?                         " 
                    +" AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+)  ";

        }else if(!genstn.equals("99999") && dept1.equals("999")){

            whr_cls =" WHERE  O.ORDER_ID= B.ORDER_ID               " 
                    +" AND    O.STATION = D.STATION                " 
                    +" AND    O.DEPT    = D.DEPT                   " 
                    +" AND    O.STATION = ?                        " 
                    +" AND " + cls              
                    +" AND    O.VENDOR_CODE = ?                    " 
                    +" AND    O.ORDER_TYPE = ?                         " 
                    +" AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+)  ";

        }else if(genstn.equals("99999") && !dept1.equals("999")){
              if(!sGenstnCd.equals("019")){

                 whr_cls  = " WHERE  O.DEPT    = ? "
                          + " AND    D.ORDER_DEPT = ? "
                          + " AND    O.DEPT = D.DEPT "
                          + " AND    O.STATION = D.STATION "
                          + " AND " + cls
                          + " AND    O.ORDER_ID  = B.ORDER_ID "
                          + " AND    O.VENDOR_CODE = ?        "
                          + " AND    O.ORDER_TYPE = ?                         " 
                          + " AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+) ";
              }else{

                 whr_cls  = " WHERE  O.DEPT    = ? "
                          + " AND    O.STATION = D.STATION "
                          + " AND    O.DEPT    = D.DEPT                   " 
                          + " AND " + cls
                          + " AND    O.ORDER_ID  = B.ORDER_ID "
                          + " AND    O.VENDOR_CODE = ?        "
                          + " AND    O.ORDER_TYPE = ?                         " 
                          + " AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+) ";
              }
        }else{

             whr_cls = " WHERE  " + cls
                     + " AND    O.ORDER_ID    = B.ORDER_ID "
                     + " AND    O.STATION     = D.STATION "
                     + " AND    O.DEPT    = D.DEPT                   " 
                     + " AND    O.VENDOR_CODE = ?        "
                     + " AND    O.ORDER_TYPE = ?                         " 
                     + " AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+) ";

        }


job_dsc="replace(replace(replace(replace(replace(nvl(O.JOB_DESC,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')";
            
           qry_str=" SELECT NVL(TRIM(O.ORDER_NO),'NP')    ORD_NO,                                 " 
	          +  job_dsc + " JOB_DESC,                                                        "
	          +" D.ORDER_DEPT  DEPT,                                                          "
	          +" 'N-'||B.BILL_ID||DECODE(B.URGENT_PAYMENT,'Y','*',''),                        " 
	          +" B.BILL_NO BILL_NO,                                                           " 
	          +" TRIM(TO_CHAR(B.BILL_DATE,'DD-MON-RRRR')) BILL_DT,                            "
                  +" TRIM(TO_CHAR(B.BILL_RELEASE_DATE,'DD-MON-RRRR')) RLZ_DT,                     " 
	          +" TRIM(NVL(A.EMP_FNAME,' '))||' '||TRIM(NVL(A.EMP_LNAME,' '))  BILL_RLZD_BY,   " 
	          +" NVL(TRIM(TO_CHAR(B.FINANCE_RECVD_DATE,'DD-MON-RRRR')),'NP') FNC_RCV_DT,      " 
	          +" NVL(B.BILL_AMOUNT,0.00) BILL_AMT                                             " 
                  +" FROM   ORBL_BILL_DTL   B,                                                    " 
                  +"        ORBL_ORD_DTL    O,                                                    " 
	          +"        ADM_EMP_MST     A,                                                    "
	          +"        ORBL_CD_DEPT    D                                                     "
                  + whr_cls
                  +" ORDER BY 1                                                                   ";

           ps = mk.con.prepareStatement(qry_str);

        if(!genstn.equals("99999") && !dept1.equals("999")){

System.out.println("ORDERWZ_DTL_XLS : In block 1");
          
            ps.setString(1,genstn);
            ps.setString(2,dept1);
            ps.setString(3,st_dt1);
            ps.setString(4,end_dt1);
            ps.setString(5,vnd_cd);
            ps.setString(6,ord_tp);


        }else if(!genstn.equals("99999") && dept1.equals("999")){

System.out.println("ORDERWZ_DTL_XLS : In block 2");

            ps.setString(1,genstn);
            ps.setString(2,st_dt1);
            ps.setString(3,end_dt1);
            ps.setString(4,vnd_cd);
            ps.setString(5,ord_tp);

        }else if(genstn.equals("99999") && !dept1.equals("999")){
              if(!sGenstnCd.equals("019")){

System.out.println("ORDERWZ_DTL_XLS : In block 3A");

                  String temp_dep = dept1.substring(0,dept1.indexOf("-"));
                  String dep_name = dept1.substring(dept1.indexOf("-")+1);

                  ps.setString(1,temp_dep);
                  ps.setString(2,dep_name);
                  ps.setString(3,st_dt1);
                  ps.setString(4,end_dt1);
                  ps.setString(5,vnd_cd);
                  ps.setString(6,ord_tp);

              }else{

System.out.println("ORDERWZ_DTL_XLS : In block 3B");

                  ps.setString(1,dept1);
                  ps.setString(2,st_dt1);
                  ps.setString(3,end_dt1);
                  ps.setString(4,vnd_cd);
                  ps.setString(5,ord_tp);

              }
        }else{

System.out.println("ORDERWZ_DTL_XLS : In block 4");

                  ps.setString(1,st_dt1);
                  ps.setString(2,end_dt1);
                  ps.setString(3,vnd_cd);
                  ps.setString(4,ord_tp);

        }

        rs = ps.executeQuery();

        String clsVar = "";

        while(rs.next()){

        flag = 1;
        srl_num ++;

        ord_num   = rs.getString(1); 
        ord_desc  = rs.getString(2); 
        ord_dept  = rs.getString(3); 
        bill_id   = rs.getString(4); 
        bill_no   = rs.getString(5); 
        bill_dt   = rs.getString(6); 
        bl_rlz_dt = rs.getString(7); 
        bl_rlz_by = rs.getString(8); 
        fn_rcv_dt = rs.getString(9); 
        bill_amt  = rs.getDouble(10); 
  
        if(srl_num%2==0){
           clsVar = "evenCls";
        }else{
           clsVar = "oddCls";
        }         
%>
<tr class="<%= clsVar %>" onMouseover="this.style.backgroundColor='#FFFF77'" onMouseout="this.style.backgroundColor=''">

    <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=srl_num%></font></td>

<%  if (!ord_num.equals("NP")){ %>
    <td align="left" class= "rcrdsEle" ><font size=1 color="#400040"><p title="<%=ord_desc%>"><%=ord_num%></p></font></td>
<% } else { %>
    <td align="left" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
<% }        %>

    <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_dept%></font></td>
    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_id%></font></td>
    <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_no%></font></td>
    <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_dt%></font></td>
    <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><p title="<%=bl_rlz_by%>"><%=bl_rlz_dt%></p></font></td>

<%  if (!fn_rcv_dt.equals("NP")){ %>
         <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=fn_rcv_dt%></font></td>
<% } else { %>
         <td align="center" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
<% } %>

    <td align="right" class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_amt%></font></td>
</tr>

<%
        }

%>
</table>

<% if(flag == 0){  %>
<font size=3> NO RECORDS FOUND </font>

<% } %>

</div

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
</body>
</html>
