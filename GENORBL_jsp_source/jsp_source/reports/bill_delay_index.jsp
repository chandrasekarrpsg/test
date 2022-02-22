<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="java.sql.*,javax.servlet.jsp.*" %>
<%@ page import="java.util.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

<head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">
<script type="text/javascript" src="Common_Funcs.js"></script>
<script src="js/sel_date.js"></script>

<title>DELAY IN ISSUING OF ORDERS AND RELEASING OF BILLS</title>

</script>

<style>
table.rcrds
{
border-collapse:collapse;
}
table.rcrds,th, td.rcrdsEle
{
border: 1px solid black;
}


.pgbrk{
page-break-after:always;
}


</style>


</head>

<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>

<%
String sLoginEmpCd = loginBean.getsEmpCd();
String sStnshrtNm  = loginBean.getsLoginStnShrtNm();
String sStnNm      = loginBean.getsGenStnNm();
String sGenstnCd   = loginBean.getsGenStn();

String st_dt  = request.getParameter("st_dt");
String end_dt = request.getParameter("end_dt");

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
<font face="Albertus Extra Bold" size="3" color="#400040">
<b>DELAY IN ISSUING OF ORDERS AND RELEASING OF BILLS</b>
</font>
<br><br>

<table>
<tr>
<td><font size="4" color="#400040"><b>GENERATING STATION</b></font></td>

<%

     if(sGenstnCd.equals("002") ||  sGenstnCd.equals("013") || sGenstnCd.equals("014") || sGenstnCd.equals("016") ){
     System.out.println("MRITYUNJOY 1 "+sGenstnCd);

%>

<td><%=sStnshrtNm%></td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>DEPARTMENT</b></font></td>
<td>
<select name="s1" id="s1">
<%
    try {

      String dept_nm = new String() ;
      String dept_cd  = new String() ;

      PreparedStatement ps = null ;
      ResultSet rs = null ;

      ps = mk.con.prepareStatement("select 'ALL' DPT_NM,'999' DPT_CD   " +
                                   "from dual                          " +
                                   "union                              " +
                                   "select distinct ORDER_DEPT,DEPT    " +
                                   "from   orbl_cd_dept                " +
                                   "where  STATION = ?                 " +
                                   "and    DEPT <> '30'                " +
                                   "order by 1                         " ) ;

      ps.setString(1,sGenstnCd);

      rs = ps.executeQuery() ;

      while(rs.next()) {
            dept_nm = rs.getString(1) ;
            dept_cd = rs.getString(2) ;
%>
<option value="<%=dept_cd%>"><%=dept_nm%></option>
<%
      }

      rs.close() ;
      ps.close() ;

  }catch(Exception e1){
              e1.printStackTrace();
  }
%>
</select>
</td>
<%

} else if  (sGenstnCd.equals("019")){
     System.out.println("MRITYUNJOY 2 "+sGenstnCd);

%>
<td>
<select name="s2" id="s2" >
<%
           try {
                      String   stn_cd  =   new String();
                      String   stn_nm  =   new String();

                      PreparedStatement ps = null ;
                      ResultSet rs                    = null ;

                      ps = mk.con.prepareStatement("select '99999' STN_CD,'ALL' STN_NM  " +
                                                   "from dual                           " +
                                                   "union                               " +
                                                   "select s.ORBL_STATION_CD STN_CD,    " +
                                                   "       s.STATION_SHT_DESC STN_NM    " +
                                                   "from   CD_STATION s                 " +
                                                   "where  s.ORBL_STATION_CD <> '042'   " +
                                                   "order by 2                          " ) ;
                      rs = ps.executeQuery() ;

                      while(rs.next()){
                                  stn_cd  = rs.getString(1) ;
                                  stn_nm = rs.getString(2) ;
 %>

<option value="<%=stn_cd%>"><%=stn_nm%></option>

<%
                      }

                      rs.close();
                      ps.close();

          }catch(Exception e2){
                      e2.printStackTrace();
          }
%>

</select>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>DEPARTMENT</b></font></td>
<td>
<select name="s1" id="s1">
<option value="30">CTM</option>
</select>
</td>
<%
}else{
     System.out.println("MRITYUNJOY 3 "+sGenstnCd);

%>

<td>
<select name="s2" id="s2"  onChange="getDeptDesc()">
<option>SELECT</option>
<%
           try {
                      String   stn_cd  =   new String();
                      String   stn_nm  =   new String();

                      PreparedStatement ps = null ;
                      ResultSet rs         = null ;

                      ps = mk.con.prepareStatement("select '99999' STN_CD,'ALL' STN_NM  " +
                                                   "from dual                           " +
                                                   "union                               " +
                                                   "select s.ORBL_STATION_CD STN_CD,    " +
                                                   "       s.STATION_SHT_DESC STN_NM    " +
                                                   "from   CD_STATION s                 " +
                                                   "order by 2                          " ) ;
                      rs = ps.executeQuery() ;

                      while(rs.next()){
                                  stn_cd  = rs.getString(1) ;
                                  stn_nm = rs.getString(2) ;
 %>

<option value="<%=stn_cd%>"><%=stn_nm%></option>

<%
                      }

                      rs.close();
                      ps.close();

          }catch(Exception e3){
                      e3.printStackTrace();
          }
%>

</select>
</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td>&nbsp;</td>
<td><font size="4" color="#400040"><b>DEPARTMENT</b></font></td>
<td>
<select name="s1" id="s1">
</td>
<%
}

mk.con.close();


%>
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
</table>

<form method="POST" name="sampleform" id="f1" action="bill_delay_index.jsp" valign="middle" align="center" >
      <input type ="hidden" id="h1" name="hst_dt">
      <input type ="hidden" id="h2" name="hend_dt">
      <input type ="hidden" id="h3" name="hdept">
      <input type ="hidden" id="h4" name="hgen" >
      <input type ="hidden" id="h5" name="hGS" value="<%=sGenstnCd%>">
</form>



<TABLE>
<TR>
<TD align="center"><input type = "button" value="SUBMIT" onClick="DfltVal_Delay_Index();"></TD>
<TD>&nbsp;&nbsp;</TD>
<TD align=left> <input type = "button" value="BACK" onclick="window.parent.open('invoke_menu_page.jsp?userid=<%=sLoginEmpCd%>','_self')
;"></TD>
<TD>&nbsp;&nbsp;</TD>
</TR>
</TABLE>


<%

System.out.println("MRITYUNJOY 4 "+sGenstnCd);

String st_dt1    = request.getParameter("hst_dt");
String end_dt1   = request.getParameter("hend_dt");
String dept1     = request.getParameter("hdept");
String genstn    = request.getParameter("hgen");

if(st_dt1!= null && end_dt1!= null && dept1 != null){

System.out.println("1. DEB CHAK New Rep:GS "+genstn);
System.out.println("1. DEB CHAK New Rep:Dept "+dept1);

%>

<center>
<br><br><br><br>

<font size="5" color="#400040"><b>DELAY FOR</b></font>

<br><br><br><br>

<font size="5" color="#400040"><b>
      <a href="bill_issuing_delay.jsp?frm_dt=<%=st_dt1%>&to_dt=<%=end_dt1%>&dept=<%=dept1%>&GS=<%=genstn%>">ISSUING OF ORDERS</a>
</b></font>

<br><br><br><br>

<font size="5" color="#400040"><b>
      <a href="bill_processing_delay.jsp?frm_dt=<%=st_dt1%>&to_dt=<%=end_dt1%>&dept=<%=dept1%>&GS=<%=genstn%>">RELEASING OF BILLS</a>
</b></font>
</center>

<% } %>

</body>
</html>



