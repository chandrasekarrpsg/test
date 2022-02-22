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
function isPosInt(str){
  var pat="0123456789";
  var i=0;
   do{
    var flag = 0;
    for(var j=0;j<pat.length;j++){
      if(str.charAt(i)==pat.charAt(j)){
        flag = 1;
        break;
      }
      flag = 0;
    }
    i++;
  }while(flag==1 && i<str.length)
  if (flag == 1)
    return true;
  return false;
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

<br>
<br>



<input type="hidden" name="status">

<%
int x=0;
int counter=0;
int flag1=0;
int flag2=0;
int counter2=0;

String counter1=new String("");
String orderno=new String("");
String orderdate=new String("");
String str2=new String("");
String jobdesc=new String("");
String cancelby=new String("");
String canceldate=new String("");
String cancelwef=new String("");
String cancelreason=new String("");
String strord=new String("");
String cancelmarker=new String("");
String status1=new String("");
String issuedby=new String("");
String statusorder1=new String("");


String vch_ord_type=new String("");
String vnm_bill_frequency=new String("");
strord=request.getParameter("T6");



statusorder1=request.getParameter("statusorder");

%>


<input type="hidden" name="status">
<input type="hidden" name="statusorder">

<script>
function allcheck()
{
var marker=0;
if(marker==0)
{
if(f1.status.value !='Y')
{
alert('This is not a cancelled order');
marker=1;
}
}
if(marker==0)
{
var r=confirm("Do you want to revoke cancellation ?");
if(r==true)
{
f1.statusorder.value='1';
f1.submit();
}
else
{
f1.statusorder.value='0';
f1.submit();
}
}
}
</script>




<%
MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{
PreparedStatement ps=null;
ResultSet rs1=null;
ResultSet rs=null;

ps=mk.con.prepareStatement("SELECT order_no,to_char(order_date,'dd-Mon-rrrr'),nvl(cancel_by,' '),nvl(to_char(cancel_wef,'dd-Mon-rrrr'),' '),nvl(to_char(cancel_date,'dd-Mon-rrrr'),' '),nvl(cancel_reason,' '),nvl(job_desc,' '),nvl(cancel,'N'),trim(emp_fname)||' '||trim(emp_lname) FROM ORBL_ORD_DTL,ADM_EMP_MST  where order_by= emp_code(+)  and order_id='"+strord+"'");
rs=ps.executeQuery();
while(rs.next())
{
orderno=rs.getString(1);
orderdate=rs.getString(2);
cancelby=rs.getString(3);
cancelwef=rs.getString(4);
canceldate=rs.getString(5);
cancelreason=rs.getString(6);
jobdesc=rs.getString(7);
status1=rs.getString(8);
issuedby=rs.getString(9);


%>
<script>

f1.status.value='<%=status1 %>';

</script>
<%
}
rs.close();
ps.close();

%>
<CENTER>
<TABLE>
<TR>
<TD WIDTH="30%">
ORDER NUMBER :
</td>
<TD WIDTH="70%" align="left">
<input type="text" name="txt1"  readonly="true" size="100" value="<%=orderno %>">
</TD>
</TR>

<TR>
<TD WIDTH="30%">
ORDER DATE :
</td>
<TD WIDTH="70%" align="left">
<input type="text" name="txt2"  readonly="true" size="100" value="<%=orderdate %>">
</TD>
</TR>

<TR>
<TD WIDTH="30%">
ISSUED BY :
</td>
<TD WIDTH="70%" align="left">
<input type="text" name="txt3" readonly="true" size="100" value="<%=issuedby %>">
</TD>
</TR>

<TR>
<TD WIDTH="30%">
DESCRIPTION :
</td>
<TD WIDTH="70%" align="left">
<input type="text" name="txt4" readonly="true" size="100" value="<%=jobdesc %>">
</TD>
</TR>


<TR>
<TD WIDTH="30%">
CANCELLED BY :
</TD>
<TD WIDTH="70%" align="left">
<input type="text" name="txt5" readonly="true" size="100" value="<%=cancelby %>">
</TD>
</TR>

<TR>
<TD WIDTH="30%">
CANCELLED ON :
</TD>
<TD WIDTH="70%" align="left">
<input type="text" name="txt6" readonly="true" size="100" value="<%=canceldate %>">
</TD>
</TR>

<TR>
<TD WIDTH="30%">
CANCELLED W.E.F :
</TD>
<TD WIDTH="70%" align="left">
<input type="text" name="txt7" readonly="true" size="100" value="<%=cancelwef %>">
</TD>
</TR>



<TR>
<TD WIDTH="30%">
CANCELLATION REMARKS:
</TD>
<TD WIDTH="70%">
<textarea  name="A1" rows="3" cols="75" readonly="true"><%=cancelreason %>
</textarea>

</TD>
</TR>

<TR>
<TD colspan="2" align="middle">
<INPUT TYPE="button" NAME="B1" VALUE="REVOKE CANCELLATION" onclick="allcheck();">
<INPUT TYPE="button" NAME="B2" VALUE="BACK" onclick="window.close();window.open('doRvkCnclOrdr.jsp');">

</TD>
</TR>
</TABLE>
</CENTER>

<%

if(statusorder1.equals("1"))
{
ps=mk.con.prepareStatement("UPDATE ORBL_ORD_DTL set cancel='N',cancel_by=null,cancel_date=null,cancel_wef=null,cancel_reason=null,upd_dt=trunc(sysdate),upd_by='"+sLoginEmpCd+"' where order_id='"+strord+"'");
x=ps.executeUpdate();
ps.close();
mk.con.commit();
%>
<script>
alert('Cancellation of Order No: <%=orderno %>  has been revoked');
</script>

<%

ps=mk.con.prepareStatement("select order_type from orbl_ord_dtl where order_id='"+strord+"'");
rs1=ps.executeQuery();
while(rs1.next())
{
vch_ord_type=rs1.getString(1);
}
rs1.close();
ps.close();


if((vch_ord_type.equals("O"))||(vch_ord_type.equals("C")))
{
ps=mk.con.prepareStatement("UPDATE ORBL_ORD_DTL set bill_frequency_rev='1',upd_dt=trunc(sysdate),upd_by='"+sLoginEmpCd+"' where order_id='"+strord+"'");
x=ps.executeUpdate();
ps.close();
mk.con.commit();
}


if((vch_ord_type.equals("R"))||(vch_ord_type.equals("T")))
{

ps=mk.con.prepareStatement("select decode(bill_frequency,'M',round((tc_to-tc_from)/30,0),'B',round((tc_to-tc_from)/60,0),'Q',round((tc_to-tc_from)/90),'H',round((tc_to-tc_from)/180),'Y',round((tc_to-tc_from)/360)) from orbl_ord_dtl where order_id='"+strord+"'");
rs1=ps.executeQuery();
while(rs1.next())
{
vnm_bill_frequency=rs1.getString(1);
}
rs1.close();
ps.close();


ps=mk.con.prepareStatement("UPDATE ORBL_ORD_DTL set bill_frequency_rev='"+vnm_bill_frequency+"',upd_dt=trunc(sysdate),upd_by='"+sLoginEmpCd+"' where order_id='"+strord+"'");
x=ps.executeUpdate();
ps.close();
mk.con.commit();
}
}

%>

<%
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


