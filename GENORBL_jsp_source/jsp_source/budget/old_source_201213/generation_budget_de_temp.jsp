<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="java.io.*,javax.servlet.jsp.*,javax.ejb.EJB,javax.naming.*,java.util.*,java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="oracle.sql.*" %>
<%@ page import="oracle.jdbc.*" %>
<%@ page import="genOrblJavaPackage.*" %>

<html>

<head>
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ActiveWidgets Examples</title>

<!-- <script type="text/javascript" src="gen_check.js"></script> -->
<script src="aw.js" type="text/javascript"></script>
<link href="aw.css" rel="stylesheet">

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

/********************************************************************
/////////////////////////////////////////////////////////////////////

	C S S

/////////////////////////////////////////////////////////////////////
********************************************************************/

/********************************************************************
	Grid
********************************************************************/

/*	you may skip grid id (#myGrid) in all other rules
	- if the rule applies to all grids
	- if you have only one grid on your page */

	#myGrid { width: 980px; height: 460px }

/********************************************************************
	Rows
********************************************************************/

	#myGrid .aw-grid-row {height: 20px; border-bottom: 1px solid #000000}
	#myGrid .aw-grid-column {height: 20px; border-bottom: 1px solid #ccc}

	/* box model fix for strict doctypes, safari */
	.aw-strict #myGrid .aw-grid-row {padding-bottom: 3px;}

/*	#myGrid .aw-row-1 {color: blue} */

	/*	Alternate row colors */
	#myGrid .aw-alternate-even {background: #fff;}
	#myGrid .aw-alternate-odd {background: #eee;}

	//#myGrid .aw-alternate-even .aw-column-1 {background: #eee;}
	//#myGrid .aw-alternate-odd .aw-column-1 {background: #ddd;}

	/*	Highlight on mouseover, mousedown */
/*	#myGrid .aw-mouseover-row {background: #ccc;} */
/*	#myGrid .aw-mousedown-row {background: #999;} */

/*	#myGrid .aw-mouseover-row .aw-column-1 {background: #bbb;} */
/*	#myGrid .aw-mousedown-row .aw-column-1 {background: #888;} */

	/* Selected rows */
	#myGrid .aw-rows-selected {background: #316ac5;}
	//#myGrid .aw-rows-selected .aw-column-1 {background: #316ac5;}


/********************************************************************
	Columns
********************************************************************/

	#myGrid .aw-column-0 {width: 30px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-1 {width: 50px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-2 {width: 500px; text-align: left; border-right: 1px solid #000000}
	#myGrid .aw-column-3 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-4 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-5 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-6 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-7 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-8 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-9 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-10 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-11 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-12 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-13 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-14 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-15 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-16 {width: 1000px; text-align: center; border-right: 1px solid #000000}

	/* box model fix for strict doctypes, safari */
	.aw-strict #myGrid .aw-column-0 {padding-bottom: 3px;}
	.aw-strict #myGrid .aw-column-1 {padding-bottom: 3px;}


/********************************************************************
	Cells
********************************************************************/

/*	#myGrid .aw-row-2 .aw-column-1 {color: red; font-style: italic} */

	/*	Highlight on mouseover, mousedown */
/*	#myGrid .aw-mouseover-cell {color: red;} 		*/
/*	#myGrid .aw-mousedown-cell {background: #666;}	*/

	/* Selected cells */
	//#myGrid .aw-grid-row .aw-cells-selected {background: #316ac5;}
	#myGrid .aw-grid-row .aw-cells-selected {background: #FFFFCC; color: #000000 }

/********************************************************************
	Headers
********************************************************************/

	#myGrid .aw-grid-headers {color: blue}
	#myGrid .aw-grid-headers .aw-column-1 {font-weight: bold}

	/*	Highlight on mouseover, mousedown */
	#myGrid .aw-mouseover-header {color: red;}
	#myGrid .aw-mousedown-header {color: yellow;}

	#myGrid .aw-header-1 {background: #def}

/********************************************************************
	Row selectors
********************************************************************/

	#myGrid .aw-row-selector {width: 20px; text-align: center}
	#myGrid .aw-row-2 .aw-row-selector {font-weight: bold}
	#myGrid .aw-mouseover-row .aw-row-selector {color: red;}

	/*	Highlight on mouseover, mousedown */
	#myGrid .aw-mouseover-selector {background: green;}
	#myGrid .aw-mousedown-selector {background: yellow;}

</style>


<script type="text/javascript">

String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g,"");
}

function isPosInt(str){
if ( str != "" ) {
  var pat="-0123456789."
  var str1 = str.trim() ;
  var i=0;
    do{
    var flag = 0;
    for(var j=0;j<pat.length;j++){
      if(str1.charAt(i)==pat.charAt(j)){
        flag = 1;
        break;
      }
      flag = 0;
    }
    i++
  }while(flag==1 && i<str1.length)
  if (flag == 1)
    return true;
  return false;
 }
 return true;
}

function printSpecial() {
     var gAutoPrint = true;
     if (document.getElementById != null)
     {
     var html = '<HTML>\n<HEAD>\n';

     if (document.getElementsByTagName != null)
     {
          var headTags = document.getElementsByTagName("head");
          if (headTags.length > 0)
                html += headTags[0].innerHTML;
          }

          html += '\n</HEAD>\n<BODY>\n';

          var printReadyElem = document.getElementById("printReady");

          if (printReadyElem != null)
          {
/*The above code is customized,changed according to need */

               html += printReadyElem.innerHTML;
          }
          else
          {
               alert("Could not find the printReady function");
               return;}

               html += '\n</BODY>\n</HTML>';

          var printWin = window.open("","printSpecial");
          printWin.document.open();
          printWin.document.write(html);
          printWin.document.close();
          if (gAutoPrint)
                printWin.print();
          }
          else
          {
               alert("The print ready feature is only available if you are using an browser. Please update your browser.");
          }
     }

//var myData = [["0*", "2a - 1", " Insurance Spares (Procured for For Stock build up) (2a-1-1) ", "10", "1", "209.89000", "0.00000", "0.00000", "0.00000", "0.00000", "0.00000", "0.00000", "0.00000", "0.00000", "0.00000", "0.00000", "0.00000", "209.89000"]] ;

