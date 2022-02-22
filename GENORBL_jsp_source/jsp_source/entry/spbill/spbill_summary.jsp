
<html>
<!--#include file="mylib/dates.inc"-->
<!--#include file="mylib/rowid.inc"-->



<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>



<head>

<title></title>

<script src="js/spl_bill_dates.js"></script>


</head>

<body>

<%

 MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    String curdate = new String() ;

    try {
        PreparedStatement ps = null ;
        ResultSet rs = null ;


String st_dt=request.getParameter("st_dt")== null?"":request.getParameter("st_dt");
String end_dt=request.getParameter("end_dt")== null?"":request.getParameter("end_dt");
String dept=request.getParameter("dept")== null?"":request.getParameter("dept");
String budg_ac=request.getParameter("budg_ac")== null?"":request.getParameter("budg_ac");
String cont_ref=request.getParameter("cont_ref")== null?"":request.getParameter("cont_ref");
//descrip=ucase(request.getParameter("descrip"));
String descrip=request.getParameter("descrip")== null?"":request.getParameter("descrip");
String billref=request.getParameter("billref")== null?"":request.getParameter("billref");
String unit=request.getParameter("unit")== null?"":request.getParameter("unit");
String desc_cl = "";
String budg_cl = "";
String cont_cl = "";
String dept_cl = "";
String dt_cl = "";
String cl = "";

Double bill_amt = 0.00;
String rowid = "";

String bill_cl="";
String bill_no="";
String bill_dt="";




String letter_ref="";
String letter_dt="";
String fin_recd_dt="";

Double tot_bill_amt=0.00;

String jobtype="";

System.out.println("  dept :  "+dept);

if (!descrip.equals("")){
  desc_cl=" and UPPER(descrip) LIKE '%to_upper("+descrip+")%' ";
}else{
  desc_cl="";
}


if (!budg_ac.equals("")){
  budg_cl=" and budg_ac='"+budg_ac+"' ";
}else{
  budg_cl="";
}

if (!cont_ref.equals("")){
  cont_cl=" and party='"+cont_ref+"' ";
}else{
  cont_cl="";
}

if (!dept.equals("All")){
  dept_cl=" and dept='"+dept+"' ";
}else{
  dept_cl="";
}

if (!st_dt.equals("") && !end_dt.equals("")){
  dt_cl=" and bill_cl between TO_DATE('"+st_dt+"','DD-MON-RRRR') and TO_DATE('"+end_dt+"','DD-MON-RRRR') ";
}else{
  dt_cl="";
}

if (billref.equals("")){
cl=budg_cl+cont_cl+dept_cl+dt_cl+desc_cl;
}else{
//cl=" and billref="+billref+" ";
cl=" and billref = '"+billref+"' ";
}

%>
<div align="center"><center>
<p><input type="button" value="Back" onclick="javascript: history.go(-1);" /> </p>
<table border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td bgcolor="#408080"><font face="Verdana" color="#FFFFFF">Sl No</font></td>
    <td bgcolor="#408080"><font face="Verdana" color="#FFFFFF">Bill Ref</font></td>
    <td bgcolor="#408080"><font face="Verdana" color="#FFFFFF">Bill Cleared</font></td>
    <td bgcolor="#408080"><font face="Verdana" color="#FFFFFF">Bill No</font></td>
    <td bgcolor="#408080"><font face="Verdana" color="#FFFFFF">Bill Date</font></td>
    <td bgcolor="#408080"><font face="Verdana" color="#FFFFFF">Budget A/C</font></td>
    <td bgcolor="#408080"><font face="Verdana" color="#FFFFFF">Description</font></td>
    <td bgcolor="#408080"><font face="Verdana" color="#FFFFFF">Bill Amount</font></td>
    <td bgcolor="#408080"><font face="Verdana" color="#FFFFFF">Letter Ref.</font></td>
    <td bgcolor="#408080"><font face="Verdana" color="#FFFFFF">Letter Date</font></td>
    <td bgcolor="#408080"><font face="Verdana" color="#FFFFFF">Fin. Recd. Date</font></td>
  </tr>
<%


/*'sql=" select rowid,bill_cl,bill_no,bill_dt,bill_amt,budg_ac,descrip,billref from spbill " & _
     '" where rowid is not null "&cl

	 */
     
String sql=" SELECT b.ROWID, to_char(b.bill_cl,'dd-MON-YYYY') bill_cl , b.bill_no, to_char(b.bill_dt,'dd-MON-YYYY') bill_dt, b.bill_amt,b.unit, "+
    " b.budg_ac, b.descrip,b.billref, b.billrel_id,b.unit,b.jobtype, d.letter_ref, to_char(d.letter_dt,'dd-MON-YYYY') letter_dt, "+
    " to_char(d.fin_recd_dt,'dd-MON-YYYY') fin_recd_dt FROM ORBL_SPBILL_DTL b, ORBL_BILL_REL_DTL d WHERE b.billrel_id = d.ref_id (+) "+cl ;
    
System.out.println("  sql :  "+sql);
ps = mk.con.prepareStatement(sql) ;
 rs = ps.executeQuery() ;


int i=0 ;

while(rs.next()){
i=i+1 ;
rowid=rs.getString("rowid");
//rowid=decode_id(rowid)
//unit=CDbl(rs.getString("unit"));
unit=rs.getString("unit") == null?"":rs.getString("unit");
bill_cl=rs.getString("bill_cl")==null?"":rs.getString("bill_cl");
bill_no=rs.getString("bill_no")==null?"":rs.getString("bill_no");
bill_dt=rs.getString("bill_dt")==null?"":rs.getString("bill_dt");
bill_amt=rs.getDouble("bill_amt");
budg_ac=rs.getString("budg_ac")==null?"":rs.getString("budg_ac");
descrip=rs.getString("descrip")==null?"":rs.getString("descrip");
billref=rs.getString("billref")==null?"":rs.getString("billref");
letter_ref=rs.getString("letter_ref")==null?"":rs.getString("letter_ref");
letter_dt=rs.getString("letter_dt")==null?"":rs.getString("letter_dt");
fin_recd_dt=rs.getString("fin_recd_dt")==null?"":rs.getString("fin_recd_dt");

tot_bill_amt=tot_bill_amt+bill_amt;
unit=rs.getString("unit");
jobtype=rs.getString("jobtype")==null?"":rs.getString("jobtype");

%>
  <tr onMouseOver="window.event.srcElement.style.cursor='hand'"
  onclick="return row_ocl('billref=<%=billref%>')">
    <td nowrap><font face="Verdana"><%=i%></font></td>
    <td nowrap><font face="Verdana"><%=billref%></font></td>
    <td nowrap><font face="Verdana"><%=bill_cl%></font></td>
    <td nowrap><font face="Verdana"><%=bill_no%></font></td>
    <td nowrap><font face="Verdana"><%=bill_dt%></font></td>
    <td nowrap><font face="Verdana"><%=budg_ac%></font></td>
    <td nowrap><font face="Verdana"><%=descrip%></font></td>
    <td nowrap align="right"><font face="Verdana"><%= bill_amt %></font></td>
    <td nowrap><font face="Verdana"><%=letter_ref%></font></td>
    <td nowrap><font face="Verdana"><%=letter_dt %></font></td>
    <td nowrap><font face="Verdana"><%=fin_recd_dt%></font></td>
  </tr>
<%
 
 }

   rs.close();
ps.close();

  %>
  <tr>
    <td colspan="7" bgcolor="#008080" nowrap><p align="right"><font face="Verdana"
    color="#FFFFFF">Total </font></td>
    <td bgcolor="#008080" nowrap align="right"><font face="Verdana" color="#FFFFFF"><%= tot_bill_amt %></font></td>
    <td colspan="3" bgcolor="#008080" nowrap>&nbsp;</td>
  </tr>
</table>
</center></div>

<script LANGUAGE="javascript">
function row_ocl(qstr)
{
var rslt=window.open("spbill_entry.jsp?"+qstr,"bill","width=900,height=500,left=75,top=100");
return 0;
}


</script>


<%

 }
    catch(Exception e){
        e.printStackTrace();
    }
    finally {
        mk.con.close() ;
    }
%>

</body>
</html>

