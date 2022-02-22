<%@ page language="java" %>
<%@ page contentType="application/vnd.ms-excel" %>
<%@ page import="java.io.*,javax.servlet.jsp.*,javax.ejb.EJB,javax.naming.*,java.util.*,java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="oracle.sql.*" %>
<%@ page import="oracle.jdbc.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<html>

<head>
<style type="text/css">

   .style1 {
	border-collapse: collapse;
	font-family: Arial;
	font-size: x-small;
   }
   .style2 {
        border-bottom: 1px solid #000000;
        border-top: 0px solid #000000;
	font-family: Calibri;
	font-size: x-small;
   }
   .style3 {
	text-align: center;
	color: #FFFFFF;
	font-size: small;
	border-width: 0;
	background-color: #002851;
   }
   .style4 {
	text-align: center;
	border-width: 0;
	background-color: #F0D8B3;
   }
   .style5 {
	font-size: small;
   }
   .style6 {
	border-width: 0;
	text-align: center;
   }
   .style7 {
	color: #C53121;
   }
   .style9 {
	font-family: Arial;
	font-size: small;
   }
   .style10 {
	text-align: center;
	font-size: x-small;
	background-color: #D8D8B1;
	font-family: Calibri;
        border: 1px solid #000000;

   }
   .style11 {
	text-align: left;
	font-size: x-small;
	background-color: #D8D8B1;
	font-family: Calibri;
        border: 1px solid #000000;
   }
   .style12 {
	text-align: right;
	font-size: x-small;
	background-color: #D8D8B1;
	font-family: Calibri;
        border: 1px solid #000000;
   }
   .style16 {
	border-width: 0;
	background-color: #D8D8B1;
	text-align: right;
	font-size: x-small;
   }
   .style19 {
	font-family: Calibri;
   }
   .style21 {
	border-width: 0;
	text-align: center;
	font-size: x-small;
	background-color: #D8D8B1;
	font-family: Calibri;
   }
   .style22 {
        border-top: 1px solid #000000;
        border-bottom: 0px solid #000000;
	font-family: Calibri;
	font-size: x-small;
   }
   .style23 {
        border: 1px solid #000000;
	font-family: Calibri;
	font-size: x-small;
   }

   .text_box1 {

    background-color:transparent;
    font-family:Calibri;
    font-size:xx-small;
    text-align:center;
    border:0px;
   
   }

   #fixed-div {

  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  height: 100px;
  background-color: #000;

  }

  .style30{

     width: 120px; 
     text-align: center; 
     border-right: 1px solid #000000;
  
  }

  .style31{

     width: 120px; 
     text-align: center; 
     border-right: 1px solid #000000;

  }


  .style32{

     width: 50px; 
     text-align: center; 
     border-right: 1px solid #000000;
     mso-number-format:General;

  }

  .style33{

     width: 200px; 
     text-align: center; 
     border-right: 1px solid #000000;

  }

  .style34{

     width: 60px; 
     text-align: center; 
     border-right: 1px solid #000000;
     mso-number-format:0.000;

  }

</style>
</head>

<body >