/*
var myData = [ ["MSFT","<span style='font-weight:lighter;background-color:#FFFFFF; color:red'>Microsoft Corporation</span>", "314,571.156", "32,187.000", "55000"],
		["ORCL", "Oracle Corporation", "62,615.266", "9,519.000", "40650"],
		["SAP", "SAP AG (ADR)", "40,986.328", "8,296.420", "28961"],
		["CA", "Computer Associates Inter", "15,606.335", "3,164.000", "16000"],
		["ERTS", "Electronic Arts Inc.", "14,490.895", "2,503.727", "4000"],
		["SFTBF", "Softbank Corp. (ADR)", "14,485.840", ".000", "6865"],
		["VRTS", "Veritas Software Corp.", "14,444.272", "1,578.658", "5647"],
		["SYMC", "Symantec Corporation", "9,932.483", "1,482.029", "4300"],
		["INFY", "Infosys Technologies Ltd.", "9,763.851", "830.748", "15400"],
		["INTU", "Intuit Inc.", "9,702.477", "1,650.743", "6700"],
		["ADBE", "Adobe Systems Incorporate", "9,533.050", "1,230.817", "3341"],
		["PSFT", "PeopleSoft, Inc.", "8,246.467", "1,941.167", "8180"],
		["SEBL", "Siebel Systems, Inc.", "5,434.649", "1,417.952", "5909"],
		["BEAS", "BEA Systems, Inc.", "5,111.813", "965.694", "3063"],
		["SNPS", "Synopsys, Inc.", "4,482.535", "1,169.786", "4254"],
		["CHKP", "Check Point Software Tech", "4,396.853", "424.769", "1203"],
		["MERQ", "Mercury Interactive Corp.", "4,325.488", "444.063", "1822"],
		["DOX", "Amdocs Limited", "4,288.017", "1,427.088", "9400"],
		["CTXS", "Citrix Systems, Inc.", "3,946.485", "554.222", "1670"],
		["KNM", "Konami Corporation (ADR)", "3,710.784", ".000", "4313"]
	];
*/


</script>
</head>

<body >


<form name = "INSERT_UPDATE_RECS" target="I1" action="gen_insert_upd.jsp" method="POST"/>
 <input type="hidden" id= "insert_string" name = "insert_string" value="I" />
 <input type="hidden" id= "update_string" name = "update_string" value="U" />
 <input type="hidden" id= "bgt_yr"        name = "bgt_yr"        value="" />
 <input type="hidden" id= "bgt_fnl"       name = "bgt_fnl"       value="" />
 <input type="hidden" id= "sec_cd"        name = "sec_cd"        value="" />
 <input type="hidden" id= "bgt_ver"       name = "bgt_ver"       value="" />
 <input type="hidden" id= "bgt_lvl"       name = "bgt_lvl"       value="" />
 <input type="hidden" id= "pub_mkr"       name = "pub_mkr"       value="" />
 <input type="hidden" id= "ip_ecode"      name = "ip_ecode"      value="" />
 <input type="hidden" id= "stn_cd"        name = "stn_cd"        value="" />
</form>

<form name = "SELF_SUBMIT" target="_self" action="generation_budget_de.jsp" method="GET"/>
 <input type="hidden"  name = "sec_cd"    value="" />
 <input type="hidden"  name = "stn_cd"    value="" />
 <input type="hidden"  name = "T1"        value="" />
 <input type="hidden"  name = "bgt_lvl"   value="" />
 <input type="hidden"  name = "username" value="" />
</form>

<form name = "PUBLISH" target="I2" action="gen_upd_aft_pub.jsp" method="GET"/>
 <input type="hidden"  name = "sec_cd"    value="" />
 <input type="hidden"  name = "stn_cd"    value="" />
 <input type="hidden"  name = "bgt_yr"    value="" />
 <input type="hidden"  name = "bgt_lvl"   value="" />
 <input type="hidden"  name = "username"  value="" />
</form>

<form name = "SEND_TO_SUPERIOR" target="I3" action="gen_send_to_superior.jsp" method="GET"/>
 <input type="hidden"  name = "sec_cd"    value="" />
 <input type="hidden"  name = "stn_cd"    value="" />
 <input type="hidden"  name = "bgt_yr"    value="" />
 <input type="hidden"  name = "bgt_lvl"   value="" />
 <input type="hidden"  name = "username"  value="" />
</form>

<iframe name="I1" id="I1" style="width: 0; height: 0" marginwidth="1" marginheight="1" scrolling="no" border="0" frameborder="0">
</iframe>

<iframe name="I2" id="I2" style="width: 0; height: 0" marginwidth="1" marginheight="1" scrolling="no" border="0" frameborder="0">
</iframe>

<iframe name="I3" id="I3" style="width: 0; height: 0" marginwidth="1" marginheight="1" scrolling="no" border="0" frameborder="0">
</iframe>
<%

  PreparedStatement ps1=null;
  ResultSet rs1=null;
  PreparedStatement ps2=null;
  ResultSet rs2=null;
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

