
<html>


<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="VO.*" %>


<!-- #include file="mylib/adovbs.inc" -->
<!-- #include file="mylib/nvl.inc" -->
<head>

<title></title>
</head>

<body>



<%
LoginBean loginBn = (LoginBean) request.getSession().getAttribute("LoginBean");
  MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    String curdate = new String() ;
    
    try {
        PreparedStatement ps = null ;
		 PreparedStatement ps2 = null ;
        ResultSet rs = null ;
        ResultSet rs2 = null ;
        ResultSet rs3 = null ;
 String ipAddress = request.getRemoteAddr(); 
String userDtls = "";
userDtls = ipAddress+":"+loginBn.getsEmpCd();
System.out.println("  userDtls :  "+userDtls);
 
String  mth=request.getParameter("month")==null?"":request.getParameter("month");
 mth="01-"+mth ;

String  budg_ac=request.getParameter("budg_ac");
String dept=request.getParameter("dept");
String eqref=request.getParameter("eqref");
String jobtyp=request.getParameter("jobtype");
String tc=request.getParameter("tc")==null?"":request.getParameter("tc");
String unit=request.getParameter("unit");
String erp_ac_no = "";
int ref = 0;
String billno = "";
String genStn =request.getParameter("genstn");
genStn = "BBGS";
 
String billref= request.getParameter("billref");
String billdt=request.getParameter("bill_dt");
String del=request.getParameter("del")==null?"":request.getParameter("del");
if (billdt.equals("") ){
  billdt=request.getParameter("bill_cl");
}else{
  billdt=request.getParameter("bill_dt");
}
String bill_no=request.getParameter("bill_no");

if( bill_no.equals("")){
  billno="No Bill Number" ;
}else{
  billno=request.getParameter("bill_no");
}


String equ=request.getParameter("eqref");

/*
if ltrim(rtrim(request.getParameter("eqref")))<>"" then
equ=cint(ltrim(rtrim(request("eqref"))))
else
equ=request.getParameter("eqref")
end if
*/

String sql = "";



/*
'Response.Write("Ag 1")

Application("Cn_ord")="Provider=OraOLEDB.Oracle.1;Password=gen2;Persist Security Info=True;User ID=gen2;Data Source=gen2"

set rs=server.createobject("adodb.recordset")
rs.open sql,Application("Cn_ord"),adOpenStatic,adLockOptimistic,adCmdText
*/





if( del.equals("1")){
sql = " delete from ORBL_SPBILL_DTL where GENSTN = ? and  billref = ?   ";

ps = mk.con.prepareStatement(sql) ;
ps.setString(1,genStn);
ps.setString(2,request.getParameter("billref"));
int delRws = ps.executeUpdate();

//	'rs.delete
if(delRws > 0){
		response.sendRedirect("spbill_entry.jsp?billref=add&genstn="+genStn+"&delSuccs=Y");
		}
}


if(!billref.equals("add")){



sql = " update  ORBL_SPBILL_DTL   set BILL_NO = ?  ,  "+
      "                               BILL_DT = to_date(?,'DD-MON-YYYY')  ,  "+
	  "                               BILL_AMT = ?  ,  "+
	  "                               BILL_CL = to_date(?,'DD-MON-YY')  ,  "+
	  "                               CERT_BY = ?  ,  "+	 
	  "                               DEPT = ?  ,  "+
	  "                               BUDG_AC = ?  ,  "+
	  "                               DESCRIP = ?  ,  "+
	  "                               ORDNO = ?  ,  "+
	  "                               ORDDT =   to_date(?,'dd-MON-YYYY')   ,  "+
	  "                               PARTY = ?  ,  "+
	  "                               FNF = ?  ,  "+
	  "                               EQREF = ?  ,  "+
	  "                               JOBTYPE = ?  ,  "+
	  "                               STATUS = ?  ,  "+
	  "                               BILLREL_ID = ?  ,  "+
	  "                               CERT_BY_NAME = ?  ,  "+
	  "                               UNIT = ?  ,  "+
	  "                               ERP_AC = ?  ,  "+	 
	  "                               UPD_BY = '"+userDtls+"'  ,  "+
	  "                               UPD_DT = sysdate    "+
	  "           where               GENSTN = ?    "+
	  "           AND                 BILLREF = ?    "+
       "";

//sql=" select * from ORBL_SPBILL_DTL  where billref="+billref+" ";
}else{
//sql=" select * from ORBL_SPBILL_DTL  where billref is null ";

ps = null ;
rs = null ;
ps = mk.con.prepareStatement(" select genorbl_spbl_entr.dfn_get_spbl_billref(?) from dual");
ps.setString(1,genStn);
rs = ps.executeQuery();

if(rs.next()){
ref = rs.getInt(1);
}

rs.close();
ps.close();



sql = " insert into ORBL_SPBILL_DTL( BILL_NO , "+
      "                              BILL_DT , "+
	  "                              BILL_AMT , "+
	  "                              BILL_CL , "+
	  "                              CERT_BY , "+	  
	  "                              DEPT , "+
	  "                              BUDG_AC , "+
	  "                              DESCRIP , "+
	  "                              ORDNO , "+
	  "                              ORDDT , "+
	  "                              PARTY , "+
	  "                              FNF , "+
	  "                              EQREF , "+
	  "                              JOBTYPE , "+
	  "                              STATUS , "+
	  "                              BILLREL_ID , "+
	  "                              CERT_BY_NAME , "+
	  "                              UNIT , "+
	  "                              ERP_AC , "+
	  "                              GENSTN , "+	
	  "                              BILLREF , "+
	  "                              CRT_BY , "+
	  "                              CRT_DT ) "+
	  "                        values(        ?    ,"+
	  "                               to_date(?,'dd-MON-YYYY')    ,"+
	  "                                       ?    ,"+
	  "                              to_date(?,'dd-MON-YY')    ,"+
	  "                                       ?    ,"+
	  "                                       ?    ,"+
	  "                                       ?    ,"+
	  "                                       ?    ,"+
	  "                                       ?    ,"+	 
	  "                                to_date(?,'dd-MON-YYYY')    ,"+
	  "                                        ?    ,"+
	  "                                        ?    ,"+
	  "                                        ?    ,"+
	  "                                        ?    ,"+
	  "                                        ?    ,"+
	  "                                        ?    ,"+
	  "                                        ?    ,"+
	  "                                        ?    ,"+
	  "                                        ?    ,"+
	  "                                        ?    ,"+
	   "                                       ?    ,"+
	  "                                 '"+userDtls+"'    ,"+
	  "                                 sysdate    )"+
      " ";

}

ps = null;
rs = null;


String erp_gen ="select dfn_derive_erp_acc('"+request.getParameter("budg_ac")+"','"+request.getParameter("dept")+"',"+request.getParameter("eqref")+",'"+request.getParameter("jobtype")+"','"+tc+"',"+request.getParameter("unit")+") erp_ac_no from dual"  ;

System.out.println("  erp_gen :   "+erp_gen);

ps = mk.con.prepareStatement(erp_gen) ;
rs = ps.executeQuery();
if(rs.next()){
erp_ac_no = rs.getString(1);
}
rs.close();
ps.close();

ps = null;
rs = null;

System.out.println(sql);

ps = mk.con.prepareStatement(sql) ;
ps.setString(1,billno);
ps.setString(2,billdt);
ps.setString(3,request.getParameter("bill_amt"));
ps.setString(4,mth);
ps.setString(5,request.getParameter("cert_by"));
ps.setString(6,request.getParameter("dept"));
ps.setString(7,request.getParameter("budg_ac"));
ps.setString(8,request.getParameter("descrip"));
ps.setString(9,request.getParameter("ordno"));
ps.setString(10,request.getParameter("orddt"));
ps.setString(11,request.getParameter("party"));
ps.setString(12,request.getParameter("fnf"));
ps.setString(13,request.getParameter("eqref"));
ps.setString(14,request.getParameter("jobtype"));
ps.setString(15,request.getParameter("status"));
ps.setString(16,request.getParameter("billrel_id"));
ps.setString(17,request.getParameter("cert_by_name"));
ps.setString(18,request.getParameter("unit"));
ps.setString(19,erp_ac_no);


if(!billref.equals("add")){
ref = Integer.parseInt(billref);
System.out.println("  ref :   "+ref);
ps.setString(20,genStn);
ps.setInt(21,ref);
}else{
ps.setString(20,genStn);
ps.setInt(21,ref);
}


 int insrtdRcrds = ps.executeUpdate() ;





/*


if rs.eof then
	rs.addnew
end if

rs("bill_amt")=tonull(request("bill_amt"))
rs("bill_cl")=tonull(request("bill_cl"))
rs("bill_dt")=billdt
rs("bill_no")=billno

if billref="add" then
sql1="select max(billref+1) new_billref from spbill"
set rs1=server.CreateObject("adodb.recordset")
rs1.Open sql1, application("cn_ord")
new_billref=rs1("new_billref")
rs1.Close
set rs1=nothing
billref=new_billref
else
billref=tonull(request("billref"))
end if
rs("billref")=billref
rs("billrel_id")=tonull(request("billrel_id"))
rs("budg_ac")=tonull(trim(request("budg_ac")))
rs("cert_by")=tonull(request("cert_by"))
rs("cert_by_name")=tonull(request("cert_by_name"))
rs("dept")=tonull(request("dept"))
rs("descrip")=tonull(request("descrip"))
rs("eqref")=equ
rs("fnf")=tonull(request("fnf"))
rs("jobtype")=tonull(request("jobtype"))
'rs("month")=tonull(request("month"))
rs("month")=cdate(mth)
rs("orddt")=tonull(request("orddt"))
rs("ordno")=tonull(request("ordno"))
rs("party")=tonull(request("party"))
rs("status")=tonull(request("status"))
rs("unit")=tonull(request("unit"))


sql1="select erp('"&budg_ac&"','"&dept&"',"&eqref&",'"&jobtyp&"','"&tc&"',"&unit&") erp_ac_no from dual"
'Response.Write(sql1)
'Response.End

Application("cn_ord")="Provider=OraOLEDB.Oracle.1;Password=gen2;Persist Security Info=True;User ID=gen2;Data Source=gen2"

set rs1=server.createobject("adodb.recordset")
rs1.open sql1, application("cn_ord")

rs("erp_ac")=rs1("erp_ac_no")

'Response.Write(erp_ac)
'Response.End

rs1.Close
set rs1=nothing





rs.update

rs.close
set rs=nothing

response.redirect("spbill_entry.asp?billref="&billref&"&unit="&unit&"&jobtyp="&jobtyp)


*/



  response.sendRedirect("spbill_entry.jsp?billref="+ref+"&ap=edt");


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

</body>
</html>

