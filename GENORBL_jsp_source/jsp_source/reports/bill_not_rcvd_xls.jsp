<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType= "application/vnd.ms-excel"  %>
<%  response.setHeader("Content-Disposition", "attachment; filename=bill_not_rcvd.xls");%>


<head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<script type="text/javascript" src="Common_Funcs.js"></script>
<script src="js/sel_date.js"></script>

<title>BILLS RELEASED BY STATION BUT NOT RECEIVED AT FINANCE</title>

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

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();

%>

<body>

<center>
<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3">
<font face="Albertus Extra Bold" size="3" color="#400040">
<b>BILLS RELEASED BY STATION BUT NOT RECEIVED AT FINANCE</b>
</font>
<br><br>

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
        int    no_row_pg = 34 ;

	String stn_nm  = new String();
	String dptmnt  = new String();
	String ord_num = new String();
	String ord_desc= new String();
	String bill_id = new String();
	String bill_no = new String();
	String bill_dt = new String();
	String rlzd_dt = new String();
	String cert_by = new String();
	String bill_amt= new String();
	String bill_ref= new String();

	String clsVar = "";


        PreparedStatement ps1 = null ;
        ResultSet rs1         = null ;


        String genstn2 = new String();
        String dept2   = new String();


        ResultSet rs51=null;
        PreparedStatement ps51=null;

