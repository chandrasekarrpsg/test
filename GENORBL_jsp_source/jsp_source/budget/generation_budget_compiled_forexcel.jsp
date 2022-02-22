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

  .style30{

     width: 50px; 
     text-align: center; 
     border-right: 1px solid #000000;
  
  }

  .style31{

     width: 60px; 
     text-align: center; 
     border-right: 1px solid #000000;

  }


  .style32{

     width: 50px; 
     text-align: center; 
     border-right: 1px solid #000000;

  }

  .style33{

     width: 290px; 
     text-align: center; 
     border-right: 1px solid #000000;

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
     mso-number-format:"\@";

  }

  .style36{

     width: 120px; 
     text-align: right; 
     border-right: 1px solid #000000;
     mso-number-format:0.000;
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
        top:1020px;
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
  String sBgt_Fr_YY_Prev          = new String("");
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
  String sBgt_Grp_Rowval          = new String("");
  String sBgt_Grp_Roworder        = new String("");
  String sAuth_Exist              = new String("");
  String sAuth_Flag               = new String("");
  String sBgtHdr                  = new String("");

  int iBgt_Hd_Roworder = 0;
  int iGrp_sl_no = 0; 
  int iGrp_sub_sl_no = 0; 
  int iLineNo = 0; 
  int iGrp_index = 0; 
  int i_g_y_cell_index = 0; 
  int iRowExists = 0; 
  int iUsername = 0; 
  int iFlg = 0; 

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

     System.out.println("generation_budget_compiled_forexcel.jsp opened"+request.getRemoteAddr());

%>

<%
     //System.out.println("66666");

     sBgt_Fr_Year = request.getParameter("T1");
     sStn_cd      = request.getParameter("stn_cd");
     sSec_cd      = request.getParameter("sec_cd");
     sGenStn      = request.getParameter("stn_long_desc");
     sSecDesc     = request.getParameter("sec_cd");
     sBgtHdr      = request.getParameter("bgt_hdr");

     sBgt_To_Year = Integer.toString((Integer.parseInt(sBgt_Fr_Year))+1);
     sBgt_Fr_YY = sBgt_Fr_Year.substring(2);
     sBgt_To_YY = sBgt_To_Year.substring(2);
     sBgt_Fr_YY_Prev= Integer.toString(((Integer.parseInt(sBgt_Fr_Year))-1)).substring(2);
     sBgt_To_YY_Prev= Integer.toString(((Integer.parseInt(sBgt_To_Year))-1)).substring(2);
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

     //System.out.println("77777");

%>

<div id=fixed_div>
<table style="width: 100%" class="style1">
	<tr>
		<td class="style3" colspan="2"><strong>&nbsp;</strong></td>
		<td class="style3" colspan="10" align="center"><strong>BUDGET : <%= sBgt_Fr_Year %> - <%= sBgt_To_Year %> </strong></td>
	</tr>
	<tr>
		<td class="style4" colspan="2"><strong><span class="style5"><%= sDate %></strong></td>
		<td class="style4" colspan="10" align="center"><strong><span class="style5">COMPILED BUDGET <%= sBgtHdr %></span> </strong></td>
	</tr>
	<tr>
		<td colspan="2" class="style6"><strong><span class="style7">Form 2B</span></strong></td>
		<td colspan="10" align="center" ><strong><span class="style7"></span></strong></td>
	</tr>
	<tr >
		<td colspan="2" ><strong><span >&nbsp;</span></strong></td>
		<td colspan="10" align="center"><strong><span style="color:#620425">All Amount Values are in Rs. Lakhs</span></strong></td>
	</tr>
</table>

<table style="width: 100%"  style="width:980px;">

<tr class="style2" style=background-color:'#FFD6C1';>
  <td class="style30">Sl No</td>
  <td class="style31">Budget Head</td>
  <td class="style33">BUDGET HEAD DESCRIPTION </td>
  <td class="style34">BBGS</td>
  <td class="style34">TGS</td>
  <td class="style34">SGS</td>
  <td class="style34">NCGS</td>
  <td class="style34">CTM</td>
  <td class="style34">ED(G)</td>
  <td class="style34">PF Station</td>
  <td class="style34">Gen Stn</td>
  <td class="style34">Gen Div</td>
</tr>

<%

           ps1 = mk.con.prepareStatement(" SELECT NVL(SL_NO_ROWVAL,' '), "+
                                         "        REPLACE(NVL(BGT_HD_ROWVAL,' '),'e','e '), "+
                                         "  REPLACE('<span style='||CHR(34)||'font-weight:lighter;background-color:#'|| "+
	                                 "    (SELECT COLOR_HEX  "+
                                         "            FROM BGT_COLOR  "+
	               		         "     WHERE COLOR_CD=NVL(DESC1_B_COLOR,1))||'; color:#'|| "+
	                                 "    (SELECT COLOR_HEX  "+
                                    	 "            FROM BGT_COLOR  "+
            			         "     WHERE COLOR_CD=NVL(DESC1_F_COLOR,1))||CHR(34)||'>'||NVL(DESC1,' ')||'</span>'|| "+
	                                 "  ' <span style='||CHR(34)||'font-weight:lighter;background-color:#'|| "+
	                                 "    (SELECT COLOR_HEX  "+
	                                 " 	      FROM BGT_COLOR  "+
	     	            		 "     WHERE COLOR_CD=NVL(DESC2_B_COLOR,1))||'; color:#'|| "+
	                                 "    (SELECT COLOR_HEX  "+
                                    	 "            FROM BGT_COLOR  "+
	        	                 "     WHERE COLOR_CD=NVL(DESC2_F_COLOR,1))||CHR(34)||'>'||NVL(DESC2,' ')||'</span>'|| "+
	                                 "  ' <span style='||CHR(34)||'font-weight:lighter;background-color:#'|| "+
	                                 "    (SELECT COLOR_HEX  "+
                                         "	      FROM BGT_COLOR  "+
	                                 "     WHERE COLOR_CD=NVL(DESC3_B_COLOR,1))||'; color:#'|| "+
	                                 "    (SELECT COLOR_HEX  "+
                                    	 "            FROM BGT_COLOR  "+
	                                 "     WHERE COLOR_CD=NVL(DESC3_F_COLOR,1))||CHR(34)||'>'||NVL(DESC3,' ')||'</span>','\"',' ') Budg_Desc,"+
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
                                         "   WHERE COLOR_CD=NVL(DESC1_F_COLOR,1)) DESC_FNT_COLOR "+
	                                 "  FROM BGT_FORM2B_STRUC "+
                                         "  WHERE NVL(TRIM(BGT_TO_YR),'@@')= '@@' "+
                                         "  ORDER BY SL_NO_ROWORDER,BGT_HD_ROWORDER "); 

        rs1=ps1.executeQuery();

     //System.out.println("8888");
        while(rs1.next()){

      icnt = icnt+1;
/**** New Code Start ***/
              rows = new ArrayList() ;
              rows.add(rs1.getString(1)) ;/** SL NO ROWVAL **/
              rows.add(rs1.getString(2)) ;/** BGT HD ROWVAL **/
              rows.add(rs1.getString(3)) ;/** DESC **/
              rows.add(rs1.getString(4)) ;/** SUBT MKR **/
              rows.add(rs1.getString(5)) ;/** DESC1_B_COLOR**/
              rows.add(rs1.getString(6)) ;/** BGT_SEQ **/
              rows.add(rs1.getString(7)) ;/** AMT_NA_MKR **/
              rows.add(rs1.getString(8)) ;/** JUSTIFICATION**/

              rows.add(rs1.getString(9)) ;/** AMT_B_COLOR **/
              rows.add(rs1.getString(10)) ;/** AMT_F_COLOR **/
              rows.add(rs1.getString(11)) ;/** DESC1_F_COLOR **/
              //System.out.println("ADDING XXXX"+rs1.getString(6));

              l1.add(rows);
/**** New Code End ***/
                 
                       iLineNo = iLineNo + 1;

         } 
         rs1.close();
         ps1.close();

         rs1 = null;
         ps1 = null;

         //System.out.println("8888AAAA "+sBgt_Fr_Year+","+sStn_cd+","+sSec_cd);

           ps1=mk.con.prepareStatement("SELECT B.BGT_SEQ,B.SL_NO_ROWORDER,B.BGT_HD_ROWORDER, "
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_BBGS,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_BBGS,0),'99990.999')) bbgs_tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_TGS,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_TGS,0),'99990.999')) tgs_tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_SGS,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_SGS,0),'99990.999')) sgs_tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_NCGS,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_NCGS,0),'99990.999')) ncgs_tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_CTM,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_CTM,0),'99990.999')) ctm_tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_EDGE,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_EDGE,0),'99990.999')) edg_tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_PF_BBGS_TGS_SGS,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_PF_BBGS_TGS_SGS,0),'99990.999')) pf_tot, "
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_STN_BBGS_TGS_SGS_NCGS,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_STN_BBGS_TGS_SGS_NCGS,0),'99990.999')) gen_stn__tot,"
                                     + " DECODE(TRIM(TO_CHAR(NVL(A.AMT_DIV_ALL6,0),'99990.999')),'0.000',' ',TO_CHAR(NVL(A.AMT_DIV_ALL6,0),'99990.999')) gen_div "
                                     + " FROM ( SELECT * "
                                     + "        FROM bgt_form2b_data_all "
	                             + "        WHERE bgt_yr = ? AND stn_cd = ? AND sec_cd = ? ) A, bgt_form2b_struc B "
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
                 rows.add(rs1.getString(11)) ;
                 rows.add(rs1.getString(12)) ;

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

                 System.out.println("Head:"+rows1.get(0));
                 System.out.println(" Grp:"+rows1.get(1));
                 System.out.println("Desc:"+rows1.get(2));

                 if (rows1.get(5).equals(rows2.get(0))) {
                     sReadOnlyMkr="T";
                     rows = new ArrayList() ;
                     rows.add((String)rows1.get(0)) ;
                     rows.add((String)rows1.get(1)) ;
                     rows.add((String)rows1.get(2)) ;

                     for ( j=3; j<rows2.size(); j++ ) {
                         rows.add((String)rows2.get(j)) ;
                     }
                     rows.add("\"#"+(String)rows1.get(4)+"\"") ;
                     rows.add("\"#"+(String)rows1.get(8)+"\"") ;
                     rows.add("\"#"+(String)rows1.get(9)+"\"") ;
                     rows.add((String)rows1.get(10)) ;
                     rows.add((String)rows1.get(5)) ;

                     rows.add((String)rows1.get(7)) ;
                     rows.add((String)rows1.get(6)) ;
                     rows.add((String)rows1.get(3)) ;

                     rows.add(sReadOnlyMkr) ;

                     System.out.println("BGT_SEQ_ADDED:"+(String)rows1.get(5));
                 }
                 detailList.add(rows) ;
          }

          System.out.println("zzzzz");

          System.out.println("l1.size()"+l1.size());
          System.out.println("l2.size()"+l2.size());


        String sSlNo           = new String(" ");
        String sHead           = new String(" ");
        String sDesc           = new String(" ");
        String sAmt            = new String(" ");
        String sTrColor        = new String(" ");
        String sAmtFColor      = new String(" ");
        String sAmtBColor      = new String(" ");
        String sCellFColor     = new String(" ");
        String sCellBColor     = new String(" ");
        String sDesc1FColor     = new String(" ");
        //System.out.println("detailList.size() in EXCEL"+detailList.size());
        for( i=0; i <detailList.size(); i++){

             rows=null;
             rows = (List)detailList.get(i) ;
             //System.out.println("rows.size() at"+i+","+rows.size());

             sSlNo    = (String)rows.get(0);
             sHead    = (String)rows.get(1);
             sDesc    = (String)rows.get(2);
             sTrColor = (String)rows.get(12); 
             sCellBColor = (String)rows.get(13); 
             sAmtFColor = (String)rows.get(14);
             sDesc1FColor = (String)rows.get(15);

        //     System.out.println("Desc-"+sDesc+" sTrColor-"+sTrColor+" sCellBColor-"+sCellBColor+" sAmtFColor-"+sAmtFColor+" sDesc1FColor-"+sDesc1FColor);
/*
             System.out.println("Amt BBGS:"+i+","+(String)rows.get(3));
             System.out.println("Amt TGS:"+i+","+(String)rows.get(4));
             System.out.println("Amt SGS:"+i+","+(String)rows.get(5));
             System.out.println("Amt NCGS:"+i+","+(String)rows.get(6));
             System.out.println("Amt CTM:"+i+","+(String)rows.get(7));
             System.out.println("Amt ED(G):"+i+","+(String)rows.get(8));
             System.out.println("Amt PF STN:"+i+","+(String)rows.get(9));
             System.out.println("Amt GEN STN:"+i+","+(String)rows.get(10));
             System.out.println("Amt GEN DIV:"+i+","+(String)rows.get(11));
*/
%>
<tr class="style2" style=background-color:<%= sTrColor %>;>
  <td class="style30"><%= sSlNo %></td>
  <td class="style31"><%= sHead %></td>
  <td class="style33"><%= sDesc %></td>
<%
            
             for ( j=3; j<=11; j++ ) {

                   sAmt = (String)rows.get(j);
%>

  <td class="style36" style=background-color:<%= sCellBColor %>;><%= sAmt %></td>

<%
             }

%>
</tr>
<%

        }
        System.out.println("ALL QUERY EXCEL ENDED");

