<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="java.io.*,javax.servlet.jsp.*,javax.ejb.EJB,javax.naming.*,java.util.*,java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="oracle.sql.*" %>
<%@ page import="oracle.jdbc.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<head>
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ActiveWidgets Example</title>

<!-- <script type="text/javascript" src="gen_check.js"></script> -->
<script src="aw_bbgs.js" type="text/javascript"></script>
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

	#myGrid { width: 980px; height: 400px }

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

	#myGrid .aw-column-0 {width: 120px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-1 {width: 120px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-2 {width: 50px; text-align: left; border-right: 1px solid #000000}
	#myGrid .aw-column-3 {width: 200px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-4 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-5 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-6 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-7 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#FFFF6F;}
	#myGrid .aw-column-8 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-9 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-10 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-11 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#FFFF6F;}
	#myGrid .aw-column-12 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-13 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-14 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-15 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#FFFF6F;}
	#myGrid .aw-column-16 {width: 60px; text-align: center; border-right: 1px solid #000000}

	#myGrid .aw-column-17 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-18 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-19 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#FFFF6F;}
	#myGrid .aw-column-20 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-21 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-22 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-23 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#FFFF6F;}
	#myGrid .aw-column-24 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-25 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-26 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-27 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#FFFF6F;}
	#myGrid .aw-column-28 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-29 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-30 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-31 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#FFFF6F;}
	#myGrid .aw-column-32 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-33 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-34 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-35 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#FFFF6F;}
	#myGrid .aw-column-36 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-37 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-38 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-39 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#FFFF6F;}
	#myGrid .aw-column-40 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-41 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-42 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-43 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#FFFF6F;}
	#myGrid .aw-column-44 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-45 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-46 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-47 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#FFFF6F;}
	#myGrid .aw-column-48 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-49 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-50 {width: 60px; text-align: center; border-right: 1px solid #000000}
	#myGrid .aw-column-51 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#FFFF6F;}
	#myGrid .aw-column-52 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#85D1FA;}
	#myGrid .aw-column-53 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#85D1FA;}
	#myGrid .aw-column-54 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#85D1FA;}
	#myGrid .aw-column-55 {width: 60px; text-align: center; border-right: 1px solid #000000;background-color:#EAB668;}
	#myGrid .aw-column-56 {width: 60px; text-align: center; border-right: 1px solid #000000}

	/* box model fix for strict doctypes, safari */
	.aw-strict #myGrid .aw-column-0 {padding-bottom: 3px;}
	.aw-strict #myGrid .aw-column-1 {padding-bottom: 3px;}


/********************************************************************
	Cells
********************************************************************/

/*	#myGrid .aw-row-2 .aw-column-1 {color: red; font-style: italic} */

	/*	Highlight on mouseover, mousedown */
/*
	#myGrid .aw-mouseover-cell {color: red;} 		
	#myGrid .aw-mousedown-cell {background: #666;}	
*/

	/* Selected cells */
        #myGrid .aw-grid-row .aw-cells-selected {background: #85D1FA;}
        #myGrid .aw-edit-cell { background: #85D1FA;}

/********************************************************************
	Headers
********************************************************************/

	#myGrid .aw-grid-headers {color: blue}
	#myGrid .aw-grid-headers .aw-column-0 {font-weight: bold;background: #FFD6C1;}
	#myGrid .aw-grid-headers .aw-column-1 {font-weight: bold;background: #FFD6C1;}
	#myGrid .aw-grid-headers .aw-column-2 {font-weight: bold;background: #FFD6C1;}
	#myGrid .aw-grid-headers .aw-column-3 {font-weight: bold;background: #FFD6C1;}

	/*	Highlight on mouseover, mousedown */
	#myGrid .aw-mouseover-header {color: red;}
	#myGrid .aw-mousedown-header {color: yellow;}

/*	#myGrid .aw-header-1 {background: #def} */
	#myGrid .aw-header-0 {background: #FFD6C1} 
        #myGrid .aw-header-1 {background: #FFD6C1;border-bottom: 1px solid #000000;}

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


</script>
</head>

<body >


<form name = "INSERT_UPDATE_RECS" target="I1" action="gen_insert_upd_bbgs.jsp" method="POST"/>
 <input type="hidden" id= "ins_upd_mkr"   name = "ins_upd_mkr"   value="" />
 <input type="hidden" id= "insert_string" name = "insert_string" value="" />
 <input type="hidden" id= "update_string" name = "update_string" value="" />
 <input type="hidden" id= "bgt_yr"        name = "bgt_yr"        value="" />
 <input type="hidden" id= "bgt_fnl"       name = "bgt_fnl"       value="" />
 <input type="hidden" id= "sec_cd"        name = "sec_cd"        value="" />
 <input type="hidden" id= "bgt_ver"       name = "bgt_ver"       value="" />
 <input type="hidden" id= "bgt_lvl"       name = "bgt_lvl"       value="" />
 <input type="hidden" id= "pub_mkr"       name = "pub_mkr"       value="" />
 <input type="hidden" id= "username"      name = "username"      value="" />
 <input type="hidden" id= "stn_cd"        name = "stn_cd"        value="" />
</form>

<form name = "SELF_SUBMIT" target="_self" action="generation_budget_de_bbgs.jsp" method="GET"/>
 <input type="hidden"  name = "sec_cd"    value="" />
 <input type="hidden"  name = "stn_cd"    value="" />
 <input type="hidden"  name = "T1"        value="" />
 <input type="hidden"  name = "bgt_lvl"   value="" />
 <input type="hidden"  name = "username" value="" />
 <input type="hidden"  name = "stn_long_desc" value="" /> 
</form>

<form name = "PUBLISH" target="I2" action="gen_upd_aft_pub_bbgs.jsp" method="GET"/>
 <input type="hidden"  name = "sec_cd"    value="" />
 <input type="hidden"  name = "stn_cd"    value="" />
 <input type="hidden"  name = "bgt_yr"    value="" />
 <input type="hidden"  name = "bgt_lvl"   value="" />
 <input type="hidden"  name = "username"  value="" />
</form>

<form name = "SEND_TO_SUPERIOR" target="I3" action="gen_send_to_superior_bbgs.jsp" method="GET"/>
 <input type="hidden"  name = "sec_cd"    value="" />
 <input type="hidden"  name = "stn_cd"    value="" />
 <input type="hidden"  name = "bgt_yr"    value="" />
 <input type="hidden"  name = "bgt_lvl"   value="" />
 <input type="hidden"  name = "username"  value="" />
</form>

<form name = "COMPUTE_ALL" target="I4" action="" method="GET"/>
 <input type="hidden"  name = "sec_cd"    value="" />
 <input type="hidden"  name = "stn_cd"    value="" />
 <input type="hidden"  name = "bgt_yr"    value="" />
 <input type="hidden"  name = "bgt_lvl"   value="" />
 <input type="hidden"  name = "username"  value="" />
</form>

<form name = "TO_EXCEL" />
 <input type="hidden"  name = "sec_cd"    value="" />
 <input type="hidden"  name = "stn_cd"    value="" />
 <input type="hidden"  name = "T1"        value="" />
 <input type="hidden"  name = "stn_long_desc" value="" />