<%

  PreparedStatement ps1=null;
  ResultSet rs1=null;
  MakeConnectionGENORBL mk = null;

  String sBgt_Fr_Year             = new String("");
  String sBgt_Fr_YY               = new String("");
  String sBgt_To_Year             = new String("");
  String sBgt_To_YY               = new String("");
  String sSl_No_row_val           = new String("");
  String sSl_No_row_span          = new String("");
  String sBgt_Hd_Rowval           = new String("");
  String sBgt_Desc                = new String("");
  String sSubt_Mkr                = new String("");
  String sTr_Bg_Color             = new String("");
  String sBgt_seq                 = new String("");
  String sAmt_NA_mkr              = new String("");
  String sStrt_Bgt_seq_for_grp    = new String("");
  String sEnd_Bgt_seq_for_grp     = new String("");
  String sCell_Id_for_exstngVal   = new String("");
  String sJustMkr                 = new String("");
  String sGenStn                  = new String("");
  String sInsUpdMkr               = new String("");
  String sPub_mkr                 = new String("");
  String sBgt_fnl                 = new String("");
  String sReadOnlyMkr             = new String("");
  String sDisableB1Mkr            = new String("");
  String sDisableB2Mkr            = new String("");
  String sDisableB3Mkr            = new String("");
  String sSendToSuperiorDt        = new String("");
  String sSecDesc                 = new String("");
  String sDate                    = new String("");
  String sEmpDesg                 = new String("");
  String sBgt_lvl                 = new String("");
  String sSec_cd                  = new String("");
  String sUsername                = new String("");
  String sStn_cd                  = new String("");
  String sIp_ecode                = new String("");
  String attr                     = new String("");
  String sSl_No_roworder          = new String("");
  String sBgt_Hd_Roworder         = new String("");
  String sBgt_Grp_Rowval          = new String("");
  String sBgt_Grp_Roworder        = new String("");
  String sAuth_Exist              = new String("");
  String sAuth_Flag               = new String("");

  int iBgt_Hd_Roworder = 0;
  int iGrp_sl_no = 0; 
  int iGrp_sub_sl_no = 0; 
  int iLineNo = 0; 
  int iGrp_index = 0; 
  int i_g_y_cell_index = 0; 
  int iRowExists = 0; 
  int iUsername = 0; 

  List l1 = new ArrayList() ;
  List l2 = new ArrayList() ;
  List rows = new ArrayList() ;
  List rows1 = new ArrayList() ;
  List rows2 = new ArrayList() ;
  List detailList = new ArrayList() ;
  int i = 0 ;
  int j = 0 ;
  int totrec = 0 ;
  int icnt = 0; 

  String sColColors[] = {"#FFFF6F","#85D1FA","#AF64E1","#AF64E1","#EAB668"}; 
  try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);

     System.out.println("generation_budget_de_bbgs_forexcel.jsp opened"+request.getRemoteAddr());

     sBgt_Fr_Year = request.getParameter("T1");
     sStn_cd      = request.getParameter("stn_cd");
     sSec_cd      = request.getParameter("sec_cd");
     sGenStn      = request.getParameter("stn_long_desc");
     sSecDesc     = request.getParameter("sec_cd");

     sBgt_To_Year = Integer.toString((Integer.parseInt(sBgt_Fr_Year))+1);
     sBgt_Fr_YY = sBgt_Fr_Year.substring(2);
     sBgt_To_YY = sBgt_To_Year.substring(2);
     iUsername = iUsername+1;

     ps1=mk.con.prepareStatement(" SELECT TO_CHAR(TRUNC(SYSDATE),'DD-MON-RRRR')  "+
                                 " FROM DUAL ");

     rs1=ps1.executeQuery();

     while(rs1.next()){

         sDate    = rs1.getString(1);
 
     }

     rs1.close();
     ps1.close();
     rs1 = null;
     ps1 = null;


%>

<div id=fixed_div>
<table style="width: 100%" class="style1">
	<tr>
		<td class="style3" colspan="2"><strong>&nbsp;</strong></td>
		<td class="style3" colspan="17" align="center"><strong>Cash Flow Statement : <%= sBgt_Fr_Year %> - <%= sBgt_To_Year %></strong></td>
		<td class="style3" colspan="37" align="center">&nbsp;</strong></td>
	</tr>
	<tr>
		<td class="style4" colspan="2"><strong><span class="style5"><%= sDate %></strong></td>
		<td class="style4" colspan="17" align="center"><strong><span class="style5"><%= sGenStn %></span> </strong></td>
		<td class="style4" colspan="37" align="center">&nbsp;</strong></td>
	</tr>
	<tr>
		<td colspan="2" class="style6"><strong><span class="style7">Form 2B</span></strong></td>
		<td colspan="17" align="center" ><strong><span class="style7">SEC CODE : <%= sSecDesc %></span></strong></td>
		<td class="style6" colspan="37" align="center">&nbsp;</strong></td>
	</tr>
	<tr >
		<td colspan="2" ><strong><span >&nbsp;</span></strong></td>
		<td colspan="17" align="center"><strong><span style="color:#620425">All Amount Values are in Rs. Lakhs</span></strong></td>
		<td colspan="37" align="center">&nbsp;</strong></td>
	</tr>
