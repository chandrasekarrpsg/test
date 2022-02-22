<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<HTML><HEAD><TITLE>INCOMPLETE VENDOR EVALUATION</TITLE>
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

 
 
<body bgColor="#ece9d8" onload="document.getElementById('waiting').style.display='none';">
<form name="f1" method="post">

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
      <font face="Arial" size="6" color="#111111">LIST OF BILLS HAVING INCOMPLETE VENDOR EVALUATION RATINGS</font></b></span></P></TD>

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
String department=new String("");
String department1=new String("");
String releasedby=new String("");
String releasedby1=new String("");

int marker1=0;

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
PreparedStatement ps1=null;
ResultSet rs1=null;
%>


<TABLE >
<tr>
<td align="left">
<input type="button" value="BACK" name="B1"  onclick="window.close();" >
</td>
</tr>
</TABLE>

<div id="waiting" align="center" ><img src="wait.gif" alt="Please Wait" width="150" height="120"/></div> 


<%
str1="SELECT /*+ rule */ o.order_no,o.dept,trim(a.emp_fname)||' '||trim(a.emp_lname),b.bill_no,to_char(b.bill_date,'DD-Mon-RRRR'),nvl(b.bill_certified_by,' '),to_char(b.bill_release_date,'DD-Mon-RRRR'),b.bill_id,o.job_desc,b.remarks,nvl(o.vendor_name,' ') from orbl_bill_dtl b,orbl_ord_dtl o,adm_emp_mst a where o.order_by=a.emp_code(+) and(b.job_quality is null or b.job_quality=0)  and(b.timely_execution is null or  b.timely_execution=0) and(b.ehs_compliance is null or  b.ehs_compliance =0) and b.order_id=o.order_id and ((o.order_type in('O','C','L') and nvl(o.job_complete,'N')='N')or(o.order_type in('R','T'))) and b.station='"+sLoginStnCd+"' ORDER BY b.bill_date,b.bill_no";


ps=mk.con.prepareStatement(str1);
rs=ps.executeQuery();


while(rs.next())
{
department=rs.getString(2);

ps1=mk.con.prepareStatement("SELECT dept_sdesc from orbl_cd_dept_mst where dept='"+department+"' and station='"+sLoginStnCd+"'");
rs1=ps1.executeQuery();
while(rs1.next())
{
department1=rs1.getString(1);

}
rs1.close();
ps1.close();

releasedby=rs.getString(6);

ps1=mk.con.prepareStatement("SELECT trim(emp_fname)||' '||trim(emp_lname) from adm_emp_mst where emp_code='"+releasedby+"'");
rs1=ps1.executeQuery();
while(rs1.next())
{
releasedby1=rs1.getString(1);

}
rs1.close();
ps1.close();








if(counter==0)
{
%>
<CENTER>
<DIV style="height:450px; width:990px; overflow:scroll;">

<TABLE id=AutoNumber2 cellSpacing=1 cellPadding=2  style="width: 980px;">
  <TR>
    
    <TD width="19%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Order Number</font></b></TD>
    
    <TD width="6%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Dept.</font></b></TD>
    
    <TD width="17%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Issued By</font></b></TD>

    <TD width="15%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Number</font></b></TD>
  

    <TD width="12%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Date</font></b></TD>

    <TD width="14%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Released By</font></b></TD>

    <TD width="17%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Released On</font></b></TD>

 </TR>

<%
}
%>
  <TR>
    
    <TD width="19%">
<p title="<%=rs.getString(9) %>">
<%=rs.getString(1) %>
  
    </TD>
    <TD width="6%">
     <%=department1 %>
    </TD>
    <TD width="17%">
     <%=rs.getString(3) %>
    </TD>
    <TD width="15%">

  <a href="updationincomplete.jsp?T7=<%=rs.getString(8) %>&T4=<%=rs.getString(4) %>&T5=<%=rs.getString(5) %>&T6=<%=rs.getString(11) %>"><%=rs.getString(4) %></a>
    </TD>
    <TD width="12%">
     <%=rs.getString(5) %>
    </TD>
    <TD width="14%">
     <%=releasedby1 %>
    </TD>
    <TD width="17%">
     <%=rs.getString(7) %>
    </TD>



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
alert('NO RECORDS FOUND');

</script>
<%
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