%>
</table>

        <table class=styleFootall>
	             <tr>
		     <td class=style40 colspan=19><strong><u>Note:</u></strong>&quot;Under cost of fuel&quot;-&quot;Fuel cost per Unit&quot;is calculated on the basis of &quot;Total cost of procurement per Te or pe KL&quot; multiplied by &quot;coal or oil quantity for consumption&quot; divided by &quot;Total units-Gen. Or SO&quot;</td>
	             </tr>
	             <tr>
		     <td class=style40 colspan=19>&nbsp;</td>
	             </tr>
	             <tr>
		     <td class=style40 colspan=1>&nbsp;</td>
		     <td class=style40 colspan=18>**Expenditure from departments like IR,Medical,Admin,Construction,Payroll,Garage,Purchase etc. Figure supplied by Finance.</td>
	             </tr>
	             <tr>
		     <td class=style40 colspan=19>&nbsp;</td>
	             </tr>
        </table>

        <table class=styleHeadall1 >
	             <tr>
		     <td class=style30 colspan=12><strong>ESTIMATED MATERIALS(FOR CONSUMPTION AND STOCK BUILD UP) TO BE ORDERED BY MATERIALS DIVISION</strong></td>
	             </tr>
	             <tr>
		     <td class=style40 colspan=6 align=left>Generation Division Budget <%= sBgt_Fr_Year %>-<%= sBgt_To_Year %> (Rs Lakh)</td>
		     <td class=style40 colspan=6 align=right>Coal Oil and O&M Budget</td>
	             </tr>
        </table>