/*
  String sBgt_fnl = request.getParameter("bgt_fnl");
  String sSec_cd  = request.getParameter("sec_cd");
  String sBgt_ver  = request.getParameter("bgt_ver");
  String sBgt_lvl  = request.getParameter("bgt_lvl");
  String sPub_mkr  = request.getParameter("pub_mkr");
  String sIp_ecode  = request.getRemoteAddr()+"_"+request.getParameter("username");
  String sStn_cd  = request.getParameter("stn_cd");
*/

  int iGrp_sl_no = 0; 
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

  try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);

     System.out.println("generation_budget_de.jsp opened");

     sBgt_Fr_Year = request.getParameter("T1");
     sUsername    = request.getParameter("username");
     sBgt_To_Year = Integer.toString((Integer.parseInt(sBgt_Fr_Year))+1); 

     sIp_ecode  = request.getRemoteAddr()+"_"+sUsername;
     sBgt_Fr_YY = sBgt_Fr_Year.substring(2);
     sBgt_To_YY = sBgt_To_Year.substring(2);


     ps1=mk.con.prepareStatement(" SELECT STN_CD,"+
                                 "        SEC_CD,"+
	                         "        EMP_DESG,"+
	                         "        TO_CHAR(BGT_LEVEL) "+
	                         " FROM   BGT_LEVEL "+
                                 " WHERE  TRIM(EMP_CODE) = TRIM(?) ") ;
     ps1.setString(1,sUsername);

     rs1=ps1.executeQuery();

     while(rs1.next()){

           iUsername = iUsername+1;
           sStn_cd  = rs1.getString(1);
           sSec_cd  = rs1.getString(2);
           sEmpDesg = rs1.getString(3);
           sBgt_lvl  = rs1.getString(4);

     }

     rs1.close();
     ps1.close();
     rs1 = null;
     ps1 = null;

     if(iUsername!=0){

        if(sBgt_lvl.equals("1")){

           ps1=mk.con.prepareStatement(" SELECT A.STATION_LONG_DESC , B.SECTION_DESC,"+
                                       " TO_CHAR(TRUNC(SYSDATE),'DD/MM/RR') "+
                                       " FROM CD_STATION A,BGT_CD_SECTION B"+
                                       " WHERE TRIM(A.BGT_STATION_CD) = ? "+ 
                                       " AND TRIM(B.SECTION_CD) = ? "+ 
                                       " AND   TRIM(B.STATION_CD) = TRIM(A.BGT_STATION_CD) "); 
           ps1.setString(1,sStn_cd);
           ps1.setString(2,sSec_cd);

           rs1=ps1.executeQuery();

           while(rs1.next()){

                 sGenStn  = rs1.getString(1);
                 sSecDesc = rs1.getString(2);
                 sDate    = rs1.getString(3);

           }

           rs1.close();
           ps1.close();
           rs1 = null;
           ps1 = null;

           ps1=mk.con.prepareStatement(" SELECT DISTINCT NVL(BGT_FNL,'N') BGT_FNL"+
                                       " FROM BGT_FORM2B_DATA "+
                                       " WHERE STN_CD = ? "+
                                       " AND   SEC_CD = ? "+
                                       " AND   BGT_YR = ? ");
           ps1.setString(1,sStn_cd);
           ps1.setString(2,sSec_cd);
           ps1.setString(3,sBgt_Fr_Year);

           rs1=ps1.executeQuery();

           while(rs1.next()){

                 sBgt_fnl = rs1.getString(1);

           }

           rs1.close();
           ps1.close();
           rs1 = null;
           ps1 = null;

           ps1=mk.con.prepareStatement(" SELECT DISTINCT NVL(PUBLISH_MKR,'N') PUB_MKR"+
                                       " FROM BGT_FORM2B_DATA "+
                                       " WHERE STN_CD = ? "+
                                       " AND   SEC_CD = ? "+
                                       " AND   BGT_YR = ? ");
           ps1.setString(1,sStn_cd);
           ps1.setString(2,sSec_cd);
           ps1.setString(3,sBgt_Fr_Year);

           rs1=ps1.executeQuery();

           while(rs1.next()){

                 sPub_mkr = rs1.getString(1);

           }

           rs1.close();
           ps1.close();
           rs1 = null;
           ps1 = null;

           if(sBgt_fnl.equals("F")){

              sReadOnlyMkr = "T";
              sDisableB1Mkr = "T";
              sDisableB2Mkr = "T";
              sDisableB3Mkr = "T";

           }else{

              if(sPub_mkr.equals("Y")){

                 sReadOnlyMkr = "T";
                 sDisableB1Mkr = "T";
                 sDisableB2Mkr = "T";

                 ps1=mk.con.prepareStatement(" SELECT NVL(TO_CHAR(SEND_TO_HIGHER_LEVEL_DT),'N') "+
                                             " FROM BGT_POSITION "+
                                             " WHERE STN_CD = ? "+
                                             " AND   SEC_CD = ? "+
                                             " AND   BGT_YR = ? "+
                                             " AND   BGT_LEVEL = (SELECT MAX(BGT_LEVEL) FROM  BGT_POSITION "+
                                             "                  WHERE STN_CD= ? "+
                                             "                  AND SEC_CD= ? "+
                                             "                  AND BGT_YR= ? ) ");
                 ps1.setString(1,sStn_cd);
                 ps1.setString(2,sSec_cd);
                 ps1.setString(3,sBgt_Fr_Year);
                 ps1.setString(4,sStn_cd);
                 ps1.setString(5,sSec_cd);
                 ps1.setString(6,sBgt_Fr_Year);

                 rs1=ps1.executeQuery();

                 while(rs1.next()){

                       sSendToSuperiorDt = rs1.getString(1);

                 }

                 rs1.close();
                 ps1.close();
                 rs1 = null;
                 ps1 = null;


                 if(sSendToSuperiorDt.equals("N")){

                    sDisableB3Mkr = "F";

                 }else{

                    sDisableB3Mkr = "T";

                 }


              }else{

                 sReadOnlyMkr = "F";

              }


           }
%>

<script>

/*
   g_bgt_yy_val[0]= '<%= sBgt_Fr_YY %>';
   g_bgt_yy_val[1]= '<%= sBgt_Fr_YY %>';
   g_bgt_yy_val[2]= '<%= sBgt_Fr_YY %>';
   g_bgt_yy_val[3]= '<%= sBgt_Fr_YY %>';
   g_bgt_yy_val[4]= '<%= sBgt_Fr_YY %>';
   g_bgt_yy_val[5]= '<%= sBgt_Fr_YY %>';
   g_bgt_yy_val[6]= '<%= sBgt_Fr_YY %>';
   g_bgt_yy_val[7]= '<%= sBgt_Fr_YY %>';
   g_bgt_yy_val[8]= '<%= sBgt_Fr_YY %>';
   g_bgt_yy_val[9]= '<%= sBgt_To_YY %>';
   g_bgt_yy_val[10]= '<%= sBgt_To_YY %>';
   g_bgt_yy_val[11]= '<%= sBgt_To_YY %>';
   g_bgt_yy_val[12]= ' ';
  

  document.getElementById('bgt_yr').value = '<%= sBgt_Fr_Year %>';
  document.getElementById('bgt_fnl').value = '<%= sBgt_fnl %>';
  document.getElementById('sec_cd').value = '<%= sSec_cd %>';
  document.getElementById('bgt_lvl').value = '<%= sBgt_lvl %>';
  document.getElementById('pub_mkr').value = '<%= sPub_mkr %>';
  document.getElementById('ip_ecode').value = '<%= sIp_ecode %>';
  document.getElementById('stn_cd').value = '<%= sStn_cd %>';
*/

  document.INSERT_UPDATE_RECS.bgt_yr.value = '<%= sBgt_Fr_Year %>';
  document.INSERT_UPDATE_RECS.bgt_fnl.value = '<%= sBgt_fnl %>';
  document.INSERT_UPDATE_RECS.sec_cd.value = '<%= sSec_cd %>';
  document.INSERT_UPDATE_RECS.bgt_lvl.value = '<%= sBgt_lvl %>';
  document.INSERT_UPDATE_RECS.pub_mkr.value = '<%= sPub_mkr %>';
  document.INSERT_UPDATE_RECS.ip_ecode.value = '<%= sIp_ecode %>';
  document.INSERT_UPDATE_RECS.stn_cd.value = '<%= sStn_cd %>';

  document.SELF_SUBMIT.sec_cd.value= '<%= sSec_cd %>';
  document.SELF_SUBMIT.stn_cd.value= '<%= sStn_cd %>';
  document.SELF_SUBMIT.T1.value= '<%= sBgt_Fr_Year %>';
  document.SELF_SUBMIT.bgt_lvl.value= '<%= sBgt_lvl %>';
  document.SELF_SUBMIT.username.value= '<%= sIp_ecode  %>';

  document.PUBLISH.sec_cd.value= '<%= sSec_cd %>';
  document.PUBLISH.stn_cd.value= '<%= sStn_cd %>';
  document.PUBLISH.bgt_yr.value= '<%= sBgt_Fr_Year %>';
  document.PUBLISH.bgt_lvl.value= '<%= sBgt_lvl %>';
  document.PUBLISH.username.value= '<%= sIp_ecode  %>';

  document.SEND_TO_SUPERIOR.sec_cd.value= '<%= sSec_cd %>';
  document.SEND_TO_SUPERIOR.stn_cd.value= '<%= sStn_cd %>';
  document.SEND_TO_SUPERIOR.bgt_yr.value= '<%= sBgt_Fr_Year %>';
  document.SEND_TO_SUPERIOR.bgt_lvl.value= '<%= sBgt_lvl %>';
  document.SEND_TO_SUPERIOR.username.value= '<%= sIp_ecode  %>';

</script>
<div id=fixed_div>
<table style="width: 100%" class="style1">
	<tr>
		<td class="style3" colspan="19"><strong>Cash Flow Statement : <%= sBgt_Fr_Year %> - <%= sBgt_To_Year %></strong></td>
	</tr>
	<tr>
		<td class="style4" colspan="1"><strong><span class="style5"><%= sDate %></strong></td>
		<td class="style4" colspan="19"><strong><span class="style5"><%= sGenStn %></span> </strong></td>
	</tr>
	<tr>
		<td class="style6"><strong><span class="style7">Form 2B</span></strong></td>
		<td style="width: 5%" class="style22">&nbsp;</td>
		<td style="width: 5%" class="style22">&nbsp;</td>
		<td style="width: 5%" class="style22">&nbsp;</td>
		<td style="width: 5%" class="style22">&nbsp;</td>
		<td style="width: 5%" class="style22">&nbsp;</td>
		<td style="width: 5%" class="style22">&nbsp;</td>
		<td style="width: 5%" class="style22">&nbsp;</td>
		<td style="width: 35%" colspan="7" class="style22"><strong><span class="style5">SEC CODE : <%= sSecDesc %></span></strong></td>
		<td style="width: 5%" class="style22">&nbsp;</td>
		<td style="width: 5%" class="style22">&nbsp;</td>
		<td style="width: 5%" class="style22">&nbsp;</td>
		<td style="width: 5%" class="style22">&nbsp;</td>
	</tr>
</table>

<!--
<table style="width: 120%" cellspacing="0" cellpadding="0" class="style9" align="center">
	<tr>
		<td style="width: 4%" class="style10"><strong>Sl No</strong></td>
		<td style="width: 4%" class="style10"><strong>Budget Head</strong></td>
		<td class="style11" colspan="10">
			<strong>BUDGET HEAD DESCRIPTION</strong>
		</td>
		<td style="width: 4%" class="style10"><strong>Apr-<br /><%= sBgt_Fr_YY %></strong></td>
		<td style="width: 4%" class="style10"><strong>May-<br /><%= sBgt_Fr_YY %></strong></td>
		<td style="width: 4%" class="style10"><strong>Jun-<br /><%= sBgt_Fr_YY %></strong></td>
		<td style="width: 4%" class="style10"><strong>Jul-<br /><%= sBgt_Fr_YY %></strong></td>
		<td style="width: 4%" class="style10"><strong>Aug-<br /><%= sBgt_Fr_YY %></strong></td>
		<td style="width: 4%" class="style10"><strong>Sep-<br /><%= sBgt_Fr_YY %></strong></td>
		<td style="width: 4%" class="style10"><strong>Oct-<br /><%= sBgt_Fr_YY %></strong></td>
		<td style="width: 4%" class="style10"><strong>Nov-<br /><%= sBgt_Fr_YY %></strong></td>
		<td style="width: 4%" class="style10"><strong>Dec-<br /><%= sBgt_Fr_YY %></strong></td>
		<td style="width: 4%" class="style10"><strong>Jan-<br /><%= sBgt_To_YY %></strong></td>
		<td style="width: 4%" class="style10"><strong>Feb-<br /><%= sBgt_To_YY %></strong></td>
		<td style="width: 4%" class="style10"><strong>Mar-<br /><%= sBgt_To_YY %></strong></td>
		<td style="width: 4%" class="style10"><strong>Annual<br />
		                                              <%= sBgt_Fr_YY %>-<%= sBgt_To_YY %></strong>
        </td>
	</tr>
	<tr>
		<td colspan="25" style="width: 100%" class="style2"><strong>&nbsp;</strong></td>
	</tr>
	<tr>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
		<td style="width: 4%" class="style2">&nbsp;</td>
	</tr>
-->

<%

           ps1=mk.con.prepareStatement(" SELECT COUNT(*) "+
                                       " FROM BGT_FORM2B_DATA "+
                                       " WHERE BGT_YR = ? "+
                                       " AND STN_CD = ? "+
                                       " AND SEC_CD = ? "); 
           ps1.setString(1,sBgt_Fr_Year);
           ps1.setString(2,sStn_cd);
           ps1.setString(3,sSec_cd);

           rs1=ps1.executeQuery();

           while(rs1.next()){

                iRowExists = rs1.getInt(1);
 
           }

           rs1.close();
           ps1.close();

           rs1=  null;
           ps1=  null;

           if(iRowExists>0){

              sInsUpdMkr = "U";

           }else{

              sInsUpdMkr = "I";

           }

           if(sPub_mkr.equals("N") && sBgt_fnl.equals("N")){

              if(sInsUpdMkr.equals("I")){

                 sDisableB1Mkr = "F";
                 sDisableB2Mkr = "T";
                 sDisableB3Mkr = "T";

              }else{

                 if(sInsUpdMkr.equals("U")){

                    sDisableB1Mkr = "F";
                    sDisableB2Mkr = "F";

                    ps1=mk.con.prepareStatement(" SELECT NVL(TO_CHAR(SEND_TO_HIGHER_LEVEL_DT),'N') "+
                                                " FROM BGT_POSITION "+
                                                " WHERE STN_CD = ? "+
                                                " AND   SEC_CD = ? "+
                                                " AND   BGT_YR = ? "+
                                                " AND   BGT_LEVEL = (SELECT MAX(BGT_LEVEL) FROM  BGT_POSITION "+
                                                "                  WHERE STN_CD= ? "+
                                                "                  AND SEC_CD= ? "+
                                                "                  AND BGT_YR= ? )" );
                    ps1.setString(1,sStn_cd);
                    ps1.setString(2,sSec_cd);
                    ps1.setString(3,sBgt_Fr_Year);
                    ps1.setString(4,sStn_cd);
                    ps1.setString(5,sSec_cd);
                    ps1.setString(6,sBgt_Fr_Year);

                    rs1=ps1.executeQuery();

                    while(rs1.next()){

                          sSendToSuperiorDt = rs1.getString(1);

                    }

                    rs1.close();
                    ps1.close();
                    rs1 = null;
                    ps1 = null;

                    if(sSendToSuperiorDt.equals("N")){

                       sDisableB3Mkr = "F";

                    }else{

                       sDisableB3Mkr = "T";

                    }

                 }
      
              }

           }

           ps1=mk.con.prepareStatement(" SELECT NVL(sl_no_rowval,3.5) SL_NO_ROWVAL,"+
                                       "        COUNT(*) ROW_SPAN "+
                                       " FROM BGT_FORM2B_STRUC "+
                                       " WHERE BGT_FR_YR = ? "+
                                       " GROUP BY SL_NO_ROWVAL "+
                                       " ORDER BY SL_NO_ROWVAL ");
           ps1.setString(1,sBgt_Fr_Year);

           rs1=ps1.executeQuery();

           while(rs1.next()){

                 iGrp_index = iGrp_index + 1;

                 sSl_No_row_val = rs1.getString(1); 
                 sSl_No_row_span = Integer.toString(rs1.getInt(2)); 

                 sBgt_Hd_Rowval = "";
                 sBgt_Desc      = "";
                 sSubt_Mkr      = "";
                 sTr_Bg_Color   = "";
                 sBgt_seq       = "";
                 sAmt_NA_mkr    = "";

                 iGrp_sl_no = 0;
                 sStrt_Bgt_seq_for_grp    = "";
                 sEnd_Bgt_seq_for_grp = "";

%>
<!--
<script>

     var grp_seq_array = [];
     g_grp_seq_array1[<%= iGrp_index %> - 1] = new Array(4);

</script>
-->
<%
           
                 ps2 = mk.con.prepareStatement(" SELECT NVL(SL_NO_ROWVAL,3.5) SL_NO_ROWVAL, "+
                                               "  NVL(BGT_HD_ROWVAL,' '), "+
                                               " ' <span style='||CHR(39)||'font-weight:lighter;background-color:#'|| "+
	                                       "    (SELECT COLOR_HEX  "+
                                               "            FROM BGT_COLOR  "+
		            		         "     WHERE COLOR_CD=NVL(DESC1_B_COLOR,1))||'; color:#'|| "+
	                                       "    (SELECT COLOR_HEX  "+
                                          	 "            FROM BGT_COLOR  "+
            				         "     WHERE COLOR_CD=NVL(DESC1_F_COLOR,1))||CHR(39)||'>'||NVL(DESC1,' ')||'</span>'|| "+
	                                       "  ' <span style='||CHR(39)||'font-weight:lighter;background-color:#'|| "+
	                                       "    (SELECT COLOR_HEX  "+
	                                       " 	      FROM BGT_COLOR  "+
		      	            		 "     WHERE COLOR_CD=NVL(DESC2_B_COLOR,1))||'; color:#'|| "+
	                                       "    (SELECT COLOR_HEX  "+
                                          	 "            FROM BGT_COLOR  "+
			            	         "     WHERE COLOR_CD=NVL(DESC2_F_COLOR,1))||CHR(39)||'>'||NVL(DESC2,' ')||'</span>'|| "+
	                                       "  ' <span style='||CHR(39)||'font-weight:lighter;background-color:#'|| "+
	                                       "    (SELECT COLOR_HEX  "+
                                               "	      FROM BGT_COLOR  "+
				               "     WHERE COLOR_CD=NVL(DESC3_B_COLOR,1))||'; color:#'|| "+
	                                       "    (SELECT COLOR_HEX  "+
                                          	 "            FROM BGT_COLOR  "+
				               "     WHERE COLOR_CD=NVL(DESC3_F_COLOR,1))||CHR(39)||'>'||NVL(DESC3,' ')||'</span>' Budg_Desc,"+
                                          	 "  NVL(SUBT_MKR,'NE'),  "+
                                          	 "  (SELECT COLOR_HEX  "+
                                               "          FROM BGT_COLOR  "+
                                               "   WHERE COLOR_CD=NVL(DESC1_B_COLOR,1)) TD_BG_COLOR,  "+
                                               "   BGT_SEQ,  "+
                                               "   NVL(TRIM(AMT_NA),'NE'),  "+
                                               "  DECODE(DESC_JUST,'L','left','R','right','C','center','left')  "+
	                                       "  FROM BGT_FORM2B_STRUC "+
                                               "  WHERE BGT_FR_YR= ?  "+
                                               "  AND NVL(SL_NO_ROWVAL,3.5)= ?  "+
                                               "  ORDER BY SL_NO_ROWVAL,BGT_HD_ROWORDER "); 
                                          

                 ps2.setString(1,sBgt_Fr_Year);
                 ps2.setString(2,sSl_No_row_val);

                 rs2=ps2.executeQuery();

                 while(rs2.next()){

/**** New Code Start ***/

  rows = new ArrayList() ;

rows.add(rs2.getString(1)) ;
rows.add(rs2.getString(2)) ;
rows.add(rs2.getString(3)) ;
rows.add(rs2.getString(4)) ;
rows.add(rs2.getString(5)) ;
rows.add(rs2.getString(6)) ;
rows.add(rs2.getString(7)) ;
rows.add(rs2.getString(8)) ;

l1.add(rows);


/**** New Code End ***/
                 
                       iLineNo = iLineNo + 1;

                       iGrp_sl_no = iGrp_sl_no + 1;
                       sBgt_Hd_Rowval = rs2.getString(2);
                       sBgt_Desc      = rs2.getString(3);
                       sSubt_Mkr      = rs2.getString(4);
                       sTr_Bg_Color   = rs2.getString(5);
                       sBgt_seq       = rs2.getString(6);
                       sAmt_NA_mkr    = rs2.getString(7);
                       sJustMkr       = rs2.getString(8);

                       if(iGrp_sl_no == 1){

                          sStrt_Bgt_seq_for_grp    = sBgt_seq;

%>
<!--
<script>
         g_grp_seq_array1[<%= iGrp_index %> - 1][0] = '<%= iLineNo-1 %>';
         g_grp_seq_array1[<%= iGrp_index %> - 1][1] = '<%= iLineNo-1 %>';
</script>
-->
<%
                       }

                       if(sSubt_Mkr.equals("T1")){

%>
<!--
<tr style="background-color:<%= sTr_Bg_Color %>">
                <td colspan= "12" style="width: 48%" class="style2" align="<%= sJustMkr %>">&nbsp;<%= sBgt_Desc %></td>
-->
<%
                       }else{

%>
<!--
<tr style="background-color:<%= sTr_Bg_Color %>">
                <td style="width: 4%" class="style2" align="center">&nbsp;<%= sSl_No_row_val %></td>
                <td style="width: 4%" class="style2" align="center">&nbsp;<%= sBgt_Hd_Rowval %></td>
                <td colspan= "10" style="width: 40%" class="style2" align="<%= sJustMkr %>">&nbsp;<%= sBgt_Desc %></td>
-->
<%

                      }

%>
<!--
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_01" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','04','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','00','<%= sBgt_seq %>');}" /></td>
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_02" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','05','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','01','<%= sBgt_seq %>');}" /> </td>
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_03" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','06','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','02','<%= sBgt_seq %>');}" /> </td>
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_04" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','07','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','03','<%= sBgt_seq %>');}" /> </td>
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_05" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','08','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','04','<%= sBgt_seq %>');}" /> </td>
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_06" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','09','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','05','<%= sBgt_seq %>');}" /> </td>
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_07" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','10','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','06','<%= sBgt_seq %>');}" /> </td>
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_08" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','11','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','07','<%= sBgt_seq %>');}" /> </td>
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_09" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','12','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','08','<%= sBgt_seq %>');}" /> </td>
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_10" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','01','<%= sBgt_To_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','09','<%= sBgt_seq %>');}" /> </td>
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_11" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','02','<%= sBgt_To_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','10','<%= sBgt_seq %>');}" /> </td>
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_12" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','03','<%= sBgt_To_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','11','<%= sBgt_seq %>');}" /> </td>
		<td style="width: 4%" class="style2">&nbsp;<input  type= "text" class="text_box1" style="color:blue;" size="4" maxlength="10" value="0.00" id = "T_<%= sBgt_seq %>_13" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>',' ',' ')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','12','<%= sBgt_seq %>');}" /> </td>
	</tr>


<script>

     g_all_cell_id_array[<%= iLineNo %> - 1] = new Array(g_mnths_tot_col.length+2);

     for(var i = 0; i < g_mnths_tot_col.length; i++){

        g_bgt_seq_inserted[i + (g_mnths_tot_col.length)*(<%= iLineNo %> - 1)] = new Array(5);
        g_bgt_seq_inserted[i + (g_mnths_tot_col.length)*(<%= iLineNo %> - 1)][0] = 'T_<%= sBgt_seq %>_'+g_mnths_tot_col[i];
        g_bgt_seq_inserted[i + (g_mnths_tot_col.length)*(<%= iLineNo %> - 1)][1] = '<%= sBgt_seq %>';
        g_bgt_seq_inserted[i + (g_mnths_tot_col.length)*(<%= iLineNo %> - 1)][2] =  g_bgt_mm_ordr[i] ;
        g_bgt_seq_inserted[i + (g_mnths_tot_col.length)*(<%= iLineNo %> - 1)][3] =  g_bgt_mm_val[i] ;
        g_bgt_seq_inserted[i + (g_mnths_tot_col.length)*(<%= iLineNo %> - 1)][4] =  g_bgt_yy_val[i] ;

     }

     for(var k = 0; k < g_mnths_tot_col.length ; k++){

         g_all_cell_id_array[<%= iLineNo %> - 1][k] = 'T_<%= sBgt_seq %>_'+g_mnths_tot_col[k];

         if('<%= sReadOnlyMkr %>' == 'T'){
            document.getElementById(g_all_cell_id_array[<%= iLineNo %> - 1][k]).readOnly = true;
         }else{
            document.getElementById(g_all_cell_id_array[<%= iLineNo %> - 1][k]).readOnly = false;
         }

     }

     g_all_cell_id_array[<%= iLineNo %> - 1][g_mnths_tot_col.length] = '<%= iGrp_index-1 %>'; 
     g_all_cell_id_array[<%= iLineNo %> - 1][g_mnths_tot_col.length+1] = '<%= sBgt_seq %>'; 

     //alert(g_all_cell_id_array[<%= iLineNo %> - 1][0]);

   

</script>
-->
<%
                       if(sAmt_NA_mkr.equals("NE")){
      
                          sEnd_Bgt_seq_for_grp    = sBgt_seq;
%>
<!--
<script>

      g_grp_seq_array1[<%= iGrp_index %> - 1][1] = '<%= iLineNo-1 %>';

      grp_seq_array.push('<%= sBgt_seq %>') ;

      summationAnnual('T_<%= sBgt_seq %>_13','<%= sBgt_seq %>');

      g_ne_cell_id_array[<%= iLineNo %> - 1] = new Array(g_mnths_tot_col.length+1);

      for(var k = 0; k < g_mnths_tot_col.length ; k++){

         g_ne_cell_id_array[<%= iLineNo %> - 1][k] = 'T_<%= sBgt_seq %>_'+g_mnths_tot_col[k];

      }

      g_ne_cell_id_array[<%= iLineNo %> - 1][g_mnths_tot_col.length] = '<%= iGrp_index-1 %>'; 

</script>
-->
<%

                      }

                      if(sAmt_NA_mkr.equals("Y")){

                         i_g_y_cell_index = i_g_y_cell_index + 1;
%>
<!--
<script>

      g_y_cell_id_array[<%= i_g_y_cell_index -1 %>] = new Array(g_mnths_tot_col.length+1);

      for(var k = 0; k < g_mnths_tot_col.length ; k++){

         g_y_cell_id_array[<%= i_g_y_cell_index -1 %>][k] = 'T_<%= sBgt_seq %>_'+g_mnths_tot_col[k];
 
         document.getElementById('T_<%= sBgt_seq %>_'+g_mnths_tot_col[k]).value = '0.00';
         document.getElementById('T_<%= sBgt_seq %>_'+g_mnths_tot_col[k]).readOnly = true;
         
      }

      g_y_cell_id_array[<%= i_g_y_cell_index -1 %>][g_mnths_tot_col.length] = '<%= iGrp_index-1 %>'; 


</script>
-->

<%

                      }

                      if(sAmt_NA_mkr.equals("S")){

%>
<!--
<script>
                   g_grp_seq_array1[<%= iGrp_index %> - 1][2] = <%= iLineNo %> - 1;
                   g_grp_seq_array1[<%= iGrp_index %> - 1][3] = '<%= sBgt_seq %>' ;

                   summationOfCellVal('<%= sBgt_seq %>',grp_seq_array);

</script>
-->
<%
                      }


                 }

                 rs2.close();
                 ps2.close();

                 rs2 = null;
                 ps2 = null;
      
           } 
           rs1.close();
           ps1.close();

           ps1=null;
           rs1=null; 

