
<%@ page import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,java.text.*"%>
<%@ page import="java.util.*,java.io.*,java.lang.*" %>
<%@ page import="genOrblJavaPackage.*" %>




<html>
 <head>
 <title>Bill(s) Sent to Finance</title>
 <script type="text/javascript" src ="printSpl.js"></script>
 <script type='text/JavaScript' src='js/best_cal_ag.js'></script>

<style type="text/css">
.OpaqueLayer {
  display         : block;
  position        : absolute;
  top             : 122px;
  left            : 10px;
  height          : 550px;
  width           : 980px;
  opacity         : 0.6;
  filter          : alpha(opacity=40);
  background-color: #000000;
  z-Index         : 1000;
}
.showCheckLst {
   position:absolute ;
   top:350px;
   left:5px;
   z-Index        : 10000;
   }
.showBillRef {
   position:absolute ;
   top:130px;
   left:88px;
   z-Index        : 10000;
   }
.showList {
   position:absolute ;
   top:122px;
   left:80px;
   }
.hide {
   position:absolute ;
   top: -1000000px;
   left:-1000000px;
}
.style1{
		background-color:#E6F2FF;
		font-family:Verdana;
		font-size:18px;
		font-weight:bold		
}
.style2{
		background-color:#E6F2FF;
		font-family:Verdana;
		font-size:15px;
				
}
.style3{
		background-color:#b6dde8;
		font-family:Verdana;
		font-size:15px;
				
}

 </style>
<SCRIPT type="text/javascript">


function hideLotEntry_P() {
 document.getElementById('finChkLst').className="hide";
 document.getElementById('BillRefEntry').className="hide";
 document.getElementById('shadow').className="hide";
}


function  submitForm2_P(refId){
 if (document.getElementById("stncd") == null){
  ifrfinChkLst.location.replace('bill_spbill_selection_pg.jsp?stncd=0&refId=' + refId) ;
 }
 else{
  var stncd=document.form1.stncd.options[document.form1.stncd.selectedIndex].value;
  ifrfinChkLst.location.replace('bill_spbill_selection_pg.jsp?stncd='+stncd+'&refId=' + refId) ;
 }
 document.getElementById('finChkLst').className="showCheckLst";

}
function showLotEntry_P(refId) {
 if (document.getElementById("stncd") == null){
  iframeBillref.location.replace('fin_lot_bill_entry.jsp?stncd=0&refId=' + refId) ;
 }
 else{
  var stncd=document.form1.stncd.options[document.form1.stncd.selectedIndex].value;
  iframeBillref.location.replace('fin_lot_bill_entry.jsp?stncd='+stncd+'&refId=' + refId) ;
 }
 document.getElementById('shadow').className="OpaqueLayer";
 document.getElementById('BillRefEntry').className="showBillRef";
}

function showFinLst(stncd,frmDt,toDt){
  document.getElementById('finLst').className="showList";
  iframeFinLst.location.replace('batch_proc_fin_rcv_dt_bkend.jsp?stncd='+stncd+'&frm_dt='+frmDt+'&to_dt='+toDt) ;

}
function enabDisabBtn(){
//alert("parent function called " + document.getElementById('iframeBillref') );
 window.frames.iframeBillref.enableBtnSub();
}
function enabDisabBtn_1(){
//alert("parent function called " + document.getElementById('iframeBillref') );
 window.frames.iframeBillref.enableBtnSub_1();
}
</SCRIPT>

 </head>
<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>

<body>
<%
String sLoginEmpCd = loginBean.getsEmpCd();
String sEmpCd          = loginBean.getsEmpCd();
String sOrdByNm        = loginBean.getsEmpFNm() + " " + loginBean.getsEmpLNm();
String sLoginStn       = loginBean.getsGenStn();
String sLoginStnNm     = loginBean.getsGenStnNm();
String sLoginStnShrtNm = loginBean.getsLoginStnShrtNm();
String sLoginDept      = loginBean.getsDept();


 // String ord_ref   = new String("");
 // String copy_typ  = new String("");

  //copy_typ   = request.getParameter("copy");
  //ord_ref    = request.getParameter("sOrdId");


