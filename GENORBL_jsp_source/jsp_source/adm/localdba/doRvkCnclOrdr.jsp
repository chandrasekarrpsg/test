<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<HTML><HEAD><TITLE>REVOKING A CANCELLED ORDER</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META http-equiv=Content-Language content=en-us>
 
<STYLE>TABLE {
	FONT-SIZE: 12px; BACKGROUND: #c0c0c0; FONT-FAMILY: verdana; TEXT-ALIGN: left
}
TABLE THEAD {
	CURSOR: pointer
}
TABLE THEAD TR {
	BACKGROUND: #c0c0c0
}
TABLE TFOOT TR {
	BACKGROUND: #c0c0c0
}
TABLE TBODY TR {
	BACKGROUND: #f0f0f0
}
TD {
	BORDER-RIGHT: white 1px solid; BORDER-TOP: white 1px solid; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid
}
TH {
	BORDER-RIGHT: white 1px solid; BORDER-TOP: white 1px solid; BORDER-LEFT: white 1px solid; BORDER-BOTTOM: white 1px solid
}
</STYLE>
<script type='text/JavaScript' src='js/best_cal_ag.js'></script> 
<script type="text/javascript" src="slideshowfade.js"></script>

<script type="text/javascript">

            var imgArray = new Array();
            imgArray[0] = "k1118050.jpg";
            imgArray[1] = "k1451470.jpg";
            imgArray[2] = "k4777200.jpg";
            imgArray[3] = "k7067130.jpg";


            slideshowFade('Slideshow1','',imgArray,20,5000);

        </script>


 <style type="text/css">
            #Slideshow1 img {position:absolute; left:15px;top:20px; width:150px;}
            .style3 {
                font-size: 50px;
                font-color: 'white';

}
            .style4 {
                text-align: center;
                padding-right: 5px;
                padding-top: 10px;
                font-weight: bold;
                font-size: 12px;
            }

#logo {
                height: 284px;
                width: 100%;
                background: url(big_img.jpg) left top no-repeat;
}

.menu_style_1{
background-color:#8e91f2 ;
}
.menu_div_style_1{
width:200px;
}

      </style>




<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>



<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>
    <input type="hidden" name="sBack" value=""/>
    <input type="hidden" name="sBackClick" value="0"/>


<%
                


                String sLoginStnCd = loginBean.getsGenStn();
                String sLoginStnShrtNm = loginBean.getsLoginStnShrtNm();
                String sLoginStnLongNm = loginBean.getsGenStnNm();
                String sLoginDeptCd = loginBean.getsDept();
                String sLoginDeptShrtNm = loginBean.getsLoginDeptShrtNm();
                String sLoginDeptLongNm = loginBean.getsLoginDeptLongNm();
                String sLoginEmpCd = loginBean.getsEmpCd();
                String sLoginEmpNm = loginBean.getsEmpFNm() + " " + loginBean.getsEmpLNm();
                String sLoginEmpDesg = loginBean.getsEmpDesg();
                String sLoginEmpLvl = loginBean.getsLoginEmpLvl();
                String sPgTyp = request.getParameter("sPgTyp");

                







%>

 
 
<body bgColor="#ece9d8" >
<form name="f1" method="post">
<script>



function allcheck()
{
var marker=0;

if(marker==0)
{
if(f1.s0.value =='ALL')
{
marker=1;
alert('PLEASE SELECT A STATION');
f1.s0.focus();
return false;
}
}

if(marker==0)
{
if((f1.t1.value =='')&&(f1.t3.value ==''))
{
marker=1;
alert('PLEASE ENTER A DATE RANGE OR AN ORDER ID');
f1.t1.value='';
f1.t2.value='';
f1.t1.focus();
return false;
}
}


if(marker==0)
{
if((f1.t1.value !='')&&(f1.t2.value ==''))
{
marker=1;
alert('PLEASE ENTER A PROPER DATE');
f1.t2.focus();
return false;
}
}
if(marker==0)
{
if((f1.t1.value !='')&&(f1.t2.value !='')&&(f1.t3.value !=''))
{
marker=1;
alert('PLEASE ENTER A DATE RANGE OR AN ORDER ID');
f1.t1.value='';
f1.t2.value='';
f1.t1.focus();
return false;
}
}


if(marker==0)
{
f1.statuscontrol.value='1';

f1.submit();
}

}
</script>


<table width="100%" bgcolor="#ff9a35">
            <tr>
                <td colspan="2" height="100px" bgcolor="#8080c0" align="center">

                    <div id="header" style="height: 100px">

        <div id="logo" style="height: 100px">
<h3 style="height: 97px"  ><font size="20px" face="Arial" color="white" ><label style="position:absolute;left:250px;top:40px;"> GENERATION DIVISION</label></font></h3>
</div>


 </div>
