<%@ page import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,java.text.*"%>
<%@ page import="java.util.*,java.io.*,java.lang.*" %>
<%@ page import="genOrblJavaPackage.*" %>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
 <title>Bill(s) Lot Bill Entry </title>
 <script type="text/javascript" src ="printSpl.js"></script>
 <script type="text/javascript" src ="orblFinCommonScript.js"></script>
 <script type='text/JavaScript' src='js/best_cal_ag.js'></script>
<style type="text/css">
.style1 {
		border: 2px solid #8D7C54;
}
.showAlert {
   position:absolute ;
   top:100px;
   left:300px;
}
.hide {
   position:absolute ;
   top: -1000000px;
   left:-1000000px;
}

.showDivSubmit {
   position:absolute ;
   top:10px;
   left:100px;
}


.textbox1{font-family: Garamond;
     font-size: 13pt;
     font-weight: bold;
     color: #30414E;
     color: blue;
     background-color: #F4F4DF;
     text-align: left
}
.textbox {
                background-color:#b6dde8;
		text-align: center;
                color: #003399;
                font-size: 10pt;
}
.style5 {
                background-color:#b6dde8;
		text-align: center;
		font-weight: bold;
}
.style6{
		background-color:#E6F2FF;
		font-family:Verdana;
		font-size:18px;
		font-weight:bold		
}
.showScrollTab {
                position:absolute ;
                top:370px;
                left:25px;
}
.style7{
		border-color: #BE8314;
		border-width: 1px;
		background-color: #DB9C3E;
		font-family: Verdana;
		font-size: x-small;
		color: #913022;
		font-weight: bold;
}
.style8 {
				border-color: #BE8314;
				border-width: 1px;
				background-color: #DB9C3E;
				font-family: Verdana;
				font-size: x-small;
				color: #913022;
				font-weight: bold;
				text-align: center;
}
.style9 {
				background-color: #E6F2FF;
				font-family: Verdana;
				font-size: 18px;
				font-weight: bold;
				text-align: right;
}
.style10 {
				background-color: #B6DDE8;
}
.style11 {
				text-align: center;
				background-color: #B6DDE8;
}
.style12 {
				background-color: #b6dde8;
				font-family: Verdana;
				font-size: 13px;
				text-align: center;
				color: #003366;
				font-weight: bold;
}
.style13 {
				text-align: left;
				background-color: #B6DDE8;
}
</style>
<SCRIPT type="text/javascript">

function enableBtnSub(){
//alert("child function called ");
if(document.getElementById("Save")!=null) {
if (document.f1.Save.disabled==true) {
 document.f1.Save.disabled=false;
 document.f1.Save.value="Edit";
}
}

if (document.f1.Lock.disabled==true ){
  document.f1.Lock.disabled=false;
}
}

function enableBtnSub_1(){
if(document.getElementById("Save")!=null) {
if (document.f1.Save.disabled==true) {
 document.f1.Save.disabled=false;
 document.f1.Save.value="Edit";
}
}
  document.f1.Lock.disabled=true;
}

function hideAlert(){
 document.getElementById('divalert').className="hide";
 submitForm2(document.f1.refId.value);
}
function hideAlert_lock(){
 document.getElementById('divalert_lock').className="hide";
 submitForm2(document.f1.refId.value);
 document.f1.Print.disabled=false;
}
function hideAlert_err(){
 document.getElementById('divalert_err').className="hide";
}

function showAlert(){
 document.getElementById('divalert').className="showAlert";
}
function showAlert_lock(){
 document.getElementById('divalert_lock').className="showAlert";
}
function showAlert_err(){
 document.getElementById('divalert_err').className="showAlert";
}


function hideLotEntry() {

document.f1.refId.value='';
document.f1.letref.value='';
document.f1.letRefDt.value='';
document.f1.finRecDt.value='';
parent.hideLotEntry_P();
}

