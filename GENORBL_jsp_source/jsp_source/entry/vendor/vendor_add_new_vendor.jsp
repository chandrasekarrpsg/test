
<html>


<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>



<!-- #include file="mylib/adovbs.inc" -->
<!--#include file="mylib/log_functions.inc"-->
<!--#include file="mylib/rowid.inc"-->

<head>

<title></title>

<script src="js/vendor_rowid.js"></script>
<script src="js/vendor_log_functions.js"></script>
<script src="js/jquery-1.4.4_genorbl.js"></script>



<script LANGUAGE="javascript">

function validate_form() {

if (f1.name.value==""){
alert("Please Enter Vendor name !");
return 0;
}
if (f1.address.value==""){
alert("Please Enter Vendor Address  !");
return 0;
}


if (f1.termination_stat.value=="T")
	{
		if (f1.termination_remark.value=="")
			{
				alert("Please Enter Termination Remarks");
			return 0;
			}
	}
return 1;
}




</script>

</head>
<body text="#000000" bgcolor="#ffffff" onload="old()">


<%
String aposn=request.getParameter("ap")==null?"add":request.getParameter("ap") ;
String vnameStr = request.getParameter("vnameForCls");
if(vnameStr != null){
	session.setAttribute("ssnName",vnameStr);
}

if (aposn.equals("add")){
if ( session.getAttribute("ssnName") != null ){
	session.removeAttribute("ssnName");
}
}



String ssnNm1 = session.getAttribute("name")== null ?"": session.getAttribute("name").toString();
 String ssnDept1 = session.getAttribute("dept")== null ?"": session.getAttribute("dept").toString();

int status=0 ;
	int lck=0 ;
	String termination_stat="" ;
	String termination_remark="" ;
	String pdep = "" ;
	String rowid = "" ;
	String deCdPattern = "/plus/gi";
	String prop_name = "";
String prop_code = ""; 
String appr_name= "";
String electrical = "";
String electronics ="";
String instrumentation ="";
String mechanical = "";
String gen_ord_sup = "";
String lab_supply = "";
String address = "";
String     ref = "";
String     name = "";
String     tel ="";
String 	cell_no ="";
String     fax = "";
String     email = "";
String     others = "";


