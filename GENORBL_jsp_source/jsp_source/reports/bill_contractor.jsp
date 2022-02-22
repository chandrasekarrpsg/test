<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<script type="text/javascript" src="RepFunc.js"></script>
<script src="js/sel_date.js"></script>

<title>CONTRACTOR-WISE CASH FLOW</title>

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


<SCRIPT language="JavaScript">

function getDeptDesc() {
var stncd = document.getElementById("s2").options[document.getElementById("s2").selectedIndex].value ;

if (stncd != "999")
{

var xmldiffrnciator = Math.floor(Math.random() * 100000);
paramater = "stncd=" + stncd + "&switchVar=1&progId=GENORBLREP" ;
paramater += "&xmldiffrnciator=" + xmldiffrnciator;

var url = "genOrblServlet?" + paramater;
//alert(url) ;

var myval = new Object();
try {
    req_copy = new ActiveXObject("Msxml2.XMLHTTP");
}catch(e){
try {
    req_copy = new ActiveXObject("Microsoft.XMLHTTP");
}catch(E){
    req_copy = new XMLHttpRequest();
    }
}
req_copy.open('GET',url, true);
req_copy.send('');
req_copy.onreadystatechange = function(){
			    if(req_copy.readyState == 4){
			       //alert(req_copy.responseText);
				myval = req_copy.responseXML.getElementsByTagName("RECS");
				if(myval != null){
				     for(i = 0; i < myval.length; i++) {
					     var flag = myval[i].childNodes[0].nodeValue;
						     if ( flag == '0' ) {
							 alert('ERROR : NO RECORDS FOUND') ;
						     }
						     else {
							   populateDept(flag) ;
						     }
				     }
				  }
			     }
			  }
}
}

function populateDept(str) {
var tmpArray = new Array() ;
var tmpArray1 = new Array() ;
tmpArray = str.split('@') ;

document.getElementById("s1").length = tmpArray.length ;

for ( i=0; i<tmpArray.length; i++ ) {
 tmpArray1=tmpArray[i].split('|') ;
 document.getElementById("s1")[i].text = '' ;
 document.getElementById("s1")[i].value = '' ;
}
for ( i=0; i<tmpArray.length-1; i++ ) {
 tmpArray1=tmpArray[i].split('|') ;
 document.getElementById("s1")[i].text = tmpArray1[1] ;
 document.getElementById("s1")[i].value = tmpArray1[0] ;
}
}
</SCRIPT>
</head>

<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>

<%
String sLoginEmpCd = loginBean.getsEmpCd();

String st_dt  = request.getParameter("st_dt");
String end_dt = request.getParameter("end_dt");

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();

%>

<body background="GS1.jpg" onLoad="prescript();">

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

<div id="footer">
<div id="container">
<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:25px; top:15px" width="170" height="70">


		  <label style="POSITION: absolute; LEFT: 660px; top:650px"  class="style5" ><b>2012 © Developed by I.T. Department</b></label>

</div>
</div>


<center>
<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3"><font face="Albertus Extra Bold" size="5" color="#400040">
<b>CONTRACTOR-WISE CASH FLOW</b></font>
<br><br>

<table>
<tr>
<td><font size="4" color="#400040"><b>GENERATING STATION</b></font></td>
<td>
   <select name="s2" id="s2" onchange="getDeptDesc()">

<option selected value="999">SELECT</option>
<%
ResultSet rs50=null;
PreparedStatement ps50=null;
ps50  = mk.con.prepareStatement(
"SELECT DECODE(orbl_station_cd,'016',1,'014',2,'002',3,'013',4,'019',5,'042',6) seq,orbl_station_cd, " +
"station_sht_desc " +
"FROM  CD_STATION " +
"ORDER BY 1 ",
ResultSet.TYPE_SCROLL_INSENSITIVE,
ResultSet.CONCUR_READ_ONLY );
rs50=ps50.executeQuery();
while(rs50.next())
{
%>
<option value="<%= rs50.getString(2)%>"><%= rs50.getString(3)%></option>
<%
}

