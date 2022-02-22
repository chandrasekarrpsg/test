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
	//#myGrid .aw-rows-selected {background: #316ac5;}
	//#myGrid .aw-rows-selected .aw-column-1 {background: #316ac5;}


/********************************************************************
	Columns
********************************************************************/

        #myGrid .aw-column-0 {width: 50px; text-align: center; border-right: 1px solid #000000}
        #myGrid .aw-column-1 {width: 60px; text-align: center; border-right: 1px solid #000000}
        #myGrid .aw-column-2 {width: 240px; text-align: left; border-right: 1px solid #000000}
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
        #myGrid .aw-column-16 {width: 60px; text-align: center; border-right: 1px solid #000000}

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
	#myGrid .aw-grid-row .aw-cells-selected {background: white}
	//#myGrid .aw-grid-row .aw-cells-selected {background: white; color: #000000; }

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
	#myGrid .aw-header-0 {background: #FFD6C1} 
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


</script>
</head>

<body >


<form name = "INSERT_UPDATE_RECS" target="I1" action="gen_insert_upd_new.jsp" method="POST"/>
 <input type="hidden" id= "ins_upd_mkr"   name = "ins_upd_mkr"   value="" />
 <input type="hidden" id= "insert_string" name = "insert_string" value="" />
 <input type="hidden" id= "update_string" name = "update_string" value="" />
 <input type="hidden" id= "bgt_yr"        name = "bgt_yr"        value="" />
 <input type="hidden" id= "bgt_fnl"       name = "bgt_fnl"       value="" />
 <input type="hidden" id= "sec_cd"        name = "sec_cd"        value="" />
 <input type="hidden" id= "bgt_ver"       name = "bgt_ver"       value="" />
 <input type="hidden" id= "bgt_lvl"       name = "bgt_lvl"       value="" />
 <input type="hidden" id= "pub_mkr"       name = "pub_mkr"       value="" />
 <input type="hidden" id= "username"      name = "ip_ecode"      value="" />
 <input type="hidden" id= "stn_cd"        name = "stn_cd"        value="" />
</form>

<form name = "SELF_SUBMIT" target="_self" action="generation_budget_de_new.jsp" method="GET"/>
 <input type="hidden"  name = "sec_cd"    value="" />
 <input type="hidden"  name = "stn_cd"    value="" />
 <input type="hidden"  name = "T1"        value="" />
 <input type="hidden"  name = "bgt_lvl"   value="" />
 <input type="hidden"  name = "username" value="" />
 <input type="hidden"  name = "stn_long_desc" value="" /> 
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

