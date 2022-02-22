
<%@ page import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,java.text.*"%>
<%@ page import="java.util.*,java.io.*,java.lang.*,java.util.Date" %>
<%@ page import="genOrblJavaPackage.*" %>


<html>
 <head>
 <title>TERM ORDER LETTER</title>

 <script type="text/javascript" src ="mc.js"></script>
 <script type ="text/javascript">

   function get_Height(){

    var table_height = $("#main_table").height();

    var last_pg_height = table_height%1360;

    var extra_height = 1360 - last_pg_height;

    $("#main_table").height(table_height+parseInt(extra_height));

   }
 </script>


  <style type="text/css">
  
     .style1 {
              font-family:"Times New Roman", Times, serif;
              font-size:16px;
              font-weight:bold;
             }
             
     .style2 {
              font-family:Verdana;
              font-size:16px;
             }

     @media print {
             thead {display: table-header-group; }
             tfoot {display: table-footer-group; }
             .style3 {page-break-before:always;}
             font { font-size:18px; }


     }

     @media screen {
          /* thead { display: none;}
           tfoot { display: none;}*/
      }
 
  </style>
 </head>

 <body onload= "get_Height();">
<%

  String ord_ref   = new String("");
  String copy_typ  = new String("");
  String lthd      = new String("");

  copy_typ   = request.getParameter("cpy");
  ord_ref    = request.getParameter("sOrdId");
  lthd       = request.getParameter("lthd");

  if(!ord_ref.equals("")){

    System.out.println(" GENORBL TERM ORDER ID    "+ord_ref);

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    PreparedStatement ps     = null;
    ResultSet         rs     = null;
    mk.con.setAutoCommit(false);


    String order_no                  = new String("");
    String order_date                = new String(""); /*** Heading **/

    String vendor_name               = new String(""); /*** Vendor Part ***/
    String address1                  = new String("");
    String address2                  = new String("");
    String address3                  = new String("");
    String address4                  = new String("");
    String address5                  = new String("");

    String clubbed                   = new String(""); /*** Quatation Part ***/
    String p1_q1_no                  = new String("");
    String p1_q1_date                = new String("");
    String p1_q2_no                  = new String("");
    String p1_q2_date                = new String("");
    String p1_q3_no                  = new String("");
    String p1_q3_date                = new String("");

    String erp_code                  = new String(""); /*** Account No. & Budget Head ***/
    String budget_head               = new String("");

    String job_desc                  = new String(""); /*** Scope of Work ***/

    String term_renew                = new String(""); /*** TC_Rev & Order Type ( Conditions for paragraphs ) ***/
    String order_type                = new String("");

    String p1_total                  = new String(""); /*** Para 1 ***/
    String bill_frequency            = new String("");
    String retention_prcnt           = new String("");
    String tc_from                   = new String("");
    String tc_to                     = new String("");

    String rate_contract_remarks     = new String(""); /*** Para 2 ***/

    String prev_order_no             = new String(""); /*** Para 3 ***/
    String prev_order_date           = new String("");

    String esi_clause                = new String(""); /*** Clause 2 ***/

    String job_place                 = new String(""); /*** Clause 3 ***/

    String safety_related            = new String(""); /*** Clause 4 ***/

    String scmp_clause               = new String(""); /*** Clause 4 ***/

    String environment_clause        = new String(""); /*** Clause 5 ***/
    String annex                     = new String("");

    String job_complete              = new String(""); /*** Clause 7 ***/

    String p1_labour_total           = new String(""); /*** Service Tax & VAT ***/
    String p1_material_total         = new String("");
    String p1_others_total           = new String("");

    String months_between_tc         = new String("");

/**************************** VARIABLES FOR PAGE 1 END *****************************************/



    String amt_in_words              = new String("");



    String signatory                 = new String(""); 
    String signatory_loc             = new String(""); 
    String l1_signatory              = new String("");
    String l2_signatory              = new String("");
    String l3_signatory              = new String("");
    String station                   = new String("");

    float p1_total_join              = 0;
    String order_tax_type            = new String("");


    try{

   

   
    String qry            = new String("");

				                    
qry = " SELECT                                                                       " +
"     NVL( ORDER_NO		                     ,' ')   ORDER_NO		   , " + /* Heading */
"     NVL(TO_CHAR( ORDER_DATE	      ,'DD-MON-RRRR'),' ')   ORDER_DATE	           , " +   
"     NVL( o.VENDOR_NAME		             ,' ')   VENDOR_NAME           , " + /* Vendor Name & Address */
"     NVL( v.ADDRESS1	             	             ,' ')   ADDRESS1              , " +
"     NVL( v.ADDRESS2	             	             ,' ')   ADDRESS2              , " +
"     NVL( v.ADDRESS3	             	             ,' ')   ADDRESS3              , " +
"     NVL( v.ADDRESS4	             	             ,' ')   ADDRESS4              , " +
"     NVL( v.ADDRESS5	             	             ,' ')   ADDRESS5              , " +
"     NVL( CLUBBED		                     ,' ')   CLUBBED		   , " + /* Quotation Heading */
"     NVL( P1_Q1_NO		                     ,' ')   P1_Q1_NO	           , " +
"     NVL( P1_Q2_NO		                     ,' ')   P1_Q2_NO	           , " +
"     NVL( P1_Q3_NO		                     ,' ')   P1_Q3_NO	           , " +
"     NVL( JOB_DESC		                     ,' ')   JOB_DESC		   , " + /* Scope of Work */
"     TO_CHAR(NVL( TERM_RENEW	       ,0))                  TERM_RENEW	           , " +
"     NVL( ORDER_TYPE		                     ,' ')   ORDER_TYPE		   , " + /* Para Conditions */
"     NVL( ERP_CODE		                     ,' ')   ERP_CODE		   , " + /* ACC NO. & BUDGET HEAD */
"     NVL(TO_CHAR( P1_Q1_DATE	      ,'DD-MON-RRRR'),' ')  P1_Q1_DATE	           , " +
"     NVL(TO_CHAR( P1_Q2_DATE	      ,'DD-MON-RRRR'),' ')  P1_Q2_DATE	           , " +
"     NVL(TO_CHAR( P1_Q3_DATE	      ,'DD-MON-RRRR'),' ')  P1_Q3_DATE	           , " +
"     NVL(TO_CHAR( TC_FROM	      ,'DD-MON-RRRR'),' ')  TC_FROM	           , " +
"     NVL(TO_CHAR( TC_TO	      ,'DD-MON-RRRR'),' ')  TC_TO                  , " +
"     NVL(TO_CHAR(ROUND(MONTHS_BETWEEN (TRUNC(TC_TO),TRUNC(TC_FROM)))),' ') MONTHS_BETWEEN_TC , " +
"     NVL(TO_CHAR( PREV_ORDER_DATE    ,'DD-MON-RRRR'),' ')  PREV_ORDER_DATE        , " +
"     NVL(TO_CHAR( P2_Q1_DATE	      ,'DD-MON-RRRR'),' ')  P2_Q1_DATE	           , " +
"     NVL(TO_CHAR( P2_Q2_DATE	      ,'DD-MON-RRRR'),' ')  P2_Q2_DATE	           , " +
"     NVL(TO_CHAR( P2_Q3_DATE	      ,'DD-MON-RRRR'),' ')  P2_Q3_DATE	           , " +
"     NVL(TO_CHAR( P3_Q1_DATE	      ,'DD-MON-RRRR'),' ')  P3_Q1_DATE	           , " +
"     NVL(TO_CHAR( P3_Q2_DATE	      ,'DD-MON-RRRR'),' ')  P3_Q2_DATE	           , " +
"     NVL(TO_CHAR( P3_Q3_DATE	      ,'DD-MON-RRRR'),' ')  P3_Q3_DATE	           , " +
"     TO_CHAR(NVL( P1_Q2_TOTAL   , 0),'9999999,99,99,990.09')  P1_Q2_TOTAL	   , " +
"     TO_CHAR(NVL( P1_Q3_TOTAL	 , 0),'9999999,99,99,990.09')  P1_Q3_TOTAL	   , " +
"             NVL( P1_TOTAL      , 0)                       P1_TOTAL_JOIN	   , " +
"     TO_CHAR(NVL( P1_TOTAL      , 0),'9999999,99,99,990.09')  P1_TOTAL	           , " +
"     TO_CHAR(NVL( P2_Q1_TOTAL   , 0),'9999999,99,99,990.09')  P2_Q1_TOTAL	   , " +
"     TO_CHAR(NVL( P2_Q2_TOTAL   , 0),'9999999,99,99,990.09')  P2_Q2_TOTAL	   , " +
"     TO_CHAR(NVL( P2_Q3_TOTAL   , 0),'9999999,99,99,990.09')  P2_Q3_TOTAL	   , " +
"     TO_CHAR(NVL( P3_Q1_TOTAL   , 0),'9999999,99,99,990.09')  P3_Q1_TOTAL	   , " +
"     TO_CHAR(NVL( P3_Q2_TOTAL	 , 0),'9999999,99,99,990.09')  P3_Q2_TOTAL	   , " +
"     TO_CHAR(NVL( P3_Q3_TOTAL	 , 0),'9999999,99,99,990.09')  P3_Q3_TOTAL	   , " +
"     TO_CHAR(NVL( P1_LABOUR_TOTAL, 0),'9999999,99,99,990.09') P1_LABOUR_TOTAL	   , " +
"     TO_CHAR(NVL( P1_MATERIAL_TOTAL, 0),'9999999,99,99,990.09') P1_MATERIAL_TOTAL , " +
"     TO_CHAR(NVL( P1_OTHERS_TOTAL, 0),'9999999,99,99,990.09') P1_OTHERS_TOTAL     , " +
"     TO_CHAR(NVL( RETENTION_PRCNT     ,0))                 RETENTION_PRCNT        , " +   /*NUMBER */
"     TO_CHAR(NVL( BILL_FREQUENCY_REV  ,0))                 BILL_FREQUENCY_REV     , " +
"     TO_CHAR(NVL( o.VENDOR_CODE       ,0))                 VENDOR_CODE	           , " +
"     NVL( ESI_CLAUSE                                ,' ')   ESI_CLAUSE            , " +  /* VARCHAR */
"     NVL( JOB_COMPLETE		                     ,' ')   JOB_COMPLETE	   , " +
"     NVL( JOB_TYPE		                     ,' ')   JOB_TYPE		   , " +
"     NVL( BILL_FREQUENCY		             ,' ')   BILL_FREQUENCY	   , " +
"     NVL( SAFETY_RELATED		             ,' ')   SAFETY_RELATED	   , " +
"     NVL( SCMP_CLAUSE   		             ,' ')   SCMP_CLAUSE   	   , " +
"     NVL( ENVIRONMENT_CLAUSE	                     ,' ')   ENVIRONMENT_CLAUSE	   , " +
"     NVL( JOB_PLACE		                     ,' ')   JOB_PLACE		   , " +
"     NVL( P2_VENDOR_NAME		             ,' ')   P2_VENDOR_NAME	   , " +
"     NVL( P2_Q1_NO		                     ,' ')   P2_Q1_NO		   , " +
"     NVL( P2_Q2_NO		                     ,' ')   P2_Q2_NO		   , " +
"     NVL( P2_Q3_NO		                     ,' ')   P2_Q3_NO		   , " +
"     NVL( P3_VENDOR_NAME		             ,' ')   P3_VENDOR_NAME	   , " +
"     NVL( P3_Q1_NO		                     ,' ')   P3_Q1_NO		   , " +
"     NVL( P3_Q2_NO		                     ,' ')   P3_Q2_NO		   , " +
"     NVL( P3_Q3_NO		                     ,' ')   P3_Q3_NO		   , " +
"     NVL( PREV_ORDER_NO		             ,' ')   PREV_ORDER_NO	   , " +
"     NVL( o.ORD_ORGN_STN		             ,' ')   STATION		   , " +
"     NVL( ANNEX			             ,' ')   ANNEX		   , " +
"     NVL( RATE_CONTRACT_REMARKS	             ,' ')   RATE_CONTRACT_REMARKS , " +
"     NVL( BUDGET_HEAD		                     ,' ')   BUDGET_HEAD	   , " +
"     NVL( CAPEX_SCHEME_NO	                     ,' ')   CAPEX_SCHEME_NO	   , " +
"     DPG_AMT2WORDS.DFN_AMT2WORDS2(P1_TOTAL) AMT_IN_WORDS                          , " +
"     case when order_date < '01-jul-2017'                                           " +
"          then 'service_tax'                                                        " +
"          else 'gst'                                                                " +
"     end order_tax_type                                                             " +
"     FROM                                                                           " +
"     ORBL_ORD_DTL o, ORBL_VENDOR_MST v                                              " +
"     WHERE                                                                          " +
"           o.VENDOR_CODE = v.VENDOR_CODE                                            " +
"     AND   o.ORDER_ID    = TO_NUMBER(?)                                             " ;


        ps =  mk.con.prepareStatement(qry);

        ps.setString(1,ord_ref);
	
        rs    = ps.executeQuery();

        while(rs.next()){

         order_no                  = rs.getString(" ORDER_NO           	 ".trim());
         order_date                = rs.getString(" ORDER_DATE         	 ".trim());
         vendor_name               = rs.getString(" VENDOR_NAME        	 ".trim());
         address1                  = rs.getString(" ADDRESS1           	 ".trim());
         annex                     = rs.getString(" ANNEX           	 ".trim());
         address2                  = rs.getString(" ADDRESS2           	 ".trim());
         address3                  = rs.getString(" ADDRESS3           	 ".trim());
         address4                  = rs.getString(" ADDRESS4           	 ".trim());
         address5                  = rs.getString(" ADDRESS5           	 ".trim());
         clubbed                   = rs.getString(" CLUBBED            	 ".trim());
         p1_q1_no                  = rs.getString(" P1_Q1_NO           	 ".trim());
         p1_q1_date                = rs.getString(" P1_Q1_DATE         	 ".trim());
         p1_q2_no                  = rs.getString(" P1_Q2_NO           	 ".trim());
         p1_q2_date                = rs.getString(" P1_Q2_DATE         	 ".trim());
         p1_q3_no                  = rs.getString(" P1_Q3_NO           	 ".trim());
         p1_q3_date                = rs.getString(" P1_Q3_DATE         	 ".trim());
         erp_code                  = rs.getString(" ERP_CODE           	 ".trim());
         order_type                = rs.getString(" ORDER_TYPE         	 ".trim());
         budget_head               = rs.getString(" BUDGET_HEAD        	 ".trim());
         job_desc                  = rs.getString(" JOB_DESC           	 ".trim());
         job_complete              = rs.getString(" JOB_COMPLETE       	 ".trim());
         esi_clause                = rs.getString(" ESI_CLAUSE         	 ".trim());
         job_place                 = rs.getString(" JOB_PLACE          	 ".trim());
         safety_related            = rs.getString(" SAFETY_RELATED     	 ".trim());
         scmp_clause               = rs.getString(" SCMP_CLAUSE        	 ".trim());
         environment_clause        = rs.getString(" ENVIRONMENT_CLAUSE 	 ".trim());
         retention_prcnt           = rs.getString(" RETENTION_PRCNT    	 ".trim());
         station                   = rs.getString(" STATION            	 ".trim());
         term_renew                = rs.getString(" TERM_RENEW           ".trim());
         bill_frequency            = rs.getString(" BILL_FREQUENCY       ".trim());
         p1_total                  = rs.getString(" P1_TOTAL             ".trim());
         p1_labour_total           = rs.getString(" P1_LABOUR_TOTAL      ".trim());
         p1_material_total         = rs.getString(" P1_MATERIAL_TOTAL    ".trim());
         p1_others_total           = rs.getString(" P1_OTHERS_TOTAL      ".trim());
         tc_from                   = rs.getString(" TC_FROM              ".trim());
         tc_to                     = rs.getString(" TC_TO                ".trim());
         rate_contract_remarks     = rs.getString(" RATE_CONTRACT_REMARKS".trim());
         prev_order_no             = rs.getString(" PREV_ORDER_NO".trim());
         prev_order_date           = rs.getString(" PREV_ORDER_DATE".trim());
         amt_in_words              = rs.getString(" AMT_IN_WORDS".trim());
         months_between_tc         = rs.getString(" MONTHS_BETWEEN_TC".trim());
         p1_total_join             = rs.getFloat ("P1_TOTAL_JOIN");
         order_tax_type            = rs.getString ("order_tax_type");
    

        }

	rs.close();
	ps.close();
        ps=null;
        rs=null;
  
        SimpleDateFormat myDate = new SimpleDateFormat("dd-MMM-yyyy");
        Date date1 = myDate.parse(order_date);
        Date date2 = myDate.parse("21-JUL-2013");

        qry = " SELECT  NVL( FREQUENCY_DESC_LETT ,' ') FREQUENCY_DESC FROM ORBL_CD_BILL_FREQUENCY WHERE BILL_FREQUENCY = NVL(?,'#')  " ;

        ps =  mk.con.prepareStatement(qry);
        ps.setString(1,bill_frequency);
        rs    = ps.executeQuery();

        String freq_desc = new String();

        while(rs.next()){
            freq_desc = rs.getString("FREQUENCY_DESC".trim());
        }
	rs.close();
	ps.close();
        ps=null;
        rs=null;

        qry =        " SELECT  NVL( SIGNATORY      ,' ')   SIGNATORY             , " +
                     "         NVL( SIGNATORY_LOC  ,' ')   SIGNATORY_LOC         , " +
                     "         NVL( L1_SIGNATORY   ,' ')   L1_SIGNATORY          , " +
                     "         NVL( L2_SIGNATORY   ,' ')   L2_SIGNATORY          , " +
                     "         NVL( L3_SIGNATORY   ,' ')   L3_SIGNATORY            " +
                     "         FROM ORBL_CD_SIGNATORY_MST                          " +
                     "         WHERE   STATION     = ?                             " +
                     "           AND   LIMIT1     <= ?                             " +
                     "           AND   LIMIT2     >= ?                             " ;
        ps =  mk.con.prepareStatement(qry);

        ps.setString(1,station);
        ps.setFloat(2,p1_total_join);
        ps.setFloat(3,p1_total_join);
	
        rs    = ps.executeQuery();

        while(rs.next()){
                         signatory     = rs.getString(" SIGNATORY".trim());
                         signatory_loc = rs.getString(" SIGNATORY_LOC".trim());
                         l1_signatory  = rs.getString(" L1_SIGNATORY".trim());
                         l2_signatory  = rs.getString(" L2_SIGNATORY".trim());
                         l3_signatory  = rs.getString(" L3_SIGNATORY".trim());
        }

	rs.close();
	ps.close();
        ps=null;
        rs=null;
%>
   <table id="main_table" border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#111111">
<% if(copy_typ.equals("VENDOR") && lthd.equals("yes")){ %>
   <thead style ="height:20px;">
    <tr>
       <td width="50%" align ="left" style="padding-left:40px;">
          <img src ="rpsg_logo.jpg" style ="height:70px;width: 170px;" alt="NO HEADER">
       </td>
       <td width="50%" align ="right" style="padding-right:50px;">
          <img src ="cesc_logo.jpg" style ="height:70px;width: 170px;" alt="NO HEADER">
       </td>
    </tr>
    <tr>
       <td width="50%" align ="left">&nbsp; </td>
       <td width="50%" align ="right">&nbsp;</td>
    </tr>
   </thead>
   <tfoot style ="height:20px;">
    <tr>
<%   if(station.equals("002")){%>
       <td width="100%" align ="center" colspan="2"> <img src ="SGS_Footer.jpg"  style ="height:70px;width: 967px;" alt="NO FOOTER"></td>
<%    }else if(station.equals("013")){%>
       <td width="100%" align ="center" colspan="2"> <img src ="NCGS_Footer.jpg" style ="height:70px;width: 967px;" alt="NO FOOTER"></td>
<%    }else if(station.equals("014")){%>
       <td width="100%" align ="center" colspan="2"> <img src ="TGS_Footer.jpg"  style ="height:70px;width: 967px;" alt="NO FOOTER"></td>
<%    }else if(station.equals("016")){%>
       <td width="100%" align ="center" colspan="2"> <img src ="BBGS_Footer.jpg" style ="height:70px;width: 967px;" alt="NO FOOTER"></td>
<%    }else if(station.equals("019")){%>
       <td width="100%" align ="center" colspan="2"> <img src ="CTM_Footer.jpg"  style ="height:70px;width: 967px;" alt="NO FOOTER"></td>
<%    }else if(station.equals("042")){%>
       <td width="100%" align ="center" colspan="2"> <img src ="EDGS_Footer.jpg" style ="height:70px;width: 967px;" alt="NO FOOTER"></td>
<%    } %>
    </tr>
   </tfoot>
<% } else if(copy_typ.equals("VENDOR") && lthd.equals("no")){ %>
   <thead style ="height:40px;">
    <tr>
       <td width="50%" align ="left" style="padding-left:40px;">
         &nbsp;
       </td>
       <td width="50%" align ="right" style="padding-right:50px;">
          &nbsp;
       </td>
    </tr>
    <tr>
       <td width="50%" align ="left">&nbsp; </td>
       <td width="50%" align ="right">&nbsp;</td>
    </tr>
    <tr>
       <td width="50%" align ="left">&nbsp; </td>
       <td width="50%" align ="right">&nbsp;</td>
    </tr>
    <tr>
       <td width="50%" align ="left">&nbsp; </td>
       <td width="50%" align ="right">&nbsp;</td>
    </tr>
    <tr>
       <td width="50%" align ="left">&nbsp; </td>
       <td width="50%" align ="right">&nbsp;</td>
    </tr>
    <tr>
       <td width="50%" align ="left">&nbsp; </td>
       <td width="50%" align ="right">&nbsp;</td>
    </tr>
   </thead>
   <tfoot style ="height:40px;">
     <tr>
       <td width="100%" align ="center" colspan="2">&nbsp;</td>
    </tr>
   </tfoot>

<% } %>
   <tbody>
    <tr>
      <td colspan="2" valign="top">
      <div align="center" id="printReady"  style="width: 967px;" >
      <table border="0" cellpadding="0" cellspacing="0" width="88%" style="border-collapse: collapse" bordercolor="#111111">
<%     
        if(copy_typ.equals("FILE")){
%>
  <tr>
    <td colspan="2"><font face="Verdana" style="font-size:16px"><strong>File Copy </strong></font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

<%    
        }
%>
  <tr>
    <td align="left" width="50%" > <font face="Verdana" style="font-size:16px"><strong>Ref: <%=order_no%></strong></font></td>
    <td align="right" width="50%"> <font face="Verdana" style="font-size:16px"><strong>Date: <%=order_date%></strong></font></td>
  </tr>
  <tr>
    <td align="left" colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  </table>

  <table border="0" cellpadding="0" cellspacing="0" width="88%" style="border-collapse: collapse" bordercolor="#111111">
  <tr>
    <td colspan="2"><font face="Verdana" style="font-size:16px"><strong><%=vendor_name%></strong></font>
    &nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2"><font face="Verdana" style="font-size:16px">
       <%=address1%><br><%=address2%><br><%=address3%><br><%=address4%><br><%=address5%></font>
    </td>
  </tr>

<%
        if(clubbed.equals("N")){
%>
 <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="center" nowrap colspan="2"><font face="Verdana" style="font-size:16px">
    <strong>Your Quotation Number :</strong>&nbsp;<%=p1_q1_no%>,
    <strong>&nbsp;&nbsp;&nbsp;&nbsp;Dated:</strong>&nbsp;<%=p1_q1_date%>
    </font></td>
  </tr>

<%    
        }
        else if(clubbed.equals("Y")){
%>
     <tr>
       <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
     </tr>
     <tr>
       <td align="left" valign="top" width="32%"><font face="Verdana" style="font-size:16px">
             <strong>Your Quotation Numbers :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
         </font>
       </td>

       <td align="left" valign="center"><font face="Verdana" style="font-size:16px">
        <%=p1_q1_no%>,<strong> Dated: </strong><%=p1_q1_date%>;
<% 
         if(!p1_q2_no.equals(" ") && !p1_q2_date.equals(" ") ) {
%>
       <br><%=p1_q2_no%>,<strong> Dated: </strong><%=p1_q2_date%>;
<%
         }
         if(!p1_q3_no.equals(" ") && !p1_q3_date.equals(" ") ) {
%>
       <br><%=p1_q3_no%>,<strong> Dated: </strong><%=p1_q3_date%>;
<%
         }
%>
        </font>
       </td>
      </tr>
   <%
       }
        if(!copy_typ.equals("VENDOR")){
   %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="center" nowrap colspan="2"><font face="Verdana" style="font-size:16px">
    <i>
    <strong>Account no:</strong>&nbsp;<%=erp_code%>
     <br>
     <strong>&nbsp;&nbsp;&nbsp;&nbsp;Budget Head:</strong>&nbsp;<%=budget_head%>
    </i>
    </font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

<%
       }
%>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
 
  </table>
  <table border="0" cellpadding="0" cellspacing="0" width="88%" style="border-collapse: collapse" bordercolor="#111111">
  <tr>
    <td width="25%" valign="top"><div style=" text-align : justify; ">
          <font face="Verdana" style="font-size:16px">
            <strong>Scope of work :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></font></div></td>
    <td><div style=" text-align : justify; ">
                          <font face="Verdana" style="font-size:16px"><strong><%=job_desc%></strong></font>
                        </div>
    </td>

  </tr>

 <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><b><font face="Verdana" style="font-size:16px">Dear Sirs ,</font></b></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

<% 

    /*********************** Heading ************************************************/

    /*********************** Opening Lines ******************************************/

   if (Integer.parseInt(term_renew) == 0 && order_type.equals("T") ){
%>
  <tr>
    <td colspan="2"><div style=" text-align : justify; "><font face="Verdana" style="font-size:16px">

           We thank you for your above Quotation and are pleased to place this Order on you for
           the above mentioned job(s) at a cost of<b> Rs.<%=p1_total%></b> (Rupees <%=amt_in_words%>) <%=freq_desc%> and will be valid 
           for the period <%=tc_from%> to <%=tc_to%>. The amount includes your cost of establishment and general tools and
           tackles that will be required for carrying out the job.
<%

      if ( Integer.parseInt(retention_prcnt) > 0 ){

%>  

           Work beyond contracted duty hours, if any, shall be paid additionally at prevailing rate of overtime, wherever applicable.
<%

      }
%>
           This order may be further extended at the sole discretion of CESC Limited depending on the quality of services rendered
           by you or may be terminated at one months notice.
    </font>
    </div>
   </td>
 </tr>

  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>

<%

   }

   if (Integer.parseInt(term_renew) == 0 && order_type.equals("R") ){
%>
  <tr>
    <td colspan="2" ><div style=" text-align : justify; "><font face="Verdana" style="font-size:16px">

           We thank you for your above Quotation and are pleased to place this Order on you <%=rate_contract_remarks%>  for
           the above mentioned job(s) and will be valid for the period <%=tc_from%> to <%=tc_to%>. This order may be further extended
           at the sole discretion of CESC Limited depending on the quality of services rendered by you or may be terminated at one months
           notice.
    </font>
    </div>
   </td>
 </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

<%

   }
   System.out.println(order_type+"GGGGGG"+Integer.parseInt(term_renew));
   if (Integer.parseInt(term_renew) >  0 && order_type.equals("T") ){
%>
  <tr>
    <td colspan="2" ><div style=" text-align : justify; "><font face="Verdana" style="font-size:16px">

           We refer to our Order no <%=prev_order_no%>, dated <%=prev_order_date%> and your above Quotation and are pleased to extend
           the Order on you for a period of <%=months_between_tc%> months at a cost of<b> Rs.<%=p1_total%></b> (Rupees <%=amt_in_words%>) <%=freq_desc%> commencing from <%=tc_from%>. The amount includes your cost of establishment and general tools and tackles that will be required for carrying out the job.
<%

      if ( Integer.parseInt(retention_prcnt) > 0 ){

%>  

           Work beyond contracted duty hours, if any, shall be paid additionally at prevailing rate of overtime, wherever applicable.
<%

      }
%>
           This Order may be further extended at the sole discretion of CESC Limited depending on the quality of services rendered
           by you or may be terminated at one months notice.
   </font>
    </div>
   </td>
 </tr>

  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
<%

   }
   if (Integer.parseInt(term_renew) >   0 && order_type.equals("R") ){
%>
  <tr>
    <td colspan="2" ><div style=" text-align : justify; "><font face="Verdana" style="font-size:16px">
          We refer to our Order no <%=prev_order_no%>, dated <%=prev_order_date%> and your above Quotation and are pleased to extend
           this Order on you <%=rate_contract_remarks%> for period of <%=months_between_tc%> month(s) commencing from <%=tc_from%>.
           This Order may be further extended at the sole discretion of CESC Limited depending on the quality of services rendered
           by you or may be terminated at one months notice.
    </font>
    </div>
   </td>
 </tr>
<%

}

%>
  <tr>
    <td colspan="2"  >
      <div style=" text-align : justify; "> 
      <font face="Verdana" style="font-size:16px">
      All terminal benefits payable to your employees on cessation of their services for any reason whatsoever are to be borne by you.
      </font>
    </div>
    </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>

<% if( esi_clause.equals("Y") || environment_clause.equals("Y") || job_place.equals("I")|| safety_related.equals("Y") ){ %>
  <tr>
    <td colspan="2" ><div style=" text-align : justify; "><font face="Verdana" style="font-size:16px">
     This order is being placed on you subject to your observance of all statutory obligations and security instructions as applicable for working at our Generating Stations. Also note the following terms and conditions:</font>
    </div>
 </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>

<% /* '*********************** ESI Clause *************************************************/ %>

<%if(esi_clause.equals("Y")){%>
  <tr>
    <td colspan="2" ><div style=" text-align : justify; "><font face="Verdana" style="font-size:16px">
      You will be responsible for all statutory obligations under the Contract Labour (Regulation and Abolition) Act 1970, ESI Act 1948 and Employees' Provident Fund and Miscellaneous Provisions Act 1952.
    </font>
    </div>
 </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% } %>


<% /************************ JOB PLACE *************************************************/ %>


<%if(job_place.equals("I")){    /** Clause 3 Starts **/ %>     
  <tr>
    <td colspan="2" >
      <div style=" text-align : justify; "> 
     <font face="Verdana" style="font-size:16px">In particular you shall keep us indemnified against all claims and disputes arising out of accidents/damages to your workmen & staff, third parties and properties belonging to us. Necessary Workmen's Compensation Insurance shall be taken out by you accordingly.</font>
    </div>
    </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% /************************ Safety Clause **********************************************/ %>

<% if(safety_related.equals("Y")){ %>
      <tr>
        <td colspan="2" ><div style=" text-align : justify; ">
        <font face="Verdana" style="font-size:16px">You are to ensure safety of your workers at site while working and provide all kinds of safety equipments required for the job such as helmets, safety shoes, and other applicable personal protective devices to your workmen. Before execution of the job at site you are to take necessary permits to work from the concerned department.
<% if(scmp_clause.equals("Y")){ %>
       If there is any fatal, lost work day case(lwdc), violation of safe work practices and non-availability of required quality PPEs and safety gadgets found related to this job, penalization according to CESC Ltd's present Safety consequence management policy will be applicable.
    <% } %>
        </font></div></td>
      </tr>
      <tr>
        <td colspan="2"><font face="Verdana" style="font-size:16px">&nbsp;&nbsp; </font></td>
      </tr>
    <% } %>


<% /*********************** Environment Clause ************************************************/ %>

    <% if(environment_clause.equals("Y")){ %>
      <tr>
        <td colspan="2" > <div style=" text-align : justify; "><font face="Verdana" style="font-size:16px">Site cleaning must be done by you up to the satisfaction of the controlling officer after completion of the job. All scrap materials should be removed to the place specified by the controlling officer. A penalty up to 5% of the Order value will be applicable if scrap materials are not removed to the designated areas within 48 Hrs of completion of the job.</font></div></td>
      </tr>
      <tr>
        <td colspan="2"><font face="Verdana" style="font-size:16px">&nbsp;&nbsp; </font></td>
      </tr>
    <% } %>

<% } /** Clause 3 Ends **/  %>

  <tr>
    <td colspan="2" ><div style=" text-align : justify; "><font face="Verdana" style="font-size:16px">In addition to the terms and conditions specified above you will be required to ensure that all statutory payments as now is in force or as may be applicable from time to time are made to your workmen.</font></div></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>

<%if( !annex.equals(" ")){ %>
  <tr>
    <td colspan="2" >
     <div style=" text-align : justify; ">
     <font face="Verdana" style="font-size:16px">Other terms and conditions of the order are as detailed in the Annexure.</font>
     </div>
    </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% } %>

 <% if(!retention_prcnt.equals("0")){ %>

  <tr>
    <td colspan="2" ><div style=" text-align : justify; "><font face="Verdana" style="font-size:16px"><%=retention_prcnt%>% of the Labour component of billed value will be with held as retention and released only after ascertaining that all terminal payments, as applicable, have been made by you.</font></div></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% }

   } /***** End of Clause 1 ******/
 %>

<% if(job_complete.equals("N") &&  date1.after(date2) ){ %>

  <tr>
    <td colspan="2" ><div style=" text-align : justify; "><font face="Verdana" style="font-size:16px">After successful completion of the aforementioned job you may please send the bill to us for payment including Taxes as applicable.</font></div></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

<% } else if(job_complete.equals("N") && ( date1.before(date2) || date1.equals(date2) ) ){ %>
  <tr>
   <td colspan="2" ><div style=" text-align : justify; ">
    <font face="Verdana" style="font-size:16px">
       After successful completion of the aforementioned job you may please send the bill to us for payment including Service tax and Works Contract Tax as applicable.
    </font>
   </div></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

<% } %>

<% if(! (esi_clause.equals("Y") || environment_clause.equals("Y") || job_place.equals("I") || safety_related.equals("Y") ) && 
      !retention_prcnt.equals("0")){ %>
  <tr>
    <td colspan="2" ><div style=" text-align : justify; "><font face="Verdana" style="font-size:16px"><%=retention_prcnt%>% of the Labour component of billed value will be with held as retention and released only after ascertaining that all terminal payments, as applicable, have been made by you.</font></div></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
<% } %>

  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>

  <tr>
    <td colspan="2"><font face="Verdana" style="font-size:16px">Yours faithfully,</font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>

<% /*********************** Signatory *************************************************/ %>

  <tr>
    <td colspan="2"><strong><font face="Verdana" style="font-size:16px"><%=signatory%> <br>
<%=signatory_loc%>    </font></strong></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table>
<% /*********************** /Signatory *************************************************/ %>

<% if(!p1_labour_total.trim().equals("0.00") || !p1_material_total.trim().equals("0.00") || !p1_others_total.trim().equals("0.00")){ %>

<table border="1" cellpadding="0" cellspacing="0" width="80%" style="border-collapse: collapse;" bordercolor="#111111">

<% /*********************** Service tax amount *************************************************/ %>

<% if(order_tax_type.equals("service_tax") && !p1_labour_total.trim().equals("0.00")){ %>
  <tr>
    <td align="left" width="50%">
       <font face="Verdana" style="font-size:16px"><strong>Service Tax is chargeable on Amount </strong></font>
    </td>
    <td align="right" width="50%">
       <font face="Verdana" style="font-size:16px"><strong>Rs. <%=p1_labour_total.trim()%>&nbsp;<%=freq_desc.trim()%> </strong></font>
    </td>
  </tr>

<% } %>

<% /*********************** Value Added Tax Amount *************************************************/ %>


<% if(order_tax_type.equals("service_tax") && !p1_material_total.trim().equals("0.00")){ %>
  <tr>
    <td align="left" width="50%">
       <font face="Verdana" style="font-size:16px"><strong>Value Added Tax is chargeable on Amount </strong></font>
    </td>
    <td align="right" width="50%">
       <font face="Verdana" style="font-size:16px"><strong>Rs. <%=p1_material_total.trim()%>&nbsp;<%=freq_desc.trim()%></strong></font>
    </td>
  </tr>

<% } %>

<% /*********************** Other Consumables *************************************************/ %>
<% if(!p1_others_total.trim().equals("0.00")){ %>
  <tr>
    <td align="left" width="50%">
       <font face="Verdana" style="font-size:16px"><strong>Other Consumables </strong></font>
    </td>
    <td align="right" width="50%">
       <font face="Verdana" style="font-size:16px"><strong>Rs. <%=p1_others_total.trim()%>&nbsp;<%=freq_desc.trim()%></strong></font>
    </td>
  </tr>

<% } %>

</table>

<% } %>

<% /*********************** DGM (Finance) *************************************************/ %>

<% if(copy_typ.equals("FINANCE")){%>
<table border="0" cellpadding="0" cellspacing="0" width="80%" style="border-collapse: collapse" bordercolor="#111111">
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2" align="left"><font face="Verdana" style="font-size:16px">cc: The Dy. General Manager (Finance): For necessary actions as warranted
in terms and conditions of this order.</font></td>
  </tr>
</table>
<% } %>


<table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#111111">
      <tr>
      <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
      </tr>
</table>

<% if(copy_typ.equals("FILE")){


    String MC_vendor_name               = new String("");
    String MC_p1_q1_no	  	        = new String("");
    String MC_p1_q1_date	        = new String("");
    String MC_p1_q2_no		        = new String("");
    String MC_p1_q2_date	        = new String("");
    String MC_p1_q3_no		        = new String("");
    String MC_p1_q3_date	        = new String("");
 
    String MC_p2_vendor_name            = new String("");
    String MC_p2_q1_no	  	        = new String("");
    String MC_p2_q1_date	        = new String("");
    String MC_p2_q2_no		        = new String("");
    String MC_p2_q2_date	        = new String("");
    String MC_p2_q3_no		        = new String("");
    String MC_p2_q3_date	        = new String("");
 
    String MC_p3_vendor_name            = new String("");
    String MC_p3_q1_no	  	        = new String("");
    String MC_p3_q1_date	        = new String("");
    String MC_p3_q1_total	        = new String("");
    String MC_p3_q2_no		        = new String("");
    String MC_p3_q2_date	        = new String("");
    String MC_p3_q2_total	        = new String("");
    String MC_p3_q3_no		        = new String("");
    String MC_p3_q3_date	        = new String("");
    String MC_p3_q3_total	        = new String("");

    String MC_p1_total	                = new String("");
    String MC_p2_total	                = new String("");
    String MC_p3_total	                = new String("");

    String MC_amt_in_words1             = new String("");
    String MC_amt_in_words2             = new String("");
    String MC_amt_in_words3             = new String("");

    String MC_recommendation               = new String("");
    String MC_recommendation_desc          = new String("");
    String MC_recommendation_supplementary = new String("");

    String MC_last_edit_dt             = new String("");
    String MC_last_edit_by             = new String("");
    String MC_order_by                 = new String("");
    String MC_order_dt                 = new String("");

    String order_initiated_by          = new String("0");
    String last_edited_by              = new String("0");
  

    int p1_count    = 0;
    int p2_count    = 0;
    int p3_count    = 0;


  qry =  "  select                                                           " +
         "  NVL(TRIM(vendor_name), '$')                     vendor_name,     " +
         "  NVL(TRIM(p2_vendor_name), '$')               p2_vendor_name,     " +
         "  NVL(TRIM(p3_vendor_name), '$')               p3_vendor_name,     " +
         "  NVL(TRIM(p1_q1_no), '$') p1_q1_no,                               " +
         "  NVL(TRIM(p1_q2_no), '$') p1_q2_no,                               " +
         "  NVL(TRIM(p1_q3_no), '$') p1_q3_no,                               " +
         "  NVL(TRIM(p2_q1_no), '$') p2_q1_no,                               " +
         "  NVL(TRIM(p2_q2_no), '$') p2_q2_no,                               " +
         "  NVL(TRIM(p2_q3_no), '$') p2_q3_no,                               " +
         "  NVL(TRIM(p3_q1_no), '$') p3_q1_no,                               " +
         "  NVL(TRIM(p3_q2_no), '$') p3_q2_no,                               " +
         "  NVL(TRIM(p3_q3_no), '$') p3_q3_no,                               " +
         "  NVL(to_char(p1_q1_date, 'dd-MON-yyyy'), '$') p1_q1_date,         " +
         "  NVL(to_char(p1_q2_date, 'dd-MON-yyyy'), '$') p1_q2_date,         " +
         "  NVL(to_char(p1_q3_date, 'dd-MON-yyyy'), '$') p1_q3_date,         " + /* p1 ends */
         "  NVL(to_char(p2_q1_date, 'dd-MON-yyyy'), '$') p2_q1_date,         " +
         "  NVL(to_char(p2_q2_date, 'dd-MON-yyyy'), '$') p2_q2_date,         " +
         "  NVL(to_char(p2_q3_date, 'dd-MON-yyyy'), '$') p2_q3_date,         " + /* p2 ends */
         "  NVL(to_char(p3_q1_date, 'dd-MON-yyyy'), '$') p3_q1_date,         " +
         "  NVL(to_char(p3_q2_date, 'dd-MON-yyyy'), '$') p3_q2_date,         " +
         "  NVL(to_char(p3_q3_date, 'dd-MON-yyyy'), '$') p3_q3_date,         " + /* p3 ends */
         "  to_char(NVL(TRIM(p1_total), 0), '9999999,99,99,990.09')                                            p1_total,  " +
         "  to_char(NVL(TRIM(p2_q1_total), 0)+NVL(p2_q2_total, 0)+NVL(p2_q3_total, 0), '9999999,99,99,990.09') p2_total,  " +
         "  to_char(NVL(TRIM(p3_q1_total), 0)+NVL(p3_q2_total, 0)+NVL(p3_q3_total, 0), '9999999,99,99,990.09') p3_total,  " +
         "  DPG_AMT2WORDS.DFN_AMT2WORDS2(NVL(p1_total, 0))                                            amt_in_words1,   " +
         "  DPG_AMT2WORDS.DFN_AMT2WORDS2(NVL(p2_q1_total, 0)+NVL(p2_q2_total, 0)+NVL(p2_q3_total, 0)) amt_in_words2,   " +
         "  DPG_AMT2WORDS.DFN_AMT2WORDS2(NVL(p3_q1_total, 0)+NVL(p3_q2_total, 0)+NVL(p3_q3_total, 0)) amt_in_words3,   " +
         "  NVL(TRIM(recommendation_desc), '$') recommendation_desc,                                                   " +
         "  NVL(TRIM(recommendation_supplementary), '$') recommendation_supplementary,                                 " +
         "  NVL(to_char(order_date, 'dd-MON-yyyy'), ' ') order_date,                                                   " +
         "  NVL(to_char(last_edit_date, 'dd-MON-yyyy'), ' ') last_edit_date,                                           " + 
         "  NVL(TRIM(order_by), ' ') order_by,                                                                         " +
         "  NVL(TRIM(last_edit_by), ' ') last_edit_by,                                                                 " +  
         "  NVL(TRIM(o.recommendation), ' ') recommendation                                                           " +  
         "  from ORBL_ORD_DTL o,                                                                                       " +
         "  ORBL_CD_RECOMMENDATION r                                                                                   " +
         "  where order_id = ? and o.recommendation = r.recommendation(+)                                              ";

 //out.print(qry);
 

 ps  = mk.con.prepareStatement(qry);

 ps.setString(1, ord_ref);

 rs  = ps.executeQuery();

 //out.print("MC");

 while(rs.next()){

       MC_vendor_name                  =  rs.getString("vendor_name");
       MC_p2_vendor_name               =  rs.getString("p2_vendor_name");
       MC_p3_vendor_name               =  rs.getString("p3_vendor_name");

       MC_p1_q1_no                     =  rs.getString("p1_q1_no");
       MC_p1_q2_no                     =  rs.getString("p1_q2_no");
       MC_p1_q3_no                     =  rs.getString("p1_q3_no");

       MC_p2_q1_no                     =  rs.getString("p2_q1_no");
       MC_p2_q2_no                     =  rs.getString("p2_q2_no");
       MC_p2_q3_no                     =  rs.getString("p2_q3_no");

       MC_p3_q1_no                     =  rs.getString("p3_q1_no");
       MC_p3_q2_no                     =  rs.getString("p3_q2_no");
       MC_p3_q3_no                     =  rs.getString("p3_q3_no");

       MC_p1_q1_date                   =  rs.getString("p1_q1_date");
       MC_p1_q2_date                   =  rs.getString("p1_q2_date");
       MC_p1_q3_date                   =  rs.getString("p1_q3_date");

       MC_p2_q1_date                   =  rs.getString("p2_q1_date");
       MC_p2_q2_date                   =  rs.getString("p2_q2_date");
       MC_p2_q3_date                   =  rs.getString("p2_q3_date");

       MC_p3_q1_date                   =  rs.getString("p3_q1_date");
       MC_p3_q2_date                   =  rs.getString("p3_q2_date");
       MC_p3_q3_date                   =  rs.getString("p3_q3_date");

       MC_p1_total                     =  rs.getString("p1_total");
       MC_p2_total                     =  rs.getString("p2_total");
       MC_p3_total                     =  rs.getString("p3_total");

       MC_amt_in_words1                =  rs.getString("amt_in_words1");
       MC_amt_in_words2                =  rs.getString("amt_in_words2");
       MC_amt_in_words3                =  rs.getString("amt_in_words3");

       MC_recommendation               =  rs.getString("recommendation");
       MC_recommendation_desc          =  rs.getString("recommendation_desc");
       MC_recommendation_supplementary =  rs.getString("recommendation_supplementary");

       MC_last_edit_dt                 =  rs.getString("last_edit_date");
       MC_last_edit_by                 =  rs.getString("last_edit_by");
       MC_order_by                     =  rs.getString("order_by");
       MC_order_dt                     =  rs.getString("order_date");

 }
  rs.close();
  ps.close();
  ps=null;
  rs=null;

  qry =  "  select  NVL(TRIM(emp_fname), ' ') || ' ' || NVL(TRIM(emp_lname), ' ') order_initiated_by  " +
         "  FROM adm_emp_mst WHERE emp_code = ? " ;

  ps  = mk.con.prepareStatement(qry);

  ps.setString(1, MC_order_by);

  rs  = ps.executeQuery();

  while(rs.next()){

     order_initiated_by = rs.getString("order_initiated_by");
  }
  rs.close();
  ps.close();
  ps=null;
  rs=null;

  if(order_initiated_by.equals("0")){

    order_initiated_by = " ";
  }


  qry =  "  select  NVL(TRIM(emp_fname), ' ') || ' ' || NVL(TRIM(emp_lname), ' ') last_edited_by  " +
         "  FROM adm_emp_mst WHERE emp_code = ? " ;

  ps  = mk.con.prepareStatement(qry);

  ps.setString(1, MC_last_edit_by);

  rs  = ps.executeQuery();

  while(rs.next()){

     last_edited_by = rs.getString("last_edited_by");
  }
  rs.close();
  ps.close();
  ps=null;
  rs=null;

  if(last_edited_by.equals("0")){

    last_edited_by = " ";
  }

%>

<table border="0" cellpadding="0" cellspacing="0" width="88%"  style="border-collapse: collapse; " bordercolor="#111111">
  <tr class="style3">
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="center" nowrap colspan="2"><font face="Verdana" style="font-size:16px">
    <i>
    <strong>Account Number:</strong>&nbsp;<%=erp_code%>
    </i>
    </font></td>
  </tr>
  <tr>
    <td align="center" nowrap colspan="2"><font face="Verdana" style="font-size:16px">
    <i>
    <strong>Budget Head:</strong>&nbsp;<%=budget_head%>
    </i>
    </font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp; </td>
  </tr>

  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
<tr>
    <td align="left" nowrap colspan="2">
    <font face="Verdana" style="font-size:16px"><i><strong><u>Justification for Order No :</u></strong>&nbsp;<%=order_no%>
    <strong>&nbsp;&nbsp;&nbsp;&nbsp;</strong>&nbsp;</i></font></td>
</tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>

<% /**************************** FIRST QUOTATION BLOCK *********************************/ %>

<%if(!MC_p2_vendor_name.equals("$")){ %>
  <tr>
    <td align="left" nowrap colspan="2">
    <font face="Verdana" style="font-size:16px"><i><strong>Quotations Received :</strong></i></font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  </table>
<!-- MODIFICATION -->
  <table border="1" cellpadding="4" cellspacing="0" width="88%"  style="border-collapse: collapse; " bordercolor="#111111">

  <tr>
    <td align="center" nowrap><font face="Verdana" style="font-size:16px"><i><strong>Vendor No.</strong></i></font></td>
    <td align="center" nowrap><font face="Verdana" style="font-size:16px"><i><strong>Vendor Name</strong></i></font></td>
    <td align="center" nowrap><font face="Verdana" style="font-size:16px"><i><strong>Quotation No</strong></i></font></td>
    <td align="center" nowrap><font face="Verdana" style="font-size:16px"><i><strong>Quotation Date</strong></i></font></td>
    <td align="center" nowrap><font face="Verdana" style="font-size:16px"><i><strong>Amount </strong></i></font></td>
  </tr>
<% 
   if(!MC_p1_q1_no.equals("$")){
     p1_count = p1_count + 1;
   }
   if(!MC_p1_q2_no.equals("$")){
     p1_count = p1_count + 1;
   }
   if(!MC_p1_q3_no.equals("$")){
     p1_count = p1_count + 1;
   }
%> 
  <tr>
    <td align="center" rowspan="<%=p1_count%>"  ><font face="Verdana" style="font-size:16px">Vendor I</font></td>
    <td align="center" rowspan="<%=p1_count%>"  ><font face="Verdana" style="font-size:16px"><%=MC_vendor_name%></font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p1_q1_no.equals("$")){ %> <%=MC_p1_q1_no%> <% } %> </font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p1_q1_date.equals("$")){ %> <%=MC_p1_q1_date%> <% } %> </font></td>
    <td align="center" rowspan="<%=p1_count%>" ><font face="Verdana" style="font-size:16px"> <%=MC_p1_total%></font></td>
  </tr>

<% if(!MC_p1_q2_no.equals("$") ) {%>
  <tr>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p1_q2_no.equals("$")){ %> <%=MC_p1_q2_no%> <% } %></font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p1_q2_date.equals("$")){ %> <%=MC_p1_q2_date%> <% } %></font></td>
  </tr>
<%}%>