</table>

<table style="width: 100%" >

<tr class="style22" style=background-color:'#FFD6C1';>
  <td class="style30">&nbsp;</td>
  <td class="style31">&nbsp;</td>
  <td class="style32">&nbsp;</td>
  <td class="style33">&nbsp;</td>

  <td class="style33">Apr</td>
  <td class="style33">Apr</td>
  <td class="style33">Apr</td>
  <td class="style33">Apr</td>

  <td class="style33">May</td>
  <td class="style33">May</td>
  <td class="style33">May</td>
  <td class="style33">May</td>

  <td class="style33">Jun</td>
  <td class="style33">Jun</td>
  <td class="style33">Jun</td>
  <td class="style33">Jun</td>

  <td class="style33">Jul</td>
  <td class="style33">Jul</td>
  <td class="style33">Jul</td>
  <td class="style33">Jul</td>

  <td class="style33">Aug</td>
  <td class="style33">Aug</td>
  <td class="style33">Aug</td>
  <td class="style33">Aug</td>

  <td class="style33">Sep</td>
  <td class="style33">Sep</td>
  <td class="style33">Sep</td>
  <td class="style33">Sep</td>

  <td class="style33">Oct</td>
  <td class="style33">Oct</td>
  <td class="style33">Oct</td>
  <td class="style33">Oct</td>

  <td class="style33">Nov</td>
  <td class="style33">Nov</td>
  <td class="style33">Nov</td>
  <td class="style33">Nov</td>

  <td class="style33">Dec</td>
  <td class="style33">Dec</td>
  <td class="style33">Dec</td>
  <td class="style33">Dec</td>

  <td class="style33">Jan</td>
  <td class="style33">Jan</td>
  <td class="style33">Jan</td>
  <td class="style33">Jan</td>

  <td class="style33">Feb</td>
  <td class="style33">Feb</td>
  <td class="style33">Feb</td>
  <td class="style33">Feb</td>

  <td class="style33">Mar</td>
  <td class="style33">Mar</td>
  <td class="style33">Mar</td>
  <td class="style33">Mar</td>

  <td class="style33">Total</td>
  <td class="style33">Total</td>
  <td class="style33">Total</td>
  <td class="style33">Total</td>

</tr>
<tr class="style2" style=background-color:'#FFD6C1';>
  <td class="style30">Head </td>
  <td class="style31">Group </td>
  <td class="style32">SubHead </td>
  <td class="style33">Descriptions </td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

  <td class="style33">Unit1-2</td>
  <td class="style33">Unit3</td>
  <td class="style33">Common</td>
  <td class="style33">Total</td>

</tr>

