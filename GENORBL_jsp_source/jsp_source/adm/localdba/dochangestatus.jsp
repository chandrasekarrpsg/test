
<CTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>changing order status</TITLE>
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
      <font face="Arial" size="6" color="#111111">CHANGING ORDER STATUS</font></b></span></P></TD>
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
int counter3=0;
String flagcounter3=new String("");
String counter1=new String("");
String orderno=new String("");
String orderdate=new String("");
String str2=new String("");
String jobdesc=new String("");

String strord=new String("");
String cancelmarker=new String("");
String status1=new String("");
String issuedby=new String("");
String statusorder1=new String("");
String stationstatus=new String("");


String status2=new String("");

String vendorname=new String("");




strord=request.getParameter("T6");
stationstatus=request.getParameter("T7");
stationstatus=sLoginStnCd;


statusorder1=request.getParameter("statusorder");

%>


<input type="hidden" name="status">
<input type="hidden" name="statusorder" value="0">

<script>
function allcheck()
{
f1.statusorder.value='2';
f1.submit();
}
</script>




<%
MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{
PreparedStatement ps=null;
PreparedStatement ps1=null;

ResultSet rs1=null;
ResultSet rs=null;

ps=mk.con.prepareStatement("SELECT order_no,to_char(order_date,'dd-Mon-rrrr'),nvl(cancel_by,' '),nvl(to_char(cancel_wef,'dd-Mon-rrrr'),' '),nvl(to_char(cancel_date,'dd-Mon-rrrr'),' '),nvl(cancel_reason,' '),nvl(job_desc,' '),nvl(order_status,' '),trim(emp_fname)||' '||trim(emp_lname),nvl(vendor_name,' ') FROM ORBL_ORD_DTL,ADM_EMP_MST  where order_by= emp_code(+)  and order_id='"+strord+"'");
rs=ps.executeQuery();
while(rs.next())
{
orderno=rs.getString(1);
orderdate=rs.getString(2);
vendorname=rs.getString(10);
jobdesc=rs.getString(7);
status1=rs.getString(8);
issuedby=rs.getString(9);


ps1=mk.con.prepareStatement("SELECT nvl(order_status_desc,'.') from orbl_cd_order_status where station='"+stationstatus+"' and order_status='"+status1+"'");
rs1=ps1.executeQuery();

while(rs1.next())
{
status2=rs1.getString(1);
}
rs1.close();
ps1.close();

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
<textarea name="txt4" rows="7" cols="75" readonly="true"><%=jobdesc %></textarea>
</TD>
</TR>


<TR>
<TD WIDTH="30%">
VENDOR NAME :
</TD>
<TD WIDTH="70%" align="left">
<input type="text" name="txt5" readonly="true" size="100" value="<%=vendorname %>">
</TD>
</TR>




<TR>
<TD WIDTH="30%">
ORDER STATUS:
</TD>
<TD WIDTH="70%">
<textarea  name="A1" rows="5" cols="75" readonly="true"><%=status2 %>
</textarea>

</TD>
</TR>

<TR>
<TD colspan="2" align="middle">
<INPUT TYPE="button" NAME="B1" VALUE="CHANGE ORDER STATUS" onclick="allcheck();">
<INPUT TYPE="button" NAME="B2" VALUE="BACK" onclick="window.close();window.open('doUpdOrdrStats.jsp');">

</TD>
</TR>
</TABLE>
</CENTER>



<%

ps=mk.con.prepareStatement("select count(*) from orbl_bill_dtl where order_id='"+strord+"' and nvl(bill_cancel,'N')='N'");
rs1=ps.executeQuery();
while(rs1.next())
{
flagcounter3=rs1.getString(1);
counter3=Integer.parseInt(flagcounter3);
}
rs1.close();
ps.close();
if(counter3>0)
{
if(request.getParameter("statusorder").equals("2"))
{
%>
<script>
alert('You cannot change the order status as bills against it have already been released');
</script>
<%
}
}
if(counter3==0)
{
if((stationstatus.equals("014"))||(stationstatus.equals("013"))               )
{
if(request.getParameter("statusorder").equals("2"))
{
%>
<script>
var r=confirm("If you change the order status, bill release against this order would be temporarily unavailable until the ALLOW BILL RELEASE button in Order Entry form is clicked again by the concerned user.Click OK to confirm change of order status,otherwise click CANCEL");
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
</script>
<%
}
if(request.getParameter("statusorder").equals("1"))
{
ps=mk.con.prepareStatement("UPDATE ORBL_ORD_DTL set order_status='3',upd_dt=trunc(sysdate),upd_by='"+sLoginEmpCd+"' where order_id='"+strord+"'");
x=ps.executeUpdate();
ps.close();
mk.con.commit();
%>

<script>
alert('Status of order no: <%=orderno %>  has been changed');
</script>


<%
}
}
if(stationstatus.equals("019"))
{
if(request.getParameter("statusorder").equals("2"))
{
%>
<script>
var r1=confirm("If you change the order status, taking print-out of this order and releasing bills against it would be temporarily unavailable until it is confirmed once again by level-3 user.Click OK to confirm change of order status,otherwise click CANCEL");

if(r1==true)
{
f1.statusorder.value='1';
f1.submit();
}
else
{
f1.statusorder.value='0';
f1.submit();
}
</script>

<%
}
if(request.getParameter("statusorder").equals("1"))
{
ps=mk.con.prepareStatement("UPDATE ORBL_ORD_DTL set order_status='2',upd_dt=trunc(sysdate),upd_by='"+sLoginEmpCd+"' where order_id='"+strord+"'");
x=ps.executeUpdate();
ps.close();
mk.con.commit();
%>

<script>
alert('Status of order no: <%=orderno %>  has been changed');
</script>
<%
}
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







