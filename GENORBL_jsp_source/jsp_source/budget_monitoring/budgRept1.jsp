<%-- 
    Document   : budgRept2
    Created on : Jun 18, 2013, 6:12:59 PM
    Author     : debasis saha
--%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Budget.*"%>
<%@page import="javax.naming.InitialContext"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

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
            System.out.println("budgRep2.jsp can't be initialsed for " + e.getMessage());
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
                /*border-left   : 1pt solid green ;
                border-bottom : 1pt solid green ;*/
            }


        </style>
        <script type = "text/javascript" src = "js/scrollabletable.js"></script>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/animatedcollapse.js"></script>

        <script>
         
            function clickImg(obj){
                var imgNm = obj.src.substring(obj.src.lastIndexOf('/')+1,obj.src.length);
                //if(obj.name=='imgOrdRmrk' || obj.name=='imgAnnex' || obj.name=='imgCancel_2' || obj.name=='imgRecommendNote'){
                if(imgNm ==  'plus_1.png'){
                    //alert('div'+obj.name.substring(3));
                    animatedcollapse.show('div'+obj.name.substring(3));
                    obj.src =  'Pics/Order/minus_1.png'
                }else if(imgNm == 'minus_1.png'){
                    animatedcollapse.hide('div'+obj.name.substring(3));
                    obj.src =  'Pics/Order/plus_1.png'
                }
                /*}else if(obj.name=='imgVndrDtls_3'){
                if(imgNm ==  'plus_1.png'){
                    //alert('div'+obj.name.substring(3)+'1');
                    animatedcollapse.show('div'+obj.name.substring(3)+'1'); 
                    obj.src =  'Pics/Order/minus_1.png'
                }else if(imgNm == 'minus_1.png'){
                    animatedcollapse.hide('div'+obj.name.substring(3)+'1'); 
                    obj.src =  'Pics/Order/plus_1.png'
                }
            }*/
                return true ;
            }

            function getDtls(sMtdYtd,sFinYr,sMon,sMontr,sStn,sGrp){

                form_2.sMtdYtd.value = sMtdYtd;
                form_2.sFinYr.value = sFinYr; 
                form_2.sMon.value = sMon;
                form_2.sMontr.value = sMontr;
                form_2.sStn.value = sStn;
                form_2.sGrp.value = sGrp;


                form_2.submit();

                return true;
            }

            
        </script>
    </head>
    <body onload="if(i == 1){animatedcollapse.hide('div_img')}">

        <%

                    String sFinYr = request.getParameter("sFinYr");
                    String sMon = request.getParameter("sMon");
                    String sMontr = request.getParameter("sMontr");
                    String sStn = request.getParameter("sStn");
                    String compare = request.getParameter("compare");
                    String month = request.getParameter("month");
                    String finyr = request.getParameter("finyr");
                    String empcd = request.getParameter("empcd");

        %>
        <center>
            <font face="Times New Roman" size="4" color="mediumblue"><b></b></font>
            <br>
            <form name="form_1" action = "budgRept2.jsp" method="post" target="_self">
                <div style="background-color : #deffdd">
                    <table>
                        <tr>
                            <td width="25%" align="left">Station-&gt;Group
                            </td>
                            <td width="25%" align="left">Finance&nbsp;Year&nbsp;:&nbsp;
                                <select name="sFinYr">

                                    <%
                                                List lstFinYr = null;
                                                List rows = null;
                                                Iterator iterateOuter = null;
                                                Iterator iterateInner = null;
                                                String sFinYrFrm = null;
                                                String sFinYrFrmTo = null;
                                                lstFinYr = hRemote.getFinYr();
                                                iterateOuter = lstFinYr.iterator();

                                                while (iterateOuter.hasNext()) {
                                                    rows = (List) iterateOuter.next();
                                                    iterateInner = rows.iterator();
                                                    while (iterateInner.hasNext()) {
                                                        sFinYrFrm = (String) iterateInner.next();
                                                        sFinYrFrmTo = (String) iterateInner.next();

                                                    }%>
                                    <option value = "<%=sFinYrFrm%>"><%= sFinYrFrmTo%></option>
                                    <% }
                                    %>

                                </select>
                            </td>
                            <td width="25%" align="left">Month&nbsp;:&nbsp;
                                <select name="sMon">
                                    <option value="1">Jan</option>
                                    <option value="2">Feb</option>
                                    <option value="3">Mar</option>
                                    <option value="4">Apr</option>
                                    <option value="5">May</option>
                                    <option value="6">Jun</option>
                                    <option value="7">Jul</option>
                                    <option value="8">Aug</option>
                                    <option value="9">Sep</option>
                                    <option value="10">Oct</option>
                                    <option value="11">Nov</option>
                                    <option value="12">Dec</option>
                                </select>
                            </td>
                            <td width="25%" align="left">
                                <input type="button" value="BACK" onclick="location.href='bgtm_repo1_report.jsp?finyr=<%= finyr%>&month=<%= month%>&compare=<%= compare%>&mon_basis=<%= sMontr%>&empcd=<%= empcd%>'"/>
                            </td>
                        </tr>

                        <tr>
                            <td>Monitoring&nbsp;on&nbsp;the&nbsp;basis&nbsp;of
                            </td>
                            <td><input type="radio" name="sMontr" value="1" />Bill&nbsp;Release&nbsp;date&nbsp;By&nbsp;Stn./Dept
                            </td>
                            <td><input type="radio" name="sMontr" value="2" />Bill&nbsp;Received&nbsp;date&nbsp;By&nbsp;Finance&nbsp;Dept.
                            </td>
                            <td></td>
                        </tr>

                    </table>
                </div>
            </form>
            <%

                        System.out.println("1111 : " + sMontr);

                        if (sMontr == null) {

            %>

            <script>
                form_1.sMontr[0].checked = 1;
                i=0;

            </script>

            <%            }

                        if (sFinYr != null) {

            %>

            <script>
                form_1.sFinYr.value = "<%= sFinYr%>"
                form_1.sMon.value = "<%= sMon%>"

                <%

                                            if (sMontr.equals("1")) {
                %>
                    form_1.sMontr[0].checked = 1;
                <%         } else {
                %>
                    form_1.sMontr[1].checked = 1;

                <%                                    }
                %>
            </script>

            <div id="div_img" style="">
                <center><img src="Pics/Order/ajax-loader10.gif" /></center>
            </div>

            <table cellspacing="1" cellpadding="2" id="myScrollTable_1" width="880"><!--  1start-->
                <thead><!--  1start-->
                    <tr>
                        <td></td>
                        <td>Station</td>
                        <td>Mtd&nbsp;Budget</td>
                        <td>Mtd&nbsp;Actual</td>
                        <td>Deviation</td>
                        <td>MTD&nbsp;Dev.(%)</td>
                        <td>YTD&nbsp;Budget</td>
                        <td>YTD&nbsp;Actual</td>
                        <td>Deviation</td>
                        <td>YTD&nbsp;Dev.(%)</td>
                    </tr>
                </thead><!--  1end-->
                <tbody><!--  1start-->

                    <%
                                                //System.out.println("order_list : 1111");
                                                List lstOneStnSumm_1 = null;
                                                List lstOneStnAllGrpSumm_1 = null;
                                                List lstOneStnPerGrpOneMnthSumm_1 = null;
                                                //List rows = null;
                                                //Iterator iterateOuter = null;
                                                //Iterator iterateInner = null;
                                                Iterator iterateOuter_2 = null;
                                                Iterator iterateInner_2 = null;
                                                Iterator iterateOuter_3 = null;
                                                Iterator iterateInner_3 = null;
                                                Iterator iterateOuter_4 = null;
                                                Iterator iterateInner_4 = null;

                                                //String sStn = new String();
                                                String sDept = new String();
                                                String sGrp = new String();
                                                String sTmpMon = new String();
                                                String sMmOrd = new String();
                                                String sMTDBudg = new String();
                                                String sYTDBudg = new String();
                                                String sMTDAct = new String();
                                                String sYTDAct = new String();
                                                String sMTDAbsDev = new String();
                                                String sMTDAbsDevPctg = new String();
                                                String sYTDAbsDev = new String();
                                                String sYTDAbsDevPctg = new String();


                                                lstOneStnSumm_1 = hRemote.getOneStnSumm_1(sFinYr, sMon, sMontr,compare, sStn);


                                                iterateOuter = lstOneStnSumm_1.iterator();
                                                int i = 0;
                                                while (iterateOuter.hasNext()) {
                                                    rows = (List) iterateOuter.next();
                                                    iterateInner = rows.iterator();
                                                    while (iterateInner.hasNext()) {
                                                        sStn = (String) iterateInner.next();
                                                        sMTDBudg = (String) iterateInner.next();
                                                        sYTDBudg = (String) iterateInner.next();
                                                        sMTDAct = (String) iterateInner.next();
                                                        sYTDAct = (String) iterateInner.next();
                                                        sMTDAbsDev = (String) iterateInner.next();
                                                        sMTDAbsDevPctg = (String) iterateInner.next();
                                                        sYTDAbsDev = (String) iterateInner.next();
                                                        sYTDAbsDevPctg = (String) iterateInner.next();
                                                    }
                                                    i++;
                                                    if (i % 2 == 0) {
                    %>
                    <tr bgcolor="#eafc42">
                        <%                                                            } else {
                        %>
                    <tr bgcolor="#e4d437">
                        <%                                                            }
                        %>
                        <td><img name="img<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%>" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/></td>
                        <td><%= sStn%></td>
                        <td><%= sMTDBudg%></td>
                        <td><a href="#" onclick="getDtls('mtd','<%= sFinYr%>','<%= sMon%>','<%= sMontr%>','<%= sStn%>','')"><%= sMTDAct%></a></td>
                        <td><%= sMTDAbsDev%></td>
                        <td><%= sMTDAbsDevPctg%></td>
                        <td><%= sYTDBudg%></td>
                        <td><a href="#" onclick="getDtls('ytd','<%= sFinYr%>','<%= sMon%>','<%= sMontr%>','<%= sStn%>','')"><%= sYTDAct%></a></td>
                        <td><%= sYTDAbsDev%></td>
                        <td><%= sYTDAbsDevPctg%></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td colspan="9">
                            <div id='div<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%>' style="display : none"><!--  2start-->
                                <table cellspacing="1" cellpadding="2" id="myScrollTable_1" width="880"><!--  3start-->
                                    <thead><!--  3start-->
                                        <tr>
                                            <td></td>
                                            <td>Group</td>
                                            <td>Mtd&nbsp;Budget</td>
                                            <td>Mtd&nbsp;Actual</td>
                                            <td>Deviation</td>
                                            <td>MTD&nbsp;Dev.(%)</td>
                                            <td>YTD&nbsp;Budget</td>
                                            <td>YTD&nbsp;Actual</td>
                                            <td>Deviation</td>
                                            <td>YTD&nbsp;Dev.(%)</td>
                                        </tr>
                                    </thead><!--  3end-->
                                    <tbody><!--  3start-->
                                        <%
                                                                                            lstOneStnAllGrpSumm_1 = hRemote.getOneStnAllGrpSumm_1(sFinYr, sMon, sMontr,compare, sStn);
                                                                                            iterateOuter_3 = lstOneStnAllGrpSumm_1.iterator();
                                                                                            int k = 0;
                                                                                            while (iterateOuter_3.hasNext()) {
                                                                                                rows = (List) iterateOuter_3.next();
                                                                                                iterateInner_3 = rows.iterator();
                                                                                                while (iterateInner_3.hasNext()) {
                                                                                                    sGrp = (String) iterateInner_3.next();
                                                                                                    sMTDBudg = (String) iterateInner_3.next();
                                                                                                    sYTDBudg = (String) iterateInner_3.next();
                                                                                                    sMTDAct = (String) iterateInner_3.next();
                                                                                                    sYTDAct = (String) iterateInner_3.next();
                                                                                                    sMTDAbsDev = (String) iterateInner_3.next();
                                                                                                    sMTDAbsDevPctg = (String) iterateInner_3.next();
                                                                                                    sYTDAbsDev = (String) iterateInner_3.next();
                                                                                                    sYTDAbsDevPctg = (String) iterateInner_3.next();
                                                                                                }
                                                                                                k++;
                                                                                                if (k % 2 == 0) {

                                        %>
                                        <tr bgcolor="#f5bb3d">
                                            <%                                                                                                                                                                                                            } else {
                                            %>
                                        <tr bgcolor="#e6e2da">
                                            <%                                                                                                                                                                                                             }
                                            %>
                                            <td><img name="img<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%><%= sGrp.substring(0, 1)%>" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/></td>
                                            <td><%= sGrp%></td>
                                            <td><%= sMTDBudg%></td>
                                            <td><a href="#" onclick="getDtls('mtd','<%= sFinYr%>','<%= sMon%>','<%= sMontr%>','<%= sStn%>','<%= sGrp.substring(0, 1)%>')"><%= sMTDAct%></a></td>
                                            <td><%= sMTDAbsDev%></td>
                                            <td><%= sMTDAbsDevPctg%></td>
                                            <td><%= sYTDBudg%></td>
                                            <td><a href="#" onclick="getDtls('ytd','<%= sFinYr%>','<%= sMon%>','<%= sMontr%>','<%= sStn%>','<%= sGrp.substring(0, 1)%>')"><%= sYTDAct%></a></td>
                                            <td><%= sYTDAbsDev%></td>
                                            <td><%= sYTDAbsDevPctg%></td>
                                        </tr>

                                        <tr>
                                            <td>
                                            </td>
                                            <td colspan="9">



                                                <div id='div<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%><%= sGrp.substring(0, 1)%>' style="display : none"><!--  3start-->
                                                    <table cellspacing="1" cellpadding="2" id="myScrollTable_1" width="580"><!--  4start-->
                                                        <thead><!--  4start-->
                                                            <tr>
                                                                <td>Month</td>
                                                                <td>Mtd&nbsp;Budget</td>
                                                                <td>Mtd&nbsp;Actual</td>
                                                                <td>Deviation</td>
                                                                <td>Dev.(%)</td>
                                                            </tr>
                                                        </thead><!--  4end-->
                                                        <tbody><!--  4start-->
                                                            <%
                                                                                                                                                            lstOneStnPerGrpOneMnthSumm_1 = hRemote.getOneStnPerGrpOneMnthSumm_1(sFinYr, sMon, sMontr, compare,sStn, sGrp.substring(0, 1));
                                                                                                                                                            iterateOuter_4 = lstOneStnPerGrpOneMnthSumm_1.iterator();
                                                                                                                                                            int l = 0;
                                                                                                                                                            while (iterateOuter_4.hasNext()) {
                                                                                                                                                                rows = (List) iterateOuter_4.next();
                                                                                                                                                                iterateInner_4 = rows.iterator();
                                                                                                                                                                while (iterateInner_4.hasNext()) {
                                                                                                                                                                    sMmOrd = (String) iterateInner_4.next();
                                                                                                                                                                    if (sMmOrd.equals("JAN")) {
                                                                                                                                                                        sTmpMon = "1";
                                                                                                                                                                    } else if (sMmOrd.equals("FEB")) {
                                                                                                                                                                        sTmpMon = "2";
                                                                                                                                                                    } else if (sMmOrd.equals("MAR")) {
                                                                                                                                                                        sTmpMon = "3";
                                                                                                                                                                    } else if (sMmOrd.equals("APR")) {
                                                                                                                                                                        sTmpMon = "4";
                                                                                                                                                                    } else if (sMmOrd.equals("MAY")) {
                                                                                                                                                                        sTmpMon = "5";
                                                                                                                                                                    } else if (sMmOrd.equals("JUN")) {
                                                                                                                                                                        sTmpMon = "6";
                                                                                                                                                                    } else if (sMmOrd.equals("JUL")) {
                                                                                                                                                                        sTmpMon = "7";
                                                                                                                                                                    } else if (sMmOrd.equals("AUG")) {
                                                                                                                                                                        sTmpMon = "8";
                                                                                                                                                                    } else if (sMmOrd.equals("SEP")) {
                                                                                                                                                                        sTmpMon = "9";
                                                                                                                                                                    } else if (sMmOrd.equals("OCT")) {
                                                                                                                                                                        sTmpMon = "10";
                                                                                                                                                                    } else if (sMmOrd.equals("NOV")) {
                                                                                                                                                                        sTmpMon = "11";
                                                                                                                                                                    } else if (sMmOrd.equals("DEC")) {
                                                                                                                                                                        sTmpMon = "12";
                                                                                                                                                                    }
                                                                                                                                                                    sMTDBudg = (String) iterateInner_4.next();
                                                                                                                                                                    sMTDAct = (String) iterateInner_4.next();
                                                                                                                                                                    sMTDAbsDev = (String) iterateInner_4.next();
                                                                                                                                                                    sMTDAbsDevPctg = (String) iterateInner_4.next();
                                                                                                                                                                }
                                                                                                                                                                l++;
                                                                                                                                                                if (l % 2 == 0) {

                                                            %>
                                                            <tr bgcolor="#f7c6f7">
                                                                <% } else {%>
                                                            <tr bgcolor="#d991d8">
                                                                <% }%>
                                                                <td><%= sMmOrd%></td>
                                                                <td><%= sMTDBudg%></td>
                                                                <td><a href="#" onclick="getDtls('mtd','<%= sFinYr%>','<%= sTmpMon%>','<%= sMontr%>','<%= sStn%>','<%= sGrp.substring(0, 1)%>')"><%= sMTDAct%></a></td>
                                                                <td><%= sMTDAbsDev%></td>
                                                                <td><%= sMTDAbsDevPctg%></td>
                                                            </tr>
                                                            <%

                                                                                                                                                            }

                                                            %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                    </td>                                                                      <script>
                                        animatedcollapse.addDiv('div<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%><%= sGrp.substring(0, 1)%>', 'optional_attribute_string')
                                    </script>
                                    <%
                                                                                        } //end while 3 %>
                                    </tbody><!--  4end-->
                                </table><!--  4end-->
                            </div><!--  3end-->

                        </td>
                    </tr>



                <script>
                    animatedcollapse.addDiv('div<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%>', 'optional_attribute_string')
                </script>
                <%
                                            }

                %>


                </tbody>
            </table>

            <script>
                animatedcollapse.addDiv('div_img','optional_attribute_string');
                animatedcollapse.init();
                i = 1;
            </script>

            <%
                        }
            %>
        </center>

        <form name="form_2" action="budgReptDtls1.jsp" method="post" target="_blank">
            <input type="hidden" name="sMtdYtd" value="" />
            <input type="hidden" name="sFinYr" value="" />
            <input type="hidden" name="sMon" value="" />
            <input type="hidden" name="sMontr" value="" />
            <input type="hidden" name="sStn" value="" />
            <input type="hidden" name="sGrp" value="" />
        </form>




        <script>
    
            animatedcollapse.init()

        </script>
    </body>
</html>
