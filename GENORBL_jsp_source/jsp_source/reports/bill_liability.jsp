<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<script type="text/javascript" src="RepFunc.js"></script>
<script src="js/sel_date.js"></script>

</head>

<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>

<%
String sLoginEmpCd = loginBean.getsEmpCd();

String st_dt  = request.getParameter("st_dt");
String end_dt = request.getParameter("end_dt");

MakeConnectionGENORBL mk = new MakeConnectionGENORBL();

%>


<body background="GS1.jpg" onLoad="document.getElementById('s1').focus();">

<img alt="" src="logo-cesc-new.png" style="position:absolute; left:885px; top:15px" width="89" height="47"/>&nbsp;

<div id="footer">
<div id="container">
<div class="left">
<p><img border="0" src="rlogo.png" style="position:absolute; left:25px; top:15px" width="170" height="70">


<label style="POSITION: absolute; LEFT: 660px; top:650px"  class="style5" ><b>2012 &copy Developed by I.T. Department</b></label>

</div>
</div>

<center>
<p align="center" style="word-spacing: 0; margin-top: 3; margin-bottom: 3">
<font face="Albertus Extra Bold" size="5" color="#400040">
<b>SUMMARY OF LIABIITY(CONTRACT)</b>
</font>
<br><br>

<table>
<tr>
<td><font size="5" color="#400040"><b>GENERATING STATION</b></font></td>
<td>
<select name="s1" id="s1">
<option selected value="999">SELECT</option>
<%
ResultSet rs50=null;
PreparedStatement ps50=null;
ps50  = mk.con.prepareStatement(
"SELECT DECODE(orbl_station_cd,'016',1,'014',2,'002',3,'013',4,'019',5,'042',6) seq,orbl_station_cd, " +
"station_sht_desc " +
"FROM  CD_STATION " +
"ORDER BY 1 ",
ResultSet.TYPE_SCROLL_INSENSITIVE,
ResultSet.CONCUR_READ_ONLY );
rs50=ps50.executeQuery();
while(rs50.next())
{
%>
<option value="<%= rs50.getString(2)%>"><%= rs50.getString(3)%></option>
<%
}

rs50.close() ;
ps50.close() ;
%>
</select>
</td>

<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>FROM</b></font></td>
<td><input type="text" name="st_dt"  id= "st_dt" size="11" value="" onClick="sel_date_cls('st_dt','js/')"></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>TO</b></font></td>
<td><input type="text" name="end_dt" id= "end_dt" size="11" value="" onClick="sel_date_cls('end_dt','js/')"></td>
</tr>

</table>

<TABLE>
<TR>
<form method="POST" name="sampleform" action="bill_liability.jsp" onSubmit="DefaultValue3();" valign="middle" align="center" >
      <input type ="hidden" id="h1" name="hst_dt">
      <input type ="hidden" id="h2" name="hend_dt">
      <input type ="hidden" id="h3" name="hgen">
<TD align=center><input type = "submit" value="SUBMIT"></TD>

</form>

<TD>&nbsp;&nbsp;</TD>
<TD align=left> <input type = "button" value="BACK" onclick="window.parent.open('invoke_menu_page.jsp?userid=<%=sLoginEmpCd%>','_self');"></TD>
<TD>&nbsp;&nbsp;</TD>
</TR>
</TABLE>

<%

String st_dt1  = request.getParameter("hst_dt");
String end_dt1 = request.getParameter("hend_dt");
String genstn  = request.getParameter("hgen");



System.out.println("START_DATE : "+st_dt1);
System.out.println("END_DATE : "+end_dt1);
System.out.println("GEN STATION : "+genstn);


