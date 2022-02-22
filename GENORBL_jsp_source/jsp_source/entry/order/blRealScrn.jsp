<%-- 
    Document   : order_list
    Created on : Dec 7, 2012, 5:19:08 PM
    Author     : debasis saha
--%>

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
        <script language="javascript">
            function detail(qstr)
            {
                //alert(qstr);
                //var rslt=window.navigate("frame1.jsp?"+qstr,"detail","width=750,height=450,left=100,top=150");
                f1.sOrdId.value=qstr;
                f1.submit();
                //return 0;
            }

            function allowBlReal(){
                var sOrdIdSeq = "";
                for(i = 1 ; i <= sCnt.value ; i++)
                    if(document.getElementById("chk_" + i).checked == 1)
                        sOrdIdSeq +=  document.getElementById("chk_" + i).value + "|";
                //alert(sOrdIdSeq);

                var xmldiffrnciator = Math.floor(Math.random()*100000);
                var parameter = "sCallNm=blReal" ;
                parameter += "&sOrdIdSeq=" + sOrdIdSeq ;
                parameter += "&sLoginEmpCd=" + f1.sLoginEmpCd.value ;
                parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
                var url = "OrderProcessServlet?" + parameter ;
                var myval = new Object();
                //alert(url);
                var blRealXML ;
                try{
                    blRealXML = new ActiveXObject("Msxml2.XMLHTTP");
                }catch(e){
                    try{
                        blRealXML = new ActiveXObject("Microsoft.XMLHTTP");
                    }catch(e){
                        blRealXML = new XMLHttpRequest();
                    }
                }
                blRealXML.open('POST',url,true);
                blRealXML.send('');
                blRealXML.onreadystatechange = function(){
                    if(blRealXML.readyState == 4){
                        //alert(unitXML.responseText);
                        myval = blRealXML.responseXML.getElementsByTagName("RESULT");

                        if(myval[0].childNodes[0].nodeValue == 'Y'){
                            alert("Bill Release Successful ");
                            f1.submit();
                        }

                    }
                }
            }

        </script>
    </head>
    <body background="Pics/Order/lblue047.gif">
        <center><b><font face="Times New Roman" size="5" color="mediumblue">BILL&nbsp;&nbsp;&nbsp;RELEASE&nbsp;&nbsp;&nbsp;SCREEN</font></b></center>


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

                    /*System.out.println("blRealScrn : " + sLoginStnCd);
                    System.out.println(sLoginStnShrtNm);
                    System.out.println(sLoginStnLongNm);
                    System.out.println(sLoginDeptCd);
                    System.out.println(sLoginDeptShrtNm);
                    System.out.println(sLoginDeptLongNm);
                    System.out.println(sLoginEmpCd);
                    System.out.println(sLoginEmpNm);
                    System.out.println(sLoginEmpDesg);
                    System.out.println(sLoginEmpLvl);*/

        %>

        <font size="6">
            <center>
                <!--font face="Times New Roman" size="4" color="mediumblue"><b>Order List : <sDeptShow></b></font-->
                <br>

                <table cellspacing="1" cellpadding="2" id="myScrollTable_1" width="950">
                    <thead>
                        <tr>
                            <th align="center"><b>&nbsp;</b></th>
                            <th align="center"><b>Sl No</b></th>
                            <th align="center"><b>Order Number</b></th>
                            <th align="center"><b>Date</b></th>
                            <th align="center"><b>Contractor</b></th>
                            <th align="center"><b>Job Desc</b></th>
                            <th style = "border-right : 1px solid red ;" align="center"><b>Amount (Rs.)</b></th>
                        </tr>
                    </thead>
                    <tbody>

                        <%
                                    //System.out.println("order_list : 1111");
                                    List lstBlReal = null;
                                    List rows = null;
                                    Iterator iterateOuter = null;
                                    Iterator iterateInner = null;

                                    String sOrdId = new String();
                                    String sOrdTyp = new String();
                                    String sOrdNo = new String();
                                    String sOrdDt = new String();
                                    String sOrdVal = new String();
                                    String sOrdRmrk = new String();
                                    String sVndrNm = new String();
                                    String sColor = new String();

                                    int iCnt = 0;

                                    lstBlReal = hRemote.getBlReal(sLoginStnCd);
                                    iterateOuter = lstBlReal.iterator();

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
                                            sOrdRmrk = (String) iterateInner.next();
                                            sVndrNm = (String) iterateInner.next();

                                        }

                                        if (sOrdTyp.equals("T")) {
                                            sColor = "lightgreen";
                                        } else if (sOrdTyp.equals("R")) {
                                            sColor = "lightblue";

                                        } else if (sOrdTyp.equals("O") || sOrdTyp.equals("L")) {
                                            sColor = "ghostwhite";
                                        }


                        %>

                        <tr bgcolor = "<%=sColor%>" onMouseOver="window.event.srcElement.style.cursor='hand'" onclick="">
                            <td align="center"><input type="checkbox" id="chk_<%= iCnt%>" value="<%= sOrdId%>"/></td>
                            <td align="center" ><font face="Times New Roman"><%=iCnt%> </font></td>
                            <td align="center"><font face="Times New Roman"><b><%=sOrdNo%> </b></font></td>
                            <td align="center"><font face="Times New Roman"><%=sOrdDt%></font></td>
                            <td align="center"><font face="Times New Roman"><%=sVndrNm%> </font></td>
                            <td><font face="Times New Roman"><%=sOrdRmrk%> </font></td>
                            <td align="right" style = "border-right : 1px solid green ;"><font face="Times New Roman"><%=sOrdVal%> </font></td>
                        </tr>
                        <%
                                    }
                        %>

                    </tbody>
                </table>

                <br>

                <input type="button" value="Allow Bill Realase" name="butnAllowBlReal" onclick="allowBlReal();">

            </center>
        </font>


        <form name="f1" action="blRealScrn.jsp" method="post">
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
        </form>

        <script>
            var t = new ScrollableTable(document.getElementById('myScrollTable_1'), 200,950);

            if(window.parent.sBackClick.value == '0')window.parent.sBack.value= window.parent.sBack.value + '8';
            window.parent.frames[1].document.getElementById("spanBack").firstChild.data='Close';
            window.parent.sBackClick.value = '0';
        </script>

        <input type="hidden" name="sCnt" value="<%= iCnt%>">
    </body>
</html>
