<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>CANCELLATION OF  BILL</TITLE>
<META http-equiv=Content-Type content="text/html; charset=iso-8859-1">
<META http-equiv=Content-Language content=en-us>
 
 
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
                <td colspan="2" height="95px" bgcolor="#8080c0" align="center">

                    <div id="header" style="height: 100px">

        <div id="logo" style="height: 100px">
<h3 style="height: 97px"  ><font size="20px" face="Arial" color="white" ><label style="position:absolute;left:250px;top:40px;"> GENERATION DIVISION</label></font></h3>


</div>

            <img alt="" src="cesclogo1.png" style="position:absolute; left:855px; top:40px" width="120" height="59"/>

 </div>

</table>
 



<TABLE id=AutoNumber1 cellSpacing=1 cellPadding=2 width="100%" style="height: 40px">
  <TR>
    <TD width="100%" bgColor=#FFCB7D >
      <P align=center><span style="background-color: #FFCB7D"><b>
      <font face="Arial" size="6" color="#111111">CANCELLATION OF BILL</font></b></span></P></TD>
    </TR>
</TABLE>    




<input type="hidden" name="status">

<%
int x=0;
int counter=0;
int flag1=0;
int flag2=0;
int counter2=0;

String counter1=new String("");

String billid1=new String("");
String billid=new String("");
String billstatus=new String("");
String billdate=new String("");
String str=request.getParameter("T1");
String str1=request.getParameter("T2");
String str2=request.getParameter("T3");
String str3=request.getParameter("T4");
String str9=str.substring(0,1);

String str4=request.getParameter("T5");
if(str4.equals(" "))
{
str4=" ";
}
String strord=new String("");
String actstr=new String("");
String str6=new String("");
String query=new String("");
if(str9.equals("N"))
{
strord=request.getParameter("T6");
}
else
{
strord="NA";
}

str6=request.getParameter("T7");

if(request.getParameter("T7").equals("null"))
{
str6="N";
}
else
{
str6=str6;
}

String jobdesc=new String("");

String orderno=new String("");
String orderdate=new String("");
String remark=new String("");
%>

<input type="hidden" name="finrecvddt">

<input type="hidden" name="billrefid">

<input type="hidden" name="orders">

<script>
f1.finrecvddt.value='<%=str4 %>';
f1.billrefid.value='<%=str6 %>';
f1.orders.value='<%=strord %>';
</script>

<%
remark=request.getParameter("A1");
if(remark !=null)
{
%>
<script>
f1.finrecvddt.value='<%=str4 %>';
f1.billrefid.value='<%=str6 %>';
f1.orders.value='<%=strord %>';
</script>
<%
str=request.getParameter("txt1");
str1=request.getParameter("txt2");
str2=request.getParameter("txt3");
str3=request.getParameter("txt4");
str4=request.getParameter("txt5");
str6=request.getParameter("billrefid");
%>

<%
if(!(strord.equals("NA")))
{
orderno=request.getParameter("txt6");
orderdate=request.getParameter("txt7");
jobdesc=request.getParameter("A2");
}
remark=request.getParameter("A1");

}
%>
<script>

function allcheck()
{
var marker=0;


if(f1.finrecvddt.value !=' ')
{
marker=1;
alert('This bill has already been sent to finance.You cannot cancel it anymore.');
return false;
}

if(marker==0)
{
if((f1.finrecvddt.value ==' ')&&(f1.billrefid.value !='N')) 
{
marker=1;
alert('To cancel this bill exclude it from the Finance module ( Lot No : '+'<%=str6 %>'+' )');
return false;
}
}

if(marker==0)
{
f1.A1.disabled=false;
f1.B3.disabled=false;
f1.A1.focus();

f1.B1.disabled=true;
return true;
}
}


function allcheck2()
{
var marker=0;
if(f1.A1.value =='') 
{
marker=1;
f1.A1.focus();
alert('Please enter a reason for cancellation');
return false;
}
if(marker==0)
{
f1.submit();
}
}
</script>

