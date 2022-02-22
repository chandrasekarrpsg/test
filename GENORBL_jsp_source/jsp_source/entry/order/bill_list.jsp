<%-- 
    Document   : order_list
    Created on : Dec 7, 2012, 5:19:08 PM
    Author     : debasis saha
--%>

<%@page import="java.math.BigDecimal"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="Order.*"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
            System.out.println("bill_list.jsp can't be initialsed for " + e.getMessage());
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
                border-left   : 1pt solid red ;
                border-top : 1px solid red ;
                border-bottom : 1px solid red ;
            }

            table tfoot tr th{
                border-left : 1pt solid red ;
                border-top  : 1px solid red ;
            }

            table tbody tr td{
                border-left   : 1pt solid green ;
                border-bottom : 1pt solid green ;
            }


        </style>
        <script type = "text/javascript" src = "js/scrollabletable.js"></script>
        <script type="text/javascript" src="js/ordGenScript.js"></script>
        <script language="javascript">
            function detail(sOrdId,sBlId)
            {
                //alert(qstr);
                //var rslt=window.navigate("frame1.jsp?"+qstr,"detail","width=750,height=450,left=100,top=150");
                f1.sOrdId.value=sOrdId;
                f1.sBlId.value=sBlId;
                f1.submit();
                //return 0;
            }

        </script>
    </head>
    <body background="Pics/Order/lblue047.gif" onload="">
        <jsp:useBean id="orderBean" class="VO.OrderBean" scope="session" />

        <%
                    String sLoginStnCd = request.getParameter("sLoginStnCd");
                    String sLoginStnShrtNm = request.getParameter("sLoginStnShrtNm");
                    String sLoginStnLongNm = request.getParameter("sLoginStnLongNm");
                    String sLoginDeptCd = request.getParameter("sLoginDeptCd");
                    String sLoginDeptShrtNm = request.getParameter("sLoginDeptShrtNm");
                    String sLoginDeptLongNm = request.getParameter("sLoginDeptLongNm");
                    String sLoginEmpCd = request.getParameter("sLoginEmpCd");
                    String sLoginEmpNm = request.getParameter("sLoginEmpNm");
                    String sLoginEmpDesg = request.getParameter("sLoginEmpDesg");
                    String sLoginEmpLvl = request.getParameter("sLoginEmpLvl");
                    String sLoginAdmMkr = request.getParameter("sLoginAdmMkr");

                    String sOrdId = request.getParameter("sOrdId");

        %>


        <font size="6">
            <center>
                <font face="Times New Roman" size="4" color="mediumblue"><b>Bill&nbsp;List&nbsp;For&nbsp;Order&nbsp;No&nbsp;:</b>&nbsp;<span id="spanOrdNo">&nbsp;</span></font>
                <br>

                <table cellspacing="1" cellpadding="2" id="myScrollTable_1" width="980">
                    <thead>
                        <tr>
                            <th align="center"><b>Sl No</b></th>
                            <th align="center"><b>Month</b></th>
                            <th align="center"><b>Bill No</b></th>
                            <th align="center"><b>Bill Date</b></th>
                            <th align="center"><b>Bill Released on</b></th>
                            <th align="center"><b>Bill Cleared by</b></th>
                            <th align="center"><b>Letter Ref</b></th>

                            <th align="center"><b>Finance Recd Date</b></th>
                            <th align="center"><b>Bill Cancel </b></th>

                            <th align="center" style = "border-right : 1px solid red ;"><b>Bill Amount(Rs.)</b></th>
                        </tr>
                    </thead>

                    <tbody>

                        <%
                                    //System.out.println("order_list : 1111");
                                    List lstBlDtls = null;
                                    List rows = null;
                                    Iterator iterateOuter = null;
                                    Iterator iterateInner = null;
                                    //String sDept_2 = null;
                                    /*int iOrdRef = 0;
                                    String sOrdDt = null;
                                    String sScope = null;
                                    String sOrdAmt = null;
                                    int iSlNo = 0;
                                    int iTcRev = 0;
                                    String sContNm = null;
                                    //String sTc = null;
                                    String sOrdBy = null;
                                    String sCancel = null;
                                    String sTotBlAmt = null;
                                    int iNoBlRelease = 0;
                                    String sJobTyp = null;
                                    int iUnit = 0;
                                    //String sOrdNoDesc = null;
                                    String sColor = null;
                                    int iCnt = 0;*/


                                    //String sOrdTyp = new String();


                                    String sOrdNo = new String();
                                    String sBlId = new String();
                                    String sBlCertBy = new String();
                                    String sBlCertByNm = new String();
                                    String sBlRealDt = new String();
                                    String sBlNo = new String();
                                    String sBlDt = new String();

                                    String sBlAmt = new String();
                                    String sJobMnth = new String();
                                    String sBlRefId = new String();
                                    String sFinRecvdDt = new String();
                                    String sBlCancel = new String();



                                    String sColor = new String();

                                    int iCnt = 0;

                                    lstBlDtls = hRemote.getBlDtls(sOrdId, "");
                                    iterateOuter = lstBlDtls.iterator();

                                    System.out.println("1111");

                                    while (iterateOuter.hasNext()) {
                                        iCnt++;
                                        rows = (List) iterateOuter.next();


                                        iterateInner = rows.iterator();
                                        while (iterateInner.hasNext()) {
                                            System.out.println("2222");

                                            iterateInner.next();

                                            iterateInner.next();
                                            sOrdNo = (String) iterateInner.next();
                                            sBlId = (String) iterateInner.next();
                                            sBlCertBy = (String) iterateInner.next();
                                            List lstUsrDtls = null;
                                            List rows_2 = null;
                                            Iterator iterateOuter_2 = null;
                                            Iterator iterateInner_2 = null;
                                            lstUsrDtls = hRemote.getUsrDtls(sBlCertBy);
                                            iterateOuter_2 = lstUsrDtls.iterator();
                                            while (iterateOuter_2.hasNext()) {
                                                rows = (List) iterateOuter_2.next();

                                                iterateInner_2 = rows.iterator();
                                                while (iterateInner_2.hasNext()) {
                                                    iterateInner_2.next();
                                                    iterateInner_2.next();
                                                    iterateInner_2.next();
                                                    iterateInner_2.next();
                                                    iterateInner_2.next();
                                                    iterateInner_2.next();

                                                    sBlCertByNm = (String) iterateInner_2.next() + " " + (String) iterateInner_2.next();
                                                    iterateInner_2.next();
                                                    iterateInner_2.next();  
                                                    iterateInner_2.next(); 
                                                    iterateInner_2.next();
                                                }
                                            }
                                            sBlRealDt = (String) iterateInner.next();


                                            sBlNo = (String) iterateInner.next();
                                            sBlDt = (String) iterateInner.next();
                                            iterateInner.next();

                                            iterateInner.next();
                                            iterateInner.next();
                                            iterateInner.next();

                                            iterateInner.next();
                                            iterateInner.next();
                                            iterateInner.next();
                                            iterateInner.next();
                                            sBlAmt = (String) iterateInner.next();

                                            sJobMnth = ((String) iterateInner.next()).trim();
                                            if (sJobMnth.equals("")) {
                                                sJobMnth = "&nbsp;";
                                            }
                                            iterateInner.next();
                                            iterateInner.next();
                                            iterateInner.next();
                                            iterateInner.next();
                                            iterateInner.next();
                                            iterateInner.next();
                                            iterateInner.next();
                                            sBlRefId = ((String) iterateInner.next()).trim();
                                            if (sBlRefId.equals("")) {
                                                sBlRefId = "&nbsp;";
                                            }
                                            sFinRecvdDt = ((String) iterateInner.next()).trim();
                                            if (sFinRecvdDt.equals("")) {
                                                sFinRecvdDt = "&nbsp;";
                                            }
                                            sBlCancel = (String) iterateInner.next();
                                            iterateInner.next();
                                            iterateInner.next();
                                            iterateInner.next();


                                        }

                                        /*if (sTc.equals("T")) {
                                        sOrdNo_2 = "BBGS/" + sDept_2 + "/ORD/TC/" + iSlNo + "/" + iTcRev;
                                        }
                                        if (sTc.equals("R")) {
                                        sOrdNo_2 = "BBGS/" + sDept_2 + "/ORD/RC/" + iSlNo + "/" + iTcRev;
                                        }
                                        if (sTc.equals("O")) {
                                        sOrdNo_2 = "BBGS/" + sDept_2 + "/ORD/" + iSlNo;
                                        }
                                        if (sTc.equals("C")) {
                                        sOrdNo_2 = "BBGS/" + sDept_2 + "/ORD/CAPEX/" + iSlNo;
                                        }*/

                                        //sOrdNo = "BBGS/" + sTc + "/" + sDept + "/" + iSlNo;

                                        if (sBlCancel.equals("Y")) {
                                            sColor = "lightpink";
                                        } else {
                                            sColor = "lightgreen";
                                        }


                        %>

                        <tr bgcolor = "<%=sColor%>" onMouseOver="window.event.srcElement.style.cursor='hand'" onclick="detail('<%=sOrdId%>','<%= sBlId%>')">
                            <td align="center" ><font face="Times New Roman"><%=iCnt%> </font></td>
                            <td align="center"><font face="Times New Roman"><b><%=sJobMnth%> </b></font></td>
                            <td align="center"><font face="Times New Roman"><%=sBlNo%></font></td>
                            <td align="center"><font face="Times New Roman"><%=sBlDt%> </font></td>
                            <td><font face="Times New Roman"><%=sBlRealDt%> </font></td>
                            <td align="right" ><font face="Times New Roman"><%=sBlCertByNm%> </font></td>
                            <td  align="center"><font face="Times New Roman" ><%=sBlRefId%></font></td>

                            <td  align="center"><font face="Times New Roman" ><%=sFinRecvdDt%></font></td>
                            <td  align="center"><font face="Times New Roman" ><%=sBlCancel%></font></td>
                            <td align="right" style = "border-right : 1px solid green ;"><font face="Times New Roman" ><%=sBlAmt%></font></td>
                        </tr>

                        <%
                                    }
                        %>

                    </tbody>
                </table>

            </center>


        </font>

        <form name="f1" action="bill_entry.jsp" method="post">
            <input type="hidden" name="sLoginStnCd" value="<%= sLoginStnCd%>">
            <input type="hidden" name="sLoginStnShrtNm" value="<%= sLoginStnShrtNm%>">
            <input type="hidden" name="sLoginStnLongNm" value="<%= sLoginStnLongNm%>">
            <input type="hidden" name="sLoginDeptCd" value="<%= sLoginDeptCd%>">
            <input type="hidden" name="sLoginDeptShrtNm" value="<%= sLoginDeptShrtNm%>">
            <input type="hidden" name="sLoginDeptLongNm" value="<%= sLoginDeptLongNm%>">
            <input type="hidden" name="sLoginEmpCd" value="<%= sLoginEmpCd%>">
            <input type="hidden" name="sLoginEmpNm" value="<%= sLoginEmpNm%>">
            <input type="hidden" name="sLoginEmpDesg" value="<%= sLoginEmpDesg%>">
            <input type="hidden" name="sLoginEmpLvl" value="<%= sLoginEmpLvl%>">
            <input type="hidden" name="sLoginAdmMkr" value="<%= sLoginAdmMkr%>">
            <input type="hidden" name="sOrdId" value=""/>
            <input type="hidden" name="sBlId" value=""/>
            <input type="hidden" name="sOrdSts" value=""/>
            <input type="hidden" name="bOrdEntryPermit" value="false"/>
        </form>

        <script>
            var t = new ScrollableTable(document.getElementById('myScrollTable_1'), 350,980);
            document.getElementById("spanOrdNo").firstChild.data = "<%= sOrdNo%>"

            //document.getElementById("spanWageLiab").firstChild.data = sWageLiab ;

            
            if(window.parent.sBackClick.value == '0')window.parent.sBack.value= window.parent.sBack.value + '7';
            window.parent.frames[1].document.getElementById("spanBack").firstChild.data='Back';
            
            window.parent.sBackClick.value = '0';

        
        </script>
    </body>
</html>