<%
        String sHtml_All2 = "<table class=styleHeadall2 >"+
	             "<tr>"+
		     "<td class=style40 colspan=6 align=left><strong>GENERATION DIVISION BUDGET "+sBgt_Fr_Year+"-"+sBgt_To_Year+" (Rs Lakh)</strong></td>"+
		     "<td class=style40 colspan=6 align=right>Coal Oil and O&M Budget</td>"+
	             "</tr>"+
                     "</table>";

        String sHtml_All1_footer = "<table class=styleFootall1>"+
                            "<tr>"+
                            "<td class=style40 colspan=12>1. Materials consumption and stock build up is for "+sBgt_Fr_YY+"-"+sBgt_To_YY+" only Prev. year("+sBgt_Fr_YY_Prev+"-"+sBgt_To_YY_Prev+")pending materials order and the corresponding cash flow not considered.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=12>2. The Figures for "+sBgt_Fr_Year+"-"+sBgt_To_Year+" do not include any contigency expenses</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=12>3. The above Figures do not include any material cost of CAPEX.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=12>4. 6% escalation has been considered on material.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=12>5. It has been assumed that Insurance spares will be consumed from stock only.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=12>6. Procurement for new Bins opening for BBGS is in context of Unit 3</td>"+
                            "</tr>"+
	             "<tr>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
	             "</tr>"+
                            "</table>";

        String sHtml_All_footer = "<table class=styleFootall>"+
	             "<tr>"+
		     "<td class=style40 colspan=12><strong><u>Note:</u></strong>&quot;Under cost of fuel&quot;-&quot;Fuel cost per Unit&quot;is calculated on the basis of &quot;Total cost of procurement per Te or pe KL&quot; multiplied by &quot;coal or oil quantity for consumption&quot; divided by &quot;Total units-Gen. Or SO&quot;.</td>"+
	             "</tr>"+
	             "<tr>"+
		     "<td class=style40 colspan=12>&nbsp;</td>"+
	             "</tr>"+
	             "<tr>"+
		     "<td class=style40 colspan=1>&nbsp;</td>"+
		     "<td class=style40 colspan=11>**Expenditure from departments like IR,Medical,Admin,Construction,Payroll,Garage,Purchase etc. Figure supplied by Finance.</td>"+
	             "</tr>"+
                     "</table>";

        String sHtml_All1 = "<table class=styleHeadall1 >"+
	             "<tr>"+
		     "<td class=style30 colspan=12><strong>ESTIMATED MATERIALS(FOR CONSUMPTION AND STOCK BUILD UP) TO BE ORDERED BY MATERIALS DIVISION</strong></td>"+
	             "</tr>"+
	             "<tr>"+
		     "<td class=style40 colspan=6 align=left>Generation Division Budget "+sBgt_Fr_Year+"-"+sBgt_To_Year+" (Rs Lakh)</td>"+
		     "<td class=style40 colspan=6 align=right>Coal Oil and O&M Budget</td>"+
	             "</tr>"+
                     "</table>";

        String sHtml_All2_footer = "<table class=styleFootall2>"+
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
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
	             "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=12>A. Maintenance expenditure includes wages for contractors employee.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=12>B. 6% escalation in Material price and 10% escalation on contracted Labour Cost has been considered.Contractor Labour Wage Revision of TGS and NCGS Considered in "+sBgt_Fr_Year+"-"+sBgt_To_Year+".</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=12>C. <strong>&#39Coal Handling charges&#39</strong> includes the following heads only : 1)Consolidated Charges(CPT/FCI) 2)Railway men Salary 3)Inplant Shunting Charges 4)Other Railwaymen's pool car and 5)Coal Sampling & Testing Charges. Other heads, being controlled by System Control dept.,not included in this budget.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=12>D. <strong>&#39Admin and General Expenses&#39</strong> includes the following heads only : 1)General Establishment Charges(Chummery) 2)Petty Cash Expenses 3)Computer Maintenance Charges 4)Transport related to out station visits for station needs.Other heads,being controlled/monitored by Finance Dept,not included in this budget.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=12>E. Under<strong>&#39Rent,Rate,Tax & other fees&#39</strong>,only the following heads have been included:1)Boiler Directorate Charges 2)Weights & Measure Fees 3)Fire Service Licence Fees 4)Factory Licence Fees 5)Air & water Consent 6)Effluent & stack Monitoring Charges.Other heads,being controlled/monitored by Finance dept,not included in this budget.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=12>F. <strong>Apportioned cost of other divisions </strong>not considered.</td>"+
                            "</tr>"+
                            "</table>";