</td>
</tr>

</table>

            <img alt="" src="cesclogo1.png" style="position:absolute; left:855px; top:40px" width="120" height="59"/>



<TABLE id=AutoNumber1 cellSpacing=1 cellPadding=2 width="100%" style="height: 45px">
  <TR>
    <TD width="100%" bgColor=#FFCB7D >
      <P align=center><span style="background-color: #FFCB7D"><b>
      <font face="Arial" size="6" color="#111111">REVOKING A CANCELLED ORDER</font></b></span></P></TD>

    </TR>
</TABLE>    


<input type="hidden" name="status">
<input type="hidden" name="statuscontrol"  value="0">

<%
int x=0;
int counter=0;
int flag1=0;
int flag2=0;
int marker=0;
String fromdt=new String("");
String todt=new String("");
String orderid=new String("");
String stationcode=new String("");
String ordertype=new String("");
String jobtype=new String("");
String deptcode=new String("");
String str1=new String("");
String str2=new String("");
String str3=new String("");
String str4=new String("");
String str5=new String("");
String str=new String("");

int marker1=0;

fromdt=request.getParameter("t1");
todt=request.getParameter("t2");
orderid=request.getParameter("t3");
%>


<%
stationcode=request.getParameter("s0");
ordertype=request.getParameter("s1");
jobtype=request.getParameter("s2");
deptcode=request.getParameter("s3");

%>




