


<html>
<!-- #include file="mylib/adovbs.inc" -->


<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>


<head>

<base target="_self">
<title>BBGS Contractor List</title>
</head>

<script language="javascript">





</script>


<body  text="#000000" bgcolor="#FFFFFF">


<%


  MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    String curdate = new String() ;
	String cont_ref = "";
	String cont = "";


    try {
        PreparedStatement ps = null ;
        ResultSet rs = null ;




String p=request.getParameter("p") == null?"":request.getParameter("p");
//'Response.Write(p)
String cl = "";
if (p.equals("a") ){
cl="";
}else{
cl=" and  (TERMINATION_STAT = 'V')";
}
  String srchStrRqust = request.getParameter("search_str") == null?"":request.getParameter("search_str");
  String  search_str=(srchStrRqust).toUpperCase();
  String where_clause="where V_NAME like '" + search_str + "%'" ;
  String  sql=" select V_NAME,VENDOR_REF from ORBL_VENDOR_MST " + where_clause + " "+cl+" order by V_NAME asc";
	
 

%>

<table  width="100%" border="1" bgcolor="lavender" cellspacing="0" cellpadding="0" bordercolor="#002851" bordercolorlight="#C0C0C0" bordercolordark="#002851">
  
  <tr align="center"  id="jj" bgcolor="ghostwhite">
    <td align="center" nowrap colspan="2"><font face="Times New Roman" color="#0000FF" size="3">
    <input type="text" id="search_str">&nbsp;&nbsp;&nbsp;
    <a id="lnknav" href="" onclick="search_onclick()">Search</a>
    
    </strong></font></tt></td>
  </tr> 
  <tr align="center"  id="jj" bgcolor="ghostwhite">
    <td align="center" nowrap><font face="Times New Roman" color="#0000FF" size="3"><strong><tt>ID</strong></font></tt></td>
    <td align="center" nowrap><font face="Times New Roman" color="#0000FF" size="3"><strong><tt>Name</strong></font></tt></td>
  </tr>

<%

	
int  i=1;
 ps = mk.con.prepareStatement(sql) ;
 rs = ps.executeQuery() ;
 
while(rs.next()){

 cont_ref=rs.getString("VENDOR_REF");
 cont=rs.getString("V_NAME");
%>
  <tr  id="tr<%=i%>" onmouseover="rollon(<%=i%>)" onmouseout="rollout(<%=i%>)"  onclick="return rowclick('<%=cont_ref%>','<%=cont%>')">
    <td  id="td1<%=i%>" align="center"><font face="Times New Roman" color="black" size="3"><tt><%= cont_ref %>&nbsp;</font></tt></td>
    <td id="td2<%=i%>" align="left"><font face="Times New Roman" color="black" size="3"><tt><%= cont %></font></tt></td>
  </tr>
<%

i=i+1 ;
}

rs.close();
ps.close();

%>
</table>
<INPUT type="hidden" name="trh">
</center></div>
</body>

<script LANGUAGE="javascript">
function rollon(j){
window.event.srcElement.style.cursor="hand"
eval("tr"+j+".style.backgroundColor=\"yellow\"")
eval("trh.value=tr"+j+".offsetHeight")
eval("tr"+j+".height=30")
}
function rollout(j){
eval("tr"+j+".style.backgroundColor=\"lavender\"")
eval("tr"+j+".height=trh.value")
}

function rowclick(x,y){
var z=x+"~"+y
window.returnValue=z;
window.close();
}


function search_onclick(){
lnknav.href=location.href
lnknav.search="?p=<%=p%>&search_str=" + search_str.value
lnknav.click()
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

</html>