function submitForm1(loginStn,empCd,refId,letRef,letDt,finrecvdt,param) {

if (document.f1.H1.value=='L') {
  if (document.f1.finRecDt.value==''){
    document.f1.Save.value='Save' ;
  }
  else {
     if ( isHigherDate(document.f1.finRecDt.value) ) {
      alert('Finance Received date Can Not Be Greater Than System Date ') ;
      document.f1.finRecDt.select() ;
      return false ;
     }
    if ( !compareDate(document.f1.letRefDt.value,document.f1.finRecDt.value)) {
      alert(' Finance Received Date Should Be Greater Than Letter Date ') ;
      document.f1.finRecDt.select() ;
      return false ;
    }
   param = 'F' ;
    submitForm.location.replace('fin_lot_bill_entry_upd.jsp?refId='+refId+'&letRef='+letRef+'&letDt='+letDt+'&loginStn='+loginStn+'&empCd='+empCd+'&param='+param+'&finrecvdt='+finrecvdt) ;
  }
}
else{

if(document.getElementById("Save")!=null) {
  if (document.f1.Save.value=='Save' ) {
    submitForm.location.replace('fin_lot_bill_entry_upd.jsp?refId='+refId+'&letRef='+letRef+'&letDt='+letDt+'&loginStn='+loginStn+'&empCd='+empCd+'&param='+param+'&finrecvdt='+finrecvdt) ;
  if (param == "S" ) {
    document.f1.Save.disabled=true;
  }
  }
  if (document.f1.Save.value=='Edit' ) {
   submitForm2(document.f1.refId.value);
  }
 }

if (param == "L") {
submitForm.location.replace('fin_lot_bill_entry_upd.jsp?refId='+refId+'&letRef='+letRef+'&letDt='+letDt+'&loginStn='+loginStn+'&empCd='+empCd+'&param='+param+'&finrecvdt='+finrecvdt) ;
  document.f1.Lock.disabled=true;
  document.f1.H1.value="L";
}
}
document.f1.Cancel.value="Back";
}

function submitForm2(refId) {
parent.submitForm2_P(refId);
document.f1.Cancel.value="Back";
}

function submitForm3(loginStn,empCd,refId,letRef,letDt,finrecvdt,param) {
if (document.f1.H1.value=='L') {
  if (document.f1.finRecDt.value==''){
    if(document.getElementById("Edit")!=null) {
     document.f1.Edit.value='Save' ;
    }
  }
  else {
     if ( isHigherDate(document.f1.finRecDt.value) ) {
      alert('Finance Received date Can Not Be Greater Than System Date ') ;
      document.f1.finRecDt.select() ;
      return false ;
     }
    if ( !compareDate(document.f1.letRefDt.value,document.f1.finRecDt.value)) {
      alert(' Finance Received Date Should Be Greater Than Letter Date ') ;
      document.f1.finRecDt.select() ;
      return false ;
    }
   param = 'F' ;
    submitForm.location.replace('fin_lot_bill_entry_upd.jsp?refId='+refId+'&letRef='+letRef+'&letDt='+letDt+'&loginStn='+loginStn+'&empCd='+empCd+'&param='+param+'&finrecvdt='+finrecvdt) ;
  }
}
parent.submitForm2_P(refId);
document.f1.Cancel.value="Back";
}


</SCRIPT>
</head>

