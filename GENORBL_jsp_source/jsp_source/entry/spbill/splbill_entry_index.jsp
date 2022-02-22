
<html>
<!-- #include file="mylib/dates.inc"-->
<!-- #include file="mylib/sel_date.inc"-->


<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>


<head>
<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<title></title>
<script src="js/best_cal_ag.js"></script>
<script src="js/jquery-1.4.4_genorbl.js"></script>
<script LANGUAGE="javascript">



function sel_cont()
{
document.f1.cont.value="";
document.f1.cont_ref.value="";
var url="contractor_list.jsp?p=a"
var c=showModalDialog(url,0,"dialogWidth:400px;dialogHeight:550px");
var cnarray=c.split("~");
document.f1.cont_ref.value=cnarray[0];
document.f1.cont.value=cnarray[1];
}

function sel_budg()
{
var url="budget.jsp?";
window.f1.budg_ac.value="Please wait.........."
window.status="Opening Budget Heads Menu !. Please wait....................."
var c=showModalDialog(url,0,"dialogWidth:950px;dialogHeight:600px");
window.status=" "
if (c!=null) {
	document.f1.budg_ac.value=c
}
else {
	document.f1.budg_ac.value=""
}
}
</script>
</head>
<%

Calendar cal = Calendar.getInstance();
cal.setTime(new Date());
cal.add(Calendar.MONTH, -1);


Date d = new Date();//intialize your date to any date 
//Date dateStrt = new Date(d.getTime() - 30 * 24 * 3600 * 1000 );
Date dateStrt = cal.getTime();
   DateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");  
        //Date dateStrt = new Date()-30;  
        Date dateEnd = new Date();  

String st_dt=request.getParameter("st_dt");
String end_dt=request.getParameter("end_dt");
String cont=request.getParameter("cont")==null?"":request.getParameter("cont");
 st_dt= dateFormat.format(dateStrt);
 end_dt=dateFormat.format(dateEnd);
// it is aaded by me to resolve the variable  cont_ref
String cont_ref = request.getParameter("cont_ref")==null?"":request.getParameter("cont_ref");
String unit = request.getParameter("unit");
String jobtyp = request.getParameter("jobtyp");




%>

<body bgcolor="ghostwhite">
<b><font face="Times New Roman" size="5" color="mediumblue">

<p align="center"></font><font face="Verdana" size="5">Special Bill</font><font
face="Verdana"><font size="5"> Search Module</font><br>
</font><br>
</p>

<form name="f1">
  <input type="hidden" name="cont_ref" value="<%=cont_ref%>"><div align="center"><center><table
  border="1">
    <tr>
      <td bgcolor="#408080"><font face="Times New Roman" color="#FFFFFF">Dept</font></td>
      <td bgcolor="#408080"><select name="dept" size="1">
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
        <option value="All">All</option>
      </select></td>
      <td bgcolor="#408080" colspan="2">&nbsp;</td>
      <td rowspan="6" bgcolor="#FF8080"><em><font face="Verdana"><input type="button"
      value="Search" name="B1" onclick="search_onclick()"><input type="button"
      value="Close" onclick="window.close();">
	  
	  </font></em></td>
    </tr>
    <tr>
      <td bgcolor="#408080"><font face="Times New Roman" color="#FFFFFF">Bill Released From</font></td>
      <td bgcolor="#408080"><input type="text" name="st_dt" size="11" value="<%=st_dt%>"
      readonly onclick='scwShow(this,event);'  ></td>
      <td bgcolor="#408080"><font face="Times New Roman" color="#FFFFFF">Bill Released To</font></td>
      <td bgcolor="#408080"><input type="text" name="end_dt" size="11" value="<%=end_dt%>"
      readonly onclick='scwShow(this,event);'  ></td>
    </tr>
    <tr>
      <td bgcolor="#408080"><font face="Times New Roman" color="#FFFFFF">Budget A/c</font></td>
      <td colspan="3" bgcolor="#408080"><input type="text" name="budg_ac" size="20"
      onclick="sel_budg()"></td>
    </tr>
    <tr>
      <td bgcolor="#408080"><font face="Times New Roman" color="#FFFFFF">Party</font></td>
      <td colspan="3" bgcolor="#408080"><input type="text" name="cont" size="50"
      onclick="sel_cont('')"></td>
    </tr>
    <tr>
      <td bgcolor="#408080"><font face="Times New Roman" color="#FFFFFF">Description</font></td>
      <td colspan="3" bgcolor="#408080"><input type="text" name="descrip" size="50"></td>
    </tr>
    <tr>
      <td bgcolor="#408080"><font face="Times New Roman" color="#FFFFFF">Bill Ref. No</font></td>
      <td colspan="3" bgcolor="#408080"><input type="text" name="billref" size="10"></td>
    </tr>
  </table>
  </center></div>