rs50.close() ;
ps50.close() ;
%>
</select>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>DEPARTMENT</b></font></td>
<td>
<select name="s1" id="s1">
<%
  String dept = new String() ;
  try {

      PreparedStatement ps = null ;
      ResultSet rs = null ;

      ps = mk.con.prepareStatement("select DEPT from orbl_cd_dept order by DEPT" ) ;
      rs = ps.executeQuery() ;

      while(rs.next()) {
            dept = rs.getString(1) ;
%>
<!--<option value="<%=dept%>"><%=dept%></option>-->
<%
      }

      rs.close() ;
      ps.close() ;

  }catch(Exception e){
      e.printStackTrace();
    } 
%>
</td>
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
</tr>

</table>

<TABLE>
<TR>
<form method="POST" name="sampleform" action="bill_contractor.jsp" onSubmit="DefaultValue();" valign="middle" align="center" >

<input type ="hidden" id="h1" name="hst_dt">
<input type ="hidden" id="h2" name="hend_dt">
<input type ="hidden" id="h3" name="hdept">
<input type ="hidden" id="h4" name="hgen">

<TD align=center><input type = "submit" value="SUBMIT" ></TD>
</form>
<TD>&nbsp;&nbsp;</TD>
<TD align=right><input type = "button" name="printMe" onClick="printSpecial();" value="PRINT"></TD>
<TD>&nbsp;&nbsp;</TD>
<TD align=left> <input type = "button" value="BACK" onclick="window.parent.open('invoke_menu_page.jsp?userid=<%=sLoginEmpCd%>','_self');"></TD>
<TD>&nbsp;&nbsp;</TD>
</TR>
</TABLE>

