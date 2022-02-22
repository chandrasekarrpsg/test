<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>

<jsp:useBean id="orderBean" class="VO.OrderBean" scope="session"/>

<html>
<!-- #include file="../../mylib/dates.inc"-->
<!-- #include file="../../mylib/rstowords.inc"-->

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
String sup_sig	      = new String();
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


rs0.close();
ps0.close();
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
rs.close();
ps.close();
rs=null;


sql1="select erp_code erp_ac from ORBL_ORD_DTL where order_id='"+ord_ref+"'";

ps1 = mk.con.prepareStatement(sql1);
rs1 = ps1.executeQuery();


while(rs1.next()){

erp_ac       =rs1.getString("erp_ac");

}

rs1.close();
ps1.close();
rs1=null;


sql2="select signatory,signatory_loc,supporting_sig from ORBL_CD_SIGNATORY_MST where " + ord_amt + " between limit1 and limit2";
ps2 = mk.con.prepareStatement(sql2);
rs2 = ps2.executeQuery();


while(rs2.next()){

signatory       =rs2.getString("signatory");
signatory_loc   =rs2.getString("signatory_loc");
supporting_sig  =rs2.getString("supporting_sig");
}

rs2.close();
ps2.close();
rs2=null;

//sup_sig=Split(supporting_sig,"~",-1,1);

sup_sig = supporting_sig.split("~")[0];


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

rs3.close();
ps3.close();
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

%>
<div align="center"><center>

<table border="0" cellpadding="0" cellspacing="0" width="80%" style="border-collapse: collapse" bordercolor="#111111">

<% /*'*********************** Heading ************************************************* */%>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

 /***************** FILE COPY CHECK *******************/

<%if(typ.equals("F")){ %>
  <tr>
    <td colspan="2"><font face="Verdana" size="3"><strong>File Copy </strong></font></td>
  </tr>
<% } %>


/**************************************************/

  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2"><font face="Verdana" size="3"><strong>Ref: <%=ord_no%></strong></font></td>
  </tr>
  <tr>
    <td colspan="2"><font face="Verdana" size="3"><strong>Date: <%=ord_dt%></strong></font></td>
  </tr>
  <tr>
    <td align="left" colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>

/******************** VENDOR NAME ADDRESS **************************/

  <tr>
    <td colspan="2"><font face="Verdana" size="3"><strong><%=cont%></strong></font>
    &nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2"><textarea rows="0" id="cont_ad" name="cont_ad" cols="100"
    style="overflow: hidden; font-family: Verdana; font-size: 12; border: medium none"><%=cont_ad%></textarea>
    </td>
  </tr>

/*****************************************************************/
/************** ACCOUNT NO & BUDGET HEAD & SCHEME NO ************/

  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="center" nowrap colspan="2"><font face="Verdana" size="3"><i><strong>Account no:</strong>&nbsp;<%=erp_ac%>
    <%if(tc.equals("O")){ %> <strong>&nbsp;&nbsp;&nbsp;&nbsp;Budget Head:</strong>&nbsp;<%=budg_ac%><% } %></i></font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <%if(tc.equals("C")){%>
  <tr>
    <td align="center" nowrap colspan="2"><font face="Verdana" size="3"><i><strong>Scheme No:</strong>&nbsp;<%=cap_scheme_no%>
    <strong>&nbsp;&nbsp;&nbsp;&nbsp;</strong>&nbsp;</i></font></td>
  </tr>
  <% } %>

/******************************************************************/

/******************** SCOPE WORK *********************************/
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td valign="top" nowrap><font face="Verdana" size="3"><strong>Scope of work :&nbsp; </strong></font></td>
    <td valign="center"><font face="Verdana" size="3"><strong><%=scope%></strong></font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><b>&nbsp;<font face="Verdana" size="3">Dear Sir ,</font></b></td>
  </tr>
  <tr>
    <td align="left" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% /* '*********************** /Heading *************************************************/ %>
<% /* '*********************** Opening Lines **** HERE REMOVED********************************/ %>
  <tr>
    <td colspan="2"><font face="Verdana" size="3">We thank you for your quotation No:<strong> <%=a%>
    </strong>dated <%=b%> and are pleased to place this order on you for the job(s) detailed in your
    quotation at an amount of Rs. <%=ord_amt%> </font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
<%if(esi_cl.equals("Y") || safety_cl.equals("Y") ||  cleaning_cl.equals("Y") || !retn.equals("")){ %>
  <tr>
    <td colspan="2"><font face="Verdana" size="3">This order is being placed subject to the
    following terms and conditions:</font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% } %>
