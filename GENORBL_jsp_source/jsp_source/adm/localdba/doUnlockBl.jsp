<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>UNLOCK BILLS</TITLE>
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

 
 
<body bgColor="#ece9d8" onload="f1.T1.focus();">
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


function allcheck()
{

var marker=0;

if(f1.T1.value=='')
{
alert('Field cannot be blank');
f1.T1.focus();
marker=1;
return false;

}

if(!(isPosInt(f1.T1.value)))
{
alert('Field should be numeric');
f1.T1.value='';
f1.T1.focus();
marker=1;
return false;
}

if(f1.T1.value.length !=8)
{
alert('Field should be of eight digits');
f1.T1.value='';
f1.T1.focus();
marker=1;
return false;
}
if(marker==0)
{
f1.action='doUnlockBl.jsp';
f1.submit();
return true;
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

<TABLE id=AutoNumber2 cellSpacing=1 cellPadding=2 width="100%" style="height: 405px">
  <TR>
    <TD width="56%" bgColor=#FFCB7D height=27>
      <P align=center><span style="background-color: #FFCB7D"><b>
      <font face="Arial" size="6" color="#111111">UNLOCK BILL(S)</font></b></span></P></TD>
    <TD width="10%" height=473 rowSpan=2>
      <TABLE id=AutoNumber3 cellSpacing=1 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">
            <DIV id=SVDIV>&nbsp;</DIV></TD>
        </TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%"><INPUT style="BORDER-RIGHT: #ffcb7d 5px ridge; PADDING-RIGHT: 4px; BORDER-TOP: #ffcb7d 5px ridge; PADDING-LEFT: 4px; FONT-WEIGHT: bold; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffcb7d 5px ridge; WIDTH: 80px; COLOR: #111111; PADDING-TOP: 1px; BORDER-BOTTOM: #ffcb7d 5px ridge; FONT-FAMILY: Arial; HEIGHT: 30px; BACKGROUND-COLOR: #ECE9D8" type=button value=BACK onclick="window.close();" name=B4></TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%"><INPUT style="BORDER-RIGHT: #ffcb7d 5px ridge; PADDING-RIGHT: 4px; BORDER-TOP: #ffcb7d 5px ridge; PADDING-LEFT: 4px; FONT-WEIGHT: bold; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffcb7d 5px ridge; WIDTH: 80px; COLOR: #111111; PADDING-TOP: 1px; BORDER-BOTTOM: #ffcb7d 5px ridge; FONT-FAMILY: Arial; HEIGHT: 30px; BACKGROUND-COLOR: #ECE9D8"  type="reset" value=RESET name=B5  onclick="f1.T1.value='';f1.T1.focus();"></TD></TR>
        

        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        



       <TR>
          <TD width="100%">
            <DIV id=MDDIV><INPUT style="BORDER-RIGHT: #ffcb7d 5px ridge; PADDING-RIGHT: 4px; BORDER-TOP: #ffcb7d 5px ridge; PADDING-LEFT: 4px; FONT-WEIGHT: bold; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffcb7d 5px ridge; WIDTH: 80px; COLOR: #111111; PADDING-TOP: 1px; BORDER-BOTTOM: #ffcb7d 5px ridge; FONT-FAMILY: Arial; HEIGHT: 30px; BACKGROUND-COLOR: #ECE9D8" type=button onclick="allcheck();" value=UNLOCK name=B4 id=B4> 
            </DIV></TD>
        </TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD>
          <INPUT type=hidden name=M0>
        </TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <TD width="48%" height=310>
      <TABLE id=AutoNumber5 style="BACKGROUND-COLOR: #d1cda7" height="329" 
      cellSpacing=1 cellPadding=2 width="100%" border=0>
        <TBODY>
         

        <TR>
          <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial color=#00006c><B>
			&nbsp;ENTER BILL REF ID TO UNLOCK</B></FONT></TD>
          <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" width="37%" height="27"><FONT color=#00006c><INPUT type="text"    style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: center" maxLength="8" size="10"  name="T1" ></FONT></TD>
          </TR>

        <TR>
          <TD colspan="2" style="BORDER-RIGHT: 0px solid; BORDER-TOP: 0px solid; BORDER-LEFT: 0px solid; BORDER-BOTTOM: 0px solid"  width="57%"  height="108"><FONT face=Arial color=#00006c><B>
			&nbsp;</B></FONT></TD>
 
          </TR>

 
 
          </TR></TBODY></TABLE></TD></TR></TABLE>
   <iframe name="I2" width="0" height="0">
          Your browser does not support inline frames or is currently configured not to display inline frames.  </iframe>
 


<input type="hidden" name="status">

<%
int x=0;
int counter=0;
int flag1=0;
int flag2=0;

String billid1=new String("");
String billid=new String("");
String billstatus=new String("");
String billdate=new String("");
String str=new String("");

String status1=new String("");
billid=request.getParameter("T1");
status1=request.getParameter("status");

%>


<%
if(billid !=null)
{
%>
<script>
f1.T1.value='<%=billid %>';
</script>
<%
MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{

PreparedStatement ps=null;

%>



<%
ps=mk.con.prepareStatement("select bill_ref_id,sts,nvl(to_char(finrcd_dt,'dd/mm/rrrr'),' ') from orbl_fin_rcd_dt  where station_cd='"+sLoginStnCd+"' and bill_ref_id='"+billid+"'");

ResultSet rs=ps.executeQuery();

while(rs.next())
{


billid1=rs.getString(1);
billstatus=rs.getString(2);
billdate=rs.getString(3);


counter=1;
}
rs.close();
ps.close();


if(counter==0)
{

%>
<script>
alert('This bill ref id does not belong to your station !!!');
f1.T1.value='';
f1.T1.focus();
</script>
<%

}

if(counter==1)
{
if(billstatus.equals("0"))
{
flag1=1;
%>
<script>
alert('The bill ref id is already in unlocked state !!!');
f1.T1.value='';
f1.T1.focus();

</script>
<%
}
}
if(counter==1 && flag1==0)
{
if(!(billdate.equals(" ")))
{
flag2=1;
%>
<script>
alert('This bill ref id cannot be unlocked as the bills against it has already been received at finance !!!');
f1.T1.value='';
f1.T1.focus();
</script>
<%
}
}

if((counter==1) && (flag1==0)  &&  (flag2==0))
{
if((!(status1.equals("1")))&&(!(status1.equals("0"))))
{
%>
<script>
var r=confirm("Do you want to unlock this record ?");
if(r==true)
{
f1.status.value='1';
f1.submit();
}
else
{

f1.status.value='0';
f1.submit();
}

</script>
<%
}

if(status1.equals("1"))
{

PreparedStatement ps1= mk.con.prepareStatement("update orbl_fin_rcd_dt   set sts='0',upd_by='"+sLoginEmpCd+"',upd_dt=sysdate where station_cd='"+sLoginStnCd+"' and bill_ref_id='"+billid+"'");


x=ps1.executeUpdate();
ps1.close();
mk.con.commit();

if(x>0)
{
%>

<script>
alert('The bill ref id '+<%=billid %>+' has been unlocked.');
f1.T1.value='';
f1.T1.focus();
</script>

<%
}
}
if(status1.equals("0"))
{
%>

<script>
f1.T1.value='';
f1.T1.focus();
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



<%
}

%>


</form>
</body>
</HTML>


