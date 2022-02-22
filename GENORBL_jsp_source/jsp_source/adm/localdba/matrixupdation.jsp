<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<HTML><HEAD><TITLE>REVOKING A CANCELLED ORDER</TITLE>
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
                height: 304px;
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
                <td colspan="2" height="100px" bgcolor="#8080c0" align="center">

                    <div id="header" style="height: 100px">

        <div id="logo" style="height: 100px">
<h3 style="height: 97px"  ><font size="20px" face="Arial" color="white" ><label style="position:absolute;left:250px;top:40px;"> GENERATION DIVISION</label></font></h3>


</div>

            <img alt="" src="cesclogo1.png" style="position:absolute; left:855px; top:40px" width="120" height="59"/>

 </div>

</table>












<TABLE id=AutoNumber1 cellSpacing=1 cellPadding=2 width="100%" style="height: 45px">
  <TR>
    <TD width="100%" bgColor=#FFCB7D >
      <P align=center><span style="background-color: #FFCB7D"><b>
      <font face="Arial" size="6" color="#111111">LOGIN DEPARTMENT VS. ORDERING DEPARTMENT MATRIX UPDATION</font></b></span></P></TD>

    </TR>
</TABLE>    


<input type="hidden" name="status" >
<input type="hidden" name="statuscontrol"  value="0">



<%

String status1=request.getParameter("status");

String stationcode=request.getParameter("T5");
String station=request.getParameter("T1");
String descorddeptcode=request.getParameter("T4");
String descdeptcode=request.getParameter("T3");

String newdeptcode=request.getParameter("s3");
String neworddeptcode=request.getParameter("s4");


String newdescdeptcode=new String("");
String newdescorddeptcode=new String("");

newdeptcode=request.getParameter("s3");
neworddeptcode=request.getParameter("s4");
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

<center>
<table>


<tr>
<td colspan="1">Station</td><td colspan="3"><input type="text" name="t1" readOnly value="<%=station %>"></td>
</tr>
<tr>
<td colspan="1">Login Dept:</td><td colspan="1"><input type="text" name="t2" readOnly value="<%=descdeptcode %>"></td>
<td colspan="1">Ordering Dept:</td><td colspan="1"><input type="text" name="t3"  readOnly value="<%=descorddeptcode %>"></td>
</tr>






             <tr>


<td colspan="2"> Login Department:<select name="s3" > 
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

<td colspan="2">Order Department:<select name="s4" > 
<%
ps=mk.con.prepareStatement("select dept,dept_sdesc from orbl_cd_dept_mst where station='"+stationcode+"' and to_number(dept)<90");
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



         </tr>

<tr><td colspan="4">
<input type="button" value="UPDATE"  name="B1" onclick="f1.status.value='1';f1.submit();">
<input type="button" value="DELETE"  name="B2" onclick="f1.status.value='2';f1.statuscontrol.value='0';f1.submit();">
<input type="button" value="BACK"  name="B3" onclick="window.close();window.open('LoginDeptOrdDeptMatrix.jsp');">

</td></tr>

</table>
</center>

<br>
<br>


<%


newdeptcode=request.getParameter("s3");
neworddeptcode=request.getParameter("s4");

if(!(newdeptcode.equals("ALL")))
{
%>
<script>

f1.s3.value='<%=newdeptcode %>';
f1.s4.value='<%=neworddeptcode %>';

</script>
<%
}

stationcode=request.getParameter("T5");

%>
<%
if(status1.equals("1"))
{
%>

<%
ps=mk.con.prepareStatement("select dept_sdesc from orbl_cd_dept_mst where dept='"+newdeptcode+"' and station='"+stationcode+"'");
rs=ps.executeQuery();
while(rs.next())
{
newdescdeptcode=rs.getString(1);
}
rs.close();
ps.close();


ps=mk.con.prepareStatement("select dept_sdesc from orbl_cd_dept_mst where dept='"+neworddeptcode+"' and station='"+stationcode+"'");
rs=ps.executeQuery();
while(rs.next())
{
newdescorddeptcode=rs.getString(1);
}
rs.close();
ps.close();


ps=mk.con.prepareStatement("update orbl_cd_dept  set login_dept='"+newdescdeptcode+"',order_dept='"+newdescorddeptcode+"',dept='"+neworddeptcode+"',upd_dt=TRUNC(SYSDATE),upd_by='"+sLoginEmpCd+"' where station='"+stationcode+"' and login_dept='"+descdeptcode+"' and order_dept='"+descorddeptcode+"'");


ps.executeUpdate();
mk.con.commit();
ps.close();
%>

<script>
alert('Data updated successfully');
</script>

<%
}


if(request.getParameter("status").equals("2"))
{

if(request.getParameter("statuscontrol").equals("0"))
{
%>
<script>
var r=confirm("Do you want to delete this record ?");
if(r==true)
{
f1.statuscontrol.value='1';
f1.status.value='2';
f1.submit();
}
else
{

f1.statuscontrol.value='2';
f1.submit();
}

</script>
<%
}


if(request.getParameter("statuscontrol").equals("1"))
{

ps=mk.con.prepareStatement("delete from orbl_cd_dept  where station='"+stationcode+"' and login_dept='"+descdeptcode+"' and order_dept='"+descorddeptcode+"'");

ps.executeUpdate();
mk.con.commit();
ps.close();
%>
<script>
alert('Data deleted successfully');

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