/*
           ps1=mk.con.prepareStatement(" SELECT "+ 
                                       "      BGT_SEQ,"+
	                               "      BGT_VER,"+
	                               "      LPAD(MM_ORDER,2,'0') MM_ORDER,"+
                                       "      TRIM(TO_CHAR(NVL(AMT,0),'9999990.99999')) AMT"+
                                       " FROM BGT_FORM2B_DATA"+
                                       " WHERE BGT_YR= ? "+
                                       " AND STN_CD= ? "+
                                       " AND SEC_CD = ? "+ 
                                       " ORDER BY BGT_SEQ,"+
                                       " YY_VAL,"+
	                  	       " MM_VAL "); 
           ps1=mk.con.prepareStatement("SELECT bgt_seq, bgt_ver, "
                                     + "       MAX(CASE WHEN mm_order = 4 THEN TRIM(TO_CHAR(NVL(amt,0),''))) END) apr, "
                                     + "       MAX(CASE WHEN mm_order = 5 THEN TRIM(TO_CHAR(NVL(amt,0),'')) END) may, "
                                     + "       MAX(CASE WHEN mm_order = 6 THEN TRIM(TO_CHAR(NVL(amt,0),'')) END) jun, "
                                     + "       MAX(CASE WHEN mm_order = 7 THEN TRIM(TO_CHAR(NVL(amt,0),'')) END) jul, "
                                     + "       MAX(CASE WHEN mm_order = 8 THEN TRIM(TO_CHAR(NVL(amt,0),'')) END) aug, "
                                     + "       MAX(CASE WHEN mm_order = 9 THEN TRIM(TO_CHAR(NVL(amt,0),'')) END) sep, "
                                     + "       MAX(CASE WHEN mm_order = 10 THEN TRIM(TO_CHAR(NVL(amt,0),'')) END) oct, "
                                     + "       MAX(CASE WHEN mm_order = 11 THEN TRIM(TO_CHAR(NVL(amt,0),'')) END) nov, "
                                     + "       MAX(CASE WHEN mm_order = 12 THEN TRIM(TO_CHAR(NVL(amt,0),'')) END) dec, "
                                     + "       MAX(CASE WHEN mm_order = 1 THEN TRIM(TO_CHAR(NVL(amt,0),'')) END) jan, "
                                     + "       MAX(CASE WHEN mm_order = 2 THEN TRIM(TO_CHAR(NVL(amt,0),'')) END) feb, "
                                     + "       MAX(CASE WHEN mm_order = 3 THEN TRIM(TO_CHAR(NVL(amt,0),'')) END) mar, "
                                     + "       MAX(CASE WHEN mm_order = 13 THEN TRIM(TO_CHAR(NVL(amt,0),'')) END) tot "
                                     + " FROM bgt_form2b_data_temp "
                                     + " WHERE bgt_yr = ? "
                                     + " AND   stn_cd = ? "
                                     + " AND   sec_cd = ? " 
                                     //+ " AND   bgt_seq = '10' " 
                                     + " GROUP BY bgt_seq,bgt_ver " 
                                     + " ORDER BY bgt_seq " ) ;
*/
           ps1=mk.con.prepareStatement("SELECT B.bgt_seq,B.SL_NO_ROWVAL,B.BGT_HD_ROWORDER, "
                                     + " MAX(CASE WHEN A.mm_order = 4 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) apr, "
                                     + " MAX(CASE WHEN A.mm_order = 5 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) may, "
                                     + " MAX(CASE WHEN A.mm_order = 6 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) jun, "
                                     + " MAX(CASE WHEN A.mm_order = 7 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) jul, "
                                     + " MAX(CASE WHEN A.mm_order = 8 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) aug, "
                                     + " MAX(CASE WHEN A.mm_order = 9 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) sep, "
                                     + " MAX(CASE WHEN A.mm_order = 10 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) oct, "
                                     + " MAX(CASE WHEN A.mm_order = 11 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) nov, "
                                     + " MAX(CASE WHEN A.mm_order = 12 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) dec, "
                                     + " MAX(CASE WHEN A.mm_order = 1 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) jan, "
                                     + " MAX(CASE WHEN A.mm_order = 2 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) feb, "
                                     + " MAX(CASE WHEN A.mm_order = 3 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) mar, "
                                     + " MAX(CASE WHEN A.mm_order = 13 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'9999990.99999')) END) tot "
                                     + " FROM ( SELECT * "
                                     + "        FROM bgt_form2b_data "
	                             + "        WHERE bgt_yr = ?) A, bgt_form2b_struc B "
                                     + " WHERE  A.bgt_seq(+) = B.bgt_seq "
                                     + " AND   stn_cd = ? "
                                     + " AND   sec_cd = ?  "
                                     + " GROUP BY B.SL_NO_ROWVAL,B.BGT_HD_ROWORDER,B.bgt_seq "
                                     + " ORDER BY B.SL_NO_ROWVAL,B.BGT_HD_ROWORDER " ) ;

           ps1.setString(1,sBgt_Fr_Year);
           ps1.setString(2,sStn_cd);
           ps1.setString(3,sSec_cd);

           rs1=ps1.executeQuery();

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

