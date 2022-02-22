<%-- 
    Document   : add_order
    Created on : Dec 17, 2012, 12:15:40 PM
    Author     : debasis saha
--%>
<%@page import="Order.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
            System.out.println("search_order.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                background : #ffdd00;
            }

            table tfoot tr {
                background : #ffffff;
            }

            table thead tr th{
                border-left   : 1pt solid red ;
                border-right   : 1pt solid red ;
                border-top : 1px solid red ;
                border-bottom : 1px solid red ;
            }

            table tfoot tr th{
                border-left : 1pt solid red ;
                border-top  : 1px solid red ;
            }

            table tbody tr td{
                border-left   : 1pt solid green ;
                border-right   : 1pt solid green ;
                border-top   : 1pt solid green ;
                border-bottom : 1pt solid green ;
            }

            .buttonActive{
                font-family      : Courier New ;
                font-size        : 12pt        ;
                font-weight      : bold        ;
                color            : #FFFFFF     ;
                background-color : #274F52     ;
                width            : 100px       ;
                border-style     : outset
            }

            .buttonInactive{
                font-family      : Courier New ;
                font-size        : 12pt        ;
                font-weight      : bold        ;
                color            : #FFFFFF     ;
                background-color : #CDCDCD     ;
                width            : 100px       ;
                border-style     : outset
            }


        </style>
    </head>
    <body background="Pics/Order/religious-ppt-background.jpg">
        <jsp:useBean id="loginBean" class="VO.LoginBean" scope="session"/>
        <jsp:useBean id="orderBean" class="VO.OrderBean" scope="session"/>
        <%

                    String sOrdBy = request.getParameter("sOrdBy");
                    String sOrdByNm = request.getParameter("sOrdByNm");
                    String sLoginStn = request.getParameter("sLoginStn");
                    String sLoginStnNm = request.getParameter("sLoginStnNm");
                    String sLoginDept = request.getParameter("sLoginDept");

                    System.out.println("sLoginStnNm : " + sLoginStnNm);


        %>
        <form name="f2" action="frame1.jsp" method="post" style="border-collapse : collapse">
            <%
                        if (!sLoginStn.equals("019") && !sLoginStn.equals("042")) {
            %>
            <input type="hidden" name="sOrdStn" value=""/>
            <%                            }
            %>
            <!--input type="hidden" name="last_rev_no" value="<=last_rev_no>"/>
            <input type="hidden" name="sl_no" value="<=sl_no>"/>
            <input type="hidden" name="last_ord_dt" value="<=last_ord_dt>"/-->
            <input type="hidden" name="sLoginStn" value="<%=sLoginStn%>"/>
            <input type="hidden" name="sLoginStnNm" value="<%=sLoginStnNm%>"/>
            <input type="hidden" name="sOrdBy" value="<%=sOrdBy%>"/>
            <input type="hidden" name="sOrdByNm" value="<%=sOrdByNm%>"/>
            <center>
                <table cellspacing="1" cellpadding="2" class="table" id="myScrollTable_1" width="80%" style="border-collapse: collapse">
                    <thead>
                        <tr>
                            <th colspan="4" align="center">
                                <font face="Times New Roman" size="4"><b>Add A New Order</b></font>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <font face="Times New Roman" color="#0080FF" size="3"><b>Login Station</b></font>
                            </td>
                            <td>
                                <font face="Times New Roman" color="red" size="3"><b><i><%= sLoginStnNm%></i></b></font>
                            </td>
                            <td>
                                <font face="Times New Roman" color="#0080FF" size="3"><b>Login Dept</b></font>
                            </td>
                            <td>
                                <font face="Times New Roman" color="red" size="3"><b><i><%= sLoginDept%></i></b></font>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font face="Times New Roman" color="#0080FF" size="3"><b>Order Station</b></font>
                            </td>
                            <%

                                        if (sLoginStn.equals("019") || sLoginStn.equals("042")) {

                            %>
                            <td colspan="1" height="38" bgcolor="#FFFFFF">
                                <b><font face="Times New Roman" color="#FFFFFF">
                                        <select name="sOrdStn" size="1">
                                            <option value="016">BBGS</option>
                                            <option value="019">CTM</option>
                                            <option value="042">EDGE</option>
                                            <option value="013">NCGS</option>
                                            <option value="002">SGS</option>
                                            <option value="014">TGS</option>
                                        </select>
                                    </font></b>
                            </td>

                            <%                                    } else {

                            %>
                            <td>
                                <font face="Times New Roman" color="red" size="3"><b><i><%= sLoginStnNm%></i></b></font>
                            </td>
                            <%
                                        }
                            %>
                            <td>
                                <font face="Times New Roman" color="#0080FF" size="3"><b>Order Dept</b></font>
                            </td>
                            <td bgcolor="#FFFFFF">
                                <font color="#FFFFFF">
                                    <select name="sOrdDept" size="1">
                                        <%
                                                    List lstOrdDept = null;
                                                    List rows = null;
                                                    Iterator iterateOuter = null;
                                                    Iterator iterateInner = null;
                                                    String sOrdDeptCd = null;
                                                    String sOrdDeptDesc = null;
                                                    lstOrdDept = hRemote.getOrdDept(sLoginStn, sLoginDept);
                                                    iterateOuter = lstOrdDept.iterator();

                                                    while (iterateOuter.hasNext()) {
                                                        rows = (List) iterateOuter.next();

                                                        iterateInner = rows.iterator();
                                                        while (iterateInner.hasNext()) {
                                                            sOrdDeptCd = (String) iterateInner.next();
                                                            sOrdDeptDesc = (String) iterateInner.next();

                                        %>
                                        <option value="<%= sOrdDeptCd%>"><%= sOrdDeptDesc%></option>

                                        <%
                                                        }
                                                    }
                                        %>

                                    </select>
                                </font>
                            </td>

                        </tr>
                        <tr>
                            <td>
                                <font face="Times New Roman" color="#0080FF" size="3"><b>Job Nature</b></font>
                            </td>               
                            <td colspan="1" height="38" bgcolor="#FFFFFF">
                                <b><font face="Times New Roman" color="#FFFFFF">
                                        <select name="sJobTyp" size="1">
                                            <option selected value="M">Maintenance</option>
                                            <option value="O">Operational</option>
                                        </select>
                                    </font></b>
                            </td>
                            <td>
                                <font face="Times New Roman" color="#0080FF" size="3"><b>Unit</b></font>
                            </td>
                            <td height="38" bgcolor="#FFFFFF">
                                <select name="sUnit" size="1">
                                    <option value="1">1&amp;2 only</option>
                                    <option value="2">3 only</option>
                                    <option value="3">Common</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <font face="Times New Roman" color="#0080FF" size="3"><b>Order Type</b></font>
                            </td>
                            <td colspan="3" bgcolor="#FFFFFF">
                                <font color="#FFFFFF">
                                    <select name="sOrdTyp" size="1" onchange="">
                                        <option value="O">One Time</option>
                                        <option value="T">Term Contract</option>
                                        <option value="R">Special Contract</option>
                                        <option value="C">Capex</option>
                                    </select>
                                </font>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center" >
                                <input type="submit" name="sumtAddOrder" value="Add New Order" class="buttonActive" style="width : 180px"/>
                            </td>
                        </tr>
                </table>
            </center>
        </form>
        <script>

            f2.sOrdStn.value="<%= sLoginStn%>"

        </script>
    </body>
</html>
