<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>

<html>
<!-- #include file="../../mylib/dates.inc"-->
<!-- #include file="../../mylib/rstowords.inc"-->
<jsp:useBean id="orderBean" class="VO.OrderBean" scope="session"/>
<head>
<title></title>
<style>
    BR.page { page-break-after: always }
</style>
</head>

<body>
<%
/*****************
ord_ref=session("ord_ref")
if ord_ref="" then

	Response.Write "<p>&nbsp;</p><p align=center><font face=Verdana color=#004080><strong>" & _    
					"Please complete your Order Entry and save it.</strong></font></p>"
Response.end
end if
typ=request("typ")
'Response.Write(typ)

*******************/

String ord_ref = new String();

if(request.getParameter("sOrdId") != null){

      ord_ref = request.getParameter("sOrdId");

}else{
    if(orderBean.getsOrdId() != null) ord_ref = orderBean.getsOrdId();
         else ord_ref = "20895";
}

ord_ref = "20895";
System.out.println("SOUVIK      "+ord_ref);




// New code 22.09.10 start

String a              = new String();
String b              = new String();
String c              = new String();
String d              = new String();
String e              = new String();
String f              = new String();
String g              = new String();
String h              = new String();
String q              = new String();
String safety_cl      = new String();
String cleaning_cl    = new String();
String dept           = new String();
String sl_no          = new String();
String ord_dt         = new String();
String ac_no          = new String();
String scope          = new String();
String cont           = new String();
String cont_ad        = new String();
String budg_ac        = new String();
String qtn_no         = new String();
String qtn_amt        = new String();
String qtn_dt         = new String();
String ord_amt        = new String();
String retn           = new String();
String pct            = new String();
String esi_cl         = new String();
String jstat          = new String();
String justif 	      = new String();
String qtn2_no        = new String();
String qtn2_dt        = new String();
String qtn2_amt       = new String();
String equip          = new String();
String jobtyp         = new String();
String tc             = new String();
String job_typ        = new String();
String cap_scheme_no  = new String();
String unit	      = new String();
String erp_ac	      = new String();
String signatory      = new String(); 
String signatory_loc  = new String(); 
String supporting_sig = new String();
//String sup_sig	      = new String();
String[] sup_sig      = new String[10];
String p2             = new String();
String ord_no         = new String();
String tc_rev         = new String();
String typ            = new String();

String sql0           = new String();
String sql            = new String();
String sql1           = new String();
String sql2           = new String();
String sql3           = new String();

PreparedStatement ps0 = null;
PreparedStatement ps  = null;
PreparedStatement ps1 = null;
PreparedStatement ps2 = null;
PreparedStatement ps3 = null;

ResultSet         rs0 = null;
ResultSet         rs  = null;
ResultSet         rs1 = null;
ResultSet         rs2 = null;
ResultSet         rs3 = null;

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
mk.con.setAutoCommit(false);


