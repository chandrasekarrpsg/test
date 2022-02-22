<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<HTML><HEAD><TITLE>LOGINORDMATRIX</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META http-equiv=Content-Language content=en-us>
 
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


<table width="100%" bgcolor="#ff9a35">
            <tr>
                <td colspan="2" height="100px" bgcolor="#8080c0" align="center" >
                    
                    <div id="header" style="height: 100px">
	
	<div id="logo" style="height: 100px;">
   <h3 style="height: 97px"  ><font size="20px" face="Arial" color="white" ><label style="position:absolute;left:250px;top:40px;"> GENERATION DIVISION</label></font></h3>
</div>  

            <img alt="" src="cesclogo1.png" style="position:absolute; left:855px; top:40px" width="120" height="59"/>

 </div>
</td>
</tr>
</table>



<TABLE id=AutoNumber1 cellSpacing=1 cellPadding=2 width="100%" style="height: 45px">
  <TR>
    <TD width="100%" bgColor=#FFCB7D >
      <P align=center><span style="background-color: #FFCB7D"><b>
      <font face="Arial" size="6" color="#111111">LOGIN DEPARTMENT VS. ORDERING DEPARTMENT MATRIX UPDATION</font></b></span></P></TD>

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
String orddeptcode=new String("");
String str1=new String("");
String str2=new String("");
String str3=new String("");
String str4=new String("");
String str5=new String("");
String str=new String("");

String descdeptcode=new String("");
String descorddeptcode=new String("");
int marker1=0;

%>


<%
stationcode=request.getParameter("s0");
deptcode=request.getParameter("s3");
orddeptcode=request.getParameter("s4");




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

<%
if(sLoginStnCd.equals("042"))
{
%>
<td colspan="2">Login Department:<select name="s3" > 
<%
ps=mk.con.prepareStatement("select dept,dept_sdesc from orbl_cd_dept_mst where station='"+stationcode+"'");
rs=ps.executeQuery();
%>

<option selected value="ALL">SELECT</option>
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

<td colspan="2">Ordering Department<select name="s4" > 
<%
ps=mk.con.prepareStatement("select dept,dept_sdesc from orbl_cd_dept_mst where station='"+stationcode+"' and to_number(dept)<90");
rs=ps.executeQuery();
%>

<option selected value="ALL">SELECT</option>
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


<td colspan="2">

Login Department:<select name="s3" > 

<option value="30">CTM</option>

</select>
</td>

<td colspan="2">
Ordering Department:<select name="s4" > 

<option value="30">CTM</option>

</select>
</td>

<%
}
else
{
%>


<td colspan="2">Login Department:<select name="s3" > 
<%
ps=mk.con.prepareStatement("select dept,dept_sdesc from orbl_cd_dept_mst where station='"+sLoginStnCd+"'");
rs=ps.executeQuery();
%>

<option selected value="ALL">SELECT</option>
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


<td colspan="2">Ordering Department:<select name="s4" > 
<%
ps=mk.con.prepareStatement("select dept,dept_sdesc from orbl_cd_dept_mst where station='"+sLoginStnCd+"' and to_number(dept)<90");
rs=ps.executeQuery();
%>

<option selected value="ALL">SELECT</option>
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
<tr>
<td colspan="4">
<input type="button" value="SHOW" name="B1" onclick="f1.statuscontrol.value='2';f1.submit();">
<input type="button" value="INSERT" name="B2" onclick="f1.statuscontrol.value='1';f1.status.value='0';f1.submit();">
<input type="button" name="B3"  value="BACK" onclick="window.close();">
<input type="reset" name="B4"  value="RESET" >

</td>
</tr>
</table>
</center>



<%

deptcode=request.getParameter("s3");
orddeptcode=request.getParameter("s4");
if(!(deptcode.equals("ALL")))
{
%>
<script>
f1.s3.value='<%=deptcode %>';
f1.s4.value='<%=orddeptcode %>';
</script>
<%
}

stationcode=request.getParameter("s0");
if(!(stationcode.equals("ALL")))
{
%>
<script>
f1.s0.value='<%=stationcode %>';
</script>
<%
}



if(request.getParameter("statuscontrol").equals("2"))
{
ps=mk.con.prepareStatement("select decode(station,'016','BBGS','014','TGS','002','SGS','013','NCGS','019','CTM','042','EDGE'),decode(station,'016','1','014','2','002','3','013','4','019','5','042','6'),login_dept,order_dept,station from orbl_cd_dept order by 2,3");
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
      <font face="Arial" size="4" color="#111111">STATION</font></b></TD>

    <TD width="30%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">LOGIN DEPT</font></b></TD>
    <TD width="40%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">ORDERING DEPT</font></b></TD>

  </TR>

<%
}
%>
  <TR>
    <TD width="30%">
<a href="matrixupdation.jsp?T1=<%=rs.getString(1) %>&T3=<%=rs.getString(3) %>&T4=<%=rs.getString(4) %>&T5=<%=rs.getString(5) %> "><%=rs.getString(1) %></a>
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
if(counter==0)
{
%>
<script>
alert('NO RECORD FOUND');

</script>
<%
}

}
%>


<%
if(request.getParameter("statuscontrol").equals("1"))
{

if(request.getParameter("status").equals("0"))
{
%>
<script>
var r=confirm("Do you want to insert this record ?");
if(r==true)
{
f1.status.value='1';
f1.statuscontrol.value='1';
f1.submit();
}
else
{

f1.status.value='2';
f1.submit();
}

</script>
<%
}
%>
<%
if(request.getParameter("status").equals("1"))
{
%>


<%
ps=mk.con.prepareStatement("select dept_sdesc from orbl_cd_dept_mst where dept='"+deptcode+"' and station='"+stationcode+"'");
rs=ps.executeQuery();
while(rs.next())
{
descdeptcode=rs.getString(1);
}
rs.close();
ps.close();


ps=mk.con.prepareStatement("select dept_sdesc from orbl_cd_dept_mst where dept='"+orddeptcode+"' and station='"+stationcode+"'");
rs=ps.executeQuery();
while(rs.next())
{
descorddeptcode=rs.getString(1);
}
rs.close();
ps.close();
%>
<%
ps=mk.con.prepareStatement("insert into orbl_cd_dept(station,login_dept,order_dept,dept,crt_by,crt_dt)values('"+stationcode+"','"+descdeptcode+"','"+descorddeptcode+"','"+orddeptcode+"','"+sLoginEmpCd+"',trunc(sysdate))");

ps.executeUpdate();
mk.con.commit();
ps.close();
%>
<script>
alert('DATA INSERTED SUCCESSFULLY');
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




