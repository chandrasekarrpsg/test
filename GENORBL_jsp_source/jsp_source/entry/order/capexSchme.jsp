<%--
    Document   : contractor_list
    Created on : Dec 5, 2012, 4:37:14 PM
    Author     : debasis saha
--%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Order.*"%>
<%@page import="javax.naming.InitialContext"%>
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
            System.out.println("capexSchme.jsp can't be initialsed for " + e.getMessage());
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

        <script LANGUAGE="javascript">

            var sCall = "";
            function rollon(j){
                window.event.srcElement.style.cursor="hand"
                eval("tr"+j+".style.backgroundColor=\"yellow\"")
                eval("trh.value=tr"+j+".offsetHeight")
                eval("tr"+j+".height=30")
            }
            function rollout(j){
                eval("tr"+j+".style.backgroundColor=\"lavender\"")
                eval("tr"+j+".height=trh.value")
            }

            function rowclick(x,y){
                /*var z=x+"~"+y
                window.returnValue=z;
                window.close();*/
                sCall = "row";
                var o = new Object();
                o.frstParam = x;
                o.secondParam = y;
                window.returnValue=o;
                window.close();
            }


            function search_onclick(){
                sCall = "search";
                /*window.close();
                lnknav.href=location.href
                lnknav.search="?p=<=p>&sSrchStr=" + search_str.value
                lnknav.click()
                window.open("contractor_list.jsp?p=a&sSrchStr="+search_str.value,"_self");*/
                //location.href="contractor_list.jsp?p=a&sSrchStr="+search_str.value;
                var o = new Object();
                o.frstParam = "recall";
                o.secondParam = sSrchStr.value;
                //window.returnValue="recall"+"~"+search_str.value;
                window.returnValue=o;
                window.close();
                
            }

            function terminate()
            {
                if(sCall != "row" && sCall != "search"){
                    var o = new Object();
                    o.frstParam = "close";
                    o.secondParam = "";
                    window.returnValue = o;
                }
            }

        </script>
    </head>

    <body  text="#000000" bgcolor="#FFFFFF" onbeforeunload="terminate();">
        <%
                    String sOrdForStnCd = request.getParameter("sOrdForStnCd");
                    String sSrchStr = request.getParameter("sSrchStr");
        %>
        <center>
            <input type="hidden" name="sOrdForStnCd" value="<%=sOrdForStnCd %>"/>
            <table  width="100%" border="1" bgcolor="lavender" cellspacing="0" cellpadding="0" bordercolor="#002851" bordercolorlight="#C0C0C0" bordercolordark="#002851">

                <tr align="center"  id="jj" bgcolor="ghostwhite">
                    <td align="center" nowrap colspan="2">
                        <font face="Times New Roman" color="#0000FF" size="3">
                            <input type="text" id="search_str" name = "sSrchStr" value="<%= sSrchStr %>"/>&nbsp;&nbsp;&nbsp;
                            <a id="lnknav" href="#" onclick="search_onclick()">Search</a>

                        </font></td>
                </tr>
                <tr align="center"  id="jj" bgcolor="ghostwhite">
                    <td align="center" nowrap><font face="Times New Roman" color="#0000FF" size="3"><strong>Capex Scheme No</strong></font></td>
                    <td align="center" nowrap><font face="Times New Roman" color="#0000FF" size="3"><strong>Scheme Description</strong></font></td>
                </tr>

                <%

                            List lstCapexSchme = null;
                            List rows = null;
                            Iterator iterateOuter = null;
                            Iterator iterateInner = null;

                            String sCapexSchmeNo = new String();
                            String sCapexSchmeDesc = new String();


                            lstCapexSchme = hRemote.getCapexSchme(sOrdForStnCd, sSrchStr);
                            iterateOuter = lstCapexSchme.iterator();
                            int i = 0;
                            while (iterateOuter.hasNext()) {
                                i++;
                                rows = (List) iterateOuter.next();

                                iterateInner = rows.iterator();
                                while (iterateInner.hasNext()) {
                                    sCapexSchmeNo = (String) iterateInner.next();
                                    sCapexSchmeDesc = (String) iterateInner.next();%>

                <tr  id="tr<%= i%>" onmouseover="rollon(<%=i%>)" onmouseout="rollout(<%=i%>)"  onclick="return rowclick('<%=sCapexSchmeNo%>','<%=sCapexSchmeDesc%>')">
                    <td  id="td1<%=i%>" align="center"><font face="Times New Roman" color="black" size="3"><%=sCapexSchmeNo%>&nbsp;</font></td>
                    <td id="td2<%=i%>" align="left"><font face="Times New Roman" color="black" size="3"><%=sCapexSchmeDesc%></font></td>
                </tr>

                <% }
                            }%>



            </table>
            <INPUT type="hidden" name="trh">
        </center>
    </body>

</html>