l2.add(rows);


/*

                 sCell_Id_for_exstngVal = "";
                 sCell_Id_for_exstngVal   = "T_"+rs1.getString(1)+"_"+rs1.getString(3) ;

%>
<!--
<script>

           //alert("Id"+'<%= sCell_Id_for_exstngVal %>');
           popl_exstngVal_inCells('<%= sCell_Id_for_exstngVal %>','<%= rs1.getString(4) %>');

</script>
-->
<%           
*/

           }

           rs1.close();
           ps1.close();
     
           ps1=null;
           rs1=null;


        for ( i=0; i<l1.size(); i++ ) {
            totrec++ ;
            rows1 = (List)l1.get(i) ;
            rows2 = (List)l2.get(i) ;

            if ( rows1.get(5).equals(rows2.get(0)) ) {
                rows = new ArrayList() ;
                rows.add("\""+(String)rows1.get(0)+"\"") ;
                rows.add("\""+(String)rows1.get(1)+"\"") ;
                rows.add("\""+(String)rows1.get(2)+"\"") ;
                //attr = rows1.get(2).replaceAll("\"","'") ;
                //rows.add("\""+attr+"\"") ;

                for ( j=3; j<rows2.size(); j++ ) {
                    rows.add("\""+(String)rows2.get(j)+"\"") ;
                }
                rows.add("\"#"+(String)rows1.get(4)+"\"") ;
            }
            detailList.add(rows) ;
        }