<%

         ps1 = mk.con.prepareStatement(" SELECT BGT_HD_ROWORDER, "+
                                      " BGT_GRP_ROWORDER,"+                          
                                      " BGT_SUBHD_ROWORDER,"+                          
                                      " NVL(BGT_HD_ROWVAL,' '), "+
                                      " NVL(BGT_GRP_ROWVAL,' '), "+
                                      " REPLACE ('<span style='||CHR(34)||'font-weight:lighter;background-color:#'|| "+ 
                                      "           (SELECT COLOR_HEX "+
                                      "            FROM BGT_COLOR "+
                                      "            WHERE COLOR_CD=NVL(DESC1_B_COLOR,1))||'; color:#'|| "+
                                      "           (SELECT COLOR_HEX "+
                                      "             FROM BGT_COLOR "+
                                      "            WHERE COLOR_CD=NVL(DESC1_F_COLOR,1))||CHR(34)||'>'||NVL(DESC1,' ')||'</span>','\"',' ') Budg_Desc ,"+
                                      " NVL(SUBT_MKR,'NE'), "+
                                      " (SELECT COLOR_HEX "+
                                      " FROM BGT_COLOR "+
                                      " WHERE COLOR_CD=NVL(DESC1_B_COLOR,1)) TD_BG_COLOR, "+
                                      " BGT_SEQ, "+
                                      " NVL(TRIM(AMT_NA),'NE'), "+
                                      " DECODE(DESC_JUST,'L','left','R','right','C','center','left'), "+
                                      " REPLACE(NVL(BGT_SUBHD_ROWVAL,' '),'e','e ') "+
                                      " FROM BGT_FORM2B_STRUC_BBGS "+
                                      " WHERE NVL(TRIM(BGT_TO_YR),'@@')= '@@' "+
                                      " ORDER BY BGT_HD_ROWORDER,BGT_GRP_ROWORDER,BGT_SUBHD_ROWORDER ");
                                      
        rs1=ps1.executeQuery();

     System.out.println("8888");
        while(rs1.next()){

      icnt = icnt+1;
/**** New Code Start ***/

              rows = new ArrayList() ;

              rows.add(rs1.getString(1)) ;
              rows.add(rs1.getString(2)) ;
              rows.add(rs1.getString(3)) ;
              rows.add(rs1.getString(4)) ;
              rows.add(rs1.getString(5)) ;
              rows.add(rs1.getString(6)) ;
              rows.add(rs1.getString(7)) ;
              rows.add(rs1.getString(8)) ;
              rows.add(rs1.getString(9)) ;
              rows.add(rs1.getString(10)) ;
              rows.add(rs1.getString(11)) ;
              rows.add(rs1.getString(12)) ;

              l1.add(rows);

 //System.out.println("ADDING XXXX"+rs1.getString(6));

/**** New Code End ***/
                 
                       iLineNo = iLineNo + 1;

         } 
         rs1.close();
         ps1.close();

         rs1 = null;
         ps1 = null;

         ps1=mk.con.prepareStatement("SELECT B.bgt_hd_roworder,bgt_grp_roworder,bgt_subhd_roworder,B.bgt_seq, "
                                   + " MAX(CASE WHEN A.mm_order = 1 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) apr12, "
                                   + " MAX(CASE WHEN A.mm_order = 1 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) apr3, "
                                   + " MAX(CASE WHEN A.mm_order = 1 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) aprc, "
                                   + " MAX(CASE WHEN A.mm_order = 1 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) aprtot, "
                                   + " MAX(CASE WHEN A.mm_order = 2 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) may12, "
                                   + " MAX(CASE WHEN A.mm_order = 2 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) may3, "
                                   + " MAX(CASE WHEN A.mm_order = 2 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) mayc, "
                                   + " MAX(CASE WHEN A.mm_order = 2 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) maytot, "
                                   + " MAX(CASE WHEN A.mm_order = 3 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) jun12, "
                                   + " MAX(CASE WHEN A.mm_order = 3 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) jun3, "
                                   + " MAX(CASE WHEN A.mm_order = 3 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) junc, "
                                   + " MAX(CASE WHEN A.mm_order = 3 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) juntot, "
                                   + " MAX(CASE WHEN A.mm_order = 4 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) jul12, "
                                   + " MAX(CASE WHEN A.mm_order = 4 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) jul3, "
                                   + " MAX(CASE WHEN A.mm_order = 4 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) julc, "
                                   + " MAX(CASE WHEN A.mm_order = 4 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) jultot, "
                                   + " MAX(CASE WHEN A.mm_order = 5 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) aug12, "
                                   + " MAX(CASE WHEN A.mm_order = 5 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) aug3, "
                                   + " MAX(CASE WHEN A.mm_order = 5 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) augc, "
                                   + " MAX(CASE WHEN A.mm_order = 5 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) augtot, "
                                   + " MAX(CASE WHEN A.mm_order = 6 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) sep12, "
                                   + " MAX(CASE WHEN A.mm_order = 6 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) sep3, "
                                   + " MAX(CASE WHEN A.mm_order = 6 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) sepc, "
                                   + " MAX(CASE WHEN A.mm_order = 6 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) septot, "
                                   + " MAX(CASE WHEN A.mm_order = 7 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) oct12, "
                                   + " MAX(CASE WHEN A.mm_order = 7 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) oct3, "
                                   + " MAX(CASE WHEN A.mm_order = 7 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) octc, "
                                   + " MAX(CASE WHEN A.mm_order = 7 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) octtot, "
                                   + " MAX(CASE WHEN A.mm_order = 8 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) nov12, "
                                   + " MAX(CASE WHEN A.mm_order = 8 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) nov3, "
                                   + " MAX(CASE WHEN A.mm_order = 8 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) novc, "
                                   + " MAX(CASE WHEN A.mm_order = 8 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) novtot, "
                                   + " MAX(CASE WHEN A.mm_order = 9 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) dec12, "
                                   + " MAX(CASE WHEN A.mm_order = 9 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) dec3, "
                                   + " MAX(CASE WHEN A.mm_order = 9 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) decc, "
                                   + " MAX(CASE WHEN A.mm_order = 9 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) dectot, "
                                   + " MAX(CASE WHEN A.mm_order = 10 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) jan12, "
                                   + " MAX(CASE WHEN A.mm_order = 10 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) jan3, "
                                   + " MAX(CASE WHEN A.mm_order = 10 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) janc, "
                                   + " MAX(CASE WHEN A.mm_order = 10 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) jantot, "
                                   + " MAX(CASE WHEN A.mm_order = 11 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) feb12, "
                                   + " MAX(CASE WHEN A.mm_order = 11 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) feb3, "
                                   + " MAX(CASE WHEN A.mm_order = 11 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) febc, "
                                   + " MAX(CASE WHEN A.mm_order = 11 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) febtot, "
                                   + " MAX(CASE WHEN A.mm_order = 12 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) mar12, "
                                   + " MAX(CASE WHEN A.mm_order = 12 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) mar3, "
                                   + " MAX(CASE WHEN A.mm_order = 12 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) marc, "
                                   + " MAX(CASE WHEN A.mm_order = 12 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) martot, "
                                   + " MAX(CASE WHEN A.mm_order = 13 THEN DECODE(TO_CHAR(NVL(A.amt12,0)),'0',' ',TO_CHAR(NVL(A.amt12,0),'99990.999')) END) tot12, "
                                   + " MAX(CASE WHEN A.mm_order = 13 THEN DECODE(TO_CHAR(NVL(A.amt3,0)),'0',' ',TO_CHAR(NVL(A.amt3,0),'99990.999')) END) tot3, "
                                   + " MAX(CASE WHEN A.mm_order = 13 THEN DECODE(TO_CHAR(NVL(A.amtc,0)),'0',' ',TO_CHAR(NVL(A.amtc,0),'99990.999')) END) totc, "
                                   + " MAX(CASE WHEN A.mm_order = 13 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) tottot "
                                   + " FROM ( SELECT * "
                                   + "        FROM bgt_form2b_data_bbgs "
	                           + "        WHERE bgt_yr = ? AND stn_cd = ? AND sec_cd = ?) A, bgt_form2b_struc_bbgs B "
                                   + " WHERE  A.bgt_seq(+) = B.bgt_seq "
                                   + " GROUP BY bgt_hd_roworder,bgt_grp_roworder,bgt_subhd_roworder,B.bgt_seq "
                                   + " ORDER BY bgt_hd_roworder,bgt_grp_roworder,bgt_subhd_roworder " ) ;

         ps1.setString(1,sBgt_Fr_Year);
         ps1.setString(2,sStn_cd);
         ps1.setString(3,sSec_cd);

         rs1=ps1.executeQuery();

     System.out.println("zzzzz");
         while(rs1.next()){


               rows = new ArrayList() ;

               rows.add(rs1.getString(1)) ;
               rows.add(rs1.getString(2)) ;
               rows.add(rs1.getString(3)) ;
               rows.add(rs1.getString(4)) ;

               rows.add(rs1.getString(5)) ;
               rows.add(rs1.getString(6)) ;
               rows.add(rs1.getString(7)) ;
               rows.add(rs1.getString(8)) ;
               rows.add(rs1.getString(9)) ;
               rows.add(rs1.getString(10)) ;
               rows.add(rs1.getString(11)) ;
               rows.add(rs1.getString(12)) ;
               rows.add(rs1.getString(13)) ;
               rows.add(rs1.getString(14)) ;
               rows.add(rs1.getString(15)) ;
               rows.add(rs1.getString(16)) ;
               rows.add(rs1.getString(17)) ;
               rows.add(rs1.getString(18)) ;
               rows.add(rs1.getString(19)) ;
               rows.add(rs1.getString(20)) ;
               rows.add(rs1.getString(21)) ;
               rows.add(rs1.getString(22)) ;
               rows.add(rs1.getString(23)) ;
               rows.add(rs1.getString(24)) ;
               rows.add(rs1.getString(25)) ;
               rows.add(rs1.getString(26)) ;
               rows.add(rs1.getString(27)) ;
               rows.add(rs1.getString(28)) ;
               rows.add(rs1.getString(29)) ;
               rows.add(rs1.getString(30)) ;
               rows.add(rs1.getString(31)) ;
               rows.add(rs1.getString(32)) ;
               rows.add(rs1.getString(33)) ;
               rows.add(rs1.getString(34)) ;
               rows.add(rs1.getString(35)) ;
               rows.add(rs1.getString(36)) ;
               rows.add(rs1.getString(37)) ;
               rows.add(rs1.getString(38)) ;
               rows.add(rs1.getString(39)) ;
               rows.add(rs1.getString(40)) ;
               rows.add(rs1.getString(41)) ;
               rows.add(rs1.getString(42)) ;
               rows.add(rs1.getString(43)) ;
               rows.add(rs1.getString(44)) ;
               rows.add(rs1.getString(45)) ;
               rows.add(rs1.getString(46)) ;
               rows.add(rs1.getString(47)) ;
               rows.add(rs1.getString(48)) ;
               rows.add(rs1.getString(49)) ;
               rows.add(rs1.getString(50)) ;
               rows.add(rs1.getString(51)) ;
               rows.add(rs1.getString(52)) ;
               rows.add(rs1.getString(53)) ;
               rows.add(rs1.getString(54)) ;
               rows.add(rs1.getString(55)) ;
               rows.add(rs1.getString(56)) ;

               l2.add(rows);

         }

         rs1.close();
         ps1.close();
     
         ps1=null;
         rs1=null;

         //System.out.println("l1.size()"+l1.size());
         //System.out.println("l2.size()"+l2.size());

         for ( i=0; i<l2.size(); i++ ) {
            totrec++ ;
            rows1 = (List)l1.get(i) ;
            rows2 = (List)l2.get(i) ;


            //System.out.println("RowSXXXX"+rows2.get(3)+","+rows1.get(3));
            //System.out.println("RowSXXXX BGT_SEQ IN TWO LISTS"+rows1.get(8)+","+rows2.get(3));
            if ( rows1.get(8).equals(rows2.get(3)) ) {
                //System.out.println("Rows bgt_seq STRUC,DATA:"+rows1.get(8)+",:"+rows2.get(3)+"Desc:"+rows1.get(5));
                rows = new ArrayList() ;

                //System.out.println("AMT12"+rows2.get(4)+"AMT3"+rows2.get(5)+"AMTC"+rows2.get(6)+"AMT_TOT"+rows2.get(7));
                rows.add((String)rows1.get(3)) ;
                rows.add((String)rows1.get(4)) ;
                rows.add((String)rows1.get(11)) ;
                rows.add((String)rows1.get(5)) ;

                //System.out.println("rows2.size()"+rows2.size());
                for ( j=4; j<rows2.size(); j++ ) {
                    rows.add((String)rows2.get(j)) ;
                }
                rows.add("\"#"+(String)rows1.get(7)+"\"")  ;       /******** Adding TR Color *************/
                rows.add("\""+sReadOnlyMkr+"\"") ;                 /******** Adding ReadOnlyMkr **********/
                rows.add("\""+(String)rows1.get(9)+"\"") ;         /******** Adding AMTNA Mkr   **********/
                rows.add("\""+(String)rows1.get(6)+"\"") ;         /******** Adding subtMkr     **********/
                rows.add("\""+(String)rows1.get(8)+"\"") ;         /******** Adding Bgt Seq     **********/
                //System.out.println("rows.size()"+rows.size());
                //System.out.println("BGT_SEQ_ADDED:"+(String)rows1.get(8));
            }
            ////System.out.println("RowS"+rows.get(0)+","+rows.get(1)+","+rows.get(2));
            detailList.add(rows) ;
        }

        String sHead           = new String(" ");
        String sGroup          = new String(" ");
        String sSubHead        = new String(" ");
        String sDesc           = new String(" ");
        String sAmt            = new String(" ");
        String sTrColor        = new String(" ");
        String sAmtFColor      = new String(" ");
        String sAmtBColor      = new String(" ");
        String sCellFColor     = new String(" ");
        String sCellBColor     = new String(" ");
        //System.out.println("detailList.size()"+detailList.size());
        for( i=0; i <detailList.size(); i++){

             rows=null;
             rows = (List)detailList.get(i) ;
             ////System.out.println("rows.size() at"+i+","+rows.size());

             sHead    = (String)rows.get(0);
             sGroup   = (String)rows.get(1);
             sSubHead = (String)rows.get(2);
             sDesc    = (String)rows.get(3);
             sTrColor = (String)rows.get(56); 

             //System.out.println("CellB Color :"+i+","+(String)rows.get(56));
             //System.out.println("Amt :"+i+","+(String)rows.get(4));
             //System.out.println("Amt :"+i+","+(String)rows.get(5));
             ////System.out.println("Amt :"+i+","+(String)rows.get(6));
             //System.out.println("Amt :"+i+","+(String)rows.get(7));
%>
<tr class="style2" style=background-color:<%= sTrColor %>;>
  <td class="style30"><%= sHead %></td>
  <td class="style31"><%= sGroup %></td>
  <td class="style32"><%= sSubHead %></td>
  <td class="style33"><%= sDesc %></td>
<%
            
             for ( j=4; j<=55; j++ ) {

                   if(j%4==3 && j<52){
                      sCellBColor = sColColors[0];
                   }else{
                      sCellBColor = sTrColor;
                   }

                   if(j>=52&&j<=54){

                      sCellBColor = sColColors[1];

                   }

                   if(j==55){

                      sCellBColor = sColColors[4];

                   }

                   sAmt = (String)rows.get(j);
%>

  <td class="style34" style=background-color:<%= sCellBColor %>;><%= sAmt %></td>

<%
             }

%>
</tr>
<%

        }

%>


</table>

<%

  }catch(Exception e1){
         System.out.println(e1);      
         e1.printStackTrace();
  }
  finally{

     if(rs1!=null){
        rs1.close();
     }
     if(ps1!=null){
        ps1.close();
     }

     mk.con.close();

     System.out.println("generation_budget_de_bbgs_forexcel.jsp closed"+request.getRemoteAddr());
  
}
%>

</div>

</body>

</html>
