<%--
    Document   : contractor_list
    Created on : Dec 5, 2012, 4:37:14 PM
    Author     : debasis saha
--%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Order.OrderProcessBeanRemote"%>
<%@page import="javax.naming.InitialContext"%>
<%!    OrderProcessBeanRemote hRemote = null;
    //htmaNewRemote hRemote1 = null ;
    InitialContext ic = null;

    public void jspInit() {
        try {
            ic = new InitialContext();
            hRemote = (OrderProcessBeanRemote) ic.lookup("java:comp/env/OrderProcessBeanRemote");
            //hRemote = (OrderProcessBeanRemote) ic.lookup("Order.OrderProcessBeanRemote");
            //hRemote = (OrderProcessBeanRemote) ic.lookup("ejb/OrderProcessBean");
            //hRemote1 = (htmaNewRemote)ic.lookup(htmaNewRemote.class.getName());
        } catch (Exception e) {
            System.out.println("contractor_list.jsp can't be initialsed for " + e.getMessage());
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
                eval("tr_"+j+".style.backgroundColor=\"yellow\"")
                //eval("trh.value=tr_"+j+".offsetHeight")
                //eval("tr_"+j+".height=30")
                //eval("td_"+j+"_"+"3"+".style.backgroundColor=\"yellow\"")
                
                //if(iCnt.value - j >= 4){
                document.getElementById("td_"+j+"_2").innerHTML='<font face="Times New Roman" color="black" size="2">'+sVndrAddr_1[j]+'</font>';
                eval("td_"+(j+1)+"_"+"2"+".style.backgroundColor=\"yellow\"")
                document.getElementById("td_"+(j+1)+"_2").innerHTML='<font face="Times New Roman" color="black" size="2">'+sVndrAddr_2[j]+'</font>';
                eval("td_"+(j+2)+"_"+"2"+".style.backgroundColor=\"yellow\"")
                document.getElementById("td_"+(j+2)+"_2").innerHTML='<font face="Times New Roman" color="black" size="2">'+sVndrAddr_3[j]+'</font>';
                eval("td_"+(j+3)+"_"+"2"+".style.backgroundColor=\"yellow\"")
                document.getElementById("td_"+(j+3)+"_2").innerHTML='<font face="Times New Roman" color="black" size="2">'+sVndrAddr_4[j]+'</font>';
                eval("td_"+(j+4)+"_"+"2"+".style.backgroundColor=\"yellow\"")
                document.getElementById("td_"+(j+4)+"_2").innerHTML='<font face="Times New Roman" color="black" size="2">'+sVndrAddr_5[j]+'</font>';;
                /*}else{
                    eval("td_"+(j-4)+"_"+"2"+".style.backgroundColor=\"yellow\"")
                    document.getElementById("td_"+(j-4)+"_2").innerHTML=sVndrAddr_1[j];
                    eval("td_"+(j-3)+"_"+"2"+".style.backgroundColor=\"yellow\"")
                    document.getElementById("td_"+(j-3)+"_2").innerHTML=sVndrAddr_2[j];
                    eval("td_"+(j-2)+"_"+"2"+".style.backgroundColor=\"yellow\"")
                    document.getElementById("td_"+(j-2)+"_2").innerHTML=sVndrAddr_3[j];
                    eval("td_"+(j-1)+"_"+"2"+".style.backgroundColor=\"yellow\"")
                    document.getElementById("td_"+(j-1)+"_2").innerHTML=sVndrAddr_4[j];
                    eval("td_"+j+"_"+"2"+".style.backgroundColor=\"yellow\"")
                    document.getElementById("td_"+j+"_2").innerHTML=sVndrAddr_5[j];
                }*/
            }
            function rollout(j){
                eval("tr_"+j+".style.backgroundColor=\"lavender\"")
                //eval("tr_"+j+".height=trh.value")
                //if(iCnt.value - j >= 4){
                document.getElementById("td_"+j+"_2").innerHTML="&nbsp;";
                eval("td_"+(j+1)+"_"+"2"+".style.backgroundColor=\"lavender\"")
                document.getElementById("td_"+(j+1)+"_2").innerHTML="&nbsp;";
                eval("td_"+(j+2)+"_"+"2"+".style.backgroundColor=\"lavender\"")
                document.getElementById("td_"+(j+2)+"_2").innerHTML="&nbsp;";
                eval("td_"+(j+3)+"_"+"2"+".style.backgroundColor=\"lavender\"")
                document.getElementById("td_"+(j+3)+"_2").innerHTML="&nbsp;";
                eval("td_"+(j+4)+"_"+"2"+".style.backgroundColor=\"lavender\"")
                document.getElementById("td_"+(j+4)+"_2").innerHTML="&nbsp;";
                /*}else{
                    eval("td_"+(j-4)+"_"+"3"+".style.backgroundColor=\"lavender\"")
                    document.getElementById("td_"+(j-4)+"_3").innerHTML="&nbsp;";
                    eval("td_"+(j-3)+"_"+"3"+".style.backgroundColor=\"lavender\"")
                    document.getElementById("td_"+(j-3)+"_3").innerHTML="&nbsp;";
                    eval("td_"+(j-2)+"_"+"3"+".style.backgroundColor=\"lavender\"")
                    document.getElementById("td_"+(j-2)+"_3").innerHTML="&nbsp;";
                    eval("td_"+(j-1)+"_"+"3"+".style.backgroundColor=\"lavender\"")
                    document.getElementById("td_"+(j-1)+"_3").innerHTML="&nbsp;";
                    eval("td_"+j+"_"+"3"+".style.backgroundColor=\"lavender\"")
                    document.getElementById("td_"+j+"_3").innerHTML="&nbsp;";
                }*/
            }

            function rowclick(x,y,z){
                /*var z=x+"~"+y
                window.returnValue=z;
                window.close();*/
                sCall = "row";
                var o = new Object();
                o.frstParam = x;
                o.secondParam = y;
                o.thirdParam = z;
                //alert(sVndrAddr_1[rowNo])
                //alert(sVndrAddr_2[rowNo])
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
                o.secondParam = search_str.value;
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


            function getVndrConf(x,y,z){ 

                var xmldiffrnciator = Math.floor(Math.random()*100000);
                var parameter = "sCallNm=ordUpdConf" ;
                parameter += "&sVndrCd="+x ;
                parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
                var url = "OrderProcessServlet?" + parameter ;
                var myval = new Object();
                //alert(url);
                var ordUpdConfXML ;
                try{
                    ordUpdConfXML = new ActiveXObject("Msxml2.XMLHTTP");
                }catch(e){
                    try{
                        ordUpdConfXML = new ActiveXObject("Microsoft.XMLHTTP");
                    }catch(e){
                        ordUpdConfXML = new XMLHttpRequest();
                    }
                }
                ordUpdConfXML.open('POST',url,true);
                ordUpdConfXML.send('');
                ordUpdConfXML.onreadystatechange = function(){
                    if(ordUpdConfXML.readyState == 4){
                        //alert(ordUpdConfXML.responseText);
                        myval = ordUpdConfXML.responseXML.getElementsByTagName("CONF");

                        var cell = myval[0].childNodes[0].nodeValue;
                    
                        if(cell == 'Y'){
                            rowclick(x,y,z)
                        }else{
                            flag = confirm('First time order for this vendor in the Present System.Please check Vendor Name & Address');

                            if(flag == true){
                                rowclick(x,y,z)
                            }
                        }
                    
                    }
                }
            }

        </script>
    </head>

    <body  text="#000000" bgcolor="#FFFFFF" onbeforeunload="terminate();">
        <script>
            var sVndrAddr_1 = new Array();
            var sVndrAddr_2 = new Array();
            var sVndrAddr_3 = new Array();
            var sVndrAddr_4 = new Array();
            var sVndrAddr_5 = new Array();
            var sVndrAddr_6 = new Array();
        </script>
        <center>
            <table  width="90%" border="0" style = "border : 1pt solid red ; border-collapse : collapse" bgcolor="lavender" cellspacing="0" cellpadding="0" bordercolor="#002851" bordercolorlight="#C0C0C0" bordercolordark="#002851">

                <tr align="center"  id="jj" bgcolor="ghostwhite">
                    <td align="center" nowrap colspan="3">
                        <font face="Times New Roman" color="#0000FF" size="3">
                            <input type="text" id="search_str"/>&nbsp;&nbsp;&nbsp;
                            <a id="lnknav" href="#" onclick="search_onclick()">Search</a>

                        </font></td>
                </tr>
                <tr align="center"  id="jj" bgcolor="ghostwhite">
                    <!--td align="center" nowrap style = "border : 1pt solid red"><font face="Times New Roman" color="#0000FF" size="3"><strong>ID</strong></font></td-->
                    <td align="center" nowrap style = "border : 1pt solid red"><font face="Times New Roman" color="#0000FF" size="3"><strong>Name</strong></font></td>
                    <td align="center" nowrap style = "border : 1pt solid red"><font face="Times New Roman" color="#0000FF" size="3"><strong>Address</strong></font></td>
                </tr>

                <%
                            String sVndrNmLike = request.getParameter("sVndrNmLike");
                            List lstVndrDtls = null;
                            List rows = null;
                            Iterator iterateOuter = null;
                            Iterator iterateInner = null;
                            String sVndrCd = new String();
                            String sVndrNm = new String();
                            String sWageLiab = new String();
                            String sVndrGstNo = new String();

                            lstVndrDtls = hRemote.getVndrDtls_2(sVndrNmLike);
                            iterateOuter = lstVndrDtls.iterator();
                            int i = 0;
                            while (iterateOuter.hasNext()) {
                                i++;
                                rows = (List) iterateOuter.next();

                                iterateInner = rows.iterator();
                                while (iterateInner.hasNext()) {
                                    sVndrCd = "" + ((BigDecimal) iterateInner.next()).intValue();
                                    sVndrNm = (String) iterateInner.next();%>

                <script>

                    sVndrAddr_1[<%= i%>] = "<%= (String) iterateInner.next()%>"
                    sVndrAddr_2[<%= i%>] = "<%= (String) iterateInner.next()%>"
                    sVndrAddr_3[<%= i%>] = "<%= (String) iterateInner.next()%>"
                    sVndrAddr_4[<%= i%>] = "<%= (String) iterateInner.next()%>"
                    sVndrAddr_5[<%= i%>] = "<%= (String) iterateInner.next()%>"

                </script>

                <%
                                                    sWageLiab = (String) iterateInner.next();
                %>
                <script>
                    sVndrAddr_6[<%= i%>] = "<%= (String) iterateInner.next()%>"
                </script>

                <tr  id="tr_<%= i%>" onmouseout="rollout(<%=i%>)" onmouseover="rollon(<%=i%>)" onclick="rowclick('<%=sVndrCd%>','<%=sVndrNm%>','<%=sWageLiab%>')">
                    <!--td  id="td_<%=i%>_1" align="center" width="10%"><font face="Times New Roman" color="black" size="3"><%=sVndrCd%>&nbsp;</font></td-->
                    <td id="td_<%=i%>_1" align="left" width="40%"><font face="Times New Roman" color="black" size="2">&nbsp;&nbsp;&nbsp;<%=sVndrNm%></font></td>
                    <td id="td_<%=i%>_2" align="left" width="60%"><font face="Times New Roman" color="black" size="2">&nbsp;</font></td>
                </tr>

                <% }
                            }%>
                <tr  id="tr_<%= i + 1%>">
                    <td  id="td_<%=i + 1%>_1">&nbsp;</td>
                    <td  id="td_<%=i + 1%>_2">&nbsp;</td>
                </tr>
                <tr  id="tr_<%= i + 2%>">
                    <td  id="td_<%=i + 2%>_1">&nbsp;</td>
                    <td  id="td_<%=i + 2%>_2">&nbsp;</td>
                </tr>
                <tr  id="tr_<%= i + 3%>">
                    <td  id="td_<%=i + 3%>_1">&nbsp;</td>
                    <td  id="td_<%=i + 3%>_2">&nbsp;</td>
                </tr>
                <tr  id="tr_<%= i + 4%>">
                    <td  id="td_<%=i + 4%>_1">&nbsp;</td>
                    <td  id="td_<%=i + 4%>_2">&nbsp;</td>
                </tr>


            </table>
            <INPUT type="hidden" name="trh">
            <INPUT type="hidden" name="iCnt" value="<%= i + 4%>">
        </center>
    </body>

</html>