%>
<!--
<script>

   //putZeroInYFields();
   putNullInYFields();

</script>

   </table>

<div id="d1" style="position:relative;left:500px;bottom:10px" >
</div>
<table style="width: 100%" class="style1">
	<tr>
		<td class="style3" colspan="20" width="100%">
                    <input type="button" name="B1" value="SAVE" onClick="chkBefSubmit('<%= sInsUpdMkr %>')"/>
                    <input type="button" name="B2" value="PUBLISH" onClick="publishBudget('U')"/> 
                    <input type="button" name="B3" value="SEND TO SUPERIOR" onClick="sendToSuperior()"/>
               </td>
	</tr>
</table>
<script>

   enableDisableButtons('<%= sDisableB1Mkr %>','<%= sDisableB2Mkr %>','<%= sDisableB3Mkr %>')

</script>
-->
<%

        }else{

%>
<!--
<table style="width: 100%" class="style1">
	<tr>
		<td class="style3" colspan="20" width="100%">&nbsp;</td>
	</tr>
	<tr>
		<td class="style3" colspan="20" width="100%">&nbsp;</td>
	</tr>
	<tr>
		<td class="style3" colspan="20" width="100%">You Are Not Authorized To Use This Service</td>
	</tr>
	<tr>
		<td class="style3" colspan="20" width="100%">&nbsp;</td>
	</tr>
	<tr>
		<td class="style3" colspan="20" width="100%"><input type="button" name="CLOSE" value="CLOSE" onClick="window.open('close.html','_self');"</td>
	</tr>
</table>
-->
<%

        }
     }else{

%>
<!--
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
		<td class="style3" colspan="20" width="100%"><input type="button" name="CLOSE" value="CLOSE" onClick="window.open('close.html','_self');"</td>
	</tr>
</table>
-->
<%
     }
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
     if(rs2!=null){
        rs2.close();
     }
     if(ps2!=null){
        ps2.close();
     }
     if(mk!=null){
        mk.con.close();
     }

     System.out.println("generation_budget_de.jsp closed");
  
}
%>

