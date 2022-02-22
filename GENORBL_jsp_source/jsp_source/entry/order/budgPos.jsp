<%@page import="java.util.StringTokenizer"%>
﻿<%-- 
    Document   : budgPos
    Created on : Mar 17, 2013, 10:04:45 PM
    Author     : DESKTOP
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="Order.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%!    OrderProcessBeanRemote hRemote = null;
    //htmaNewRemote hRemote1 = null ;
    InitialContext ic = null;

    public void jspInit() {
        try {
            ic = new InitialContext();
            hRemote = (OrderProcessBeanRemote) ic.lookup("java:comp/env/OrderProcessBeanRemote");
            //hRemote = (OrderProcessBeanRemote) ic.lookup("ejb/OrderProcessBean");
            //hRemote1 = (htmaNewRemote)ic.lookup(htmaNewRemote.class.getName());
        } catch (Exception e) {
            System.out.println("budgPos.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            table {
                font-family     : verdana;
                font-size       : 12px;
                text-align      : left;
            }

            table thead  {
                cursor : pointer;
            }

            table thead tr {
                background : #ffdd00;
            }

            table tfoot tr {
                background : #ffffff;
            }

            table thead tr th{
                border-left : 1pt solid red ;
                border-right : 1pt solid red ;
                border-top  : 1px solid red ;
                border-bottom  : 1px solid red ;
            }

            table tfoot tr th{
                border-left : 1pt solid red ;
                border-right : 1pt solid red ;
                border-top  : 1px solid red ;
                border-bottom  : 1px solid red ;
            }

            table tbody tr td{
                border-left   : 1pt solid green ;
                border-right   : 1pt solid green ;
                border-top : 1pt solid green ;
                border-bottom : 1pt solid green ;
            }


        </style>
    </head>
    <body background="Pics/Order/lblue047.gif">
        <%

                    String sOrdForStnCd = request.getParameter("sOrdForStnCd");
                    String sOrdForDeptCd = request.getParameter("sOrdForDeptCd");
                    String sSeqNo = request.getParameter("sSeqNo");
                    String sBudgHead = request.getParameter("sBudgHead");
                    String sBudgGrpDesc = new String();
                    String sBudgYrAmt = new String();
                    String sGrpBudgYrAmt = new String();
                    String sBudgYtdAmt = new String();
                    String sGrpBudgYtdAmt = new String();
                    String sBlSplBlAmtRecvdYtdAmt = new String();
                    String sGrpBlSplBlAmtRecvdYtdAmt = new String();
                    String sBlYetToRealYtdAmt = new String();
                    String sGrpBlYetToRealYtdAmt = new String();
                    String sTotYtdAmt = new String();
                    String sGrpTotYtdAmt = new String();
                    String sBgtHndYr = new String();
                    String sGrpBgtHndYr = new String();
                    String sBgtHndYtd = new String();
                    String sGrpBgtHndYtd = new String();

                    String sRslt = hRemote.getBudgPos(sOrdForStnCd, sOrdForDeptCd, sBudgHead, sSeqNo);

                    System.out.println("1111 : " + sRslt);

                    if (!sRslt.equals("X")) {

                        String[] sVal = sRslt.split("~");

                        sBudgGrpDesc = sVal[0];
                        sBudgYrAmt = sVal[1];
                        sGrpBudgYrAmt = sVal[2];
                        sBudgYtdAmt = sVal[3];
                        sGrpBudgYtdAmt = sVal[4];
                        sBlSplBlAmtRecvdYtdAmt = sVal[5];
                        sGrpBlSplBlAmtRecvdYtdAmt = sVal[6];
                        sBlYetToRealYtdAmt = sVal[7];
                        sGrpBlYetToRealYtdAmt = sVal[8];
                        sTotYtdAmt = sVal[9];
                        sGrpTotYtdAmt = sVal[10];
                        sBgtHndYr = sVal[11];
                        sGrpBgtHndYr = sVal[12];
                        sBgtHndYtd = sVal[13];
                        sGrpBgtHndYtd = sVal[14];

                    }


        %>
        <div align="center">
            <br>
            <br>
            <b><font face="Times New Roman" size="5" color="mediumblue">BUDGET&nbsp;&nbsp;&nbsp;POSITION&nbsp;&nbsp;&nbsp;SCREEN</font></b>
            <br>
            <br>
            <%
                        if (!sRslt.equals("X")) {

            %>

            <table cellspacing="1" cellpadding="2" id="myScrollTable_1" width="950" style = "border-collapse : collapse">
                <thead>
                    <tr>
                        <th colspan="8" align="center"><b>Yearly & YTD Budget vis-Ã -vis actual expenses for the selected Budget Head</b></th>

                    </tr>
                    <tr style="background : lightgreen">
                        <th rowspan="2" align="center"><b>Budget for</b></th>
                        <th colspan="2" align="center"><b>Yearly</b></th>
                        <th colspan="3" align="center"><b>YTD Actual Expenditure</b></th>
                        <th colspan="2" align="center"><b>Budget in hand</b></th>
                    </tr>
                    <tr style="background : lightgreen">
                        <th align="center"><b>Yearly</b></th>
                        <th align="center"><b>YTD</b></th>
                        <th align="center"><b>Bill Amt recvd by Finance</b></th>
                        <th align="center"><b>Bill Amt yet to be released</b></th>
                        <th align="center"><b>Total</b></th>
                        <th align="center"><b>Yearly</b></th>
                        <th align="center"><b>YTD</b></th>
                    </tr>
                </thead>
                <tbody>
                    <tr bgcolor = "lightblue" onMouseOver="window.event.srcElement.style.cursor='hand'" onclick="">
                        <td align="center" ><font face="Times New Roman"><b><%= sBudgHead%></b></font></td>
                        <td align="right"><font face="Times New Roman"><b><%= sBudgYrAmt%></b></font></td>
                        <td align="right"><font face="Times New Roman"><b><%= sBudgYtdAmt%></b></font></td>
                        <td align="right"><font face="Times New Roman"><b><%= sBlSplBlAmtRecvdYtdAmt%></b></font></td>
                        <td align="right"><font face="Times New Roman"><b><%= sBlYetToRealYtdAmt%></b></font></td>
                        <td align="right" ><font face="Times New Roman"><b><%= sTotYtdAmt%></b></font></td>
                        <td  align="center"><font face="Times New Roman" ><b><%= sBgtHndYr%></b></font></td>
                        <td align="right" style = "border-right : 1px solid green ;"><font face="Times New Roman" ><b><%= sBgtHndYtd%></b></font></td>
                    </tr>
                    <tr bgcolor = "lightblue" onMouseOver="window.event.srcElement.style.cursor='hand'" onclick="">
                        <td align="center" ><font face="Times New Roman"><%= sBudgGrpDesc%></font></td>
                        <td align="right"><font face="Times New Roman"><b><%= sGrpBudgYrAmt%></b></font></td>
                        <td align="right"><font face="Times New Roman"><b><%= sGrpBudgYtdAmt%></b></font></td>
                        <td align="right"><font face="Times New Roman"><b><%= sGrpBlSplBlAmtRecvdYtdAmt%></b></font></td>
                        <td align="right"><font face="Times New Roman"><b><%= sGrpBlYetToRealYtdAmt%></b></font></td>
                        <td align="right" ><font face="Times New Roman"><b><%= sGrpTotYtdAmt%></b></font></td>
                        <td align="center"><font face="Times New Roman" ><b><%= sGrpBgtHndYr%></b></font></td>
                        <td align="right" style = "border-right : 1px solid green ;"><font face="Times New Roman" ><b><%= sGrpBgtHndYtd%></b></font></td>
                    </tr>
                </tbody>
            </table>
            <%
                        } else {
            %>

            <center><font face="Tahoma" color="red" size="4"><b>BUDGET&nbsp;&nbsp;POSITION&nbsp;&nbsp;IS&nbsp;&nbsp;AVAILABLE&nbsp;&nbsp;ONLY&nbsp;&nbsp;FOR&nbsp;&nbsp;ORDER&nbsp;&nbsp;PREPARED&nbsp;&nbsp;IN&nbsp;&nbsp;THE&nbsp;&nbsp;CURRENT&nbsp;&nbsp;YEAR</b></font></center>

            <%            }

            %>

        </div>
    </body>
</html>