<% if(!MC_p1_q3_no.equals("$")) {%>
  <tr>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p1_q3_no.equals("$")){ %> <%=MC_p1_q3_no%> <% } %></font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p1_q3_date.equals("$")){ %> <%=MC_p1_q3_date%> <% } %></font></td>
  </tr>
<%}%>
<%}%>

<% /**************************** FIRST QUOTATION BLOCK ENDS *********************************/ %>

<% /**************************** P2 BLOCK CLAUSE (A) *********************************/ %>

  <%if(!MC_p2_vendor_name.equals("$")){ 
 
      if(!MC_p2_q1_no.equals("$")){
        p2_count = p2_count + 1;
      }
      if(!MC_p2_q2_no.equals("$")){
        p2_count = p2_count + 1;
      }
      if(!MC_p2_q3_no.equals("$")){
        p2_count = p2_count + 1;
      }
   %> 
  <tr>
    <td align="center" rowspan="<%=p1_count%>"  ><font face="Verdana" style="font-size:16px">Vendor II</font></td>
    <td align="center"  rowspan="<%=p1_count%>" ><font face="Verdana" style="font-size:16px"><%=MC_p2_vendor_name%></font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p2_q1_no.equals("$")){ %> <%=MC_p2_q1_no%> <% } %> </font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p2_q1_date.equals("$")){ %> <%=MC_p2_q1_date%> <% } %> </font></td>
    <td align="center" rowspan="<%=p2_count%>" ><font face="Verdana" style="font-size:16px"> <%=MC_p2_total%></font></td>
  </tr>