<form name = "COMPUTE_ALL" target="I4" action="" method="GET"/>
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
  String sBgt_Grp_Rowval        = new String("");
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

     System.out.println("generation_budget_de_new.jsp opened");

     sBgt_Fr_Year = request.getParameter("T1");
     sIp_ecode  = request.getRemoteAddr()+"_"+sUsername;

     if(sBgt_Fr_Year.equals("new_year_entry")){

     }else{

         sUsername    = request.getParameter("username");
         sStn_cd  = request.getParameter("stn_cd");
         sSec_cd  = request.getParameter("sec_cd");
         sEmpDesg = request.getParameter("emp_desg");

         if(sStn_cd.equals("E")){
  
             sGenStn = "ED(GENERATION)S ESTABLISHMENT";

         }else{

             sGenStn  = request.getParameter("stn_long_desc");

         }
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

         sBgt_lvl = "1";
         ps1=mk.con.prepareStatement(" SELECT DISTINCT(BGT_LEVEL)"+
	                             " FROM   BGT_FORM2B_DATA "+
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

         ps1=mk.con.prepareStatement(" SELECT count(*) "+
                                     " FROM   BGT_LEVEL "+
                                     " WHERE  STN_CD = ? "+
                                     " AND    SEC_CD = ? "+
                                     " AND    EMP_CODE = ? "+
                                     " AND    BGT_LEVEL = 1 ");
         ps1.setString(1,sStn_cd);
         ps1.setString(2,sSec_cd);
         ps1.setString(3,sUsername);

         rs1=ps1.executeQuery();

         while(rs1.next()){

               sAuth_Exist  = rs1.getString(1);

         }

         rs1.close();
         ps1.close();
         rs1 = null;
         ps1= null;

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

     System.out.println("2222");

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
  document.SELF_SUBMIT.stn_long_desc.value= "<%= sGenStn  %>";

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
		<td colspan="17" align="center" ><strong><span class="style7">SEC CODE : <%= sSecDesc %></span></strong></td>
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

         //  ps1.setString(1,sBgt_Fr_Year);

/*
           ps1 = mk.con.prepareStatement(" SELECT SL_NO_ROWVAL, "+
                                         "        NVL(BGT_HD_ROWVAL,' '), "+
                                         "        NVL(REPLACE(DESC1,'\"',' '),' '), "+
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
	                                 "  FROM BGT_FORM2B_STRUC "+
                                         "  WHERE NVL(TRIM(BGT_TO_YR),'@@')= '@@' "+
                                         "  ORDER BY SL_NO_ROWORDER,BGT_HD_ROWORDER "); 

*/
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

                   System.out.println("ADDING XXXX"+rs1.getString(6));

/**** New Code End ***/
                 
                       iLineNo = iLineNo + 1;

            }

            rs1.close();
            ps1.close();

            ps1=null;
            rs1=null; 
     System.out.println("yyyyyyy:"+icnt);


           ps1=mk.con.prepareStatement("SELECT B.BGT_SEQ,B.SL_NO_ROWORDER,B.BGT_HD_ROWORDER, "
                                     + " MAX(CASE WHEN A.mm_order = 1 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) apr, "
                                     + " MAX(CASE WHEN A.mm_order = 2 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) may, "
                                     + " MAX(CASE WHEN A.mm_order = 3 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) jun, "
                                     + " MAX(CASE WHEN A.mm_order = 4 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) jul, "
                                     + " MAX(CASE WHEN A.mm_order = 5 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) aug, "
                                     + " MAX(CASE WHEN A.mm_order = 6 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) sep, "
                                     + " MAX(CASE WHEN A.mm_order = 7 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) oct, "
                                     + " MAX(CASE WHEN A.mm_order = 8 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) nov, "
                                     + " MAX(CASE WHEN A.mm_order = 9 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) dec, "
                                     + " MAX(CASE WHEN A.mm_order = 10 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) jan, "
                                     + " MAX(CASE WHEN A.mm_order = 11 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) feb, "
                                     + " MAX(CASE WHEN A.mm_order = 12 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) mar, "
                                     + " MAX(CASE WHEN A.mm_order = 13 THEN DECODE(TO_CHAR(NVL(A.amt,0)),'0',' ',TO_CHAR(NVL(A.amt,0),'99990.999')) END) tot "
                                     + " FROM ( SELECT * "
                                     + "        FROM bgt_form2b_data "
	                             + "        WHERE bgt_yr = ? AND stn_cd = ? AND sec_cd = ? ) A, bgt_form2b_struc B "
                                     + " WHERE  A.bgt_seq(+) = B.bgt_seq "
                                     + " GROUP BY B.SL_NO_ROWORDER,B.BGT_HD_ROWORDER,B.bgt_seq "
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

                 /** AMT VALUES FROM APRIL TO MARCH AND THEN ANNUAL **/
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

                     System.out.println("BGT_SEQ_ADDED:"+(String)rows1.get(5));
                 }
                 detailList.add(rows) ;
          }

          System.out.println("zzzzz");

          System.out.println("l1.size()"+l1.size());
          System.out.println("l2.size()"+l2.size());

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

     System.out.println("generation_budget_de_new.jsp closed");
  
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
var myHeaders = ["Sl No", "Budget Head", "Budget Head Description",  
                 "Apr", "May", "Jun", "Jul","Aug", "Sep", "Oct", "Nov", 
                 "Dec", "Jan", "Feb", "Mar","Annual" ];