String edit_clause = "";
String del_clause = "";
String vndr_ref = "";

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    String curdate = new String() ;

    try {
        PreparedStatement ps = null ;
        ResultSet rs = null ;












if (aposn.equals("add")){
	//here q  inserted for testing purpose. It should be removed.
      if ( ssnNm1.equals("q") ){
	  // change here for jsp code 
	   //  response.redirect("../login.asp")
		  response.sendRedirect("login.jsp") ;
       }

	 pdep = session.getAttribute("dept")== null ?"": session.getAttribute("dept").toString();
	
	 status=0 ;
	 lck=0 ;
	 termination_stat="V" ;
	 termination_remark="" ;
}
else{
    lck=1;
	//rowid = request.getParameter("rowid") ;
vndr_ref = request.getParameter("vndr_ref") ;

  //   rowid = rowid.replace(deCdPattern, "+");
String	sql="select * from ORBL_VENDOR_MST where VENDOR_REF ="+vndr_ref+"" ;
      
 ps = mk.con.prepareStatement(sql) ;
 rs = ps.executeQuery() ;
while(rs.next()){

	pdep=rs.getString("prop_dept");
    prop_name=rs.getString("prop_name");
	prop_code=rs.getString("prop_code");

	if( pdep == null  || prop_name == null || prop_code == null ){
		pdep = session.getAttribute("dept")== null ?"": session.getAttribute("dept").toString();
		prop_name = session.getAttribute("name")== null ?"": session.getAttribute("name").toString();
		prop_code = session.getAttribute("code")== null ?"": session.getAttribute("code").toString();
      }
// the below line has been added for testing it should be removed
pdep=rs.getString("prop_dept");

	appr_name=rs.getString("appr_name")==null?"":rs.getString("appr_name");
	electrical=rs.getString("electrical")==null?"":rs.getString("electrical");
    electronics=rs.getString("electronics")==null?"":rs.getString("electronics");
    instrumentation=rs.getString("instrumen")==null?"":rs.getString("instrumen");
    mechanical=rs.getString("mechanical")==null?"":rs.getString("mechanical");
    gen_ord_sup=rs.getString("gen_ord_sup")==null?"":rs.getString("gen_ord_sup");
    lab_supply=rs.getString("lab_supply")==null?"":rs.getString("lab_supply")	;
    address=rs.getString("address")==null?"":rs.getString("address");
    status=rs.getInt("status");
    ref=rs.getString("vendor_ref")==null?"":rs.getString("vendor_ref");
    name=rs.getString("V_NAME")==null?"":rs.getString("V_NAME");
    tel=rs.getString("tel")==null?"":rs.getString("tel");
	cell_no=rs.getString("cell_no")==null?"":rs.getString("cell_no");
    fax=rs.getString("fax")==null?"":rs.getString("fax");
    email=rs.getString("email")==null?"":rs.getString("email");
System.out.println("  tel :    111  "+tel);
	 tel=tel.trim().equals("null")?"":tel;
	cell_no=cell_no.trim().equals("null")?"":cell_no;
    fax=fax.trim().equals("null")?"":fax;
    email=email.trim().equals("null")?"":email;

    others=rs.getString("others")==null?"":rs.getString("others");
	termination_stat=rs.getString("termination_stat")==null?"":rs.getString("termination_stat");
	termination_remark=rs.getString("termination_remark")==null?"":rs.getString("termination_remark");

		termination_remark=termination_remark.equals("null")?"":termination_remark;
}

rs.close();
ps.close();

}



/*
'if session("lvl")="4" and status < 2 then

		'send_txt="Send to MR"
		'edit_clause="edit_onclick('vendor_entry_submit.asp?status=1')"
		'del_clause="del_onclick('vendor_entry_submit.asp?del=1','vendor_registration.asp?ap="&ap&"')" 
		'send_clause="submit_form('vendor_entry_submit.asp?status=2')"

'elseif (session("lvl")="5" or session("lvl")="6") and  status < 1 then

		'send_txt="Send to DM"
		'edit_clause="edit_onclick('vendor_entry_submit.asp?status=0')"
		'del_clause="del_onclick('vendor_entry_submit.asp?del=1','vendor_registration.asp?ap="&ap&"')" 
		'send_clause="submit_form('vendor_entry_submit.asp?status=1')"
'else
		'edit_clause="" 
		'del_clause="" 
		'send_clause=""
		'button_stat="f1.edit_btn.style.visibility='hidden';f1.del_btn.style.visibility='hidden';f1.send_btn.style.visibility='hidden';"
'end if
*/

//session("dept")="PLG"

if (ssnDept1.equals("PLG") ){

		edit_clause="edit_onclick('vendor_entry_submit.jsp?status=0&vndr_ref="+vndr_ref+"')" ;
		del_clause="del_onclick('vendor_entry_submit.jsp?del=1&status=0&vndr_ref="+vndr_ref+"','vendor_add_new_vendor.jsp?vndr_ref="+vndr_ref+"&ap="+aposn+"')"  ;
}else{
		edit_clause="" ;
		del_clause="" ;
// following lines have been added for testing purpose. It should be removed.
		edit_clause="edit_onclick('vendor_entry_submit.jsp?status=0&vndr_ref="+vndr_ref+"')" ;
		del_clause="del_onclick('vendor_entry_submit.jsp?del=1&status=0&vndr_ref="+vndr_ref+"','vendor_add_new_vendor.jsp?vndr_ref="+vndr_ref+"&ap="+aposn+"')"  ;
}



%>





<form align="center" name="f1" method="post">
  <input type="hidden" name="add_btn" value="Add"><input type="hidden" name="prop_code"
  value="<%=prop_code%>"><input type="hidden" name="rowid" value="<%=rowid%>"><div
  align="center"><center><table border="1" bgcolor="#C0C0C0" cellspacing="0" cellpadding="0"
  style="BORDER-BOTTOM: outset; BORDER-LEFT: outset; BORDER-RIGHT: outset; BORDER-TOP: outset">
<TBODY>
    <tr>
      <td bgcolor="#000080" align="center" colspan="8"><font face="Verdana" color="#FFFFFF"><strong><u>Vendor
      Registration Form</u></strong></font></td>
    </tr>
    <tr align="middle">
      <td bgcolor="#FDFBAC" align="center"><font face="Bookman Old Style"><big><strong>Vendor
      Regn. No.:</strong></big></font></td>
      <td bgcolor="#FFFFFF" align="middle" colspan="4"><div align="left"><p><font face="Verdana">BBGS/VR/</font><input
      name="vendor_ref" id="vendor_ref" size="5"
      style="background-color: rgb(255,255,255); readonly: truee; border: medium none"
      value="<%=ref%>" readonly ></td>
      <td bgcolor="#FDFBAC" align="middle" colspan="2"><font face="Bookman Old Style"><strong>Proposing
      Dept:</strong></font></td>
      <td bgcolor="#FDFBAC" align="middle"><select name="prop_dept" size="1">
        <option value="BBSG">BBSG</option>
        <option value="E&amp;I">E&amp;I</option>
        <option value="ENV">ENV</option>
        <option value="F&amp;A">F&amp;A</option>
        <option value="FAA">FAA</option>
        <option value="FAC">FAC</option>
        <option value="FAO">FAO</option>
        <option value="IR">IR</option>
        <option value="MMD">MMD</option>
        <option value="OPS">OPS</option>
        <option value="PLG">PLG</option>
        <option value="SFR">SFR</option>
        <option value="SFT">SFT</option>
        <option value="TMD">TMD</option>
      </select></td>
    </tr>
    <tr align="center">
      <td align="center" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Vendor Name:</strong></font></td>
      <td align="right" colspan="7" bgcolor="#D0FAA3"><div align="left"><p><font face="Impact"><input
      name="name" size="50"
      style="font-weight: bold; float: none; vertical-align: middle; border: medium none"
      #C0C0C0"; font-family: Times New Roman, Times New Roman; font-weight: 300; float: none;
      border: medium none" value="<%=name%>"></font></td>
    </tr>
    <tr align="center">
      <td align="center" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Address</strong></font></td>
      <td align="right" colspan="7" bgcolor="#D0FAA3"><div align="left"><p><textarea cols="50"
      id="address" name="address" rows="4" style="background-color: rgb(255,255,255); "><%=address%></textarea></td>
    </tr>
    <tr align="center">
      <td align="center" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Tel:</strong></font></td>
      <td align="middle" bgcolor="#D0FAA3" colspan="4"><strong><div align="left"><p></strong><input
      name="tel" size="15" style="background-color: rgb(255,255,255); " value="<%=tel%>"></td>
      <td align="left" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Fax:</strong></font></td>
      <td align="left" bgcolor="#D0FAA3"><input name="fax" size="15" value="<%=fax%>"></td>
      <td align="left" bgcolor="#D0FAA3" rowspan="2">&nbsp;</td>
    </tr>
    <tr align="center">
      <td align="center" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>E-mail:</strong></font></td>
      <td align="right" colspan="4" bgcolor="#D0FAA3"><div align="left"><p><input name="email"
      size="30" style="background-color: rgb(255,255,255); " value="<%=email%>"></td>
      <td align="right" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Mobile:</strong></font></td>
      <td align="left" bgcolor="#D0FAA3"><input name="cell_no" size="15" value="<%=cell_no%>"
      maxlength="15"></td>
    </tr>
    <tr align="center">
      <td align="center" rowspan="2" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Specialisation:</strong></font></td>
      <td align="center" bgcolor="#D0FAA3"><div align="center"><center><p><font
      face="Bookman Old Style"><strong>Electrical</strong></font></td>
      <td align="center" bgcolor="#D0FAA3"><input type="checkbox" name="electrical" value="1"
      style="background-color: rgb(198,248,165)"></td>
      <td align="center" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Electronics</strong></font></td>
      <td align="center" bgcolor="#D0FAA3"><input type="checkbox" name="electronics" value="1"></td>
      <td align="center" bgcolor="#D0FAA3" colspan="2"><font face="Bookman Old Style"><strong>Instrumentation</strong></font></td>
      <td align="center" bgcolor="#D0FAA3"><input type="checkbox" name="instrumen" value="1"></td>
    </tr>
    <tr align="center">
      <td align="center" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Mechanical</strong></font></td>
      <td align="center" bgcolor="#D0FAA3"><input type="checkbox" name="mechanical" value="1"></td>
      <td align="center" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Labour Supply</strong></font></td>
      <td align="center" bgcolor="#D0FAA3"><input type="checkbox" name="lab_supply" value="1"></td>
      <td align="center" bgcolor="#D0FAA3" colspan="2"><font face="Bookman Old Style"><strong>Gen.
      Order Supplier</strong></font></td>
      <td align="center" bgcolor="#D0FAA3"><input type="checkbox" name="gen_ord_sup" value="1"></td>
    </tr>
    <tr align="center">
      <td align="center" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Other
      specialisation:</strong></font></td>
      <td align="right" colspan="7" bgcolor="#D0FAA3"><div align="left"><p><textarea cols="50"
      name="others" rows="2" style="background-color: rgb(255,255,255); "><%=others%></textarea></td>
    </tr>
    <tr align="center">
      <td align="center" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Proposed by:</strong></font></td>
      <td align="right" colspan="7" bgcolor="#D0FAA3"><div align="left"><p><font face="Impact"><input
      name="prop_name" size="26" value="<%=prop_name%>" maxlength="26"></font></td>
    </tr>
    <tr align="center">
      <td align="center" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Approved by:</strong></font></td>
      <td align="right" colspan="7" bgcolor="#D0FAA3"><font face="Impact"><div align="left"><p><input
      name="appr_name" size="26" value="<%=appr_name%>" maxlength="26"></font></td>
    </tr>
    <tr align="center">
      <td align="center" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Status</strong></font></td>
      <td align="left" bgcolor="#D0FAA3" colspan="7"><select name="termination_stat" size="1">
        <option value="V">Valid</option>
        <option value="T">Terminate</option>
      </select></td>
    </tr>
    <tr>
      <td align="center" bgcolor="#D0FAA3"><font face="Bookman Old Style"><strong>Remarks For
      Termination</strong></font></td>
      <td align="left" bgcolor="#D0FAA3" colspan="7"><textarea rows="3"
      name="termination_remark" cols="50"><%=termination_remark%></textarea></td>
    </tr>
    <tr align="center">
      <td align="center" bgcolor="#000080" colspan="8"><font color="#000080"><input
      type="button" value="Edit" name="edit_btn" onclick="<%=edit_clause%>"><input type="button"
      value="Delete" name="del_btn" onclick="<%=del_clause%>"><input type="button"
      value="Close" 
	  <% if (aposn.equals("add") || session.getAttribute("ssnName") == null ){   %>
	  onclick="window.close();"
	  <% }else {
		  
		  %>
		  onClick="window.open('vendor_search.jsp?name=<%= session.getAttribute("ssnName").toString() %>','_self') "
		  <% } %>
	  ></font></td>
    </tr>
  </table>
  </center></div>
</form>

<%





 }
    catch(Exception e){
        e.printStackTrace();
    }
    finally {
        mk.con.close() ;
    }
