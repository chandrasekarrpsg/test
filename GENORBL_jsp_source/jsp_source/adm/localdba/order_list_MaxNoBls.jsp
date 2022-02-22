<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
            System.out.println("order_list.jsp can't be initialsed for " + e.getMessage());
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
            function detail(qstr)
            {
                //alert(qstr);
                f1.sOrdId.value=qstr;
                //var rslt=window.navigate("frame1.jsp?"+qstr,"detail","width=750,height=450,left=100,top=150");
                window.showModalDialog("MaxNoBls_upd.jsp",window.self,"dialogHeight: 500 px; dialogWidth: 900 px;")
                //alert(f1.action);
                //f1.submit();
                //return 0;
            }

        </script>
    </head>
    <body background="Pics/Order/lblue047.gif" onload="">
        <jsp:useBean id="OrderBean" class="VO.OrderBean" scope="session" />

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

                    System.out.println("order_list : " + sLoginStnCd);
                    System.out.println(sLoginStnShrtNm);
                    System.out.println(sLoginStnLongNm);
                    System.out.println(sLoginDeptCd);
                    System.out.println(sLoginDeptShrtNm);
                    System.out.println(sLoginDeptLongNm);
                    System.out.println(sLoginEmpCd);
                    System.out.println(sLoginEmpNm);
                    System.out.println(sLoginEmpDesg);
                    System.out.println(sLoginEmpLvl);

        %>



        <%
                    String sOrdForStnCd = request.getParameter("sOrdForStnCd");
                    String sOrdForDeptCd = request.getParameter("sOrdForDeptCd");
                    String sOrdNo = request.getParameter("sOrdNo");
                    String sOrdDtFrm = request.getParameter("sOrdDtFrm");
                    String sOrdDtTo = request.getParameter("sOrdDtTo");
                    String sOrdTyp = request.getParameter("sOrdTyp");
                    String sJobTyp = request.getParameter("sJobTyp");
                    String sBudgHead = request.getParameter("sBudgHead");
                    String sVndrNm = request.getParameter("sVndrNm");
                    String sJobDesc = request.getParameter("sJobDesc");

                    Map mapOrdDtls = new HashMap();
                    mapOrdDtls.put("sOrdForStnCd", sOrdForStnCd);
                    mapOrdDtls.put("sOrdForDeptCd", sOrdForDeptCd);
                    mapOrdDtls.put("sOrdNo", sOrdNo);
                    mapOrdDtls.put("sOrdDtFrm", sOrdDtFrm);
                    mapOrdDtls.put("sOrdDtTo", sOrdDtTo);
                    mapOrdDtls.put("sOrdTyp", sOrdTyp);
                    mapOrdDtls.put("sJobTyp", sJobTyp);
                    mapOrdDtls.put("sBudgHead", sBudgHead);
                    mapOrdDtls.put("sVndrNm", sVndrNm);
                    mapOrdDtls.put("sJobDesc", sJobDesc);
                    mapOrdDtls.put("sOrdStatus", "");


                    String sDeptShow = null;
                    String sCond = new String("");

                    System.out.println("order_list : 2222 : " + sOrdForDeptCd);

                    //sDept.replace('~', '&');

                    if (sOrdForDeptCd.equals("A")) {
                        sDeptShow = "ALL";
                    } else {
                        sDeptShow = sOrdForDeptCd;
                    }

                    if (!sOrdForDeptCd.equals("A")) {
                        sCond = sCond + " AND dept = '" + sOrdForDeptCd + "'";
                    }

                    System.out.println("order_list : 2222 : " + sOrdForDeptCd);

                    if (!sOrdTyp.equals("A")) {
                        sCond = sCond + " AND order_type = '" + sOrdTyp + "'";
                    }

                    //System.out.println("order_list : 4444");

                    /*if (!sOrdNo.equals("")) {
                    sCond = sCond + " AND 'BBGS/ORD/' || dept || DECODE(tc,'T','/TC','') || '/' || sl_no || DECODE(tc,'T','/'||tc_rev,'') LIKE '%" + sOrdNo + "%'";
                    } else {
                    sCond = sCond + " AND ord_dt BETWEEN TO_DATE('" + sStDt + "','DD-MON-RRRR') AND TO_DATE('" + sEndDt + "','DD-MON-RRRR')";
                    }*/

                    //System.out.println("order_list : 5555");



                    if (!sBudgHead.equals("")) {
                        sCond = sCond + " AND budget_head='" + sBudgHead + "'";
                    }

                    if (!sVndrNm.equals("")) {
                        sCond = sCond + " AND UPPER(vndr.vendor_name) LIKE UPPER('%" + sVndrNm + "%')";
                    }

                    sCond = sCond + " ORDER BY order_date ";


        %>

        <jsp:setProperty name="OrderBean" property="sDept" value="sDept"/>
        <jsp:setProperty name="OrderBean" property="sContractType" param="sContractType"/>
        <jsp:setProperty name="OrderBean" property="sStDt" param="sStDt"/>
        <jsp:setProperty name="OrderBean" property="sEndDt" param="sEndDt"/>
        <jsp:setProperty name="OrderBean" property="sOrdNo" param="sOrdNo"/>
        <jsp:setProperty name="OrderBean" property="sCont" param="sCont"/>
        <font size="6">
            <center>
                <!--font face="Times New Roman" size="4" color="mediumblue"><b>Order List : <sDeptShow></b></font-->
                <font face="Times New Roman" size="4" color="mediumblue"><b>Order&nbsp;List&nbsp;</b></font>
                <br>


                <center>
                    <table border="1" cellspacing="0" cellpadding="0">
                        <tr>
                            <td bgcolor="#FFFFFF" colspan="8" align="center"><font face="Times New Roman">Legend</font></td>
                        </tr>
                        <tr>
                            <td bgcolor="lightgreen">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td><font face="Times New Roman">Term Contract</font></td>
                            <td bgcolor="lightblue">&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td><font face="Times New Roman">Special Contract</font></td>
                            <td bgcolor="lightpink">&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td><font face="Times New Roman">Canceled Order</font></td>
                            <td bgcolor="ghostwhite">&nbsp;&nbsp;&nbsp; </td>
                            <td><font face="Times New Roman">One Time Order</font></td>
                        </tr>
                    </table>
                    <div id="div_img" style="visibility : visible">
                        <img src="Pics/Order/ajax-loader10.gif" width="30px" height="30px"/>
                    </div>

                </center>
                <table cellspacing="1" cellpadding="2" id="myScrollTable_1" width="950">
                    <thead>
                        <tr>
                            <th align="center"><b>Sl No</b></th>
                            <th align="center"><b>Order Number</b></th>
                            <th align="center"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></th>
                            <th align="center"><b>Contractor</b></th>
                            <th align="center"><b>Scope</b></th>
                            <th align="center"><b>Amount (Rs.)</b></th>
                            <th align="center"><b>No of Bills Released</b></th>
                            <th align="center" style = "border-right : 1px solid red ;"><b>Total Amount Paid(Rs.)</b></th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                                    //System.out.println("order_list : 1111");
                                    List lstOrdDtls = null;
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
                                    String sOrdId = new String();
                                    //String sOrdTyp = new String();
                                    String sOrdDt = new String();
                                    String sOrdVal = new String();
                                    String sOrdRmrk = new String();
                                    String sCancel = new String();
                                    String sColor = new String();

                                    String sTotBlAmt = new String();
                                    int iNoBlRelease = 0;

                                    int iCnt = 0;

                                    lstOrdDtls = hRemote.getOrdDtls(mapOrdDtls);
                                    iterateOuter = lstOrdDtls.iterator();

                                    while (iterateOuter.hasNext()) {
                                        iCnt++;
                                        rows = (List) iterateOuter.next();


                                        iterateInner = rows.iterator();
                                        while (iterateInner.hasNext()) {
                                            sOrdId = "" + ((BigDecimal) iterateInner.next()).intValue();
                                            sOrdTyp = (String) iterateInner.next();
                                            sOrdNo = (String) iterateInner.next();
                                            sOrdDt = (String) iterateInner.next();
                                            sOrdVal = (String) iterateInner.next();
                                            iterateInner.next();
                                            sOrdRmrk = (String) iterateInner.next();
                                            sCancel = (String) iterateInner.next();
                                            sVndrNm = (String) iterateInner.next();
                                            iterateInner.next();
                                            sTotBlAmt = (String) iterateInner.next();
                                            iNoBlRelease = ((BigDecimal) iterateInner.next()).intValue();
                                            //System.out.println(sOrdDt + "----" + iSlNo);

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

                                        if (sCancel.equals("Y")) {
                                            sColor = "lightpink";
                                        } else {
                                            if (sOrdTyp.equals("T")) {
                                                sColor = "lightgreen";
                                            } else if (sOrdTyp.equals("R")) {
                                                sColor = "lightblue";

                                            } else if (sOrdTyp.equals("O") || sOrdTyp.equals("C") || sOrdTyp.equals("L")) {
                                                sColor = "ghostwhite";
                                            }
                                        }


                        %>

                        <tr bgcolor = "<%=sColor%>" onMouseOver="window.event.srcElement.style.cursor='hand'" onclick="detail('<%=sOrdId%>')">
                            <td align="center" ><font face="Times New Roman"><%=iCnt%> </font></td>
                            <td align="center"><font face="Times New Roman"><b><%=sOrdNo%> </b></font></td>
                            <td align="center"><font face="Times New Roman"><%=sOrdDt%></font></td>
                            <td align="center"><font face="Times New Roman"><%=sVndrNm%> </font></td>
                            <td><font face="Times New Roman"><%=sOrdRmrk%> </font></td>
                            <td align="right" ><font face="Times New Roman"><%=sOrdVal%> </font></td>
                            <td  align="center"><font face="Times New Roman" ><%=iNoBlRelease%></font></td>
                            <td align="right" style = "border-right : 1px solid green ;"><font face="Times New Roman" ><%=sTotBlAmt%></font></td>
                        </tr>
                        <%
                                    }
                        %>
                    </tbody>
                </table>

            </center>

        </font>
        <form name="f1" id="f1" action="MaxNoBls_upd.jsp" method="post">
            <input type="hidden" id="sLoginStnCd" value="<%= sLoginStnCd%>">
            <input type="hidden" id="sLoginStnShrtNm" value="<%= sLoginStnShrtNm%>">
            <input type="hidden" id="sLoginStnLongNm" value="<%= sLoginStnLongNm%>">
            <input type="hidden" id="sLoginDeptCd" value="<%= sLoginDeptCd%>">
            <input type="hidden" id="sLoginDeptShrtNm" value="<%= sLoginDeptShrtNm%>">
            <input type="hidden" id="sLoginDeptLongNm" value="<%= sLoginDeptLongNm%>">
            <input type="hidden" id="sLoginEmpCd" value="<%= sLoginEmpCd%>">
            <input type="hidden" id="sLoginEmpNm" value="<%= sLoginEmpNm%>">
            <input type="hidden" id="sLoginEmpDesg" value="<%= sLoginEmpDesg%>">
            <input type="hidden" id="sLoginEmpLvl" value="<%= sLoginEmpLvl%>">
            <input type="hidden" id="sOrdId" value=""/>
            <input type="hidden" id="sOrdSts" value=""/>
            <input type="hidden" id="bOrdEntryPermit" value="false"/>
        </form>

        <script>
            var t = new ScrollableTable(document.getElementById('myScrollTable_1'), 400,950);
            document.getElementById("div_img").style.visibility = 'hidden';
            
            if(window.parent.sBackClick.value == '0')window.parent.sBack.value= window.parent.sBack.value + '6';
            window.parent.frames[1].document.getElementById("spanBack").firstChild.data='Back';
            window.parent.sBackClick.value = '0';
        
        </script>
    </body>
</html>
