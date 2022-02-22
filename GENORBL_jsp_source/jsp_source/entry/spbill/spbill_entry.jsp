
<html>
<!--#include file="mylib/form_functions.inc"-->
<!-- #include file="mylib/sel_date.inc"-->
<!-- #include file="mylib/sel_month.inc"-->
<!--#include file="mylib/dates.inc"-->
<!-- #include file="mylib/adovbs.inc" -->
<!--#include file="mylib/dates.inc"-->

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>


<head>

<title></title>
<script src="js/splbill_form_functions.js"></script>
<script src="js/best_cal_ag.js"></script>
<script src="js/sel_month.js"></script>
<script src="js/spl_bill_dates.js"></script>
<script src="js/jquery-1.4.4_genorbl.js"></script>




<script LANGUAGE="javascript">
function sel_cont()
{
document.f1.party_name.value="";
document.f1.party.value="";
var url="contractor_list.jsp?"
var c=showModalDialog(url,0,"dialogWidth:400px;dialogHeight:700px");
var cnarray=c.split("~");
document.f1.party.value=cnarray[0];
document.f1.party_name.value=cnarray[1];
}
</script>



</head>



<%


  MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    String curdate = new String() ;

    try {
        PreparedStatement ps = null ;
		 PreparedStatement ps2 = null ;
        ResultSet rs = null ;
        ResultSet rs2 = null ;
        ResultSet rs3 = null ;

     

String billref=request.getParameter("billref") == null?"":request.getParameter("billref");
String unit=request.getParameter("unit") == null ?"":request.getParameter("unit");
String jobtyp=request.getParameter("jobtyp") == null?"":request.getParameter("jobtyp");
String pl_cd_cl = "";
String j_typ = "";

String x1 = "";
String x2 = "";
String x3 = "";
String x4 = "";
String x5 = "";
String x6 = "";
String x7 = "";
String x8 = "";
String x9 = "";
String x10 = "";
String x11 = "";
String x12 = "";
String x13 = "";
String x14 = "";
String x15 = "";
String x16 = "";
String x17 = "";
String x18 = "";
String x19 = "";
String x20 = "";
String x21 = "";
String s_dept = session.getAttribute("dept")== null ?"": session.getAttribute("dept").toString();

String edit_clause = "";
String del_clause = "";
String unt = "";
String mn = "";


if( !unit.equals("")){
if (unit.equals("1")){
   unt="1&2";
}else if( unit.equals("2")){
 unt="3";
}else if  (unit.equals("3")){
unt="Common";
}
}




if (!jobtyp.equals("") && !unit.equals("")) {

	if (jobtyp.equals("M")){
		pl_cd_cl=" where m_cc is not null and unit like '%"+unit+"%' " ;
	}else{
		pl_cd_cl=" where o_cc is not null and unit like '%"+unit+"%' ";
    }
}else{
pl_cd_cl="";
}



String sql1="";
String sql2="";
String sql = "";

 sql1="select distinct pl_cd,pl_ref from ORBL_PL_CC_MST "+pl_cd_cl+" " ;

int bill_amt = 0;
String  bill_cl = "";
String bill_dt = "";
String bill_no = "" ;
String billrel_id = "";
String budg_ac = "";
String cert_by = "";
String dept = "";
String descrip="" ;
String eqref="" ;
String fnf="" ;
String monthStr ="" ;
String orddt = "";
String ordno = "";
String party ="";
String status ="";
String cert_by_name ="";
int l = 0;
String erp_ac ="";
String erp_ac_no = "                            ";


String pl_ref = "";
String ref = "";
String party_name = "";


/*
sql2="select distinct equip,ref,pl_ref from code where pl_ref is not null"

Application("cn_ord")="Provider=OraOLEDB.Oracle.1;Password=gen2;Persist Security Info=True;User ID=gen2;Data Source=gen2"

set rs = server.CreateObject("ADODB.Recordset")
rs.open sql2,application("cn_ord")
codearray=rs.getrows
rs.close
set rs=nothing

*/


if (billref.equals("add")){

bill_amt=0;
//bill_cl=orcl_dt(date);
bill_dt="";
bill_no="";
billrel_id="";
budg_ac="";
cert_by= session.getAttribute("code")== null ?"": session.getAttribute("code").toString();

dept= session.getAttribute("dept")== null ?"": session.getAttribute("dept").toString();
descrip="";
eqref="";
fnf="";
jobtyp=request.getParameter("jobtyp")==null?"":request.getParameter("jobtyp");

orddt="";
ordno="";
party="";
status="";
cert_by_name=session.getAttribute("name")== null ?"": session.getAttribute("name").toString();

l=0;

}else{
l=1;
	
/*

sql=" select bill_amt,bill_cl,bill_dt,bill_no,billref,billrel_id,budg_ac,CERT_BY,dept,descrip,unit, " +
    " eqref,fnf,jobtype,to_char(month,'MON-YY') mn,orddt,ordno,party,status,cert_by_name,unit,erp_ac   from ORBL_SPBILL_DTL where"+ "billref="+billref+" ";

	*/





sql   =     " select  bill_amt , "+  
			"to_char(bill_cl,'MON-YY') bill_cl,     "+
			"to_char(bill_dt,'dd-MON-YYYY') bill_dt ,  "+
			"bill_no,  "+
			"billref,  "+
			"billrel_id,  "+
			"budg_ac,  "+
			"CERT_BY,  "+
			"dept,  "+
			"descrip,  "+
			"unit, " +
			" eqref,  "+
			"fnf,  "+
			"jobtype,  "+
			"to_char(orddt,'dd-MON-YYYY') orddt ,"+
			"ordno,  "+
			"party,  "+
			"status,  "+
			"cert_by_name,  "+
			"unit,erp_ac     "+
			"from ORBL_SPBILL_DTL  "+
			"where  billref="+billref+
			"  and  GENSTN =   'BBGS'  ";

ps = null;
rs = null;

ps = mk.con.prepareStatement(sql) ;
 rs = ps.executeQuery() ;
if(rs.next()){



/*
Application("cn_ord")="Provider=OraOLEDB.Oracle.1;Password=gen2;Persist Security Info=True;User ID=gen2;Data Source=gen2"

 set rs=server.CreateObject("adodb.recordset")
rs.Open sql,application("cn_ord")
*/


cert_by_name=rs.getString("cert_by_name")==null?"":rs.getString("cert_by_name");
bill_amt=rs.getInt("bill_amt");
bill_cl=rs.getString("bill_cl")==null?"":rs.getString("bill_cl");
bill_dt=rs.getString("bill_dt")==null?"":rs.getString("bill_dt");
bill_no=rs.getString("bill_no")==null?"":rs.getString("bill_no");
billref=rs.getString("billref")==null?"":rs.getString("billref");
billrel_id=rs.getString("billrel_id")==null?"":rs.getString("billrel_id");
budg_ac=rs.getString("budg_ac")==null?"":rs.getString("budg_ac");
cert_by=rs.getString("cert_by")==null?"":rs.getString("cert_by");
dept=rs.getString("dept")==null?"":rs.getString("dept");
descrip=rs.getString("descrip")==null?"":rs.getString("descrip");
eqref=rs.getString("eqref")==null?"":rs.getString("eqref");
fnf=rs.getString("fnf")==null?"":rs.getString("fnf");
mn=rs.getString("bill_cl")==null?"":rs.getString("bill_cl");
orddt=rs.getString("orddt")==null?"":rs.getString("orddt");
ordno=rs.getString("ordno")==null?"":rs.getString("ordno");
party=rs.getString("party")==null?"":rs.getString("party");
status=rs.getString("status")==null?"":rs.getString("status");

unit=rs.getString("unit")==null?"":rs.getString("unit") ;
jobtyp=rs.getString("jobtype")==null?"":rs.getString("jobtype");
erp_ac=rs.getString("erp_ac");
erp_ac_no=erp_ac == null?"                            ":erp_ac;


}

rs.close();
ps.close();

}


System.out.println("  eqref:   "+eqref+"  jobtyp:  "+jobtyp);

if (!jobtyp.equals("")){
if( jobtyp.equals("M")){
   j_typ="Maintenance";
}else{
 j_typ="Operation";
}
}



if (!billref.equals("add")){
	sql=" SELECT * FROM ORBL_PL_CC_MST c1, ORBL_EQUIP_MST c2 WHERE c1.pl_ref = c2.pl_ref and c2.REFNO = "+eqref+" ";

     ps = null;
rs = null;

ps = mk.con.prepareStatement(sql) ;
 rs = ps.executeQuery() ;
if(rs.next()){
	pl_ref=rs.getString("pl_ref");
	ref=rs.getString("REFNO");
	}
rs.close();
ps.close();

	
 //  sql_party=" select cont party_name from cont where cont_ref="&party&" ";
    sql=" select V_NAME from ORBL_VENDOR_MST where VENDOR_REF ="+party+" ";

  
    ps = null;
rs = null;

ps = mk.con.prepareStatement(sql) ;
 rs = ps.executeQuery() ;
if(rs.next()){
party_name=rs.getString("V_NAME");
	}
rs.close();
ps.close();
	
	   
   

}




/*

'FOR ERP A/C
'if billref<>"add" then
'sql1="select erp('"&budg_ac&"','"&dept&"',"&eqref&",'"&jobtype&"','"&tc&"','"&unit&"') erp_ac_no from dual"

'set rs1=server.createobject("adodb.recordset")
'rs1.open sql1, application("cn_ord")

'erp_ac_no=rs1("erp_ac_no")


'rs1.Close
'set rs1=nothing

x1=left(right(erp_ac_no,21),1)
x2=left(right(erp_ac_no,20),1)
x3=left(right(erp_ac_no,19),1)
x4=left(right(erp_ac_no,18),1)
x5=left(right(erp_ac_no,17),1)
x6=left(right(erp_ac_no,16),1)
x7=left(right(erp_ac_no,15),1)
x8=left(right(erp_ac_no,14),1)
x9=left(right(erp_ac_no,13),1)
x10=left(right(erp_ac_no,12),1)
x11=left(right(erp_ac_no,11),1)
x12=left(right(erp_ac_no,10),1)
x13=left(right(erp_ac_no,9),1)
x14=left(right(erp_ac_no,8),1)
x15=left(right(erp_ac_no,7),1)
x16=left(right(erp_ac_no,6),1)
x17=left(right(erp_ac_no,5),1)
x18=left(right(erp_ac_no,4),1)
x19=left(right(erp_ac_no,3),1)
x20=left(right(erp_ac_no,2),1)
x21=left(right(erp_ac_no,1),1)
*/


System.out.println("  erp_ac_no.length() : "+erp_ac_no.length());

 x1 = erp_ac_no.substring((erp_ac_no.length()-21),erp_ac_no.length()-20) ;
 x2 = erp_ac_no.substring((erp_ac_no.length()-20),erp_ac_no.length()-19) ;
 x3 = erp_ac_no.substring((erp_ac_no.length()-19),erp_ac_no.length()-18) ;
 x4 = erp_ac_no.substring((erp_ac_no.length()-18),erp_ac_no.length()-17) ;
 x5 = erp_ac_no.substring((erp_ac_no.length()-17),erp_ac_no.length()-16) ;
 x6 = erp_ac_no.substring((erp_ac_no.length()-16),erp_ac_no.length()-15) ;
 x7 = erp_ac_no.substring((erp_ac_no.length()-15),erp_ac_no.length()-14) ;
 x8 = erp_ac_no.substring((erp_ac_no.length()-14),erp_ac_no.length()-13) ;
 x9 = erp_ac_no.substring((erp_ac_no.length()-13),erp_ac_no.length()-12) ;
 x10 = erp_ac_no.substring((erp_ac_no.length()-12),erp_ac_no.length()-11) ;
 x11 = erp_ac_no.substring((erp_ac_no.length()-11),erp_ac_no.length()-10) ;
 x12 = erp_ac_no.substring((erp_ac_no.length()-10),erp_ac_no.length()-9) ;
 x13 = erp_ac_no.substring((erp_ac_no.length()-9),erp_ac_no.length()-8) ;
 x14 = erp_ac_no.substring((erp_ac_no.length()-8),erp_ac_no.length()-7) ;
 x15 = erp_ac_no.substring((erp_ac_no.length()-7),erp_ac_no.length()-6) ;
 x16 = erp_ac_no.substring((erp_ac_no.length()-6),erp_ac_no.length()-5) ;
 x17 = erp_ac_no.substring((erp_ac_no.length()-5),erp_ac_no.length()-4) ;
 x18 = erp_ac_no.substring((erp_ac_no.length()-4),erp_ac_no.length()-3) ;
 x19 = erp_ac_no.substring((erp_ac_no.length()-3),erp_ac_no.length()-2) ;
 x20 = erp_ac_no.substring((erp_ac_no.length()-2),erp_ac_no.length()-1) ;
 x21 = erp_ac_no.substring((erp_ac_no.length()-1),erp_ac_no.length()-0) ;


/*
'end if



'END

'end if	
'Response.end

'Response.write("J3")

*/



	%>
<script LANGUAGE="javascript">

function plant_onchange() {
eval("document.f1.eqref"+"<%=pl_ref%>"+".style.display=\"none\"");
var plantselected=document.f1.plant_code.options[document.f1.plant_code.options.selectedIndex].value;
var plantselected_old=document.f1.equipindex.value;
if (plantselected_old!=""){
eval("document.f1.eqref"+plantselected_old+".style.display=\"none\"")};
eval("document.f1.eqref"+plantselected+".style.display=\"\"");
document.f1.equipindex.value=plantselected;
document.f1.plant_code.value=plantselected;
document.f1.eqref.value=plantselected;
}

function equip_onchange() {
var plantselected=document.f1.plant_code.options[document.f1.plant_code.options.selectedIndex].value;
eval("var equipval=document.f1.eqref"+plantselected+".options[document.f1.eqref"+plantselected+".options.selectedIndex].value");
document.f1.eqref.value=equipval;
}



function validate_form() {


if(f1.dept.value==""){
		alert("Please Select Department !!");
		return(0);
		}
		
		
		if(f1.party.value==""){
		alert("Please Select Party !!");
		return(0);
		}
	
		
		if(f1.month.value==""){
		alert("Please Select For the Month  !!");
		return(0);
		}
		
		
		if(f1.fnf.value==""){
		alert("Please Fuel/Non Fuel !!");
		return(0);
		}
		
		if(f1.status.value==""){
		alert("Please Select Status !!");
		return(0);
		}			
if(f1.budg_ac.value==""){
		alert("Please Select Budget A/c !!");
		return(0);
		}	
		
			
	return 1;
	
}


function old() {
<%
/*
if action="close" then
	'response.write("window.close()")
end if
*/

%>	


	lock_controls(<%=l%>);
}



function sel_budg()
{
var url="budget.jsp?";
window.f1.budg_ac.value="Please wait..........";
window.status="Opening Budget Heads Menu !. Please wait.....................";
var c=showModalDialog(url,0,"dialogWidth:950px;dialogHeight:600px");
window.status=" ";
if (c!=null) {
	document.f1.budg_ac.value=c;
}
else {
	document.f1.budg_ac.value="";
}
}
</script>


<%

//'------------Departmental Permissions-----
int dept_permission=0 ;

String lgnDeptStr = session.getAttribute("login_dept")== null ?"":session.getAttribute("login_dept").toString();


/*

select case session.getAttribute("login_dept");
case "MMD"
	select case s_dept
	case "FAA" dept_permission=1
	case "FAC" dept_permission=1
	case "MMD" dept_permission=1
	end select
case "E&I"	
	select case s_dept
	case "E&I" dept_permission=1
	end select
case "FAO"
	select case s_dept
	case "FAO" dept_permission=1
	end select
case "BBSG"
	select case	s_dept
	case "BBSG" dept_permission=1
	case "SFR" dept_permission=1
	end select
case "PLG"
	select case s_dept
	case "PLG" dept_permission=1
	end select
case "ENV"
	select case s_dept
	case "ENV" dept_permission=1
	end select
case "OPS"
	select case s_dept
	case "OPS" dept_permission=1
	end select
case "TMD"
	select case s_dept
	case "TMD" dept_permission=1
	end select	
case "IR"
	select case s_dept
	case "IR" dept_permission=1
	end select
end select			

*/
//'------------/ Permissions-----	



if(lgnDeptStr.equals("MMD")){

   if(s_dept.equals("FAA") || s_dept.equals("FAC") || s_dept.equals("MMD")  ){
    dept_permission=1;
   }

}else if(lgnDeptStr.equals("E&I")){
    if(s_dept.equals("E&I") ){
    dept_permission=1;
   }
}else if(lgnDeptStr.equals("FAO")){
    if(s_dept.equals("FAO") ){
    dept_permission=1;
   }
}else if(lgnDeptStr.equals("BBSG")){
    if(s_dept.equals("BBSG") || s_dept.equals("SFR")  ){
    dept_permission=1;
   }
}else if(lgnDeptStr.equals("PLG")){
    if(s_dept.equals("PLG")  ){
    dept_permission=1;
   }
}else if(lgnDeptStr.equals("ENV")){
    if(s_dept.equals("ENV")  ){
    dept_permission=1;
   }
}else if(lgnDeptStr.equals("OPS")){
    if(s_dept.equals("OPS")  ){
    dept_permission=1;
   }
}else if(lgnDeptStr.equals("TMD")){
    if(s_dept.equals("TMD")  ){
    dept_permission=1;
   }
}else if(lgnDeptStr.equals("IR")){
    if(s_dept.equals("IR")  ){
    dept_permission=1;
   }
}


String ssncodeStr = session.getAttribute("code")== null ?"":session.getAttribute("code").toString();
String ssndeptStr = session.getAttribute("dept")== null ?"":session.getAttribute("dept").toString();



if( ssncodeStr.equals(cert_by) || ssndeptStr.equals(dept) ){
edit_clause="edit_onclick('spbill_entry_submit.jsp?billref="+billref+"')";
del_clause="del_onclick('spbill_entry_submit.jsp?del=1&billref="+billref+"','spbill_entry.jsp?billref="+billref+"')" ;
}else	{

edit_clause="edit_onclick('spbill_entry_submit.jsp?billref="+billref+"')";
del_clause="del_onclick('spbill_entry_submit.jsp?del=1&billref="+billref+"','spbill_entry.jsp?billref="+billref+"')" ;

	/*
	'edit_clause=""   'temporary incorporated for testing purpose.
	'del_clause=""
	*/

}

//'-----------------------------
%>


<body bgColor="ghostwhite" onload="old()">

<form name="f1" align="center">
  <input type="hidden" name="unit" value="<%=unit%>" />
  <input type="hidden" name="jobtype"  value="<%=jobtyp%>" />
  <input type="hidden" name="bill_cl" value="<%=bill_cl%>" />
  <input  type="hidden" name="party" value="<%=party%>" />
  <input type="hidden" name="eqref"  value="<%=eqref%>" />
  <input type="hidden" name="equipindex" value="" />
  <input type="hidden"  name="sub_sys_code" value="" />
  <dl>
    <dd align="center"><br>
      <br>
      <div align="center"><center><table bgcolor="#FFFFF0" border="2" cellspacing="1"      bordercolor="#800000">
        <tr>
          <td colspan="1"><font face="Verdana" size="3"><strong>Bill Released By&nbsp; </strong></font></td>
          <td><strong><font face="Verdana" size="3"><input name="cert_by_name" size="35"
          value="<%=cert_by_name%>"></font></strong></td>
          <td><font face="Verdana" size="3"><strong>Code</strong></font></td>
          <td><strong><font face="Verdana" size="3"><input name="cert_by" size="8"
          value="<%=cert_by%>"></font></strong></td>
        </tr>
        <tr>
          <td><font face="Verdana" size="3">Department</font></td>
          <td colspan="1"><select name="dept" size="1">
            <option value="BBSG">BBSG</option>
            <option value="CTM">CTM</option>
            <option value="E&amp;I">E&amp;I</option>
            <option value="FAM">FAM</option>
            <option value="FAO">FAO</option>
            <option value="IR">IR</option>
            <option value="MMD">MMD</option>
            <option value="OPS">OPS</option>
            <option value="PLG">PLG</option>
            <option value="STN">STN</option>
          </select></td>
          <td colspan="1" bgcolor="#0080FF"><font face="Verdana" size="3" color="#FFFFFF">Unit- <%=unt%></font></td>
          <td colspan="1" bgcolor="#0080FF"><font face="Verdana" size="3" color="#FFFFFF">Job type - <%=j_typ%>          </font></td>
        </tr>
        <tr>
          <td><font face="Verdana" size="3">Name Of the Party:</font></td>
          <td colspan="3"><font face="Verdana" size="3"><input name="party_name" size="60"
          value="<%=party_name%>" onclick="sel_cont('')"  ></font></td>
          <b>
        </tr>
        <tr>
          </b><td><font face="Verdana" size="3">Bill No</font></td>
          <td><font face="Verdana" size="3"><input name="bill_no" size="20" value="<%=bill_no%>"></font></td>
          <td>&nbsp;</td>
          <td colspan="1">&nbsp;</td>
          <b>
        </tr>
        <tr>
          </b><td><font face="Verdana" size="3">Bill Date</font></td>
          <td><font face="Verdana" size="3"><input name="bill_dt" size="12" value="<%=bill_dt%>"
          onclick='scwShow(this,event);'  ></font></td>
          <td><font face="Verdana" size="3">Order No(If Known)</font></td>
          <td colspan="1"><font face="Verdana" size="3"><input name="ordno" size="13"
          value="<%=ordno%>"></font></td>
          <b>
        </tr>
        <tr>
          </b><td><font face="Verdana" size="3">Gross Bill Amount</font></td>
          <td><font face="Verdana" size="3"><input name="bill_amt" size="12" value="<%=bill_amt%>"></font></td>
          <td><font face="Verdana" size="3">Order Date(If Known)</font></td>
          <td colspan="1"><font face="Verdana" size="3"><input name="orddt" size="13"
          value="<%=orddt%>" onclick='scwShow(this,event);' ></font></td>
          <b>
        </tr>
        <tr>
          </b><td><font face="Verdana" size="3">For The Month</font></td>
          <td><font face="Verdana" size="3"><input name="month" size="12" value="<%=mn%>"
          onclick="sel_month('f1.month','js/')"></font></td>
          <td><font face="Verdana" size="3">Fuel/Non Fuel</font></td>
          <td colspan="1"><select name="fnf" size="1">
            <option value="F">Fuel</option>
            <option value="N">Non Fuel</option>
          </select></td>
          <b>
        </tr>
        <tr>
          <td></b><font face="Verdana" size="3">Short Description</font></td>
          <td colspan="3"><font face="Verdana" size="3"><input name="descrip" size="50"
          value="<%= descrip %>"></font></td>
        </tr>
        <tr>
          <td><font face="Verdana" size="3">Bill Released On</font></td>
          <td><font face="Verdana" size="3"><%=bill_cl%></font></td>
          <td><font face="Verdana" size="3">Status</font></td>
          <td colspan="1"><select name="status" size="1">
            <option value="A">Actual</option>
            <option value="P">Provisional</option>
          </select></td>
          <b>
        </tr>
        <tr>
          </b><td><font face="Verdana" size="3"> Plant </font></td>
          <td colspan="3"><font face="Verdana" size="3"><select name="plant_code" size="1"
          style="Z-INDEX:-100; " LANGUAGE="javascript" onchange="return plant_onchange()">
            <option>&nbsp;</option>




<%
   
 sql1="select distinct pl_cd,pl_ref from ORBL_PL_CC_MST "+pl_cd_cl+" " ;

ps = mk.con.prepareStatement(sql1) ;
 rs = ps.executeQuery() ;
while(rs.next()){
%>
<option value="<%= rs.getString(2) %>"><%= rs.getString(1) %></option>
<%
}

rs.close();
ps.close();

ps = null;
rs = null;
%>        
</select> </font></td>
          <b>
        </tr>
        <tr>
          </b><td><font face="Verdana" size="3">Equipment</font></td>
          <td colspan="3">
		  
		  <%
          ps= null;
          rs = null;
		  rs2 = null ;
		  rs3 = null ;

sql2="select distinct equip,refno,pl_ref from ORBL_EQUIP_MST where pl_ref is not null" ;
 ps = mk.con.prepareStatement(sql1) ;
 rs = ps.executeQuery() ;
 //rs3 = rs ;
while(rs.next()){
%>

<select name="eqref<%= rs.getInt(2)%>" size="1" style="display:none; Z-INDEX:-100;"
   onchange="return equip_onchange()">
   <option>&nbsp;</option>
<%
rs2= null;
ps2 = null;
//rs2 = rs3 ;
ps2 = mk.con.prepareStatement(sql2) ;
 rs2 = ps2.executeQuery() ;
while(rs2.next()){

if( rs.getInt(2) == rs2.getInt(3)){
%>
        <option value="<%= rs2.getInt(2) %>"><%= rs2.getString(1) %></option>
<%
}

}
rs2.close();
ps2.close();

%>

</select>
<%

}

rs.close();
ps.close();

%>
</td>
          <b>
        </tr>
        <tr>
          </b><td><font face="Verdana" size="3">Budget Head</font></td>
          <td colspan="3"><font face="Verdana" size="3"><input name="budg_ac" size="15"
          value="<%=budg_ac%>" onclick="sel_budg()"></font></td>
          <b>
        </tr>
        <tr>
          <td colspan="4"><div align="center"><center><table>
            <tr>
              <td><b><font face="Times New Roman" color="#FFFFFF">Bill Code</font></b></td>
              <td bgcolor="ghostwhite" colspan="21"><div align="center"><center><p><font
              face="Times New Roman" size="5">BBGS/BILL/S:<%=billref%></font></td>
            </tr>
            <tr align="center">
              <td><b><font face="Times New Roman" color="#FFFFFF">ERP A/c No</font></b></td>
              <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=x1%> </font></td>
              <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=x2%> </font></td>
              <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=x3%> </font></td>
              <td bgcolor="#008000"><font face="Verdana" size="6"><%=x4%> </font></td>
              <td bgcolor="#008000"><font face="Verdana" size="6"><%=x5%> </font></td>
              <td bgcolor="#008000"><font face="Verdana" size="6"><%=x6%> </font></td>
              <td bgcolor="#008000"><font face="Verdana" size="6"><%=x7%> </font></td>
              <td bgcolor="#008000"><font face="Verdana" size="6"><%=x8%> </font></td>
              <td bgcolor="#8000FF"><font face="Verdana" size="6"><%=x9%> </font></td>
              <td bgcolor="#8000FF"><font face="Verdana" size="6"><%=x10%> </font></td>
              <td bgcolor="#8000FF"><font face="Verdana" size="6"><%=x11%> </font></td>
              <td bgcolor="#0080FF"><font face="Verdana" size="6"><%=x12%> </font></td>
              <td bgcolor="#0080FF"><font face="Verdana" size="6"><%=x13%> </font></td>
              <td bgcolor="#0080FF"><font face="Verdana" size="6"><%=x14%> </font></td>
              <td bgcolor="#0080FF"><font face="Verdana" size="6"><%=x15%> </font></td>
              <td bgcolor="#0080FF"><font face="Verdana" size="6"><%=x16%> </font></td>
              <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=x17%> </font></td>
              <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=x18%> </font></td>
              <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=x19%> </font></td>
              <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=x20%> </font></td>
              <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=x21%> </font></td>
            </tr>
          </table>
          </center></div></td>
        </tr>
        <tr align="center">
          <td bgcolor="#97CBFF" colspan="4" bordercolor="#C0C0C0" align="center">&nbsp; <input
          type="button" value="Edit" name="edit_btn" onclick="edit()"><input type="button"
          value="Delete" name="del_btn" onclick="<%=del_clause%>"> <input type="button"
          value="Close"  onclick="window.close();"></td>
        </tr>
      </table>
      </center></div></dd>
  </dl>
</form>
</b>
</body>
<script LANGUAGE="javascript">
//alert("  pl_ref : "+"<%= pl_ref %>");
//if(document.f1.eqref<%=pl_ref%>){
eval("document.f1.eqref"+"<%=pl_ref%>"+".style.display=\"\"");
//}
<% if (!billref.equals("add") ){ %>
eval("document.f1.eqref"+"<%=pl_ref%>"+".value="+"<%=ref%>");
<% } %>
document.f1.plant_code.value="<%=pl_ref%>";
document.f1.dept.value="<%=dept%>";
document.f1.jobtype.value="<%=jobtyp%>";
document.f1.fnf.value="<%=fnf%>";
document.f1.status.value="<%=status%>";

f1.bill_cl.readOnly=1;
function edit(){
<%=edit_clause %>;
f1.bill_cl.readOnly=1;
}

</script>


<%
String isDel = request.getParameter("delSuccs") == null?"":request.getParameter("delSuccs"); 
if(isDel.equals("Y")){
%>
<script>
alert("Deletion Successful ");
</script>
<%
}

%>


<%

 }
    catch(Exception e){
        e.printStackTrace();
    }
    finally {
        mk.con.close() ;
    }
%>



<script>

$(document).ready(function(){
$('input, select, textarea').live('keydown', function(e) {
 if (e.keyCode==13) {
  var focusable = $('input,a,select,textarea').filter(':visible');
   
  if(focusable.get(focusable.index(this)).type != 'button' && focusable.get(focusable.index(this)).type != 'submit'){
  //alert(focusable.get(focusable.index(this)).type);
  focusable.eq(focusable.index(this)+1).focus();
  focusable.eq(focusable.index(this)+1).css({'background-color':'#ffffbb'}); 
   focusable.eq(focusable.index(this)).css({'background-color':''}); 
   return false;
  }else {
     focusable.one('click', function (event) {  
           event.preventDefault();
           //do something
           $(this).attr('disabled', 'disabled');
     });

  }
  return true;
 }
});

if($('input,select').attr('readonly') != 'readonly'){
$('input,select').filter(':visible').eq(0).focus();
}

});
</script>
</html>

