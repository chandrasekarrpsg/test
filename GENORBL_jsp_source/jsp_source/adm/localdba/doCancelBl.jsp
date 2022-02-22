<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> 
<HTML><HEAD><TITLE>CANCELLATION OF  BILL</TITLE>
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

function allcheck1()
{
var marker=0;
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
f1.submit();
}

}


function allcheck()
{
var marker=0;
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
if((f1.t1.value !='')&&(f1.t2.value !='')&&(f1.t3.value !='')&&(f1.t4.value !=''))
{
marker=1;
alert('PLEASE ENTER A DATE RANGE OR A BILL ID OR A BILL REF ID');
f1.t1.value='';
f1.t2.value='';
f1.t3.value='';
f1.t4.value='';
f1.t1.focus();
return false;
}
}

if(marker==0)
{
if((f1.t1.value !='')&&(f1.t2.value !='')&&(f1.t3.value !=''))
{
marker=1;
alert('PLEASE ENTER A DATE RANGE OR A BILL ID');
f1.t1.value='';
f1.t2.value='';
f1.t3.value='';
f1.t4.value='';
f1.t1.focus();
return false;
}
}

if(marker==0)
{
if((f1.t1.value !='')&&(f1.t2.value !='')&&(f1.t4.value !=''))
{
marker=1;
alert('PLEASE ENTER A DATE RANGE OR A BILL REF ID');
f1.t1.value='';
f1.t2.value='';
f1.t3.value='';
f1.t4.value='';
f1.t1.focus();
return false;
}
}








if(marker==0)
{
f1.submit();
}

}
</script>


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


function allcheck1()
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

            <img alt="" src="cesclogo1.png" style="position:absolute; left:855px; top:40px" width="120" height="59"/>

 </div>
</td>
</tr>


</table>
 



<TABLE id=AutoNumber1 cellSpacing=1 cellPadding=2 width="100%" style="height: 45px">
  <TR>
    <TD width="100%" bgColor=#FFCB7D >
      <P align=center><span style="background-color: #FFCB7D"><b>
      <font face="Arial" size="6" color="#111111">CANCELLATION OF BILL</font></b></span></P></TD>
    </TR>
</TABLE>    

<br>
<center>
<table>
            <tr>
                <td>From Bill Date :  &nbsp &nbsp </td><td><input type=text name="t1" onclick='scwShow(this,event);' />
                </td>
                 <td>
                   To Bill Date :  &nbsp &nbsp </td><td> <input type=text name="t2" onclick='scwShow(this,event);' />
                </td>
                <td><input type="button" name="B1"  value="SEARCH" onclick="allcheck();">
                <input type="reset" name="B3"  value="RESET" ></td>
               
            </tr> 

            <tr>
                <td>Bill Id :  &nbsp &nbsp </td><td><input type=text name="t3" > </td>

                <td >Cateogary :</td>
                <td >
                <select  name="S1">
                <option selected value="ALL">All bills</option>
                <option  value="S">Special bills</option>
                <option  value="N">Normal bills</option>
                </select> </td> 
                <td><input type="button" name="B2"  value="BACK" onclick="window.close();"></td>
            </tr>
            <tr>
                <td>Bill Ref Id :  &nbsp &nbsp </td><td><input type=text name="t4" > </td>
                 <td colspan="3">&nbsp;</td>
</table>
</center>

<br>
<br>
<input type="hidden" name="status">

<%
int x=0;
int counter=0;
int flag1=0;
int flag2=0;
int marker=0;
String billid1=new String("");
String billid=new String("");
String billstatus=new String("");
String billdate=new String("");
String str=new String("");
String cateogary=new String("");
String str6=new String("");
String str7=new String("");
String fromdt=new String("");
String todt=new String("");
String billrefid=new String("");

fromdt=request.getParameter("t1");
todt=request.getParameter("t2");
billid=request.getParameter("t3");
cateogary=request.getParameter("S1");
billrefid=request.getParameter("t4");

int counter6=0;
int counter7=0;
int counter8=0;



MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      mk.con.setAutoCommit(false);
  try{

PreparedStatement ps=null;
ResultSet rs=null;
if((fromdt !=null)&&(todt !=null))
{
if(cateogary.equals("ALL"))
{

ps=mk.con.prepareStatement("(SELECT 'S_'||BILLREF BILLNO,BILL_NO,TO_CHAR(BILL_DT,'DD-Mon-RRRR') billdate,ltrim(to_char(BILL_AMT,'9999999990.99')),nvl(TO_CHAR(FINANCE_RECVD_DATE,'DD-Mon-RRRR'),' '),billref orderid,bill_ref_id,BILL_DT,BILLREF FROM ORBL_SPBILL_DTL where bill_dt between to_date('"+fromdt+"','dd/mm/rrrr') and to_date('"+todt+"','dd/mm/rrrr') and NVL(bill_cancel,'N') !='Y' ) UNION  (SELECT 'N_'||BILL_ID  BILLNO,nvl(BILL_NO,' '),nvl(TO_CHAR(BILL_DATE,'DD-Mon-RRRR'),' ') billdate,ltrim(nvl(to_char(BILL_AMOUNT,'9999999990.99'),'0.00')),nvl(TO_CHAR(FINANCE_RECVD_DATE,'DD-Mon-RRRR'),' '),order_id orderid,bill_ref_id,BILL_DATE,BILL_ID FROM ORBL_BILL_DTL where bill_date between to_date('"+fromdt+"','dd/mm/rrrr')and to_date('"+todt+"','dd/mm/rrrr') and NVL(bill_cancel,'N') !='Y' ) order by 8 desc,9"); 

rs=ps.executeQuery();


}
if(cateogary.equals("S"))
{
ps=mk.con.prepareStatement("SELECT 'S_'||BILLREF BILLNO,BILL_NO,TO_CHAR(BILL_DT,'DD-Mon-RRRR'),ltrim(to_char(BILL_AMT,'9999999990.99')),nvl(TO_CHAR(FINANCE_RECVD_DATE,'DD-Mon-RRRR'),' '),'NA',bill_ref_id,bill_dt,billref FROM ORBL_SPBILL_DTL where bill_dt between to_date('"+fromdt+"','dd/mm/rrrr') and to_date('"+todt+"','dd/mm/rrrr') and NVL(bill_cancel,'N') !='Y' order by 8 desc,9");
rs=ps.executeQuery();
}
if(cateogary.equals("N"))
{
ps=mk.con.prepareStatement("SELECT 'N_'||BILL_ID  BILLNO,nvl(BILL_NO,' '),nvl(TO_CHAR(BILL_DATE,'DD-Mon-RRRR'),' '),ltrim(nvl(to_char(BILL_AMOUNT,'9999999990.99'),'0.00')),nvl(TO_CHAR(FINANCE_RECVD_DATE,'DD-Mon-RRRR'),' '),order_id,bill_ref_id,bill_date,bill_id FROM ORBL_BILL_DTL where bill_date between to_date('"+fromdt+"','dd/mm/rrrr')and to_date('"+todt+"','dd/mm/rrrr') and NVL(bill_cancel,'N') !='Y' order by 8 desc,9"); 
rs=ps.executeQuery();
}





while(rs.next())
{
if(counter==0)
{
%>
<CENTER>
<DIV style="height:250px; width:970px; overflow:scroll;">

<TABLE id=AutoNumber2 cellSpacing=1 cellPadding=2  style="width: 970px;">
  <TR>
    <TD width="15%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill id</font></b></TD>
    
    <TD width="30%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Number</font></b></TD>

    <TD width="15%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Date</font></b></TD>

    <TD width="15%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Amount(Rs.)</font></b></TD>

    <TD width="25%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Finance Received Date</font></b></TD>
  </TR>

<%
}
%>

  <TR>
    <TD width="15%">
<a href="doCancellation.jsp?T6=<%=rs.getString(6) %>&T1=<%=rs.getString(1) %>&T2=<%=rs.getString(2) %>&T3=<%=rs.getString(3) %>&T4=<%=rs.getString(4) %>&T5=<%=rs.getString(5) %>&T7=<%=rs.getString(7) %> "><%=rs.getString(1) %></a>
    </TD>
    <TD width="30%">
     <%=rs.getString(2) %>
    </TD>
    <TD width="15%">
     <%=rs.getString(3) %>
    </TD>
    <TD width="15%" align="right">
     <%=rs.getString(4) %>
    </TD>
    <TD width="25%">
     <%=rs.getString(5) %>
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
f1.S1.value='<%=cateogary %>';

</script>
<%
marker=1;
}

if(counter==0)
{
if(billid !=null)
{
if(cateogary.equals("ALL"))
{
ps=mk.con.prepareStatement("(SELECT 'S_'||BILLREF BILLNO,BILL_NO,TO_CHAR(BILL_DT,'DD-Mon-RRRR') billdate,ltrim(to_char(BILL_AMT,'9999999990.99')),nvl(TO_CHAR(FINANCE_RECVD_DATE,'DD-Mon-RRRR'),' '),billref orderid,bill_ref_id FROM ORBL_SPBILL_DTL where billref='"+billid+"'  and NVL(bill_cancel,'N') !='Y' ) UNION  (SELECT 'N_'||BILL_ID  BILLNO,nvl(BILL_NO,' '),nvl(TO_CHAR(BILL_DATE,'DD-Mon-RRRR'),' ') billdate,ltrim(nvl(to_char(BILL_AMOUNT,'9999999990.99'),'0.00')),nvl(TO_CHAR(FINANCE_RECVD_DATE,'DD-Mon-RRRR'),' '),order_id orderid,bill_ref_id FROM ORBL_BILL_DTL where bill_id='"+billid+"' and NVL(bill_cancel,'N') !='Y' ) "); 


rs=ps.executeQuery();


}
if(cateogary.equals("S"))
{
ps=mk.con.prepareStatement("SELECT 'S_'||BILLREF BILLNO,BILL_NO,TO_CHAR(BILL_DT,'DD-Mon-RRRR'),ltrim(to_char(BILL_AMT,'9999999990.99')),nvl(TO_CHAR(FINANCE_RECVD_DATE,'DD-Mon-RRRR'),' '),'NA',bill_ref_id FROM ORBL_SPBILL_DTL where billref='"+billid+"' and NVL(bill_cancel,'N') !='Y' order by bill_dt desc");
rs=ps.executeQuery();
}
if(cateogary.equals("N"))
{
ps=mk.con.prepareStatement("SELECT 'N_'||BILL_ID  BILLNO,nvl(BILL_NO,' '),nvl(TO_CHAR(BILL_DATE,'DD-Mon-RRRR'),' '),ltrim(nvl(to_char(BILL_AMOUNT,'9999999990.99'),'0.00')),nvl(TO_CHAR(FINANCE_RECVD_DATE,'DD-Mon-RRRR'),' '),order_id,bill_ref_id FROM ORBL_BILL_DTL where bill_id='"+billid+"' and NVL(bill_cancel,'N') !='Y' order by bill_date desc"); 
rs=ps.executeQuery();
}





while(rs.next())
{
if(counter==0)
{
%>
<CENTER>

<TABLE id=AutoNumber2 cellSpacing=1 cellPadding=2  style="height: 250px; width: 970px;">
  <TR>
    <TD width="15%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill id</font></b></TD>
    
    <TD width="30%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Number</font></b></TD>

    <TD width="15%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Date</font></b></TD>

    <TD width="15%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Amount(Rs.)</font></b></TD>

    <TD width="25%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Finance Received Date</font></b></TD>
  </TR>

<%
}
%>

  <TR>
    <TD width="15%">
<a href="doCancellation.jsp?T6=<%=rs.getString(6) %>&T1=<%=rs.getString(1) %>&T2=<%=rs.getString(2) %>&T3=<%=rs.getString(3) %>&T4=<%=rs.getString(4) %>&T5=<%=rs.getString(5) %>&T7=<%=rs.getString(7) %> "><%=rs.getString(1) %></a>
    </TD>
    <TD width="30%">
     <%=rs.getString(2) %>
    </TD>
    <TD width="15%">
     <%=rs.getString(3) %>
    </TD>
    <TD width="15%" align="right">
     <%=rs.getString(4) %>
    </TD>
    <TD width="25%">
     <%=rs.getString(5) %>
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
f1.t3.value='<%=billid %>';
f1.S1.value='<%=cateogary %>';

</script>
<%
}
}

if(counter==0)
{
if(billrefid !=null)
{
if(cateogary.equals("ALL"))
{
ps=mk.con.prepareStatement("(SELECT 'S_'||BILLREF BILLNO,BILL_NO,TO_CHAR(BILL_DT,'DD-Mon-RRRR') billdate,ltrim(to_char(BILL_AMT,'9999999990.99')),nvl(TO_CHAR(FINANCE_RECVD_DATE,'DD-Mon-RRRR'),' '),billref orderid,bill_ref_id,bill_dt,billref FROM ORBL_SPBILL_DTL where bill_ref_id='"+billrefid+"'  and NVL(bill_cancel,'N') !='Y' ) UNION  (SELECT 'N_'||BILL_ID  BILLNO,nvl(BILL_NO,' '),nvl(TO_CHAR(BILL_DATE,'DD-Mon-RRRR'),' ') billdate,ltrim(nvl(to_char(BILL_AMOUNT,'9999999990.99'),'0.00')),nvl(TO_CHAR(FINANCE_RECVD_DATE,'DD-Mon-RRRR'),' '),order_id orderid,bill_ref_id,bill_date,bill_id FROM ORBL_BILL_DTL where bill_ref_id='"+billrefid+"' and NVL(bill_cancel,'N') !='Y' ) order by 8 desc,9"); 


rs=ps.executeQuery();


}
if(cateogary.equals("S"))
{
ps=mk.con.prepareStatement("SELECT 'S_'||BILLREF BILLNO,BILL_NO,TO_CHAR(BILL_DT,'DD-Mon-RRRR'),ltrim(to_char(BILL_AMT,'9999999990.99')),nvl(TO_CHAR(FINANCE_RECVD_DATE,'DD-Mon-RRRR'),' '),'NA',bill_ref_id,bill_dt,billref FROM ORBL_SPBILL_DTL where bill_ref_id='"+billrefid+"' and NVL(bill_cancel,'N') !='Y' order by 8 desc,9");
rs=ps.executeQuery();
}
if(cateogary.equals("N"))
{
ps=mk.con.prepareStatement("SELECT 'N_'||BILL_ID  BILLNO,nvl(BILL_NO,' '),nvl(TO_CHAR(BILL_DATE,'DD-Mon-RRRR'),' '),ltrim(nvl(to_char(BILL_AMOUNT,'9999999990.99'),'0.00')),nvl(TO_CHAR(FINANCE_RECVD_DATE,'DD-Mon-RRRR'),' '),order_id,bill_ref_id,bill_date,bill_id FROM ORBL_BILL_DTL where bill_ref_id='"+billrefid+"' and NVL(bill_cancel,'N') !='Y' order by 8 desc,9"); 
rs=ps.executeQuery();
}





while(rs.next())
{
if(counter==0)
{
%>
<CENTER>
<DIV style="height:250px; width:970px; overflow:scroll;">
<TABLE id=AutoNumber2 cellSpacing=1 cellPadding=2  style="width: 970px;">
  <TR>
    <TD width="15%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill id</font></b></TD>
    
    <TD width="30%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Number</font></b></TD>

    <TD width="15%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Date</font></b></TD>

    <TD width="15%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Bill Amount(Rs.)</font></b></TD>

    <TD width="25%" bgColor="#FFCB7D" >
      <font face="Arial" size="4" color="#111111">Finance Received Date</font></b></TD>
  </TR>

<%
}
%>

  <TR>
    <TD width="15%">
<a href="doCancellation.jsp?T6=<%=rs.getString(6) %>&T1=<%=rs.getString(1) %>&T2=<%=rs.getString(2) %>&T3=<%=rs.getString(3) %>&T4=<%=rs.getString(4) %>&T5=<%=rs.getString(5) %>&T7=<%=rs.getString(7) %> "><%=rs.getString(1) %></a>
    </TD>
    <TD width="30%">
     <%=rs.getString(2) %>
    </TD>
    <TD width="15%">
     <%=rs.getString(3) %>
    </TD>
    <TD width="15%" align="right">
     <%=rs.getString(4) %>
    </TD>
    <TD width="25%">
     <%=rs.getString(5) %>
    </TD>

  </TR>
<%
counter=counter+1;
counter8=1;
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
f1.t4.value='<%=billrefid %>';
f1.S1.value='<%=cateogary %>';

</script>
<%
}
}
if(((fromdt !=null)&&(billid !=null))||(billrefid !=null)||(billid !=null))
{
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


