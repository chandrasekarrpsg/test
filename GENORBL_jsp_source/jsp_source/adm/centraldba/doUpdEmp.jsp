<%@ page language="java" import="java.sql.*,oracle.jdbc.driver.*,java.util.*,java.text.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,genOrblJavaPackage.*,javax.swing.*,java.io.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                if(!sLoginStnCd.equals("019")){
                    if(Integer.parseInt(sLoginEmpLvl) > 2)sLoginEmpLvl = "2";
                }
      java.util.Date date=new java.util.Date();
     // SimpleDateFormat sdf=new SimpleDateFormat("dd"+"/"+"MM"+"/"+"yyyy");
      SimpleDateFormat sdf=new SimpleDateFormat("dd"+"-"+"MMM"+"-"+"yyyy");
      String toDate=sdf.format(date);

      SimpleDateFormat sdf1=new SimpleDateFormat("yyyyMMdd");
      String sysDate=sdf1.format(date);
      System.out.println(" DDDDD   "+toDate);

      MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      try{

    %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE></TITLE>
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
.style1 {
				border-style: solid;
				border-width: 1px;
				background-color: #FFCB7D;
}
.style2 {
				border-width: 0;
				background-color: #FFCB7D;
}
.style3 {
				font-weight: bold;
				border-width: 0;
}
.style4 {
				border: 1px solid #FFCB7D;
				background-color: #FFCB7D;
}
.style5 {
				border-color: #FFCB7D;
				border-width: 0;
				background-color: #FFCB7D;
}
.newStyle1 {
				padding-left: 50px;
}
.newStyle2 {
				text-transform: capitalize;
}
</STYLE>

<SCRIPT type="text/javascript" src="calender_adm.js"></SCRIPT>
<SCRIPT type="text/javascript" src="admnvaldn.js"></SCRIPT>
<link rel="stylesheet" type="text/css" href="calender.css"/>
        <script type="text/javascript" src="slideshowfade.js"></script>

        <link href="styles.css" rel="stylesheet" type="text/css" />

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

        </style>
        <script type="text/javascript">
            var headArr = new Array();
            var descArr = new Array();
            var desc1Arr = new Array();
            var urlArr = new Array();


            function shoheading(n)
            {
                //document.getElementById("hd1").innerHTML=headArr[n];
                //document.getElementById("abouthd").innerHTML=descArr[n];
                //document.getElementById("desc1").innerHTML=desc1Arr[n];
                window.open(urlArr[n],'I1');

            }


        </script>

<SCRIPT>


var ins_edt_flg="";
var prev_pwd="";

var url = "get_doUpdEmp_dtl.jsp";
var http = getHTTPObject();

   var selct_flg=0;

   var total=0,count=0,incre=0,rec_cnt=0;

   var row = new Array();
   var row_inf = new Array();
  
   function ROW()
    {
      this.column = new Array();
    }

   function ROW_INF()
    {
      this.column_inf = new Array();
    }

 function glblvalidation()
    {
    }

/*function set_dfltpwd()
    {
        if( document.getElementById("Checkbox1").checked==true)
         {
          document.getElementById("T13").value='cesc123';
         }
        else
         {
          document.getElementById("T13").value=prev_pwd;
         }
    }     */

function updtother()
     {
       window.open('doUpdEmp_local.jsp','_self');
     }

function rset()
    {
                    //   document.getElementById("dfltpwd").style.visibility='hidden';
                       document.getElementById("T1").value="SELECT";
                       document.getElementById("T2").value="";
                       document.getElementById("T3").value="SELECT";
                       document.getElementById("T4").value="";
                       document.getElementById("T5").value="";
                       document.getElementById("T6").value="";
                       document.getElementById("T7").value="";
                       document.getElementById("T8").value="";
                       document.getElementById("T10").value="";
                       document.getElementById("T11").value="";
                       document.getElementById("T12").value="";
                       document.getElementById("T13").value='cesc123';
                       document.getElementById("T14").value="";
                       document.getElementById("T15").value="";
                       document.getElementById("T16").value="";
                       document.getElementById("T9").value="";
                       prev_pwd="";

    }


function getinfo()
{
    var empcdval = document.getElementById("T9").value;
    if(!isPosInt(empcdval)){
     alert('Field must be numeric');
     document.getElementById("T9").focus();
     document.getElementById("T9").select();
     return false;
     }

                  //     document.getElementById("dfltpwd").style.visibility='hidden';
                       document.getElementById("T1").value="SELECT";
                       document.getElementById("T2").value="";
                       document.getElementById("T3").value="SELECT";
                       document.getElementById("T4").value="";
                       document.getElementById("T5").value="";
                       document.getElementById("T6").value="";
                       document.getElementById("T7").value="";
                       document.getElementById("T8").value="";
                       document.getElementById("T10").value="";
                       document.getElementById("T11").value="";
                       document.getElementById("T12").value="";
                       document.getElementById("T13").value='cesc123';
                       document.getElementById("T14").value="";
                       document.getElementById("T15").value="";
                       document.getElementById("T16").value="";
                       prev_pwd="";

    if(empcdval.length==6)
     {
var params = "empcd="+empcdval;
http.open("POST", url, true);
http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http.onreadystatechange = function()
   {
  //   alert(consnumval);
        if(http.readyState == 4 && http.status == 200)
        {
              results = http.responseText.split("~");
             
                if(''+results[1]+''!='undefined')
                  {
                    var flg=confirm("EMPLOYEE CODE ALREADY EXISTS.\nARE YOU SURE TO MODIFY THIS RECORD");
                     if(flg==true)
                      {
                       document.getElementById("T1").value=results[0];
                       document.getElementById("T2").value=results[2];
                       document.getElementById("T3").value=results[4];
                       document.getElementById("T4").value=results[6];
                       document.getElementById("T5").value=results[8];
                       document.getElementById("T6").value=results[10];
                       document.getElementById("T7").value=results[12];
                       document.getElementById("T8").value=results[14];
                       document.getElementById("T9").value=results[1];
                       document.getElementById("T10").value=results[3];
                       document.getElementById("T11").value=results[5];
                       document.getElementById("T12").value=results[7];
                       document.getElementById("T13").value=results[9];
                       document.getElementById("T14").value=results[11];
                       document.getElementById("T15").value=results[13];
                       document.getElementById("T16").value=results[15];
                       prev_pwd=results[9];
                       ins_edt_flg='U';
                 //      document.getElementById("dfltpwd").style.visibility='visible';
                      }
                     else
                      {
                       document.getElementById("T1").value="";
                       document.getElementById("T2").value="";
                       document.getElementById("T3").value="";
                       document.getElementById("T4").value="";
                       document.getElementById("T5").value="";
                       document.getElementById("T6").value="";
                       document.getElementById("T7").value="";
                       document.getElementById("T8").value="";
                       document.getElementById("T9").value="";
                       document.getElementById("T10").value="";
                       document.getElementById("T11").value="";
                       document.getElementById("T12").value="";
                       document.getElementById("T13").value="";
                       document.getElementById("T14").value="";
                       document.getElementById("T15").value="";
                       document.getElementById("T16").value="";
                       ins_edt_flg='';
              //         document.getElementById("dfltpwd").style.visibility='hidden';
                      }
                  }
                else
                  {
             //         document.getElementById("dfltpwd").style.visibility='hidden';
                   var flg=confirm("NEW EMPLOYEE CODE.\nARE YOU SURE TO INSERT THIS RECORD");
                     if(flg==true)
                      {
                       document.getElementById("T7").value='<%= sLoginEmpCd %>';
                       document.getElementById("T13").value='cesc123';
                       document.getElementById("T15").value='<%= toDate %>';
                       ins_edt_flg='I';
                      }
                     else
                      {
                       document.getElementById("T2").value='';
                       ins_edt_flg='';
                      }
                  }
        }
  }
http.send(params);
     }
}



function getHTTPObject() {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}

function set_emp_lvl()
    {
    var desg_val = document.getElementById("T3").value+'';

    if(desg_val>='1250')
    document.getElementById("T11").value = 1;
    if(desg_val=='1200')
    document.getElementById("T11").value = 2;
    if(desg_val>='1100' && desg_val<='1120')
    document.getElementById("T11").value = 3;
    if(desg_val=='1050')
    document.getElementById("T11").value = 4;
    if(desg_val=='1000')
    document.getElementById("T11").value = 5;
    if(desg_val=='0500')
    document.getElementById("T11").value = 6;
    if(desg_val=='SELECT')
    document.getElementById("T11").value = '';
    
    if(desg_val=='0500'||desg_val=='1000')
    document.getElementById("T6").disabled=false;
    else
    {
    document.getElementById("T6").value = '';
    document.getElementById("T6").disabled=true;
    }
    }

function sv_actn()
    {
           if(validations())
            {
            document.MDF.IE.value=ins_edt_flg;
            document.MDF.M1.value=document.getElementById("T1").value;
            document.MDF.M2.value=document.getElementById("T2").value;
            document.MDF.M3.value=document.getElementById("T3").value;
            document.MDF.M4.value=document.getElementById("T4").value;
            document.MDF.M5.value=document.getElementById("T5").value;
            document.MDF.M6.value=document.getElementById("T6").value;
            document.MDF.M7.value=document.getElementById("T7").value;
            document.MDF.M8.value=document.getElementById("T8").value;
            document.MDF.M9.value=document.getElementById("T9").value;
            document.MDF.M10.value=document.getElementById("T10").value;
            document.MDF.M11.value=document.getElementById("T11").value;
            document.MDF.M12.value=document.getElementById("T12").value;
            document.MDF.M13.value=document.getElementById("T13").value;
            document.MDF.M14.value=document.getElementById("T14").value;
            document.MDF.M15.value=document.getElementById("T15").value;
            document.MDF.M16.value=document.getElementById("T16").value;
            document.MDF.submit();
            }
    }

function mdfy_actn()
    {
          if(selct_flg==0)
           {
            alert("You can modify or delete an existing record"); 
           }
          else
           {
           if(validations())
            {
            document.MDF.M0.value=document.F2.T1.value;
            document.MDF.M1.value=document.F2.T2.value;
            document.MDF.M2.value=document.F2.T3.value;
            document.MDF.M3.value=document.F2.T4.value;
          var flg=confirm("ARE YOU SURE TO MODIFY THIS RECORD");
          if(flg==true)
            document.MDF.submit();

            }
           }
    }

function del_actn()
    {
          if(selct_flg==0)
           {
            alert("You can modify or delete an existing record"); 
           }
          else
           {
           if(validations())
            {
            document.DEL.M0.value=document.F2.T1.value;
            document.DEL.M1.value=document.F2.T2.value;
            document.DEL.M2.value=document.F2.T3.value;
            document.DEL.M3.value=document.F2.T4.value;
          var flg=confirm("ARE YOU SURE TO DELETE THIS RECORD");
          if(flg==true)
            document.DEL.submit();

            }
           }
    }

function ini()
   {
    document.getElementById("T9").focus();
    document.getElementById("T6").disabled=true;
    document.getElementById("T13").disabled=true;
    document.getElementById("T7").disabled=true;
    document.getElementById("T8").disabled=true;
    document.getElementById("T15").disabled=true;
    document.getElementById("T16").disabled=true;
   }

function save()
   {
        ini();

    }

function edit()
    {
        ini();
    }
function validations()
   {

    if(document.getElementById("T1").value=='SELECT'){
    alert('Please select a value in the field');
    document.getElementById("T1").value='SELECT';
    document.getElementById("T1").focus();
    return false;
      }
    if(!isPosInt(document.getElementById("T9").value)){
     alert('Field must be numeric');
     document.getElementById("T9").focus();
     document.getElementById("T9").select();
     return false;
     }
    if(!isNull(document.getElementById("T9").value)){
    alert('Please enter a value in the field');
    document.getElementById("T9").value='';
    document.getElementById("T9").focus();
    return false;
      }
    if(!isNull(document.getElementById("T2").value)){
    alert('Please enter a value in the field');
    document.getElementById("T2").value='';
    document.getElementById("T2").focus();
    return false;
      }
    if(!isNull(document.getElementById("T10").value)){
    alert('Please enter a value in the field');
    document.getElementById("T10").value='';
    document.getElementById("T10").focus();
    return false;
      }
    if(document.getElementById("T3").value=='SELECT'){
    alert('Please select a value in the field');
    document.getElementById("T3").value='SELECT';
    document.getElementById("T3").focus();
    return false;
      }
    if(!isNull(document.getElementById("T11").value)){
    alert('Please enter a value in the field');
    document.getElementById("T11").value='';
    document.getElementById("T11").focus();
    return false;
      }
    if(!isPosInt(document.getElementById("T11").value)){
     alert('Field must be numeric');
     document.getElementById("T11").focus();
     document.getElementById("T11").select();
     return false;
     }
    if(isFutureDate(document.getElementById("T4").value))
     {
     return false;
     }
    if(isFutureDate(document.getElementById("T12").value))
     {
     return false;
     }
    if(isFutureDate(document.getElementById("T5").value))
     {
     return false;
     }

    return true;
   }


function isFutureDate(str){
        var sysdate = '<%= sysDate %>'; 
        var mnths =  new Array("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC");
        var MM=0;  
        var curmnth=str.substring(3,6); 

        for(i=0;i<12;i++)
        {
           if(mnths[i]==curmnth)
            {
              MM=i+1;
              break; 
            }
        }

        if(MM<10)
        MM='0'+MM;
        var mydateinYYYYMMDD = str.substring(7,11)+MM+str.substring(0,2);
        var d1 = parseInt(mydateinYYYYMMDD,10);

        var flag=true;
        if (d1 > sysdate)
        {
           alert("Date can not be a future date");
           flag = false;
        }

        if(flag == false)
        {
           return true;
        }
        else
        {
           return false;
        }    
}

</SCRIPT>

</HEAD>

<BODY bgColor=#ece9d8 onload='ini();' >

<script type="text/javascript">

            var imgArray = new Array();
            imgArray[0] = "k1118050.jpg";
            imgArray[1] = "k1451470.jpg";
            imgArray[2] = "k4777200.jpg";
            imgArray[3] = "k7067130.jpg";


            slideshowFade('Slideshow1','',imgArray,20,5000);

        </script>


        <div id="main">
            <!-- header begins -->
            <div id="header" style="height: 115px">
                <div id="logo" style="height: 115px">
                    <h2 style="height: 115px" class="style3">GENERATION DIVISION</h2>
                </div>

            </div>
            <h4 style="height: 200px" style="position:absolute; left:200px; top:90px"><i><%= sLoginStnShrtNm+"/"+sLoginDeptShrtNm+"/"+sLoginEmpNm+"("+sLoginEmpCd+")" %></i></h4>
            <img alt="" src="cesclogo1.png" style="position:absolute; left:855px; top:40px" width="120" height="59"/>
        </div>

<TABLE id=AutoNumber2 cellSpacing=1 cellPadding=2 width="100%" style="height: 434px" class="style1">
  <TBODY>
  <TR>
    <TD width="50%" bgColor=#ffcb7d height=473 rowSpan=3>
      <P align=center style="height: 28px"><span style="background-color: #FFCB7D; width: 500px; height: 80px;"><b>
      <font face="Arial" size="5" color="#111111">EMPLOYEE MASTER INSERT/UPDATE</font></b></span></P>
      <table style="width: 99%; height: 332px" class="style4">
					<tr>
	<td class="style5">
      <TABLE id=AutoNumber6 style="BACKGROUND-COLOR: #d1cda7" height="329" 
      cellSpacing=1 cellPadding=2 width="100%" border=1>
        <TBODY>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>EMPLOYEE CODE</B></FONT></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="27"  colspan="2"><FONT color=#00006c class="newStyle1">
			<INPUT id=T9 
            onkeyup="getinfo();"  
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center; height: 25px;" 
            maxLength=6 size=8 name="T9" value="" ></FONT></TD>


          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>FIRST NAME</B></FONT></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="27"><FONT color=#00006c  class="newStyle1">
			<INPUT id=T2 
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" 
            maxLength=25 size=30 name="T2" class="newStyle2" ></FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>DESIGNATION</B></FONT></TD>
<%
       PreparedStatement PS0= mk.con.prepareStatement( " select DESG_CODE, DESG_DESC from ADM_DESG_MST order by 1 ");
       ResultSet rs0=PS0.executeQuery();
%>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
<select size="1" name="T3" style="width: 330px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="set_emp_lvl();" >
<option value="SELECT">----------SELECT-----------</option>
<%
    while(rs0.next())
           {
%>
          <option value="<%= rs0.getString(1) %>"><%= rs0.getString(2) %></option>
<%
           }
           rs0.close();
           PS0.close();
%>
          </select>
            </FONT></TD>
          <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>JOINING DATE</B></FONT></TD>
          <form name='f1'>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="27"><FONT color=#00006c class="newStyle1">
          <INPUT id=T4 readonly
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" 
            maxLength=10 size=10 name="T4" value="" onClick="toggleCalendar('T4');" ></FONT></TD></form>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">RESIGNATION DATE</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
          <INPUT id=T5 readonly
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" 
            maxLength=7 size=10 name="T5" value="" onClick="toggleCalendar('T5');"></FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">VIP IP</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
          <INPUT id=T6 
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" 
            maxLength=25  size=30 name="T6" value="" ></FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">DATA ENTERED BY</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
          <INPUT id=T7 
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" 
            maxLength=7 size=10 name="T7" value="" ></FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="31"><b><font face="Arial" size="1" color="#00006C">
			LAST UPDATED BY</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="31"><FONT color=#00006c class="newStyle1">
          <INPUT id=T8 
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" 
            maxLength=7 size=10 name="T8" value="" onClick="toggleCalendar('T8');"></FONT></TD>
          </TR>
        </TBODY></TABLE></td>
					</tr>
		</table>
	</TD>
    <TD width="50%" bgColor=#FFCB7D height=27 class="style3">
      
            <INPUT style="BORDER-RIGHT: #ffcb7d 5px ridge; PADDING-RIGHT: 4px; BORDER-TOP: #ffcb7d 5px ridge; PADDING-LEFT: 4px; FONT-WEIGHT: bold; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffcb7d 5px ridge; WIDTH: 70px; COLOR: #111111; PADDING-TOP: 1px; BORDER-BOTTOM: #ffcb7d 5px ridge; FONT-FAMILY: Arial; HEIGHT: 30px; BACKGROUND-COLOR: #ECE9D8" type=button value=BACK onclick="window.parent.open('close.html','_self');" name=B14>

          <INPUT style="BORDER-RIGHT: #ffcb7d 5px ridge; PADDING-RIGHT: 4px; BORDER-TOP: #ffcb7d 5px ridge; PADDING-LEFT: 4px; FONT-WEIGHT: bold; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffcb7d 5px ridge; WIDTH: 70px; COLOR: #111111; PADDING-TOP: 1px; BORDER-BOTTOM: #ffcb7d 5px ridge; FONT-FAMILY: Arial; HEIGHT: 30px; BACKGROUND-COLOR: #ECE9D8" onclick="rset();" type=button value=RESET name=B5>

          <INPUT style="BORDER-RIGHT: #ffcb7d 5px ridge; PADDING-RIGHT: 4px; BORDER-TOP: #ffcb7d 5px ridge; PADDING-LEFT: 4px; FONT-WEIGHT: bold; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffcb7d 5px ridge; WIDTH: 70px; COLOR: #111111; PADDING-TOP: 1px; BORDER-BOTTOM: #ffcb7d 5px ridge; FONT-FAMILY: Arial; HEIGHT: 30px; BACKGROUND-COLOR: #ECE9D8" onclick="sv_actn();" type=button value=SAVE name=B6>

          <INPUT style="BORDER-RIGHT: #ffcb7d 5px ridge; PADDING-RIGHT: 4px; BORDER-TOP: #ffcb7d 5px ridge; PADDING-LEFT: 4px; FONT-WEIGHT: bold; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffcb7d 5px ridge; WIDTH: 180px; COLOR: #111111; PADDING-TOP: 1px; BORDER-BOTTOM: #ffcb7d 5px ridge; FONT-FAMILY: Arial; HEIGHT: 30px; BACKGROUND-COLOR: #ECE9D8" onclick="updtother();" type=button value="UPDATE OTHER INFO" name=B7>



    </TD>

  <TR>
    <FORM name=F2>
    <TD width="42%" height=310 class="style2">
      <TABLE id=AutoNumber5 style="BACKGROUND-COLOR: #d1cda7" height="329" 
      cellSpacing=1 cellPadding=2 width="100%" border=1>
        <TBODY>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>STATION</B></FONT></TD>
<%
       PS0= mk.con.prepareStatement( " select ORBL_STATION_CD, STATION_LONG_DESC from CD_STATION order by rownum ");
       rs0=PS0.executeQuery();
%>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="27"><FONT color=#00006c class="newStyle1">

<select size="1" name="T1" style="width: 330px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-F
AMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
<option value="SELECT">----------SELECT-----------</option>
<%
    while(rs0.next())
           {
%>
          <option value="<%= rs0.getString(1) %>"><%= rs0.getString(2) %></option>
<%
           }
           rs0.close();
           PS0.close();
%>
          </select>
          </FONT>
          </TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>LAST NAME</B></FONT></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="27"  colspan="2"><FONT color=#00006c class="newStyle1">
			<INPUT id=T10 
            onblur=""  
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" 
            maxLength=25 size=30 name="T10" value="" class="newStyle2" ></FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>LEVEL</B></FONT></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
          <INPUT id=T11 
            onblur=""  
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" 
            maxLength=1 size=10 name="T11" value="" ></FONT></TD>
          <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>TRANSFER DATE</B></FONT></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="27"  colspan="2"><FONT color=#00006c class="newStyle1">
          <INPUT id=T12 readonly
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" 
            maxLength=7 size=10 name="T12" value="" onClick="toggleCalendar('T12');"></FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">PASSWORD</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
          <INPUT id=T13 readonly type="password"
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" 
            maxLength=7 size=10 name="T13" value="cesc123" ></FONT></TD>
          <TD 
          style="border-style: solid; border-color: inherit; border-width: 1px; width: 18%;" 
          width="37%" height="23"><FONT color=#00006c class="newStyle1">


          </FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">ADMINISTRATION RIGHTS</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
<select size="1" name="T14" style="width: 330px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
          <option value="">----------SELECT-----------</option>
          <option value="A">Central DBA</option>
          <option value="G">Local DBA</option>
          <option value="3">Checking of Vendors</option>
          <option value="4">Approval right for Vendor</option>
          <option value="P">Dual role of normal user & Manager</option>
          </select>
          </FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">DATA ENTERED ON</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
          <INPUT id=T15 
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" 
            maxLength=7 size=10 name="T15" value="" onClick="toggleCalendar('T15');"></FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="31"><b><font face="Arial" size="1" color="#00006C">LAST UPDATED ON</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="31"  colspan="2"><FONT color=#00006c class="newStyle1">
          <INPUT id=T16 
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" 
            maxLength=7 size=10 name="T16" value="" ></FONT></TD>
          </TR>
        </TBODY></TABLE></TD></FORM></TR></TD>
  </TBODY></TABLE></BODY>

   <iframe name="I2" width="0" height="0">
          Your browser does not support inline frames or is currently configured not to display inline frames. 
   </iframe>

   <FORM name=MDF action="amnd_doUpdEmp.jsp" method=post target=I2>
          <INPUT type=hidden name=IE>
          <INPUT type=hidden name=M1>
          <INPUT type=hidden name=M2>
          <INPUT type=hidden name=M3>
          <INPUT type=hidden name=M4>
          <INPUT type=hidden name=M5>
          <INPUT type=hidden name=M6>
          <INPUT type=hidden name=M7>
          <INPUT type=hidden name=M8>
          <INPUT type=hidden name=M9>
          <INPUT type=hidden name=M10>
          <INPUT type=hidden name=M11>
          <INPUT type=hidden name=M12>
          <INPUT type=hidden name=M13>
          <INPUT type=hidden name=M14>
          <INPUT type=hidden name=M15>
          <INPUT type=hidden name=M16>
   </FORM>


<%
       mk.con.close();

     }catch(Exception e){System.out.println(e); }
        finally{
                 if(mk.con!=null)
                    {
                    mk.con.close();
                    System.out.println("    CLOSED !!!!!");
                    }
               }