<% /* '*********************** /Opening Lines *************************************************/ %>
<% /* '*********************** ESI Clause *************************************************/ %>
<%if(esi_cl.equals("Y")){%>
  <tr>
    <td colspan="2"><font face="Verdana" size="3">You will be responsible for all statutory
    obligations under the Contract Labour (Regulation and Abolition) Act 1970, ESI Act 1948
    and Employees Provident Fund and Miscellaneous Provisions Act 1952 and you will keep us
    indemnified against all claims and disputes arising out of death or injury to your workmen
    and staff.</font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% } %>
<%/* '*********************** /ESI Clause ************************************************* */%>
<%/* '*********************** Safety Clause ************************************************* */%>
<% if(safety_cl.equals("Y")){ %>
  <tr>
    <td colspan="2"><font face="Verdana" size="3">You are to ensure safety of your workers at
    site while working and provide all kinds of safety equipments required for the job like
    safety belts, ladders,net/personal protective device etc. to your workmen. Before
    execution of the job at site you are to take necessary permits to work from the concerned
    department. A maximum penalty amounting to 5% of the order value will be applicable for
    non-compliance to safety norms.</font></td>
  </tr>
  <tr>
    <td colspan="2"><font face="Verdana" size="3">&nbsp;&nbsp; </font></td>
  </tr>
<% } %>
<% /*********************** /Safety Clause *************************************************/ %>
<% /*********************** Cleaning Clause *************************************************/ %>
<% if(cleaning_cl.equals("Y")){ %>
  <tr>
    <td colspan="2"><font face="Verdana" size="3">Site cleaning must be done by you upto the
    satisfaction of the controlling officer after completion of the job. All scrap materials
    should be removed to the place specified by the controlling officer. A maximum penalty
    amounting to 5% of the order value will be applicable if scrap materials are not removed
    within 48 Hrs of completion of the job.</font></td>
  </tr>
  <tr>
    <td colspan="2"><font face="Verdana" size="3">&nbsp;&nbsp; </font></td>
  </tr>
<% } %>
<% /*********************** /Cleaning Clause *************************************************/ %>
<% /*********************** Retention Clause *************************************************/ %>

<% if(retn.equals("5")){ %>
  <tr>
    <td colspan="2"><font face="Verdana" size="3"><%=retn%>% of the Labour component of billed value 
    will be withheld as retention and released only after ascertaining that all terminal payments, as applicable, 
    have been made by you.</font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% } %>

<% if(retn.equals("10")){ %>
  <tr>
    <td colspan="2"><font face="Verdana" size="3"><%=retn%>% of the Labour component of billed value 
    will be withheld as retention and released only after ascertaining that all terminal payments, as applicable, 
    have been made by you.</font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% } %>

<% /*********************** /Retention Clause *************************************************/ %>
<% /*********************** Job Status Clause *************************************************/ %>
<% if(jstat.equals("N")){ %>
  <tr>
    <td colspan="2"><font face="Verdana" size="3">After successful completion of the
    aforementioned job you may please send the bill to us for payment. Service tax will be
    paid extra as applicable.</font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

<% } %>

<% if(jstat.equals("Y")){ %>
  <tr>
    <td colspan="2"><font face="Verdana" size="3">Since you have already carried out the work
    as instructed by the station engineers, you may please send your bill to us for payment.
    Service tax will be paid extra as applicable.</font></td>
  </tr>

<% } %>

  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% /*********************** /Job Status Clause *************************************************/ %>
  <tr>
    <td colspan="2"><font face="Verdana" size="3">Yours faithfully,</font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% /*********************** Signatory *************************************************/ %>
  <tr>
    <td colspan="2"><strong><font face="Verdana" size="3"><%=signatory%> <br>
<%=signatory_loc%>    </font></strong></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;</td>
  </tr>
<% /*********************** /Signatory *************************************************/ %>
<% /*********************** DGM (Finance) *************************************************/ %>
<% if(typ.equals("Fin")){%>
  <tr>
    <td colspan="2"><font face="Verdana" size="3">cc: The Dy. General Manager (Finance): For
    necessary actions as warranted in terms and conditions of this order.</font></td>
  </tr>
<% } %>
</table>
</center></div>
<center><input type="button" value="PRINT" onClick="this.style.visibility='hidden'; window.print();"></center>
<% /*********************** /DGM (Finance) *************************************************/ %>
<%/*********************** Justification *************************************************/ %>
<% if(typ.equals("F")){ %>


<p><br CLASS="page">
</p>
<div id="justif" name="justif"></div>

<%   
      }
}catch(Exception ee){ ee.printStackTrace(); }
   finally{ mk.con.close(); }

//}

 %>


</body>
</html>