try{

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

<div>

<center>

<%

SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
String DisplayDate= formatdate.format(new java.util.Date());
String disp_basis = "BILLS RELEASED BUT NOT RECEIVED BY FINANCE"; 

%>

<table width="100%" >
<tr>
<td align=left   colspan=1>  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
</tr>
<tr>
<td align=center colspan=12> <font color="#400040" size="3"><b><%=disp_basis%></b></font></td>
</tr>

<tr >
<td align=center colspan="11" >
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
    <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Sl</b></font></td>
    <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Station</b></font></td>
    <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Dept</b></font></td>
    <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Order Number</b></font></td>
    <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Order Description</b></font></td>
    <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Bill Id</b></font></td>
    <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Bill Number</b></font></td>
    <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Bill Date</b></font></td>
    <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Bill Amount (In Rs.)</b></font></td>
    <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Released On</b></font></td>
    <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Released By</b></font></td>
    <td align="center"  class= "rcrdsEle"><font size=2 color="#400040"><b>Bill Ref Id</b></font></td>
</tr>

<%
        System.out.println("3.DEB CHAK  New Rep:GS "+genstn);
        System.out.println("3.DEB CHAK  New Rep:Dept "+dept1);

        cls =  " AND B.BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;

	if(!genstn.equals("99999") && !dept1.equals("999")){

        whr_cls1=" WHERE  O.station = ?                       "     
                +" AND    O.dept    = ?                       "    
                +  cls
                +" AND    O.order_id  = B.order_id            " 
                +" AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+) "
                +" AND    O.STATION = D.STATION               "
                +" AND    O.DEPT    = D.DEPT                  "
                +" AND    B.FINANCE_RECVD_DATE IS NULL        ";

        whr_cls2=" WHERE  B.station = ?                       "     
                +" AND    B.dept    = ?                       "    
                +  cls
                +" AND    B.CERT_BY = A.EMP_CODE(+)           "
                +" AND    B.STATION = D.STATION               "
                +" AND    B.DEPT    = D.DEPT                  "
                +" AND    B.FINANCE_RECVD_DATE IS NULL        ";

	}else if(!genstn.equals("99999") && dept1.equals("999")){

        whr_cls1=" WHERE  O.station = ?                       "     
                +  cls
                +" AND    O.order_id  = B.order_id            " 
                +" AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+) "
                +" AND    O.STATION = D.STATION               "
                +" AND    O.DEPT    = D.DEPT                  "
                +" AND    B.FINANCE_RECVD_DATE IS NULL        ";

        whr_cls2=" WHERE  B.station = ?                       "     
                +  cls
                +" AND    B.CERT_BY = A.EMP_CODE(+)           "
                +" AND    B.STATION = D.STATION               "
                +" AND    B.DEPT    = D.DEPT                  "
                +" AND    B.FINANCE_RECVD_DATE IS NULL        ";

		 
	}else if(genstn.equals("99999") && !dept1.equals("999")){
	   
           if(!sGenstnCd.equals("019")){

	   whr_cls1 ="WHERE  O.dept    = ? 			    "
                    +"AND    D.ORDER_DEPT = ?                       "
                    +"AND    O.DEPT = D.DEPT                        "
                    +"AND    O.STATION = D.STATION                  "
                    + cls
		    +"AND    O.order_id  = B.order_id 		    "
                    +"AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+)   "
                    +"AND    B.FINANCE_RECVD_DATE IS NULL   ";

	   whr_cls2 ="WHERE  B.DEPT    = ? 			    "
                    +"AND    D.ORDER_DEPT = ?                       "
                    +"AND    B.DEPT = D.DEPT                        "
                    +"AND    B.STATION = D.STATION                  "
	            + cls	
	            +"AND    B.CERT_BY     = A.EMP_CODE(+)	    "
                    +"AND    B.FINANCE_RECVD_DATE IS NULL   ";
     
          }else{

           whr_cls1 ="WHERE  O.dept    = ?                         "
                    + cls
                    +"AND    O.order_id  = B.order_id               "
                    +"AND    O.DEPT = D.DEPT                        "
                    +"AND    O.STATION = D.STATION                  "
                    +"AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+)    "
                    +"AND    B.FINANCE_RECVD_DATE IS NULL   ";

           whr_cls2 ="WHERE  B.DEPT    = ?                          "
                    + cls
                    +"AND    B.STATION = D.STATION               "
                    +"AND    B.DEPT    = D.DEPT                  "
                    +"AND    B.CERT_BY     = A.EMP_CODE(+)          "
                    +"AND    B.FINANCE_RECVD_DATE IS NULL   ";
          }

	}else{

	    whr_cls1= "WHERE "  +  cls
		    + "AND    O.order_id  = B.order_id 		    "
                    + "AND    O.DEPT = D.DEPT                        "
                    + "AND    O.STATION = D.STATION                  "
                    + "AND    B.BILL_CERTIFIED_BY = A.EMP_CODE(+)   "
                    + "AND    B.FINANCE_RECVD_DATE IS NULL   ";

	    whr_cls2= "WHERE "  +  cls	
                    + "AND    B.STATION = D.STATION               "
                    + "AND    B.DEPT    = D.DEPT                  "
	            + "AND    B.CERT_BY     = A.EMP_CODE(+)	    "
                    + "AND    B.FINANCE_RECVD_DATE IS NULL   ";

	}
	
job_desc1="replace(replace(replace(replace(replace(nvl(O.JOB_DESC,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')";
job_desc2="replace(replace(replace(replace(replace(nvl(B.DESCRIP,' '),'\\','\\\\'),'\"','&quot;'),'<','&lt;'),chr(10),'\n'),'>','&gt;')";


           qry_str1 = " SELECT DISTINCT                                                                           " 
                    + "        DECODE(O.ORD_ORGN_STN,'002','SGS',                                                 "
                    + "                              '013','NCGS',                                                "
                    + "                              '014','TGS',                                                 "
                    + "                              '016','BBGS',                                                "
                    + "                              '019','CTM',                                                 "
                    + "                              '042','ED(GE)') STN,                                         "
                    + "         D.ORDER_DEPT DPT,                                                                 "
                    + "         NVL(TRIM(O.ORDER_NO),'NP')      ORD_NUM,                                          "
                    +           job_desc1 + "  ORDR_DESC,		                                          "
                    + "         'N-'||B.BILL_ID||DECODE(B.URGENT_PAYMENT,'Y','*','')      BILL_ID,                "
                    + "         TO_CHAR(B.BILL_NO)       BILL_NUM,                                                "
                    + "         TO_CHAR(B.BILL_DATE,'DD-MON-YYYY') BILL_DT,                                       "   
                    + "         TO_CHAR(NVL(B.BILL_AMOUNT,0),'999,99,99,990.99')  BILL_AMT,                       "
                    + "         TO_CHAR(B.BILL_RELEASE_DATE,'DD-MON-YYYY') BILL_RLZ_DT,                           "
                    + "         TRIM(NVL(A.EMP_FNAME,' '))||' '||trim(NVL(A.EMP_LNAME,' '))  BILL_RLZD_BY,        "
                    + "         NVL(TO_CHAR(B.BILL_REF_ID),'NP') BILL_REF_ID                                      "
                    + "  FROM    ORBL_BILL_DTL   B,                                                               "        
                    + "          ORBL_ORD_DTL    O,                                                               "
                    + "          ADM_EMP_MST     A,                                                               "
                    + "  	 ORBL_CD_DEPT    D                                                                "
                    +    whr_cls1 
                    + "  UNION                                                                                    "                       
                    + "  SELECT DISTINCT                                                                          "
                    + "         DECODE(B.STATION,'002','SGS',                                                     "
                    + "                          '013','NCGS',                                                    "
                    + "                          '014','TGS',                                                     "
                    + "                          '016','BBGS',                                                    "
                    + "                          '019','CTM',                                                     "
                    + "                          '042','ED(GE)') STN,                                             "
                    + "         D.ORDER_DEPT DPT,	                                                          "
                    + "         NVL(TRIM(B.ORDNO),'NP')       ORD_NUM,                                            "       
                    +           job_desc2      + "  ORDR_DESC,                                                    "            
                    + "         'S-'||B.BILLREF||DECODE(B.URGENT_PAYMENT,'Y','*','')   BILL_ID,                   "
                    + "         TO_CHAR(B.BILL_NO)       BILL_NUM,                                                "
                    + "         TO_CHAR(B.BILL_DT,'DD-MON-YYYY') BILL_DT,                                         "             
                    + "         TO_CHAR(NVL(B.BILL_AMT,0),'999,99,99,990.99')  BILL_AMT,                          "  
                    + "         TO_CHAR(B.BILL_RELEASE_DATE,'DD-MON-YYYY') BILL_RLZ_DT,                           "
                    + "         TRIM(NVL(A.EMP_FNAME,' '))||' '||trim(NVL(A.EMP_LNAME,' '))  BILL_RLZD_BY,        "
                    + "         NVL(TO_CHAR(B.BILL_REF_ID),'NP') BILL_REF_ID                                      "
                    + "  FROM    ORBL_SPBILL_DTL B,                                                               "        
                    + "          ORBL_VENDOR_MST V,                                                               "
                    + "          ADM_EMP_MST     A,                                                               "
                    + "          ORBL_CD_DEPT    D                                                                "
                    +    whr_cls2 
                    + "  ORDER BY 1,3 DESC                                                                        ";

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
                dptmnt    = rs1.getString(2);
		ord_num   = rs1.getString(3); 
		ord_desc  = rs1.getString(4);
		bill_id   = rs1.getString(5);
		bill_no   = rs1.getString(6);
		bill_dt   = rs1.getString(7);
		bill_amt  = rs1.getString(8);
		rlzd_dt   = rs1.getString(9);
		cert_by   = rs1.getString(10);
		bill_ref  = rs1.getString(11);

                 
        if(srl_num%2==0){
           clsVar = "evenCls";
        }else{
           clsVar = "oddCls";
        }

//System.out.println("BILL RLZ SRL: "+srl_num+" ORD NO: "+ord_num);

%>
<tr class="<%= clsVar %>" onMouseover="this.style.backgroundColor='#FFFF77'" onMouseout="this.style.backgroundColor=''">

         <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=srl_num%></font></td>
	 <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=stn_nm%></font></td>
	 <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=dptmnt%></font></td>

<%  if (!ord_num.equals("NP")){ %>

	  <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_num%></font></td>
	  <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=ord_desc%></font></td>

<% } else { %>
	  <td align="center" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
	  <td align="center" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
<% } %>
	  <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_id%></font></td>
	  <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_no%></font></td>
          <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_dt%></font></td>
	  <td align="right"  class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_amt%></font></td>
	  <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=rlzd_dt%></font></td>
	  <td align="left"   class= "rcrdsEle" ><font size=1 color="#400040"><%=cert_by%></font></td>

<%  if (!bill_ref.equals("NP")){ %>
	  <td align="center" class= "rcrdsEle" ><font size=1 color="#400040"><%=bill_ref%></font></td>
<% } else { %>
	  <td align="center" class= "rcrdsEle" ><font size=1 color="#400040">&nbsp;</font></td>
<% } %>
</tr>

<%  } %>
</table>
<%

        ps1.close();
        rs1.close();

        if(flag == 0){
%>
          <br><br>
        <font  size="4"  color="#400000"> <b>NO RECORDS FOUND</b> </font>
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