<%
   try{

        String st_dt1  = request.getParameter("hst_dt");
        String end_dt1 = request.getParameter("hend_dt");
        String dept1   = request.getParameter("hdept");
        String genstn  = request.getParameter("hgen");


if(st_dt1!= null && end_dt1!= null && dept1 != null){


ResultSet rs51=null;
PreparedStatement ps51=null;
ps51  = mk.con.prepareStatement(
"SELECT DISTINCT c.station_sht_desc,d.order_dept " +
"FROM  CD_STATION c, ORBL_CD_DEPT d " +
"WHERE c.orbl_station_cd = ? AND d.station = c.orbl_station_cd AND d.dept = ? ",
ResultSet.TYPE_SCROLL_INSENSITIVE,
ResultSet.CONCUR_READ_ONLY );

ps51.setString(1,genstn);
ps51.setString(2,dept1);

rs51=ps51.executeQuery();

String genstn2 = new String();
String dept2   = new String();

while(rs51.next())
{

genstn2 = rs51.getString(1) ;
dept2   = rs51.getString(2) ;

}

rs51.close() ;
ps51.close() ;


%>
<br>
<br>

<div id="printReady" style="overflow:scroll; height:450px; background:#DBF2DC;">

<%
SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
String DisplayDate= formatdate.format(new java.util.Date());

%>
<table width="97%" >
<tr > 
<td align=left ><font color="#400040" size="4"> &nbsp Date : <%= DisplayDate %> </font> </td>
<td align=center > <font color="#400040" size="4">  <b>CONTRACTOR-WISE BILLS RELEASED BETWEEN <%=st_dt1%> AND <%=end_dt1%></b> </font> </td>
<td align=right > <font color="#400040" size="4">  Page : 1 </font> </td>
</tr>
</table>
     <table  border="1" width="97%" class= "rcrds" >
     <tr bgcolor="#DBF2DC">

          <td colspan="7" align="center" class= "rcrdsEle" >
            <font color="#400040" size="3">
	    <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : <%=dept2%></b>
            </font>
          </td>
     </tr>

     <tr bgcolor="#DBF2DC">
          <td align="center" width="25px"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Sl</b></font></td>
          <td align="left"   width="500px" class= "rcrdsEle" ><font size=2 color="#400040"><b>Vendor</b></font></td>
          <td align="right"  width="85px"  class= "rcrdsEle" ><font size=2 color="#400040"><b>One Time</b></font></td>
          <td align="right"  width="85px"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Term Contract</b></font></td>
          <td align="right"  width="80px"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Rate Contract</b></font></td>
          <td align="right"  width="60px"  class= "rcrdsEle" ><font size=2 color="#400040"><b>CAPEX</b></font></td>
          <td align="right"  width="90px"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Total(Rs.)</b></font></td>
     </tr>


<%
      
        String qry_str1 = new String();
        String qry_str2 = new String();

        int    flag    = 0;
        int    srl_num = 0;
        int    no_row_pg = 34 ;

        String vndr_nm = new String();
        String one_tm  = new String();
        String trm_cor = new String();
        String rt_cntr = new String();
        String capex   = new String();
        String totamt  = new String();
        
        String O_amt   = new String();
        String T_amt   = new String();
        String R_amt   = new String();
        String C_amt   = new String();
        String grnd_tot= new String();


        PreparedStatement ps1 = null ;
        ResultSet rs1         = null ;

        PreparedStatement ps2 = null ;
        ResultSet rs2         = null ;


        qry_str1= " SELECT TRIM(x.vendor_name) VNDR,                                                                                  " +
                  "        TRIM(TO_CHAR(NVL(a.amt,0),'999,99,99,990.99')) O,                                                          " +
                  "        TRIM(TO_CHAR(NVL(b.amt,0),'999,99,99,990.99')) T,                                                          " +
                  "        TRIM(TO_CHAR(NVL(C.amt,0),'999,99,99,990.99')) R,                                                          " +
                  "        TRIM(TO_CHAR(NVL(D.amt,0),'999,99,99,990.99')) C,                                                          " +
                  "        TRIM(TO_CHAR((NVL(a.amt, 0) + NVL(b.amt, 0) + NVL(C.amt, 0) + NVL(D.amt, 0)),'999,99,99,990.99')) TOT_AMT  " +
                  " FROM (SELECT vendor_name,vendor_code                                                                              " +
                  "       FROM ORBL_VENDOR_MST) x,                                                                                    " + 
                  "      (SELECT v.vendor_code, SUM(bill_amount) amt                                                                  " + 
                  "       FROM ORBL_BILL_DTL   B,                                                                                     " + 
	          "            ORBL_ORD_DTL    O,                                                                                     " + 
	          "            ORBL_VENDOR_MST V                                                                                      " + 
                  "       WHERE o.station = ?                                                                                         " +
                  "       AND   o.dept   = ?                                                                                          " +
                  "       AND   o.station = b.station                                                                                 " +
                  "       AND BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')                         " + 
                  "       AND o.order_id = b.order_id                                                                                 " + 
                  "       AND o.VENDOR_CODE = v.vendor_code                                                                            " + 
                  "       AND ORDER_TYPE = 'O'                                                                                        " + 
                  "       GROUP BY v.vendor_code) a,                                                                                  " + 
                  "      (SELECT v.vendor_code, SUM(bill_amount) amt                                                                  " + 
                  "       FROM ORBL_BILL_DTL   B,                                                                                 " + 
	          "            ORBL_ORD_DTL    O,                                                                                 " + 
	          "            ORBL_VENDOR_MST V                                                                                  " + 
                  "       WHERE o.station = ?                                                                                          " +
                  "       AND   o.dept = ?                                                                                            " +
                  "       AND   o.station = b.station                                                                                 " +
                  "       AND BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')                         " + 
                  "       AND o.order_id = b.order_id                                                                                 " + 
                  "       AND o.vendor_code = v.vendor_code                                                                           " + 
                  "       AND ORDER_TYPE = 'T'                                                                                        " + 
                  "       GROUP BY v.vendor_code) B,                                                                                  " + 
                  "      (SELECT v.vendor_code, SUM(bill_amount) amt                                                                  " + 
                  "       FROM ORBL_BILL_DTL   B,                                                                                 " + 
	          "            ORBL_ORD_DTL    O,                                                                                 " + 
	          "            ORBL_VENDOR_MST V                                                                                  " + 
                  "       WHERE o.station = ?                                                                                          " +
                  "       AND   o.dept = ?                                                                                            " +
                  "       AND   o.station = b.station                                                                                   " +
                  "       AND BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')                         " + 
                  "       AND o.order_id = b.order_id                                                                                 " + 
                  "       AND o.vendor_code = v.vendor_code                                                                           " + 
                  "       AND ORDER_TYPE = 'R'                                                                                        " + 
                  "       GROUP BY v.vendor_code) C,                                                                                  " + 
                  "      (SELECT V.vendor_code, SUM(bill_amount) amt                                                                  " + 
                  "       FROM ORBL_BILL_DTL   B,                                                                                 " + 
	          "            ORBL_ORD_DTL    O,                                                                                 " + 
	          "            ORBL_VENDOR_MST V                                                                                  " + 
                  "       WHERE o.station = ?                                                                                          " +
                  "       AND   o.dept = ?                                                                                            " +
                  "       AND   o.station = b.station                                                                                   " +
                  "       AND BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')                         " + 
                  "       AND o.order_id  = b.order_id                                                                                " + 
                  "       AND o.vendor_code = v.vendor_code                                                                           " + 
                  "       AND order_type = 'C'                                                                                        " + 
                  "       GROUP BY V.vendor_code) D                                                                                   " + 
                  " WHERE x.vendor_code = a.vendor_code (+)                                                                           " + 
                  " AND   x.vendor_code = b.vendor_code (+)                                                                           " + 
                  " AND   x.vendor_code = C.vendor_code (+)                                                                           " + 
                  " AND   x.vendor_code = D.vendor_code (+)                                                                           " + 
                  " AND   (NVL(a.amt, 0) + NVL(b.amt, 0) + NVL(C.amt, 0) + NVL(D.amt, 0) > 0) order by x.vendor_name                  " ;


        ps1 = mk.con.prepareStatement(qry_str1);
        
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

        rs1 = ps1.executeQuery() ;

        qry_str2= " SELECT                                                                                                  " +
                  " TO_CHAR(NVL(SUM(a.amt),0),'999,99,99,990.99') O_AMT,                                                    " +
                  " TO_CHAR(NVL(SUM(b.amt),0),'999,99,99,990.99') T_AMT,                                                    " +
                  " TO_CHAR(NVL(SUM(C.amt),0),'999,99,99,990.99') R_AMT,                                                    " +
                  " TO_CHAR(NVL(SUM(D.amt),0),'999,99,99,990.99') C_AMT,                                                    " +
                  " TO_CHAR(SUM(NVL(a.amt, 0) + NVL(b.amt, 0) + NVL(C.amt, 0) + NVL(D.amt, 0)),'999,99,99,990.99') GRND_TOT " +
                  " FROM (SELECT vendor_name                                                                                          " +
                  "       FROM ORBL_VENDOR_MST) x,                                                                                    " + 
                  "      (SELECT v.vendor_name, SUM(bill_amount) amt                                                                  " + 
                  "       FROM ORBL_BILL_DTL   B,                                                                                     " + 
	          "            ORBL_ORD_DTL    O,                                                                                     " + 
	          "            ORBL_VENDOR_MST V                                                                                      " + 
                  "       WHERE o.station = ?                                                                                         " +
                  "       AND   o.dept   = ?                                                                                          " +
                  "       AND   o.station = b.station                                                                                 " +
                  "       AND BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')                         " + 
                  "       AND o.order_id = b.order_id                                                                                 " + 
                  "       AND o.VENDOR_CODE = v.vendor_code                                                                            " + 
                  "       AND ORDER_TYPE = 'O'                                                                                        " + 
                  "       GROUP BY v.vendor_name) a,                                                                                  " + 
                  "      (SELECT v.vendor_name, SUM(bill_amount) amt                                                                  " + 
                  "       FROM ORBL_BILL_DTL   B,                                                                                 " + 
	          "            ORBL_ORD_DTL    O,                                                                                 " + 
	          "            ORBL_VENDOR_MST V                                                                                  " + 
                  "       WHERE o.station = ?                                                                                          " +
                  "       AND   o.dept = ?                                                                                            " +
                  "       AND   o.station = b.station                                                                                 " +
                  "       AND BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')                         " + 
                  "       AND o.order_id = b.order_id                                                                                 " + 
                  "       AND o.vendor_code = v.vendor_code                                                                           " + 
                  "       AND ORDER_TYPE = 'T'                                                                                        " + 
                  "       GROUP BY v.vendor_name) B,                                                                                  " + 
                  "      (SELECT v.vendor_name, SUM(bill_amount) amt                                                                  " + 
                  "       FROM ORBL_BILL_DTL   B,                                                                                 " + 
	          "            ORBL_ORD_DTL    O,                                                                                 " + 
	          "            ORBL_VENDOR_MST V                                                                                  " + 
                  "       WHERE o.station = ?                                                                                          " +
                  "       AND   o.dept = ?                                                                                            " +
                  "       AND   o.station = b.station                                                                                   " +
                  "       AND BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')                         " + 
                  "       AND o.order_id = b.order_id                                                                                 " + 
                  "       AND o.vendor_code = v.vendor_code                                                                           " + 
                  "       AND ORDER_TYPE = 'R'                                                                                        " + 
                  "       GROUP BY v.vendor_name) C,                                                                                  " + 
                  "      (SELECT V.vendor_name, SUM(bill_amount) amt                                                                  " + 
                  "       FROM ORBL_BILL_DTL   B,                                                                                 " + 
	          "            ORBL_ORD_DTL    O,                                                                                 " + 
	          "            ORBL_VENDOR_MST V                                                                                  " + 
                  "       WHERE o.station = ?                                                                                          " +
                  "       AND   o.dept = ?                                                                                            " +
                  "       AND   o.station = b.station                                                                                   " +
                  "       AND BILL_RELEASE_DATE BETWEEN to_date(?,'DD-MON-YYYY') AND to_date(?,'DD-MON-YYYY')                         " + 
                  "       AND o.order_id  = b.order_id                                                                                " + 
                  "       AND o.vendor_code = v.vendor_code                                                                           " + 
                  "       AND order_type = 'C'                                                                                        " + 
                  "       GROUP BY V.vendor_name) D                                                                                   " + 
                  " WHERE x.vendor_name = a.vendor_name (+)                                                                           " + 
                  " AND   x.vendor_name = b.vendor_name (+)                                                                           " + 
                  " AND   x.vendor_name = C.vendor_name (+)                                                                           " + 
                  " AND   x.vendor_name = D.vendor_name (+)                                                                           " + 
                  " AND   (NVL(a.amt, 0) + NVL(b.amt, 0) + NVL(C.amt, 0) + NVL(D.amt, 0) > 0) order by x.vendor_name                  " ;

        ps2 = mk.con.prepareStatement(qry_str2);

        ps2.setString(1,genstn);
        ps2.setString(2,dept1);
        ps2.setString(3,st_dt1);
        ps2.setString(4,end_dt1);
        ps2.setString(5,genstn);
        ps2.setString(6,dept1);
        ps2.setString(7,st_dt1);
        ps2.setString(8,end_dt1);
        ps2.setString(9,genstn);
        ps2.setString(10,dept1);
        ps2.setString(11,st_dt1);
        ps2.setString(12,end_dt1);
        ps2.setString(13,genstn);
        ps2.setString(14,dept1);
        ps2.setString(15,st_dt1);
        ps2.setString(16,end_dt1);

        rs2 = ps2.executeQuery() ;

        while(rs2.next()){
              O_amt   = rs2.getString(1); 
              T_amt   = rs2.getString(2); 
              R_amt   = rs2.getString(3); 
              C_amt   = rs2.getString(4); 
              grnd_tot= rs2.getString(5); 
        }

        rs2.close() ;
        ps2.close() ;

        
        while(rs1.next()) {

            flag = 1;


          if(srl_num>0 && srl_num % no_row_pg == 0){

            %>

    </table>
<p class="pgbrk">&nbsp;</p>
    <table width="97%" >
     <tr>

      <td align=left ><font color="#400040" size="4">  &nbsp Date : <%= DisplayDate %> </font> </td>
      <td align=center > <font color="#400040" size="4">  <b>CONTRACTOR-WISE BILLS RELEASED BETWEEN <%=st_dt1%> AND <%=end_dt1%></b> </font> </td>
      <td align=right > <font color="#400040" size="4">  Page : <%= (srl_num / no_row_pg)+1  %> </font> </td>

    </tr>
   </table>
 
<table  border="1" width="97%" class= "rcrds" >
     <tr bgcolor="#DBF2DC">

          <td colspan="7" align="center" class= "rcrdsEle" >
            <font color="#800040" size="3">
	    <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GENERATING STATION : <%=genstn2%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEPARTMENT : <%=dept2%></b>
            </font>
          </td>
     </tr>

     <tr bgcolor="#DBF2DC">
          <td align="center" width="25px"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Sl</b></font></td>
          <td align="left"   width="500px" class= "rcrdsEle" ><font size=2 color="#400040"><b>Vendor</b></font></td>
          <td align="right"  width="85px"  class= "rcrdsEle" ><font size=2 color="#400040"><b>One Time</b></font></td>
          <td align="right"  width="85px"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Term Contract</b></font></td>
          <td align="right"  width="80px"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Rate Contract</b></font></td>
          <td align="right"  width="60px"  class= "rcrdsEle" ><font size=2 color="#400040"><b>CAPEX</b></font></td>
          <td align="right"  width="90px"  class= "rcrdsEle" ><font size=2 color="#400040"><b>Total(Rs.)</b></font></td>
     </tr>


            <%

          }
            srl_num++  ;
            vndr_nm = rs1.getString(1); 
            one_tm  = rs1.getString(2); 
            trm_cor = rs1.getString(3); 
            rt_cntr = rs1.getString(4); 
            capex   = rs1.getString(5); 
            totamt  = rs1.getString(6); 

            if(srl_num % 2 == 0){

%>
            <tr bgcolor="#DBF2DC">
                <td align = "center" width="25px"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=srl_num%></font></td>
                <td align = "left"   width="500px"  class= "rcrdsEle" ><font  size="2"  color="#800040"><%=vndr_nm%></font></td>
                <td align = "right"  width="85px"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=one_tm%></font></td>
                <td align = "right"  width="85px"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=trm_cor%></font></td>
                <td align = "right"  width="80px"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=rt_cntr%></font></td>
                <td align = "right"  width="60px"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=capex%></font></td>
                <td align = "right"  width="90px"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=totamt%></font></td>
            </tr>
<%
            }else{
%>
            <tr bgcolor="#ffffff">
                <td align = "center" width="25px"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=srl_num%></font></td>
                <td align = "left"   width="500px"  class= "rcrdsEle" ><font  size="2"  color="#800040"><%=vndr_nm%></font></td>
                <td align = "right"  width="85px"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=one_tm%></font></td>
                <td align = "right"  width="85px"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=trm_cor%></font></td>
                <td align = "right"  width="80px"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=rt_cntr%></font></td>
                <td align = "right"  width="60px"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=capex%></font></td>
                <td align = "right"  width="90px"   class= "rcrdsEle" ><font  size="2"  color="#800040"><%=totamt%></font></td>
            </tr>

<%
            }
        }
%>
</table>
<%
        if(flag == 1){
%>
<table width=97% class=rcrds>
<tr>
   <td align = left width=525px>
   <font size=2><b>TOTAL AMOUNT (Rs.) : </b></font>
   </td>
   <td align = right width=85px>
   <font size=2><b><%=O_amt%> </b></font>
   </td>
   <td align = right width=85px>
   <font size=2><b><%=T_amt%> </b></font>
   </td>
   <td align = right width=80px>
   <font size=2><b><%=R_amt%> </b></font>
   </td>
   <td align = right width=60px>
   <font size=2><b><%=C_amt%> </b></font>
   </td>
   <td align = right width=90px>
   <font size=2><b><%=grnd_tot%> </b></font>
   </td>
</tr>
</table>


<%
                   }
       
        if(flag == 0){
%>
          <br><br>
            <font  size="4"  color="#400000">
                  <b>NO RECORDS FOUND</b>
            </font>
<%
        }

        rs1.close() ;
        ps1.close() ;

%>

   </div>

<%

}
   }catch(Exception e){
          e.printStackTrace();
    }finally{
          mk.con.close();
    }
%>

<center>
</body>
</html>