%>



<script LANGUAGE="javascript">

f1.electrical.checked=(("<%=electrical%>"==1)?true:false);
f1.electronics.checked=(("<%=electronics%>"==1)?true:false);
f1.instrumen.checked=(("<%=instrumentation%>"==1)?true:false);
f1.mechanical.checked=(("<%=mechanical%>"==1)?true:false);
f1.gen_ord_sup.checked=(("<%=gen_ord_sup%>"==1)?true:false);
f1.lab_supply.checked=(("<%=lab_supply%>"==1)?true:false);
f1.prop_dept.value="<%=pdep%>";
f1.termination_stat.value="<%=termination_stat%>";






function old() {
	lock_controls(<%=lck%>);
	f1.vendor_ref.readOnly=1;
	//f1.prop_dept.readOnly=1;
	f1.prop_name.readOnly=1;
	f1.appr_name.readOnly=1;
}

</script>

<%

String isDelDone = request.getParameter("isDelDone")==null?"":request.getParameter("isDelDone") ;
if(isDelDone.equals("Y")){
	%>
		<script>alert(" Deletion Successful ");		</script>

		<%
}


%>


<script>

$(document).ready(function(){
$('input, select, textarea').live('keydown', function(e) {
 if (e.keyCode==13) {
  var focusable = $('input,a,select,textarea').filter(':visible');
   
  if(focusable.get(focusable.index(this)).type != 'button' && focusable.get(focusable.index(this)).type != 'submit'){
  //alert(focusable.get(focusable.index(this)).type);
  //alert();
  var tmpFlg = true;
  if(focusable.get(focusable.index(this)).type == 'textarea'){
     tmpFlg = false ;
      tmpFlg = confirm("Do u want to change focus ?");
  }
  if(tmpFlg){
   focusable.eq(focusable.index(this)+1).focus();
   focusable.eq(focusable.index(this)+1).css({'background-color':'#ffffbb'});
      focusable.eq(focusable.index(this)).css({'background-color':''});
  }else{
	  return true;
  }
 
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
$('input,select').filter(':visible').eq(1).focus();
}
});

window.moveTo(0, 0);
window.resizeTo(screen.availWidth, screen.availHeight);


</script>


</body>
</html>

