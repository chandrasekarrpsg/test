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

<title>VENDOR-WISE COMPONENTS OF BILLS RELEASED</title>

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

String st_dt  = request.getParameter("st_dt");
String end_dt = request.getParameter("end_dt");
MakeConnectionGENORBL mk = null;

try 

{

mk = new MakeConnectionGENORBL();

%>

<body background="GS1.jpg" onLoad="prescript();">

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

<div id="footer">
<div id="container">
<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:25px; top:15px" width="170" height="70">

   <label style="POSITION: absolute; LEFT: 660px; top:650px"  class="style5" ><b>2012 &copy Developed by I.T. Department</b></label>

</div>
</div>


<center>
<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3">
<font face="Albertus Extra Bold" size="5" color="#400040">
<b>VENDOR-WISE COMPONENTS OF BILLS RELEASED<b>
</font>
<br><br>

<table>
<tr>
<td><font size="4" color="#400040"><b>GENERATING STATION</b></font></td>

<%

     if(sGenstnCd.equals("002") ||  sGenstnCd.equals("013") || sGenstnCd.equals("014") || sGenstnCd.equals("016") ){
     System.out.println("MRITYUNJOY 1 "+sGenstnCd);

%>

<td><%=sStnshrtNm%></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>DEPARTMENT</b></font></td>
<td>
<select name="s1" id="s1">
<%
    try {

      String dept_nm = new String() ;
      String dept_cd  = new String() ;

      PreparedStatement ps = null ;
      ResultSet rs = null ;

      ps = mk.con.prepareStatement("select 'ALL' DPT_NM,'999' DPT_CD   " +
                                   "from dual                          " +
                                   "union                              " +
                                   "select distinct ORDER_DEPT,DEPT    " +
                                   "from   orbl_cd_dept                " +
                                   "where  STATION = ?                 " +
                                   "and    DEPT <> '30'                " +
                                   "order by 1                         " ) ;

      ps.setString(1,sGenstnCd);

      rs = ps.executeQuery() ;

      while(rs.next()) {
            dept_nm = rs.getString(1) ;
            dept_cd = rs.getString(2) ;
%>
<option value="<%=dept_cd%>"><%=dept_nm%></option>
<%
      }

      rs.close() ;
      ps.close() ;

  }catch(Exception e1){
              e1.printStackTrace();
  }
%>
</select>
</td>
<%

} else if  (sGenstnCd.equals("019")){
     System.out.println("MRITYUNJOY 2 "+sGenstnCd);

%>
<td>
<select name="s2" id="s2" >
<%
           try {
                      String   stn_cd  =   new String();
                      String   stn_nm  =   new String();

                      PreparedStatement ps = null ;
                      ResultSet rs                    = null ;

                      ps = mk.con.prepareStatement("select '99999' STN_CD,'ALL' STN_NM  " +
                                                   "from dual                           " +
                                                   "union                               " +
                                                   "select s.ORBL_STATION_CD STN_CD,    " +
                                                   "       s.STATION_SHT_DESC STN_NM    " +
                                                   "from   CD_STATION s                 " +
                                                   "where  s.ORBL_STATION_CD <> '042'   " +
                                                   "order by 2                          " ) ;
                      rs = ps.executeQuery() ;

                      while(rs.next()){
                                  stn_cd  = rs.getString(1) ;
                                  stn_nm = rs.getString(2) ;
 %>

<option value="<%=stn_cd%>"><%=stn_nm%></option>

<%
                      }

                      rs.close();
                      ps.close();

          }catch(Exception e2){
                      e2.printStackTrace();
          }
%>

</select>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>DEPARTMENT</b></font></td>
<td>
<select name="s1" id="s1">
<option value="30">CTM</option>
</select>
</td>
<%
}else{
     System.out.println("MRITYUNJOY 3 "+sGenstnCd);

%>

<td>
<select name="s2" id="s2"  onChange="getDeptDesc()">
<option>SELECT</option>
<%
           try {
                      String   stn_cd  =   new String();
                      String   stn_nm  =   new String();

                      PreparedStatement ps = null ;
                      ResultSet rs         = null ;

                      ps = mk.con.prepareStatement("select '99999' STN_CD,'ALL' STN_NM  " +
                                                   "from dual                           " +
                                                   "union                               " +
                                                   "select s.ORBL_STATION_CD STN_CD,    " +
                                                   "       s.STATION_SHT_DESC STN_NM    " +
                                                   "from   CD_STATION s                 " +
                                                   "order by 2                          " ) ;
                      rs = ps.executeQuery() ;

                      while(rs.next()){
                                  stn_cd  = rs.getString(1) ;
                                  stn_nm = rs.getString(2) ;
 %>

<option value="<%=stn_cd%>"><%=stn_nm%></option>

<%
                      }

                      rs.close();
                      ps.close();

          }catch(Exception e3){
                      e3.printStackTrace();
          }
%>

</select>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>DEPARTMENT</b></font></td>
<td>
<select name="s1" id="s1">
</td>
<%
}
%>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>FROM</b></font></td>
<td><input type="text" name="st_dt"  id= "st_dt" size="11" value="" onClick="sel_date_cls('st_dt','js/')"></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>TO</b></font></td>
<td><input type="text" name="end_dt" id= "end_dt" size="11" value="" onClick="sel_date_cls('end_dt','js/')"></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>BASIS</b></font></td>
<td>
 <select name="s3" id="s3">
        <option value="F">Finance Receive Date</option>
        <option value="B">Bill Release Date</option>
</select>
</td>
</table>

<form method="POST" name="sampleform" id="f1" action="bill_cmpnts_vndrwz.jsp" valign="middle" align="center" >
      <input type ="hidden" id="h1" name="hst_dt">
      <input type ="hidden" id="h2" name="hend_dt">
      <input type ="hidden" id="h3" name="hdept">
      <input type ="hidden" id="h4" name="hgen" >
      <input type ="hidden" id="h5" name="hbasis">
      <input type ="hidden" id="h6" name="hGS" value="<%=sGenstnCd%>">
</form>



<TABLE>
<TR>
<TD align="center"><input type = "button" value="SUBMIT" onClick="DefaultValue();"></TD>
<TD>&nbsp;&nbsp;</TD>
<TD align=right><input type = "button" name="printMe" onClick="printSpecial();" value="PRINT"></TD>
<TD>&nbsp;&nbsp;</TD>
<TD align=left> <input type = "button" value="BACK" onclick="window.parent.open('invoke_menu_page.jsp?userid=<%=sLoginEmpCd%>','_self')
;"></TD>
<TD>&nbsp;&nbsp;</TD>
</TR>
</TABLE>

<%

System.out.println("MRITYUNJOY 4 "+sGenstnCd);

String st_dt1    = request.getParameter("hst_dt");
String end_dt1   = request.getParameter("hend_dt");
String dept1     = request.getParameter("hdept");
String genstn    = request.getParameter("hgen");
String basis     = request.getParameter("hbasis");

if(st_dt1!= null && end_dt1!= null && dept1 != null){

        System.out.println("1. DEB CHAK New Rep:GS "+genstn);
        System.out.println("1. DEB CHAK New Rep:Dept "+dept1);

        String qry_str1 = new String();

        String cls			 = new String();
	String whr_cls1 = new String();
	String whr_cls2 = new String();

	String job_desc1 = new String();
	String job_desc2 = new String();

        int    flag    = 0;
        int    srl_num = 0;
        int    no_row_pg = 34 ;


        PreparedStatement ps1 = null ;
        ResultSet rs1         = null ;

        PreparedStatement ps2 = null ;
        ResultSet rs2         = null ;

        String genstn2 = new String();
        String dept2   = new String();
        
        String vndr_rf         = new String();
	String vndr_nm      = new String();
        String tot_mtrl       = new String();
	String tot_lbr         = new String();
        String tot_s_tax     = new String();
        String tot_vat         = new String();
        String tot_ovr_tm  = new String();
        String tot_othr       = new String();
        String tot_bill        = new String();

%>

<form method="POST" name="frm" id="f2" action="bill_cmpnts_vndrwz_xls.jsp" valign="middle" align="center" >
     <input type ="hidden" id="h_1" name="hst_dt_f2"  value="<%=st_dt1%>" >
     <input type ="hidden" id="h_2" name="hend_dt_f2" value="<%=end_dt1%>" >
     <input type ="hidden" id="h_3" name="hdept_f2"   value="<%=dept1%>" >
     <input type ="hidden" id="h_4" name="hgen_f2"    value="<%=genstn%>" >
     <input type ="hidden" id="h_5" name="hbasis_f2"  value="<%=basis%>" >
</form>

<input id="img1" type="image" alt="EXPORT TO EXCEL" onclick="func_to_xls();" src="excel_img.jpg" 
 style="position:absolute; left:930px; top:180px">


<%
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
 
<div id="printReady" style="overflow:scroll; height:430px; background:#DBF2DC;">

<center>

<%

SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
String DisplayDate= formatdate.format(new java.util.Date());
String disp_basis = new String();

if(basis.equals("B")){
	disp_basis = " VENDORWISE COMPONENTS OF BILLS RELEASED ON THE BASIS OF BILL RELEASED DATE";
}else{
	disp_basis = " VENDORWISE COMPONENTS OF BILLS RELEASED ON THE BASIS OF FINANCE RECEIVED DATE";
}

%>
<table width="97%" >
<tr > 
<td align=left >  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
<td align=center> <font color="#400040" size="3"><b><%=disp_basis%></b></font></td>
<td align=right > <font color="#400040" size="3">  Page : 1 </font> </td>
</tr>
<tr > 
<td align=center colspan="3" >
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
          <td align="center"  class= "rcrdsEle" rowspan="2"><font size=2 color="#400040"><b>Sl</b></font></td>
          <td align="left"       class= "rcrdsEle" rowspan="2"><font size=2 color="#400040"><b>Vendor Name</b></font></td>
          <td align="center"   class= "rcrdsEle" colspan="7" ><font size=2 color="#400040"><b>Bill Components (in Rs.)</b></font></td>
     </tr>
     <tr bgcolor="#DBF2DC">
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Material</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Labour</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Service Tax</b></font></td>
	  <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>VAT</b></font></td>
	  <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Over-time</b></font></td>
	  <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Others</b></font></td>
	  <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Total</b></font></td>
     </tr>
<%
        System.out.println("3.DEB CHAK  New Rep:GS "+genstn);
        System.out.println("3.DEB CHAK  New Rep:Dept "+dept1);

        if(basis.equals("B")){
			cls =  "   B.BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
		}else{
			cls =  "   B.FINANCE_RECVD_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY') " ;
		}

if(!genstn.equals("99999") && !dept1.equals("999")){
			
			whr_cls1= "WHERE O.station = ? "
						   + "AND    O.dept   = ?   	"
						   + "AND " + cls 
						   + "AND    O.order_id  = B.order_id ";

			whr_cls2= "WHERE B.station = ? "
						   + "AND    B.dept   = ?   	"
						   + "AND " + cls 
                           + "AND    B.VENDOR = V.VENDOR_CODE ";

	}else if(!genstn.equals("99999") && dept1.equals("999")){
						
			whr_cls1= "WHERE  O.station = ? "
						    + "AND " + cls 
	                        + "AND    O.order_id  = B.order_id      ";

			whr_cls2= "WHERE B.station = ? "
							+ "AND " + cls 
                            + "AND    B.VENDOR = V.VENDOR_CODE ";

	}else if(genstn.equals("99999") && !dept1.equals("999")){
			
	      if(!sGenstnCd.equals("019")){

		       whr_cls1 =",ORBL_CD_DEPT   D 			"
								+"WHERE  O.dept    = ? 			        "
								+"AND    D.ORDER_DEPT = ?                       "
								+"AND    O.DEPT = D.DEPT                        "
								+"AND    O.STATION = D.STATION                  "
								+"AND    O.STATION = B.STATION                  "
								+"AND " + cls
								+"AND    O.order_id  = B.order_id 		";

			   whr_cls2 = ",ORBL_CD_DEPT   D                     "
								+ "WHERE  B.dept    = ?                          "
								+ "AND    D.ORDER_DEPT = ?                       "
								+ "AND    B.DEPT       = D.DEPT                  "
								+ "AND " + cls
								+ "AND    B.VENDOR     = V.VENDOR_CODE           ";

	      }else{	
					
		       whr_cls1= "WHERE  O.dept   = ?   		"
							   + "AND " + cls 
							   + "AND    O.order_id  = B.order_id ";

			   whr_cls2 = "WHERE  B.dept    = ?                          "
								+ "AND " + cls
								+ "AND    B.VENDOR  = V.VENDOR_CODE   ";
	      }


	}else{

		whr_cls1= "WHERE " + cls 
						+ "AND    O.order_id  = B.order_id     ";

		   whr_cls2 = "WHERE " + cls 
							+ "AND    B.VENDOR  = V.VENDOR_CODE ";
	}


		  qry_str1	= "SELECT VNDR, 						   "
					+ "	   VNDR_NM, 						   "
					+ "	   TO_CHAR(SUM(MTRL) ,'99,99,99,99,990.99') TOT_MTRL, 				   "
					+ "	   TO_CHAR(SUM(LBR),'99,99,99,99,990.99')  TOT_LBR, 				   "
					+ "	   TO_CHAR(SUM(S_TAX),'99,99,99,99,990.99') TOT_S_TAX, 			   "
					+ "	   TO_CHAR(SUM(VAT),'99,99,99,99,990.99')   TOT_VAT, 				   "
					+ "	   TO_CHAR(SUM(OVR_TM),'99,99,99,99,990.99') TOT_OVR_TM, 			   "
					+ "	   TO_CHAR(SUM(OTHR),'99,99,99,99,990.99')   TOT_OTHR, 			   "
					+ "	   TO_CHAR(SUM(BILL),'99,99,99,99,990.99')   TOT_BILL 			   "
					+ "FROM 								   "
					+ "(SELECT TRIM(O.VENDOR_CODE) VNDR, 	   "
					+ "	   O.VENDOR_NAME VNDR_NM, 			   "
					+ "	   NVL(B.MATERIAL,0.00) MTRL, 		   "
					+ "	   NVL(B.LABOUR,0.00)  LBR, 		   "
					+ "	   NVL(B.SERVICE_TAX,0.00) S_TAX, 	   "
					+ "	   NVL(B.VAT,0.00) VAT, 			   "
					+ "	   NVL(B.OT,0.00) OVR_TM, 			   "
					+ "	   NVL(B.OTHER_AMOUNT,0.00) OTHR, 	   "
					+ "	   NVL(B.BILL_AMOUNT,0.00) BILL, 	   "
					+ "	   B.BILL_ID 						   "
					+ "FROM   ORBL_BILL_DTL   B, 			   "
					+ "	          ORBL_ORD_DTL    O 				   "
					+  whr_cls1								   
					+ " UNION 								   "
					+ "SELECT TRIM(V.vendor_code) VNDR, 	   "
					+ "	   V.VENDOR_NAME VNDR_NM, 			   "
					+ "	   0.00 MTRL, 						   "
					+ "	   0.00 LBR, 						   "
					+ "	   0.00 S_TAX, 						   "
					+ "	   0.00 VAT, 						   "
					+ "	   0.00 OVR_TM, 					   "
					+ "	   0.00 OTHR, 						   "
					+ "	   NVL(B.BILL_AMT,0.00) BILL, 		   "
					+ "	   B.BILLREF 						   "
					+ "FROM   ORBL_SPBILL_DTL B, 			   "
					+ "	          ORBL_VENDOR_MST V 				   "
					+  whr_cls2 + ") 						   "
					+ "GROUP BY VNDR, 						   "
					+ "		           VNDR_NM 						   "
					+ "ORDER BY 2							   ";


	System.out.println("VNDRWZ BILL BOMPONENTS QRY STRING " + qry_str1);

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
			if(srl_num>0 && srl_num % no_row_pg == 0){
  %>
    </table>
   <p class="pgbrk">&nbsp;</p>
	<table width="97%" >
	<tr > 
	<td align=left >  <font color="#400040" size="3"> &nbsp Date : <%= DisplayDate %> </font> </td>
	<td align=center> <font color="#400040" size="3"><b><%=disp_basis%></b></font></td>
	<td align=right > <font color="#400040" size="3">  Page : <%= (srl_num / no_row_pg)+1  %> </font> </td>
	</tr>
<tr > 
<td align=center colspan="3" >
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
          <td align="center"  class= "rcrdsEle" rowspan="2"><font size=2 color="#400040"><b>Sl</b></font></td>
          <td align="left"    class= "rcrdsEle" rowspan="2"><font size=2 color="#400040"><b>Vendor Name</b></font></td>
          <td align="center"  class= "rcrdsEle" colspan="7" ><font size=2 color="#400040"><b>Bill Components (in Rs.)</b></font></td>
     </tr>
     <tr bgcolor="#DBF2DC">
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Material</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Labour</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Service Tax</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>VAT</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Over-time</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Others</b></font></td>
          <td align="right"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Total</b></font></td>
     </tr>

<%
          }

        srl_num ++ ;
	vndr_rf         =rs1.getString(1) ;
	vndr_nm      	=rs1.getString(2) ;
	tot_mtrl       	=rs1.getString(3) ;
	tot_lbr         =rs1.getString(4) ;
	tot_s_tax     	=rs1.getString(5) ;
	tot_vat         =rs1.getString(6) ;
	tot_ovr_tm  	=rs1.getString(7) ;
	tot_othr       	=rs1.getString(8) ;
	tot_bill        =rs1.getString(9) ;

if(srl_num % 2 == 0){
%>
	<tr bgcolor="#DBF2DC">
	 <td align = "center" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=srl_num%></font></td>
         <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040">
	 <a href="cmpnts_vndrwz_dtl.jsp?gstn=<%=genstn%>&dept=<%=dept1%>&frm_dt=<%=st_dt1%>&to_dt=<%=end_dt1%>&basis=<%=basis%>&vnd_id=<%=vndr_rf%>&vnm=<%=vndr_nm%>"> <%=vndr_nm%> </a>
	 </font></td>
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_mtrl%></font></td>
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_lbr%></font></td>
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_s_tax%></font></td>
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_vat%></font></td> 
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_ovr_tm%></font></td>
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_othr%></font></td>
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_bill%></font></td>
	</tr>

<% }else{  %>

	<tr bgcolor="#FFFFFF">
	 <td align = "center" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=srl_num%></font></td>
         <td align = "left"   class= "rcrdsEle" ><font  size="2"  color="#800040">
	 <a href="cmpnts_vndrwz_dtl.jsp?gstn=<%=genstn%>&dept=<%=dept1%>&frm_dt=<%=st_dt1%>&to_dt=<%=end_dt1%>&basis=<%=basis%>&vnd_id=<%=vndr_rf%>&vnm=<%=vndr_nm%>"> <%=vndr_nm%> </a>
	 </font></td>
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_mtrl%></font></td>
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_lbr%></font></td>
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_s_tax%></font></td>
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_vat%></font></td> 
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_ovr_tm%></font></td>
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_othr%></font></td>	
         <td align = "right" class= "rcrdsEle" ><font  size="2"  color="#800040"><%=tot_bill%></font></td>
	</tr>

<%      }
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
    }
}

   }catch(Exception ef1){
           ef1.printStackTrace();
    }finally{
          mk.con.close();
     }


%>

</center>
</div>
</label>
</body>
</html>