%>
<table style="width: 100%"  style="width:980px;">

<tr class="style2" style=background-color:'#FFD6C1';>
  <td class="style30">Sl No</td>
  <td class="style31">Budget Head</td>
  <td class="style33">BUDGET HEAD DESCRIPTION </td>
  <td class="style34">BBGS</td>
  <td class="style34">TGS</td>
  <td class="style34">SGS</td>
  <td class="style34">NCGS</td>
  <td class="style34">CTM</td>
  <td class="style34">ED(G)</td>
  <td class="style34">PF Station</td>
  <td class="style34">Gen Stn</td>
  <td class="style34">Gen Div</td>
</tr>

<%

           l1 = null;
           l1 = null;
           rows = null ;
           rows1 = null ;
           rows2 = null ;
           detailList = null ;
 
           l1 = new ArrayList() ;
           l2 = new ArrayList() ;
           rows = new ArrayList() ;
           rows1 = new ArrayList() ;
           rows2 = new ArrayList() ;
           detailList = new ArrayList() ;

           ps1 = mk.con.prepareStatement(" SELECT NVL(SL_NO_ROWVAL,' '), "+
                                         "        REPLACE(NVL(BGT_HD_ROWVAL,' '),'e','e '), "+
                                         "  REPLACE('<span style='||CHR(34)||'font-weight:lighter;background-color:#'|| "+
	                                 "    (SELECT COLOR_HEX  "+
                                         "            FROM BGT_COLOR  "+
	               		         "     WHERE COLOR_CD=NVL(DESC1_B_COLOR,1))||'; color:#'|| "+
	                                 "    (SELECT COLOR_HEX  "+
                                    	 "            FROM BGT_COLOR  "+
            			         "     WHERE COLOR_CD=NVL(DESC1_F_COLOR,1))||CHR(34)||'>'||NVL(DESC1,' ')||'</span>','\"',' ') Budg_Desc,"+
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
                                         "   WHERE COLOR_CD=NVL(DESC1_F_COLOR,1)) DESC_FNT_COLOR "+
	                                 "  FROM BGT_FORM2B_STRUC_ALL1 "+
                                         "  WHERE NVL(TRIM(BGT_TO_YR),'@@')= '@@' "+
                                         "  ORDER BY SL_NO_ROWORDER,BGT_HD_ROWORDER "); 

        rs1=ps1.executeQuery();

     //System.out.println("8888");
        while(rs1.next()){

      icnt = icnt+1;
/**** New Code Start ***/
              rows = new ArrayList() ;
              rows.add(rs1.getString(1)) ;/** SL NO ROWVAL **/
              rows.add(rs1.getString(2)) ;/** BGT HD ROWVAL **/
              rows.add(rs1.getString(3)) ;/** DESC **/
              rows.add(rs1.getString(4)) ;/** SUBT MKR **/
              rows.add(rs1.getString(5)) ;/** DESC1_B_COLOR**/
              rows.add(rs1.getString(6)) ;/** BGT_SEQ **/
              rows.add(rs1.getString(7)) ;/** AMT_NA_MKR **/
              rows.add(rs1.getString(8)) ;/** JUSTIFICATION**/

              rows.add(rs1.getString(9)) ;/** AMT_B_COLOR **/
              rows.add(rs1.getString(10)) ;/** AMT_F_COLOR **/
              rows.add(rs1.getString(11)) ;/** DESC1_F_COLOR **/
              //System.out.println("ADDING XXXX"+rs1.getString(6));

              l1.add(rows);
/**** New Code End ***/
                 
                       iLineNo = iLineNo + 1;

         } 
         rs1.close();
         ps1.close();

         rs1 = null;
         ps1 = null;
         rows=null;

         //System.out.println("8888AAAA "+sBgt_Fr_Year+","+sStn_cd+","+sSec_cd);

           ps1=mk.con.prepareStatement("SELECT B.BGT_SEQ,B.SL_NO_ROWORDER,B.BGT_HD_ROWORDER, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_BBGS,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_BBGS,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) bbgs_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_TGS,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_TGS,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) tgs_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_SGS,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_SGS,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) sgs_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_NCGS,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_NCGS,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) ncgs_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_CTM,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_CTM,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_CTM,0,B.NO_DEC_PLACES_CTM,B.NO_DEC_PLACES_CTM+1))) ctm_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_EDGE,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_EDGE,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) edge_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_PF_BBGS_TGS_SGS,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_PF_BBGS_TGS_SGS,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) pf_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_STN_BBGS_TGS_SGS_NCGS,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_STN_BBGS_TGS_SGS_NCGS,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) gen_stn_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_DIV_ALL6,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_DIV_ALL6,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) gen_div "
                                     + " FROM ( SELECT * "
                                     + "        FROM bgt_form2b_data_all1 "
	                             + "        WHERE bgt_yr = ? AND stn_cd = ? AND sec_cd = ? ) A, bgt_form2b_struc_all1 B "
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

                 System.out.println("AMt:"+rs1.getString(1)+","+rs1.getString(4)+","+rs1.getString(5));
                 rows.add(rs1.getString(4)) ;
                 rows.add(rs1.getString(5)) ;
                 rows.add(rs1.getString(6)) ;
                 rows.add(rs1.getString(7)) ;
                 rows.add(rs1.getString(8)) ;
                 rows.add(rs1.getString(9)) ;
                 rows.add(rs1.getString(10)) ;
                 rows.add(rs1.getString(11)) ;
                 rows.add(rs1.getString(12)) ;

                 l2.add(rows);

           }

           rs1.close();
           ps1.close();
     
           ps1=null;
           rs1=null;
           rows=null;


           for ( i=0; i<l1.size(); i++ ) {
                 totrec++ ;
                 rows1 = (List)l1.get(i) ;
                 rows2 = (List)l2.get(i) ;

                 System.out.println("RowSXXXX BGT_SEQ IN TWO LISTS"+rows1.get(5)+","+rows2.get(0));
                 System.out.println("rows1.size()"+rows1.size()+",rows2.size()"+rows2.size());

                 System.out.println("Head:"+rows1.get(0));
                 System.out.println(" Grp:"+rows1.get(1));
                 System.out.println("Desc:"+rows1.get(2));

                 if (rows1.get(5).equals(rows2.get(0))) {
                     sReadOnlyMkr="T";
                     rows = new ArrayList() ;
                     rows.add((String)rows1.get(0)) ;
                     rows.add((String)rows1.get(1)) ;
                     rows.add((String)rows1.get(2)) ;

                     for ( j=3; j<rows2.size(); j++ ) {
                         rows.add((String)rows2.get(j)) ;
                     }
                     rows.add("\"#"+(String)rows1.get(4)+"\"") ;
                     rows.add("\"#"+(String)rows1.get(8)+"\"") ;
                     rows.add("\"#"+(String)rows1.get(9)+"\"") ;
                     rows.add((String)rows1.get(10)) ;
                     rows.add((String)rows1.get(5)) ;

                     rows.add((String)rows1.get(7)) ;
                     rows.add((String)rows1.get(6)) ;
                     rows.add((String)rows1.get(3)) ;

                     rows.add(sReadOnlyMkr) ;

                     System.out.println("BGT_SEQ_ADDED:"+(String)rows1.get(5));
                 }
                 detailList.add(rows) ;
          }

          System.out.println("zzzzz");

          System.out.println("l1.size()"+l1.size());
          System.out.println("l2.size()"+l2.size());

          sSlNo           = " ";
          sHead           = " ";
          sDesc           = " ";
          sAmt            = " ";
          sTrColor        = " ";
          sAmtFColor      = " ";
          sAmtBColor      = " ";
          sCellFColor     = " ";
          sCellBColor     = " ";
          sDesc1FColor    = " ";
        //System.out.println("detailList.size() in EXCEL"+detailList.size());
          for( i=0; i <detailList.size(); i++){

             rows=null;
             rows = (List)detailList.get(i) ;
             //System.out.println("rows.size() at"+i+","+rows.size());

             sSlNo    = (String)rows.get(0);
             sHead    = (String)rows.get(1);
             sDesc    = (String)rows.get(2);
             sTrColor = (String)rows.get(12); 
             sCellBColor = (String)rows.get(13); 
             sAmtFColor = (String)rows.get(14);
             sDesc1FColor = (String)rows.get(15);
             System.out.println("Amt_ALL1 BBGS:"+i+","+(String)rows.get(3));
             System.out.println("Amt_ALL1 TGS:"+i+","+(String)rows.get(4));
             System.out.println("Amt_ALL1 SGS:"+i+","+(String)rows.get(5));
             System.out.println("Amt_ALL1 NCGS:"+i+","+(String)rows.get(6));
             System.out.println("Amt_ALL1 CTM:"+i+","+(String)rows.get(7));
             System.out.println("Amt_ALL1 ED(G):"+i+","+(String)rows.get(8));
             System.out.println("Amt_ALL1 PF STN:"+i+","+(String)rows.get(9));
             System.out.println("Amt_ALL1 GEN STN:"+i+","+(String)rows.get(10));
             System.out.println("Amt_ALL1 GEN DIV:"+i+","+(String)rows.get(11));
%>
<tr class="style2" style=background-color:<%= sTrColor %>;>
  <td class="style30"><%= sSlNo %></td>
  <td class="style31"><%= sHead %></td>
  <td class="style33"><%= sDesc %></td>
<%
            
             for ( j=3; j<=11; j++ ) {

                   sAmt = (String)rows.get(j);
%>

  <td class="style35" style=background-color:<%= sCellBColor %>;><%= sAmt %></td>

<%
             }

%>
</tr>
<%

        }
        System.out.println("ALL1 QUERY EXCEL ENDED");


