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

            function getDtls(sMtdYtd,sFinYr,sMon,sMontr,sStn,sGrp,sBudgGrp,sBudgHd){

                form_2.sMtdYtd.value = sMtdYtd;
                form_2.sFinYr.value = sFinYr; 
                form_2.sMon.value = sMon;
                form_2.sMontr.value = sMontr;
                form_2.sStn.value = sStn;
                form_2.sGrp.value = sGrp;
                form_2.sBudgGrp.value = sBudgGrp;
                form_2.sBudgHd.value = sBudgHd;


                form_2.submit();

                return true;
            }

            
        </script>
    </head>
    <body onload="if(i == 1){animatedcollapse.hide('div_img')}">
        <center>
            <font face="Times New Roman" size="4" color="mediumblue"><b></b></font>
            <br>
            <form name="form_1" action = "budgRept5.jsp" method="post" target="_self">
                <div style="background-color : #deffdd">
                    <table>
                        <tr>
                            <td width="25%" align="left">Station-&gt;Group-&gt;Description-&gt;Budget&nbsp;Head
                            </td>
                            <td width="25%" align="left">Finance&nbsp;Year&nbsp;:&nbsp;
                                <select name="sFinYr">

                                    <%
                                                List lstFinYr = null;
                                                List rows = null;
                                                Iterator iterateOuter = null;
                                                Iterator iterateInner = null;
                                                String sFinYrFrm = null;
                                                String sFinYr = null;
                                                lstFinYr = hRemote.getFinYr();
                                                iterateOuter = lstFinYr.iterator();

                                                while (iterateOuter.hasNext()) {
                                                    rows = (List) iterateOuter.next();
                                                    iterateInner = rows.iterator();
                                                    while (iterateInner.hasNext()) {
                                                        sFinYrFrm = (String) iterateInner.next();
                                                        sFinYr = (String) iterateInner.next();

                                                    }%>
                                    <option value = "<%=sFinYrFrm%>"><%= sFinYr%></option>
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
                                <input type="submit" value="SEARCH"/>&nbsp;&nbsp;<input type="button" value="BACK" onclick="location.href='submenu_budget_mon_reports_dtl.jsp'"/>
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
                        sFinYr = request.getParameter("sFinYr");
                        String sMon = request.getParameter("sMon");
                        String sMontr = request.getParameter("sMontr");
                        System.out.println("1111 : " + sMontr);

                        if (sMontr == null) {

            %>

            <script>
                form_1.sMontr[1].checked = 1;
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
                                                List lstAllStnSumm_4 = null;
                                                List lstPerStnAllGrpSumm_4 = null;
                                                List lstPerStnPerGrpAllBudgGrpSumm_5 = null;
                                                List lstPerStnPerGrpPerBudgGrpAllBudgHdSumm_5 = null;
                                                //List rows = null;
                                                //Iterator iterateOuter = null;
                                                //Iterator iterateInner = null;
                                                Iterator iterateOuter_2 = null;
                                                Iterator iterateInner_2 = null;
                                                Iterator iterateOuter_3 = null;
                                                Iterator iterateInner_3 = null;
                                                Iterator iterateOuter_4 = null;
                                                Iterator iterateInner_4 = null;

                                                String sStn = new String();
                                                String sGrp = new String();
                                                String sBudgGrp = new String();
                                                String sBudgGrpDesc = new String();
                                                String sBudgHd = new String();
                                                String sMTDBudg = new String();
                                                String sYTDBudg = new String();
                                                String sMTDAct = new String();
                                                String sYTDAct = new String();
                                                String sMTDAbsDev = new String();
                                                String sMTDAbsDevPctg = new String();
                                                String sYTDAbsDev = new String();
                                                String sYTDAbsDevPctg = new String();


                                                lstAllStnSumm_4 = hRemote.getAllStnSumm_4(sFinYr, sMon, sMontr);


                                                iterateOuter = lstAllStnSumm_4.iterator();
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
                        <td><a href="#" onclick="getDtls('mtd','<%= sFinYr%>','<%= sMon%>','<%= sMontr%>','<%= sStn%>','','','')"><%= sMTDAct%></a></td>
                        <td><%= sMTDAbsDev%></td>
                        <td><%= sMTDAbsDevPctg%></td>
                        <td><%= sYTDBudg%></td>
                        <td><a href="#" onclick="getDtls('ytd','<%= sFinYr%>','<%= sMon%>','<%= sMontr%>','<%= sStn%>','','','')"><%= sYTDAct%></a></td>
                        <td><%= sYTDAbsDev%></td>
                        <td><%= sYTDAbsDevPctg%></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td colspan="9">
                            <div id='div<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%>' style="display : none" ><!--  1start-->
                                <table cellspacing="1" cellpadding="2" id="myScrollTable_1" width="880"><!--  2start-->
                                    <thead><!--  2start-->
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
                                    </thead><!--  2end-->
                                    <tbody><!--  2start-->
                                        <%
                                                                                            lstPerStnAllGrpSumm_4 = hRemote.getPerStnAllGrpSumm_4(sFinYr, sMon, sMontr, sStn);

                                                                                            iterateOuter_2 = lstPerStnAllGrpSumm_4.iterator();
                                                                                            int j = 0;
                                                                                            while (iterateOuter_2.hasNext()) {
                                                                                                rows = (List) iterateOuter_2.next();
                                                                                                iterateInner_2 = rows.iterator();
                                                                                                while (iterateInner_2.hasNext()) {
                                                                                                    sGrp = (String) iterateInner_2.next();
                                                                                                    sMTDBudg = (String) iterateInner_2.next();
                                                                                                    sYTDBudg = (String) iterateInner_2.next();
                                                                                                    sMTDAct = (String) iterateInner_2.next();
                                                                                                    sYTDAct = (String) iterateInner_2.next();
                                                                                                    sMTDAbsDev = (String) iterateInner_2.next();
                                                                                                    sMTDAbsDevPctg = (String) iterateInner_2.next();
                                                                                                    sYTDAbsDev = (String) iterateInner_2.next();
                                                                                                    sYTDAbsDevPctg = (String) iterateInner_2.next();
                                                                                                }
                                                                                                j++;
                                                                                                if (j % 2 == 0) {

                                        %>
                                        <tr bgcolor = "#66ccff">
                                            <%                                                                                                                       } else {
                                            %>
                                        <tr bgcolor = "#99ccff">
                                            <%                                                                                                                       }
                                            %>
                                            <td><img name="img<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%><%= sGrp.substring(0, 1)%>" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/></td>
                                            <td><%= sGrp%></td>
                                            <td><%= sMTDBudg%></td>
                                            <td><a href="#" onclick="getDtls('mtd','<%= sFinYr%>','<%= sMon%>','<%= sMontr%>','<%= sStn%>','<%= sGrp.substring(0, 1)%>','','')"><%= sMTDAct%></a></td>
                                            <td><%= sMTDAbsDev%></td>
                                            <td><%= sMTDAbsDevPctg%></td>
                                            <td><%= sYTDBudg%></td>
                                            <td><a href="#" onclick="getDtls('ytd','<%= sFinYr%>','<%= sMon%>','<%= sMontr%>','<%= sStn%>','<%= sGrp.substring(0, 1)%>','','')"><%= sYTDAct%></a></td>
                                            <td><%= sYTDAbsDev%></td>
                                            <td><%= sYTDAbsDevPctg%></td>
                                        </tr>

                                        <tr>
                                            <td>
                                            </td>
                                            <td colspan="9">
                                                <div id='div<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%><%= sGrp.substring(0, 1)%>' style="display : none"><!--  2start-->
                                                    <table cellspacing="1" cellpadding="2" id="myScrollTable_1" width="880"><!--  3start-->
                                                        <thead><!--  3start-->
                                                            <tr>
                                                                <td></td>
                                                                <td>Description</td>
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
                                                                                                                                                                    lstPerStnPerGrpAllBudgGrpSumm_5 = hRemote.getPerStnPerGrpAllBudgGrpSumm_5(sFinYr, sMon, sMontr, sStn, sGrp.substring(0, 1));
                                                                                                                                                                    iterateOuter_3 = lstPerStnPerGrpAllBudgGrpSumm_5.iterator();
                                                                                                                                                                    int k = 0;
                                                                                                                                                                    while (iterateOuter_3.hasNext()) {
                                                                                                                                                                        rows = (List) iterateOuter_3.next();
                                                                                                                                                                        iterateInner_3 = rows.iterator();
                                                                                                                                                                        while (iterateInner_3.hasNext()) {
                                                                                                                                                                            sBudgGrp = (String) iterateInner_3.next();
                                                                                                                                                                            if (sBudgGrp.equals("1")) {
                                                                                                                                                                                sBudgGrpDesc = "Insurance Spares Consumed";
                                                                                                                                                                            } else if (sBudgGrp.equals("2")) {
                                                                                                                                                                                sBudgGrpDesc = "Running Spares + Rly Track Mtc";
                                                                                                                                                                            } else if (sBudgGrp.equals("3")) {
                                                                                                                                                                                sBudgGrpDesc = "O&M Consumables + Chemical + Lub + Durable";
                                                                                                                                                                            } else if (sBudgGrp.equals("4")) {
                                                                                                                                                                                sBudgGrpDesc = "Preventive + AMC";
                                                                                                                                                                            } else if (sBudgGrp.equals("5")) {
                                                                                                                                                                                sBudgGrpDesc = "Breakdown";
                                                                                                                                                                            } else if (sBudgGrp.equals("6")) {
                                                                                                                                                                                sBudgGrpDesc = "Survey";
                                                                                                                                                                            } else if (sBudgGrp.equals("7")) {
                                                                                                                                                                                sBudgGrpDesc = "Others Contracts";
                                                                                                                                                                            }
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
                                                                <td><img name="img<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%><%= sGrp.substring(0, 1)%><%= sBudgGrp%>" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/></td>
                                                                <td><%= sBudgGrpDesc%></td>
                                                                <td><%= sMTDBudg%></td>
                                                                <td><a href="#" onclick="getDtls('mtd','<%= sFinYr%>','<%= sMon%>','<%= sMontr%>','<%= sStn%>','<%= sGrp.substring(0, 1)%>','<%= sBudgGrp%>','')"><%= sMTDAct%></a></td>
                                                                <td><%= sMTDAbsDev%></td>
                                                                <td><%= sMTDAbsDevPctg%></td>
                                                                <td><%= sYTDBudg%></td>
                                                                <td><a href="#" onclick="getDtls('ytd','<%= sFinYr%>','<%= sMon%>','<%= sMontr%>','<%= sStn%>','<%= sGrp.substring(0, 1)%>','<%= sBudgGrp%>','')"><%= sYTDAct%></a></td>
                                                                <td><%= sYTDAbsDev%></td>
                                                                <td><%= sYTDAbsDevPctg%></td>
                                                            </tr>

                                                            <tr>
                                                                <td>
                                                                </td>
                                                                <td colspan="9">



                                                                    <div id='div<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%><%= sGrp.substring(0, 1)%><%= sBudgGrp%>' style="display : none"><!--  3start-->
                                                                        <table cellspacing="1" cellpadding="2" id="myScrollTable_1" width="880"><!--  4start-->
                                                                            <thead><!--  4start-->
                                                                                <tr>
                                                                                    <td>Budget&nbsp;Head</td>
                                                                                    <td>Mtd&nbsp;Budget</td>
                                                                                    <td>Mtd&nbsp;Actual</td>
                                                                                    <td>Deviation</td>
                                                                                    <td>MTD&nbsp;Dev.(%)</td>
                                                                                    <td>YTD&nbsp;Budget</td>
                                                                                    <td>YTD&nbsp;Actual</td>
                                                                                    <td>Deviation</td>
                                                                                    <td>YTD&nbsp;Dev.(%)</td>
                                                                                </tr>
                                                                            </thead><!--  4end-->
                                                                            <tbody><!--  4start-->
                                                                                <%
                                                                                                                                                                                                                                lstPerStnPerGrpPerBudgGrpAllBudgHdSumm_5 = hRemote.getPerStnPerGrpPerBudgGrpAllBudgHdSumm_5(sFinYr, sMon, sMontr, sStn, sGrp.substring(0, 1), sBudgGrp);

                                                                                                                                                                                                                                iterateOuter_4 = lstPerStnPerGrpPerBudgGrpAllBudgHdSumm_5.iterator();
                                                                                                                                                                                                                                int l = 0;
                                                                                                                                                                                                                                while (iterateOuter_4.hasNext()) {
                                                                                                                                                                                                                                    rows = (List) iterateOuter_4.next();
                                                                                                                                                                                                                                    iterateInner_4 = rows.iterator();
                                                                                                                                                                                                                                    while (iterateInner_4.hasNext()) {
                                                                                                                                                                                                                                        sBudgHd = (String) iterateInner_4.next();
                                                                                                                                                                                                                                        sMTDBudg = (String) iterateInner_4.next();
                                                                                                                                                                                                                                        sYTDBudg = (String) iterateInner_4.next();
                                                                                                                                                                                                                                        sMTDAct = (String) iterateInner_4.next();
                                                                                                                                                                                                                                        sYTDAct = (String) iterateInner_4.next();
                                                                                                                                                                                                                                        sMTDAbsDev = (String) iterateInner_4.next();
                                                                                                                                                                                                                                        sMTDAbsDevPctg = (String) iterateInner_4.next();
                                                                                                                                                                                                                                        sYTDAbsDev = (String) iterateInner_4.next();
                                                                                                                                                                                                                                        sYTDAbsDevPctg = (String) iterateInner_4.next();
                                                                                                                                                                                                                                    }
                                                                                                                                                                                                                                    l++;
                                                                                                                                                                                                                                    if (l % 2 == 0) {

                                                                                %>
                                                                                <tr bgcolor="#f7c6f7">
                                                                                    <% } else {%>
                                                                                <tr bgcolor="#d991d8">
                                                                                    <% }%>
                                                                                    <td><%= sBudgHd%></td>
                                                                                    <td><%= sMTDBudg%></td>
                                                                                    <td><a href="#" onclick="getDtls('mtd','<%= sFinYr%>','<%= sMon%>','<%= sMontr%>','<%= sStn%>','<%= sGrp.substring(0, 1)%>','<%= sBudgGrp%>','<%= sBudgHd%>')"><%= sMTDAct%></a></td>
                                                                                    <td><%= sMTDAbsDev%></td>
                                                                                    <td><%= sMTDAbsDevPctg%></td>
                                                                                    <td><%= sYTDBudg%></td>
                                                                                    <td><a href="#" onclick="getDtls('ytd','<%= sFinYr%>','<%= sMon%>','<%= sMontr%>','<%= sStn%>','<%= sGrp.substring(0, 1)%>','<%= sBudgGrp%>','<%= sBudgHd%>')"><%= sYTDAct%></a></td>
                                                                                    <td><%= sYTDAbsDev%></td>
                                                                                    <td><%= sYTDAbsDevPctg%></td>
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
                                                            animatedcollapse.addDiv('div<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%><%= sGrp.substring(0, 1)%><%= sBudgGrp%>', 'optional_attribute_string')
                                                        </script>
                                                        <%
                                                                                                                                                                } //end while 3 %>
                                                        </tbody><!--  4end-->
                                                    </table><!--  4end-->
                                                </div><!--  3end-->

                                            </td>
                                        </tr>

                                    <script>
                                        animatedcollapse.addDiv('div<%= sStn.replace("(", "").replace(")", "").replace("-", "_")%><%= sGrp.substring(0, 1)%>', 'optional_attribute_string')
                                    </script>
                                    <%
                                                                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>

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

        <form name="form_2" action="budgReptDtls5.jsp" method="post" target="_blank">
            <input type="hidden" name="sMtdYtd" value="" />
            <input type="hidden" name="sFinYr" value="" />
            <input type="hidden" name="sMon" value="" />
            <input type="hidden" name="sMontr" value="" />
            <input type="hidden" name="sStn" value="" />
            <input type="hidden" name="sGrp" value="" />
            <input type="hidden" name="sBudgGrp" value="" />
            <input type="hidden" name="sBudgHd" value="" />
        </form>




        <script>
    
            animatedcollapse.init()

        </script>
    </body>
</html>