if(genstn != null && st_dt1 != null && end_dt1 != null) {



ResultSet rs51=null;
PreparedStatement ps51=null;
ps51  = mk.con.prepareStatement(
"SELECT DISTINCT c.station_sht_desc " +
"FROM  CD_STATION c " +
"WHERE c.orbl_station_cd = ? ",
ResultSet.TYPE_SCROLL_INSENSITIVE,
ResultSet.CONCUR_READ_ONLY );

ps51.setString(1,genstn);

rs51=ps51.executeQuery();

String genstn2 = new String();

while(rs51.next())
{

genstn2 = rs51.getString(1) ;

}

rs51.close() ;
ps51.close() ;

  

   SimpleDateFormat formatdate = new java.text.SimpleDateFormat("dd/MM/yyyy");
   String DisplayDate= formatdate.format(new java.util.Date());

%>
<div id="D1" style="overflow:scroll; height:450px; background:#DBF2DC;">

<table>
<tr> 
<td align=left>   <font color="#400040" size="3"><b> &nbsp Date : <%= DisplayDate %> </b> </font> </td>
<td align=center> <font color="#400040" size="3"> 
                  <b>SUMMARY OF LIABILTY(CONTRACT) RELEASED BETWEEN <%=st_dt1%> AND <%=end_dt1%></b>
                  </font>
</td>
</tr>
<tr>
<td align=center colspan=2> <font color="#400040" size="3"> 
                  <b>GENERATION : <%=genstn2%></b>
                  </font>
</td>
</tr>
</table>


<%
     System.out.println("BILL_LIABILITY GS: "+genstn2);
     System.out.println("BILL_LIABILITY ST_DT: "+st_dt1);
     System.out.println("BILL_LIABILITY END_DT: "+end_dt1);

     try{
    
         String qry_str = new String();
         String qry_str1= new String();

         PreparedStatement ps = null ;
         ResultSet rs         = null ;

         String DEPT = new String();
         int CNT     = 0; 
         String AMT  = new String();

         int srl     = 0;

         qry_str ="SELECT d.ORDER_DEPT DEPT,                                                " +
                  "       COUNT(*) CNT,                                                     " +
	          "       nvl(to_char(SUM(bill_amount) / 100000,9999999990.99),0) AMT       " +
                  "FROM   orbl_bill_dtl b,                                                  " +
                  "       orbl_ord_dtl o,                                                   " +
	          "       orbl_cd_dept d                                                    " +
                  "WHERE  b.ORDER_ID = o.ORDER_ID                                           " +
                  "AND    o.DEPT = d.DEPT                                                   " +
                  "AND    decode(o.order_type,'O',o.ORDER_DATE,b.JOB_MONTH)                 " +
                  "       BETWEEN TO_DATE(?,'DD-MON-RR') AND TO_DATE(?,'DD-MON-RR')         " +
                  "AND    BILL_REF_ID IS NULL                                               " +
                  "AND    o.station = ?                                                     " +
                  "AND    o.station = b.station                                             " +
                  "GROUP BY d.ORDER_DEPT                                                    " +
                  "ORDER BY 1                                                               " ;

        ps = mk.con.prepareStatement(qry_str);
        
        ps.setString(1,st_dt1);
        ps.setString(2,end_dt1);
        ps.setString(3,genstn);

%>

<table border=1>
     
      <tr bgcolor="#DBF2DC">
          <td align="center" colspan=3>
          <font color="#400040"><b>BILLS RELEASED BUT NOT SENT TO FINANCE DEPARTMENT (ANNEXURE-I)</b></font></td>
      </tr>

      <tr bgcolor="#DBF2DC">         
          <td align="center"><font color="#400040"><b>DEPT</b></font></td>
          <td align="center"><font color="#400040"><b>COUNT</b></font></td>
          <td align="center"><font color="#400040"><b>AMOUNT (IN LACS)</b></font></td>
      </tr>
<%
        rs = ps.executeQuery() ;
    
        while(rs.next()){
              
System.out.println("DEB D");
              srl++;

              DEPT = rs.getString(1);
              CNT  = rs.getInt(2);
              AMT  = rs.getString(3);

              if(srl%2 == 0){
%>
              <tr bgcolor="#DBF2DC" onMouseOver="window.event.srcElement.style.cursor='hand'"
                  onClick="window.open('annex1.jsp?var1=<%=DEPT%>&var2=<%=st_dt1%>&var3=<%=end_dt1%>&var4=<%=genstn2%>','_self');">
                  <td align="left">  <font color="#800040"><b><%=DEPT%></b></font></td>
                  <td align="center"><font color="#800040"><b><%=CNT%></b></font></td>
                  <td align="right"> <font color="#800040"><b><%=AMT%></b></font></td>
              </tr>
<%
              }else{
%>
              <tr bgcolor="#FFFFFF" onMouseOver="window.event.srcElement.style.cursor='hand'"
                  onClick="window.open('annex1.jsp?var1=<%=DEPT%>&var2=<%=st_dt1%>&var3=<%=end_dt1%>&var4=<%=genstn2%>','_self');">
                  <td align="left">  <font color="#800040"><b><%=DEPT%></b></font></td>
                  <td align="center"><font color="#800040"><b><%=CNT%></b></font></td>
                  <td align="right"> <font color="#800040"><b><%=AMT%></b></font></td>
              </tr>

<%
              }
         }
     rs.close();
     ps.close();
%>
     </table>
<%
     srl = 0;

         qry_str1="SELECT d.ORDER_DEPT DEPT,                                                " +
                  "       COUNT(*) CNT,                                                     " +
                  "       nvl(to_char(SUM(bill_amount) / 100000,9999999990.99),0) AMT       " +
                  "FROM   orbl_bill_dtl b,                                                  " +
                  "       orbl_ord_dtl o,                                                   " +
	          "       orbl_cd_dept d                                                    " +
                  "WHERE  b.order_id = o.order_id                                           " +
                  "AND    o.DEPT = d.DEPT                                                   " +
                  "AND    decode(o.order_type,'O',o.ORDER_DATE,b.JOB_MONTH)                 " +
                  "       BETWEEN TO_DATE(?,'DD-MON-RR') AND TO_DATE(?,'DD-MON-RR')         " +
                  "AND    o.order_type  = 'O'                                               " +
                  "AND    o.station = ?                                                     " +
                  "AND    o.station = b.station                                             " +
                  "GROUP BY d.ORDER_DEPT                                                    " +
                  "ORDER BY 1                                                               " ;

                 /* "AND    o.ord_ref IS NULL                                          " +*/

        ps = mk.con.prepareStatement(qry_str1);

        ps.setString(1,st_dt1);
        ps.setString(2,end_dt1);
        ps.setString(3,genstn);

%>

<br>

<table border=1>
     
      <tr bgcolor="#DBF2DC">
          <td align="center" colspan=3>
          <font color="#400040"><b>STATION ORDERS RAISED BUT BILLS NOT RELEASED (ANNEXURE-II)</b></font></td>
      </tr>

      <tr bgcolor="#DBF2DC">
          <td align="center"><font color="#400040"><b>DEPT</b></font></td>
          <td align="center"><font color="#400040"><b>COUNT</b></font></td>
          <td align="center"><font color="#400040"><b>AMOUNT (IN LACS)</b></font></td>
      </tr>
<%
        rs = ps.executeQuery() ;

        while(rs.next()){

              srl++;

              DEPT = rs.getString(1);
              CNT  = rs.getInt(2);
              AMT  = rs.getString(3);

              if(srl%2 == 0){
%>
              <tr bgcolor="#DBF2DC" onMouseOver="window.event.srcElement.style.cursor='hand'" 
                  onClick="window.open('annex2.jsp?var1=<%=DEPT%>&var2=<%=st_dt1%>&var3=<%=end_dt1%>&var4=<%=genstn2%>','_self');">
                  <td align="left">  <font color="#800040"><b><%=DEPT%></b></font></td>
                  <td align="center"><font color="#800040"><b><%=CNT%></b></font></td>
                  <td align="right"> <font color="#800040"><b><%=AMT%></b></font></td>
              </tr>
<%
              }else{
%>
              <tr bgcolor="#FFFFFF" onMouseOver="window.event.srcElement.style.cursor='hand'"
                  onClick="window.open('annex2.jsp?var1=<%=DEPT%>&var2=<%=st_dt1%>&var3=<%=end_dt1%>&var4=<%=genstn2%>','_self');">
                  <td align="left">  <font color="#800040"><b><%=DEPT%></b></font></td>
                  <td align="center"><font color="#800040"><b><%=CNT%></b></font></td>
                  <td align="right"> <font color="#800040"><b><%=AMT%></b></font></td>
              </tr>

<%
              }
         }
     rs.close();
     ps.close();
%>
     </table>
</div>
<%
     }catch(Exception e1){
          e1.printStackTrace();
      }finally{
          mk.con.close();
       }
}
%>

</center>
</body>
</html>
