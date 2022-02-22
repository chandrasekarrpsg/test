
<%@ page import="java.sql.*,oracle.jdbc.driver.*,javax.servlet.jsp.tagext.*,javax.servlet.jsp.*,java.text.*"%>
<%@ page import="java.util.*,java.io.*,java.lang.*" %>
<%@ page import="genOrblJavaPackage.*" %>

<jsp:useBean id="orderBean" class="VO.OrderBean" scope="session"/>



<html>
 <head>
 <title>Annexure Report</title>
 <script type="text/javascript" src ="printSpl.js"></script>
<style type="text/css">
     .OFL{ overflow:hidden;}
</style>
<script language='VBScript'>

Sub Print()
       OLECMDID_PRINT = 6
       OLECMDEXECOPT_DONTPROMPTUSER = 2
       OLECMDEXECOPT_PROMPTUSER = 1
       call WB.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER,1)
End Sub
document.write "<object ID='WB' WIDTH=0 HEIGHT=0 CLASSID='CLSID:8856F961-340A-11D0-A96B-00C04FD705A2'></object>"
</script>
<script language="javascript">
function mmprint()
{
// window.parent.I1.focus();
 window.print();
}
   function cls() { window.open('close.html','_self'); }


</script>

 </head>

 <body onload =""> 
<%

  String ord_ref = request.getParameter("sOrdId");

  if(ord_ref!=null){

    System.out.println("MRITYUNJOY      "+ord_ref);

    MakeConnectionGENORBL mk = new MakeConnectionGENORBL();
    PreparedStatement ps     = null;
    ResultSet         rs     = null;
    mk.con.setAutoCommit(false);

    String order_no       = new String("");
    String dept           = new String("");
    String order_dt       = new String("");
    float order_amt       = 0;
    String tc_from        = new String("");
    String tc_to          = new String("");
    String signatory      = new String(""); 
    String signatory_loc  = new String(""); 
    String supporting_sig = new String("");
    String annex          = new String("");


    try{

        ps =  mk.con.prepareStatement( "  SELECT NVL(o.order_no, ' ')                       order_no    , " +
                                       "  NVL(TO_CHAR(o.order_date,'DD-MON-RRRR'), ' ')     ord_dt      , " +
                                       "  NVL(o.p1_total, 0 )                               ord_amt     , " +
                                       "  NVL(o.dept, ' ')                                  dept        , " +
                                       "  NVL(TO_CHAR(o.tc_from,'DD-MON-RRRR'),' ')         tc_from     , " +
                                       "  NVL(TO_CHAR(o.tc_to,'DD-MON-RRRR'),' ')           tc_to       , " +
                                       "  NVL(o.annex,' ')                                  annex         " +
                                       "  FROM orbl_ord_dtl o 					          " +
                                       "  WHERE o.order_id =  TO_NUMBER(?)                                ");


        ps.setString(1,ord_ref);
	
        rs    = ps.executeQuery();

        while(rs.next()){
                         order_no    = rs.getString("order_no");
                         order_dt    = rs.getString("ord_dt");
                         order_amt   = rs.getFloat("ord_amt");
                         dept        = rs.getString("dept");
                         tc_from     = rs.getString("tc_from");
                         tc_to       = rs.getString("tc_to");
                         annex       = rs.getString("annex");
        }

	rs.close();
	ps.close();

/*
        String sql = new String("");

        if(tc_to.equals("T") || tc_to.equals("R")){

          if(order_amt < 50000){

            sql = " SELECT signatory,signatory_loc,supporting_sig FROM ORBL_CD_SIGNATORY_MST WHERE limit1 >= 25000 AND limit2 <= 49999 ";
          }
          else{

            sql = " SELECT signatory,signatory_loc,supporting_sig FROM ORBL_CD_SIGNATORY_MST WHERE "+  order_amt + " BETWEEN limit1 AND limit2 " ;

          }
        }
        else{

            sql = " SELECT signatory,signatory_loc,supporting_sig FROM ORBL_CD_SIGNATORY_MST WHERE "+  order_amt + " BETWEEN limit1 AND limit2 " ;
        }
      


        ps = mk.con.prepareStatement(sql);

        rs = ps.executeQuery();

        while(rs.next()){

                           signatory       = rs.getString("signatory");
                           signatory_loc   = rs.getString("signatory_loc");
                           supporting_sig  = rs.getString("supporting_sig");
        }

        rs.close();
        ps.close();
*/
%>


<center>
<table border="0" cellspacing="1" cellpadding="0" width="88%">
  <tr>
     <td colspan ="2">
<div align="center" id="printReady">
<div align="center">
     <font face="Times New Roman" size="5" ><strong><u>Annexure</u></strong></font>
</div>
<p>&nbsp;</p>
<table border="0" cellspacing="1" cellpadding="0" width="100%">

  <tr>
     <td align ="left" width="50%"> <font face="Verdana" style="font-size:12px"><strong>Ref: <%=order_no%></strong></font></td>
     <td align ="right" width="50%"><font face="Verdana" style="font-size:12px"><strong>Date: <%=order_dt%></strong></font></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp; </td>
  </tr>
  <tr>
    <td colspan="2" valign="top">
         <div id="annex" name="annex" text-align: justify;">
             <font face="Verdana" style="font-size:12px" > <%=annex%></font>
         </div>
    </td>
  </tr>


  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table>
</div>
</td>
</tr>
</table>
</center>



<%
      }
      catch(Exception e){
                         e.printStackTrace();
      }
      finally {
               System.out.println(" getEmp CLOSED ");
               mk.con.close() ;
      }

    }

%>      

</body>
</html>
