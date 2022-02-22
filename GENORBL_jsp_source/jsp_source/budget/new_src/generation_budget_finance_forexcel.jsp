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
        border: 1px solid #000000;
	font-family: Calibri;
	font-size: x-small;
   }
   .style3 {
	color: #FFFFFF;
	font-size: x-small;
	border-width: 0;
	background-color: #002851;
   }
   .style4 {
	border-width: 0;
	background-color: #F0D8B3;
   }
   .style5 {
	font-size: mall;
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
        border: 0px solid #000000;
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
   .style30 {
	text-align: center;
	color: #000000;
	font-family: Calibri;
	font-size: small;
	border-width: 0;
	background-color: #FFFFFF;
   }
   .style40 {
	border-width: 0;
	font-size: x-small;
	font-family: Calibri;
	background-color: #FFFFFF;
	color: #000000;
   }

   .styleFootall{

        position:absolute;
        top:500px;
        left:10px;
        width: 980px;
        border: 1px solid #000000;

   }

   .styleHeadall1{

        position:absolute;
        top:600px;
        left:10px;
    /*    height: 140px;*/
        width: 980px;
        border: 1px solid #000000;

   }

   .styleHeadall2{

        position:absolute;
        top:1200px;
        left:10px;
    /*    height: 140px;*/
        width: 980px;
        border: 1px solid #000000;

   }


   .styleFootall1{

        position:absolute;
    /*    top:1000px;*/
        left:10px;
        width: 980px;
        border: 1px solid #000000;

   }

   .styleFootall2{

        position:absolute;
        top:1600px;
        left:10px;
        width: 980px;
        border: 1px solid #000000;

   }

  .style34{

     width: 120px;
     text-align: center;
     border-right: 1px solid #000000;
     mso-number-format:0.000;

  }

  .style35{

     width: 120px;
     text-align: right;
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
  String sBgt_Fr_YY_Prev          = new String("");
  String sBgt_To_Year             = new String("");
  String sBgt_To_YY               = new String("");
  String sBgt_To_YY_Prev          = new String("");
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
  String sBgt_Grp_Rowval        = new String("");
  String sBgt_Grp_Roworder        = new String("");
  String sAuth_Exist              = new String("");
  String sAuth_Flag               = new String("");
  String sBgtVer               = new String("");


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
  List detailList1 = new ArrayList() ;
  List detailList2 = new ArrayList() ;
  int i = 0 ;
  int j = 0 ;
  int totrec = 0 ;
  int totrec1 = 0 ;
  int totrec2 = 0 ;
  int icnt = 0; 

  String sHtml_footer = new String("");

  try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);

     System.out.println("generation_budget_finance_forexcel.jsp opened"+request.getRemoteAddr());

     sBgt_Fr_Year = request.getParameter("T1");
     sIp_ecode  = request.getRemoteAddr()+"_"+sUsername;

     if(sBgt_Fr_Year.equals("new_year_entry")){

     }else{

         sUsername    = request.getParameter("username");
         sStn_cd  = request.getParameter("stn_cd");
         sSec_cd  = request.getParameter("sec_cd");
         sEmpDesg = request.getParameter("emp_desg");
         sBgtVer  = request.getParameter("bgt_ver");

         if(sStn_cd.equals("E")){
  
             sGenStn = "ED(GENERATION)S ESTABLISHMENT";

         }else{

             sGenStn  = request.getParameter("stn_long_desc");

         }
         sSecDesc  = request.getParameter("sec_cd");

         sBgt_To_Year = Integer.toString((Integer.parseInt(sBgt_Fr_Year))+1);
         sBgt_Fr_YY = sBgt_Fr_Year.substring(2);
         sBgt_To_YY = sBgt_To_Year.substring(2);
         iUsername = iUsername+1;

         sBgt_Fr_YY_Prev= Integer.toString(((Integer.parseInt(sBgt_Fr_Year))-1)).substring(2);
         sBgt_To_YY_Prev= Integer.toString(((Integer.parseInt(sBgt_To_Year))-1)).substring(2);

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

         sBgt_lvl = "1";

     }


     if(iUsername!=0){

%>

<table style="width: 100%" class="style1">
	<tr>
		<td class="style3" colspan="7" align="left"><strong><u>REVENUE BUDGET(FINANCE FORMAT)-F.Y. : <%= sBgt_Fr_Year %> - <%= sBgt_To_Year %></u></strong></td>
		<td class="style3" colspan="2" align="right"><strong><%= sDate %></strong></td>
	</tr>
	<tr>
		<td class="style4" colspan="9" align="left"><strong><span class="style5">Coal Oil and O&M Budget <%= sBgt_Fr_Year %> - <%= sBgt_To_Year %></u></strong></td>
	</tr>
	<tr style="background-color:#ffd6c1;border:2px;border-color:black;border-top-style:solid;">
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong> </strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong> </strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong> </strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong> </strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong> </strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong> </strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong>ALL</strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong>CTM & ED(G)'s </strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong>Generation</strong></td>
	</tr>
	<tr>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong>SR NO</strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong>PARTICULARS</strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong>BBGS</strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong>TGS</strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong>SGS</strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong>NCGS</strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong>STATIONS</strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong>establishment</strong></td>
		<td class="style4" colspan="1" align="center" style="background-color:#FFD6C1;border-color:black;border:1px;border-right-style:solid"><strong>Division</strong></td>
	</tr>
</table>

<%

     ps1 = mk.con.prepareStatement(" SELECT NVL(SL_NO_ROWVAL,' '), "+
                                   "  REPLACE('<span style='||CHR(39)||'font-weight:lighter;background-color:#'|| "+
                                   "    (SELECT COLOR_HEX  "+
                                   "            FROM BGT_COLOR  "+
                        	   "     WHERE COLOR_CD=NVL(DESC1_B_COLOR,1))||'; color:#'|| "+
	                           "    (SELECT COLOR_HEX  "+
                                   "            FROM BGT_COLOR  "+
	                           "     WHERE COLOR_CD=NVL(DESC1_F_COLOR,1))||CHR(39)||'>'||REPLACE(NVL(DESC1,' '),' ','&nbsp;')||'</span>','\"',' ') Budg_Desc,"+
                                   "  NVL(SUBT_MKR,'NE'),  "+
                                   "  (SELECT COLOR_HEX  "+
                                   "          FROM BGT_COLOR  "+
                                   "   WHERE COLOR_CD=NVL(DESC1_B_COLOR,1)) TD_BG_COLOR,  "+
                                   "   BGT_SEQ,  "+
                                   "   NVL(TRIM(AMT_NA),'NE'),  "+
                                   "  DECODE(DESC_JUST,'L','left','R','right','C','center','left'),  "+
                                   "  (SELECT COLOR_HEX  "+
                                   "          FROM BGT_COLOR  "+
                                   "   WHERE COLOR_CD=NVL(AMT_B_COLOR,1)) CELL_BG_COLOR, "+
                                   "  (SELECT COLOR_HEX  "+
                                   "          FROM BGT_COLOR  "+
                                   "   WHERE COLOR_CD=NVL(AMT_F_COLOR,1)) CELL_FNT_COLOR, "+
                                   "  (SELECT COLOR_HEX  "+
                                   "          FROM BGT_COLOR  "+
                                   "   WHERE COLOR_CD=NVL(DESC1_F_COLOR,1)) DESC_FNT_COLOR, "+
                                   "  AMT_ITALICS, "+
                                   "  AMT_BORDER "+
	                           "  FROM BGT_FORM2B_STRUC_FIN "+
                                   "  WHERE NVL(TRIM(BGT_TO_YR),'@@')= '@@' "+
                                   "  ORDER BY SL_NO_ROWORDER,BGT_HD_ROWORDER "); 


           rs1=ps1.executeQuery();

     System.out.println("8888");
            while(rs1.next()){

                  icnt = icnt+1;
/**** New Code Start ***/

                  rows = new ArrayList() ;
                  rows.add(rs1.getString(1)) ;/** SL NO ROWVAL **/
                  rows.add(rs1.getString(2)) ;/** DESC **/
                  rows.add(rs1.getString(3)) ;/** SUBT MKR **/
                  rows.add(rs1.getString(4)) ;/** DESC1_B_COLOR**/
                  rows.add(rs1.getString(5)) ;/** BGT_SEQ **/
                  rows.add(rs1.getString(6)) ;/** AMT_NA_MKR **/
                  rows.add(rs1.getString(7)) ;/** JUSTIFICATION**/

                  rows.add(rs1.getString(8)) ;/** AMT_B_COLOR **/
                  rows.add(rs1.getString(9)) ;/** AMT_F_COLOR **/
                  rows.add(rs1.getString(10)) ;/** DESC1_F_COLOR **/
                  rows.add(rs1.getString(11)) ;/** AMT_ITALICS **/
                  rows.add(rs1.getString(12)) ;/** AMT_BORDER **/

                  l1.add(rows);
                 
                  iLineNo = iLineNo + 1;

            }

            rs1.close();
            ps1.close();

            ps1=null;
            rs1=null; 

           ps1=mk.con.prepareStatement("SELECT B.BGT_SEQ,B.SL_NO_ROWORDER,B.BGT_HD_ROWORDER, "
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_BBGS_DISP,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_BBGS_DISP,0),'99990.999')) bbgs_tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_TGS_DISP,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_TGS_DISP,0),'99990.999')) tgs_tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_SGS_DISP,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_SGS_DISP,0),'99990.999')) sgs_tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_NCGS_DISP,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_NCGS_DISP,0),'99990.999')) ncgs_tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_STN_BBGS_TGS_SGS_NCGS_DISP,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_STN_BBGS_TGS_SGS_NCGS_DISP,0),'99990.999')) all_stn_tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_CTM_EDGE_DISP,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_CTM_EDGE_DISP,0),'99990.999')) ctm_edge_tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_DIV_ALL6_DISP,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_DIV_ALL6_DISP,0),'99990.999')) gen_div "
                                     + " FROM ( SELECT * "
                                     + "        FROM bgt_form2b_data_fin "
	                             + "        WHERE bgt_yr = ? AND stn_cd = ? AND sec_cd = ? ) A, bgt_form2b_struc_fin B "
                                     + " WHERE  A.bgt_seq(+) = B.bgt_seq "
                                     + " ORDER BY B.SL_NO_ROWORDER,B.BGT_HD_ROWORDER " ) ;

           ps1.setString(1,sBgt_Fr_Year);
           ps1.setString(2,sStn_cd);
           ps1.setString(3,sSec_cd);

           rs1=ps1.executeQuery();

           while(rs1.next()){


                 rows = new ArrayList() ;

                 rows.add(rs1.getString(1)) ;/** BGT_SEQ **/
                 rows.add(rs1.getString(2)) ;/** SL_NO ROWORDER **/
                 rows.add(rs1.getString(3)) ;/** BGT_HD_ROWORDER **/

                 /** AMT VALUES  **/
                 rows.add(rs1.getString(4)) ;
                 rows.add(rs1.getString(5)) ;
                 rows.add(rs1.getString(6)) ;
                 rows.add(rs1.getString(7)) ;
                 rows.add(rs1.getString(8)) ;
                 rows.add(rs1.getString(9)) ;
                 rows.add(rs1.getString(10)) ;

                 l2.add(rows);

           }

           rs1.close();
           ps1.close();
     
           ps1=null;
           rs1=null;


           for ( i=0; i<l1.size(); i++ ) {
                 totrec++ ;
                 rows1 = (List)l1.get(i) ;
                 rows2 = (List)l2.get(i) ;

                 System.out.println("RowSXXXX BGT_SEQ IN TWO LISTS"+rows1.get(5)+","+rows2.get(0));
                 System.out.println("rows1.size()"+rows1.size()+",rows2.size()"+rows2.size());

                 System.out.println("SlNO RowVal:"+rows1.get(0));
                 System.out.println(" Desc:"+rows1.get(1));

                 if (rows1.get(4).equals(rows2.get(0))) {
                     sReadOnlyMkr="T";
                     rows = new ArrayList() ;
                     rows.add((String)rows1.get(0)) ;
                     rows.add((String)rows1.get(1)) ;

                     for ( j=3; j<rows2.size(); j++ ) {
                         rows.add((String)rows2.get(j)) ;
                     }
                     rows.add((String)rows1.get(4)) ;
                     rows.add((String)rows1.get(5)) ;
                     rows.add((String)rows1.get(6)) ;
                     rows.add("\"#"+(String)rows1.get(7)+"\"") ;
                     rows.add("\"#"+(String)rows1.get(8)+"\"") ;
                     rows.add("\"#"+(String)rows1.get(9)+"\"") ;
                     rows.add((String)rows1.get(10)) ;
                     rows.add((String)rows1.get(11)) ;

                     rows.add(sReadOnlyMkr) ;
                     rows.add((String)rows1.get(3)) ;

                     System.out.println("BGT_SEQ_ADDED:"+(String)rows1.get(5));
                 }
                 detailList.add(rows) ;
          }

          System.out.println("zzzzz");

          System.out.println("l1.size()"+l1.size());
          System.out.println("l2.size()"+l2.size());

          sHtml_footer = "<table class=styleFootall1>"+
	             "<tr>"+
		     "<td class=style40 ><strong>Notes:</strong></td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
	             "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=9>A. Generation and Fuel cost is as per Generation & Coal Budget by System Control dept.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=9>B. Maintenance expenditure includes wages for contractors employee.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=9>C. 6% escalation in Material price and 10% escalation on contracted Labour Cost has been considered.Contractor Labour Wage Revision of TGS and NCGS Considered in "+sBgt_Fr_Year+"-"+sBgt_To_Year+" </td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=9>D. <strong>&#39Coal handling charges&#39</strong> includes the following heads only : 1)Consolidated Charges(CPT/FCI) 2)Railway men Salary 3)Inplant Shunting Charges 4)Others Railwaymen's pool car and 5)Coal Sampling & Testing Charges.Other heads,being controlled by System Control dept, not included in this budget.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=9>E. Admin and General Expenses&#39 includes the following heads only :1)General Establishment Charges(Chummery). 2)Petty cash expenses 3)Computer Maintenance Charges 4)Transport related to out station visits for station needs.Other heads,being controlled/monitored by Finance Dept,not included in this budget.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=9>F. Under Rent,Rate & Tax, the following heads have been included :1)Boiler Directorate Charges 2)Weights & Measures Fees 3)Fire Service Licence Fees 4)Factory Licence Fees 5)Air & Water Consent 6)Effluent & Stack Monitoring Charges.Other heads, being controlled/monitored by Finance dept,not included in this budget.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=9>G. Apportioned cost of other divisions not considered.</td>"+
                            "</tr>"+
                            "</table>";

