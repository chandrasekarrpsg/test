
<%@ page import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,java.text.*"%>
<%@ page import="java.util.*,java.io.*,java.lang.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%  response.setHeader("Content-Disposition", "attachment; filename=bill_spbill_selection_pg_xls.xls");%>


<html>
 <head>

<meta NAME="GENERATOR" Content="Microsoft FrontPage 3.0">

 <title>ORDER LETTER</title>
 <script type="text/javascript" src ="printSpl.js"></script>
<style type="text/css"> 
.hide {
   position:absolute ;
   top: -1000000px;
   left:-1000000px;
}
.showAlert {
   position:absolute ;
   top:100px;
   left:400px;
}
.showScrollTab {
   position:absolute ;
   top:370px;
   left:25px;
   }
.style1{
                background-color:#d6e3bc;
                font-family:Verdana;
                font-size:13px;
                font-weight:bold;
                text-align:center;
}
.style3{
				border-color: #BE8314;
				border-width: 1px;
				background-color: #DB9C3E;
				font-family: Verdana;
				font-size: x-small;
				color: #913022;
				font-weight: bold;
}
.style4{
                background-color:#b6dde8;
                font-family:Verdana;
                font-size:13px;
 
}
.style6 {
				border-color: #D5611C;
				border-width: 1px;
				background-color: #9EBFF1;
				font-family: Verdana;
				font-size: 13px;
				color: #4B02E3;
}
.style7 {
				border-color: #D5611C;
				border-width: 1px;
				background-color:#FFFF99;
				font-family: Verdana;
				font-size: 13px;
				color: #4B02E3;
}
</style>

<script type="text/javascript">

function showLotEntry(refId){
parent.showLotEntry_P(refId);
}

function disabBtnSub() {
if (document.F1.b1.disabled==false) {
  document.F1.b1.disabled=true;
  parent.enabDisabBtn();
}
}

function disabBtnSub_1() {
if (document.F1.b1.disabled==false) {
  document.F1.b1.disabled=true;
  parent.enabDisabBtn_1();
}
}

function selectCase(refId)
 {
  var j=0;
  var radio_val;
  var values='';
//alert(document.F1.elements.length-1);
     for(i=0;i<document.F1.elements.length-1;i++)
             {
               if(document.F1.elements[i].checked)
               {
//alert(i);
                 j=1;
                 radio_val=document.F1.elements[i].value;
                 //alert('HI   '+ refId +" " +  radio_val );
                 values=values+refId+','+radio_val+'|';
               }
             }
           if (j==0) {
             values=refId+',,|'; 
           }

         document.F1.D0.value=values;
 return true;
}

function hideAlert(){
 document.getElementById('divalert').className="hide";
 disabBtnSub();
}
function hideAlert_err(){
 document.getElementById('divalert_err').className="hide";
 //disabBtnSub();
}
function hideAlert_1(){
 document.getElementById('divalert_1').className="hide";
 disabBtnSub_1();
}
/*
function showAlert(){
 document.getElementById('divalert').className="showAlert";
}
function showAlert_1(){
 document.getElementById('divalert_1').className="showAlert";
}
function showAlert_err(){
 document.getElementById('divalert_err').className="showAlert";
}
*/




</script>

 </head>
