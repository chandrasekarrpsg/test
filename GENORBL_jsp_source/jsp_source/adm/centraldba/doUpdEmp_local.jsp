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

      String login_adm_mkr="";

      java.util.Date date=new java.util.Date();
      SimpleDateFormat sdf=new SimpleDateFormat("dd"+"/"+"MM"+"/"+"yyyy");
      String toDate=sdf.format(date);

      SimpleDateFormat sdf1=new SimpleDateFormat("yyyyMMdd");
      String sysDate=sdf1.format(date);
      System.out.println(" DDDDD   "+toDate);

      MakeConnectionGENORBL  mk = new MakeConnectionGENORBL();
      try{
       PreparedStatement PS0= mk.con.prepareStatement( " select nvl(LOGIN_ADM_MKR,'@') from ADM_LOGIN_MST where login_id = ? ");

       PS0.setString(1,sLoginEmpCd);
       ResultSet rs0=PS0.executeQuery();


       while(rs0.next())
       login_adm_mkr=rs0.getString(1);

       rs0.close();
       PS0.close();

       PS0= mk.con.prepareStatement( " select STATION, DEPT, DEPT_SDESC from ORBL_CD_DEPT_MST "+
                                              //         " where DEPT < 90 "+
                                                       " order by DEPT_SDESC ");
       rs0=PS0.executeQuery();

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

var url = "get_doUpdEmp_local.jsp";
var http = getHTTPObject();

   var selct_flg=0;

   var total=0,count=0,incre=0,rec_cnt=0;

   var row = new Array();
   var row_inf = new Array();

   var stn = new Array();
   var dept = new Array();
   var d_desc = new Array();
  
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

function set_dfltpwd()
    {
        if( document.getElementById("Checkbox1").checked==true)
         {
          document.getElementById("T13").value='cesc123';
         }
        else
         {
          document.getElementById("T13").value=prev_pwd;
         }
    }

function rset()
    {
                       document.getElementById("T9").value="";
                       document.getElementById("T1").innerText="";
                       document.getElementById("T2").innerText="";
                       document.getElementById("T3").innerText="";
                       document.getElementById("T4").innerText="";
                       document.getElementById("T5").innerText="";
                       document.getElementById("T6").innerText="";
                       document.getElementById("T7").innerText="";
                       document.getElementById("T8").innerText="";
                       document.getElementById("T10").innerText="";
                       document.getElementById("T11").innerText="";
                       document.getElementById("T12").innerText="";
                       document.getElementById("T13").innerText='';
                       document.getElementById("T14").innerText="";
                       document.getElementById("T15").innerText="";
                       document.getElementById("T16").innerText="";
                       prev_pwd="";
                       document.getElementById("T17").value="";
                       document.getElementById("T18").value="";
                       document.getElementById("T19").value="";
                       document.getElementById("T20").value="";
                       document.getElementById("T21").value="";
                       document.getElementById("T22").value="";
                       document.getElementById("T23").value="";
                       document.getElementById("T24").value="";
                       document.getElementById("T25").value="";
                       document.getElementById("T26").value="";
                       document.getElementById("T27").value="";
                       document.getElementById("T28").value="";
                       document.getElementById("T29").value="";
                       document.getElementById("T30").value="";
                       document.getElementById("T31").value="";
                       document.getElementById("T32").value="";
                       document.getElementById("T33").value="";

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

                       document.getElementById("T1").innerText="";
                       document.getElementById("T2").innerText="";
                       document.getElementById("T3").innerText="";
                       document.getElementById("T4").innerText="";
                       document.getElementById("T5").innerText="";
                       document.getElementById("T6").innerText="";
                       document.getElementById("T7").innerText="";
                       document.getElementById("T8").innerText="";
                       document.getElementById("T10").innerText="";
                       document.getElementById("T11").innerText="";
                       document.getElementById("T12").innerText="";
                       document.getElementById("T13").innerText='';
                       document.getElementById("T14").innerText="";
                       document.getElementById("T15").innerText="";
                       document.getElementById("T16").innerText="";
                       prev_pwd="";
                       document.getElementById("T17").value="";
                       document.getElementById("T18").value="";
                       document.getElementById("T19").value="";
                       document.getElementById("T20").value="";
                       document.getElementById("T21").value="";
                       document.getElementById("T22").value="";
                       document.getElementById("T23").value="";
                       document.getElementById("T24").value="";
                       document.getElementById("T25").value="";
                       document.getElementById("T26").value="";
                       document.getElementById("T27").value="";
                       document.getElementById("T28").value="";
                       document.getElementById("T29").value="";
                       document.getElementById("T30").value="";
                       document.getElementById("T31").value="";
                       document.getElementById("T32").value="";
                       document.getElementById("T33").value="";

    if(empcdval.length==6)
     {
var params = "empcd="+empcdval+"&lgemp=<%= sLoginEmpCd %>&lgstn=<%= sLoginStnCd %>&lgdpt=<%= sLoginDeptCd %>&lglvl=<%= sLoginEmpLvl %>&lgadm=<%= login_adm_mkr %>";
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
                       document.getElementById("T1").innerText=results[0];
                       document.getElementById("T2").innerText=results[2];
                       document.getElementById("T3").innerText=results[4];
                       document.getElementById("T4").innerText=results[6];
                       document.getElementById("T5").innerText=results[8];
                       document.getElementById("T6").innerText=results[10];
                       document.getElementById("T7").innerText=results[12];
                       document.getElementById("T8").innerText=results[14];
                       document.getElementById("T9").innerText=results[1];
                       document.getElementById("T10").innerText=results[3];
                       document.getElementById("T11").innerText=results[5];
                       document.getElementById("T12").innerText=results[7];
                       document.getElementById("T13").innerText=results[9];
                       document.getElementById("T14").innerText=results[11];
                       document.getElementById("T15").innerText=results[13];
                       document.getElementById("T16").innerText=results[15];
                       add_opt(results[16]);
                       document.getElementById("T17").value=results[17];
                       document.getElementById("T18").value=results[18];
                       document.getElementById("T19").value=results[19];
                       document.getElementById("T20").value=results[20];
                       document.getElementById("T21").value=results[21];
                       document.getElementById("T22").value=results[22];
                       document.getElementById("T23").value=results[23];
                       document.getElementById("T24").value=results[24];
                       document.getElementById("T25").value=results[25];
                       document.getElementById("T26").value=results[26];
                       document.getElementById("T27").value=results[27];
                       document.getElementById("T28").value=results[28];
                       document.getElementById("T29").value=results[29];
                       document.getElementById("T30").value=results[30];
                       document.getElementById("T31").value=results[31];
                       document.getElementById("T32").value=results[32];
                       document.getElementById("T33").value=results[33];
                       prev_pwd=results[9];
                       ins_edt_flg='U';
                      }
                     else
                      {
                       document.getElementById("T1").innerText="";
                       document.getElementById("T2").innerText="";
                       document.getElementById("T3").innerText="";
                       document.getElementById("T4").innerText="";
                       document.getElementById("T5").innerText="";
                       document.getElementById("T6").innerText="";
                       document.getElementById("T7").innerText="";
                       document.getElementById("T8").innerText="";
                       document.getElementById("T9").innerText="";
                       document.getElementById("T10").innerText="";
                       document.getElementById("T11").innerText="";
                       document.getElementById("T12").innerText="";
                       document.getElementById("T13").innerText="";
                       document.getElementById("T14").innerText="";
                       document.getElementById("T15").innerText="";
                       document.getElementById("T16").innerText="";
                       ins_edt_flg='';"";
                      }
                  }
                else
                  {
                   alert("EMPLOYEE CODE NOT FOUND");
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
    
    }

function sv_actn()
    {
           if(validations())
            {
            document.MDF.IE.value=ins_edt_flg;
            document.MDF.M9.value=document.getElementById("T9").value;
            document.MDF.M17.value=document.getElementById("T17").value;
            document.MDF.M18.value=document.getElementById("T18").value;
            document.MDF.M19.value=document.getElementById("T19").value;
            document.MDF.M20.value=document.getElementById("T20").value;
            document.MDF.M21.value=document.getElementById("T21").value;
            document.MDF.M22.value=document.getElementById("T22").value;
            document.MDF.M23.value=document.getElementById("T23").value;
            document.MDF.M24.value=document.getElementById("T24").value;
            document.MDF.M25.value=document.getElementById("T25").value;
            document.MDF.M26.value=document.getElementById("T26").value;
            document.MDF.M27.value=document.getElementById("T27").value;
            document.MDF.M28.value=document.getElementById("T28").value;
            document.MDF.M29.value=document.getElementById("T29").value;
            document.MDF.M30.value=document.getElementById("T30").value;
            document.MDF.M31.value=document.getElementById("T31").value;
            document.MDF.M32.value=document.getElementById("T32").value;
            document.MDF.M33.value=document.getElementById("T33").value;
            document.MDF.UPDBY.value="<%= sLoginEmpCd %>";
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
            var adm_mkr="<%= login_adm_mkr %>";
               if(adm_mkr!='G'&&adm_mkr!='A')
                   {
                       document.getElementById("T17").disabled=true;
                       document.getElementById("T18").disabled=true;
                       document.getElementById("T19").disabled=true;
                       document.getElementById("T20").disabled=true;
                       document.getElementById("T21").disabled=true;
                       document.getElementById("T22").disabled=true;
                       document.getElementById("T23").disabled=true;
                       document.getElementById("T24").disabled=true;
                       document.getElementById("T25").disabled=true;
                       document.getElementById("T26").disabled=true;
                       document.getElementById("T27").disabled=true;
                       document.getElementById("T28").disabled=true;
                       document.getElementById("T29").disabled=true;
                       document.getElementById("T30").disabled=true;
                       document.getElementById("T31").disabled=true;
                       document.getElementById("T32").disabled=true;
                       document.getElementById("T33").disabled=true;
                   }
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

    if(document.getElementById("T17").value=='SELECT'){
    alert('Please select a value in the field');
    document.getElementById("T17").value='SELECT';
    document.getElementById("T17").focus();
    return false;
      }
    if(document.getElementById("T19").value!='')
    {
    if(!isPosInt(document.getElementById("T19").value)){
     alert('Field must be numeric');
     document.getElementById("T19").focus();
     document.getElementById("T19").select();
     return false;
     }
    }
    if(document.getElementById("T20").value!='')
    {
    if(!isPosInt(document.getElementById("T20").value)){
     alert('Field must be numeric');
     document.getElementById("T20").focus();
     document.getElementById("T20").select();
     return false;
     }
    }
    if(document.getElementById("T21").value!='')
    {
    if(!isPosInt(document.getElementById("T21").value)){
     alert('Field must be numeric');
     document.getElementById("T21").focus();
     document.getElementById("T21").select();
     return false;
     }
    }
    if(isFutureDate(document.getElementById("T18").value))
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

function add_opt(val)
  {
      var D=document.getElementById("T17");
      var D1=document.getElementById("T28");
      putDname(D);
      putDname(D1);
      for(i=0;i<stn.length;i++)
          {
          if(val==stn[i] && dept[i]<90)
           {
             var opt1=document.createElement("option")
             opt1.text=d_desc[i];
             opt1.value=dept[i];
             D.add(opt1);
           }
          }

      for(i=0;i<stn.length;i++)
          {
          if(val==stn[i] && dept[i]>=90)
           {
             var opt2=document.createElement("option")
             opt2.text=stn[i]+":"+d_desc[i]+":"+dept[i];
             opt2.value=d_desc[i];
             D1.add(opt2);
           }
          }
  }


 function putDname(D)
   {
     var x= D.length;
     for(i=x;i>0;i--)
     {
     D.remove(i);
     }
    }


var cnt=0;


</SCRIPT>
<%
    while(rs0.next())
           {
%>
<SCRIPT>
          stn[cnt]="<%= rs0.getString(1) %>";
          dept[cnt]="<%= rs0.getString(2) %>";
          d_desc[cnt]="<%= rs0.getString(3) %>";
          cnt++;

</SCRIPT>
<%
           }
           rs0.close();
           PS0.close();
%>


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
      <P align=center style="height: 28px"><span style="background-color: #FFCB7D; width: 500px; height: 65px;"><b>
      <font face="Arial" size="6" color="#111111">EMPLOYEE MASTER UPDATION</font></b></span></P>
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
          color=#00006c><B>STATION</B></FONT></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="27"><FONT color=#00006c class="newStyle1">
          <div id="T1"></div>
          </FONT>
          </TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>FIRST NAME</B></FONT></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="27"><FONT color=#00006c  class="newStyle1">
          <div id="T2"></div>
           </FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>DESIGNATION</B></FONT></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
          <div id="T3"></div>
            </FONT></TD>
          <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>JOINING DATE</B></FONT></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="27"><FONT color=#00006c class="newStyle1">
          <div id="T4"></div>
          </FONT></TD></form>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">RESIGNATION DATE</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
          <div id="T5"></div>
          </FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">VIP IP</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
          <div id="T6"></div>
          </FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">DATA ENTERED BY</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
          <div id="T7"></div>
          </FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="31"><b><font face="Arial" size="1" color="#00006C">
			LAST UPDATED BY</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
          <div id="T8"></div>
          </FONT></TD>
          </TR>

          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>DEPARTMENT</B></FONT></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
<select size="1" id="T17" name="T17" style="width: 250px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
<option value="SELECT">----------SELECT-----------</option>
          </select>
            </FONT></TD>
          </TR>

        <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">MOBILE NUMBER</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
          <INPUT id=T19
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center"
            maxLength=10  size=15 name="T19" value="" ></FONT></TD>
          </TR>

        <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">TELEPHONE NO - 2</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
          <INPUT id=T21
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center"
            maxLength=10  size=10 name="T21" value="" ></FONT></TD>
          </TR>


          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">ACCESS TO BUDGET ENTRY MODULE</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
<select size="1" id="T23" name="T23" style="width: 90px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
          <option value="Y">Yes</option>
          <option value="">No</option>
          </select>
          </FONT></TD>
          </TR>


          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">ACCESS TO BILL RELEASE ONLY</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
<select size="1" id="T25" name="T25" style="width: 90px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
          <option value="Y">Yes</option>
          <option value="">No</option>
          </select>
          </FONT></TD>
          </TR>

          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">ACCESS TO PRINTING ORDER ONLY</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
<select size="1" id="T27" name="T27" style="width: 90px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
          <option value="Y">Yes</option>
          <option value="">No</option>
          </select>
          </FONT></TD>
          </TR>

          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">ACCESS TO KAIZEN</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
<select size="1" id="T29" name="T29" style="width: 290px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
          <option value="">----SELECT----</option>
          <option value="1">ENTRY & EDIT</option>
          <option value="2">APPROVAL FROM DEPARTMENT</option>
          <option value="3">APPROVAL FROM STATION</option>
          <option value="4">APPROVAL FROM CORPORATE</option>
          </select>
          </FONT></TD>
          </TR>

          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">ACCESS TO DEFECT MANAGEMENT</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
<select size="1" id="T30" name="T30" style="width: 90px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
          <option value="Y">Yes</option>
          <option value="">No</option>
          </select>
          </FONT></TD>
          </TR>

          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">ACCESS TO INTERNAL PTW MANAGEMENT</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
<select size="1" id="T31" name="T31" style="width: 90px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
          <option value="Y">Yes</option>
          <option value="">No</option>
          </select>
          </FONT></TD>
          </TR>

          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">ACCESS TO MAINTENANCE PLANNING DASHBOARD</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
<select size="1" id="T32" name="T32" style="width: 90px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
          <option value="Y">Yes</option>
          <option value="">No</option>
          </select>
          </FONT></TD>
          </TR>

          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">ACCESS TO ASSET MANAGEMENT</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
<select size="1" id="T33" name="T33" style="width: 90px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
          <option value="Y">Yes</option>
          <option value="">No</option>
          </select>
          </FONT></TD>
          </TR>

        </TBODY></TABLE></td>
					</tr>
		</table>
	</TD>
    <TD width="50%" bgColor=#FFCB7D height=27 class="style3">

            <INPUT style="BORDER-RIGHT: #ffcb7d 5px ridge; PADDING-RIGHT: 4px; BORDER-TOP: #ffcb7d 5px ridge; PADDING-LEFT: 4px; FONT-WEIGHT: bold; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffcb7d 5px ridge; WIDTH: 80px; COLOR: #111111; PADDING-TOP: 1px; BORDER-BOTTOM: #ffcb7d 5px ridge; FONT-FAMILY: Arial; HEIGHT: 30px; BACKGROUND-COLOR: #ECE9D8" type=button onclick="window.parent.open('close.html','_self');" value=BACK name=B14> 

          <INPUT style="BORDER-RIGHT: #ffcb7d 5px ridge; PADDING-RIGHT: 4px; BORDER-TOP: #ffcb7d 5px ridge; PADDING-LEFT: 4px; FONT-WEIGHT: bold; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffcb7d 5px ridge; WIDTH: 80px; COLOR: #111111; PADDING-TOP: 1px; BORDER-BOTTOM: #ffcb7d 5px ridge; FONT-FAMILY: Arial; HEIGHT: 30px; BACKGROUND-COLOR: #ECE9D8" onclick="rset();" type=button value=RESET name=B5>

          <INPUT style="BORDER-RIGHT: #ffcb7d 5px ridge; PADDING-RIGHT: 4px; BORDER-TOP: #ffcb7d 5px ridge; PADDING-LEFT: 4px; FONT-WEIGHT: bold; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffcb7d 5px ridge; WIDTH: 80px; COLOR: #111111; PADDING-TOP: 1px; BORDER-BOTTOM: #ffcb7d 5px ridge; FONT-FAMILY: Arial; HEIGHT: 30px; BACKGROUND-COLOR: #ECE9D8" onclick="sv_actn();" type=button value=SAVE name=B6>


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
          borderColor=#8a8aff width="40%" bgColor=#ece9d8 height="27"><FONT face=Arial  size="1"
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
          color=#00006c><B>LAST NAME</B></FONT></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="27"  colspan="2"><FONT color=#00006c class="newStyle1">
          <div id="T10"></div>
          </FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>LEVEL</B></FONT></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
          <div id="T11"></div>
          </FONT></TD>
          <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>TRANSFER DATE</B></FONT></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="27"  colspan="2"><FONT color=#00006c class="newStyle1">
          <div id="T12"></div>
          </FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">PASSWORD</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="23"><FONT color=#00006c class="newStyle1">
          <div id="T13"></div>
          </FONT></TD>
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
          <div id="T14"></div>
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
          <div id="T15"></div>
          </FONT></TD>
          </TR>
        <TR>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="31"><b><font face="Arial" size="1" color="#00006C">LAST UPDATED ON</font></b></TD>
          <TD 
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" 
          width="37%" height="31"  colspan="2"><FONT color=#00006c class="newStyle1">
          <div id="T16"></div>
          </FONT></TD>
          </TR>

        <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">BIRTH DATE</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
          <INPUT id=T18
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center"
            maxLength=7 size=10 name="T18" value="" onClick="toggleCalendar('T18');"></FONT></TD>
          </TR>

        <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>TELEPHONE NO - 1</B></FONT></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
          <INPUT id=T20
            onblur=""
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center"
            maxLength=10 size=12 name="T11" value="" ></FONT></TD>
          </TR>

        <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>EMAIL ID</B></FONT></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
          <INPUT id=T22
            onblur=""
            style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center"
            maxLength=30 size=30 name="T11" value="" ></FONT></TD>
          </TR>

          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">ACCESS TO OBBMS(Except Finance module)</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
<select size="1" id="T24" name="T24" style="width: 90px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
          <option value="Y">Yes</option>
          <option value="">No</option>
          </select>
          </FONT></TD>
          </TR>


          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="23"><b>
          <font face="Arial" size="1" color="#00006C">ACCESS TO FINANCE MODULE ONLY</font></b></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23"  colspan="2"><FONT color=#00006c class="newStyle1">
<select size="1" id="T26" name="T26" style="width: 90px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
          <option value="Y">Yes</option>
          <option value="">No</option>
          </select>
          </FONT></TD>
          </TR>

          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>SPECIAL DEPARTMENT</B></FONT></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23" colspan="2"><FONT color=#00006c class="newStyle1">
<select size="1" id="T28" name="T28" style="width: 250px" onblur="" style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #CCCCff; TEXT-ALIGN: center" onchange="" >
<option value="">----------SELECT-----------</option>
          </select>
            </FONT></TD>
          </TR>

          <TR>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial size="1"
          color=#00006c><B>&nbsp;</B></FONT></TD>
          <TD
          style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid"
          width="37%" height="23" colspan="2"><FONT color=#00006c class="newStyle1">&nbsp;
            </FONT></TD>
          </TR>

        </TBODY></TABLE></TD></FORM></TR></TD>
  </TBODY></TABLE></BODY>

   <iframe name="I2" width="0" height="0">
          Your browser does not support inline frames or is currently configured not to display inline frames. 
   </iframe>

   <FORM name=MDF action="amnd_doUpdEmp_local.jsp" method=post target=I2>
          <INPUT type=hidden name=IE>
          <INPUT type=hidden name=M9>
          <INPUT type=hidden name=M17>
          <INPUT type=hidden name=M18>
          <INPUT type=hidden name=M19>
          <INPUT type=hidden name=M20>
          <INPUT type=hidden name=M21>
          <INPUT type=hidden name=M22>
          <INPUT type=hidden name=M23>
          <INPUT type=hidden name=M24>
          <INPUT type=hidden name=M25>
          <INPUT type=hidden name=M26>
          <INPUT type=hidden name=M27>
          <INPUT type=hidden name=M28>
          <INPUT type=hidden name=M29>
          <INPUT type=hidden name=M30>
          <INPUT type=hidden name=M31>
          <INPUT type=hidden name=M32>
          <INPUT type=hidden name=M33>
          <INPUT type=hidden name=UPDBY>

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
