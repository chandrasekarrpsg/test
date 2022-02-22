<%-- 
    Document   : budgReptDtls2
    Created on : Jun 21, 2013, 5:24:10 PM
    Author     : debasis saha
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="Budget.*"%>
<%!    BudgetProcessBeanRemote hRemote = null;
    //htmaNewRemote hRemote1 = null ;
    InitialContext ic = null;

    public void jspInit() {
        try {
            ic = new InitialContext();
            hRemote = (BudgetProcessBeanRemote) ic.lookup("java:comp/env/BudgetProcessBeanRemote");
            //hRemote = (OrderProcessBeanRemote) ic.lookup("ejb/OrderProcessBean");
            //hRemote1 = (htmaNewRemote)ic.lookup(htmaNewRemote.class.getName());
        } catch (Exception e) {
            System.out.println("budgRepDtls2.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>
<%@page contentType="application/vnd.ms-excel" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                font-family     : verdana;
                font-size       : 11px;
                text-align      : left;
            }

            table thead  {
                cursor : pointer;
            }

            table thead tr {
                background : #ffffff;
            }

            table tfoot tr {
                background : #ffffff;
            }

            table thead tr th{
                border-left   : 0.5pt solid #000000 ;
                border-right   : 0.5pt solid #000000 ;
                border-top : 0.5px solid #000000 ;
                border-bottom : 0.5px solid #000000 ;
            }

            table tfoot tr th{
                border-left : 1pt solid red ;
                border-top  : 1px solid red ;
            }

            table tbody tr td{
                border-left   : 0.5pt solid #000000 ;
                border-right   : 0.5pt solid #000000 ;
                border-top   : 0.5pt solid #000000 ;
                border-bottom : 0.5pt solid #000000 ;
            }

           .style34{

              width: 500px;
              text-align: center;
              border-right: 1px solid #000000;
              /*mso-number-format:000000000000000000000;*/
              mso-number-format:"\@";

           }


        </style>
        <script type = "text/javascript" src = "js/scrollabletable.js"></script>
    </head>
    <body>
        <%
                    response.setHeader("Content-Disposition", "inline; filename=" + "budgReptDtls2.xls");

                    String sMtdYtd = request.getParameter("sMtdYtd");
                    String sFinYr = request.getParameter("sFinYr");
                    String sMon = request.getParameter("sMon");
                    String sMontr = request.getParameter("sMontr");
                    String sStn = request.getParameter("sStn");
                    String sDept = request.getParameter("sDept");
                    String sGrp = request.getParameter("sGrp");
                    String sBudgHd = request.getParameter("sBudgHd");
                    String sMmOrd = request.getParameter("sMmOrd");

                    String sItemCd = new String();
                    String sBudgHead = new String();
                    String sBudgHeadDesc = new String();
                    String sTransDt = new String();
                    String sAmt = new String();
                    String sDesc = new String();
                    String sErpCd = new String();
                    String sBlRealDt = new String();
                    String sFinSentDt = new String();
                    String sOrdNo = new String();
                    String sBlId = new String();
                    String sBlNo = new String();
                    String sBlDt = new String();
                    String sJobMnth = new String();

                    List lstDtls = null;
                    List rows = null;
                    Iterator iterateOuter = null;
                    Iterator iterateInner = null;


                    lstDtls = hRemote.getStnActDtls(sMtdYtd, sFinYr, sMon, sMontr, sStn, sDept, sGrp, sBudgHd);


        %>

        <table cellspacing="1" cellpadding="2" id="myScrollTable_1" width="880" style="border-collapse : collapse"><!--  1start-->
            <thead><!--  1start-->
                <tr>
                    <th><b>Station</b></th>
                    <th><b>Group</b></th>
                    <th><b>FinancialYear</b></th>
                    <th><b>Month</b></th>
                    <th><b>Item_Code</b></th>
                    <th><b>Dept</b></th>
                    <th><b>BudgetHead</b></th>
                    <th><b>BudgetHead Desc</b></th>
                    <th><b>Transaction_Date</b></th>
                    <th><b>AmountInLakh</b></th>
                    <th><b>Description</b></th>
                    <th class="style34"><b>TwentyoneDigit_Code</b></th>
                    <th><b>Bill_Release_Date</b></th>
                    <th><b>Bill_To_Finance</b></th>
                    <th><b>Order_No</b></th>
                    <th><b>Bill_Id</b></th>
                    <th><b>Bill_No</b></th>
                    <th><b>Bill_Date</b></th>
                    <th><b>Job_Month</b></th>
                </tr>
            </thead><!--  1end-->
            <tbody>

                <%

                            iterateOuter = lstDtls.iterator();
                            int i = 0;
                            while (iterateOuter.hasNext()) {
                                rows = (List) iterateOuter.next();
                                iterateInner = rows.iterator();
                                while (iterateInner.hasNext()) {
                                    sStn = (String) iterateInner.next();
                                    sGrp = (String) iterateInner.next();
                                    sFinYr = (String) iterateInner.next();
                                    sMon = (String) iterateInner.next();
                                    sItemCd = (String) iterateInner.next();
                                    sDept = (String) iterateInner.next();
                                    sBudgHead = (String) iterateInner.next();
                                    sBudgHeadDesc = (String) iterateInner.next();
                                    sTransDt = (String) iterateInner.next();
                                    sAmt = (String) iterateInner.next();
                                    sDesc = (String) iterateInner.next();
                                    sErpCd = (String) iterateInner.next();
                                    sBlRealDt = (String) iterateInner.next();
                                    sFinSentDt = (String) iterateInner.next();
                                    sOrdNo = (String) iterateInner.next();
                                    sBlId = (String) iterateInner.next();
                                    sBlNo = (String) iterateInner.next();
                                    sBlDt = (String) iterateInner.next();
                                    sJobMnth = (String) iterateInner.next();
                                }
                                i++;
                                if (i % 2 == 0) {
                %>
                <tr bgcolor="#ffffff">
                    <%                                                            } else {
                    %>
                <tr bgcolor="#ffffff">
                    <%                                                            }
                    %>
                    <td valign="top" width="5%"><font size="1"><%= sStn%></font></td>
                    <td valign="top" width="5%"><font size="1"><%= sGrp%></font></td>
                    <td valign="top" width="5%"><font size="1"><%= sFinYr%></font></td>
                    <td valign="top" width="5%"><font size="1"><%= sMon%></font></td>
                    <td valign="top" width="5%"><font size="1"><%= sItemCd%></font></td>
                    <td valign="top" width="5%"><font size="1"><%= sDept%></font></td>
                    <td valign="top" width="5%"><font size="1"><%= sBudgHead%></font></td>
                    <td valign="top" width="7%"><font size="1"><%= sBudgHeadDesc%></font></td>
                    <td valign="top" width="5%"><font size="1"><%= sTransDt%></font></td>
                    <td valign="top" width="5%"><font size="1"><%= sAmt%></font></td>
                    <td valign="top" width="23%"><font size="1"><%= sDesc%></font></td>
                    <td valign="top" class="style34" width="10%"><font size="1"><%= sErpCd%></font></td>
                    <td valign="top" width="5%"><font size="1"><%= sBlRealDt%></font></td>
                    <td valign="top" width="10%"><font size="1"><%= sFinSentDt%></font></td>
                    <td valign="top" width="10%"><font size="1"><%= sOrdNo%></font></td>
                    <td valign="top" width="10%"><font size="1"><%= sBlId%></font></td>
                    <td valign="top" width="10%"><font size="1"><%= sBlNo%></font></td>
                    <td valign="top" width="5%"><font size="1"><%= sBlDt%></font></td>
                    <td valign="top" width="5%"><font size="1"><%= sJobMnth%></font></td>
                </tr>

                <%
                            }
                %>
            </tbody>
        </table>
    </body>
</html>