<%
int counter6=0;
int counter7=0;
int counter8=0;
MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{
PreparedStatement ps=null;
ResultSet rs=null;
%>
<br>
<center>
<table>


<tr>
<%
if(sLoginStnCd.equals("042"))
{
%>
                <td>Station Name :  &nbsp &nbsp </td>
<td colspan="4"><select name="s0" onChange="f1.submit();">
<option selected value="ALL">SELECT</option>
<%
ps=mk.con.prepareStatement("select distinct orbl_station_cd,station_sht_desc,decode(orbl_station_cd,'016',1,'014',2,'002',3,'013',4,'019',5,'042',6) from cd_station order by 3");

rs=ps.executeQuery();
while(rs.next())
{
%>
<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
<%
}
rs.close();
ps.close();
%>
</select>
            </td>
<%
}
else if(sLoginStnCd.equals("019"))
{
%>

                <td>Station Name :  &nbsp &nbsp </td>
<td colspan="4"><select name="s0" >
<option selected value="ALL">SELECT</option>
<%
ps=mk.con.prepareStatement("select distinct orbl_station_cd,station_sht_desc,decode(orbl_station_cd,'016',1,'014',2,'002',3,'013',4,'019',5) from cd_station where orbl_station_cd !='042' order by 3");
rs=ps.executeQuery();
while(rs.next())
{
%>
<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
<%
}
rs.close();
ps.close();
%>
</select>

</td>
<%
}
else
{
%>


                <td>Station Name :  &nbsp &nbsp </td>
<td colspan="4"><select name="s0" >
<option value="<%=sLoginStnCd %>"><%=sLoginStnShrtNm %></option>
</select>

</td>

<%
}
%>




             </tr>



           <tr>
                <td>From Order Date :  &nbsp &nbsp </td><td><input type=text name="t1" onclick='scwShow(this,event);' />
                </td>
                 <td>
                   To Order Date :  &nbsp &nbsp </td><td> <input type=text name="t2" onclick='scwShow(this,event);' />
                </td>
                <td><input type="button" name="B1"  value="SEARCH" onclick="allcheck();">
                <input type="reset" name="B3"  value="RESET" ></td>
               
            </tr> 

             <tr>
                <td>Order Id :  &nbsp &nbsp </td>
                <td><input type="text"  name="t3"></td>

                <td colspan="3"><input type="button" name="B2"  value="BACK" onclick="window.close();"></td>
             </tr>


          <tr>
                <td>Order Type :  &nbsp &nbsp </td><td><select name="s1" > 
                <option selected value="ALL">ALL</option>
                <option value="O">One Time</option>
                <option value="C">Capex Order</option>
                <option value="R">Rate Contract</option>
                <option value="T">Term Contract</option></select>
                </td>
     
                <td>Job Type :  &nbsp &nbsp </td><td colspan="2"><select name="s2" > 
                <option selected value="ALL">ALL</option>
                <option value="O">Operational</option>
                <option value="M">Maintenance</option></select>
                
                </td>


         </tr>
             <tr>
                <td>Department :  &nbsp &nbsp </td>


<%
if(sLoginStnCd.equals("042"))
{
%>
<td colspan="4"><select name="s3" > 
<%
ps=mk.con.prepareStatement("select dept,dept_sdesc from orbl_cd_dept_mst where station='"+stationcode+"'");
rs=ps.executeQuery();
%>

<option value="ALL">SELECT</option>
<%
while(rs.next())
{
%>
<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
<%
}
rs.close();
ps.close();
%>
</select>
</td>
<%
}

else if(sLoginStnCd.equals("019"))
{
 %>   


<td colspan="4">
<select name="s3" > 

<option value="30">CTM</option>

</select>
</td>


<%
}
else
{
%>


<td colspan="4"><select name="s3" > 
<%
ps=mk.con.prepareStatement("select dept,dept_sdesc from orbl_cd_dept_mst where station='"+sLoginStnCd+"'");
rs=ps.executeQuery();
%>

<option value="ALL">SELECT</option>
<%
while(rs.next())
{
%>
<option value="<%=rs.getString(1) %>"><%=rs.getString(2) %></option>
<%
}
rs.close();
ps.close();
%>
</select>
</td>






<%
}
%>

         </tr>

</table>
</center>

<br>
<br>


<%
stationcode=request.getParameter("s0");
if(!(stationcode.equals("ALL")))
{
%>
<script>
f1.s0.value='<%=stationcode %>';
</script>
<%
}
if(request.getParameter("statuscontrol").equals("1"))
{

if((fromdt !=null)&&(todt !=null))
{
marker1=1;
%>
<%
if(sLoginStnCd.equals("019"))
{
str1="SELECT order_id,order_no,nvl(TO_CHAR(order_DATE,'DD-Mon-RRRR'),' '),trim(emp_fname)||' '||trim(emp_lname),order_date FROM ORBL_ord_DTL,adm_emp_mst where order_by=emp_code(+) and (order_date between to_date('"+fromdt+"','dd/mm/rrrr') and to_date('"+todt+"','dd/mm/rrrr')) and station='"+stationcode+"' and ord_orgn_stn ='"+sLoginStnCd+"'";
}
else
{
str1="SELECT order_id,order_no,nvl(TO_CHAR(order_DATE,'DD-Mon-RRRR'),' '),trim(emp_fname)||' '||trim(emp_lname),order_date FROM ORBL_ord_DTL,adm_emp_mst where order_by=emp_code(+) and (order_date between to_date('"+fromdt+"','dd/mm/rrrr') and to_date('"+todt+"','dd/mm/rrrr')) and station='"+stationcode+"'";
}
ordertype=request.getParameter("s1");
jobtype=request.getParameter("s2");
deptcode=request.getParameter("s3");


%>
<script>
f1.s0.value='<%=stationcode %>';
f1.s1.value='<%=ordertype %>';
f1.s2.value='<%=jobtype %>';
f1.s3.value='<%=deptcode %>';
</script>
<%
if(ordertype.equals("ALL"))
{
str2="";
}
else
{
str2=" and order_type='"+ordertype+"'";
}

if(jobtype.equals("ALL"))
{
str3="";
}
else
{
str3=" and job_type='"+jobtype+"'";
}

if(deptcode.equals("ALL"))
{
str4="";
}
else
{
str4=" and dept='"+deptcode+"'";
}

str=str1+str2+str3+str4+" ORDER BY 5 DESC,1 ";
%>


<%
ps=mk.con.prepareStatement(str);
rs=ps.executeQuery();

while(rs.next())
{
if(counter==0)
{
%>
<CENTER>
<DIV style="height:250px; width:970px; overflow:scroll;">

<TABLE id=AutoNumber2 cellSpacing=1 cellPadding=2  style="width: 970px;">
  <TR>
    
    <TD width="30%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Order Number</font></b></TD>

    <TD width="30%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Order Date</font></b></TD>
    <TD width="40%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Issued By</font></b></TD>

  </TR>

<%
}
%>
  <TR>
    <TD width="30%">
<a href="doRvkCancellation.jsp?T6=<%=rs.getString(1) %> "><%=rs.getString(2) %></a>
    </TD>
    <TD width="30%">
     <%=rs.getString(3) %>
    </TD>
    <TD width="40%">
     <%=rs.getString(4) %>
    </TD>

  </TR>
<%
counter=counter+1;
counter6=1;
}
rs.close();
ps.close();
%>
<%
if(counter !=0)
{
%>
</TABLE>

</DIV>

</CENTER>
<%
}
%>
<script>
f1.t1.value='<%=fromdt %>';
f1.t2.value='<%=todt %>';

</script>
<%
}


if(counter==0)
{
%>


<%
if(orderid !=null)
{
str1="SELECT  order_id,order_no,nvl(to_char(order_date,'dd-Mon-rrrr'),' '),trim(emp_fname)||' '||trim(emp_lname)  FROM ORBL_ORD_DTL,adm_emp_mst  where order_by=emp_code(+) and order_id='"+orderid+"'  and station='"+stationcode+"'";

ordertype=request.getParameter("s1");
jobtype=request.getParameter("s2");
deptcode=request.getParameter("s3");
%>

<script>
f1.s0.value='<%=stationcode %>';
f1.s1.value='<%=ordertype %>';
f1.s2.value='<%=jobtype %>';
f1.s3.value='<%=deptcode %>';
</script>

<%
if(ordertype.equals("ALL"))
{
str2="";
}
else
{
str2=" and order_type='"+ordertype+"'";
}

if(jobtype.equals("ALL"))
{
str3="";
}
else
{
str3=" and job_type='"+jobtype+"'";
}

if(deptcode.equals("ALL"))
{
str4="";
}
else
{
str4=" and dept='"+deptcode+"'";
}

str=str1+str2+str3+str4;
%>



<%

ps=mk.con.prepareStatement(str);

rs=ps.executeQuery();
while(rs.next())
{
if(counter==0)
{
%>
<CENTER>

<TABLE id=AutoNumber2 cellSpacing=1 cellPadding=2  style="width: 970px;">
  <TR>
    <TD width="30%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Order Number</font></b></TD>

    <TD width="30%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Order Date</font></b></TD>
    <TD width="40%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Issued By</font></b></TD>
  </TR>

<%
}
%>

  <TR>
    <TD width="30%">
<a href="doRvkCancellation.jsp?T6=<%=rs.getString(1) %> "><%=rs.getString(2) %></a>
    </TD>
    <TD width="30%">
     <%=rs.getString(3) %>
    </TD>
    <TD width="40%">
     <%=rs.getString(4) %>
    </TD>

  </TR>
<%
counter=counter+1;
counter7=1;
}
rs.close();
ps.close();

%>


<%
if(counter !=0)
{
%>
</TABLE>
</CENTER>
<%
}
%>
<script>
f1.t3.value='<%=orderid %>';

</script>


<%
}
}
if((counter==0) && (request.getParameter("t1").equals("")) &&(request.getParameter("t3").equals("")))
{
%>
<%
str1="SELECT order_id,order_no,nvl(TO_CHAR(order_DATE,'DD-Mon-RRRR'),' '),trim(emp_fname)||' '||trim(emp_lname) FROM ORBL_ord_DTL,adm_emp_mst where order_by=emp_code(+) and station='"+stationcode+"'";

ordertype=request.getParameter("s1");
jobtype=request.getParameter("s2");
deptcode=request.getParameter("s3");


%>
<script>
f1.s0.value='<%=stationcode %>';
f1.s1.value='<%=ordertype %>';
f1.s2.value='<%=jobtype %>';
f1.s3.value='<%=deptcode %>';




</script>
<%
if(ordertype.equals("ALL"))
{
str2="";
}
else
{
str2=" and order_type='"+ordertype+"'";
}

if(jobtype.equals("ALL"))
{
str3="";
}
else
{
str3=" and job_type='"+jobtype+"'";
}

if(deptcode.equals("ALL"))
{
str4="";
}
else
{
str4=" and dept='"+deptcode+"'";
}

str=str1+str2+str3+str4;
%>


<%
ps=mk.con.prepareStatement(str);
rs=ps.executeQuery();

while(rs.next())
{
if(counter==0)
{
%>
<CENTER>
<DIV style="height:250px; width:970px; overflow:scroll;">

<TABLE id=AutoNumber2 cellSpacing=1 cellPadding=2  style="width: 970px;">
  <TR>
    
    <TD width="30%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Order Number</font></b></TD>

    <TD width="30%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Order Date</font></b></TD>
    <TD width="40%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Issued By</font></b></TD>

  </TR>

<%
}
%>
  <TR>
    <TD width="30%">
<a href="doRvkCancellation.jsp?T6=<%=rs.getString(1) %> "><%=rs.getString(2) %></a>
    </TD>
    <TD width="30%">
     <%=rs.getString(3) %>
    </TD>
    <TD width="40%">
     <%=rs.getString(4) %>
    </TD>

  </TR>
<%
counter=counter+1;
counter6=1;
}
rs.close();
ps.close();
%>
<%
if(counter !=0)
{
%>
</TABLE>

</DIV>

</CENTER>
<%
}
%>


<%
}
if(counter==0)
{
%>
<script>
alert('NO RECORDS FOUND');

</script>
<%
}
}
}catch(Exception e){System.out.println(e); }
        finally{
                 if(mk.con!=null)
                    {
                    mk.con.close();
                    System.out.println("    CLOSED !!!!!");
                    }
               }


%>





</form>
</body>
</HTML>




