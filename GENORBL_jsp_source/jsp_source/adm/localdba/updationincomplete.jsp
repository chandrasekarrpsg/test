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

 
 
<body bgColor="#ece9d8" >
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
      <font face="Arial" size="6" color="#111111">UPDATING INCOMPLETE VENDOR EVALUATION RATINGS</font></b></span></P></TD>

    </TR>
</TABLE>    

<script>
function isPosInt(str){
  var pat="0123456789.";
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
var marker1=0;

if(marker1==0)
{
if(f1.t1.value !='')
{
if(!(isPosInt(f1.t1.value)))
{
marker1=1;
alert('Please enter integer values');
f1.t1.value='';
f1.t1.focus();
return false();
}
}
}

if(marker1==0)
{
if(f1.t2.value !='')
{
if(!(isPosInt(f1.t2.value)))
{
marker1=1;
alert('Please enter integer values');
f1.t2.value='';
f1.t2.focus();
return false();
}
}
}

if(marker1==0)
{
if(f1.t3.value !='')
{
if(!(isPosInt(f1.t3.value)))
{
marker1=1;
alert('Please enter integer values');
f1.t3.value='';
f1.t3.focus();
return false();
}
}
}


if(marker1==0)
{
f1.status.value='1';
f1.submit();
}

}

</script>



<input type="hidden" name="status" value="0">
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


String billnumber=new String("");
String billdate=new String("");
String billreleasedby=new String("");
String billid=new String("");


String jobquality=new String("");
String timelyexecution=new String("");
String ehscompliance=new String("");


billnumber=request.getParameter("T4");
billdate=request.getParameter("T5");
billreleasedby=request.getParameter("T6");
billid=request.getParameter("T7");


jobquality=request.getParameter("t1");
timelyexecution=request.getParameter("t2");
ehscompliance=request.getParameter("t3");


int jobquality1=0;
int timelyexecution1=0;
int ehscompliance1=0;




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





%>



<br>





<CENTER>
<TABLE id=AutoNumber2 cellSpacing=1 cellPadding=2  >
  <TR>
    <TD width="50%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Number</font></b></TD>
    <TD width="50%" >
      <%=billnumber %></TD>
 </TR>

  <TR>
    <TD width="50%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Date</font></b></TD>
    <TD width="50%" >
      <%=billdate %></TD>
 </TR>

  <TR>
    <TD width="50%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Vendor Name</font></b></TD>
    <TD width="50%" >
      <%=billreleasedby %></TD>
 </TR>

  <TR>
    <TD width="50%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Job Quality</font></b></TD>
    <TD width="50%" >
      <input type="text" name="t1" size="10"></TD>
 </TR>
  <TR>
    <TD width="50%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Timely Execution</font></b></TD>
    <TD width="50%" >
      <input type="text" name="t2" size="10"></TD>
 </TR>
  <TR>
    <TD width="50%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Ehs Compliance</font></b></TD>
    <TD width="50%" >
      <input type="text" name="t3" size="10"></TD>
 </TR>

  <TR>
    <TD colspan="2" align="middle">
      <input type="button"  name="B1" value="UPDATE" onclick="allcheck();" >
      <input type="button"  name="B2" value="BACK" onclick="window.close();" >
    </TD>
 </TR>


</TABLE>


</CENTER>
<%
if(request.getParameter("status").equals("1"))
{ 
str1="update orbl_bill_dtl set job_quality='"+jobquality+"',timely_execution='"+timelyexecution+"',ehs_compliance='"+ehscompliance+"',upd_dt=trunc(sysdate),upd_by='"+sLoginEmpCd+"' where bill_id='"+billid+"'";


ps=mk.con.prepareStatement(str1);


ps.executeUpdate();
mk.con.commit();
%>
<script>
f1.t1.value='<%=jobquality %>';
f1.t2.value='<%=timelyexecution %>';
f1.t3.value='<%=ehscompliance %>';


alert('Data updated successfully');
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




