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
<title>ActiveWidgets Example</title>

<script src="aw_bbgs.js" type="text/javascript"></script>
<link href="aw.css" rel="stylesheet">
<link href="aw_myGrid1.css" rel="stylesheet">
<link href="aw_myGrid2.css" rel="stylesheet">

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
	//#myGrid .aw-rows-selected {background: #316ac5;}
	//#myGrid .aw-rows-selected .aw-column-1 {background: #316ac5;}


/********************************************************************
	Columns
********************************************************************/

        #myGrid .aw-column-0 {width: 50px; text-align: center; border-right: 1px solid #000000}
        #myGrid .aw-column-1 {width: 60px; text-align: center; border-right: 1px solid #000000}
        #myGrid .aw-column-2 {width: 240px; text-align: left; border-right: 1px solid #000000}
        #myGrid .aw-column-3 {width: 70px; text-align: center; border-right: 1px solid #000000}
        #myGrid .aw-column-4 {width: 70px; text-align: center; border-right: 1px solid #000000}
        #myGrid .aw-column-5 {width: 70px; text-align: center; border-right: 1px solid #000000}
        #myGrid .aw-column-6 {width: 70px; text-align: center; border-right: 1px solid #000000}
        #myGrid .aw-column-7 {width: 70px; text-align: center; border-right: 1px solid #000000}
        #myGrid .aw-column-8 {width: 70px; text-align: center; border-right: 1px solid #000000}
        #myGrid .aw-column-9 {width: 80px; text-align: center; border-right: 1px solid #000000}
        #myGrid .aw-column-10 {width: 70px; text-align: center; border-right: 1px solid #000000}
        #myGrid .aw-column-11 {width: 70px; text-align: center; border-right: 1px solid #000000}

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
	#myGrid .aw-grid-row .aw-cells-selected {background: #85D1FA; }
        #myGrid .aw-edit-cell { background: #85D1FA;}

/********************************************************************
	Headers
********************************************************************/

	#myGrid .aw-grid-headers {color: blue}
	#myGrid .aw-grid-headers .aw-column-0 {font-weight: bold;background: #FFD6C1;}
	#myGrid .aw-grid-headers .aw-column-1 {font-weight: bold;background: #FFD6C1;}
	#myGrid .aw-grid-headers .aw-column-2 {font-weight: bold;background: #FFD6C1;}
/*	#myGrid .aw-grid-headers .aw-column-3 {font-weight: bold;background: #FFD6C1;}*/

	/*	Highlight on mouseover, mousedown */
	#myGrid .aw-mouseover-header {color: red;}
	#myGrid .aw-mousedown-header {color: yellow;}

/*	#myGrid .aw-header-1 {background: #def} */
        #myGrid .aw-header-0 {background: #FFD6C1;border-bottom: 1px solid #000000;}
	#myGrid .aw-header-1 {background: #FFD6C1}

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

function openExcel(){

//      alert("EXCEL SUBMIT");
      document.TO_EXCEL.action='generation_budget_compiled_forexcel.jsp';
      document.TO_EXCEL.target='_blank';
      document.TO_EXCEL.submit();
      document.TO_EXCEL.action='';
      return true;
}

function goBack(){

      document.BACK.submit();
      document.BACK.action='';
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
   parameter = parameter + 'userid='+document.TO_EXCEL.username.value;
   window.close();
   window.open("invoke_menu_page.jsp?"+parameter,"mainWin","toolbar=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,fullscreen=1");
}


function trunc_no(number,plc_aft_dec){

  var num_bef_dec = 0;
  var num_aft_dec = 0;
  var num_aft_dec1 = 0;
  var truncNum = 0;
  var dec_pos= 0 ;

  for(var i=0;i<number.length;i++){
      if(number.charAt(i)=='.'){
         dec_pos = i;  
         break;
      } 
  }

  num_aft_dec = number.substr(dec_pos+1);
  num_bef_dec = number.substr(0,dec_pos);
  
  if(plc_aft_dec=='0'){

     truncNum = num_bef_dec;

  }else{
     var i_plc_aft_dec = parseInt(plc_aft_dec-0);
     num_aft_dec1 = num_aft_dec.substr(0,i_plc_aft_dec);
     truncNum = num_bef_dec +"."+ num_aft_dec1;
  }

  return truncNum;
}



</script>
</head>

<body >

<form name = "TO_EXCEL" >
 <input type="hidden"  name = "sec_cd"    value="" />
 <input type="hidden"  name = "stn_cd"    value="" />
 <input type="hidden"  name = "T1"        value="" />
 <input type="hidden"  name = "stn_long_desc" value="" />
 <input type="hidden"  name = "username" value="" />
 <input type="hidden"  name = "bgt_hdr" value="" />
</form>

<form name = "BACK" method="POST" action="budget_dash_main_dtl.jsp" target="_self">
 <input type="hidden"  name = "sec_cd"    value="" />
 <input type="hidden"  name = "stn_cd"    value="" />
 <input type="hidden"  name = "finyr"     value="" />
 <input type="hidden"  name = "finyr1"    value="" />
 <input type="hidden"  name = "empcd"     value="" />