<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>
<body>
<form name = "F1" action="bill_spbill_selection_pg_upd.jsp" target=ifrdivupd method="post">
<%
  String sEmpCd          = loginBean.getsEmpCd();
  String sOrdByNm        = loginBean.getsEmpFNm() + " " + loginBean.getsEmpLNm();
  String sLoginStn       = loginBean.getsGenStn();
  String sLoginStnNm     = loginBean.getsGenStnNm();
  String sLoginStnShrtNm = loginBean.getsLoginStnShrtNm();
  String sLoginDept      = loginBean.getsDept();

  String refId   = request.getParameter("refId");
  String stncd  = request.getParameter("stncd");

  if (sLoginStn.equals("042")) {

   if (stncd.equals("ALL")) {
      sLoginStn = new String("select distinct ORBL_STATION_CD from CD_STATION");
   }
   else {
      sLoginStn = new String(stncd) ;
   }
  }


  System.out.println("SAIKAT   START_DATE "+refId);

   if (!refId.equals("0") & !refId.equals("")) {



    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    PreparedStatement ps     = null;
    ResultSet         rs     = null;
    mk.con.setAutoCommit(false);


    String tot_bill_cnt             = new String("");
    String bill_id                  = new String("");
    String bill_no                  = new String("");
    String bill_date                = new String("");
    String bill_amount              = new String("");
    String vendor_name              = new String("");
    String annex                    = new String("");
    String check_val                = new String("");
    String bill_ref_id              = new String("");
    String budget_head   = new String("");
    String dept          = new String("");
    String budget_tp     = new String("");
    int srl = 0;


    try{
%>
      <DIV STYLE="overflow: auto;width: 975px;top:33px;left:10px;
                   border-left: 1px gray solid; border-bottom: 1px gray solid; border-right: 1px gray solid;
                   padding:0px; margin: 0px">
      <table border="1" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#111111">
      <tr>
      <td width="3%" class="style3" align="center">Srl</td>
      <td width="10%" class="style3" align="center">Bill Id</td>
      <td width="20%" class="style3" align="center">Bill No</td>
      <td width="10%" class="style3" align="center">Bill Dt</td>
      <td width="8%" class="style3" align="center">Amt(Rs.)</td>
      <td width="31%" class="style3" align="center">Vendor</td>
      <td width="5%" class="style3" align="center">BgtHd</td>
      <td width="5%" class="style3" align="center">Dept</td>
      <td width="5%" class="style3" align="center">BgtTp</td>
      <td width="3%" class="style3" align="center">Incl.</td>
      </tr>
      </table>
      </div>
 <% 
    String qry            = new String("");
    String sts            = new String("");

    qry = " SELECT sts FROM  ORBL_FIN_RCD_DT WHERE BILL_REF_ID = ? " ;

        ps =  mk.con.prepareStatement(qry);

        ps.setString(1,refId);
	
        rs    = ps.executeQuery();
        while(rs.next()){
            sts   = rs.getString("sts");
        }

	rs.close();
	ps.close();
    

    if (  sLoginStn.equals("019")) {


    if (sts.equals("0")) {

    qry = " SELECT bill_id1, bill_id,BILL_NO,bill_date,bill_amount,VENDOR_NAME,annex,check_val,BILL_REF_ID,budget_head,dept,budget_tp FROM ( " +
          " SELECT bill_id bill_id1,'N-'||TO_CHAR(BILL_ID)||DECODE(URGENT_PAYMENT,'Y','*','')  bill_id ,  " +
          " NVL(trim(b.BILL_NO),' ') BILL_NO,                                          " +
	  " TO_CHAR(BILL_DATE,'DD-MON-RRRR') bill_date,                                " +
	  " TO_CHAR(bill_amount,'99999999990.99')bill_amount,                          " +
	  " trim(v.VENDOR_NAME) VENDOR_NAME,                                           " +
	  " nvl(substr(trim(o.ANNEX),1,20),' ') annex,                                 " +
	  " 'N'||','||BILL_ID check_val,                                               " + 
	  " TO_CHAR(NVL(BILL_REF_ID,0)) BILL_REF_ID,                                   " + 
          " o.BUDGET_HEAD BUDGET_HEAD ,x.DEPT_SDESC  DEPT ,y.BUDGET_TP  Budget_tp      " +
          " FROM ORBL_BILL_DTL b ,orbl_ord_dtl o ,orbl_vendor_mst  v ,ORBL_CD_DEPT_MST x,ORBL_HEADS  y                         " + 
          " WHERE b.ORDER_ID=o.ORDER_ID                                                " +
          " AND o.VENDOR_CODE=v.VENDOR_CODE                                            " +
          " AND NVL(b.BILL_REF_ID,0) IN (0,?)                                          " +
          " AND  NVL(b.BILL_CANCEL,'Z') !='Y'                                          " +
          " AND o.dept= '30'                                                           " +
          " AND o.DEPT=x.DEPT                                                          " +
          " AND b.station=x.station                                                    " + 
	  " AND  o.BUDGET_HEAD=y.BUDGET_HEAD                                           " + 
          " UNION                                                                      " +
          " SELECT billref bill_id1,'S-'|| TO_CHAR(BILLREF)||DECODE(URGENT_PAYMENT,'Y','*','') bill_id, " +
          " NVL(trim(b.BILL_NO),' ') BILL_NO,                                          " +
          " TO_CHAR(BILL_DT,'DD-MON-RRRR') bill_date,                                  " +
          " TO_CHAR(BILL_AMT,'9999999990.99')bill_amount,                              " +
          " trim(v.VENDOR_NAME) VENDOR_NAME,                                           " +
          " ' ' annex,                                                                 " +
          " 'S'||','||BILLREF  check_val,                                              " +
          " TO_CHAR(NVL(BILL_REF_ID,0)) BILL_REF_ID,                                   " +
          " b.BUDG_AC BUDGET_HEAD ,x.DEPT_SDESC  DEPT ,y.BUDGET_TP  Budget_tp          " + 
          " FROM ORBL_SPBILL_DTL b ,orbl_vendor_mst  v ,ORBL_CD_DEPT_MST x,ORBL_HEADS  y              " +
          " WHERE b.VENDOR=v.VENDOR_CODE                                               " + 
          " AND  NVL(b.BILL_CANCEL,'Z') !='Y'                                          " +
          " AND NVL(b.BILL_REF_ID,0) IN (0,?) AND b.dept= '30'   AND b.DEPT=x.DEPT     " +
	  " AND b.station=x.station                                                    " +
	  " AND  b.BUDG_AC=y.BUDGET_HEAD )A                                            " +
          " order by bill_id1                                                          " ;
    }
    else{
    qry = " SELECT bill_id1, bill_id,BILL_NO,bill_date,bill_amount,VENDOR_NAME,annex,check_val,BILL_REF_ID,budget_head,dept,budget_tp FROM ( " +
          " SELECT bill_id bill_id1,'N-'||TO_CHAR(BILL_ID)||DECODE(URGENT_PAYMENT,'Y','*','')  bill_id ,  " +
          " NVL(trim(b.BILL_NO),' ') BILL_NO,                                          " +
	  " TO_CHAR(BILL_DATE,'DD-MON-RRRR') bill_date,                                " +
	  " TO_CHAR(bill_amount,'99999999990.99')bill_amount,                          " +
	  " trim(v.VENDOR_NAME) VENDOR_NAME,                                           " +
	  " nvl(substr(trim(o.ANNEX),1,20),' ') annex,                                 " +
	  " 'N'||','||BILL_ID check_val,                                               " + 
	  " TO_CHAR(NVL(BILL_REF_ID,0)) BILL_REF_ID,                                   " + 
          " o.BUDGET_HEAD BUDGET_HEAD ,x.DEPT_SDESC  DEPT ,y.BUDGET_TP  Budget_tp     " +
          " FROM ORBL_BILL_DTL b ,orbl_ord_dtl o ,orbl_vendor_mst  v,ORBL_CD_DEPT_MST x,ORBL_HEADS  y                       " + 
          " WHERE b.ORDER_ID=o.ORDER_ID                                                " +
          " AND o.VENDOR_CODE=v.VENDOR_CODE                                            " +
          " AND  NVL(b.BILL_CANCEL,'Z') !='Y'                                          " +
          " AND NVL(b.BILL_REF_ID,0) IN (?)                                          " +
          " AND o.dept= '30'                                                           " +
          " AND o.DEPT=x.DEPT                                                                 " + 
          " AND b.station=x.station                                                    " +                                             
          " AND  o.BUDGET_HEAD=y.BUDGET_HEAD                                            " +
          " UNION                                                                      " +
          " SELECT billref bill_id1,'S-'|| TO_CHAR(BILLREF)||DECODE(URGENT_PAYMENT,'Y','*','') bill_id, " +
          " NVL(trim(b.BILL_NO),' ') BILL_NO,                                          " +
          " TO_CHAR(BILL_DT,'DD-MON-RRRR') bill_date,                                  " +
          " TO_CHAR(BILL_AMT,'9999999990.99')bill_amount,                              " +
          " trim(v.VENDOR_NAME) VENDOR_NAME,                                           " +
          " ' ' annex,                                                                 " +
          " 'S'||','||BILLREF  check_val,                                              " +
          " TO_CHAR(NVL(BILL_REF_ID,0)) BILL_REF_ID,                                   " +
          " b.BUDG_AC BUDGET_HEAD ,x.DEPT_SDESC  DEPT ,y.BUDGET_TP  Budget_tp          " +
          " FROM ORBL_SPBILL_DTL b ,orbl_vendor_mst  v,ORBL_CD_DEPT_MST x,ORBL_HEADS  y    " +
          " WHERE b.VENDOR=v.VENDOR_CODE                                               " + 
          " AND  NVL(b.BILL_CANCEL,'Z') !='Y'                                          " +
          " AND NVL(b.BILL_REF_ID,0) IN (?) AND b.dept= '30' AND b.DEPT=x.DEPT       " +
          " AND b.station=x.station                                                     " + 
          " AND  b.BUDG_AC=y.BUDGET_HEAD)A                                             " +
          " order by bill_id1                                                          " ;

      }


				                    
    
        ps =  mk.con.prepareStatement(qry);

        ps.setString(1,refId);
        ps.setString(2,refId);


    }
    else {


    if (sts.equals("0")) {
    qry = " SELECT bill_id1, bill_id,BILL_NO,bill_date,bill_amount,VENDOR_NAME,annex,check_val,BILL_REF_ID,budget_head,dept,budget_tp FROM ( " +
          " SELECT bill_id bill_id1,'N-'||TO_CHAR(BILL_ID)||DECODE(URGENT_PAYMENT,'Y','*','')  bill_id ,  " +
          " NVL(trim(b.BILL_NO),' ') BILL_NO,                                          " +
	  " TO_CHAR(BILL_DATE,'DD-MON-RRRR') bill_date,                                " +
	  " TO_CHAR(bill_amount,'99999999990.99')bill_amount,                          " +
	  " trim(v.VENDOR_NAME) VENDOR_NAME,                                           " +
	  " nvl(substr(trim(o.ANNEX),1,20),' ') annex,                                 " +
	  " 'N'||','||BILL_ID check_val,                                               " + 
	  " TO_CHAR(NVL(BILL_REF_ID,0)) BILL_REF_ID,                                   " + 
          " o.BUDGET_HEAD BUDGET_HEAD ,x.DEPT_SDESC  DEPT ,y.BUDGET_TP  Budget_tp     " +
          " FROM ORBL_BILL_DTL b ,orbl_ord_dtl o ,orbl_vendor_mst  v ,ORBL_CD_DEPT_MST x,ORBL_HEADS  y                  " + 
          " WHERE b.ORDER_ID=o.ORDER_ID                                                " +
          " AND o.VENDOR_CODE=v.VENDOR_CODE                                            " +
          " AND  NVL(b.BILL_CANCEL,'Z') !='Y'                                          " +
          " AND NVL(b.BILL_REF_ID,0) IN (0,?)                                          " +
          " AND b.station in ( " + sLoginStn + " )                                     " +
          " AND o.DEPT=x.DEPT                                                          " +   
          " AND b.station=x.station                                                    " +
          " AND  o.BUDGET_HEAD=y.BUDGET_HEAD                                           " +
          " UNION                                                                      " +
          " SELECT billref bill_id1,'S-'|| TO_CHAR(BILLREF)||DECODE(URGENT_PAYMENT,'Y','*','') bill_id, " +
          " NVL(trim(b.BILL_NO),' ') BILL_NO,                                          " +
          " TO_CHAR(BILL_DT,'DD-MON-RRRR') bill_date,                                  " +
          " TO_CHAR(BILL_AMT,'9999999990.99')bill_amount,                              " +
          " trim(v.VENDOR_NAME) VENDOR_NAME,                                           " +
          " ' ' annex,                                                                 " +
          " 'S'||','||BILLREF  check_val,                                              " +
          " TO_CHAR(NVL(BILL_REF_ID,0)) BILL_REF_ID ,                                  " +
          "  b.BUDG_AC BUDGET_HEAD ,x.DEPT_SDESC  DEPT ,y.BUDGET_TP  Budget_tp    " +
          " FROM ORBL_SPBILL_DTL b ,orbl_vendor_mst  v  ,ORBL_CD_DEPT_MST x,ORBL_HEADS  y                               " +
          " WHERE b.VENDOR=v.VENDOR_CODE                                               " + 
          " AND  NVL(b.BILL_CANCEL,'Z') !='Y'                                          " +
          " AND NVL(b.BILL_REF_ID,0) IN (0,?) AND b.station in ( " + sLoginStn + " ) AND b.DEPT=x.DEPT       " +
          " AND b.station=x.station                                                     " +
          " AND  b.BUDG_AC=y.BUDGET_HEAD )A                      " +
          " order by bill_id1                                                          " ;
    }
    else {
    qry = " SELECT bill_id1, bill_id,BILL_NO,bill_date,bill_amount,VENDOR_NAME,annex,check_val,BILL_REF_ID,budget_head,dept,budget_tp FROM ( " +
          " SELECT bill_id bill_id1,'N-'||TO_CHAR(BILL_ID)||DECODE(URGENT_PAYMENT,'Y','*','')  bill_id ,  " +
          " NVL(trim(b.BILL_NO),' ') BILL_NO,                                          " +
	  " TO_CHAR(BILL_DATE,'DD-MON-RRRR') bill_date,                                " +
	  " TO_CHAR(bill_amount,'99999999990.99')bill_amount,                          " +
	  " trim(v.VENDOR_NAME) VENDOR_NAME,                                           " +
	  " nvl(substr(trim(o.ANNEX),1,20),' ') annex,                                 " +
	  " 'N'||','||BILL_ID check_val,                                               " + 
	  " TO_CHAR(NVL(BILL_REF_ID,0)) BILL_REF_ID,                                   " + 
          "  o.BUDGET_HEAD BUDGET_HEAD ,x.DEPT_SDESC  DEPT ,y.BUDGET_TP  Budget_tp     " +
          " FROM ORBL_BILL_DTL b ,orbl_ord_dtl o ,orbl_vendor_mst  v ,ORBL_CD_DEPT_MST x,ORBL_HEADS  y                    " + 
          " WHERE b.ORDER_ID=o.ORDER_ID                                                " +
          " AND o.VENDOR_CODE=v.VENDOR_CODE                                            " +
          " AND  NVL(b.BILL_CANCEL,'Z') !='Y'                                          " +
          " AND NVL(b.BILL_REF_ID,0) IN (?)                                            " +
          " AND b.station in ( " + sLoginStn + " )                                     " +
          " AND o.DEPT=x.DEPT                                                          " + 
          " AND b.station=x.station                                                    " +
          " AND  o.BUDGET_HEAD=y.BUDGET_HEAD                                           " +
          " UNION                                                                      " +
          " SELECT billref bill_id1,'S-'|| TO_CHAR(BILLREF)||DECODE(URGENT_PAYMENT,'Y','*','') bill_id, " +
          " NVL(trim(b.BILL_NO),' ') BILL_NO,                                          " +
          " TO_CHAR(BILL_DT,'DD-MON-RRRR') bill_date,                                  " +
          " TO_CHAR(BILL_AMT,'9999999990.99')bill_amount,                              " +
          " trim(v.VENDOR_NAME) VENDOR_NAME,                                           " +
          " ' ' annex,                                                                 " +
          " 'S'||','||BILLREF  check_val,                                              " +
          " TO_CHAR(NVL(BILL_REF_ID,0)) BILL_REF_ID,                                   " +
          " b.BUDG_AC BUDGET_HEAD ,x.DEPT_SDESC  DEPT ,y.BUDGET_TP  Budget_tp          " + 
          " FROM ORBL_SPBILL_DTL b ,orbl_vendor_mst  v,ORBL_CD_DEPT_MST x,ORBL_HEADS  y " +
          " WHERE b.VENDOR=v.VENDOR_CODE                                               " + 
          " AND  NVL(b.BILL_CANCEL,'Z') !='Y'                                          " +
          " AND NVL(b.BILL_REF_ID,0) IN (?) AND b.station in ( " + sLoginStn + " )  AND b.DEPT=x.DEPT       " +
          " AND b.station=x.station                                                       " +
          " AND  b.BUDG_AC=y.BUDGET_HEAD )A          " +
          " order by bill_id1                                                          " ;

     } 


				                    
    
        ps =  mk.con.prepareStatement(qry);

        ps.setString(1,refId);
        ps.setString(2,refId);

        }
	
        rs    = ps.executeQuery();
%>

       <DIV STYLE="overflow: auto;width: 990px; height: 230px;top:33px;left:10px;
                   border-left: 1px gray solid; border-bottom: 1px gray solid; border-right: 1px gray solid;
                   padding:0px; margin: 0px">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#804040" style="border-collapse: collapse">
<%


        while(rs.next()){
                         srl =  srl + 1 ;
                         bill_id       = rs.getString("bill_id");
                         bill_no       = rs.getString("bill_no");
                         bill_date     = rs.getString("bill_date");
                         bill_amount   = rs.getString("bill_amount");
                         vendor_name   = rs.getString("vendor_name");
                         annex         = rs.getString("annex");
                         check_val     = rs.getString("check_val");
                         bill_ref_id   = rs.getString("bill_ref_id");
                         budget_head   = rs.getString("budget_head");
                         dept          = rs.getString("dept");
                         budget_tp     = rs.getString("budget_tp");

if ( bill_ref_id.equals("0") ) {
%>
      <tr>
       <td width="3%"  class="style7" align="center"><%=srl%></td>
       <td width="10%" class="style7" align="center"><%=bill_id%></td>
       <td width="20%" class="style7" align="center"><%=bill_no%></td>
       <td width="10%" class="style7" align="center"><%=bill_date%></td>
       <td width="8%" class="style7" align="right"><%=bill_amount%></td>
       <td width="31%" class="style7" align="center"><%=vendor_name%></td>
       <td width="5%"  class="style7" align="center"><%=budget_head%></td>
       <td width="5%"  class="style7" align="center"><%=dept%></td>
       <td width="5%"  class="style7" align="center"><%=budget_tp%></td>
       <td width="3%"  class="style7" align="center"><input type="checkbox" name="<%=check_val%>" value="<%=check_val%>" </td>
      </tr>
<%
    }
    else{
%>
      <tr>
       <td width="3%"  class="style6" align="center"><%=srl%></td>
       <td width="10%" class="style6" align="center"><%=bill_id%></td>
       <td width="20%" class="style6" align="center"><%=bill_no%></td>
       <td width="10%" class="style6" align="center"><%=bill_date%></td>
       <td width="8%" class="style6" align="right"><%=bill_amount%></td>
       <td width="31%" class="style6" align="center"><%=vendor_name%></td>
       <td width="5%" class="style6" align="center"><%=budget_head%></td>
       <td width="5%" class="style6" align="center"><%=dept%></td>
       <td width="5%" class="style6" align="center"><%=budget_tp%></td>
       <td width="3%"  class="style6" align="center"><input type="checkbox" name="<%=check_val%>" value="<%=check_val%>" checked="checke
d"</td>
      </tr>

<%
        }

   }
%>
<%
	rs.close();
	ps.close();

%>
     </table>
     </DIV>

<%

      }catch(Exception ee){ ee.printStackTrace();}
         finally{System.out.println(" CCCCCC bill_spbill_selection_pg.jsp CLOSED !!!"); mk.con.close(); }

}
%>
<input type="hidden" name="D0" />
</form>


<!--div id ="divalert" class="hide" style="filter:progid:DXImageTransform.Microsoft.Gradient(endColorstr='#FFFFFF', startColorstr='#8D7C54',gradientType='0');border-width: 4px;border-style:inset;border-color:red;width: 250; height: 50"  >
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

<div id ="divalert_1" class="hide" style="filter:progid:DXImageTransform.Microsoft.Gradient(endColorstr='#FFFFFF', startColorstr='#8D7C54',gradientType='0');border-width: 4px;border-style:inset;border-color:red;width: 250; height: 50"  >
<TABLE width="100%">
 <tr>
 <td align="center" width="100%"><font color="443120"><b>Successfully Updated.</b></font></td>
 </tr>
 <tr>
 <td align="center">
 <input type="button" value="OK" name="B2" onclick="hideAlert_1();">
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
</div -->

</body>
</html>
