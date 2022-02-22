<%@ page language="java" %>
<%@ page import="java.io.*,javax.servlet.jsp.*,javax.ejb.EJB,javax.naming.*,java.util.*,java.lang.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="oracle.sql.*" %>
<%@ page import="oracle.jdbc.*" %>
<%@ page import="genOrblJavaPackage.*" %>
<%@page import="Order.OrderProcessBeanRemote"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%!    OrderProcessBeanRemote hRemote = null;
    //htmaNewRemote hRemote1 = null ;
    InitialContext ic = null;

    public void jspInit() {
        try {
            ic = new InitialContext();
            hRemote = (OrderProcessBeanRemote) ic.lookup("Order.OrderProcessBeanRemote");
            //hRemote = (OrderProcessBeanRemote) ic.lookup("ejb/OrderProcessBean");
            //hRemote1 = (htmaNewRemote)ic.lookup(htmaNewRemote.class.getName());
        } catch (Exception e) {
            System.out.println("order_entry.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>
<html>

<head>
<title>Budget</title>
<script type="text/javascript" src="gen_check.js"></script>
<!-- <link rel="stylesheet" href="locked-column.css" type="text/css"/>  -->
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
	background-color: #FFFFFF;
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
	background-color: #FFFFFF;
   }
   .style23 {
        border: 1px solid #000000;
	font-family: Calibri;
	font-size: x-small;
	background-color: #FFFFFF;
   }

   .text_box1 {

    background-color:transparent;
    font-family:Calibri;
    font-size:xx-small;
    text-align:right;
    border:0px;
   
   }

  
   table.scrollTable {
      margin: 0px 0px 0px 0px;
      width: 895px;
   }

   table.bottomTable {
      margin: 0px 0px 0px 0px;
      width: 895px;
      left: 15px;
      position: relative;
   }

   div.scrollTableContainer {
        clear: both;
        border: 1px solid #000000;
        height: 485px;
        overflow: auto;
        width: 967px;
        left: 15px;
        position: relative;
   }

   div.scrollTableContainer table {
        float: left;
        width: 945px;
   }

   thead.scrollFixedHeader th {
        top: expression(document.getElementById("scrollTableContainer").scrollTop);
        position: relative;
   } 

   td.horizontal_lock{

        left: expression(parentNode.parentNode.parentNode.parentNode.scrollLeft);
        position: relative;

   }

</style>

<script type="text/javascript">

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

<body onload="preScript();">

<jsp:useBean id="loginBean" type="VO.LoginBean" scope="session" />

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
  String sSl_No_roworder          = new String("");
  String sCellFntColor            = new String("");
  String sDescFntColor            = new String("");
  String sCellBgColor             = new String("");

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
  int iGrp_sub_sl_no = 0; 
  int iLineNo = 0; 
  //int iGrp_index = 0; 
  int iGrp_index = 1; 
  int i_g_y_cell_index = 0; 
  int iRowExists = 0; 
  int iUsername = 0; 

  try{

     mk = new MakeConnectionGENORBL();
     mk.con.setAutoCommit(false);

     System.out.println("generation_budget_de.jsp opened");

     sBgt_Fr_Year = request.getParameter("T1");
     sIp_ecode  = request.getRemoteAddr()+"_"+sUsername;

     if(sBgt_Fr_Year.equals("new_year_entry")){

         sUsername    = loginBean.getsEmpCd();
      //   sUsername = "000027";
         
         ps1=mk.con.prepareStatement(" SELECT TO_NUMBER(MAX(BGT_YR)+1) "+
                                     " FROM   BGT_FORM2B_DATA "+
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
           sSec_cd  = request.getParameter("sec_cd");

           if(sStn_cd.equals("E")){

              sGenStn = "ED(GENERATION)\'S ESTABLISHMENT";

           }else{

              sGenStn  = request.getParameter("stn_long_desc");

           }
           sSecDesc  = request.getParameter("sec_cd");
           sEmpDesg = request.getParameter("emp_desg");
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
     }


     System.out.println(sStn_cd+","+sSec_cd+","+sEmpDesg+","+sBgt_lvl+","+sUsername);
     if(iUsername!=0){

    //    if(sBgt_lvl.equals("1")){
          if(!(sBgt_lvl.equals("1"))){

             sReadOnlyMkr = "T";

             sDisableB1Mkr = "T";
             sDisableB2Mkr = "T";
             sDisableB3Mkr = "T";
             

          }

/*
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
*/

           ps1=mk.con.prepareStatement(" SELECT DISTINCT NVL(BGT_FNL,'N') BGT_FNL"+
                                       " FROM BGT_FORM2B_DATA "+
                                       " WHERE STN_CD = ? "+
                                       " AND   SEC_CD = ? "+
                                       " AND   BGT_YR = ? ");
           ps1.setString(1,sStn_cd);
           ps1.setString(2,sSec_cd);
           ps1.setString(3,sBgt_Fr_Year);

           rs1=ps1.executeQuery();

           sBgt_fnl = "N";

           while(rs1.next()){

                 sBgt_fnl = rs1.getString(1);

           }

           rs1.close();
           ps1.close();
           rs1 = null;
           ps1 = null;

           sPub_mkr = "N";
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

           System.out.println("sBgt_fnl:"+sBgt_fnl+",sPub_mkr:"+sPub_mkr);
           if(sBgt_fnl.equals("F")){

              sReadOnlyMkr = "T";
              sDisableB1Mkr = "T";
              sDisableB2Mkr = "T";
              sDisableB3Mkr = "T";

           }else{

                 System.out.println("sPub_mkr"+sPub_mkr);
              if(sPub_mkr.equals("Y")){

                 if(sBgt_lvl.equals("1")){

                   sReadOnlyMkr = "F";
                   sDisableB1Mkr = "F";
                   sDisableB2Mkr = "F";

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
                 System.out.println("KKKKK");
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

                   sReadOnlyMkr = "F";
                   sDisableB1Mkr = "F";
                   sDisableB2Mkr = "F";

                 }else{

                   sReadOnlyMkr = "T";
                   sDisableB1Mkr = "T";
                   sDisableB2Mkr = "T";

                 }

              }


           }
%>

<script>

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
  

/*
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
  document.INSERT_UPDATE_RECS.ip_ecode.value = '<%= sUsername %>';
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

  document.COMPUTE_ALL.sec_cd.value= '<%= sSec_cd %>';
  document.COMPUTE_ALL.stn_cd.value= '<%= sStn_cd %>';
  document.COMPUTE_ALL.bgt_yr.value= '<%= sBgt_Fr_Year %>';
  document.COMPUTE_ALL.bgt_lvl.value= '<%= sBgt_lvl %>';
  document.COMPUTE_ALL.username.value= '<%= sUsername  %>';

</script>
<div style="" id="scrollTableContainer" class="scrollTableContainer">
<table  id="scrollTable" class="style1">
<thead class="scrollFixedHeader">
	<tr>
		<th class="style3" colspan="2"><strong>&nbsp;</strong></th>
		<th class="style3" colspan="17"><strong>Cash Flow Statement : <%= sBgt_Fr_Year %> - <%= sBgt_To_Year %></strong></th>
	</tr>
	<tr>
		<th class="style4" colspan="2"><strong><span class="style5"><%= sDate %></strong></th>
		<th class="style4" colspan="17"><strong><span class="style5"><%= sGenStn %></span> </strong></th>
	</tr>
	<tr>
		<th colspan="2" class="style6"><strong><span class="style7">Form 2B</span></strong></th>
		<th colspan="17" class="style22"><strong><span class="style5">SEC CODE : <%= sSecDesc %></span></strong></th>
	</tr>
</thead>
</table>

<table style="width: 100%" cellspacing="0" cellpadding="0" class="style9" align="center">
<thead class="scrollFixedHeader">
	<tr>
		<th style="width: 4%" class="style10"><strong>Sl No</strong></th>
		<th style="width: 4%" class="style10"><strong>Budget Head</strong></th>
		<th class="style11" colspan="10">
			<strong>BUDGET HEAD DESCRIPTION</strong>
		</th>
		<th style="width: 4%" class="style10"><strong>Apr-<br /><%= sBgt_Fr_YY %></strong></th>
		<th style="width: 4%" class="style10"><strong>May-<br /><%= sBgt_Fr_YY %></strong></th>
		<th style="width: 4%" class="style10"><strong>Jun-<br /><%= sBgt_Fr_YY %></strong></th>
		<th style="width: 4%" class="style10"><strong>Jul-<br /><%= sBgt_Fr_YY %></strong></th>
		<th style="width: 4%" class="style10"><strong>Aug-<br /><%= sBgt_Fr_YY %></strong></th>
		<th style="width: 4%" class="style10"><strong>Sep-<br /><%= sBgt_Fr_YY %></strong></th>
		<th style="width: 4%" class="style10"><strong>Oct-<br /><%= sBgt_Fr_YY %></strong></th>
		<th style="width: 4%" class="style10"><strong>Nov-<br /><%= sBgt_Fr_YY %></strong></th>
		<th style="width: 4%" class="style10"><strong>Dec-<br /><%= sBgt_Fr_YY %></strong></th>
		<th style="width: 4%" class="style10"><strong>Jan-<br /><%= sBgt_To_YY %></strong></th>
		<th style="width: 4%" class="style10"><strong>Feb-<br /><%= sBgt_To_YY %></strong></th>
		<th style="width: 4%" class="style10"><strong>Mar-<br /><%= sBgt_To_YY %></strong></th>
		<th style="width: 4%" class="style10"><strong>Annual<br />
		                                              <%= sBgt_Fr_YY %>-<%= sBgt_To_YY %></strong>
                </th>
	</tr>
	<tr>
		<th class="style23" colspan="25"><span style="color:#620425"> 
			*(All Amount Values are in Rs. Lakhs) 
                </span>
		</th>
	</tr>
</thead>
<tbody>
<!--
	<tr>
		<td colspan="25" style="width: 120%" class="style2"><strong>&nbsp;</strong></td>
	</tr>
-->
<!--
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

                    rs1=ps1.executeQuery();

                    while(rs1.next()){

                          sSendToSuperiorDt = rs1.getString(1);

                    }

                    rs1.close();
                    ps1.close();
                    rs1 = null;
                    ps1 = null;

                    if(sSendToSuperiorDt.equals("N")){

                       if(sBgt_lvl.equals("1")){
                          sDisableB3Mkr = "F";
                       }

                    }else{

                       sDisableB3Mkr = "T";

                    }

                 }
      
              }

           }

/*
           ps1=mk.con.prepareStatement(" SELECT NVL(sl_no_rowval,'3.5') SL_NO_ROWVAL,"+
                                       "        COUNT(*) ROW_SPAN "+
                                       " FROM BGT_FORM2B_STRUC "+
                                       " WHERE BGT_FR_YR = ? "+
                                       " GROUP BY SL_NO_ROWVAL "+
                                       " ORDER BY SL_NO_ROWVAL ");
           ps1.setString(1,sBgt_Fr_Year);

*/
           ps1=mk.con.prepareStatement(" SELECT SL_NO_ROWORDER,"+
                                       "        COUNT(*) ROW_SPAN "+
                                       " FROM BGT_FORM2B_STRUC "+
                                       " WHERE NVL(TRIM(BGT_TO_YR),'@@') = '@@'  "+
                                       " GROUP BY SL_NO_ROWORDER "+
                                       " ORDER BY SL_NO_ROWORDER ");
          // ps1.setString(1,sBgt_Fr_Year);
           rs1=ps1.executeQuery();

           while(rs1.next()){

                 //iGrp_index = iGrp_index + 1;

                 sSl_No_roworder = rs1.getString(1); 
                 sSl_No_row_span = Integer.toString(rs1.getInt(2)); 

                 System.out.println("sSl_No_roworder"+sSl_No_roworder);

                 sBgt_Hd_Rowval = "";
                 sBgt_Desc      = "";
                 sSubt_Mkr      = "";
                 sTr_Bg_Color   = "";
                 sBgt_seq       = "";
                 sAmt_NA_mkr    = "";

                 iGrp_sl_no = 0;
                 iGrp_sub_sl_no = 0;
                 sStrt_Bgt_seq_for_grp    = "";
                 sEnd_Bgt_seq_for_grp = "";

%>

<script>

     var grp_seq_array = [];
    // g_grp_seq_array1[<%= iGrp_index %> - 1] = new Array(4);

</script>
<%
           
                 ps2 = mk.con.prepareStatement(" SELECT DECODE(TO_CHAR(NVL(SL_NO_ROWVAL,0)),'0',' ',TO_CHAR(SL_NO_ROWVAL)) SL_NO_ROWVAL, "+
                                               "  NVL(BGT_HD_ROWVAL,' '), "+
                                               " ' <span style='||CHR(34)||'font-weight:lighter;background-color:#'|| "+
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
				               "     WHERE COLOR_CD=NVL(DESC3_F_COLOR,1))||CHR(34)||'>'||NVL(DESC3,' ')||'</span>' Budg_Desc,"+
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
                                               "  WHERE NVL(TRIM(BGT_TO_YR),'@@') = '@@'  "+
                                               "  AND SL_NO_ROWORDER= ?  "+
                                               "  ORDER BY BGT_HD_ROWORDER "); 
                                          

               //  ps2.setString(1,sBgt_Fr_Year);
                 ps2.setString(1,sSl_No_roworder);

                 rs2=ps2.executeQuery();

                 while(rs2.next()){
                 
                       iLineNo = iLineNo + 1;

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
                       sCellBgColor   = rs2.getString(9);
                       sCellFntColor  = rs2.getString(10);
                       sDescFntColor  = rs2.getString(11);

                       if(iGrp_sub_sl_no == 1){

                          sStrt_Bgt_seq_for_grp    = sBgt_seq;

%>

<script>
         g_grp_seq_array1[<%= iGrp_index %> - 1] = new Array(4);

         g_grp_seq_array1[<%= iGrp_index %> - 1][0] = '<%= iLineNo-1 %>';
         g_grp_seq_array1[<%= iGrp_index %> - 1][1] = '<%= iLineNo-1 %>';
</script>

<%
                       }


                       //if(sAmt_NA_mkr.equals("NE")&&sPub_mkr.equals("N")){

                       if(sBgt_lvl.equals("1")){
                          if(sAmt_NA_mkr.equals("NE")){

                             sReadOnlyMkr = "F";

                          }else{

                             sReadOnlyMkr = "T";

                          }

                       }
          
                       if(sSubt_Mkr.equals("T1")){

%>

<tr style="background-color:<%= sTr_Bg_Color %>">
                <td colspan= "12" style="width: 48%" class="style2" align="<%= sJustMkr %>"><%= sBgt_Desc %>-<%= sBgt_seq %></td>

<%
                       }else{

%>

<tr style="background-color:<%= sTr_Bg_Color %>">
                <td style="width: 4%" class="style2" align="center">&nbsp;<%= sSl_No_row_val %></td>
                <td style="width: 4%;color:#<%= sDescFntColor %>;" class="style2" align="center">&nbsp;<%= sBgt_Hd_Rowval %></td>
                <td colspan= "10" style="width: 40%" class="style2" align="<%= sJustMkr %>"><%= sBgt_Desc %></td>

<%

                      }

%>

		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_01" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','04','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','00','<%= sBgt_seq %>','<%= sAmt_NA_mkr %>');}" /></td>
		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input  type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_02" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','05','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','01','<%= sBgt_seq %>','<%= sAmt_NA_mkr %>');}" /> </td>
		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input  type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_03" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','06','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','02','<%= sBgt_seq %>','<%= sAmt_NA_mkr %>');}" /> </td>
		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input  type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_04" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','07','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','03','<%= sBgt_seq %>','<%= sAmt_NA_mkr %>');}" /> </td>
		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input  type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_05" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','08','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','04','<%= sBgt_seq %>','<%= sAmt_NA_mkr %>');}" /> </td>
		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input  type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_06" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','09','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','05','<%= sBgt_seq %>','<%= sAmt_NA_mkr %>');}" /> </td>
		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input  type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_07" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','10','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','06','<%= sBgt_seq %>','<%= sAmt_NA_mkr %>');}" /> </td>
		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input  type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_08" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','11','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','07','<%= sBgt_seq %>','<%= sAmt_NA_mkr %>');}" /> </td>
		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input  type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_09" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','12','<%= sBgt_Fr_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','08','<%= sBgt_seq %>','<%= sAmt_NA_mkr %>');}" /> </td>
		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input  type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_10" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','01','<%= sBgt_To_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','09','<%= sBgt_seq %>','<%= sAmt_NA_mkr %>');}" /> </td>
		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input  type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_11" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','02','<%= sBgt_To_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','10','<%= sBgt_seq %>','<%= sAmt_NA_mkr %>');}" /> </td>
		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input  type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_12" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>','03','<%= sBgt_To_YY %>')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','11','<%= sBgt_seq %>','<%= sAmt_NA_mkr %>');}" /> </td>
		<td style="width: 4%" class="style2" style="background-color:#<%= sCellBgColor %>">&nbsp;<input  type= "text" class="text_box1" style="color:#<%= sCellFntColor %>;" size="7" maxlength="14" value="" id = "T_<%= sBgt_seq %>_13" onClick="addBgtSeqforUpd(this.id,'<%= sBgt_seq %>',' ',' ')" onkeyup="if(window.event.keyCode==13||this.length==10){checkCell('<%= iLineNo-1 %>','12','<%= sBgt_seq %>');}" /> </td>
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
<%
                       if(sAmt_NA_mkr.equals("NE")){
      
                          sEnd_Bgt_seq_for_grp    = sBgt_seq;
%>
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
<%

                      }

                      if(sAmt_NA_mkr.equals("Y")){

                         i_g_y_cell_index = i_g_y_cell_index + 1;
%>

<script>

      g_y_cell_id_array[<%= i_g_y_cell_index -1 %>] = new Array(g_mnths_tot_col.length+1);

      for(var k = 0; k < g_mnths_tot_col.length ; k++){

         g_y_cell_id_array[<%= i_g_y_cell_index -1 %>][k] = 'T_<%= sBgt_seq %>_'+g_mnths_tot_col[k];
 
         document.getElementById('T_<%= sBgt_seq %>_'+g_mnths_tot_col[k]).value = '0.00';
         document.getElementById('T_<%= sBgt_seq %>_'+g_mnths_tot_col[k]).readOnly = true;
         
      }

      g_y_cell_id_array[<%= i_g_y_cell_index -1 %>][g_mnths_tot_col.length] = '<%= iGrp_index-1 %>'; 

      g_grp_seq_array1[<%= iGrp_index %> - 1][2] = '<%= iLineNo-1 %>';
      g_grp_seq_array1[<%= iGrp_index %> - 1][3] = '<%= sBgt_seq %>';

</script>


<%

                          }else{
                          //if(sSl_No_row_val.equals("3.5")){
                          if(sSubt_Mkr.equals("T1")){

%>

<script>

      g_grp_seq_array1[<%= iGrp_index %> - 1][2] = '<%= iLineNo-1 %>';
      g_grp_seq_array1[<%= iGrp_index %> - 1][3] = '<%= sBgt_seq %>';

</script>
<%

                          }

                      }

                      if(sAmt_NA_mkr.equals("S")){

                         iGrp_sub_sl_no = 0;
%>

<script>
                   g_grp_seq_array1[<%= iGrp_index %> - 1][2] = <%= iLineNo %> - 1;
                   g_grp_seq_array1[<%= iGrp_index %> - 1][3] = '<%= sBgt_seq %>' ;

/*
                   if('<%= sBgt_seq %>'=='60'){
                     alert('<%= sAmt_NA_mkr %>'+'<%= iGrp_index  %>'-1 );

                     alert(g_grp_seq_array1[<%= iGrp_index %> - 1][0]);
                     alert(g_grp_seq_array1[<%= iGrp_index %> - 1][1]);
                     alert(g_grp_seq_array1[<%= iGrp_index %> - 1][2]);
                     alert(g_grp_seq_array1[<%= iGrp_index %> - 1][3]);

                   }

*/
                   //summationOfCellVal('<%= sBgt_seq %>',grp_seq_array);

</script>

<%
                        iGrp_index = iGrp_index+1; 
                      }

                  }

%>
<script>

                   if('<%= sBgt_seq %>'=='50'){

/*
                     alert("JJJJJJJ");
                     alert('<%= sAmt_NA_mkr %>');
                     alert('<%= iGrp_index-1 %>'-1);
                     alert(g_grp_seq_array1[0].length);
                     alert(g_grp_seq_array1[<%= iGrp_index-1 %> - 1][0]);
                     alert(g_grp_seq_array1[<%= iGrp_index-1 %> - 1][1]);
                     alert(g_grp_seq_array1[<%= iGrp_index-1 %> - 1][2]);
                     alert(g_grp_seq_array1[<%= iGrp_index-1 %> - 1][3]);

*/
                   }


</script>
<%


                 rs2.close();
                 ps2.close();

                 rs2 = null;
                 ps2 = null;
      
           } 
           rs1.close();
           ps1.close();

           ps1=null;
           rs1=null; 

           ps1=mk.con.prepareStatement(" SELECT "+ 
                                       "      BGT_SEQ,"+
	                               "      BGT_VER,"+
	                               "      LPAD(MM_ORDER,2,'0') MM_ORDER,"+
                                       "      TRIM(TO_CHAR(ROUND(NVL(AMT,0),3),'9999990.999')) AMT"+
                                       " FROM BGT_FORM2B_DATA"+
                                       " WHERE BGT_YR= ? "+
                                       " AND STN_CD= ? "+
                                       " AND SEC_CD = ? "+ 
                                       " ORDER BY BGT_SEQ,"+
                                       " YY_VAL,"+
	                  	       " MM_VAL "); 
           ps1.setString(1,sBgt_Fr_Year);
           ps1.setString(2,sStn_cd);
           ps1.setString(3,sSec_cd);

           rs1=ps1.executeQuery();

           while(rs1.next()){

                 sCell_Id_for_exstngVal = "";
                 sCell_Id_for_exstngVal   = "T_"+rs1.getString(1)+"_"+rs1.getString(3) ;

%>
<script>

           //alert("Id"+'<%= sCell_Id_for_exstngVal %>');
           popl_exstngVal_inCells('<%= sCell_Id_for_exstngVal %>','<%= rs1.getString(4) %>');

</script>
<%           

           }

           rs1.close();
           ps1.close();
     
           ps1=null;
           rs1=null;

%>
<script>

   //putZeroInYFields();
   putNullInYFields();

</script>

   </tbody>
   </table>
</div>
<div id="d1" style="position:relative;left:500px;bottom:10px" >
</div>
<table style="width: 100%" class="style1">
	<tr>
		<td class="style3" colspan="20" width="100%">
                    <input type="button" name="B1" id="B1" value="SAVE" onClick="chkBefSubmit('<%= sInsUpdMkr %>')"/>
                    <input type="button" name="B2" id="B2" value="PUBLISH" onClick="publishBudget('U')"/> 
<!--
                    <input type="button" name="B3" id="B3" value="SEND TO SUPERIOR" onClick="sendToSuperior()"/>
-->
                    <input type="button" name="B4" id="B4" value="CLOSE" onClick="window.open('close.html','_top')"/>
               </td>
	</tr>
</table>
<table style="width: 100%" class="style1">
	<tr>
		<td align="center" width="100%"> &nbsp; 
               </td>
        </tr>
        <tr>
		<td align="center" width="100%"> <span style="color:#620425" size="4">
                                                 ** Please press Enter after editing the cells **
                </span>
               </td>
	</tr>
</table>
<script>

   //enableDisableButtons('<%= sDisableB1Mkr %>','<%= sDisableB2Mkr %>','<%= sDisableB3Mkr %>')
   enableDisableButtons('<%= sDisableB1Mkr %>','<%= sDisableB2Mkr %>','<%= sDisableB3Mkr %>')

</script>
<%

   //     }else{

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
		<td class="style3" colspan="20" width="100%"><input type="button" name="CLOSE" value="CLOSE" onClick="window.open('close.html','_top');"</td>
	</tr>
</table>
-->
<%

        //}
     }else{

%>
<table id = "bottomTable" class="style1">
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
		<td class="style3" colspan="20" width="100%"><input type="button" name="CLOSE" value="CLOSE" onClick="window.parent.open('close.html','_top');"</td>
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
     if(mk!=null){
        mk.con.close();
     }

     System.out.println("generation_budget_de.jsp closed");
  
}
%>

</body>

</html>