try{


sql0   ="select o.SAFETY_RELATED safety_cl,o.ENVIRONMENT_CLAUSE cleaning_cl, "+
        "o.P1_Q1_NO a,TO_CHAR(o.P1_Q1_DATE,'DD-MON-RRRR') b,o.JOB_DESC c,o.job_type d, "+
        "o.P1_Q1_TOTAL e,o.P1_Q2_NO f,TO_CHAR(o.P1_Q2_DATE,'DD-MON-RRRR') g,o.P1_Q2_TOTAL h,o.vendor_name q "+
        "from  ORBL_ORD_DTL o, ORBL_VENDOR_MST c  "+
        "where o.vendor_code = c.vendor_code "+
        "and o.ORDER_ID = "+ord_ref+"";


ps0    = mk.con.prepareStatement(sql0);

rs0    =ps0.executeQuery();

while(rs0.next()){

a          =rs0.getString("a");
b          = rs0.getString("b");
c          =rs0.getString("c");
d          =rs0.getString("d");
e          =rs0.getString("e");
f          =rs0.getString("f");
g          =rs0.getString("g");
h          =rs0.getString("h");
q          =rs0.getString("q");
safety_cl  =rs0.getString("safety_cl");
cleaning_cl=rs0.getString("cleaning_cl");

}

ps0.close();
rs0.close();
rs0=null;


sql="select * from ord o,job  j,cont c,justif x where o.ord_ref=j.ord_ref and j.cont_ref=c.cont_ref and j.justif=x.id(+) and o.ord_ref="+ord_ref+" ";

 sql =  "  select nvl(o.dept, ' ')                           dept,	        " +
        "  nvl(o.ORDER_SEQUENCE, 0  )                        sl_no,		" +
        "  nvl(to_char(o.ORDER_DATE,'DD-MON-RRRR'), ' ')     ord_dt,		" +
        "  'DUMMY'                                           ac_no,		" +
        "  nvl(o.job_desc, ' ')                              scope,		" +
        "  nvl(o.vendor_name, ' ')                           cont,		" +
        "  nvl(address1||address2||address3||address4, ' ')  cont_ad,		" +
        "  nvl(o.budget_head, ' ')                           budg_ac,		" +
        "  nvl(o.P1_Q1_NO,' ')                               qtn_no,		" +
        "  nvl(o.P1_Q1_TOTAL, 0 )                            qtn_amt,		" +
        "  nvl(to_char(o.P1_Q1_DATE,'DD-MON-RRRR'),' ')      qtn_dt,		" +
        "  nvl(o.ORDER_VALUE, 0 )                            ord_amt,		" +
        "  nvl(o.RETENTION_PRCNT,0  )                        retn,		" +
        "  'DUMMY'                                           pct,		" +
        "  nvl(o.ESI_CLAUSE,' ')                             esi_cl,		" +
        "  nvl(o.JOB_COMPLETE,' ')                           jstat,		" +
        "  nvl(x.RECOMMENDATION_DESC,' ')                    text ,		" +
        "  nvl(o.RECOMMENDATION_SUPPLEMENTARY, ' ')          justif,		" +
        "  nvl(o.P1_Q2_NO,' ')                               qtn2_no,		" +
        "  nvl(o.P1_Q2_TOTAL,0  )                            qtn2_amt,		" +
        "  nvl(TO_CHAR(o.P1_Q2_DATE,'DD-MON-RRRR'),' ')      qtn2_dt,		" +
        "  nvl(o.EQUIP,0  )                                  equip,		" +
        "  nvl(o.JOB_TYPE,' ')                               jobtyp,		" +
        "  nvl(o.ORDER_TYPE,' ')                             tc ,		" +
        "  nvl(o.CAPEX_SCHEME_NO,' ')                        cap_scheme_no,	" +
        "  nvl(o.unit,' ')                                   unit		" +
        "  from ORBL_ORD_DTL o, ORBL_VENDOR_MST c,			" +
        "  ORBL_CD_RECOMMENDATION x					" +
        "  where o.vendor_code = c.vendor_code				" +
        "  and o.RECOMMENDATION=x.RECOMMENDATION(+)			" +
        "  and o.ORDER_ID= "+ord_ref+"					" ;





ps = mk.con.prepareStatement(sql);

rs=ps.executeQuery();


while(rs.next()){

dept        =rs.getString("dept");
sl_no       =rs.getString("sl_no");
ord_dt      =rs.getString("ord_dt");
ac_no       =rs.getString("ac_no");
scope       =rs.getString("scope");
cont        =rs.getString("cont");
cont_ad     =rs.getString("cont_ad");
budg_ac     =rs.getString("budg_ac");
qtn_no      =rs.getString("qtn_no");
qtn_amt     =rs.getString("qtn_amt");
qtn_dt      =rs.getString("qtn_dt");
ord_amt     = rs.getString("ord_amt");
retn        =rs.getString("retn");
pct         =rs.getString("pct");
esi_cl      =rs.getString("esi_cl");
jstat       =rs.getString("jstat");
justif      =rs.getString("justif");
 
qtn2_no     =rs.getString("qtn2_no");
qtn2_dt     =rs.getString("qtn2_dt");
qtn2_amt    =rs.getString("qtn2_amt");
budg_ac     =rs.getString("budg_ac");
dept        =rs.getString("dept");
equip       =rs.getString("equip");
jobtyp      =rs.getString("jobtyp");
tc          =rs.getString("tc");
job_typ     =rs.getString("jobtyp");
cap_scheme_no=rs.getString("cap_scheme_no");

unit        =rs.getString("unit");

if(justif!=null){
	if (justif.length() ==1 )
		justif=rs.getString("text");
	else
       justif=rs.getString("justif");
       
}

}
ps.close();
rs.close();
rs=null;


sql1="select erp_code erp_ac from ORBL_ORD_DTL where order_id='"+ord_ref+"'";

ps1 = mk.con.prepareStatement(sql1);
rs1 = ps1.executeQuery();


while(rs1.next()){

erp_ac       =rs1.getString("erp_ac");

}
ps1.close();
rs1.close();
rs1=null;


sql2="select signatory,signatory_loc,supporting_sig from ORBL_CD_SIGNATORY_MST where " + ord_amt + " between limit1 and limit2";
ps2 = mk.con.prepareStatement(sql2);
rs2 = ps2.executeQuery();


while(rs2.next()){

signatory       =rs2.getString("signatory");
signatory_loc   =rs2.getString("signatory_loc");
supporting_sig  =rs2.getString("supporting_sig");
}
ps2.close();
rs2.close();
rs2=null;

//sup_sig=Split(supporting_sig,"~",-1,1);

sup_sig = supporting_sig.split("~");


if(job_typ.equals("L")){

sql3="select o.vendor_name p2,nvl(o.P1_Q2_NO,'NIL') qtn2_no,TO_CHAR(o.P1_Q2_DATE,'DD-MON-RRRR') qtn2_dt, o.P1_Q2_TOTAL qtn2_amt from ORBL_ORD_DTL where order_id="+ord_ref;


ps3 = mk.con.prepareStatement(sql3);
rs3 = ps3.executeQuery();


while(rs3.next()){

p2       =rs3.getString("p2");
qtn2_no  =rs3.getString("qtn2_no");
qtn2_dt  =rs3.getString("qtn2_dt");
qtn2_amt =rs3.getString("qtn2_amt");

}
ps3.close();
rs3.close();
rs3=null;
}


if(tc.equals("T")){
  ord_no="BBGS/"+dept+"/ORD/TC/"+sl_no+"/"+tc_rev;
}
if(tc.equals("R")){
ord_no="BBGS/"+dept+"/ORD/RC/"+sl_no+"/"+tc_rev;
}
if(tc.equals("O")){
     ord_no="BBGS/"+dept+"/ORD/"+sl_no;
}

if(tc.equals("C")){ 
  ord_no="BBGS/"+dept+"/ORD/CAPEX/"+sl_no;
}

System.out.println(job_typ);
%>
<p>&nbsp;</p>

<p>&nbsp;</p>

<% if(job_typ.equals("F")){ %>


<div id="justif" name="justif">
<table width="80%" align="center">

<tr>
    <td align="left" nowrap colspan="2"><font face="Verdana" size="3"><i><strong>Account no:</strong>&nbsp;<%=erp_ac%>
    <%if(tc.equals("O")){ %> <strong>&nbsp;&nbsp;&nbsp;&nbsp;Budget Head:</strong>&nbsp;<%=budg_ac%> <% } %></i></font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td><font face="Verdana" size="3"><strong><u>Justification for Order No. <%=ord_no%></u></strong></font></td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
<%  if(d.equals("L")){
 %>
  </tr>
  <tr>
    <td><strong><font face="Verdana" size="3">Quotations received : </font></strong></td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td><table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><font face="Verdana" size="2" colspan="3">Contractor I : <%=cont%></font></td>
      </tr>
      <tr>
        <td><font face="Verdana" size="2">Quotation No.: <%=a%></font></td>
        <td><font face="Verdana" size="2">Qtn date : <%=b%></font></td>
        <td><font face="Verdana" size="2">Amt. : Rs. <%=e%></font></td>
      </tr>
      <tr>
        <td colspan="3"></td>
      </tr>
      <tr>
        <td><font face="Verdana" size="2" colspan="3">Contractor II : <%=q%></font></td>
      </tr>
      <tr>
        <td><font face="Verdana" size="2">Quotation No.: <%=f%></font></td>
        <td><font face="Verdana" size="2">Qtn date : <%=g%></font></td>
        <td><font face="Verdana" size="2">Amt. : Rs. <%=h%></font></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td><font face="Verdana" size="3">Quotation received from M/s <%=cont%> being lower, order may
    please be placed on them.</font></td>
  </tr>
<%  }  %>
<%  if(d.equals("S")){   %>
  <tr>
    <td><strong><font face="Verdana" size="3">Only quotation received from : </font></strong></td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td><table border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td colspan="3" nowrap><font face="Verdana" size="2"><strong>M/s <%=cont%></strong></font></td>
      </tr>
      <tr>
        <td colspan="3" nowrap></td>
      </tr>
      <tr>
        <td nowrap><font face="Verdana" size="2">Quotation No.: <%=a%></font></td>
        <td nowrap><font face="Verdana" size="2">Qtn date : <%=b%></font></td>
        <td nowrap><font face="Verdana" size="2">Amt. : Rs. <%=e%></font></td>
      </tr>
    </table>
    </td>
  </tr>
<%  }  %>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td><font face="Verdana" size="3"><%=c%></font> </td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td>&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td>
      <table border="0" cellspacing="0" cellpadding="0">
      <tr>
<%
		for(int i = 0; sup_sig[i] != null; i++){
	%>
 <td valign="top"><strong><font face="Verdana" size="3"><%=sup_sig[i]%>&nbsp;&nbsp;&nbsp;</font></strong></td>

    <%if(sup_sig[i+1]!= null){ %>

        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
<%    } 
   } 
    %>
      </tr>
    </table>
    </td>
  </tr>
</table>
</div>

<%    }
}catch(Exception ee){ ee.printStackTrace(); }
      finally{ mk.con.close(); } %>

</body>
</html>