</form>


<form name = "NOTES" target="_self" action="gen_stn_spec_notes.jsp" method="POST" />
 <input type="hidden"  name = "sec_cd"    value="" />
 <input type="hidden"  name = "stn_cd"    value="" />
 <input type="hidden"  name = "finyr"    value="" />
 <input type="hidden"  name = "finyr1"    value="" />
 <input type="hidden"  name = "bgt_lvl"   value="" />
 <input type="hidden"  name = "username"  value="" />
 <input type="hidden"  name = "stn_long_desc"  value="" />
</form>


<iframe name="I1" id="I1" style="width: 0; height: 0" marginwidth="1" marginheight="1" scrolling="no" border="0" frameborder="0">
</iframe>

<iframe name="I2" id="I2" style="width: 0; height: 0" marginwidth="1" marginheight="1" scrolling="no" border="0" frameborder="0">
</iframe>

<iframe name="I3" id="I3" style="width: 0; height: 0" marginwidth="1" marginheight="1" scrolling="no" border="0" frameborder="0">
</iframe>

<iframe name="I4" id="I4" style="width: 0; height: 0" marginwidth="1" marginheight="1" scrolling="no" border="0" frameborder="0">
</iframe>
<%

  PreparedStatement ps1=null;
  ResultSet rs1=null;
  PreparedStatement ps2=null;
  ResultSet rs2=null;
  PreparedStatement ps3=null;
  ResultSet rs3=null;
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

  try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);

     System.out.println("generation_budget_de_bbgs.jsp opened");

     sBgt_Fr_Year = request.getParameter("T1");
     sIp_ecode  = request.getRemoteAddr()+"_"+sUsername;

     if(sBgt_Fr_Year.equals("new_year_entry")){
        //sUsername    = loginBean.getsEmpCd();
        sUsername    = "000001";
    /// sBgt_To_Year = Integer.toString((Integer.parseInt(sBgt_Fr_Year))+1); 

  ///   sBgt_Fr_YY = sBgt_Fr_Year.substring(2);
    /// sBgt_To_YY = sBgt_To_Year.substring(2);

        ps1=mk.con.prepareStatement(" SELECT TO_NUMBER(MAX(BGT_YR)+1) "+
                                     " FROM   BGT_FORM2B_DATA_BBGS_TEMP_CNSL "+
                                     " WHERE  NVL(BGT_FNL, ' ') = 'F' ") ;
         rs1=ps1.executeQuery();

         while(rs1.next()){

             sBgt_Fr_Year = rs1.getString(1);

         }
         rs1.close();
         ps1.close();
         rs1 = null;
         ps1 = null;

         sBgt_Fr_Year = "2013";

         sBgt_To_Year = Integer.toString((Integer.parseInt(sBgt_Fr_Year))+1);
         sBgt_Fr_YY = sBgt_Fr_Year.substring(2);
         sBgt_To_YY = sBgt_To_Year.substring(2);


         ps1=mk.con.prepareStatement(" SELECT STN_CD,"+
                                     "        SEC_CD,"+
	                             "        EMP_DESG"+
	                             " FROM   BGT_LEVEL "+
                                     " WHERE  TRIM(EMP_CODE) = TRIM(?) ") ;
         ps1.setString(1,sUsername);

         System.out.println("Username"+sUsername);
         rs1=ps1.executeQuery();

         while(rs1.next()){

               iUsername = iUsername+1;
               sStn_cd  = rs1.getString(1);
               sSec_cd  = rs1.getString(2);
               sEmpDesg = rs1.getString(3);

         }

         rs1.close();
         ps1.close();
         rs1 = null;
         ps1 = null;

         sBgt_lvl = "1";
         ps1=mk.con.prepareStatement(" SELECT DISTINCT(BGT_LEVEL)"+
	                             " FROM   BGT_FORM2B_DATA_BBGS_TEMP_CNSL "+
	                             " WHERE  STN_CD = ? "+
	                             " AND    SEC_CD = ? "+
	                             " AND    BGT_YR = ? ");
         ps1.setString(1,sStn_cd);
         ps1.setString(2,sSec_cd);
         ps1.setString(3,sBgt_Fr_Year);

         rs1=ps1.executeQuery();

         while(rs1.next()){

               sBgt_lvl  = rs1.getString(1);

         }

         rs1.close();
         ps1.close();
         rs1 = null;
         ps1= null;

         ps1=mk.con.prepareStatement(" SELECT REPLACE(A.STATION_LONG_DESC,'AND','&') , "+
                                       " REPLACE(B.SECTION_DESC,'AND','&'), "+
                                       " TO_CHAR(TRUNC(SYSDATE),'DD-MON-RRRR') "+
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

     }else{

         sUsername    = request.getParameter("username");
         sStn_cd  = request.getParameter("stn_cd");
         sEmpDesg = request.getParameter("emp_desg");
         sGenStn  = request.getParameter("stn_long_desc");
         sSecDesc  = request.getParameter("sec_cd");
         sBgt_lvl  = request.getParameter("bgt_lvl");

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

         ps1=mk.con.prepareStatement(" select distinct sec_cd from bgt_level where emp_code=? and stn_cd=? and sec_cd<>'STN'  ");
         ps1.setString(1,sUsername);
         ps1.setString(2,sStn_cd);
         rs1=ps1.executeQuery();

         while(rs1.next()){
                 sSec_cd  = sSec_cd+"#"+rs1.getString(1);
         }
         rs1.close();
         ps1.close();
         rs1 = null;
         ps1 = null;
         sSec_cd= sSec_cd.substring(1);


         sBgt_lvl = "2";
         sAuth_Exist  = "0";

         if(!sAuth_Exist.equals("0")){

             sAuth_Flag = "1";

         }else{

             sAuth_Flag = "0";

         }

     }

     System.out.println("1111");
     System.out.println(sStn_cd+","+sSec_cd+","+sEmpDesg+","+sBgt_lvl+","+sUsername);

     if(iUsername!=0){

        if(!(sBgt_lvl.equals("1"))){

 
            sReadOnlyMkr = "T";

            sDisableB1Mkr = "T";
            sDisableB2Mkr = "T";
            sDisableB3Mkr = "T";

        }

/*
        ps1=mk.con.prepareStatement(" SELECT REPLACE(A.STATION_LONG_DESC,'AND','&'),"+
                                    " REPLACE(B.SECTION_DESC,'AND','&'), "+
                                    " TO_CHAR(TRUNC(SYSDATE),'DD-MON-RRRR') "+
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
*/
     System.out.println("2222");

           ps1=mk.con.prepareStatement(" SELECT DISTINCT NVL(BGT_FNL,'N') BGT_FNL"+
                                       " FROM BGT_FORM2B_DATA_BBGS_TEMP_CNSL "+
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
                                       " FROM BGT_FORM2B_DATA_BBGS_TEMP_CNSL "+
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

     System.out.println("3333"+sStn_cd+sSec_cd+sBgt_Fr_Year);
           if(sBgt_fnl.equals("F")){

              sReadOnlyMkr = "T";
              sDisableB1Mkr = "T";
              sDisableB2Mkr = "T";
              sDisableB3Mkr = "T";

           }else{

              System.out.println("sPub_mkr"+sPub_mkr);
              if(sPub_mkr.equals("Y")){

                 if(sBgt_lvl.equals("1")){


                   if(sAuth_Flag.equals("1")){
                      sReadOnlyMkr = "F";
                      sDisableB1Mkr = "F";
                      sDisableB2Mkr = "F";
                   }else{
                      sReadOnlyMkr = "T";
                      sDisableB1Mkr = "T";
                      sDisableB2Mkr = "T";
                   }

                 }else{

                   sReadOnlyMkr = "T";
                   sDisableB1Mkr = "T";
                   sDisableB2Mkr = "T";

                 }


/*
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
*/

/*
                 ps1=mk.con.prepareStatement(" SELECT NVL(TO_CHAR(SEND_TO_HIGHER_LEVEL_DT),'N') "+
                                             " FROM BGT_POSITION "+
                                             " WHERE STN_CD = ? "+
                                             " AND   SEC_CD = ? "+
                                             " AND   BGT_YR = ? "+
                                             " AND   BGT_LEVEL = ?" );

                 ps1.setString(1,sStn_cd);
                 ps1.setString(2,sSec_cd);
                 ps1.setString(3,sBgt_Fr_Year);
                 ps1.setString(4,sBgt_lvl);

                 System.out.println("DDDDDD");
                 rs1=ps1.executeQuery();

                 while(rs1.next()){

                       sSendToSuperiorDt = rs1.getString(1);

                 }

                 rs1.close();
                 ps1.close();
                 rs1 = null;
                 ps1 = null;


                 System.out.println("LLLL");
                 if(sSendToSuperiorDt.equals("N")&&sBgt_lvl.equals("1")){

                    sDisableB3Mkr = "F";

                 }else{

                    sDisableB3Mkr = "T";

                 }

*/

              }else{

                 if(sBgt_lvl.equals("1")){

                   if(sAuth_Flag.equals("1")){
                      sReadOnlyMkr = "F";
                      sDisableB1Mkr = "F";
                      sDisableB2Mkr = "F";
                   }else{
                      sReadOnlyMkr = "T";
                      sDisableB1Mkr = "T";
                      sDisableB2Mkr = "T";
                   }

                 }else{

                   sReadOnlyMkr = "T";
                   sDisableB1Mkr = "T";
                   sDisableB2Mkr = "T";

                 }

              }


           }
     System.out.println("4444");
           ps1=mk.con.prepareStatement(" SELECT COUNT(*) "+
                                       " FROM BGT_FORM2B_DATA_BBGS_TEMP_CNSL "+
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
%>

<script>


  document.INSERT_UPDATE_RECS.ins_upd_mkr.value = '<%= sInsUpdMkr %>';
  document.INSERT_UPDATE_RECS.bgt_yr.value = '<%= sBgt_Fr_Year %>';
  document.INSERT_UPDATE_RECS.bgt_fnl.value = '<%= sBgt_fnl %>';
  document.INSERT_UPDATE_RECS.sec_cd.value = '<%= sSec_cd %>';
  document.INSERT_UPDATE_RECS.bgt_lvl.value = '<%= sBgt_lvl %>';
  document.INSERT_UPDATE_RECS.pub_mkr.value = '<%= sPub_mkr %>';
  document.INSERT_UPDATE_RECS.username.value = '<%= sUsername %>';
  document.INSERT_UPDATE_RECS.stn_cd.value = '<%= sStn_cd %>';

  document.SELF_SUBMIT.sec_cd.value= '<%= sSec_cd %>';
  document.SELF_SUBMIT.stn_cd.value= '<%= sStn_cd %>';
  document.SELF_SUBMIT.T1.value= '<%= sBgt_Fr_Year %>';
  document.SELF_SUBMIT.bgt_lvl.value= '<%= sBgt_lvl %>';
  document.SELF_SUBMIT.username.value= '<%= sUsername  %>';
  document.SELF_SUBMIT.stn_long_desc.value= '<%= sGenStn  %>';

  document.PUBLISH.sec_cd.value= '<%= sSec_cd %>';
  document.PUBLISH.stn_cd.value= '<%= sStn_cd %>';
  document.PUBLISH.bgt_yr.value= '<%= sBgt_Fr_Year %>';
  document.PUBLISH.bgt_lvl.value= '<%= sBgt_lvl %>';
  document.PUBLISH.username.value= '<%= sUsername  %>';

  document.SEND_TO_SUPERIOR.sec_cd.value= '<%= sSec_cd %>';
  document.SEND_TO_SUPERIOR.stn_cd.value= '<%= sStn_cd %>';
  document.SEND_TO_SUPERIOR.bgt_yr.value= '<%= sBgt_Fr_Year %>';
  document.SEND_TO_SUPERIOR.bgt_lvl.value= '<%= sBgt_lvl %>';
  document.SEND_TO_SUPERIOR.username.value= '<%= sUsername  %>';

  document.TO_EXCEL.sec_cd.value= '<%= sSec_cd %>';
  document.TO_EXCEL.stn_cd.value= '<%= sStn_cd %>';
  document.TO_EXCEL.T1.value= '<%= sBgt_Fr_Year %>';
  document.TO_EXCEL.stn_long_desc.value= "<%= sGenStn  %>";

  document.NOTES.sec_cd.value= '#';
  document.NOTES.stn_cd.value= '<%= sStn_cd %>';
  document.NOTES.finyr.value= '<%= sBgt_Fr_Year %>';
  document.NOTES.finyr1.value= '<%= sBgt_Fr_Year %>'+" - "+'<%= sBgt_To_Year %>';
  document.NOTES.bgt_lvl.value= '<%= sBgt_lvl %>';
  document.NOTES.username.value= '<%= sUsername  %>';
  document.NOTES.stn_long_desc.value= '<%= sGenStn  %>';

</script>
<div id=fixed_div>
<table style="width: 100%" class="style1">
	<tr>
		<td class="style3" colspan="2"><strong>&nbsp;</strong></td>
		<td class="style3" colspan="17" align="center"><strong>Cash Flow Statement : <%= sBgt_Fr_Year %> - <%= sBgt_To_Year %></strong></td>
	</tr>
	<tr>
		<td class="style4" colspan="2"><strong><span class="style5"><%= sDate %></strong></td>
		<td class="style4" colspan="17" align="center"><strong><span class="style5"><%= sGenStn %></span> </strong></td>
	</tr>
	<tr>
		<td colspan="2" class="style6"><strong><span class="style7">Form 2B</span></strong></td>
		<td colspan="17" align="center" ><strong><span class="style7">SEC CODE : <%= sSec_cd %></span></strong></td>
	</tr>
	<tr class="style23">
		<td colspan="2" ><strong><span >&nbsp;</span></strong></td>
		<td colspan="17" align="center"><strong><span style="color:#620425">All Amount Values are in Rs. Lakhs</span></strong></td>
	</tr>
</table>

<%

     System.out.println("5555");
           if(sPub_mkr.equals("N") && sBgt_fnl.equals("N")){

              if(sInsUpdMkr.equals("I")){

                 if(sBgt_lvl.equals("1")){

                    sDisableB1Mkr = "F";

                 }
                 sDisableB2Mkr = "T";
                 sDisableB3Mkr = "T";

              }else{

                 if(sInsUpdMkr.equals("U")){

                    if(sBgt_lvl.equals("1")){
                       sDisableB1Mkr = "F";
                       sDisableB2Mkr = "F";
                    }

/*
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

*/

                    ps1=mk.con.prepareStatement(" SELECT NVL(TO_CHAR(SEND_TO_HIGHER_LEVEL_DT),'N') "+
                                                " FROM BGT_POSITION "+
                                                " WHERE STN_CD = ? "+
                                                " AND   SEC_CD = ? "+
                                                " AND   BGT_YR = ? "+
                                                " AND   BGT_LEVEL = ?" );

                    ps1.setString(1,sStn_cd);
                    ps1.setString(2,sSec_cd);
                    ps1.setString(3,sBgt_Fr_Year);
                    ps1.setString(4,sBgt_lvl);

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

                       if(sBgt_lvl.equals("1")){
                          sDisableB3Mkr = "F";
                       }

                    }else{

                       sDisableB3Mkr = "T";

                    }

                 }
      
              }

           }

     System.out.println("6666");

           ps1=mk.con.prepareStatement(" SELECT BGT_HD_ROWORDER,"+
                                       "        COUNT(*) ROW_SPAN "+
                                       " FROM BGT_FORM2B_STRUC_BBGS "+
                                       " WHERE NVL(TRIM(BGT_TO_YR),'@@') = '@@'  "+
                                       " GROUP BY BGT_HD_ROWORDER "+
                                       " ORDER BY BGT_HD_ROWORDER ");
           rs1=ps1.executeQuery();

           while(rs1.next()){

                 //iGrp_index = iGrp_index + 1;

                 iBgt_Hd_Roworder = iBgt_Hd_Roworder + 1;
                 sBgt_Hd_Roworder = rs1.getString(1); 
                 sSl_No_row_span = Integer.toString(rs1.getInt(2)); 

                 System.out.println("BGT_HD_ROWORDER"+sBgt_Hd_Roworder);

                 sBgt_Hd_Rowval = "";
                 sBgt_Grp_Rowval = "";
                 sBgt_Desc      = "";
                 sSubt_Mkr      = "";
                 sTr_Bg_Color   = "";
                 sBgt_seq       = "";
                 sAmt_NA_mkr    = "";

                 ps2 = mk.con.prepareStatement(" SELECT BGT_GRP_ROWORDER,COUNT(*) "+
                                               " FROM  BGT_FORM2B_STRUC_BBGS "+
                                               " WHERE NVL(TRIM(BGT_TO_YR),'@@') = '@@' "+
                                               " AND BGT_HD_ROWORDER = ? "+
                                               " GROUP BY BGT_GRP_ROWORDER "+
                                               " ORDER BY BGT_GRP_ROWORDER ");

                 ps2.setString(1,sBgt_Hd_Roworder);

                 rs2=ps2.executeQuery();
     System.out.println("7777");
                 while(rs2.next()){

                       sBgt_Grp_Roworder = rs2.getString(1);

                       ps3 = mk.con.prepareStatement(" SELECT BGT_HD_ROWORDER, "+
                                                     " BGT_GRP_ROWORDER,"+                          
                                                     " BGT_SUBHD_ROWORDER,"+                          
                                                     " NVL(BGT_HD_ROWVAL,' '), "+
                                                     " NVL(BGT_GRP_ROWVAL,' '), "+
                                                     " REPLACE ('<span style='||CHR(39)||'font-weight:lighter;background-color:#'|| "+ 
                                                     "           (SELECT COLOR_HEX "+
                                                     "            FROM BGT_COLOR "+
                                                     "            WHERE COLOR_CD=NVL(DESC1_B_COLOR,1))||'; color:#'|| "+
                                                     "           (SELECT COLOR_HEX "+
                                                     "             FROM BGT_COLOR "+
                                                     "            WHERE COLOR_CD=NVL(DESC1_F_COLOR,1))||CHR(39)||'>'||NVL(DESC1,' ')||'</span>','\"',' ') Budg_Desc ,"+
                                                     " NVL(SUBT_MKR,'NE'), "+
                                                     " (SELECT COLOR_HEX "+
                                                     " FROM BGT_COLOR "+
                                                     " WHERE COLOR_CD=NVL(DESC1_B_COLOR,1)) TD_BG_COLOR, "+
                                                     " BGT_SEQ, "+
                                                     " NVL(TRIM(AMT_NA),'NE'), "+
                                                     " DECODE(DESC_JUST,'L','left','R','right','C','center','left'), "+
                                                     " NVL(BGT_SUBHD_ROWVAL,' ') "+
                                                     " FROM BGT_FORM2B_STRUC_BBGS "+
                                                     " WHERE NVL(TRIM(BGT_TO_YR),'@@')= '@@' "+
                                                     " AND BGT_GRP_ROWORDER = ? "+
                                                     " AND BGT_HD_ROWORDER = ? "+
                                                     " ORDER BY BGT_SUBHD_ROWORDER ");
                                                     
                          ps3.setString(1,sBgt_Grp_Roworder);
                          ps3.setString(2,sBgt_Hd_Roworder);

                          rs3=ps3.executeQuery();

     System.out.println("8888");
                          while(rs3.next()){

      icnt = icnt+1;
/**** New Code Start ***/

  rows = new ArrayList() ;

rows.add(rs3.getString(1)) ;
rows.add(rs3.getString(2)) ;
rows.add(rs3.getString(3)) ;
rows.add(rs3.getString(4)) ;
rows.add(rs3.getString(5)) ;
rows.add(rs3.getString(6)) ;
rows.add(rs3.getString(7)) ;
rows.add(rs3.getString(8)) ;
rows.add(rs3.getString(9)) ;
rows.add(rs3.getString(10)) ;
rows.add(rs3.getString(11)) ;
rows.add(rs3.getString(12)) ;

l1.add(rows);

 System.out.println("ADDING XXXX"+rs3.getString(6));

/**** New Code End ***/
                 
                       iLineNo = iLineNo + 1;

/*
                       iGrp_sl_no = iGrp_sl_no + 1;
                       iGrp_sub_sl_no = iGrp_sub_sl_no + 1;
                       sSl_No_row_val = rs2.getString(1);
                       sBgt_Hd_Rowval = rs2.getString(2);
                       sBgt_Desc      = rs2.getString(3);
                       sSubt_Mkr      = rs2.getString(4);
                       sTr_Bg_Color   = rs2.getString(5);
                       sBgt_seq       = rs2.getString(6);
                       sAmt_NA_mkr    = rs2.getString(7);
                       sJustMkr       = rs2.getString(8);

                       if(iGrp_sl_no == 1){

                          sStrt_Bgt_seq_for_grp    = sBgt_seq;

                       }

                       if(sSubt_Mkr.equals("T1")){

                       }else{


                       }

                       if(sAmt_NA_mkr.equals("NE")){
      
                          sEnd_Bgt_seq_for_grp    = sBgt_seq;

                      }

                      if(sAmt_NA_mkr.equals("Y")){

                         i_g_y_cell_index = i_g_y_cell_index + 1;

                      }

                      if(sAmt_NA_mkr.equals("S")){

                         iGrp_sub_sl_no = 0;
                         iGrp_index = iGrp_index+1;

                      }

*/


                 }

     System.out.println("9999,");
                 rs3.close();
                 ps3.close();

                 rs3 = null;
                 ps3 = null;
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
     System.out.println("yyyyyyy:"+icnt);

           ps1=mk.con.prepareStatement("SELECT bgt_hd_roworder,bgt_grp_roworder,bgt_subhd_roworder,B.bgt_seq, "
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
                                     + "        FROM BGT_FORM2B_DATA_BBGS_TEMP_CNSL "
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

           System.out.println("l1.size()"+l1.size());
           System.out.println("l2.size()"+l2.size());

        for ( i=0; i<l2.size(); i++ ) {
            totrec++ ;
            rows1 = (List)l1.get(i) ;
            rows2 = (List)l2.get(i) ;


            System.out.println("RowSXXXX"+rows2.get(3)+","+rows1.get(3));
            System.out.println("RowSXXXX BGT_SEQ IN TWO LISTS"+rows1.get(8)+","+rows2.get(3));
            if ( rows1.get(8).equals(rows2.get(3)) ) {
                System.out.println("Rows bgt_seq STRUC,DATA:"+rows1.get(8)+",:"+rows2.get(3)+"Desc:"+rows1.get(5));
                rows = new ArrayList() ;

/*
                System.out.println("Head:"+rows1.get(3));
                System.out.println("Grp:"+rows1.get(4));
                System.out.println("SubHead:"+rows1.get(11));
                System.out.println("Desc:"+rows1.get(5));
                
*/
                System.out.println("AMT12"+rows2.get(4)+"AMT3"+rows2.get(5)+"AMTC"+rows2.get(6)+"AMT_TOT"+rows2.get(7));
                rows.add("\""+(String)rows1.get(3)+"\"") ;
                rows.add("\""+(String)rows1.get(4)+"\"") ;
                rows.add("\""+(String)rows1.get(11)+"\"") ;
                rows.add("\""+(String)rows1.get(5)+"\"") ;
                //attr = rows1.get(2).replaceAll("\"","'") ;
                //rows.add("\""+attr+"\"") ;

                System.out.println("rows2.size()"+rows2.size());
                for ( j=4; j<rows2.size(); j++ ) {
                    rows.add("\""+(String)rows2.get(j)+"\"") ;
                }
                rows.add("\"#"+(String)rows1.get(7)+"\"")  ;       /******** Adding TR Color *************/
                rows.add("\""+sReadOnlyMkr+"\"") ;                 /******** Adding ReadOnlyMkr **********/
                rows.add("\""+(String)rows1.get(9)+"\"") ;         /******** Adding AMTNA Mkr   **********/
                rows.add("\""+(String)rows1.get(6)+"\"") ;         /******** Adding subtMkr     **********/
                rows.add("\""+(String)rows1.get(8)+"\"") ;         /******** Adding Bgt Seq     **********/
                System.out.println("rows.size()"+rows.size());
                System.out.println("BGT_SEQ_ADDED:"+(String)rows1.get(8));
            }
            //System.out.println("RowS"+rows.get(0)+","+rows.get(1)+","+rows.get(2));
            detailList.add(rows) ;
        }


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
		<td class="style3" colspan="20" width="100%"><input type="button" name="CLOSE" value="CLOSE" onClick="window.open('close.html','_top');"</td>
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
     if(rs3!=null){
        rs3.close();
     }
     if(ps3!=null){
        ps3.close();
     }
     if(mk!=null){
        mk.con.close();
     }

     System.out.println("generation_budget_de_bbgs.jsp closed");
  
}
%>

</div>

<%
    rows = (List)detailList.get(4) ;
    rows1 = new ArrayList() ;
    rows1.add(rows) ;
%>

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

var myColorforCells = ["#FFFF6F","#85D1FA","#AF64E1","#AF64E1","#EAB668"];
var myData = <%= detailList %> ;

var g_alert_hd = "BUDGET SYSTEM :\n\n";
/*
var myHeaders1 = [" ", " ", " "," ", "Apr", "Apr", "Apr", "Apr", "May", "May", "May", "May", "Jun", "Jun", "Jun", "Jun", "Jul","Jul","Jul","Jul",
                   "Aug","Aug","Aug","Aug","Sep","Sep","Sep","Sep","Oct","Oct","Oct","Oct","Nov","Nov","Nov","Nov","Dec","Dec","Dec","Dec",
                   "Jan","Jan","Jan","Jan","Feb","Feb","Feb","Feb","Mar","Mar","Mar","Mar","ToT","ToT","ToT","ToT"];

*/
var myHeaders = ["Head", "Group", "Sub Head", "Description",  
                 "Unit1-2", "Unit3", "Common", "Total","Unit1-2", "Unit3", "Common", "Total", 
                 "Unit1-2", "Unit3", "Common", "Total","Unit1-2", "Unit3", "Common", "Total", 
                 "Unit1-2", "Unit3", "Common", "Total","Unit1-2", "Unit3", "Common", "Total", 
                 "Unit1-2", "Unit3", "Common", "Total","Unit1-2", "Unit3", "Common", "Total", 
                 "Unit1-2", "Unit3", "Common", "Total","Unit1-2", "Unit3", "Common", "Total", 
                 "Unit1-2", "Unit3", "Common", "Total","Unit1-2", "Unit3", "Common", "Total", 
                 "Unit1-2", "Unit3", "Common", "Total","Unit1-2", "Unit3", "Common", "Total" ];

var updatedCellsArray = new Array();
	var obj = new AW.Grid.Extended;

	obj.setId("myGrid");	// necessary for CSS rules

        obj.setHeaderCount(2);

        //obj.setHeaderText(function(col, row){return col + "." + row});

//        obj.setHeaderText(myHeaders1, 0);
        obj.setHeaderText(myHeaders, 1);

        obj.setRowCount(<%= totrec %>);
        obj.setColumnCount(56);
myHeaders = [" ", " ", " "," ", "Apr", "Apr", "Apr", "Apr", "May", "May", "May", "May", "Jun", "Jun", "Jun", "Jun", "Jul","Jul","Jul","Jul",
                   "Aug","Aug","Aug","Aug","Sep","Sep","Sep","Sep","Oct","Oct","Oct","Oct","Nov","Nov","Nov","Nov","Dec","Dec","Dec","Dec",
                   "Jan","Jan","Jan","Jan","Feb","Feb","Feb","Feb","Mar","Mar","Mar","Mar","ToT","ToT","ToT","ToT"];

        obj.setHeaderText(myHeaders, 0);

        obj.setCellText(myData);
        obj.setFixedLeft(4);
//alert("K"+myData[4][6]+",") ;
//alert(myData[4][57]) ;
/*
        obj.setCellEditable = function(col,row){
            if(col<=3)
               return false;
            else
               return true;
        };  // setEditable(true, colindex, rowindex) 
*/

        
        for ( i=0; i<myData.length; i++ ) {
            bgcolor = myData[i][56];
            readOnlyMkr = myData[i][57];
            amtNAMkr = myData[i][58]; 
            subtMkr = myData[i][59]; 

                if(i==3){
                  //alert("amtNAMkr"+amtNAMkr);
                  //alert("readOnlyMkr"+readOnlyMkr);
                }
            //alert(readOnlyMkr);
            //alert(myData[i][4]);
            if ( readOnlyMkr== 'T' ) {
                for ( j=4; j<56; j++ ) {
                    obj.setCellEditable(false,j,i);  // setEditable(true, colindex, rowindex) 
                    if(myData[i][j]=='null'){
                       obj.setCellText(" ",j,i);
                    }
        
                }
            }else{
                if(amtNAMkr == 'Y'||amtNAMkr == 'S'||amtNAMkr == 'F'){
                   for( j=4; j<56; j++ ) {
                       obj.setCellEditable(false,j,i);
                       if(myData[i][j]=='null'){
                          obj.setCellText(" ",j,i);
                       }
                   }
                } else{
                   for( j=4; j<56; j++ ) {
                       if(j%4==3||(j>=52&&j<=55)){
                           obj.setCellEditable(false,j,i);
                       }else{
                           obj.setCellEditable(true,j,i);
                       }
                       if(myData[i][j]=='null'){
                          obj.setCellText(" ",j,i);
                       }
                   }
                }

            }

        }

	// add custom row property calculated from the cell value in col-56
        obj.defineRowProperty("background", function(row){
	        var value = this.getCellValue(56, row);
	        return value ;
        });


        // add dynamic row style linked to the custom row background property
        obj.getRowTemplate().setStyle("background", function(){
	        return this.getRowProperty("background");
        });

/*
        obj.defineCellProperty("color") ;
        obj.setCellColor(function(col, row) { 
            if(col>=4){ 
               if (col%4==3&&col!=55) 
                   return myColorforCells[0] ;
               if (col == 52 || col == 53||col == 54) 
                   return myColorforCells[1] ;
               if (col == 55) 
                  return  myColorforCells[4] ;
 
               return this.getCellValue(56, row) ;
            }
            return this.getCellValue(56, row) ;
        }) ;

        obj.getCellTemplate().setStyle("background-color", function(){ 
                return this.getCellProperty("color")});

*/
        obj.onCellTextChanged = function(text, column, row){
/*
        //     alert(this.getCellText(column, row));
             var alreadyExist = 0;
             for(i=0;i<updatedCellsArray.length;i++){

                 if(updatedCellsArray[i][0] == row && updatedCellsArray[i][1] == column){

                    alreadyExist = 1;
                    break;

                 }

             }
   
             //alert("Already Exist"+alreadyExist);
             if(alreadyExist == 0){
                updatedCellsArray[updatedCellsArray.length] = new Array(2);
                updatedCellsArray[updatedCellsArray.length-1][0] = row;
                updatedCellsArray[updatedCellsArray.length-1][1] = column;
             }
*/
        }

        obj.onCellClicked = function(event, column, row){

        //     alert(this.getCellText(column, row));
             
        }

        obj.onCellValidating = function(text, col, row){
        //    alert("Validating"+row+","+col)
            if ( !isPosInt(text) ) {
                alert(g_alert_hd+"ERROR : Please enter numeric value only") ;
                return true;
            }

            if(!checkValue(text)){

                return true;

            }

/*
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
*/
         }


/*
	    obj.setCellText(function(col, row){
                for ( i=0; i<48; i++ ) {
                    t1[i] = Number(this.getCellText(i+4, row));
                }

                sum = 0 ;

                for ( i=0; i<48; i++ ) {
                    sum = sum + t1[i] ;
                }
                myData[row][55] = sum ;
                return sum ;

	    }, 55, row);	// calculate column 2 from columns 0 and 1

*/
            obj.onCellValidated = function(text, col, row){
                
         //   alert("Validated"+row+","+col)
                      sum = 0;
                      var t = new Array();
                      for(i=4;i<51;i=i+4){
                                try{
                                t[i]=Number(obj.getCellText(i,row));
                                //alert("i"+i+",value"+t[i]);
                                sum= sum +t[i];
                                //sum = sum.toFixed(2);
                                }catch(e){
                                    alert("Exception at i"+i+",value"+e);
                                }
                      }
                      sum = sum.toFixed(3);
                      obj.setCellText(sum,52,row);
          
                      sum = 0;
                      var t = new Array();
                      for(i=5;i<51;i=i+4){
                                try{
                                t[i]=Number(obj.getCellText(i,row));
                                //alert("i"+i+",value"+t[i]);
                                sum= sum +t[i];
                                //sum = sum.toFixed(2);
                                }catch(e){
                                    alert("Exception at i"+i+",value"+e);
                                }
                      }
                      sum = sum.toFixed(3);
                      obj.setCellText(sum,53,row);
          
                      sum = 0;
                      var t = new Array();
                      for(i=6;i<51;i=i+4){
                                try{
                                t[i]=Number(obj.getCellText(i,row));
                                //alert("i"+i+",value"+t[i]);
                                sum= sum +t[i];
                                //sum = sum.toFixed(2);
                                }catch(e){
                                    alert("Exception at i"+i+",value"+e);
                                }
                      }
                      sum = sum.toFixed(3);
                      obj.setCellText(sum,54,row);
          
          
                      for(monstart=4;monstart<=48;monstart=monstart+4){
                           sum = 0;
                           index=0;
                           var t = new Array();
                           for(i=monstart;i<monstart+3;i=i+1){
                    
                                try{
                                t[index]=Number(obj.getCellText(i,row));
                                //alert("Exception at i"+i+"colstart"+colstart+",value"+t[i]);
                                sum= sum +t[index];
                                //sum = sum.toFixed(2);
                                }catch(e){
                                    alert("Exception at i"+i+"monstart"+monstart+",value"+e);
                                }
                                index = index+1;
                          }
                          sum = sum.toFixed(3);
                          obj.setCellText(sum,monstart+3,row);
          
                      }
               
                      sum = 0;
                      var t = new Array();
                      k = 0;
                      for(i=52;i<=54;i=i+1){
                          k = k+1;
                                try{
                                t[k]=Number(obj.getCellText(i,row));
                                //alert("i"+i+",value"+t[i]);
                                sum= sum +t[k];
                                }catch(e){
                                    alert("Exception at i"+i+",value"+e);
                                }
                      }
                      sum = sum.toFixed(3);
                      obj.setCellText(sum,55,row);
            //          obj.setCellEditable(true,col,row);

            /* Formula For Summation Rows */
/*
                      sum = 0;
                      var t1 = new Array(); 
                      obj.setCellText(function(col, row){
                          for ( i=0; i<4; i++ ) {
                                t1[i] = Number(this.getCellText(col, i));
                          }

                          sum = 0 ;

                          for ( i=0; i<4; i++ ) {
                               sum = sum + t1[i] ;
                               //myData[4][col] = sum ;
                          }
                          sum = sum.toFixed(3);
                          //alert(sum);
                          return sum ;

	              }, col, 4);	// calculate column 2 from columns 0 and 1
                      
*/
/*
                      sum = 0;
                      var t1 = new Array(); 
                      obj.setCellText(function(col, row){
                          for ( i=5; i<=10; i++ ) {
                                t1[i] = Number(this.getCellText(col, i));
                          }

                          sum = 0 ;

                          for ( i=5; i<=10; i++ ) {
                               sum = sum + t1[i] ;
                               //myData[4][col] = sum ;
                          }
                          sum = sum.toFixed(3);
                          //alert(sum);
                          return sum ;

	              }, col, 11);	// calculate column 2 from columns 0 and 1

                      sum = 0;
                      var t1 = new Array(); 
                      obj.setCellText(function(col, row){
                          for ( i=12; i<=18; i++ ) {
                                t1[i] = Number(this.getCellText(col, i));
                          }

                          sum = 0 ;

                          for ( i=12; i<=18; i++ ) {
                               sum = sum + t1[i] ;
                               //myData[4][col] = sum ;
                          }
                          sum = sum.toFixed(3);
                          //alert(sum);
                          return sum ;

	              }, col, 19);	// calculate column 2 from columns 0 and 1
*/

/*
                      obj.onKeyEnter = function(event){

                          //alert("Enter Pressed at "+row+","+col);
                          //obj.setCurrentColumn(Number(col)); 
                          //obj.setSelectedColumns([Number(col)]); 
                          obj.setCurrentSelection("row"); 
                          //alert(Number(row)+1);
                          obj.setCurrentRow(Number(row)+1); 
                          obj.setSelectedRows([0]); 
                          //alert("setting currentcolumn");
                

                      }
*/

                     //  alert(this.getCellText(column, row));
             
     /**********         Insert the Validated cells into array which will be used for updation,In addition also include cells which get affected because of summation ***************/

                      if(col>=4){
                         var alreadyExist = 0;
                         var col_sum = 0;
                         //var col_month_tot = parseInt(Number(col)-0)+48;
                      //   alert("Number(col)"+Number(col));
                      //   alert("(parseInt(Number(col)-0)/4)"+(parseInt(Number(col)-0)/4));
                         var temp1 = (parseInt(Number(col)-0)/4) ;
                         var temp = (""+temp1).split('.')[0];
                         temp = parseInt(temp-0);
                      //   alert("temp1"+temp1+",temp"+temp);
                      //   alert("(12-[(temp)-1])"+(parseInt((12-[(temp)-1])-0)*4));
                         var temp3 = (parseInt((12-[(temp)-1])-0)*4);
                     //    alert("Number(col)"+Number(col));
                         var col_month_tot = temp3+parseInt(Number(col)-0);
                     //    alert("col_month_tot"+col_month_tot);
                         var col_grnd_tot = 55; 
                         if(Number(col)%4==0){
                            col_sum = parseInt(Number(col)-0)+3;
                         }
                         if(Number(col)%4==1){
                            col_sum = parseInt(Number(col)-0)+2;
                         }
                         if(Number(col)%4==2){
                            col_sum = parseInt(Number(col)-0)+1;
                         }
                         if(Number(col)%4==3){
                            col_sum = parseInt(Number(col)-0);
                         }

                         for(i=0;i<updatedCellsArray.length;i++){

                             if(updatedCellsArray[i][0] == row && updatedCellsArray[i][1] == col){

                                alreadyExist = 1;
                                break;

                             }else{

                                if(updatedCellsArray[i][0] == row && updatedCellsArray[i][1] == col_sum){

                                   //alreadyExist = 1;
                                   break;
                                }else{

                                   if(updatedCellsArray[i][0] == row && updatedCellsArray[i][1] == col_month_tot){
                                      //alreadyExist = 1;
                                      break;

                                   }else{

                                      if(updatedCellsArray[i][0] == row && updatedCellsArray[i][1] == col_grnd_tot){
                                       //  alreadyExist = 1;
                                         break;

                                      }
 
                                   }

                                }

                              }

                           }
   
                           //alert("Already Exist"+alreadyExist);
                           if(alreadyExist == 0){

                              //alert("column"+col+",col_sum"+col_sum+"col_month_tot"+col_month_tot+"col_grnd_tot"+col_grnd_tot);
                              updatedCellsArray[updatedCellsArray.length] = new Array(2);
                              updatedCellsArray[updatedCellsArray.length-1][0] = row;
                              updatedCellsArray[updatedCellsArray.length-1][1] = col;

                              updatedCellsArray[updatedCellsArray.length] = new Array(2);
                              updatedCellsArray[updatedCellsArray.length-1][0] = row;
                              updatedCellsArray[updatedCellsArray.length-1][1] = col_sum;

                              updatedCellsArray[updatedCellsArray.length] = new Array(2);
                              updatedCellsArray[updatedCellsArray.length-1][0] = row;
                              updatedCellsArray[updatedCellsArray.length-1][1] = col_month_tot;

                              updatedCellsArray[updatedCellsArray.length] = new Array(2);
                              updatedCellsArray[updatedCellsArray.length-1][0] = row;
                              updatedCellsArray[updatedCellsArray.length-1][1] = col_grnd_tot;
                           }
       
                        }

            }
            

            obj.onCellEditEnding = function(text, column, row){

                      //alert("onCellEditEnding"+row+","+column);
                      //obj.setCurrentSelection("row");

                      var next_row = 0;
                      var next_col = 0;

                      next_row = Number(row)+1;

                      while((next_row<=obj.getRowCount())&&(!obj.getCellEditable(column,next_row))){

                          next_row = next_row+1;

                      }

                      if(next_row>obj.getRowCount()){

                          next_row = Number(row);

                      }

/*
                      if(next_row >=obj.getRowCount()-1){

                         if(column<=55){
                            next_row = 0; 
                            next_col = col + 1;
                         }else{
                            next_row = obj.getRowCount()-1; 
                            next_col = col ;
                         }
                         
                      }
*/
                      //alert(next_row);
                      //alert(next_col);
                      obj.setCurrentRow(next_row);
                      obj.setSelectedRows([next_row]);
                      obj.setCurrentColumn(Number(column));
                      obj.setSelectedColumns([Number(column)]);
                      //alert("setting currentcolumn");
/*
                      obj.onKeyEnter = function(event){

                          //alert("Enter Pressed at "+row+","+col);
                          //obj.setCurrentColumn(Number(col));
                          //obj.setSelectedColumns([Number(col)]);
                          obj.setCurrentSelection("row");
                          //alert(Number(row)+1);
                          obj.setCurrentRow(Number(row)+1);
                          obj.setSelectedRows([0]);
                          //alert("setting currentcolumn");

                      }
*/

            }

    document.write(obj);

function f1(){

    var rowDelim = "$$$";
    var colDelim = "|";
    var insUpd_string = "";

    var insUpdMkr = document.INSERT_UPDATE_RECS.ins_upd_mkr.value;

    if(insUpdMkr == "I"){
       for ( i=0; i<myData.length; i++ ) {

             for ( j=4; j<=60; j++ ) {

                   insUpd_string = insUpd_string + obj.getCellText(j, i) + colDelim;              

             }

             insUpd_string = insUpd_string + rowDelim;
       }

       //alert(insUpdMkr+"-"+insUpd_string);
       document.INSERT_UPDATE_RECS.insert_string.value = insUpd_string;

    }else{

//       alert(updatedCellsArray.length);
       for( i = 0;i<updatedCellsArray.length; i++){

            //alert("Updated Row"+updatedCellsArray[i][0]);
            //alert("Updated Col"+updatedCellsArray[i][1]);
            insUpd_string = insUpd_string + obj.getCellText(updatedCellsArray[i][1],updatedCellsArray[i][0]) + colDelim + updatedCellsArray[i][1] + colDelim + updatedCellsArray[i][0] + colDelim + obj.getCellText(60,updatedCellsArray[i][0]) + colDelim;              

            insUpd_string = insUpd_string + rowDelim;


       }

       //alert(insUpdMkr+"-"+insUpd_string);
       document.INSERT_UPDATE_RECS.insert_string.value = insUpd_string;

    }

    //alert("KK"+insUpd_string+"LL");
    if(insUpd_string.length!=0){

       document.getElementById("B1").disabled=true;
       document.getElementById("B2").disabled=true;
       document.getElementById('img1').disabled=true;
       if(submitForInsUpd()){

          loadImg();

       }
    }

    return true;

}

function submitForInsUpd(){

   document.INSERT_UPDATE_RECS.submit(); 
   return true;
}

function selfSubmit(){

   document.SELF_SUBMIT.submit(); 
   return true;
}

function publishBudget(){

var flg=confirm("BUDGET SYSTEM :\n\nPlease ensure that; \n  the last changes have been saved.\n\nTo save the changes;\n  - please press CANCEL to close this dialog box \n  - Please click on SAVE to save the edits.\n  - Please press the PUBLISH button again to Publish.");
if(flg==true){
      document.PUBLISH.submit();
}else{
  return false;
}

}

function sendToSuperior(){

   document.SEND_TO_SUPERIOR.submit();
   return true;

}

function enableDisableButtons(disableMkrB1,disableMkrB2,disableMkrB3){

   if(disableMkrB1 == "T"){

      document.getElementById("B1").disabled = true;

   }else{

      document.getElementById("B1").disabled = false;

   }

   if(disableMkrB2 == "T"){

      document.getElementById("B2").disabled = true;

   }else{

      document.getElementById("B2").disabled = false;
   }

/*
   if(disableMkrB3 == "T"){

      document.getElementById("B3").disabled = true;

   }else{

      document.getElementById("B3").disabled = false;
   }
*/

}

function checkValue(text){

//   alert("Text"+text);

   var decPos = -1 ;
   var decCnt = 0 ;

   var minusPos = -1;
   var minusCnt = 0;
   for(i=0;i<text.length;i++){
     
       if(text.charAt(i)=='.'){
       
          decPos=i;
          decCnt++;         
       }
       if(text.charAt(i)=='-'){

          minusPos=i;
          minusCnt++;
       }
    
   }

   if(minusPos!= -1 && minusPos != 0){

      alert("Negative Sign should be placed at the Begining!!")
      return false;

   }

   if(minusPos==0 && text.length ==1){

      alert("Please Enter Some Value after Negative Sign!!")
      return false;

   }

      
   if(decCnt>1){
      
      alert(g_alert_hd+"Decimal Point Can Occur AtMost Once!!");
      return false;
      
   }
      
   if(decPos==-1){
     
      var valBefDec = text.substring(0);
      var valAftDec = "00";

      
   }else{
      
      var valBefDec = text.substring(0,decPos);
      var valAftDec = text.substring(decPos+1);
      
   }

   if(minusCnt==0){
      
      if(valBefDec.length>5){
      
         alert(g_alert_hd+"Please Enter Not More Than 5 Digits Before Decimal Part!!");
         return false;
      
      }else{
      
         if(valAftDec.length>3){
      
            alert(g_alert_hd+"Please Enter Not More Than 3 Digits After Decimal Part!!");
            return false;

         }
      
      }

   }else{

      if(valBefDec.length>6){

         alert(g_alert_hd+"Please Enter Not More Than 5 Digits Before Decimal Part!!");
         return false;

      }else{

         if(valAftDec.length>3){

            alert(g_alert_hd+"Please Enter Not More Than 3 Digits After Decimal Part!!");
            return false;

         }
     
      }

   }

   return true;
}

function loadImg(){

 document.getElementById("d1").innerHTML = '<img src="load_img.gif"/>';

}

function unloadImg(){

 document.getElementById("d1").innerHTML = "&nbsp";
 document.getElementById("d1").setAttribute("style","width:0px");

}


function back_prev(){
   var parameter='';
   parameter = parameter + 'userid='+document.INSERT_UPDATE_RECS.username.value;
   window.close();
   window.open("invoke_menu_page.jsp?"+parameter,"mainWin","toolbar=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,fullscreen=1");

}


function openExcel(){

    var flg=confirm("BUDGET SYSTEM :\n\nPlease ensure that; \n  the last changes have been saved.\n\nTo save the changes;\n  - please press CANCEL to close this dialog box \n  - Please click on SAVE to save the edits.\n  - Please press the Excel button again to save as Excel ");
    if(flg==true){
      document.TO_EXCEL.action='generation_budget_de_bbgs_temp_forexcel.jsp ';
      document.TO_EXCEL.target='_blank';
      document.TO_EXCEL.submit();
      document.TO_EXCEL.action='';
    }else{
      return false;
    }


}

function callNotesPage(){

      document.NOTES.submit();
      document.NOTES.action='';

}

</script>

<div id="d1" style="position:relative;left:500px;bottom:10px" >
</div>

<table style="width: 100%" class="style1">
	<tr>
		<td class="style3" colspan="20" width="100%">
                    <input type="button" name="B1" id="B1" value="SAVE" onClick="f1()"/>
                    <input type="button" name="B2" id="B2" value="PUBLISH" onClick="publishBudget()"/> 
                    <input type="button" name="B4" id="B4" value="CLOSE" onClick="back_prev();"/>
                    <input type="button" name="B5" id="B5" value="NOTES" onClick="callNotesPage();"/>
                </td>
                <td class="style3">
                    &nbsp;
                </td>
                <td class="style3">
                    <input id="img1" type="image" alt="To_Excel" onclick="openExcel();"  src="excel_img.jpg"/>
               </td>
	</tr>
</table>

<table style="width: 100%" class="style1">
	<tr>
		<td align="center" width="100%"> &nbsp; 
               </td>
        </tr>
<!--
        <tr>
		<td align="center" width="100%"> <span style="color:#620425" size="4">
                                                 ** Please press Enter after editing the cells **
                </span>
               </td>
	</tr>
-->
</table>
<script>

   enableDisableButtons('<%= sDisableB1Mkr %>','<%= sDisableB2Mkr %>','<%= sDisableB3Mkr %>')

</script>
</body>

</html>