<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>
<body>
<%
  String sEmpCd          = loginBean.getsEmpCd();
  String sOrdByNm        = loginBean.getsEmpFNm() + " " + loginBean.getsEmpLNm();
  String sLoginStn       = loginBean.getsGenStn();
  String sLoginStnNm     = loginBean.getsGenStnNm();
  String sLoginStnShrtNm = loginBean.getsLoginStnShrtNm();
  String sLoginDept      = loginBean.getsDept();
  String bill_ref_id     = new String();
  String finyr           = new String("");
  String sletref         = new String("");
  String sSysDate        = new String("");
  String qry             = new String("");
  String ssts            = new String("");
  String ssts1           = new String("");
  String sFinRcvDt       = new String("");
  int  cnt1 = 0 ;
  int  cnt2 = 0 ;


  String refId   = request.getParameter("refId");
  String stncd   = request.getParameter("stncd");



    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    PreparedStatement ps     = null;
    ResultSet         rs     = null;
    mk.con.setAutoCommit(false);

  if (sLoginStn.equals("042")) {
//System.out.println("SAIKAT  1234 " + sLoginStn ) ;

   if (stncd.equals("ALL")) {
     qry = " select station_cd     " + 
           " FROM orbl_fin_rcd_dt  " + 
           " WHERE bill_ref_id = ? " ;

     ps =  mk.con.prepareStatement(qry);

     ps.setString(1,refId);

     rs  = ps.executeQuery();

     while(rs.next()){
         sLoginStn = rs.getString("station_cd");
     }

      rs.close();
      ps.close();
//System.out.println("SAIKAT  12345678 " + sLoginStn + " refid " + refId) ;

   }
   else {
      sLoginStn = new String(stncd) ;
//System.out.println("SAIKAT  123456789101112 " + sLoginStn ) ;
   }
  }

 try{


   if (!refId.equals("0") && !refId.equals("Z")) {

     bill_ref_id  = refId;
     qry = " SELECT nvl(letter2finance_ref,' ') letter2finance_ref , to_char(letter2finance_dt,'DD-Mon-RRRR') letter2finance_dt , nvl(to_char(finrcd_dt,'DD-Mon-RRRR'),'@') finrcd_dt " + 
           " FROM orbl_fin_rcd_dt                         " + 
           " WHERE bill_ref_id = ?                        " +
           " AND   station_cd = ?                         " ;

     ps =  mk.con.prepareStatement(qry);

     ps.setString(1,bill_ref_id);
     ps.setString(2,sLoginStn);

     rs  = ps.executeQuery();

     while(rs.next()){
         sletref = rs.getString("letter2finance_ref");
         sSysDate = rs.getString("letter2finance_dt");
         sFinRcvDt = rs.getString("finrcd_dt");
     }

      rs.close();
      ps.close();

     qry = " SELECT nvl(sts,0) sts                        " + 
           " FROM orbl_fin_rcd_dt                         " + 
           " WHERE bill_ref_id = ?                        " +
           " AND   station_cd = ?                         " ;

     ps =  mk.con.prepareStatement(qry);

     ps.setString(1,bill_ref_id);
     ps.setString(2,sLoginStn);

     rs  = ps.executeQuery();

     while(rs.next()){
         ssts = rs.getString("sts");
     }

      rs.close();
      ps.close();

     qry = " select count(*) cnt from orbl_bill_dtl  " + 
           " where bill_ref_id =  ?               " ;

     ps =  mk.con.prepareStatement(qry);

     ps.setString(1,bill_ref_id);

     rs  = ps.executeQuery();

     while(rs.next()){
         cnt1 = rs.getInt("cnt");
     }

      rs.close();
      ps.close();

     qry = " select count(*) cnt from orbl_spbill_dtl  " + 
           " where bill_ref_id =  ?               " ;

     ps =  mk.con.prepareStatement(qry);

     ps.setString(1,bill_ref_id);

     rs  = ps.executeQuery();

     while(rs.next()){
         cnt2 = rs.getInt("cnt");
     }

      rs.close();
      ps.close();

      if (ssts.equals("0") && cnt1 == 0 && cnt2 == 0 ) {

        ssts = "2" ;

      }   
   }
   else if (refId.equals("0"))  {
  System.out.println("SNAG   1111 @@@@@@@  refId " + refId + " sLoginStn " + sLoginStn + " sLoginStnNm " + sLoginStnNm + " sLoginStnShrtNm " + sLoginStnShrtNm + " sLoginDept " + sLoginDept );

     ps = mk.con.prepareStatement(" UPDATE  ORBL_SEQ_MST     " 
                                + " SET refno=refno+1        "
                                + " WHERE genstn = ?         "
                                + " AND typ = 'BILREF'       " );

     ps.setString(1,sLoginStn) ;
     int stat = ps.executeUpdate();
     ps.close();


     qry = " SELECT refno refno FROM ORBL_SEQ_MST " + 
           " WHERE genstn= ?                " +
           " AND typ = 'BILREF' " ;

      
     ps =  mk.con.prepareStatement(qry);

     ps.setString(1,sLoginStn);
     rs  = ps.executeQuery();

     while(rs.next()){
          bill_ref_id  = rs.getString("refno");
     }

      rs.close();
      ps.close();

     qry = "SELECT  station_sht_desc FROM cd_station " + 
           " WHERE ORBL_STATION_CD = ?                " ;
      
     ps =  mk.con.prepareStatement(qry);

     ps.setString(1,sLoginStn);
     rs  = ps.executeQuery();

     while(rs.next()){
          sLoginStnShrtNm  = rs.getString("station_sht_desc");
     }

      rs.close();
      ps.close();

     qry = "SELECT  to_char(sysdate,'DD-Mon-RRRR') sysdt FROM DUAL " ; 
      
     ps =  mk.con.prepareStatement(qry);
     rs  = ps.executeQuery();

     while(rs.next()){
          sSysDate  = rs.getString("sysdt");
     }

      rs.close();
      ps.close();

     qry = " SELECT finance_finyr FROM FINNANCE_FINYR " +
           " WHERE to_date(?,'dd/mm/rr') between start_date AND  end_date " +
           " AND stn = ? "  ; 
      
     ps =  mk.con.prepareStatement(qry);

     ps.setString(1,sSysDate);
     ps.setString(2,sLoginStn);

     rs  = ps.executeQuery();

     while(rs.next()){
          finyr  = rs.getString("finance_finyr");
     }

      rs.close();
      ps.close();

     sletref = sLoginStnShrtNm + "/" + finyr + "/" + bill_ref_id ;
   }
   mk.con.commit();
   }
   catch(Exception ee){ ee.printStackTrace();}
        finally{System.out.println(" CCCCCC order_not_onetime.jsp CLOSED !!!"); mk.con.close(); }

