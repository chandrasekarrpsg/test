<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>UPDATE MAX NO OF BILL</TITLE>
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
 
<script>

var url = "get_dtl_MaxNoBls.jsp";
var http = getHTTPObject();
function getHTTPObject() {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}



function getDtl()
{

var ordId = dialogArguments.document.getElementById('sOrdId').value;

var params = "ordId="+ordId;
http.open("POST", url, true);
http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
http.onreadystatechange = function()
   {
        if(http.readyState == 4 && http.status == 200)
        {
             results = http.responseText.split("~");
             document.getElementById('txt_ordno').innerText=results[0];
             document.getElementById('txt_orddt').innerText=results[1];
             document.getElementById('txt_isudby').innerText=results[2];
             document.getElementById('txt_desc').innerText=results[3];
             document.getElementById('txt_vend').innerText=results[4];
             document.getElementById('txt_rlsd').innerText=results[5];

        }
  }
http.send(params);

}

function isNumber(str){
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

function validateN(str)
 {
if(!isNumber(str) )
 {
   alert('WRONG ENTRY');
  return false;
 }  
 }

function mdfy_actn()
{


if(!isNumber(document.getElementById('T1').value))
 {
   alert('WRONG ENTRY');
  return false;
 }  
else
if(parseInt(document.getElementById('T1').value-0)<parseInt(document.getElementById('txt_rlsd').innerText-0))
 {
   alert('WRONG ENTRY');
  return false;
 }  
else
 {
  document.MDF.ordId.value=dialogArguments.document.getElementById('sOrdId').value;
  document.MDF.M0.value=parseInt(document.getElementById('T1').value);
  document.MDF.M1.value=dialogArguments.document.getElementById('sLoginEmpCd').value;
  document.MDF.submit();
  document.getElementById('B4').disabled=true;
 }

}

 
</script>
 
 
 
<META content="Microsoft FrontPage 12.0" name=GENERATOR></HEAD>
<BODY bgColor=#ece9d8 onload="getDtl();">
<TABLE id=AutoNumber2 cellSpacing=1 cellPadding=2 width="100%" style="height: 405px">
  <TR>
    <TD width="56%" bgColor=#FFCB7D height=27>
      <P align=center><span style="background-color: #FFCB7D"><b>
      <font face="Arial" size="6" color="#111111">UPDATE MAXIMUM NO. OF BILLS</font></b></span></P></TD>
    <TD width="10%" height=473 rowSpan=2>
      <TABLE id=AutoNumber3 cellSpacing=1 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">
            <DIV id=SVDIV>&nbsp;</DIV></TD>
          <INPUT type=hidden name=M0>
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
        </TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%"><INPUT style="BORDER-RIGHT: #ffcb7d 5px ridge; PADDING-RIGHT: 4px; BORDER-TOP: #ffcb7d 5px ridge; PADDING-LEFT: 4px; FONT-WEIGHT: bold; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffcb7d 5px ridge; WIDTH: 80px; COLOR: #111111; PADDING-TOP: 1px; BORDER-BOTTOM: #ffcb7d 5px ridge; FONT-FAMILY: Arial; HEIGHT: 30px; BACKGROUND-COLOR: #ECE9D8" onclick="document.getElementById('T1').value='';" type=button value=RESET name=B5></TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">
            <DIV id=MDDIV><INPUT style="BORDER-RIGHT: #ffcb7d 5px ridge; PADDING-RIGHT: 4px; BORDER-TOP: #ffcb7d 5px ridge; PADDING-LEFT: 4px; FONT-WEIGHT: bold; PADDING-BOTTOM: 1px; BORDER-LEFT: #ffcb7d 5px ridge; WIDTH: 80px; COLOR: #111111; PADDING-TOP: 1px; BORDER-BOTTOM: #ffcb7d 5px ridge; FONT-FAMILY: Arial; HEIGHT: 30px; BACKGROUND-COLOR: #ECE9D8" type=button value=UPDATE name=B4 id=B4 onclick=mdfy_actn();> 
            </DIV></TD>
        </TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD>
        </TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR>
        <TR>
          <TD width="100%">&nbsp;</TD></TR></TBODY></TABLE></TD></TR>
  <TR>
    <FORM name=F2>
    <TD width="48%" height=310>
      <TABLE id=AutoNumber5 style="BACKGROUND-COLOR: #d1cda7" height="329" 
      cellSpacing=1 cellPadding=2 width="100%" border=1>
        <TBODY>
         <TR>
          <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial color=#00006c><B>
			&nbsp;ORDER NO.</B></FONT></TD>
          <TD id="txt_ordno" style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" width="37%" height="27"><FONT color=#00006c>
			&nbsp;</FONT></TD>
          </TR>
         <TR>
          <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial color=#00006c><B>
			&nbsp;ORDER DATE</B></FONT></TD>
          <TD id="txt_orddt" style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" width="37%" height="27"><FONT color=#00006c>
			&nbsp;</FONT></TD>
          </TR>
           <input type="hidden" name="hid" value="2"/>
        <TR>
          <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial color=#00006c><B>
			&nbsp;ISSUED BY</B></FONT></TD>
          <TD id="txt_isudby" style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" width="37%" height="27"><FONT color=#00006c>
			&nbsp;</FONT></TD>
          </TR>
        <TR>
          <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial color=#00006c><B>
			&nbsp;DESCRIPTION</B></FONT></TD>
          <TD id="txt_desc" style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" width="37%" height="27"><FONT color=#00006c>
			&nbsp;</FONT></TD>
          </TR>
         <TR>
          <TD  style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial color=#00006c><B>
			&nbsp;VENDOR</B></FONT></TD>
          <TD id="txt_vend" style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" width="37%" height="27"><FONT color=#00006c>
			&nbsp;</FONT></TD>
          </TR>
 
        <TR>
          <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial color=#00006c><B>
			&nbsp;NO. OF BILLS RELEASED</B></FONT></TD>
          <TD id="txt_rlsd" style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" width="37%" height="27"><FONT color=#00006c>
			&nbsp;&nbsp;
 
            </FONT></TD>
          </TR>
 
        <TR>
          <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" borderColor=#8a8aff width="20%" bgColor=#ece9d8 height="27"><FONT face=Arial color=#00006c><B>
			&nbsp;CHANGE MAXIMUM NO. OF BILLS TO</B></FONT></TD>
          <TD style="BORDER-RIGHT: 1px solid; BORDER-TOP: 1px solid; BORDER-LEFT: 1px solid; BORDER-BOTTOM: 1px solid" width="37%" height="27"><FONT color=#00006c><INPUT id=T1  onkeyup="validateN(this.value);"  style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; COLOR: #0000ff; FONT-FAMILY: Arial; BACKGROUND-COLOR: #ffffff; TEXT-ALIGN: center" maxLength=2 size=10 name="T1" value="" ></FONT></TD>
          </TR>
 
          </TR></TBODY></TABLE></TD></FORM></TR></TABLE>
  </BODY>
   <iframe name="I2" width="0" height="0">
          Your browser does not support inline frames or is currently configured not to display inline frames.  </iframe>
   <FORM name=MDF action="amnd_MaxNoBls.jsp" method=post target=I2>
          <INPUT type=hidden name=ordId>
          <INPUT type=hidden name=M0>
          <INPUT type=hidden name=M1> 
          <INPUT type=hidden name=M2>
          <INPUT type=hidden name=M3>
   </FORM> 

</HTML>


