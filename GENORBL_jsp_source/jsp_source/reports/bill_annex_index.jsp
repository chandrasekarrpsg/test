<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<script type="text/javascript" src="RepFunc.js"></script>

</head>

<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>

<%

String sLoginEmpCd = loginBean.getsEmpCd();

String finyr1  = request.getParameter("finyr");
MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
%>


<body background="GS1.jpg" onLoad="prescript();">
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
<b>FINANCIAL YEAR WISE ANNEXURES</b>
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

<td><font size="5" color="#400040"><b>FINANCIAL YEAR</b></font></td>
<td>
   <select name="s2" id="s2">
<%
     String finyr   = new String();
     String yr      = new String();
     String qry     = new String();

     try{

      PreparedStatement ps = null ;
      ResultSet rs         = null ;
      
      qry ="select                                                                                                   " +
           "     (case                                                                                               " + 
           "      when to_char(d1.dates,'mm') >3                                                                     " +
	   "      then to_char(d1.dates,'yyyy')||'-'||to_char(to_number(to_char(d1.dates,'yyyy'))+1)                 " +
	   "      else to_char(to_number(to_char(d1.dates,'yyyy'))-1)||'-'||to_char(d1.dates,'yyyy')                 " +
	   "      end) FINYR,                                                                                        " +
           "     (case                                                                                          " + 
           "      when to_char(d1.dates,'mm') >3                                                                     " +
	   "      then lpad(to_char(d1.dates,'yy'),2,'0')||'-'||lpad(to_char(to_number(to_char(d1.dates,'yy'))+1),2,'0')      " +
	   "      else lpad(to_char(to_number(to_char(d1.dates,'yy'))-1),2,'0')||'-'||lpad(to_char(d1.dates,'yy'),2,'0')      " +
	   "      end) YR                                                                                     " +
           "from (select     add_months(trunc(sysdate,'yyyy'),-12*(rownum-1)) dates                                  " +
           "      from       dual                                                                                    " + 
           "      connect by to_number(to_char(add_months(trunc(sysdate,'yyyy'),-12*(rownum-1)),'yyyy')) >2003) d1   " +
           "order by 1                                                                                               " ;

      ps = mk.con.prepareStatement(qry) ;
      rs = ps.executeQuery() ;

      while(rs.next()) {
            finyr = rs.getString(1) ;
            yr    = rs.getString(2) ;

%>
            <option value="<%=yr%>"><%=finyr%></option>
<%
      }

      rs.close() ;
      ps.close() ;

     }catch(Exception e){
            e.printStackTrace();
      }
%>

   </select>
</td>

</tr>

</table>

<TABLE>
<TR>
<form method="POST" name="sampleform" action="bill_annex_index.jsp" onSubmit="DefaultValue1();" valign="middle" align="center" >

<input type ="hidden" id="h1" name="hgen">
<input type ="hidden" id="h2" name="hyr">

<TD align=center><input type = "submit" value="SUBMIT" ></TD>

</form>

<TD>&nbsp;&nbsp;</TD>
<TD align=left> <input type = "button" value="BACK" onclick="window.parent.open('invoke_menu_page.jsp?userid=<%=sLoginEmpCd%>','_self');"></TD>
<TD>&nbsp;&nbsp;</TD>
</TR>
</TABLE>

<%
     String genstn  = request.getParameter("hgen");
     String fin_yr  = request.getParameter("hyr");
     String year1   = new String();
     
     try{
         
         int DT     = 0;
         String MM  = new String();

         PreparedStatement ps1 = null ;
         ResultSet rs1         = null ;

         ps1 = mk.con.prepareStatement("select trim(to_char(trunc(sysdate),'DD')) DT,trim(to_char(trunc(sysdate),'MM')) Mnth from dual") ;
         rs1 = ps1.executeQuery();

         while(rs1.next()) {
               DT = Integer.parseInt(rs1.getString(1)) ;
               MM = rs1.getString(2) ;
         }
     
         ps1.close();
         rs1.close();


         ps1 = mk.con.prepareStatement("select substr(trim(to_char(trunc(sysdate),'YYYY')),0,2)||trim(substr(?,0,2))||'-'|| " +
                                       "       substr(trim(to_char(trunc(sysdate),'YYYY')),0,2)||trim(substr(?,4))   Y1     " +
                                       "from dual                                                                           ");
        
         ps1.setString(1,fin_yr);
         ps1.setString(2,fin_yr);

         rs1 = ps1.executeQuery();
         
         while(rs1.next()) {
               year1 = rs1.getString(1) ;
         }

         System.out.println("bill_annex_index YEAR1 : " + year1+"  fin_yr: "+fin_yr);
  
         ps1.close();
         rs1.close();
     
     if(genstn != null && fin_yr != null){

%>
<div id="D1">

<label style="POSITION: absolute; LEFT: 400px; top:250px">
       <font size="5" color="#400040">
       <b>.<a href="bill_annexure1.jsp?gs=<%=genstn%>&f_yr=<%=fin_yr%>&yr=<%=year1%>">ANNEXURE - I</a></b>
       </font>
</label>

<label style="POSITION: absolute; LEFT: 400px; top:350px">
       <font size="5" color="#400040">
       <b>.<a href="bill_annexure2.jsp?gs=<%=genstn%>&f_yr=<%=fin_yr%>&yr=<%=year1%>"> ANNEXURE - II</a></b>
       </font>
</label>

<label style="POSITION: absolute; LEFT: 400px; top:450px">
       <font size="5" color="#400040">
       <b>.<a href="bill_misc_annexure.jsp?gs=<%=genstn%>&f_yr=<%=fin_yr%>&yr=<%=year1%>"> MISCELLANAEOUS ANNEXURE</a></b>
       </font>
</label>

</div>

<%

     }

     }catch(Exception e1){
          e1.printStackTrace();
      }finally{
          mk.con.close();
       }
%>

</center>
</body>
</html>