%>

<form name="f1" method="post" action="">
<input type="hidden" name ="H1" value="N">
<table style="width: 80%; height: 100%" cellspacing="1" class="style1" align="center">
			<tr>
                                <td  width="15%" class="style5"> Ref Id </td>
                                <td width="15%"  class="style11">
                                        <label id="Label1" class="textbox" ><strong><%=bill_ref_id%></strong></label>
 
					<input name="refId" readonly class="textbox" type="hidden" size="8" tabindex="1" value='<%=bill_ref_id%>'/>&nbsp;
                                </td>
				<td width="20%" class="style5">Letter Ref</td>
                                <td width="50%" class="style10">
                                        <label id="Label2" class="textbox" ><strong><%=sletref%></strong></label>
					<input name="letref" readonly  type="hidden" size="36" tabindex="2" value='<%=sletref%>'/>&nbsp;
                                </td>
			</tr>
			<tr>
				<td width="15%" class="style5">Letter Date</td>
				<td width="15%" class="style11">
                                   <label id="Label3" class="textbox"  ><strong><%=sSysDate%></strong></label>
                                   <input name="letRefDt" type="hidden" class="textbox"  readonly size="10" tabindex="3" value='<%=sSysDate%>' />&nbsp;
                                </td>
<%
if (sFinRcvDt.equals("@")){
%>
				<td width="20%" class="style5">Finance Recv Dt</td>
				<td width="50%" class="style13" >
                                   <input name="finRecDt" type="text" size="10" tabindex="4"  onclick='scwShow(this,event);' />&nbsp;
                                </td>
<%
}
else{
%>
				<td width="20%" class="style5">Finance Recv Dt</td>
				<td width="50%" class="style13" >
                                   <input name="finRecDt" type="text" size="10" tabindex="4" value='<%=sFinRcvDt%>' onclick='scwShow(this,event);' />&nbsp;
                                </td>

<%
}
%>
			</tr>

			<tr>
                                <td width="50%" colspan="3" align="right" class="style6" >
<%
   if (refId.equals("0")) {
%>
				<input name="Save" id="Save" class="style12" type="button" value="Save" style="width: 91px" class="style4" 
                                onclick="submitForm1('<%=sLoginStn%>','<%=sEmpCd%>',document.f1.refId.value,
                                                    document.f1.letref.value,document.f1.letRefDt.value,document.f1.finRecDt.value,'S');"/>
<%
   }
   else {
%>
				<input name="Edit" id="Edit" class="style12" type="button" value="Edit" style="width: 91px" class="style4" 
                                onclick="submitForm3('<%=sLoginStn%>','<%=sEmpCd%>',document.f1.refId.value,
                                                  document.f1.letref.value,document.f1.letRefDt.value,document.f1.finRecDt.value,'S');"/>
<%
   }