</form>

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
  String sBgtHdr               = new String("");


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
  int icnt1 = 0; 

  String sHtml_All1 = new String("");
  String sHtml_All2 = new String("");
  String sHtml_All_footer = new String("");
  String sHtml_All1_footer = new String("");
  String sHtml_All2_footer = new String("");

  try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);

     System.out.println("generation_budget_compiled.jsp opened");

     sBgt_Fr_Year = request.getParameter("T1");
     sIp_ecode  = request.getRemoteAddr()+"_"+sUsername;

     if(sBgt_Fr_Year.equals("new_year_entry")){

     }else{

         sUsername    = request.getParameter("username");
         sStn_cd  = request.getParameter("stn_cd");
         sSec_cd  = request.getParameter("sec_cd");
         sEmpDesg = request.getParameter("emp_desg");
         sBgtVer  = request.getParameter("bgt_ver");
         sBgtHdr  = request.getParameter("bgt_hdr");

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


         ps1=mk.con.prepareStatement(" SELECT COUNT(*) FROM BGT_FORM2B_DATA  "+
                                     " WHERE STN_CD='A' AND SEC_CD='ALL' and BGT_YR=? ");

         ps1.setString(1,sBgt_Fr_Year);
         rs1=ps1.executeQuery();

         while(rs1.next()){

               icnt1    = rs1.getInt(1);
 
         }

         rs1.close();
         ps1.close();
         rs1 = null;
         ps1 = null;

         sBgt_lvl = "1";

     }