<% if(!MC_p2_q2_no.equals("$")) {%>
  <tr>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p2_q2_no.equals("$")){ %> <%=MC_p2_q2_no%> <% } %></font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p2_q2_date.equals("$")){ %> <%=MC_p2_q2_date%> <% } %></font></td>
  </tr>
<%}%>

<% if(!MC_p2_q3_no.equals("$")) {%>
  <tr>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p2_q3_no.equals("$")){ %> <%=MC_p2_q3_no%> <% } %></font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p2_q3_date.equals("$")){ %> <%=MC_p2_q3_date%> <% } %></font></td>
  </tr>
<%}%>

<% /**************************** /P2 BLOCK *********************************/ %>

<% /**************************** P3 BLOCK *********************************/ %>

  <%if(!MC_p3_vendor_name.equals("$")){
      if(!MC_p3_q1_no.equals("$")){
        p3_count = p3_count + 1;
      }
      if(!MC_p3_q2_no.equals("$")){
        p3_count = p3_count + 1;
      }
      if(!MC_p3_q3_no.equals("$")){
        p3_count = p3_count + 1;
      }
  %>
  <tr>
    <td align="center" rowspan="<%=p3_count%>" ><font face="Verdana" style="font-size:16px">Vendor III</font></td>
    <td align="center"  rowspan="<%=p3_count%>"><font face="Verdana" style="font-size:16px"><%=MC_p3_vendor_name%></font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p3_q1_no.equals("$")){ %> <%=MC_p3_q1_no%> <% } %> </font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p3_q1_date.equals("$")){ %> <%=MC_p3_q1_date%> <% } %> </font></td>
    <td align="center" rowspan="<%=p3_count%>" ><font face="Verdana" style="font-size:16px"><%=MC_p3_total%></font></td>
  </tr>