/*
    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    PreparedStatement ps     = null;
    ResultSet         rs     = null;
    mk.con.setAutoCommit(false);
*/



 
%>
<form name ='form1' id ='form1'  method ="POST" action= "batch_proc_fin_rcv_dt_bkend.jsp" >
<table width="100%" cellspacing="0" bordercolordark="#1E026F" border="0" style="border-collapse: collapse" cellpadding="0">
<tr>
<td width="15%" class="style1" style="text-align:center;"><img border="0" src="rlogo.png" width="170" height="70"</td>
<td width="70%" class="style1" style="text-align:center;">Bill(s) Sent to Finance</td>
<td width="15%" class="style1" style="text-align:center;"><img alt="" src="logo-cesc-new.png" width="89" height="47"/></td>
</tr>
</table>

<table width="100%" boder="2" bordercolorlight="#FFFFFF" cellspacing="0" bordercolordark="#1E026F" border="1">
<tr>
<td width="30%" class="style2" align="right">
<%
if (sLoginStn.equals("042")){
%>
                                <select name="stncd">
				<option value="ALL" selected>ALL</option>
				<option value="016">BBGS</option>
				<option value="014">TGS</option>
				<option value="002">SGS</option>
				<option value="013">NCGS</option>
				<option value="019">CTM</option>
				<option value="042">EDGE</option>
				</select>
<%
}
%>
From Date &nbsp;&nbsp;&nbsp;</td>
<td width="10%" align="center"><input type="text" name="frm_dt" id="frm_dt" size="10" onclick='scwShow(this,event);'  /></td>
<td width="10%" class="style2"  align="right">To Date &nbsp;&nbsp;&nbsp;</td>
<td width="10%" align="center"><input type="text" name="to_dt" id="to_dt" size="10" onclick='scwShow(this,event);' /></td>
<%
if (sLoginStn.equals("042")){
%>
<td width="10%" align="center" class="style1" ><input type="button" name="b1" id="b1" value="SUBMIT" class="style3" onClick="showFinLst(document.form1.stncd.options[document.form1.stncd.selectedIndex].value,frm_dt.value,to_dt.value);"/></td>
<%
}
else {
%>
<td width="10%" align="center" class="style1" ><input type="button" name="b1" id="b1" value="SUBMIT" class="style3" onClick="showFinLst('<%=sLoginStn%>',frm_dt.value,to_dt.value);"/></td>
<%
}
%>
<td width="30%" align=left class="style1"> <input type = "button" value="BACK" class="style3" onclick="window.parent.open('invoke_menu_page.jsp?userid=<%=sLoginEmpCd%>','_self');" ></td>
</tr>

</table>
</form>
<div id="finLst" class="hide"  style="width: 850px; height: 236px">
 <iframe name="iframeFinLst" src="batch_proc_fin_rcv_dt_bkend.jsp?stncd=0&frm_dt=0&to_dt=0" class="autoHeight" width="100%" height="100%" scrolling="auto" frameborder="1" >
</iframe>
</div>
<div id="BillRefEntry" class="hide"  style="width: 850px; height: 220px">
 <iframe id="iframeBillref" name="iframeBillref" src="fin_lot_bill_entry.jsp?stncd=0&refId=Z" class="autoHeight" width="98%" height="100%" scrolling="auto" frameborder="1" ></iframe>
</div>
<div id="shadow" class="hide" >
</div>
<div id="finChkLst" class="hide"  style="width: 990px; height: 330px">
<iframe id="ifrfinChkLst" name="ifrfinChkLst" src="bill_spbill_selection_pg.jsp?stncd=0&refId=0" class="autoHeight" width="100%" height="100%" scrolling="auto" frameborder="1">
</iframe>
</div>



</body>
</html>