/** ForceFully assigned icnt1 a nonzeo value **/
     icnt1 = 1;

     if(icnt1==0){

%>
<table style="width: 100%" class="style1">
        <tr>
            <td colspan=9>&nbsp;</td>
        </tr>
        <tr>
            <td colspan=9>&nbsp;</td>
        </tr>
        <tr>
            <td colspan=9>&nbsp;</td>
        </tr>
        <tr>
            <td colspan=9>&nbsp;</td>
        </tr>
        <tr>
            <td colspan=9>&nbsp;</td>
        </tr>
        <tr>
            <td colspan=9>&nbsp;</td>
        </tr>
	<tr>
		<td class="style4" colspan="9" align="center"><strong>SECTION BUDGET NOT READY FOR <%= sBgt_Fr_Year %> - <%= sBgt_To_Year %></u></strong></td>
	</tr>
        <tr>
            <td colspan=9>&nbsp;</td>
        </tr>
	<tr>
		<td colspan="9" align="center"><input type= "button" name="CLOSE1" value="CLOSE" onClick="goBack();"/></td>
	</tr>
</table>

<%
     }else{

          if(iUsername!=0){

%>

<script>

  document.TO_EXCEL.sec_cd.value= '<%= sSec_cd %>';
  document.TO_EXCEL.stn_cd.value= '<%= sStn_cd %>';
  document.TO_EXCEL.T1.value= '<%= sBgt_Fr_Year %>';
  document.TO_EXCEL.stn_long_desc.value= "<%= sGenStn  %>";
  document.TO_EXCEL.username.value= "<%= sUsername  %>";
  document.TO_EXCEL.bgt_hdr.value= "<%= sBgtHdr  %>";

  document.BACK.sec_cd.value= 'ALL';
  document.BACK.stn_cd.value= 'A';
  document.BACK.finyr.value= '<%= sBgt_Fr_Year %>';
  document.BACK.finyr1.value= '<%= sBgt_Fr_Year %>' - '<%= sBgt_To_Year %>';
  document.BACK.empcd.value= "<%= sUsername  %>";

</script>
<table style="width: 100%" class="style1">
	<tr>
		<td class="style3" colspan="2"><strong>&nbsp;</strong></td>
		<td class="style3" colspan="17" align="center"><strong>BUDGET : <%= sBgt_Fr_Year %> - <%= sBgt_To_Year %> </strong></td>
	</tr>
	<tr>
		<td class="style4" colspan="2"><strong><span class="style5"><%= sDate %></strong></td>
		<td class="style4" colspan="17" align="center"><strong><span class="style5">COMPILED BUDGET <%= sBgtHdr %></span> </strong></td>
	</tr>
	<tr>
		<td colspan="2" class="style6"><strong><span class="style7">Form 2B</span></strong></td>
		<td colspan="17" align="center" ><strong><span class="style7"></span></strong></td>
	</tr>
	<tr class="style23">
		<td colspan="2" ><strong><span >&nbsp;</span></strong></td>
		<td colspan="17" align="center"><strong><span style="color:#620425">All Amount Values are in Rs. Lakhs</span></strong></td>
	</tr>
</table>

<%

          System.out.println("6666");
     
          ps1 = mk.con.prepareStatement(" SELECT NVL(SL_NO_ROWVAL,' '), "+
                                        "        NVL(BGT_HD_ROWVAL,' '), "+
                                        "  REPLACE('<span style='||CHR(39)||'font-weight:lighter;background-color:#'|| "+
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
	                                "     WHERE COLOR_CD=NVL(DESC3_F_COLOR,1))||CHR(39)||'>'||NVL(DESC3,' ')||'</span>','\"',' ') Budg_Desc,"+
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

          System.out.println("8888");
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
                  
                    //   rows.add(rs1.getString(12)) ;

                       l1.add(rows);

                   //System.out.println("ADDING XXXX"+rs1.getString(6));

/**** New Code End ***/
                 
                       iLineNo = iLineNo + 1;

                 }

                 rs1.close();
                 ps1.close();

                 ps1=null;
                 rs1=null; 
               System.out.println("yyyyyyy:"+icnt);


                ps1=mk.con.prepareStatement("SELECT B.BGT_SEQ,B.SL_NO_ROWORDER,B.BGT_HD_ROWORDER, "
                                          + " TO_CHAR(NVL(A.AMT_BBGS,0),'99990.999') bbgs_tot,"
                                          + " TO_CHAR(NVL(A.AMT_TGS,0),'99990.999') tgs_tot,"
                                          + " TO_CHAR(NVL(A.AMT_SGS,0),'99990.999') sgs_tot,"
                                          + " TO_CHAR(NVL(A.AMT_NCGS,0),'99990.999') ncgs_tot,"
                                          + " TO_CHAR(NVL(A.AMT_CTM,0),'99990.999') ctm_tot,"
                                          + " TO_CHAR(NVL(A.AMT_EDGE,0),'99990.999') edg_tot,"
                                          + " TO_CHAR(NVL(A.AMT_PF_BBGS_TGS_SGS,0),'99990.999') pf_tot, "
                                          + " TO_CHAR(NVL(A.AMT_STN_BBGS_TGS_SGS_NCGS,0),'99990.999') gen_stn__tot,"
                                          + " TO_CHAR(NVL(A.AMT_DIV_ALL6,0),'99990.999') gen_div "
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
     
/*
                      System.out.println("RowSXXXX BGT_SEQ IN TWO LISTS"+rows1.get(5)+","+rows2.get(0));
                      System.out.println("rows1.size()"+rows1.size()+",rows2.size()"+rows2.size());

                      System.out.println("Head:"+rows1.get(0));
                      System.out.println(" Grp:"+rows1.get(1));
                      System.out.println("Desc:"+rows1.get(2));
     
*/
                      if (rows1.get(5).equals(rows2.get(0))) {
                          sReadOnlyMkr="T";
                          rows = new ArrayList() ;
                          rows.add("\""+(String)rows1.get(0)+"\"") ;
                          rows.add("\""+(String)rows1.get(1)+"\"") ;
                          rows.add("\""+(String)rows1.get(2)+"\"") ;

                          for ( j=3; j<rows2.size(); j++ ) {
                              rows.add("\""+(String)rows2.get(j)+"\"") ;
                          }
                          rows.add("\"#"+(String)rows1.get(4)+"\"") ;
                          rows.add("\"#"+(String)rows1.get(8)+"\"") ;
                          rows.add("\"#"+(String)rows1.get(9)+"\"") ;
                          rows.add("\""+(String)rows1.get(10)+"\"") ;
                          rows.add("\""+(String)rows1.get(5)+"\"") ;

                          rows.add("\""+(String)rows1.get(7)+"\"") ;
                          rows.add("\""+(String)rows1.get(6)+"\"") ;
                          rows.add("\""+(String)rows1.get(3)+"\"") ;

                          rows.add("\""+sReadOnlyMkr+"\"") ;

                          //System.out.println("BGT_SEQ_ADDED:"+(String)rows1.get(5));
                      }
                      detailList.add(rows) ;
               }

               System.out.println("zzzzz");

               System.out.println("l1.size()"+l1.size());
               System.out.println("l2.size()"+l2.size());

               l1 = null;
               l2 = null;
               rows = null;
               rows1 = null;
               rows2 = null;

               l1 = new ArrayList();
               l2 = new ArrayList();
               rows = new ArrayList();
               rows1 = new ArrayList();
               rows2 = new ArrayList();


/** FOR STRUC_ALL1 **/

               System.out.println("STRUC_ALL1 Qry");

               ps1 = mk.con.prepareStatement(" SELECT NVL(SL_NO_ROWVAL,' '), "+
                                        "        NVL(BGT_HD_ROWVAL,' '), "+
                                        "  REPLACE('<span style='||CHR(39)||'font-weight:lighter;background-color:#'|| "+
                                        "    (SELECT COLOR_HEX  "+
                                        "            FROM BGT_COLOR  "+
                                  	"     WHERE COLOR_CD=NVL(DESC1_B_COLOR,1))||'; color:#'|| "+
	                                "    (SELECT COLOR_HEX  "+
                                        "            FROM BGT_COLOR  "+
	                                "     WHERE COLOR_CD=NVL(DESC1_F_COLOR,1))||CHR(39)||'>'||NVL(DESC1,' ')||'</span>','\"',' ') Budg_Desc,"+
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
                                        "  NO_DEC_PLACES_STN, "+
                                        "  NO_DEC_PLACES_CTM "+
	                                "  FROM BGT_FORM2B_STRUC_ALL1 "+
                                        "  WHERE NVL(TRIM(BGT_TO_YR),'@@')= '@@' "+
                                        "  ORDER BY SL_NO_ROWORDER,BGT_HD_ROWORDER "); 


                rs1=ps1.executeQuery();

               System.out.println("STRUC_ALL1 Qry RS");
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
                  
                       rows.add(rs1.getString(12)) ;/** DEC PLACES AFTER IN CTM **/
                       rows.add(rs1.getString(13)) ;/** DEC PLACES AFTER IN STN **/ 

                       l1.add(rows);

                        //System.out.println("ADDING XXXX"+rs1.getString(6));

/**** New Code End ***/
                 
                       iLineNo = iLineNo + 1;

                 }

                 rs1.close();
                 ps1.close();

                 ps1=null;
                 rs1=null; 
               //System.out.println("STRUC_ALL1 Qry Count"+icnt);


                ps1=mk.con.prepareStatement("SELECT B.BGT_SEQ,B.SL_NO_ROWORDER,B.BGT_HD_ROWORDER, "
                                          + " TO_CHAR(NVL(A.AMT_BBGS_DISP,0),'99990.999') bbgs_tot,"
                                          + " TO_CHAR(NVL(A.AMT_TGS_DISP,0),'99990.999') tgs_tot,"
                                          + " TO_CHAR(NVL(A.AMT_SGS_DISP,0),'99990.999') sgs_tot,"
                                          + " TO_CHAR(NVL(A.AMT_NCGS_DISP,0),'99990.999') ncgs_tot,"
                                          + " TO_CHAR(NVL(A.AMT_CTM_DISP,0),'99990.999') ctm_tot,"
                                          + " TO_CHAR(NVL(A.AMT_EDGE_DISP,0),'99990.999') edg_tot,"
                                          + " TO_CHAR(NVL(A.AMT_PF_BBGS_TGS_SGS_DISP,0),'99990.999') pf_tot, "
                                          + " TO_CHAR(NVL(A.AMT_STN_BBGS_TGS_SGS_NCGS_DISP,0),'99990.999') gen_stn__tot,"
                                          + " TO_CHAR(NVL(A.AMT_DIV_ALL6_DISP,0),'99990.999') gen_div "
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
                      totrec1++ ;
                      rows1 = (List)l1.get(i) ;
                      rows2 = (List)l2.get(i) ;
     
                      //System.out.println("RowSXXXX BGT_SEQ IN TWO LISTS"+rows1.get(5)+","+rows2.get(0));
                      //System.out.println("rows1.size()"+rows1.size()+",rows2.size()"+rows2.size());

                      //System.out.println("Head:"+rows1.get(0));
                      ////System.out.println(" Grp:"+rows1.get(1));
                      //System.out.println("Desc:"+rows1.get(2));

                      if (rows1.get(5).equals(rows2.get(0))) {
                          sReadOnlyMkr="T";
                          rows = new ArrayList() ;
                          rows.add("\""+(String)rows1.get(0)+"\"") ;
                          rows.add("\""+(String)rows1.get(1)+"\"") ;
                          rows.add("\""+(String)rows1.get(2)+"\"") ;

                          for ( j=3; j<rows2.size(); j++ ) {
                              rows.add("\""+(String)rows2.get(j)+"\"") ;
                          }
                          rows.add("\"#"+(String)rows1.get(4)+"\"") ;
                          rows.add("\"#"+(String)rows1.get(8)+"\"") ;
                          rows.add("\"#"+(String)rows1.get(9)+"\"") ;
                          rows.add("\""+(String)rows1.get(10)+"\"") ;
                          rows.add("\""+(String)rows1.get(5)+"\"") ;

                          rows.add("\""+(String)rows1.get(7)+"\"") ;
                          rows.add("\""+(String)rows1.get(6)+"\"") ;
                          rows.add("\""+(String)rows1.get(3)+"\"") ;

                          rows.add("\""+sReadOnlyMkr+"\"") ;

                          rows.add("\""+(String)rows1.get(11)+"\"") ;
                          rows.add("\""+(String)rows1.get(12)+"\"") ;
                          //System.out.println("BGT_SEQ_ADDED:"+(String)rows1.get(5));
                      }
                      detailList1.add(rows) ;
               }


               l1 = null;
               l2 = null;
               rows = null;
               rows1 = null;
               rows2 = null;

               l1 = new ArrayList();
               l2 = new ArrayList();
               rows = new ArrayList();
               rows1 = new ArrayList();
               rows2 = new ArrayList();


/** FOR STRUC_ALL2 **/

               System.out.println("STRUC_ALL2 Qry");

               ps1 = mk.con.prepareStatement(" SELECT NVL(SL_NO_ROWVAL,' '), "+
                                             "        NVL(BGT_HD_ROWVAL,' '), "+
                                             "  REPLACE('<span style='||CHR(39)||'font-weight:lighter;background-color:#'|| "+
                                             "    (SELECT COLOR_HEX  "+
                                             "            FROM BGT_COLOR  "+
                        	             "     WHERE COLOR_CD=NVL(DESC1_B_COLOR,1))||'; color:#'|| "+
	                                     "    (SELECT COLOR_HEX  "+
                                             "            FROM BGT_COLOR  "+
	                                     "     WHERE COLOR_CD=NVL(DESC1_F_COLOR,1))||CHR(39)||'>'||NVL(DESC1,' ')||'</span>','\"',' ') Budg_Desc,"+
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
                                             "  NO_DEC_PLACES_STN, "+
                                             "  NO_DEC_PLACES_CTM "+
	                                     "  FROM BGT_FORM2B_STRUC_ALL2 "+
                                             "  WHERE NVL(TRIM(BGT_TO_YR),'@@')= '@@' "+
                                             "  ORDER BY SL_NO_ROWORDER,BGT_HD_ROWORDER "); 


                     rs1=ps1.executeQuery();

                         System.out.println("STRUC_ALL2 Qry RS");
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
                  
                            rows.add(rs1.getString(12)) ;/** DEC PLACES AFTER IN CTM **/
                            rows.add(rs1.getString(13)) ;/** DEC PLACES AFTER IN STN **/ 
                         //   rows.add(rs1.getString(12)) ;

                            l1.add(rows);

                             //System.out.println("ADDING XXXX"+rs1.getString(6));

/**** New Code End ***/
                 
                             iLineNo = iLineNo + 1;

                       }

                       rs1.close();
                       ps1.close();

                       ps1=null;
                       rs1=null; 
                       System.out.println("STRUC_ALL2 Qry Count"+icnt);


                       ps1=mk.con.prepareStatement("SELECT B.BGT_SEQ,B.SL_NO_ROWORDER,B.BGT_HD_ROWORDER, "
                                                 + " TO_CHAR(NVL(A.AMT_BBGS_DISP,0),'99990.999') bbgs_tot,"
                                                 + " TO_CHAR(NVL(A.AMT_TGS_DISP,0),'99990.999') tgs_tot,"
                                                 + " TO_CHAR(NVL(A.AMT_SGS_DISP,0),'99990.999') sgs_tot,"
                                                 + " TO_CHAR(NVL(A.AMT_NCGS_DISP,0),'99990.999') ncgs_tot,"
                                                 + " TO_CHAR(NVL(A.AMT_CTM_DISP,0),'99990.999') ctm_tot,"
                                                 + " TO_CHAR(NVL(A.AMT_EDGE_DISP,0),'99990.999') edg_tot,"
                                                 + " TO_CHAR(NVL(A.AMT_PF_BBGS_TGS_SGS_DISP,0),'99990.999') pf_tot, "
                                                 + " TO_CHAR(NVL(A.AMT_STN_BBGS_TGS_SGS_NCGS_DISP,0),'99990.999') gen_stn__tot,"
                                                 + " TO_CHAR(NVL(A.AMT_DIV_ALL6_DISP,0),'99990.999') gen_div "
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


                       for ( i=0; i<l1.size(); i++ ) {
                             totrec2++ ;
                             rows1 = (List)l1.get(i) ;
                             rows2 = (List)l2.get(i) ;

                             //System.out.println("RowSXXXX BGT_SEQ IN TWO LISTS"+rows1.get(5)+","+rows2.get(0));
                             //System.out.println("rows1.size()"+rows1.size()+",rows2.size()"+rows2.size());

                             //System.out.println("Head:"+rows1.get(0));
                             //System.out.println(" Grp:"+rows1.get(1));
                             //System.out.println("Desc:"+rows1.get(2));

                             if (rows1.get(5).equals(rows2.get(0))) {
                                 sReadOnlyMkr="T";
                                 rows = new ArrayList() ;
                                 rows.add("\""+(String)rows1.get(0)+"\"") ;
                                 rows.add("\""+(String)rows1.get(1)+"\"") ;
                                 rows.add("\""+(String)rows1.get(2)+"\"") ;

                                 for ( j=3; j<rows2.size(); j++ ) {
                                     rows.add("\""+(String)rows2.get(j)+"\"") ;
                                 }
                                 rows.add("\"#"+(String)rows1.get(4)+"\"") ;
                                 rows.add("\"#"+(String)rows1.get(8)+"\"") ;
                                 rows.add("\"#"+(String)rows1.get(9)+"\"") ;
                                 rows.add("\""+(String)rows1.get(10)+"\"") ;
                                 rows.add("\""+(String)rows1.get(5)+"\"") ;

                                 rows.add("\""+(String)rows1.get(7)+"\"") ;
                                 rows.add("\""+(String)rows1.get(6)+"\"") ;
                                 rows.add("\""+(String)rows1.get(3)+"\"") ;

                                 rows.add("\""+sReadOnlyMkr+"\"") ;

                                 rows.add("\""+(String)rows1.get(11)+"\"") ;
                                 rows.add("\""+(String)rows1.get(12)+"\"") ;
                                 //System.out.println("BGT_SEQ_ADDED:"+(String)rows1.get(5));
                             }
                             detailList2.add(rows) ;
                      }

                    sHtml_All_footer = "<table class=styleFootall>"+
	             "<tr>"+
		     "<td class=style40 colspan=19><strong><u>Note:</u></strong>&quot;Under cost of fuel&quot;-&quot;Fuel cost per Unit&quot;is calculated on the basis of &quot;Total cost of procurement per Te or pe KL&quot; multiplied by &quot;coal or oil quantity for consumption&quot; divided by &quot;Total units-Gen. Or SO&quot;</td>"+
	             "</tr>"+
	             "<tr>"+
		     "<td class=style40 colspan=19>&nbsp;</td>"+
	             "</tr>"+
	             "<tr>"+
		     "<td class=style40 colspan=1>&nbsp;</td>"+
		     "<td class=style40 colspan=18>**Expenditure from departments like IR,Medical,Admin,Construction,Payroll,Garage,Purchase etc. Figure supplied by Finance.</td>"+
	             "</tr>"+
                     "</table>";

        sHtml_All1 = "<table class=styleHeadall1 >"+
	             "<tr>"+
		     "<td class=style30 colspan=19><strong>ESTIMATED MATERIALS(FOR CONSUMPTION AND STOCK BUILD UP) TO BE ORDERED BY MATERIALS DIVISION</strong></td>"+
	             "</tr>"+
	             "<tr>"+
		     "<td class=style40 colspan=10 align=left>Generation Division Budget "+sBgt_Fr_Year+"-"+sBgt_To_Year+" (Rs Lakh)</td>"+
		     "<td class=style40 colspan=9 align=right>Coal Oil and O&M Budget</td>"+
	             "</tr>"+
                     "</table>";

        sHtml_All2 = "<table class=styleHeadall2 >"+
	             "<tr>"+
		     "<td class=style40 colspan=10 align=left><strong>GENERATION DIVISION BUDGET "+sBgt_Fr_Year+"-"+sBgt_To_Year+" (Rs Lakh)</strong></td>"+
		     "<td class=style40 colspan=9 align=right>Coal Oil and O&M Budget</td>"+
	             "</tr>"+
                     "</table>";

        sHtml_All1_footer = "<table class=styleFootall1>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>1. Materials consumption and stock build up is for "+sBgt_Fr_YY+"-"+sBgt_To_YY+" only Prev. year("+sBgt_Fr_YY_Prev+"-"+sBgt_To_YY_Prev+")pending materials order and the corresponding cash flow not considered.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>2. The Figures for "+sBgt_Fr_Year+"-"+sBgt_To_Year+" do not include any contigency expenses</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>3. The above Figures do not include any material cost of CAPEX.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>4. 6% escalation has been considered on material.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>5. It has been assumed that Insurance spares will be consumed from stock only.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>6. Procurement for new Bins opening for BBGS is in context of Unit 3</td>"+
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
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
	             "</tr>"+
                            "</table>";

        sHtml_All_footer = "<table class=styleFootall>"+
	             "<tr>"+
		     "<td class=style40 colspan=19><strong><u>Note:</u></strong>&quot;Under cost of fuel&quot;-&quot;Fuel cost per Unit&quot;is calculated on the basis of &quot;Total cost of procurement per Te or pe KL&quot; multiplied by &quot;coal or oil quantity for consumption&quot; divided by &quot;Total units-Gen. Or SO&quot;.</td>"+
	             "</tr>"+
	             "<tr>"+
		     "<td class=style40 colspan=19>&nbsp;</td>"+
	             "</tr>"+
	             "<tr>"+
		     "<td class=style40 colspan=1>&nbsp;</td>"+
		     "<td class=style40 colspan=18>**Expenditure from departments like IR,Medical,Admin,Construction,Payroll,Garage,Purchase etc. Figure supplied by Finance.</td>"+
	             "</tr>"+
                     "</table>";

        sHtml_All1 = "<table class=styleHeadall1 >"+
	             "<tr>"+
		     "<td class=style30 colspan=19><strong>ESTIMATED MATERIALS(FOR CONSUMPTION AND STOCK BUILD UP) TO BE ORDERED BY MATERIALS DIVISION</strong></td>"+
	             "</tr>"+
	             "<tr>"+
		     "<td class=style40 colspan=10 align=left>Generation Division Budget "+sBgt_Fr_Year+"-"+sBgt_To_Year+" (Rs Lakh)</td>"+
		     "<td class=style40 colspan=9 align=right>Coal Oil and O&M Budget</td>"+
	             "</tr>"+
                     "</table>";

        sHtml_All2 = "<table class=styleHeadall2 >"+
	             "<tr>"+
		     "<td class=style40 colspan=10 align=left><strong>GENERATION DIVISION BUDGET "+sBgt_Fr_Year+"-"+sBgt_To_Year+" (Rs Lakh)</strong></td>"+
		     "<td class=style40 colspan=9 align=right>Coal Oil and O&M Budget</td>"+
	             "</tr>"+
                     "</table>";

        sHtml_All1_footer = "<table class=styleFootall1>"+
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
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
	             "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>1. Materials consumption and stock build up is for "+sBgt_Fr_YY+"-"+sBgt_To_YY+" only Prev. year("+sBgt_Fr_YY_Prev+"-"+sBgt_To_YY_Prev+")pending materials order and the corresponding cash flow not considered.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>2. The Figures for "+sBgt_Fr_Year+"-"+sBgt_To_Year+" do not include any contigency expenses</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>3. The above Figures do not include any material cost of CAPEX.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>4. 6% escalation has been considered on material.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>5. It has been assumed that Insurance spares will be consumed from stock only.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>6. Procurement for new Bins opening for BBGS is in context of Unit 3</td>"+
                            "</tr>"+
                            "</table>";

        sHtml_All2_footer = "<table class=styleFootall2>"+
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
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
		     "<td class=style40 >&nbsp;</td>"+
	             "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>A. Maintenance expenditure includes wages for contractors employee.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>B. 6% escalation in Material price and 10% escalation on contracted Labour Cost has been considered.Contractor Labour Wage Revision of TGS and NCGS Considered in "+sBgt_Fr_Year+"-"+sBgt_To_Year+".</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>C. <strong>&#39Coal Handling charges&#39</strong> includes the following heads only : 1)Consolidated Charges(CPT/FCI) 2)Railway men Salary 3)Inplant Shunting Charges 4)Other Railwaymen's pool car and 5)Coal Sampling & Testing Charges. Other heads, being controlled by System Control dept.,not included in this budget.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>D. <strong>&#39Admin and General Expenses&#39</strong> includes the following heads only : 1)General Establishment Charges(Chummery) 2)Petty Cash Expenses 3)Computer Maintenance Charges 4)Transport related to out station visits for station needs.Other heads,being controlled/monitored by Finance Dept,not included in this budget.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>E. Under<strong>&#39Rent,Rate,Tax & other fees&#39</strong>,only the following heads have been included:1)Boiler Directorate Charges 2)Weights & Measure Fees 3)Fire Service Licence Fees 4)Factory Licence Fees 5)Air & water Consent 6)Effluent & stack Monitoring Charges.Other heads,being controlled/monitored by Finance dept,not included in this budget.</td>"+
                            "</tr>"+
                            "<tr>"+
                            "<td class=style40 colspan=19>F. <strong>Apportioned cost of other divisions </strong>not considered.</td>"+
                            "</tr>"+
                            "</table>";
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

        try{

        var sHtml_all1 = '<%= sHtml_All1 %>';
        var sHtml_all2 = '<%= sHtml_All2 %>';
        var sHtml_all_footer = '<%= sHtml_All_footer %>';
        var sHtml_all1_footer = '<%= sHtml_All1_footer %>';
        var sHtml_all2_footer = "<%= sHtml_All2_footer %>";


        var myColorforCells = ["#FFFF6F","#85D1FA","#AF64E1","#AF64E1","#EAB668"];
        var myData = <%= detailList %> ;
        var myData1 = <%= detailList1 %> ;
        var myData2 = <%= detailList2 %> ;
        var myHeaders = ["Sl No", "Budget Head", "Budget Head Description",  
                        "BBGS", "TGS", "SGS", "NCGS","CTM", "ED(G)", "PF Station", "Gen Stn", 
                        "Gen Div" ];

        var myHeaders1 = ["Sl No", "Budget Head", "Budget Head Description",  
                        "BBGS", "TGS", "SGS", "NCGS","CTM", "ED(G)", "PF Station", "Gen Stn", 
                        "Gen Div" ];

        var myHeaders2 = ["Sl No", "Budget Head", "Budget Head Description",  
                        "BBGS", "TGS", "SGS", "NCGS","CTM", "ED(G)", "PF Station", "Gen Stn", 
                        "Gen Div" ];


        var updatedCellsArray = new Array();
	var obj = new AW.Grid.Extended;
	var obj1 = new AW.Grid.Extended;
	var obj2 = new AW.Grid.Extended;

/*
        var label1 = new AW.UI.Label;
        label1.setControlText(sHtml_all1);
        label1.setPosition(1000, 500);
        label1.setSize(980, 300);

        document.write(label1);
*/

	obj.setId("myGrid");	// necessary for CSS rules
	obj1.setId("myGrid1");	// necessary for CSS rules
	obj2.setId("myGrid2");	// necessary for CSS rules

        obj.setHeaderCount(1);
        obj1.setHeaderCount(1);
        obj2.setHeaderCount(1);

        obj.setHeaderText(myHeaders, 0);
        obj1.setHeaderText(myHeaders1, 0);
        obj2.setHeaderText(myHeaders2, 0);

        obj.setRowCount(<%= totrec %>);
        obj1.setRowCount(<%= totrec1 %>);
        obj2.setRowCount(<%= totrec2 %>);
        obj.setColumnCount(12);
        obj1.setColumnCount(12);
        obj2.setColumnCount(12);

        obj.setCellText(myData);
        obj1.setCellText(myData1);
        obj2.setCellText(myData2);
        obj.setFixedLeft(3);
        obj1.setFixedLeft(3);
        obj2.setFixedLeft(3);
        
        for ( i=0; i<myData.length; i++ ) {
            bgcolor = myData[i][12];
            readOnlyMkr = myData[i][20];
            amtNAMkr = myData[i][18]; 
            subtMkr = myData[i][19]; 

            if ( readOnlyMkr== 'T' ) {
                for ( j=3; j<12; j++ ) {
                    obj.setCellEditable(false,j,i);  // setEditable(true, colindex, rowindex) 
                    if(myData[i][j].trim()=='0.000'){
                       obj.setCellText(" ",j,i);
                    }
        
                }
            }else{
                if(amtNAMkr == 'Y'||amtNAMkr == 'S'||amtNAMkr == 'F'){
                   for( j=3; j<16; j++ ) {
                       obj.setCellEditable(false,j,i);
                       if(myData[i][j].trim()=='0.000'){
                          obj.setCellText(" ",j,i);
                       }
                   }
                } else{
                    for( j=3; j<16; j++ ) {

                       obj.setCellEditable(true,j,i);
                       if(myData[i][j].trim()=='0.000'){
                          obj.setCellText(" ",j,i);
                       }
                    } 

                }

            }

        }

        for ( i=0; i<myData1.length; i++ ) {
/*
            bgcolor = myData1[i][12];
            readOnlyMkr = myData1[i][20];
            amtNAMkr = myData1[i][18];
            subtMkr = myData1[i][19];
*/

            readOnlyMkr=='T';
            
            for ( j=3; j<12; j++ ) {
                 obj1.setCellEditable(false,j,i);  // setEditable(true, colindex, rowindex)
                 if(myData1[i][j].trim()=='0.000'){
                    obj1.setCellText(" ",j,i);
                 }else{
                    var i_dec_plc_ctm = myData1[i][21];
                    var i_dec_plc_stn = myData1[i][22];

                    if(j==7){
                       obj1.setCellText(trunc_no(myData1[i][j],i_dec_plc_ctm),j,i);
                    }else{
                       obj1.setCellText(trunc_no(myData1[i][j],i_dec_plc_stn),j,i);
                    }
                 }

            }
           
        }
           

        for ( i=0; i<myData2.length; i++ ) {
/*
            bgcolor = myData2[i][12];
            readOnlyMkr = myData2[i][20];
            amtNAMkr = myData2[i][18];
            subtMkr = myData2[i][19];
*/

            readOnlyMkr=='T';
            
            for ( j=3; j<12; j++ ) {
                 obj2.setCellEditable(false,j,i);  // setEditable(true, colindex, rowindex)
                 if(myData2[i][j].trim()=='0.000'){
                     obj2.setCellText(" ",j,i);
                 }else{
                     var i_dec_plc_ctm = myData2[i][21];
                     var i_dec_plc_stn = myData2[i][22];

                     if(j==7){
                        obj2.setCellText(trunc_no(myData2[i][j],i_dec_plc_ctm),j,i);
                     }else{
                        obj2.setCellText(trunc_no(myData2[i][j],i_dec_plc_stn),j,i);
                     }
                 }

            }
           
        }

	// add custom row property calculated from the cell value in col-56
        obj.defineRowProperty("background", function(row){
	        var value = this.getCellValue(12, row);
	        return value ;
        });

        // add dynamic row style linked to the custom row background property
        obj.getRowTemplate().setStyle("background", function(){
	        return this.getRowProperty("background");
        });

	// add custom row property calculated from the cell value in col-56
        obj1.defineRowProperty("background", function(row){
	        var value = this.getCellValue(12, row);
	        return value ;
        });

        // add dynamic row style linked to the custom row background property
        obj1.getRowTemplate().setStyle("background", function(){
	        return this.getRowProperty("background");
        });

	// add custom row property calculated from the cell value in col-56
        obj2.defineRowProperty("background", function(row){
	        var value = this.getCellValue(12, row);
	        return value ;
        });

        // add dynamic row style linked to the custom row background property
        obj2.getRowTemplate().setStyle("background", function(){
	        return this.getRowProperty("background");
        });

        obj.defineCellProperty("color") ;
        obj.setCellColor(function(col, row) { 
            var cell_fnt_color ="black";
            var cell_bkg_color ="white";
            //alert("CELL FONT COLOR"+this.getCellValue(18,row));
            if(col>=3){ 
                 cell_fnt_color = this.getCellValue(18,row);
                 cell_bkg_color = this.getCellValue(17,row);
            }else{

                 cell_fnt_color = "black";
                 cell_bkg_color = this.getCellValue(16,row);

            }
            //obj.getCellTemplate(col,row).setStyle("color",cell_fnt_color);
            //obj.getCellTemplate(row).setStyle("background-color",cell_bkg_color);
            return cell_fnt_color;
            //return cell_bkg_color;
        }) ;

        obj.getCellTemplate().setStyle("color", function(){ 
                return this.getCellProperty("color")});

        obj.onCellTextChanged = function(text, column, row){
        }

        obj.onCellClicked = function(event, column, row){

             
        }

/*
        obj.onCellValidating = function(text, col, row){

        }
            

*/
            obj.onCellEditEnding = function(text, column, row){

                      //alert("onCellEditEnding"+row+","+column);
                      //obj.setCurrentSelection("row");

                      var next_row = 0;
                      var next_col = 0;

                      next_row = Number(row)+1;

                      while((next_row<=obj.getRowCount())&&(!obj.getCellEditable(column,next_row))){

                          next_row = next_row+1;

                      }

                      if((next_row>obj.getRowCount())){

                          next_row = Number(row);

                      }

                      //alert(next_row);
                      //alert(next_col);
                      obj.setCurrentRow(next_row);
                      obj.setSelectedRows([next_row]);
                      obj.setCurrentColumn(Number(column));
                      obj.setSelectedColumns([Number(column)]);
                      //alert("setting currentcolumn");

            }

    document.write(obj);
    document.write(sHtml_all_footer);

    document.write(sHtml_all1);
    document.write(obj1);
    document.write(sHtml_all1_footer);

    document.write(sHtml_all2);
    document.write(obj2);
    document.write(sHtml_all2_footer);

    }catch(e){

      alert("Exception "+e);
    }

</script>

<div id="d1" style="position:relative;left:500px;bottom:10px" >
</div>

<table style="width: 100%;position:absolute;top:1850px" class="style1">
	<tr>
		<td class="style3" colspan="20" width="100%">
                    <input type="button" name="B4" id="B4" value="CLOSE" onClick="goBack();"/>
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

     mk.con.close();
     mk = null;
     System.out.println("generation_budget_compiled.jsp closed");

  }
%>
</body>

</html>