</form>

<!-- form name="f3">
 <div align="center"><center><table border="1" cellspacing="0"
  cellpadding="0">
    <tr>
      <td colspan="2" align="center" bgcolor="#004080"><font color="#FFFFFF" face="Verdana"><b>Add
      New Bill</b></font></td>
    </tr>
    <tr>
      <td colspan="1" height="38" bgcolor="#FFFFFF"><b><font color="#000000" face="Tahoma">Job
      nature</font></b></td>
      <td height="38" bgcolor="#FFFFFF"><b><font face="Times New Roman" color="#FFFFFF"><select
      name="jobtyp" size="1">
        <option selected value="M">Maintenance</option>
        <option value="O">Operational</option>
      </select></font></b></td>
    </tr>
    <tr>
      <td colspan="1" height="38" bgcolor="#FFFFFF"><font face="Times New Roman" color="#FFFFFF"></font><b><font
      color="#000000" face="Tahoma">Applicable Unit For</font></b><font face="Times New Roman"
      color="#FFFFFF"></font></td>
      <td height="38" bgcolor="#FFFFFF"><select name="unit" size="1">
        <option value="1">1&amp;2 only</option>
        <option value="2">3 only</option>
        <option value="3">Common</option>
      </select></td>
    </tr>

   <%
    session.setAttribute("dept","PLG");

	String ssnStr1 = session.getAttribute("dept")== null ?"": session.getAttribute("dept").toString();

    %>
    <tr>
      <td colspan="2"><div align="center"><center><p><input type="button"
      value="Add Special Bill" name="sp_bill_add"
      <%
	 
	  if( ssnStr1.equals("PLG") || ssnStr1.equals("IR") || ssnStr1.equals("ENV")){
	  
	  %>
	  onclick="add_spbill('billref=add&unit=<%=unit%>&jobtype=<%=jobtyp%>')"
      
	  <% 
	  }
	 
	  %> style="font-size: 18pt"> </td>
    </tr>
  </table>
  </center></div>
</form -->
</b><script LANGUAGE="javascript">

function search_onclick(){
 f1.action="spbill_summary.jsp"
 f1.method="POST"	
 f1.submit()
}


function add_spbill(qstr)
{
//var rslt=window.open("spbill_entry.asp?"+qstr,"bill","width=900,height=495,left=100,top=150");
//alert(f3.unit.value)
var rslt=window.open("spbill_entry.jsp?"+ "billref=add" + "&unit="+ f3.unit.value + "&jobtyp="+ f3.jobtyp.value ,"bill","width=900,height=495,left=100,top=150");


return 0;
}

</script>
<script>

$(document).ready(function(){
$('input[type=text], select, textarea').live('keydown', function(e) {
 if (e.keyCode==13) {
  var focusable = $('input[type=text],a,select,textarea').filter(':visible');
  
  if( (focusable.length-1) != focusable.index(this)){
  focusable.eq(focusable.index(this)+1).focus();
  }else{
   
    var focusable1 = $('input[type="button"]').filter(':visible');
	focusable1.eq(0).focus();
	
  }
return false;
  
 }
});


if($('input,select').attr('readonly') != 'readonly'){
$('input,select').filter(':visible').eq(0).focus();
}

});

window.moveTo(0, 0);
window.resizeTo(screen.availWidth, screen.availHeight);

</script>

<p align="center">&nbsp;</p>
</body>
</html>