%>
<%= sHtml_All1_footer %>
<br/>
<%= sHtml_All2 %>
<br/>
<table style="width: 100%"  style="width:980px;">

<tr class="style2" style=background-color:'#FFD6C1';>
  <td class="style30">Sl No</td>
  <td class="style31">Budget Head</td>
  <td class="style33">BUDGET HEAD DESCRIPTION </td>
  <td class="style34">BBGS</td>
  <td class="style34">TGS</td>
  <td class="style34">SGS</td>
  <td class="style34">NCGS</td>
  <td class="style34">CTM</td>
  <td class="style34">ED(G)</td>
  <td class="style34">PF Station</td>
  <td class="style34">Gen Stn</td>
  <td class="style34">Gen Div</td>
</tr>
<%

           l1 = null;
           l1 = null;
           rows = null ;
           rows1 = null ;
           rows2 = null ;
           detailList = null ;
 
           l1 = new ArrayList() ;
           l2 = new ArrayList() ;
           rows = new ArrayList() ;
           rows1 = new ArrayList() ;
           rows2 = new ArrayList() ;
           detailList = new ArrayList() ;

           ps1 = mk.con.prepareStatement(" SELECT NVL(SL_NO_ROWVAL,' '), "+
                                         "        REPLACE(NVL(BGT_HD_ROWVAL,' '),'e','e '), "+
                                         "  REPLACE('<span style='||CHR(34)||'font-weight:lighter;background-color:#'|| "+
	                                 "    (SELECT COLOR_HEX  "+
                                         "            FROM BGT_COLOR  "+
	               		         "     WHERE COLOR_CD=NVL(DESC1_B_COLOR,1))||'; color:#'|| "+
	                                 "    (SELECT COLOR_HEX  "+
                                    	 "            FROM BGT_COLOR  "+
            			         "     WHERE COLOR_CD=NVL(DESC1_F_COLOR,1))||CHR(34)||'>'||NVL(DESC1,' ')||'</span>','\"',' ') Budg_Desc,"+
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
                                         "   WHERE COLOR_CD=NVL(DESC1_F_COLOR,1)) DESC_FNT_COLOR "+
	                                 "  FROM BGT_FORM2B_STRUC_ALL2 "+
                                         "  WHERE NVL(TRIM(BGT_TO_YR),'@@')= '@@' "+
                                         "  ORDER BY SL_NO_ROWORDER,BGT_HD_ROWORDER "); 

        rs1=ps1.executeQuery();

     //System.out.println("8888");
        while(rs1.next()){

      icnt = icnt+1;
/**** New Code Start ***/
              rows = new ArrayList() ;
              rows.add(rs1.getString(1)) ;/** SL NO ROWVAL **/
              rows.add(rs1.getString(2)) ;/** BGT HD ROWVAL **/
              rows.add(rs1.getString(3)) ;/** DESC **/
              rows.add(rs1.getString(4)) ;/** SUBT MKR **/
              rows.add(rs1.getString(5)) ;/** DESC1_B_COLOR**/
              rows.add(rs1.getString(6)) ;/** BGT_SEQ **/
              rows.add(rs1.getString(7)) ;/** AMT_NA_MKR **/
              rows.add(rs1.getString(8)) ;/** JUSTIFICATION**/

              rows.add(rs1.getString(9)) ;/** AMT_B_COLOR **/
              rows.add(rs1.getString(10)) ;/** AMT_F_COLOR **/
              rows.add(rs1.getString(11)) ;/** DESC1_F_COLOR **/
              //System.out.println("ADDING XXXX"+rs1.getString(6));

              l1.add(rows);
/**** New Code End ***/
                 
                       iLineNo = iLineNo + 1;

         } 
         rs1.close();
         ps1.close();

         rs1 = null;
         ps1 = null;
         rows=null;

         //System.out.println("8888AAAA "+sBgt_Fr_Year+","+sStn_cd+","+sSec_cd);

           ps1=mk.con.prepareStatement("SELECT B.BGT_SEQ,B.SL_NO_ROWORDER,B.BGT_HD_ROWORDER, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_BBGS,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_BBGS,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) bbgs_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_TGS,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_TGS,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) tgs_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_SGS,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_SGS,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) sgs_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_NCGS,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_NCGS,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) ncgs_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_CTM,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_CTM,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_CTM,0,B.NO_DEC_PLACES_CTM,B.NO_DEC_PLACES_CTM+1))) ctm_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_EDGE,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_EDGE,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) edge_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_PF_BBGS_TGS_SGS,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_PF_BBGS_TGS_SGS,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) pf_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_STN_BBGS_TGS_SGS_NCGS,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_STN_BBGS_TGS_SGS_NCGS,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) gen_stn_tot, "
                                     + "  DECODE(TRIM(TO_CHAR(NVL(A.AMT_DIV_ALL6,0),'99990.999')),'0.000',' ',SUBSTR(TO_CHAR(NVL(A.AMT_DIV_ALL6,0),'99990.999'),0,6+DECODE(B.NO_DEC_PLACES_STN,0,B.NO_DEC_PLACES_STN,B.NO_DEC_PLACES_STN+1))) gen_div "
                                     + " FROM ( SELECT * "
                                     + "        FROM bgt_form2b_data_all2 "
	                             + "        WHERE bgt_yr = ? AND stn_cd = ? AND sec_cd = ? ) A, bgt_form2b_struc_all2 B "
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
                 rows.add(rs1.getString(11)) ;
                 rows.add(rs1.getString(12)) ;

                 l2.add(rows);

           }

           rs1.close();
           ps1.close();
     
           ps1=null;
           rs1=null;
           rows=null;


           for ( i=0; i<l1.size(); i++ ) {
                 totrec++ ;
                 rows1 = (List)l1.get(i) ;
                 rows2 = (List)l2.get(i) ;

                 System.out.println("RowSXXXX BGT_SEQ IN TWO LISTS"+rows1.get(5)+","+rows2.get(0));
                 System.out.println("rows1.size()"+rows1.size()+",rows2.size()"+rows2.size());

                 System.out.println("Head:"+rows1.get(0));
                 System.out.println(" Grp:"+rows1.get(1));
                 System.out.println("Desc:"+rows1.get(2));

                 if (rows1.get(5).equals(rows2.get(0))) {
                     sReadOnlyMkr="T";
                     rows = new ArrayList() ;
                     rows.add((String)rows1.get(0)) ;
                     rows.add((String)rows1.get(1)) ;
                     rows.add((String)rows1.get(2)) ;

                     for ( j=3; j<rows2.size(); j++ ) {
                         rows.add((String)rows2.get(j)) ;
                     }
                     rows.add("\"#"+(String)rows1.get(4)+"\"") ;
                     rows.add("\"#"+(String)rows1.get(8)+"\"") ;
                     rows.add("\"#"+(String)rows1.get(9)+"\"") ;
                     rows.add((String)rows1.get(10)) ;
                     rows.add((String)rows1.get(5)) ;

                     rows.add((String)rows1.get(7)) ;
                     rows.add((String)rows1.get(6)) ;
                     rows.add((String)rows1.get(3)) ;

                     rows.add(sReadOnlyMkr) ;

                     System.out.println("BGT_SEQ_ADDED:"+(String)rows1.get(5));
                 }
                 detailList.add(rows) ;
          }

          System.out.println("zzzzz");

          System.out.println("l1.size()"+l1.size());
          System.out.println("l2.size()"+l2.size());

          sSlNo           = " ";
          sHead           = " ";
          sDesc           = " ";
          sAmt            = " ";
          sTrColor        = " ";
          sAmtFColor      = " ";
          sAmtBColor      = " ";
          sCellFColor     = " ";
          sCellBColor     = " ";
          sDesc1FColor     = " ";
        //System.out.println("detailList.size() in EXCEL"+detailList.size());
          for( i=0; i <detailList.size(); i++){

             rows=null;
             rows = (List)detailList.get(i) ;
             //System.out.println("rows.size() at"+i+","+rows.size());

             sSlNo    = (String)rows.get(0);
             sHead    = (String)rows.get(1);
             sDesc    = (String)rows.get(2);
             sTrColor = (String)rows.get(12); 
             sCellBColor = (String)rows.get(13); 
             sAmtFColor = (String)rows.get(14);
             sDesc1FColor = (String)rows.get(15);

             System.out.println("Amt_ALL2 BBGS:"+i+","+(String)rows.get(3));
             System.out.println("Amt_ALL2 TGS:"+i+","+(String)rows.get(4));
             System.out.println("Amt_ALL2 SGS:"+i+","+(String)rows.get(5));
             System.out.println("Amt_ALL2 NCGS:"+i+","+(String)rows.get(6));
             System.out.println("Amt_ALL2 CTM:"+i+","+(String)rows.get(7));
             System.out.println("Amt_ALL2 ED(G):"+i+","+(String)rows.get(8));
             System.out.println("Amt_ALL2 PF STN:"+i+","+(String)rows.get(9));
             System.out.println("Amt_ALL2 GEN STN:"+i+","+(String)rows.get(10));
             System.out.println("Amt_ALL2 GEN DIV:"+i+","+(String)rows.get(11));
%>
<tr class="style2" style=background-color:<%= sTrColor %>;>
  <td class="style30"><%= sSlNo %></td>
  <td class="style31"><%= sHead %></td>
  <td class="style33"><%= sDesc %></td>
<%
            
             for ( j=3; j<=11; j++ ) {

                   sAmt = (String)rows.get(j);
%>

  <td class="style35" style=background-color:<%= sCellBColor %>;><%= sAmt %></td>

<%
             }

%>
</tr>
<%

        }
        System.out.println("ALL2 EXCEL QUERY ENDED");

%>

</table>
<%= sHtml_All2_footer %>
<br/>

<%

  }catch(Exception e1){
         System.out.println(e1);      
         e1.printStackTrace();
  }
  finally{

     System.out.println("In finally");
     if(rs1!=null){
        System.out.println("in if");
        rs1.close();
        System.out.println("Rs1 closed");
        rs1 = null;
     }
     if(ps1!=null){
        System.out.println("in if");
        ps1.close();
        System.out.println("Ps1 closed");
        ps1 = null;
     }

     mk.con.close();
     mk=null;

     System.out.println("generation_budget_compiled_forexcel.jsp closed"+request.getRemoteAddr());
  
}
%>

</div>

</body>

</html>