%>

<table>

<%
        String sSlNo    =  new String(" ");
        String sDesc    =  new String(" ");
        String sAmt     =  new String(" "); 
        String sAmtBColor =  new String(" ");
        String sAmtFColor =  new String(" ");
        String sDesc1FColor =  new String(" ");
        String sAmtItalics =  new String(" ");
        String sAmtBorder =  new String(" ");
        String sDesc1BColor =  new String(" ");
        String sItalics =  new String(" ");

        //System.out.println("detailList.size() in EXCEL"+detailList.size());
        for( i=0; i <detailList.size(); i++){

             rows=null;
             rows = (List)detailList.get(i) ;
             //System.out.println("rows.size() at"+i+","+rows.size());

             sSlNo    = (String)rows.get(0);
             sDesc    = (String)rows.get(1);
             sAmtBColor = (String)rows.get(12);
             sAmtFColor = (String)rows.get(13);
             sDesc1FColor = (String)rows.get(14);
             sAmtItalics = (String)rows.get(15);
             sAmtBorder = (String)rows.get(16);
             sDesc1BColor = (String)rows.get(18);

             if(sAmtItalics.equals("Y")){

                sItalics ="font-style:italic";

             }else{

                sItalics =" ";

             }


/*
             System.out.println("Amt BBGS:"+i+","+(String)rows.get(2));
             System.out.println("Amt TGS:"+i+","+(String)rows.get(3));
             System.out.println("Amt SGS:"+i+","+(String)rows.get(4));
             System.out.println("Amt NCGS:"+i+","+(String)rows.get(5));
             System.out.println("Amt ALL STATION:"+i+","+(String)rows.get(6));
             System.out.println("Amt CTM EDGE:"+i+","+(String)rows.get(7));
             System.out.println("Amt GEN DIV :"+i+","+(String)rows.get(8));
*/
%>
<tr class="style2" style=background-color:<%= sDesc1BColor %>;>
  <td class="style30" ><%= sSlNo %></td>
  <td class="style33" style=background-color:<%= sAmtBColor %>;color:<%= sAmtFColor %>;<%= sItalics %>><%= sDesc %></td>
<%
            
             for ( j=2; j<=8; j++ ) {

                   sAmt = (String)rows.get(j);
%>

  <td class="style35" style=background-color:<%= sAmtBColor %>;color:<%= sAmtFColor %>;<%= sItalics %>><%= sAmt %></td>

<%
             }

%>
</tr>
<%

        }
        System.out.println("QUERY EXCEL ENDED");

