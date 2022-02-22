

<html>

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>




<head>

<title></title>
<script src="js/vendor_rowid.js"></script>
<script src="js/jquery-1.4.4_genorbl.js"></script>

<script ID="clientEventHandlersJS" LANGUAGE="javascript">
<!--

function pb_search_onclick() {
f1.submit()
}

function nav(a,i,name){
//alert(" history.length "+history.length);

var url
if ((i==0) || (i==1)|| (i==2)){ 

    url="vendor_add_new_vendor.jsp?ap=edt&vndr_ref="+a+"&vnameForCls="+name;
    window.navigate(url)
}
else{
    url="vendor_approval_form.asp?rd="+a
    window.navigate(url)
}
}  

//-->
</script>

<style>

td.a{font-family: Verdana; font-size: 8 pt; color: maroon; font-weight: normal;}

</style>
</head>
<%
String name = request.getParameter("name")== null?"":request.getParameter("name");
String ssnDept1 = session.getAttribute("dept")== null ?"": session.getAttribute("dept").toString();
%>

<body bgColor="#ffcec6">

<form name="f1" method="post" action="vendor_search.jsp">
  <big><div align="center"><center><table border="1" bgcolor="#e0959f">
    <tr>
      </big><td align="middle" colspan="4" bgcolor="#800000"><big><strong><font face="Verdana"><div
      align="center"><center><p></font><font face="Verdana" size="3" color="#FFFFFF"><u>Search
      for Vendor</u></font></strong></big></td>
      <big>
    </tr>
    <tr align="center">
      <td align="middle"><font face="Verdana"><strong>Vendor Name</strong></font></td>
      <td align="middle"><input name="name" size="25" value="<%=name%>" align="center"></td>
      <td align="middle"><input type="submit" value="Search" name="pb_search"
      style="FONT-FAMILY: Verdana; FONT-WEIGHT: bold" LANGUAGE="javascript"
      onclick="return pb_search_onclick()"></td>
      </big>
	  <td align="middle">
 <input type="button" value="Close" onclick = "window.close();"  />
	  <!-- input type="button" value="Add Vendor" name="B1"
      <% if (ssnDept1.equals("")){ %> 
	     onclick="window.navigate('vendor_add_new_vendor.jsp?ap=add')" 
	 <%  } %> -->
	 </td>
      <big>
    </tr>
  </table>
  </center></div></big><div align="center"><center><p><br>
  </p>
  </center></div>
  <div align="center">
  <%
    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    String curdate = new String() ;

    try {
        PreparedStatement ps = null ;
        ResultSet rs = null ;

      

       

  
String sql = "0";



System.out.println(" name  :  "+name);
if (!name.equals("")){


 if (name.equals("*")) {
    sql="select vendor_ref,v_name,address,rowid,nvl(status,0) from ORBL_VENDOR_MST order by upper(v_name)";
 }else{
    sql="select vendor_ref,v_name,address,rowid,nvl(status,0) from ORBL_VENDOR_MST where upper(v_name) like upper('%"+name+"%') order by upper(v_name)";
 }



  
System.out.println(" sql  :111  "+sql);
 ps = mk.con.prepareStatement(sql) ;
 rs = ps.executeQuery() ;
boolean anyRcrdExist = false;
int rowCount = 0;

String encdpattern = "/+/gi";


String stat = "";
String colr = "";
String rowid = "";

while(rs.next()) {  
      anyRcrdExist = true;
rowCount= rowCount+1;

if(rowCount == 1){
%>
<div align="center"><center>
<table border="1"
  bgcolor="#ffd7d7" bordercolor="#808080" cellspacing="0">
    <tr bgcolor="#e0959f">
      <td align="middle" nowrap bgcolor="#e0959f"><div align="center"><center><p><font
      face="Verdana" color="#ffffff"><font color="black">&nbsp;<strong>Regn. No.</strong></font>
      </font></td>
      <td align="center" bgcolor="#e0959f"><font face="Verdana" color="black">&nbsp;<strong>Name</strong></font></td>
      <td align="center" bgcolor="#e0959f"><font face="Verdana" color="black"><strong>Address</strong></font></td>
    </tr>
<%
   }
      
stat=rs.getString(5);
rowid = rs.getString(4);
  rowid = rowid.replace(encdpattern, "plus");
System.out.println(" stat  :111  "+stat);
 switch (Integer.parseInt(stat)) {
            case 0:  colr = "#ffd7d7";
                     break;
            case 1:  colr = "LightCyan";
                     break;
            case 2:  colr = "PowderBlue";
                     break;
            case 3:  colr = "Lavender";
                     break;
            case 4:  colr = "LemonChiffon";
                     break;
            
        }

System.out.println(" name  222 :  "+colr);
%>
    <tr bgcolor="<%=colr%>" align="center"
    onmouseover="window.event.srcElement.style.cursor='hand'"
    onclick="return nav('<%= rs.getString(1) %>','<%=rs.getString(5)%>','<%=name%>')">
      <td align="middle" class="a"><%=rs.getString(1)%>
</td>
      <td align="middle" class="a"><%=rs.getString(2)%>
</td>
      <td align="middle" class="a"><%=rs.getString(3)%>
</td>
    </tr>
<%
  }

       rs.close() ;
        ps.close() ;

%>
  </table>
  </center></div>

  <% if(!anyRcrdExist){  %>
<div align="center"><center><p><font face="verdana" size="4" color="maroon"><b><u>No
  matching records found !!!</u></b></font></p>
  </center></div>
  <% } 
  %>

 <% if(anyRcrdExist){  %>
<div align="center">
<center>
<p><br>
  </p>
  </center></div>  
 
  <div align="center">
  <center>
  <table border="2"  bordercolor="#000000">
    <tr bgcolor="#e0959f">
      <td><div align="center"><center><p><u><strong><font face="Verdana">Legend</font></strong></u></td>
    </tr>
    <tr align="center">
      <td bgcolor="#ffd7d7" align="center"><font face="Verdana" color="#800000">Draft</font></td>
    </tr>
    <tr align="center">
      <td bgcolor="LightCyan" align="center"><font face="Verdana" color="#800000">Forwarded to DM</font></td>
    </tr>
    <tr align="center">
      <td bgcolor="PowderBlue" align="center"><font face="Verdana" color="#800000">Forwarded to MR</font></td>
    </tr>
    <tr align="center">
      <td bgcolor="Lavender" align="center"><font face="Verdana" color="#800000">Approved by MR</font></td>
    </tr>
    <tr align="center">
      <td bgcolor="LemonChiffon" align="center"><font face="Verdana" color="#800000">Disapproved by MR</font></td>
    </tr>
  </table>
  </center>
  </div>
  
  <%
}
}



 }
    catch(Exception e){
        e.printStackTrace();
    }
    finally {
        mk.con.close() ;
    }
%>

</form>

<p align="center">&nbsp;</p>


<script>

$(document).ready(function(){
$('input, select, textarea').live('keydown', function(e) {
 if (e.keyCode==13) {
  var focusable = $('input,a,select,textarea').filter(':visible');
   
  if(focusable.get(focusable.index(this)).type != 'button' && focusable.get(focusable.index(this)).type != 'submit'){
  //alert(focusable.get(focusable.index(this)).type);
  focusable.eq(focusable.index(this)+1).focus();
   return false;
  }
  return true;
 }
});


$('input').filter(':visible')[0].focus();
});


window.moveTo(0, 0);
window.resizeTo(screen.availWidth, screen.availHeight);
</script>


</body>
</html>