</div>

<script type="text/javascript">

/********************************************************************
/////////////////////////////////////////////////////////////////////

	D A T A   S O U R C E S

/////////////////////////////////////////////////////////////////////
********************************************************************/
var text0 = 0 ;
var text1 = '' ;
var text2 = '' ;
var text3 = '' ;
var sum = 0 ;
var t1 = new Array() ;

var myData = <%= detailList %> ;
var myHeaders = ["Sl No", "Budget Head", "BUDGET HEAD DESCRIPTION", "Apr-11", "May-11", "Jun-11", "Jul-11", "Aug-11", "Sep-11", "Oct-11", "Nov-11", "Dec-11", "Jan-12", "Feb-12", "Mar-12", "Total"];

	var obj = new AW.Grid.Extended;

	obj.setId("myGrid");	// necessary for CSS rules

        obj.setHeaderText(myHeaders);
        obj.setCellText(myData);
        obj.setFixedLeft(3);
//alert(myData[4][16]) ;
        for ( i=0; i<myData.length; i++ ) {
            bgcolor = myData[i][16];

            if ( bgcolor == '#FFFFFF' ) {
                for ( j=3; j<15; j++ ) {
                    obj.setCellEditable(true,j,i);  // setEditable(true, colindex, rowindex) 
                }
            }
        }

	// add custom row property calculated from the cell value in col-16
        obj.defineRowProperty("background", function(row){
	        var value = this.getCellValue(16, row);
	        return value ;
        });

        // add dynamic row style linked to the custom row background property
        obj.getRowTemplate().setStyle("background", function(){
	        return this.getRowProperty("background");
        });

        obj.onCellValidating = function(text, col, row){
            if ( !isPosInt(text) ) {
                alert("ERROR : Please enter numric value only") ;
                return true;
            }

	    obj.setCellText(function(col, row){
                for ( i=0; i<4; i++ ) {
                    t1[i] = Number(this.getCellText(col, i));
                }

                sum = 0 ;

                for ( i=0; i<4; i++ ) {
                    sum = sum + t1[i] ;
myData[4][col] = sum ;
                }
                return sum ;

	    }, col, 4);	// calculate column 2 from columns 0 and 1


	    obj.setCellText(function(col, row){
                for ( i=0; i<12; i++ ) {
                    t1[i] = Number(this.getCellText(i+3, row));
                }

                sum = 0 ;

                for ( i=0; i<12; i++ ) {
                    sum = sum + t1[i] ;
                }
myData[row][15] = sum ;
                return sum ;

	    }, 15, row);	// calculate column 2 from columns 0 and 1

sum = 0 ;
for ( i=0; i<4; i++ ) {
  //alert(myData[i][15]) ;
  sum = sum + Number(myData[i][15]) ;
}

	    obj.setCellText(sum, 15, 4);	// calculate column 2 from columns 0 and 1
        }

        obj.setRowCount(<%= totrec %>);
        obj.setColumnCount(16);

document.write(obj);

</script>

</body>

</html>