<%
MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{
PreparedStatement ps=null;
ResultSet rs1=null;
if(!(strord.equals("NA")))
{
ps=mk.con.prepareStatement("SELECT nvl(job_desc,' '),order_no,to_char(order_date,'dd-Mon-rrrr') FROM ORBL_ORD_DTL where order_id='"+strord+"'");
ResultSet rs=ps.executeQuery();
while(rs.next())
{
jobdesc=rs.getString(1);
orderno=rs.getString(2);
orderdate=rs.getString(3);
}
rs.close();
ps.close();

}
%>
<CENTER>
<TABLE>
<TR>
<TD WIDTH="30%">
BILL ID :
</td>
<TD WIDTH="70%" align="left">
<input type="text" name="txt1"  readonly="true" size="100" value="<%=str %>">
</TD>
</TR>

<TR>
<TD WIDTH="30%">
BILL NUMBER :
</td>
<TD WIDTH="70%" align="left">
<input type="text" name="txt2"  readonly="true" size="100" value="<%=str1 %>">
</TD>
</TR>

<TR>
<TD WIDTH="30%">
BILL DATE :
</td>
<TD WIDTH="70%" align="left">
<input type="text" name="txt3" readonly="true" size="100" value="<%=str2 %>">
</TD>
</TR>

<TR>
<TD WIDTH="30%">
BILL AMOUNT (Rs.) :
</td>
<TD WIDTH="70%" align="left">
<input type="text" name="txt4" readonly="true" size="100" value="<%=str3 %>">
</TD>
</TR>


<TR>
<TD WIDTH="30%">
FINANCE RECEIVED DATE :
</TD>
<TD WIDTH="70%" align="left">
<input type="text" name="txt5" readonly="true" size="100" value="<%=str4 %>">
</TD>
</TR>




<%
if(!(strord.equals("NA")))
{
%>
<TR>
<TD WIDTH="30%">
ORDER NO :
</TD>
<TD WIDTH="70%" align="left">
<input type="text" name="txt6" readonly="true" size="100" value="<%=orderno %>">
</TD>
</TR>
<TR>
<TD WIDTH="30%">
ORDER DATE :
</TD>
<TD WIDTH="70%" align="left">
<input type="text" name="txt7" readonly="true" size="100" value="<%=orderdate %>">
</TD>
</TR>
<TR>
<TD WIDTH="30%">
JOB DESCRIPTION :
</TD>
<TD WIDTH="70%">
<textarea  name="A2" readonly="true" rows="8" cols="75" >
<%=jobdesc %>
</textarea>
</TD>
</TR>




<%
}
%>

<TR>
<TD WIDTH="30%">
REASON FOR CANCELLATION :
</TD>
<TD WIDTH="70%">
<textarea  name="A1" rows="3" cols="75" disabled="true">
</textarea>

</TD>
</TR>

<TR>
<TD colspan="2" align="middle">
<INPUT TYPE="button" NAME="B1" VALUE="CANCEL THIS BILL" onclick="allcheck();">
<INPUT TYPE="button" NAME="B3" VALUE="SAVE"  disabled="true" onclick="allcheck2();">

<INPUT TYPE="button" NAME="B2" VALUE="BACK" onclick="window.close();window.open('doCancelBl.jsp');">

</TD>
</TR>
</TABLE>
</CENTER>
<%
remark=request.getParameter("A1");
%>

<%
if(remark !=null)
{

actstr=str.substring(2,10);
if(!(strord.equals("NA")))
{

ps=mk.con.prepareStatement("UPDATE ORBL_BILL_DTL set bill_cancel_remarks='"+remark+"',bill_cancel='Y',bill_cancel_by='"+sLoginEmpCd+"',bill_cancel_date=trunc(sysdate),upd_dt=trunc(sysdate),upd_by='"+sLoginEmpCd+"' where bill_id='"+actstr+"'");
x=ps.executeUpdate();
ps.close();
mk.con.commit();
%>
<SCRIPT>
f1.txt1.value='<%=str %>';
f1.txt2.value='<%=str1 %>';
f1.txt3.value='<%=str2 %>';
f1.txt4.value='<%=str3 %>';
f1.txt5.value='<%=str4 %>';
f1.orders.value='<%=strord %>';
f1.billrefid.value='<%=str6 %>';
f1.A1.disabled=false;
f1.B1.disabled=true;

f1.A1.value='<%=remark %>';
</script>


<%

ps=mk.con.prepareStatement("select count(*) from orbl_bill_dtl where order_id='"+strord+"' and nvl(bill_cancel,'N')='N'");
rs1=ps.executeQuery();
while(rs1.next())
{
counter1=rs1.getString(1);
counter2=Integer.parseInt(counter1);
}
rs1.close();
ps.close();

if(counter2==0)
{
ps=mk.con.prepareStatement("UPDATE ORBL_ORD_DTL set order_status='4',upd_dt=trunc(sysdate),upd_by='"+sLoginEmpCd+"' where order_id='"+strord+"' and ((station='016')or(station='042')or(station='002'))");
x=ps.executeUpdate();
ps.close();
mk.con.commit();
}
%>
<SCRIPT>
alert('THIS BILL HAS BEEN CANCELLED  SUCCESSFULLY');
</SCRIPT>
<%
}
else
{

ps=mk.con.prepareStatement("UPDATE ORBL_SPBILL_DTL set bill_cancel_remarks='"+remark+"',bill_cancel='Y',bill_cancel_by='"+sLoginEmpCd+"',bill_cancel_date=trunc(sysdate),upd_dt=trunc(sysdate),upd_by='"+sLoginEmpCd+"' where billref='"+actstr+"'");
x=ps.executeUpdate();
ps.close();
mk.con.commit();
%>

<script>
f1.txt1.value='<%=str %>';
f1.txt2.value='<%=str1 %>';
f1.txt3.value='<%=str2 %>';
f1.txt4.value='<%=str3 %>';
f1.txt5.value='<%=str4 %>';
f1.orders.value='<%=strord %>';
f1.billrefid.value='<%=str6 %>';
f1.A1.value='<%=remark %>';
alert('THIS BILL HAS BEEN CANCELLED  SUCCESSFULLY');
</script>

<%
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