<% if(!MC_p3_q2_no.equals("$")) {%>
  <tr>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p3_q2_no.equals("$")){ %> <%=MC_p3_q2_no%> <% } %></font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p3_q2_date.equals("$")){ %> <%=MC_p3_q2_date%> <% } %></font></td>
  </tr>
<%}%>
<% if(!MC_p3_q3_no.equals("$")) {%>
  <tr>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p3_q3_no.equals("$")){ %> <%=MC_p3_q3_no%> <% } %></font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p3_q3_date.equals("$")){ %> <%=MC_p3_q3_date%> <% } %></font></td>
  </tr>
<%}%>
  <% } %>
  </table>
  <% } %>
<% /*********************************** PART II OF CLAUSE A **************************/ %>
  <%if(!MC_p2_vendor_name.equals("$")){ %>
  <table border="0" cellpadding="0" cellspacing="0" width="88%"  style="border-collapse: collapse; " bordercolor="#111111">
  <tr>
    <td align="left" colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td align="left" colspan="2">
    <font face="Verdana" style="font-size:16px">
     Quotation received from <strong> M/S <%=MC_vendor_name%></strong> being
    <%if(!MC_p3_vendor_name.equals("$")){%>
        lowest
    <% }else{ %>
        lower
    <% } %>
     , Order may please be placed on them.
    </font></td>
  </tr>

  <%if(!MC_recommendation_supplementary.equals("$")){%>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="left" nowrap colspan="2">
    <font face="Verdana" style="font-size:16px">
    <%=MC_recommendation_supplementary%>
    </font></td>
  </tr>
  <% } %>

  
<% /**************************** /P3 BLOCK *********************************/ %>

<% /**************************** CLAUSE (A) ENDS *********************************/ %>

</table>

<% /**************************** ONLY QUOTATION BLOCK *********************************/ %>
<% }else{ %>
  <table border="0" cellpadding="0" cellspacing="0" width="88%"  style="border-collapse: collapse; " bordercolor="#111111">
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="left" nowrap colspan="2">
    <font face="Verdana" style="font-size:16px"><i><strong>Only Quotation Received From :</strong></i></font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>


  </table>

  <table border="1" cellpadding="4" cellspacing="0" width="88%"  style="border-collapse: collapse; " bordercolor="#111111">

  <tr>
    <td align="center" nowrap><font face="Verdana" style="font-size:16px"><i><strong>Vendor No.</strong></i></font></td>
    <td align="center" nowrap><font face="Verdana" style="font-size:16px"><i><strong>Vendor Name</strong></i></font></td>
    <td align="center" nowrap><font face="Verdana" style="font-size:16px"><i><strong>Quotation No</strong></i></font></td>
    <td align="center" nowrap><font face="Verdana" style="font-size:16px"><i><strong>Quotation Date</strong></i></font></td>
    <td align="center" nowrap><font face="Verdana" style="font-size:16px"><i><strong>Amount </strong></i></font></td>
  </tr>

  <tr>
    <td align="center" rowspan="<%=p1_count%>"  ><font face="Verdana" style="font-size:16px">Vendor I</font></td>
    <td align="center" rowspan="<%=p1_count%>"  ><font face="Verdana" style="font-size:16px"><%=MC_vendor_name%></font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p1_q1_no.equals("$")){ %> <%=MC_p1_q1_no%> <% } %> </font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p1_q1_date.equals("$")){ %> <%=MC_p1_q1_date%> <% } %> </font></td>
    <td align="center" rowspan="<%=p1_count%>" ><font face="Verdana" style="font-size:16px"> <%=MC_p1_total%></font></td>
  </tr>