%>
</table>

              
<table class=styleFootall1>
<tr>
<td class=style40 ><strong>Notes:</strong></td>
<td class=style40 >&nbsp;</td>
<td class=style40 >&nbsp;</td>
<td class=style40 >&nbsp;</td>
<td class=style40 >&nbsp;</td>
<td class=style40 >&nbsp;</td>
<td class=style40 >&nbsp;</td>
<td class=style40 >&nbsp;</td>
<td class=style40 >&nbsp;</td>
</tr>
<tr>
<td class=style40 colspan=9>A. Generation and Fuel cost is as per Generation & Coal Budget by System Control dept.</td>
</tr>
<tr>
<td class=style40 colspan=9>B. Maintenance expenditure includes wages for contractors employee.</td>
</tr>
<tr>
<td class=style40 colspan=9>C. 6% escalation in Material price and 10% escalation on contracted Labour Cost has been considered.Contractor Labour Wage Revision of TGS and NCGS Considered in <%= sBgt_Fr_Year %>-<%= sBgt_To_Year %> </td>
</tr>
<tr>
<td class=style40 colspan=9>D. <strong>&#39Coal handling charges&#39</strong> includes the following heads only : 1)Consolidated Charges(CPT/FCI) 2)Railway men Salary 3)Inplant Shunting Charges 4)Others Railwaymen's pool car and 5)Coal Sampling & Testing Charges.Other heads,being controlled by System Control dept, not included in this budget.</td>
</tr>
<tr>
<td class=style40 colspan=9>E. Admin and General Expenses&#39 includes the following heads only :1)General Establishment Charges(Chummery). 2)Petty cash expenses 3)Computer Maintenance Charges 4)Transport related to out station visits for station needs.Other heads,being controlled/monitored by Finance Dept,not included in this budget.</td>
</tr>
<tr>
<td class=style40 colspan=9>F. Under Rent,Rate & Tax, the following heads have been included :1)Boiler Directorate Charges 2)Weights & Measures Fees 3)Fire Service Licence Fees 4)Factory Licence Fees 5)Air & Water Consent 6)Effluent & Stack Monitoring Charges.Other heads, being controlled/monitored by Finance dept,not included in this budget.</td>
</tr>
<tr>
<td class=style40 colspan=9>G. Apportioned cost of other divisions not considered.</td>
</tr>
</table>
<%


        }else{

%>
<table style="width: 100%" class="style1">
	<tr>
		<td class="style3" colspan="20" width="100%">&nbsp;</td>
	</tr>
	<tr>
		<td class="style3" colspan="20" width="100%">&nbsp;</td>
	</tr>
	<tr>
		<td class="style3" colspan="20" width="100%">Username Is Invalid </td>
	</tr>
	<tr>
		<td class="style3" colspan="20" width="100%">&nbsp;</td>
	</tr>
	<tr>
		<td class="style3" colspan="20" width="100%" align="center"><input type="button" name="CLOSE" value="CLOSE" onClick="window.open('close.html','_top');"</td>
	</tr>
</table>
<%
     }
  }catch(Exception e1){
         System.out.println(e1);      
         e1.printStackTrace();
  }
  finally{

     if(rs1!=null){
        rs1.close();
        rs1=null;
     }
     if(ps1!=null){
        ps1.close();
        ps1=null;
     }

     mk.con.close();
     mk=null;

     System.out.println("generation_budget_finance_forexcel.jsp closed"+request.getRemoteAddr());
  
   }
%>

</body>

</html>