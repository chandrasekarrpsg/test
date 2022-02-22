<html>
<head>
</head>
<body>
<%
String unit = request.getParameter("unit");
String jobtyp = request.getParameter("jobtyp");
%>

<form name="f3">
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
	 
	  %> style="font-size: 12pt"><input type="button"
      value="Close"  style="font-size: 12pt" onclick="window.close();" /> </td>
    </tr>
  </table>
  </center></div>
</form>


<script LANGUAGE="javascript">



function add_spbill(qstr)
{
//var rslt=window.open("spbill_entry.asp?"+qstr,"bill","width=900,height=495,left=100,top=150");
//alert(f3.unit.value)
var rslt=window.open("spbill_entry.jsp?"+ "billref=add" + "&unit="+ f3.unit.value + "&jobtyp="+ f3.jobtyp.value ,"bill","width=900,height=495,left=100,top=150");


return 0;
}

window.moveTo(0, 0);
window.resizeTo(screen.availWidth, screen.availHeight);

</script>


</body>
</html>