<% if(!MC_p1_q2_no.equals("$")) {%>
  <tr>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p1_q2_no.equals("$")){ %> <%=MC_p1_q2_no%> <% } %></font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p1_q2_date.equals("$")){ %> <%=MC_p1_q2_date%> <% } %></font></td>
  </tr>
<%}%>

<% if(!MC_p1_q3_no.equals("$")) {%>
  <tr>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p1_q3_no.equals("$")){ %> <%=MC_p1_q3_no%> <% } %></font></td>
    <td align="center" ><font face="Verdana" style="font-size:16px"><%if(!MC_p1_q3_date.equals("$")){ %> <%=MC_p1_q3_date%> <% } %></font></td>
  </tr>
<%}%>

<% /**************************** FIRST QUOTATION BLOCK ENDS *********************************/ %>

  </table>


  <table border="0" cellpadding="4" cellspacing="0" width="88%"  style="border-collapse: collapse; " bordercolor="#111111">
  <%if((MC_recommendation.equals("8") || MC_recommendation.equals("9")) &&  !prev_order_no.equals(" ") ){%>
     <%if(!MC_recommendation_desc.equals("$")){%>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="left" colspan="2">
    <font face="Verdana" style="font-size:16px">
    <%=MC_recommendation_desc%> <%=prev_order_no%>, dated <%=prev_order_date%>.
    </font></td>
  </tr>
     <% } %>
  <% } 
     else { %>
     <%if(!MC_recommendation_desc.equals("$")){%>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td align="left" colspan="2">
    <font face="Verdana" style="font-size:16px">
    <%=MC_recommendation_desc%>
    </font></td>
  </tr>
     <% } %>
  <% } %>
     <%if(!MC_recommendation_supplementary.equals("$")){%>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
     <tr>
       <td align="left" colspan="2">
       <font face="Verdana" style="font-size:16px">
       <%=MC_recommendation_supplementary%>
       </font></td>
     </tr>
     <% } %>
  <% } %>