var updatedCellsArray = new Array();
	var obj = new AW.Grid.Extended;

	obj.setId("myGrid");	// necessary for CSS rules

        obj.setHeaderCount(1);

        obj.setHeaderText(myHeaders, 0);

        obj.setRowCount(<%= totrec %>);
        obj.setColumnCount(16);

        obj.setCellText(myData);
        obj.setFixedLeft(3);
        
        for ( i=0; i<myData.length; i++ ) {
            bgcolor = myData[i][16];
            readOnlyMkr = myData[i][24];
            amtNAMkr = myData[i][22]; 
            subtMkr = myData[i][23]; 

            if(i==0){

               //alert(readOnlyMkr+","+amtNAMkr+","+subtMkr);

            }

            if ( readOnlyMkr== 'T' ) {
                for ( j=3; j<16; j++ ) {
                    obj.setCellEditable(false,j,i);  // setEditable(true, colindex, rowindex) 
                    if(myData[i][j]=='null'){
                       obj.setCellText(" ",j,i);
                    }
        
                }
            }else{
                if(amtNAMkr == 'Y'||amtNAMkr == 'S'||amtNAMkr == 'F'){
                   for( j=3; j<16; j++ ) {
                       obj.setCellEditable(false,j,i);
                       if(myData[i][j]=='null'){
                          obj.setCellText(" ",j,i);
                       }
                   }
                } else{
                    for( j=3; j<16; j++ ) {

                       obj.setCellEditable(true,j,i);
                       if(myData[i][j]=='null'){
                          obj.setCellText(" ",j,i);
                       }
                    } 

                }

            }

        }

	// add custom row property calculated from the cell value in col-56
        obj.defineRowProperty("background", function(row){
	        var value = this.getCellValue(16, row);
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

        obj.onCellValidating = function(text, col, row){
        //    alert("Validating"+row+","+col)
            if ( !isPosInt(text) ) {
                alert("ERROR : Please enter numeric value only") ;
                return true;
            }

            if(!checkValue(text)){

                return true;

            }

         }

            obj.onCellValidated = function(text, col, row){
                
         //   alert("Validated"+row+","+col)
                      sum = 0;
                      var t = new Array();
                      for(i=3;i<15;i=i+1){
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
                      obj.setCellText(sum,15,row);
          
            //          obj.setCellEditable(true,col,row);

             
     /**********         Insert the Validated cells into array which will be used for updation,In addition also include cells which get affected because of summation ***************/

                      if(col>=3){
                         var alreadyExist = 0;
                         var col_sum = 15;

                         for(i=0;i<updatedCellsArray.length;i++){

                             if(updatedCellsArray[i][0] == row && updatedCellsArray[i][1] == col){

                                alreadyExist = 1;
                                break;

                             }else{

                                if(updatedCellsArray[i][0] == row && updatedCellsArray[i][1] == col_sum){

                                   //alreadyExist = 1;
                                   break;
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

                           }
       
                        }

            }
            

            obj.onCellEditEnding = function(text, column, row){

                      //alert("onCellEditEnding"+row+","+column);
                      //obj.setCurrentSelection("row");

                      var next_row = 0;
                      var next_col = 0;

                      next_row = Number(row)+1;

                      while(!obj.getCellEditable(column,next_row)){

                          next_row = next_row+1;

                      }

                      //alert(next_row);
                      //alert(next_col);
                      obj.setCurrentRow(next_row);
                      obj.setSelectedRows([0]);
                      //obj.setCurrentColumn(Number(next_col));
                      //obj.setSelectedColumns([0]);
                      //alert("setting currentcolumn");

            }

    document.write(obj);

function f1(){

    var rowDelim = "$$$";
    var colDelim = "|";
    var insUpd_string = "";

    var insUpdMkr = document.INSERT_UPDATE_RECS.ins_upd_mkr.value;

    if(insUpdMkr == "I"){
       for ( i=0; i<myData.length; i++ ) {

             for ( j=3; j<16; j++ ) {

                   insUpd_string = insUpd_string + obj.getCellText(j, i) + colDelim;              

             }

             insUpd_string = insUpd_string + obj.getCellText(20, i)+ colDelim + rowDelim;
       }

       //alert(insUpdMkr+"-"+insUpd_string);
       document.INSERT_UPDATE_RECS.insert_string.value = insUpd_string;

    }else{

//       alert(updatedCellsArray.length);
       for( i = 0;i<updatedCellsArray.length; i++){

            //alert("Updated Row"+updatedCellsArray[i][0]);
            //alert("Updated Col"+updatedCellsArray[i][1]);
            insUpd_string = insUpd_string + obj.getCellText(updatedCellsArray[i][1],updatedCellsArray[i][0]) + colDelim + updatedCellsArray[i][1] + colDelim + updatedCellsArray[i][0] + colDelim + obj.getCellText(20,updatedCellsArray[i][0]) + colDelim;  

            insUpd_string = insUpd_string + rowDelim;


       }

       //alert(insUpdMkr+"-"+insUpd_string);
       document.INSERT_UPDATE_RECS.insert_string.value = insUpd_string;

    }

    //alert("KK"+insUpd_string+"LL");
    if(insUpd_string.length!=0){

       document.getElementById("B1").disabled=true;
       document.getElementById("B2").disabled=true;
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
      
      alert("Decimal Point Can Occur AtMost Once!!");
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
      
         alert("Please Enter Not More Than 5 Digits Before Decimal Part!!");
         return false;
      
      }else{
      
         if(valAftDec.length>3){
      
            alert("Please Enter Not More Than 3 Digits After Decimal Part!!");
            return false;

         }
      
      }

   }else{

      if(valBefDec.length>6){

         alert("Please Enter Not More Than 5 Digits Before Decimal Part!!");
         return false;

      }else{

         if(valAftDec.length>3){

            alert("Please Enter Not More Than 3 Digits After Decimal Part!!");
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

</script>

<div id="d1" style="position:relative;left:500px;bottom:10px" >
</div>
<table style="width: 100%" class="style1">
	<tr>
		<td class="style3" colspan="20" width="100%">
                    <input type="button" name="B1" id="B1" value="SAVE" onClick="f1()"/>
                    <input type="button" name="B2" id="B2" value="PUBLISH" onClick="publishBudget()"/> 
<!--
                    <input type="button" name="B3" id="B3" value="SEND TO SUPERIOR" onClick="sendToSuperior()"/>
-->
                    <input type="button" name="B4" id="B4" value="CLOSE" onClick="back_prev();"/>
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