%>



<TABLE bgColor=#ffffff border=1 cellPadding=0 cellSpacing=3 id=calendar style="DISPLAY: none; POSITION: absolute; Z-INDEX: 4">
  <TBODY>
  <TR>
    <TD colSpan=7 vAlign=center>
        <!-- Month combo box -->
        <SELECT id=month onchange=newCalendar()>
        <SCRIPT language=JavaScript>
                // Output months into the document.
                // Select current month.
                for (var intLoop = 0; intLoop < months.length; intLoop++)
                        document.write("<OPTION " +     (today.month == intLoop ? "Selected" : "") + ">" + months[intLoop]);
                </SCRIPT>
        </SELECT>
        <!-- Year combo box -->
        <SELECT id=year onchange=newCalendar()>
        <SCRIPT language=JavaScript>
                // Output years into the document.
                // Select current year.
                for (var intLoop = 1900; intLoop < 2028; intLoop++)
                        document.write("<OPTION " + (today.year == intLoop ? "Selected" : "") + ">" + intLoop);
                </SCRIPT>
        </SELECT>
 
        </TD>
  </TR>
  <TR class=days>
        <!-- Generate column for each day. -->
    <SCRIPT language=JavaScript>
        // Output days.
        for (var intLoop = 0; intLoop < days.length; intLoop++)
                document.write("<TD>" + days[intLoop] + "</TD>");
        </SCRIPT>
  </TR>
  </TBODY>
  <TBODY class=dates id=dayList onclick="getDate('')" vAlign=center>
  <!-- Generate grid for individual days. -->
  <SCRIPT language=JavaScript>
        for (var intWeeks = 0; intWeeks < 6; intWeeks++)
        {
                document.write("<TR>");
                for (var intDays = 0; intDays < days.length; intDays++)
                        document.write("<TD></TD>");
                document.write("</TR>");
        }
  </SCRIPT>
 
  <!-- Generate today day. -->
 <TBODY>
  <TR>
    <TD class=today colSpan=5 id=todayday onclick=getTodayDay()></TD>
    <TD align=right colSpan=2><A href="javascript:HideCalendar();"><SPAN style="COLOR: black; FONT-SIZE: 10px"><B>Hide</B></SPAN></A></TD>
  </TR>
  </TBODY>
 
</TABLE>


</HTML>