%>
				<input name="Delete" class="style12" type="button" value="Delete" disabled style="width: 91px" class="style4" />
                                </td>
				<td width="50%" class="style6" >
				<input name="Cancel" class="style12" type="button" value="Cancel" tabindex="6" style="width: 87px" onclick="hideLotEntry();"/>
				<input name="Print" class="style12" disabled type="button" value="Print" tabindex="6" style="width: 87px" 
                                 onclick="window.open('bill_finance_letter.jsp?fin_ref_id_h='+document.f1.refId.value)"/>
                                </td>
			</tr>
			<tr>
<%
  if (ssts.equals("0"))  {
%>
				<td width="100%" colspan="4" class="style8" align="center">
		        	<input name="Lock" class="style7" type="button" value="Lock Bill Entry" 
                                onclick="submitForm1('<%=sLoginStn%>','<%=sEmpCd%>',document.f1.refId.value,
                                                    document.f1.letref.value,document.f1.letRefDt.value,document.f1.finRecDt.value,'L');"/>&nbsp;
                                </td>
<%
}
else if (ssts.equals("1")) {
%>
				<td width="100%" colspan="4" class="style8" align="center">
		        	<input name="Lock" class="style7" type="button" value="Lock Bill Entry" disabled
                                onclick="submitForm1('<%=sLoginStn%>','<%=sEmpCd%>',document.f1.refId.value,
                                                    document.f1.letref.value,document.f1.letRefDt.value,document.f1.finRecDt.value,'L');"/>&nbsp;
                                </td>


                               <SCRIPT type="text/javascript">
                                 document.f1.Print.disabled=false;
                                 submitForm2(document.f1.refId.value); 
                                 document.f1.H1.value="L";
                               </SCRIPT>
<%
}
else {
%>
				<td width="100%" colspan="4" class="style8" align="center">
		        	<input name="Lock" class="style7" type="button" value="Lock Bill Entry" disabled
                                onclick="submitForm1('<%=sLoginStn%>','<%=sEmpCd%>',document.f1.refId.value,
                                                    document.f1.letref.value,document.f1.letRefDt.value,document.f1.finRecDt.value,'L');"/>&nbsp;

                                </td>
<%
}
%>
			</tr>
</table>
</form>
<div id="divSubmit" class="hide"  style="width: 0px; height: 0px">
<iframe name="submitForm" src="fin_lot_bill_entry_upd.jsp?refId=0" class="autoHeight" width="98%" height="100%" scrolling="auto" framebo
rder="1" ></iframe>
</div>

<div id ="divalert" class="hide" style="filter:progid:DXImageTransform.Microsoft.Gradient(endColorstr='#FFFFFF', startColorstr='#8D7C54',gradientType='0');border-width: 4px;border-style:inset;border-color:red;width: 250; height: 50"  >
<TABLE width="100%">
 <tr>
 <td align="center" width="100%"><font color="443120"><b>Successfully Updated</b></font></td>
 </tr>
 <tr>
 <td align="center">
 <input type="button" value="OK" name="B2" onclick="hideAlert();">
 </td>
 </tr>
</TABLE>
</div>

<div id ="divalert_lock" class="hide" style="filter:progid:DXImageTransform.Microsoft.Gradient(endColorstr='#FFFFFF', startColorstr='#8D7C54',gradientType='0');border-width: 4px;border-style:inset;border-color:red;width: 250; height: 50"  >
<TABLE width="100%">
 <tr>
 <td align="center" width="100%"><font color="443120"><b>Bill has been Locked</b></font></td>
 </tr>
 <tr>
 <td align="center">
 <input type="button" value="OK" name="B2" onclick="hideAlert_lock();">
 </td>
 </tr>
</TABLE>
</div>

<div id ="divalert_err" class="hide" style="filter:progid:DXImageTransform.Microsoft.Gradient(endColorstr='#FFFFFF', startColorstr='#8D7C54',gradientType='0');border-width: 4px;border-style:inset;border-color:red;width: 250; height: 50"  >
<TABLE width="100%">
 <tr>
 <td align="center" width="100%"><font color="443120"><b>Error : Updatation Failed</b></font></td>
 </tr>
 <tr>
 <td align="center">
 <input type="button" value="OK" name="B2" onclick="hideAlert_err();">
 </td>
 </tr>
</TABLE>
</div>

</body>
</html>
