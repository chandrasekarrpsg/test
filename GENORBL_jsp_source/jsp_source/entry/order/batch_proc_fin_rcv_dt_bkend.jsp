
<%@ page import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,java.text.*"%>
<%@ page import="java.util.*,java.io.*,java.lang.*" %>
<%@ page import="genOrblJavaPackage.*" %>




<html>
 <head>
 <title>ORDER LETTER</title>
 <script type="text/javascript" src ="printSpl.js"></script>
<style type="text/css"> 
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
.style8{
                background-color:#F5F5DC;
                font-family:Verdana;
                font-size:13px;
 
}
.style9{
                background-color:#DCDCDC;
                font-family:Verdana;
                font-size:13px;
 
}
</style>

<script type="text/javascript">

function showLotEntry(refId){
parent.showLotEntry_P(refId);
}


</script>

 </head>
<jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>
<body>
<%

  String sEmpCd          = loginBean.getsEmpCd();
  String sOrdByNm        = loginBean.getsEmpFNm() + " " + loginBean.getsEmpLNm();
  String sLoginStn       = loginBean.getsGenStn();
  String sLoginStnNm     = loginBean.getsGenStnNm();
  String sLoginStnShrtNm = loginBean.getsLoginStnShrtNm();
  String sLoginDept      = loginBean.getsDept();

  String frm_dt = request.getParameter("frm_dt");
  String to_dt  = request.getParameter("to_dt");
  String stncd  = request.getParameter("stncd");

 System.out.println(" INSIDE  " + stncd  );
 System.out.println(" INSIDE  " + frm_dt  );
 System.out.println(" INSIDE  " + to_dt  );

  if (sLoginStn.equals("042")) {

   if (stncd.equals("ALL")) {
      sLoginStn = new String("select distinct ORBL_STATION_CD from CD_STATION");
   }  
   else {
      sLoginStn = new String(stncd) ;
   }
  }

  System.out.println("SAIKAT      START_DATE "+frm_dt);
  System.out.println("SAIKAT      END_DATE "+to_dt +" " + sLoginStn);

   if (!frm_dt.equals("0") & !frm_dt.equals("")) {



    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    PreparedStatement ps     = null;
    ResultSet         rs     = null;
    mk.con.setAutoCommit(false);


    String bill_ref_id              = new String("");
    String finrcd_dt                = new String("");
    String letter2finance_dt        = new String("");
    String letter2finance_ref       = new String("");
    String station_cd               = new String("");
    String bill_cnt                 = new String("");
    String bill_amt                 = new String("");
    String tot_bill_cnt             = new String("");
    String tot_bill_amt             = new String("");
    String tot_bill_cnt_fin_rcv     = new String("");
    String tot_bill_amt_fin_rcv     = new String("");
    String tot_bill_cnt_fin_not_rcv = new String("");
    String tot_bill_amt_fin_not_rcv = new String("");


    try{
%>
      <div align="center" id="printReady">
      <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#111111">
      <tr>
      <td  colspan="6" class="style1">Summary Report of Bills sent to Finance between <%=frm_dt%> and <%=to_dt%></td>
      </tr>
      </table>
      <table border="1" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#111111">
      <tr>
      <td width="8%" class="style3" align="center">Ref Id </td>
      <td width="34%" class="style3" align="center">Letter Reference</td>
      <td width="15%" class="style3" align="center">Letter Date</td>
      <td width="10%" class="style3" align="center">No. of Bills</td>
      <td width="18%" class="style3" align="center">Amount(Rs.)</td>
      <td width="15%" class="style3" align="center">Finance Recv Dt</td>
      </tr>
      </table>
      </div>
 <% 
    String qry            = new String("");

    qry = " SELECT NVL(TO_CHAR(A.bill_ref_id),' ')                        bill_ref_id       , " +
          "        NVL(TO_CHAR(A.finrcd_dt,'DD-MON-RRRR'),' ')            finrcd_dt         , " +
	  "        NVL(TO_CHAR(A.letter2finance_dt ,'DD-MON-RRRR'),' ')   letter2finance_dt , " +
	  "        NVL(A.letter2finance_ref,' ')                          letter2finance_ref, " +
	  "        NVL(A.station_cd,' ')                                  station_cd        , " +
	  "        NVL(TO_CHAR(B.cnt),' ')                                bill_cnt          , " +
	  "        NVL(TO_CHAR(B.amt,'99999999990.09'),' ')                  bill_amt            " + 
          " FROM orbl_fin_rcd_dt A,                                                           " + 
          "      (SELECT  bill_ref_id ,SUM(cnt) cnt ,SUM(amt) amt FROM (                      " +
          "              SELECT o.bill_ref_id bill_ref_id,                                    " +
          "              COUNT(o.bill_ref_id) cnt,                                            " +
          "              SUM(o.bill_amount) amt                                               " +
          "               FROM  orbl_bill_dtl   o                                             " +
          "             WHERE o.bill_ref_id IS NOT NULL                                       " +
          "             AND  NVL(o.BILL_CANCEL,'Z') !='Y'                                     " +
          "       GROUP BY o.bill_ref_id                                                      " +
          "       UNION                                                                       " +
          "       SELECT s.bill_ref_id bill_ref_id,                                           " +
          "       COUNT(s.bill_ref_id) cnt,                                                   " +
          "       SUM(s.bill_amt) amt                                                         " +
          "       FROM  orbl_spbill_dtl s                                                     " +
          "       WHERE s.bill_ref_id IS NOT NULL                                             " +
          "       AND  NVL(s.BILL_CANCEL,'Z') !='Y'                                           " +
          "       GROUP BY s.bill_ref_id)                                                     " +
          "       GROUP BY bill_ref_id) B                                                     " + 
          " WHERE A.bill_ref_id  = B.bill_ref_id(+)                                           " +
          " AND trunc(letter2finance_dt)  BETWEEN TO_DATE(?,'DD-MON-RRRR') AND TO_DATE(?,'DD-MON-RRRR')  " +
          " AND station_cd in (" + sLoginStn + " ) " +
          " ORDER BY A.finrcd_dt DESC,A.bill_ref_id                                                             ";


				                    
    
        ps =  mk.con.prepareStatement(qry);

        ps.setString(1,frm_dt);
        ps.setString(2,to_dt);
	
        rs    = ps.executeQuery();
%>

       <DIV STYLE="overflow: auto;width: 825px; height: 136px;position:absolute;top:48px;left:11px;
                   border-left: 1px gray solid; border-bottom: 1px gray solid; border-right: 1px gray solid;
                   padding:0px; margin: 0px">
       <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#804040" style="border-collapse: collapse">
<%


        while(rs.next()){
                         bill_ref_id         = rs.getString("bill_ref_id");
                         finrcd_dt           = rs.getString("finrcd_dt");
                         letter2finance_dt   = rs.getString("letter2finance_dt");
                         letter2finance_ref  = rs.getString("letter2finance_ref");
                         station_cd          = rs.getString("station_cd");
                         bill_amt            = rs.getString("bill_amt");
                         bill_cnt            = rs.getString("bill_cnt");
                         if(finrcd_dt.equals(" ")){
%>
      <tr onMouseOver="window.event.srcElement.style.cursor='hand'" onclick="showLotEntry('<%=bill_ref_id%>')">
       <td width="8%" class="style7" align="center"><%=bill_ref_id%></td>
       <td width="34%" class="style7" align="center"><%=letter2finance_ref%></td>
       <td width="15%" class="style7" align="center"><%=letter2finance_dt%></td>
       <td width="10%" class="style7" align="right"><%=bill_cnt%></td>
       <td width="18%" class="style7" align="right"><%=bill_amt%></td>
       <td width="15%" class="style7" align="center"><%=finrcd_dt%></td>
      </tr>
<%

                         }else{
%>
      <tr onMouseOver="window.event.srcElement.style.cursor='hand'" onclick="showLotEntry('<%=bill_ref_id%>')">
       <td width="8%" class="style6" align="center"><%=bill_ref_id%></td>
       <td width="34%" class="style6" align="center"><%=letter2finance_ref%></td>
       <td width="15%" class="style6" align="center"><%=letter2finance_dt%></td>
       <td width="10%" class="style6" align="right"><%=bill_cnt%></td>
       <td width="18%" class="style6" align="right"><%=bill_amt%></td>
       <td width="15%" class="style6" align="center"><%=finrcd_dt%></td>
      </tr>
<%
                         }
        }
%>
<%
	rs.close();
	ps.close();


    qry = " SELECT NVL(TO_CHAR(SUM(B.cnt)),' ')                                bill_cnt    ,  " +
          "        NVL(TO_CHAR(SUM(B.amt),'99999999990.09'),' ')               bill_amt       " +
          " FROM   orbl_fin_rcd_dt A,                                                         " + 
          "      (SELECT  bill_ref_id ,SUM(cnt) cnt ,SUM(amt) amt FROM (                      " +
          "              SELECT o.bill_ref_id bill_ref_id,                                    " +
          "              COUNT(o.bill_ref_id) cnt,                                            " +
          "              SUM(o.bill_amount) amt                                               " +
          "               FROM  orbl_bill_dtl   o                                             " +
          "             WHERE o.bill_ref_id IS NOT NULL                                       " +
          "             AND  NVL(o.BILL_CANCEL,'Z') !='Y'                                     " +
          "       GROUP BY o.bill_ref_id                                                      " +
          "       UNION                                                                       " +
          "       SELECT s.bill_ref_id bill_ref_id,                                           " +
          "       COUNT(s.bill_ref_id) cnt,                                                   " +
          "       SUM(s.bill_amt) amt                                                         " +
          "       FROM  orbl_spbill_dtl s                                                     " +
          "       WHERE s.bill_ref_id IS NOT NULL                                             " +
          "             AND  NVL(s.BILL_CANCEL,'Z') !='Y'                                     " +
          "       GROUP BY s.bill_ref_id)                                                     " +
          "       GROUP BY bill_ref_id) B                                                     " + 
          " WHERE A.bill_ref_id  = B.bill_ref_id(+)                                           " +
          " AND trunc(letter2finance_dt)  BETWEEN TO_DATE(?,'DD-MON-RRRR') AND TO_DATE(?,'DD-MON-RRRR')  " +
          " AND FINRCD_DT is null                                                          "+
          " AND station_cd in ( " + sLoginStn + " ) " +
          " ORDER BY A.bill_ref_id                                                             ";


				                    
    
        ps =  mk.con.prepareStatement(qry);

        ps.setString(1,frm_dt);
        ps.setString(2,to_dt);
	
        rs    = ps.executeQuery();

        while(rs.next()){
                         tot_bill_cnt_fin_not_rcv    = rs.getString("bill_cnt");
                         tot_bill_amt_fin_not_rcv    = rs.getString("bill_amt");
                        }

	rs.close();
	ps.close();

    qry = " SELECT NVL(TO_CHAR(SUM(B.cnt)),' ')                                bill_cnt    ,  " +
          "        NVL(TO_CHAR(SUM(B.amt),'99999999990.09'),' ')               bill_amt       " +
          " FROM   orbl_fin_rcd_dt A,                                                         " + 
          "      (SELECT  bill_ref_id ,SUM(cnt) cnt ,SUM(amt) amt FROM (                      " +
          "              SELECT o.bill_ref_id bill_ref_id,                                    " +
          "              COUNT(o.bill_ref_id) cnt,                                            " +
          "              SUM(o.bill_amount) amt                                               " +
          "               FROM  orbl_bill_dtl   o                                             " +
          "             WHERE o.bill_ref_id IS NOT NULL                                       " +
          "             AND  NVL(o.BILL_CANCEL,'Z') !='Y'                                     " +
          "       GROUP BY o.bill_ref_id                                                      " +
          "       UNION                                                                       " +
          "       SELECT s.bill_ref_id bill_ref_id,                                           " +
          "       COUNT(s.bill_ref_id) cnt,                                                   " +
          "       SUM(s.bill_amt) amt                                                         " +
          "       FROM  orbl_spbill_dtl s                                                     " +
          "       WHERE s.bill_ref_id IS NOT NULL                                             " +
          "             AND  NVL(s.BILL_CANCEL,'Z') !='Y'                                     " +
          "       GROUP BY s.bill_ref_id)                                                     " +
          "       GROUP BY bill_ref_id) B                                                     " + 
          " WHERE A.bill_ref_id  = B.bill_ref_id(+)                                           " +
          " AND trunc(letter2finance_dt)  BETWEEN TO_DATE(?,'DD-MON-RRRR') AND TO_DATE(?,'DD-MON-RRRR')  " +
          " AND FINRCD_DT is not null                                                          " +
          " AND station_cd in (" + sLoginStn + " ) " +
          " ORDER BY A.bill_ref_id                                                             ";


				                    
    
        ps =  mk.con.prepareStatement(qry);

        ps.setString(1,frm_dt);
        ps.setString(2,to_dt);
	
        rs    = ps.executeQuery();

        while(rs.next()){
                         tot_bill_cnt_fin_rcv    = rs.getString("bill_cnt");
                         tot_bill_amt_fin_rcv    = rs.getString("bill_amt");
                        }

	rs.close();
	ps.close();

    qry = " SELECT NVL(TO_CHAR(SUM(B.cnt)),' ')                                bill_cnt    ,  " +
          "        NVL(TO_CHAR(SUM(B.amt),'99999999990.09'),' ')               bill_amt       " +
          " FROM   orbl_fin_rcd_dt A,                                                         " + 
          "      (SELECT  bill_ref_id ,SUM(cnt) cnt ,SUM(amt) amt FROM (                      " +
          "              SELECT o.bill_ref_id bill_ref_id,                                    " +
          "              COUNT(o.bill_ref_id) cnt,                                            " +
          "              SUM(o.bill_amount) amt                                               " +
          "               FROM  orbl_bill_dtl   o                                             " +
          "             WHERE o.bill_ref_id IS NOT NULL                                       " +
          "             AND  NVL(o.BILL_CANCEL,'Z') !='Y'                                     " +
          "       GROUP BY o.bill_ref_id                                                      " +
          "       UNION                                                                       " +
          "       SELECT s.bill_ref_id bill_ref_id,                                           " +
          "       COUNT(s.bill_ref_id) cnt,                                                   " +
          "       SUM(s.bill_amt) amt                                                         " +
          "       FROM  orbl_spbill_dtl s                                                     " +
          "       WHERE s.bill_ref_id IS NOT NULL                                             " +
          "       AND  NVL(s.BILL_CANCEL,'Z') !='Y'                                           " +
          "       GROUP BY s.bill_ref_id)                                                     " +
          "       GROUP BY bill_ref_id) B                                                     " + 
          " WHERE A.bill_ref_id  = B.bill_ref_id(+)                                           " +
          "   AND trunc(letter2finance_dt)  BETWEEN TO_DATE(?,'DD-MON-RRRR') AND TO_DATE(?,'DD-MON-RRRR')  " +
          " AND station_cd in (" + sLoginStn + " ) " +
          "   ORDER BY A.bill_ref_id                                                             ";


				                    
    
        ps =  mk.con.prepareStatement(qry);

        ps.setString(1,frm_dt);
        ps.setString(2,to_dt);
	
        rs    = ps.executeQuery();

        while(rs.next()){
                         tot_bill_cnt    = rs.getString("bill_cnt");
                         tot_bill_amt    = rs.getString("bill_amt");
                        }

	rs.close();
	ps.close();
%>
      <tr>
       <td width="57%" class="style9" align="center" colspan="3">Total Bills sent between <%=frm_dt%> and <%=to_dt%> but not received by finance</td>
       <td width="10%" class="style9" align="right"><%=tot_bill_cnt_fin_not_rcv%></td>
       <td width="18%" class="style9" align="right"><%=tot_bill_amt_fin_not_rcv%></td>
       <td width="15%" class="style9" align="center"></td>
      </tr>
      <tr>
       <td width="57%" class="style8" align="center" colspan="3">Total Bills sent between <%=frm_dt%> and <%=to_dt%> and received by finance</td>
       <td width="10%" class="style8" align="right"><%=tot_bill_cnt_fin_rcv%></td>
       <td width="18%" class="style8" align="right"><%=tot_bill_amt_fin_rcv%></td>
       <td width="15%" class="style8" align="center"></td>
      </tr>
      <tr>
       <td width="57%" class="style4" align="center" colspan="3">Total Bills sent between <%=frm_dt%> and <%=to_dt%></td>
       <td width="10%" class="style4" align="right"><%=tot_bill_cnt%></td>
       <td width="18%" class="style4" align="right"><%=tot_bill_amt%></td>
       <td width="15%" class="style4" align="center"></td>
      </tr>
     </table>
     </DIV>
     <DIV STYLE="overflow: auto;width: 808px; height: 25px;position:absolute;top:184px;left:11px;
                   border-left: 1px gray solid; border-bottom: 1px gray solid; border-right: 1px gray solid;
                   padding:0px; margin: 0px">
      <table border="1" cellpadding="0" cellspacing="0" width="100%" style="border-collapse: collapse" bordercolor="#111111">
      <tr>
      <td width="42%" class="style1" align="center" colspan="2"></td>
      <td width="25%" class="style3" align="center" colspan="2">
        <input type="button" name="b1" id="b1" value="Add New Lot" class="style3" onclick="return showLotEntry('0');" />
      </td>
      <td width="33%" class="style1" align="center" colspan="2"></td>
      </tr>
      </table>
      </DIV>
<%

      }catch(Exception ee){ ee.printStackTrace();}
         finally{System.out.println(" CCCCCC order_not_onetime.jsp CLOSED !!!"); mk.con.close(); }

}
%>
</body>
</html>