<% /**************************** /ONLY QUOTATION BLOCK *********************************/ %>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <% if(!l3_signatory.equals("$") || !l2_signatory.equals("$") || !l1_signatory.equals("$")){%>
     <tr>
       <td align="left" nowrap colspan="2">
           <table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
           <tr valign="bottom" style="height:80px">
     <%if(!l3_signatory.equals("$")){%>
           <td align="center">
           <font face="Verdana" style="font-size:16px">
           <strong>
           <%=l3_signatory%>
           </strong></font>
           </td>
     <% } %>
     <%if(!l2_signatory.equals("$")){%>
           <td align="center">
           <font face="Verdana" style="font-size:16px">
           <strong>
           <%=l2_signatory%>
           </strong></font>
           </td>
     <% } %>
     <%if(!l1_signatory.equals("$")){%>
           <td align="center">
           <font face="Verdana" style="font-size:16px">
           <strong>
           <%=l1_signatory%>
           </strong></font>
           </td>
     <% } 
       }  %>
           </tr>
           </table>
       </td>
     </tr>

  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
     <tr>
       <td align="left" nowrap colspan="2">
           <table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111">
             <tr valign="bottom" style="height:30px">
                <td width="30%" style ="padding:5px;">
                    &nbsp;
                </td>
                <td width="35%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                      <strong> Name</strong></font>
                </td>
                <td width="35%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                      <strong> Date</strong></font>
                </td>
             </tr>
             <tr valign="bottom" style="height:30px">
                <td width="30%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                      <strong> Order Initiated By</strong></font>
                </td>
                <td width="35%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                        <%=order_initiated_by%>
                    </font>
                </td>
                <td width="35%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                        <%=MC_order_dt%>
                    </font>
                </td>
             </tr>
             <tr valign="bottom" style="height:30px">
                <td width="30%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                      <strong> Order last edited by</strong></font>
                </td>
                <td width="35%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                        <%=last_edited_by%>
                    </font>
                </td>
                <td width="35%" style ="padding:5px;">
                    <font face="Verdana" style="font-size:16px">
                        <%=MC_last_edit_dt%>
                    </font>
                </td>
             </tr>
           </table>
        
       </td>
     </tr>

</table>
<% } %>
</div>
</td>
</tr>

</tbody>
</table>

<!--
<center><input type="button" value="PRINT" onClick="this.style.visibility='hidden'; window.print();"></center>
-->
<%

      }catch(Exception ee){ ee.printStackTrace();}
         finally{
                if(rs!=null){
                   rs.close();
                }
                if(ps!=null){
                   ps.close();
                }
                System.out.println(" CCCCCC order_not_onetime.jsp CLOSED !!!");
                mk.con.close(); 
         }


 }
%>
</body>
</html>
