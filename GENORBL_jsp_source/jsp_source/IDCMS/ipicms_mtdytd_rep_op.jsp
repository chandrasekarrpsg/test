<%-- 
    Document   : fixedColTab_3
    Created on : Oct 9, 2013, 2:38:15 PM
    Author     : debasis saha
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="Ipicms.*"%>
<%!    IpicmsProcessBeanRemote hRemote = null;
    //htmaNewRemote hRemote1 = null ;
    InitialContext ic = null;

    public void jspInit() {
        try {
            ic = new InitialContext();
            hRemote = (IpicmsProcessBeanRemote) ic.lookup("java:comp/env/IpicmsProcessBeanRemote");
            //hRemote = (OrderProcessBeanRemote) ic.lookup("ejb/OrderProcessBean");
            //hRemote1 = (htmaNewRemote)ic.lookup(htmaNewRemote.class.getName());
        } catch (Exception e) {
            System.out.println("ipcms_nomEntry.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                border-top : 1pt solid green ;
                border-bottom : 1pt solid green ;
            }

            .thead_tr{
                background : #ffdd00;
            }

            .thead_tr_th{
                border-left   : 1pt solid red ;
                border-right   : 1pt solid red ;
                border-top : 1px solid red ;
                border-bottom : 1px solid red ;
            }

        </style>
        <script type="text/javascript" src="jquery-1.9.1.js"></script>
        <!--script type="text/javascript" src="js/jquery.min.js"></script-->
        <script type="text/javascript" src="js/animatedcollapse.js"></script>
        <script type="text/javascript" src="jquery.fixedtable.js"></script>
        <script type = "text/javascript" src = "js/scrollabletable.js"></script>
        <script type="text/javascript">
            function search(sStnCd,sDeptCd,sMon,sCatgCd){

                //var url="search.jsp?empcd=970523&m=JUL-13&o=all&u=975109&s=all"
                var sYr;
                if(parseInt(sMon) <= 3){
                    sYr = form_1.sFinYrTmp.value.substring(5);
                }else{
                    sYr = form_1.sFinYrTmp.value.substring(0,4);
                }
                var url = "search_modal.jsp?"
                    + "empcd = " + form_1.sLoginEmpCd.value
                    + "&m=" + sMon
                    + "&sYr=" + sYr
                    + "&o=" + sStnCd
                    + "&u=" + form_1.sLoginEmpCd.value
                    + "&s=7"
                    + "&cat=" + sCatgCd
                    + "&sec= " + sDeptCd
                    + "&sLoginStnCd=" + form_1.sLoginStnCd.value
                    + "&sLoginStnShrtNm=" + form_1.sLoginStnShrtNm.value
                    + "&sLoginStnLongNm=" + form_1.sLoginStnLongNm.value
                    + "&sLoginDeptCd=" + form_1.sLoginDeptCd.value
                    + "&sLoginDeptShrtNm=" + form_1.sLoginDeptShrtNm.value
                    + "&sLoginDeptLongNm=" + form_1.sLoginDeptLongNm.value
                    + "&sLoginEmpCd=" + form_1.sLoginEmpCd.value
                    + "&sLoginEmpNm=" + form_1.sLoginEmpNm.value
                    + "&sLoginEmpDesg=" + form_1.sLoginEmpDesg.value
                    + "&sLoginEmpLvl=" + form_1.sLoginEmpLvl.value
                    + "&sLoginAdmMkr=" + form_1.sLoginAdmMkr.value
                    + "&sLoginEmpKaizenMkr=" + form_1.sLoginEmpKaizenMkr.value
                window.status="Opening History Output Screen !. Please wait....................."
                var o=showModalDialog(url,0,"dialogWidth:1000px;dialogHeight:650px");
                window.status=" "
                //alert(url)

                return true;
            }

            $(document).ready(function(){
                // this "tableDiv" must be the table's class
                $(".tableDiv").each(function() {
                    var Id = $(this).get(0).id;
                    var maintbheight = 410;
                    var maintbwidth = 940;

                    $("#" + Id + " .FixedTables").fixedTable({
                        width: maintbwidth,
                        height: maintbheight,
                        fixedColumns: 2,
                        // header style
                        classHeader: "fixedHead",
                        // footer style
                        classFooter: "fixedFoot",
                        // fixed column on the left
                        classColumn: "fixedColumn",
                        // the width of fixed column on the left
                        fixedColumnWidth: 140,
                        // table's parent div's id
                        outerId: Id,
                        // tds' in content area default background color
                        Contentbackcolor: "#FFFFFF",
                        // tds' in content area background color while hover.
                        Contenthovercolor: "#99CCFF",
                        // tds' in fixed column default background color
                        //fixedColumnbackcolor:"#187BAF",
                        //fixedColumnbackcolor:"#997BAF",
                        fixedColumnbackcolor:"#d9f2f0",
                        // tds' in fixed column background color while hover.
                        fixedColumnhovercolor:"#99CCFF"
                    });
                });

                //$(".fixedArea").show();
                $(".fixedArea").css("visibility","visible");
            });
        </script>

    </head>
    <body>
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
                    String sLoginEmpKaizenMkr = request.getParameter("sLoginEmpKaizenMkr");
                    String sFinYrTmp = request.getParameter("sFinYr");

        %>
        <center>
            <font face="Times New Roman" size="4" color="mediumblue"><b>Please Click on the individual month wise cells ( Except SubTotals & Totals ) to view the details</b></font>
            <form name="form_1" action = "ipicms_mtdytd_rep.jsp" method="post" target="_self">
                <input type="hidden" name="sCallNm" value="insUpdIpicms">
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
                <input type="hidden" name="sLoginEmpKaizenMkr" value="<%= sLoginEmpKaizenMkr%>">

                <input type="hidden" name="sFinYrTmp" value="<%= sFinYrTmp%>">

                <%
                            String sFinYr = request.getParameter("sFinYr");

                            if (sFinYr != null) {

                                Iterator iterateOuter = null;
                                Iterator iterateInner = null;
                                List rows = null;
                                List lstMtdYtdRep = null;
                                rows = null;
                                iterateOuter = null;
                                iterateInner = null;

                                String sStnCd = new String();
                                String sStnDesc = new String();
                                String sDeptCd = new String();
                                String sDeptDesc = new String();
                                String sMon = new String();
                                String sCatgCd = new String();
                                String sTot = new String();

                                String sPrevStnCd = new String();
                                String sPrevStnDesc = new String();
                                String sPrevDeptCd = new String();
                                String sPrevDeptDesc = new String();
                                String sPrevMon = new String();
                                String sPrevCatgCd = new String();
                                String sPrevTot = new String();

                                int iNoOfStnDept = 0;
                                int iRowHiImpact = 0;
                                int iRowKizen = 0;
                                int iAprHiImpact = 0;
                                int iAprKaizen = 0;
                                int iMayHiImpact = 0;
                                int iMayKaizen = 0;
                                int iJunHiImpact = 0;
                                int iJunKaizen = 0;
                                int iJulHiImpact = 0;
                                int iJulKaizen = 0;
                                int iAugHiImpact = 0;
                                int iAugKaizen = 0;
                                int iSepHiImpact = 0;
                                int iSepKaizen = 0;
                                int iOctHiImpact = 0;
                                int iOctKaizen = 0;
                                int iNovHiImpact = 0;
                                int iNovKaizen = 0;
                                int iDecHiImpact = 0;
                                int iDecKaizen = 0;
                                int iJanHiImpact = 0;
                                int iJanKaizen = 0;
                                int iFebHiImpact = 0;
                                int iFebKaizen = 0;
                                int iMarHiImpact = 0;
                                int iMarKaizen = 0;

                                int iGrandAprHiImpact = 0;
                                int iGrandAprKaizen = 0;
                                int iGrandMayHiImpact = 0;
                                int iGrandMayKaizen = 0;
                                int iGrandJunHiImpact = 0;
                                int iGrandJunKaizen = 0;
                                int iGrandJulHiImpact = 0;
                                int iGrandJulKaizen = 0;
                                int iGrandAugHiImpact = 0;
                                int iGrandAugKaizen = 0;
                                int iGrandSepHiImpact = 0;
                                int iGrandSepKaizen = 0;
                                int iGrandOctHiImpact = 0;
                                int iGrandOctKaizen = 0;
                                int iGrandNovHiImpact = 0;
                                int iGrandNovKaizen = 0;
                                int iGrandDecHiImpact = 0;
                                int iGrandDecKaizen = 0;
                                int iGrandJanHiImpact = 0;
                                int iGrandJanKaizen = 0;
                                int iGrandFebHiImpact = 0;
                                int iGrandFebKaizen = 0;
                                int iGrandMarHiImpact = 0;
                                int iGrandMarKaizen = 0;

                                int iCnt = -1;
                                int iRem = 0;

                                lstMtdYtdRep = hRemote.get_mtdytd_rep(sFinYr);


                %>

                <div id="tableDiv_Arrays" class="tableDiv">
                    <table id="Open_Text_Arrays" class="FixedTables" style="border-collapse: collapse">
                        <thead>
                            <!--tr class="thead_tr">
                                <th class="thead_tr_th">
                                    &nbsp;
                                </th>
                                <th class="thead_tr_th">
                                    &nbsp;
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    Apr
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    May
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    Jun
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    Jul
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    Aug
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    Sep
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    Oct
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    Nov
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    Dec
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    Jan
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    Feb
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    Mar
                                </th>
                                <th colspan="2" align="center" class="thead_tr_th">
                                    <font size="1">TOTAL(YTD)</font>
                                </th>
                            </tr>
                            <tr class="thead_tr">
                                <th class="thead_tr_th">
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                </th>
                                <th class="thead_tr_th">
                                    Department<br>&nbsp;
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                                <th class="thead_tr_th">
                                    Hi-impact
                                </th>
                                <th class="thead_tr_th">
                                    kaizen
                                </th>
                            </tr-->
                        </thead>
                        <tbody>


                        </tbody>
                        <!--tfoot>
                            <tr>
                                <th>
                                    &nbsp;
                                </th>
                                <th>
                                    &nbsp;
                                </th>
                                <th colspan="2">
                                    Apr
                                </th>
                                <th colspan="2">
                                    May
                                </th>
                                <th colspan="2">
                                    Jun
                                </th>
                                <th colspan="2">
                                    Jul
                                <th>
                                <th colspan="2">
                                    Aug
                                </th>
                                <th colspan="2">
                                    Sep
                                </th>
                                <th colspan="2">
                                    Oct
                                </th>
                                <th colspan="2">
                                    Nov
                                </th>
                                <th colspan="2">
                                    Dec
                                </th>
                                <th colspan="2">
                                    Jan
                                </th>
                                <th colspan="2">
                                    Feb
                                </th>
                                <th colspan="2">
                                    Mar
                                </th>
                            </tr>
                        </tfoot-->

                    </table>

                    <!--table border="1">
                        <thead>
                            <tr>
                                <th colspan="2">
                                   Description
                                </th>

                            </tr>
                            <tr>
                                <th>
                                    name
                                </th>
                                <th>
                                    age
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    Debasis
                                </td>
                                <td>
                                    25
                                </td>
                            </tr>
                        </tbody>
                    </table-->
                    <!--/div-->
                    <div class="fixedArea" style="visibility : hidden">
                        <div class="fixedColumn" style="float : left">
                            <div class="fixedHead">
                                <table style='border-collapse : collapse'>
                                    <tr class="thead_tr">
                                        <td>&nbsp;</td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr class="thead_tr">
                                        <td>&nbsp;</td>
                                        <td>Department</td>
                                    </tr>
                                </table>

                            </div>

                            <div class="fixedTable">

                                <table style='border-collapse : collapse'>

                                    <%
                                                                    sStnCd = new String();
                                                                    sStnDesc = new String();
                                                                    sDeptCd = new String();
                                                                    sDeptDesc = new String();
                                                                    sMon = new String();
                                                                    sCatgCd = new String();
                                                                    sTot = new String();

                                                                    sPrevStnCd = new String();
                                                                    sPrevStnDesc = new String();
                                                                    sPrevDeptCd = new String();
                                                                    sPrevDeptDesc = new String();
                                                                    sPrevMon = new String();
                                                                    sPrevCatgCd = new String();
                                                                    sPrevTot = new String();
                                                                    iCnt = -1;
                                                                    iRem = 0;
                                                                    iterateOuter = lstMtdYtdRep.iterator();

                                                                    while (iterateOuter.hasNext()) {
                                                                        rows = (List) iterateOuter.next();

                                                                        iterateInner = rows.iterator();

                                                                        sPrevStnCd = sStnCd;
                                                                        sPrevStnDesc = sStnDesc;
                                                                        sPrevDeptCd = sDeptCd;
                                                                        sPrevDeptDesc = sDeptDesc;
                                                                        sPrevMon = sMon;
                                                                        sPrevCatgCd = sCatgCd;
                                                                        sPrevTot = sTot;

                                                                        iCnt++;

                                                                        iRem = iCnt % 24;

                                                                        while (iterateInner.hasNext()) {

                                                                            sStnCd = (String) iterateInner.next();
                                                                            sStnDesc = (String) iterateInner.next();
                                                                            sDeptCd = (String) iterateInner.next();
                                                                            sDeptDesc = (String) iterateInner.next();
                                                                            sMon = (String) iterateInner.next();
                                                                            sCatgCd = (String) iterateInner.next();
                                                                            sTot = ((String) iterateInner.next()).trim();

                                                                        }

                                                                        if (iRem == 0) {

                                                                            if (!sStnCd.equals(sPrevStnCd)) {

                                                                                if (iCnt == 0) {

                                    %>

                                    <tr>
                                        <td id="col_<%= sStnCd%>"><%=sStnDesc%></td>
                                        <td><%=sDeptDesc%></td>

                                        <%
                                                                                                                        } else {
                                        %>

                                    <tr>
                                        <td colspan="2" align="right"><%=sPrevStnDesc%> SUB TOTAL</td>

                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right"><%=sPrevStnDesc%> TOTAL</td>

                                    </tr>
                                    <script>
                                        $("#col_<%= sPrevStnCd%>").attr('rowSpan',<%= iNoOfStnDept%>);
                                    </script>
                                    <tr>
                                        <td id="col_<%= sStnCd%>"><%=sStnDesc%></td>
                                        <td><%=sDeptDesc%></td>
                                        <%

                                                                                                                            iNoOfStnDept = 0;

                                                                                                                        }
                                                                                                                    } else {
                                        %>

                                    <tr>
                                        <td><%=sDeptDesc%></td>
                                        <%
                                                                                                                    }
                                                                                                                    iNoOfStnDept++;
                                                                                                                }

                                        %>

                                        <%
                                                                                                                if (iRem == 23) {

                                        %>

                                    </tr>
                                    <%
                                                                            iRowHiImpact = 0;
                                                                            iRowKizen = 0;
                                                                        }
                                                                    }
                                                                    iGrandAprHiImpact += iAprHiImpact;
                                                                    iGrandAprKaizen += iAprKaizen;
                                                                    iGrandMayHiImpact += iMayHiImpact;
                                                                    iGrandMayKaizen += iMayKaizen;
                                                                    iGrandJunHiImpact += iJunHiImpact;
                                                                    iGrandJunKaizen += iJunKaizen;
                                                                    iGrandJulHiImpact += iJulHiImpact;
                                                                    iGrandJulKaizen += iJulKaizen;
                                                                    iGrandAugHiImpact += iAugHiImpact;
                                                                    iGrandAugKaizen += iAugKaizen;
                                                                    iGrandSepHiImpact += iSepHiImpact;
                                                                    iGrandSepKaizen += iSepKaizen;
                                                                    iGrandOctHiImpact += iOctHiImpact;
                                                                    iGrandOctKaizen += iOctKaizen;
                                                                    iGrandNovHiImpact += iNovHiImpact;
                                                                    iGrandNovKaizen += iNovKaizen;
                                                                    iGrandDecHiImpact += iDecHiImpact;
                                                                    iGrandDecKaizen += iDecKaizen;
                                                                    iGrandJanHiImpact += iJanHiImpact;
                                                                    iGrandJanKaizen += iJanKaizen;
                                                                    iGrandFebHiImpact += iFebHiImpact;
                                                                    iGrandFebKaizen += iFebKaizen;
                                                                    iGrandMarHiImpact += iMarHiImpact;
                                                                    iGrandMarKaizen += iMarKaizen;
                                    %>
                                    <tr>
                                        <td colspan="2" align="right"><%=sPrevStnDesc%> SUB TOTAL</td>

                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right"><%=sPrevStnDesc%> TOTAL</td>

                                    </tr>
                                    <script>
                                        $("#col_<%= sPrevStnCd%>").attr('rowSpan',<%= iNoOfStnDept%>);
                            
                                    </script>
                                    <tr>
                                        <td colspan="2" align="right">DIVISIONAL SUB TOTAL</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="right">DIVISIONAL GRAND TOTAL</td>
                                    </tr>


                                </table>
                            </div>

                            <div class="fixedFoot">

                            </div>
                        </div>

                        <div class="fixedContainer" style="float : left">
                            <div class="fixedHead">
                                <table style='border-collapse : collapse'>
                                    <tr class="thead_tr">
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            Apr
                                        </th>
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            May
                                        </th>
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            Jun
                                        </th>
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            Jul
                                        </th>
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            Aug
                                        </th>
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            Sep
                                        </th>
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            Oct
                                        </th>
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            Nov
                                        </th>
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            Dec
                                        </th>
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            Jan
                                        </th>
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            Feb
                                        </th>
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            Mar
                                        </th>
                                        <th colspan="2" align="center" class="thead_tr_th">
                                            <font size="1">TOTAL(YTD</font>
                                        </th>
                                    </tr>
                                    <tr class="thead_tr">

                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th" align="center">
                                            kaizen
                                        </th>
                                    </tr>

                                </table>

                            </div>
                            <div class="fixedTable">

                                <table style='border-collapse : collapse'>
                                    <!--tr class="thead_tr">

                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                        <th class="thead_tr_th">
                                            Hi-impact
                                        </th>
                                        <th class="thead_tr_th">
                                            kaizen
                                        </th>
                                    </tr-->

                                    <%
                                                                    sStnCd = new String();
                                                                    sStnDesc = new String();
                                                                    sDeptCd = new String();
                                                                    sDeptDesc = new String();
                                                                    sMon = new String();
                                                                    sCatgCd = new String();
                                                                    sTot = new String();

                                                                    sPrevStnCd = new String();
                                                                    sPrevStnDesc = new String();
                                                                    sPrevDeptCd = new String();
                                                                    sPrevDeptDesc = new String();
                                                                    sPrevMon = new String();
                                                                    sPrevCatgCd = new String();
                                                                    sPrevTot = new String();
                                                                    iCnt = -1;
                                                                    iRem = 0;
                                                                    iterateOuter = lstMtdYtdRep.iterator();

                                                                    while (iterateOuter.hasNext()) {
                                                                        rows = (List) iterateOuter.next();

                                                                        iterateInner = rows.iterator();

                                                                        sPrevStnCd = sStnCd;
                                                                        sPrevStnDesc = sStnDesc;
                                                                        sPrevDeptCd = sDeptCd;
                                                                        sPrevDeptDesc = sDeptDesc;
                                                                        sPrevMon = sMon;
                                                                        sPrevCatgCd = sCatgCd;
                                                                        sPrevTot = sTot;

                                                                        iCnt++;

                                                                        iRem = iCnt % 24;

                                                                        while (iterateInner.hasNext()) {

                                                                            sStnCd = (String) iterateInner.next();
                                                                            sStnDesc = (String) iterateInner.next();
                                                                            sDeptCd = (String) iterateInner.next();
                                                                            sDeptDesc = (String) iterateInner.next();
                                                                            sMon = (String) iterateInner.next();
                                                                            sCatgCd = (String) iterateInner.next();
                                                                            sTot = ((String) iterateInner.next()).trim();

                                                                        }

                                                                        if (iRem == 0) {

                                                                            if (!sStnCd.equals(sPrevStnCd)) {

                                                                                if (iCnt == 0) {

                                    %>

                                    <tr>


                                        <%                                                                                                    } else {
                                        %>

                                    <tr>
                                        <td align="center"><%= iAprHiImpact%></td>
                                        <td align="center"><%= iAprKaizen%></td>
                                        <td align="center"><%= iMayHiImpact%></td>
                                        <td align="center"><%= iMayKaizen%></td>
                                        <td align="center"><%= iJunHiImpact%></td>
                                        <td align="center"><%= iJunKaizen%></td>
                                        <td align="center"><%= iJulHiImpact%></td>
                                        <td align="center"><%= iJulKaizen%></td>
                                        <td align="center"><%= iAugHiImpact%></td>
                                        <td align="center"><%= iAugKaizen%></td>
                                        <td align="center"><%= iSepHiImpact%></td>
                                        <td align="center"><%= iSepKaizen%></td>
                                        <td align="center"><%= iOctHiImpact%></td>
                                        <td align="center"><%= iOctKaizen%></td>
                                        <td align="center"><%= iNovHiImpact%></td>
                                        <td align="center"><%= iNovKaizen%></td>
                                        <td align="center"><%= iDecHiImpact%></td>
                                        <td align="center"><%= iDecKaizen%></td>
                                        <td align="center"><%= iJanHiImpact%></td>
                                        <td align="center"><%= iJanKaizen%></td>
                                        <td align="center"><%= iFebHiImpact%></td>
                                        <td align="center"><%= iFebKaizen%></td>
                                        <td align="center"><%= iMarHiImpact%></td>
                                        <td align="center"><%= iMarKaizen%></td>
                                        <td align="center"><%= iAprHiImpact + iMayHiImpact + iJunHiImpact + iJulHiImpact + iAugHiImpact + iSepHiImpact + iOctHiImpact + iNovHiImpact + iDecHiImpact + iJanHiImpact + iFebHiImpact + iMarHiImpact%></td>
                                        <td align="center"><%= iAprKaizen + iMayKaizen + iJunKaizen + iJulKaizen + iAugKaizen + iSepKaizen + iOctKaizen + iNovKaizen + iDecKaizen + iJanKaizen + iFebKaizen + iMarKaizen%></td>

                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><%= iAprHiImpact + iAprKaizen%></td>
                                        <td colspan="2" align="center"><%= iMayHiImpact + iMayKaizen%></td>
                                        <td colspan="2" align="center"><%= iJunHiImpact + iJunKaizen%></td>
                                        <td colspan="2" align="center"><%= iJulHiImpact + iJulKaizen%></td>
                                        <td colspan="2" align="center"><%= iAugHiImpact + iAugKaizen%></td>
                                        <td colspan="2" align="center"><%= iSepHiImpact + iSepKaizen%></td>
                                        <td colspan="2" align="center"><%= iOctHiImpact + iOctKaizen%></td>
                                        <td colspan="2" align="center"><%= iNovHiImpact + iNovKaizen%></td>
                                        <td colspan="2" align="center"><%= iDecHiImpact + iDecKaizen%></td>
                                        <td colspan="2" align="center"><%= iJanHiImpact + iJanKaizen%></td>
                                        <td colspan="2" align="center"><%= iFebHiImpact + iFebKaizen%></td>
                                        <td colspan="2" align="center"><%= iMarHiImpact + iMarKaizen%></td>
                                        <td colspan="2" align="center"><%= iAprHiImpact + iAprKaizen + iMayHiImpact + iMayKaizen + iJunHiImpact + iJunKaizen + iJulHiImpact + iJulKaizen + iAugHiImpact + iAugKaizen + iSepHiImpact + iSepKaizen + iOctHiImpact + iOctKaizen + iNovHiImpact + iNovKaizen + iDecHiImpact + iDecKaizen + iJanHiImpact + iJanKaizen + iFebHiImpact + iFebKaizen + iMarHiImpact + iMarKaizen%></td>

                                    </tr>

                                    <tr>
                                        <%

                                                                                                                            iNoOfStnDept = 0;
                                                                                                                            iGrandAprHiImpact += iAprHiImpact;
                                                                                                                            iGrandAprKaizen += iAprKaizen;
                                                                                                                            iGrandMayHiImpact += iMayHiImpact;
                                                                                                                            iGrandMayKaizen += iMayKaizen;
                                                                                                                            iGrandJunHiImpact += iJunHiImpact;
                                                                                                                            iGrandJunKaizen += iJunKaizen;
                                                                                                                            iGrandJulHiImpact += iJulHiImpact;
                                                                                                                            iGrandJulKaizen += iJulKaizen;
                                                                                                                            iGrandAugHiImpact += iAugHiImpact;
                                                                                                                            iGrandAugKaizen += iAugKaizen;
                                                                                                                            iGrandSepHiImpact += iSepHiImpact;
                                                                                                                            iGrandSepKaizen += iSepKaizen;
                                                                                                                            iGrandOctHiImpact += iOctHiImpact;
                                                                                                                            iGrandOctKaizen += iOctKaizen;
                                                                                                                            iGrandNovHiImpact += iNovHiImpact;
                                                                                                                            iGrandNovKaizen += iNovKaizen;
                                                                                                                            iGrandDecHiImpact += iDecHiImpact;
                                                                                                                            iGrandDecKaizen += iDecKaizen;
                                                                                                                            iGrandJanHiImpact += iJanHiImpact;
                                                                                                                            iGrandJanKaizen += iJanKaizen;
                                                                                                                            iGrandFebHiImpact += iFebHiImpact;
                                                                                                                            iGrandFebKaizen += iFebKaizen;
                                                                                                                            iGrandMarHiImpact += iMarHiImpact;
                                                                                                                            iGrandMarKaizen += iMarKaizen;

                                                                                                                            iAprHiImpact = 0;
                                                                                                                            iAprKaizen = 0;
                                                                                                                            iMayHiImpact = 0;
                                                                                                                            iMayKaizen = 0;
                                                                                                                            iJunHiImpact = 0;
                                                                                                                            iJunKaizen = 0;
                                                                                                                            iJulHiImpact = 0;
                                                                                                                            iJulKaizen = 0;
                                                                                                                            iAugHiImpact = 0;
                                                                                                                            iAugKaizen = 0;
                                                                                                                            iSepHiImpact = 0;
                                                                                                                            iSepKaizen = 0;
                                                                                                                            iOctHiImpact = 0;
                                                                                                                            iOctKaizen = 0;
                                                                                                                            iNovHiImpact = 0;
                                                                                                                            iNovKaizen = 0;
                                                                                                                            iDecHiImpact = 0;
                                                                                                                            iDecKaizen = 0;
                                                                                                                            iJanHiImpact = 0;
                                                                                                                            iJanKaizen = 0;
                                                                                                                            iFebHiImpact = 0;
                                                                                                                            iFebKaizen = 0;
                                                                                                                            iMarHiImpact = 0;
                                                                                                                            iMarKaizen = 0;

                                                                                                                        }
                                                                                                                    } else {
                                        %>

                                    <tr>
                                        <%                                                                                                }
                                                                                                                    iNoOfStnDept++;
                                                                                                                }
                                                                                                                if (iRem == 0) {
                                                                                                                    iAprHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 1) {
                                                                                                                    iAprKaizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 2) {
                                                                                                                    iMayHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 3) {
                                                                                                                    iMayKaizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 4) {
                                                                                                                    iJunHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 5) {
                                                                                                                    iJunKaizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 6) {
                                                                                                                    iJulHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 7) {
                                                                                                                    iJulKaizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 8) {
                                                                                                                    iAugHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 9) {
                                                                                                                    iAugKaizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 10) {
                                                                                                                    iSepHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 11) {
                                                                                                                    iSepKaizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 12) {
                                                                                                                    iOctHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 13) {
                                                                                                                    iOctKaizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 14) {
                                                                                                                    iNovHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 15) {
                                                                                                                    iNovKaizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 16) {
                                                                                                                    iDecHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 17) {
                                                                                                                    iDecKaizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 18) {
                                                                                                                    iJanHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 19) {
                                                                                                                    iJanKaizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 20) {
                                                                                                                    iFebHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 21) {
                                                                                                                    iFebKaizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 22) {
                                                                                                                    iMarHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else if (iRem == 23) {
                                                                                                                    iMarKaizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                }
                                                                                                                if (iRem % 2 == 0) {
                                                                                                                    iRowHiImpact += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                } else {
                                                                                                                    iRowKizen += Integer.parseInt(sTot.replace("&nbsp;", "0"));
                                                                                                                }

                                                                                                                //if (iCnt >= 0 && iCnt <= 23) {
                                                                                                                if (iRem % 2 == 0) {
                                        %>
                                        <!--td><b><font face="verdana" size="1pt">Hi-impact</font></b></td-->
                                        <td align="center" onclick="search('<%= sStnCd%>','<%= sDeptCd%>','<%= sMon%>','<%= sCatgCd %>')"><%= sTot%></td>
                                        <%                                        } else {
                                        %>
                                        <!--td><b><font face="verdana" size="1pt">Kaizen</font></b></td-->
                                        <td align="center" onclick="search('<%= sStnCd%>','<%= sDeptCd%>','<%= sMon%>','<%= sCatgCd %>')"><%= sTot%></td>
                                        <%                                                                        }
                                                                                                                //} else {
                                        %>
                                        <!--td align="center">&nbsp;&nbsp;&nbsp;&nbsp;< sTot>&nbsp;&nbsp;&nbsp;&nbsp;</td-->
                                        <%
                                                                                                                //}
                                                                                                                if (iRem == 23) {

                                        %>
                                        <td align="center"><%= ("" + iRowHiImpact)%></td>
                                        <td align="center"><%= ("" + iRowKizen)%></td>
                                    </tr>
                                    <%
                                                                            iRowHiImpact = 0;
                                                                            iRowKizen = 0;
                                                                        }
                                                                    }
                                                                    iGrandAprHiImpact += iAprHiImpact;
                                                                    iGrandAprKaizen += iAprKaizen;
                                                                    iGrandMayHiImpact += iMayHiImpact;
                                                                    iGrandMayKaizen += iMayKaizen;
                                                                    iGrandJunHiImpact += iJunHiImpact;
                                                                    iGrandJunKaizen += iJunKaizen;
                                                                    iGrandJulHiImpact += iJulHiImpact;
                                                                    iGrandJulKaizen += iJulKaizen;
                                                                    iGrandAugHiImpact += iAugHiImpact;
                                                                    iGrandAugKaizen += iAugKaizen;
                                                                    iGrandSepHiImpact += iSepHiImpact;
                                                                    iGrandSepKaizen += iSepKaizen;
                                                                    iGrandOctHiImpact += iOctHiImpact;
                                                                    iGrandOctKaizen += iOctKaizen;
                                                                    iGrandNovHiImpact += iNovHiImpact;
                                                                    iGrandNovKaizen += iNovKaizen;
                                                                    iGrandDecHiImpact += iDecHiImpact;
                                                                    iGrandDecKaizen += iDecKaizen;
                                                                    iGrandJanHiImpact += iJanHiImpact;
                                                                    iGrandJanKaizen += iJanKaizen;
                                                                    iGrandFebHiImpact += iFebHiImpact;
                                                                    iGrandFebKaizen += iFebKaizen;
                                                                    iGrandMarHiImpact += iMarHiImpact;
                                                                    iGrandMarKaizen += iMarKaizen;
                                    %>
                                    <tr>
                                        <td align="center"><%= iAprHiImpact%></td>
                                        <td align="center"><%= iAprKaizen%></td>
                                        <td align="center"><%= iMayHiImpact%></td>
                                        <td align="center"><%= iMayKaizen%></td>
                                        <td align="center"><%= iJunHiImpact%></td>
                                        <td align="center"><%= iJunKaizen%></td>
                                        <td align="center"><%= iJulHiImpact%></td>
                                        <td align="center"><%= iJulKaizen%></td>
                                        <td align="center"><%= iAugHiImpact%></td>
                                        <td align="center"><%= iAugKaizen%></td>
                                        <td align="center"><%= iSepHiImpact%></td>
                                        <td align="center"><%= iSepKaizen%></td>
                                        <td align="center"><%= iOctHiImpact%></td>
                                        <td align="center"><%= iOctKaizen%></td>
                                        <td align="center"><%= iNovHiImpact%></td>
                                        <td align="center"><%= iNovKaizen%></td>
                                        <td align="center"><%= iDecHiImpact%></td>
                                        <td align="center"><%= iDecKaizen%></td>
                                        <td align="center"><%= iJanHiImpact%></td>
                                        <td align="center"><%= iJanKaizen%></td>
                                        <td align="center"><%= iFebHiImpact%></td>
                                        <td align="center"><%= iFebKaizen%></td>
                                        <td align="center"><%= iMarHiImpact%></td>
                                        <td align="center"><%= iMarKaizen%></td>
                                        <td align="center"><%= iAprHiImpact + iMayHiImpact + iJunHiImpact + iJulHiImpact + iAugHiImpact + iSepHiImpact + iOctHiImpact + iNovHiImpact + iDecHiImpact + iJanHiImpact + iFebHiImpact + iMarHiImpact%></td>
                                        <td align="center"><%= iAprKaizen + iMayKaizen + iJunKaizen + iJulKaizen + iAugKaizen + iSepKaizen + iOctKaizen + iNovKaizen + iDecKaizen + iJanKaizen + iFebKaizen + iMarKaizen%></td>

                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><%= iAprHiImpact + iAprKaizen%></td>
                                        <td colspan="2" align="center"><%= iMayHiImpact + iMayKaizen%></td>
                                        <td colspan="2" align="center"><%= iJunHiImpact + iJunKaizen%></td>
                                        <td colspan="2" align="center"><%= iJulHiImpact + iJulKaizen%></td>
                                        <td colspan="2" align="center"><%= iAugHiImpact + iAugKaizen%></td>
                                        <td colspan="2" align="center"><%= iSepHiImpact + iSepKaizen%></td>
                                        <td colspan="2" align="center"><%= iOctHiImpact + iOctKaizen%></td>
                                        <td colspan="2" align="center"><%= iNovHiImpact + iNovKaizen%></td>
                                        <td colspan="2" align="center"><%= iDecHiImpact + iDecKaizen%></td>
                                        <td colspan="2" align="center"><%= iJanHiImpact + iJanKaizen%></td>
                                        <td colspan="2" align="center"><%= iFebHiImpact + iFebKaizen%></td>
                                        <td colspan="2" align="center"><%= iMarHiImpact + iMarKaizen%></td>
                                        <td colspan="2" align="center"><%= iAprHiImpact + iAprKaizen + iMayHiImpact + iMayKaizen + iJunHiImpact + iJunKaizen + iJulHiImpact + iJulKaizen + iAugHiImpact + iAugKaizen + iSepHiImpact + iSepKaizen + iOctHiImpact + iOctKaizen + iNovHiImpact + iNovKaizen + iDecHiImpact + iDecKaizen + iJanHiImpact + iJanKaizen + iFebHiImpact + iFebKaizen + iMarHiImpact + iMarKaizen%></td>

                                    </tr>
                                    <script>
                                        $("#col_<%= sPrevStnCd%>").attr('rowSpan',<%= iNoOfStnDept%>);

                                    </script>

                                    <tr>
                                        <td align="center"><%= iGrandAprHiImpact%></td>
                                        <td align="center"><%= iGrandAprKaizen%></td>
                                        <td align="center"><%= iGrandMayHiImpact%></td>
                                        <td align="center"><%= iGrandMayKaizen%></td>
                                        <td align="center"><%= iGrandJunHiImpact%></td>
                                        <td align="center"><%= iGrandJunKaizen%></td>
                                        <td align="center"><%= iGrandJulHiImpact%></td>
                                        <td align="center"><%= iGrandJulKaizen%></td>
                                        <td align="center"><%= iGrandAugHiImpact%></td>
                                        <td align="center"><%= iGrandAugKaizen%></td>
                                        <td align="center"><%= iGrandSepHiImpact%></td>
                                        <td align="center"><%= iGrandSepKaizen%></td>
                                        <td align="center"><%= iGrandOctHiImpact%></td>
                                        <td align="center"><%= iGrandOctKaizen%></td>
                                        <td align="center"><%= iGrandNovHiImpact%></td>
                                        <td align="center"><%= iGrandNovKaizen%></td>
                                        <td align="center"><%= iGrandDecHiImpact%></td>
                                        <td align="center"><%= iGrandDecKaizen%></td>
                                        <td align="center"><%= iGrandJanHiImpact%></td>
                                        <td align="center"><%= iGrandJanKaizen%></td>
                                        <td align="center"><%= iGrandFebHiImpact%></td>
                                        <td align="center"><%= iGrandFebKaizen%></td>
                                        <td align="center"><%= iGrandMarHiImpact%></td>
                                        <td align="center"><%= iGrandMarKaizen%></td>
                                        <td align="center"><%= iGrandAprHiImpact + iGrandMayHiImpact + iGrandJunHiImpact + iGrandJulHiImpact + iGrandAugHiImpact + iGrandSepHiImpact + iGrandOctHiImpact + iGrandNovHiImpact + iGrandDecHiImpact + iGrandJanHiImpact + iGrandFebHiImpact + iGrandMarHiImpact%></td>
                                        <td align="center"><%= iGrandAprKaizen + iGrandMayKaizen + iGrandJunKaizen + iGrandJulKaizen + iGrandAugKaizen + iGrandSepKaizen + iGrandOctKaizen + iGrandNovKaizen + iGrandDecKaizen + iGrandJanKaizen + iGrandFebKaizen + iGrandMarKaizen%></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center"><%= iGrandAprHiImpact + iGrandAprKaizen%></td>
                                        <td colspan="2" align="center"><%= iGrandMayHiImpact + iGrandMayKaizen%></td>
                                        <td colspan="2" align="center"><%= iGrandJunHiImpact + iGrandJunKaizen%></td>
                                        <td colspan="2" align="center"><%= iGrandJulHiImpact + iGrandJulKaizen%></td>
                                        <td colspan="2" align="center"><%= iGrandAugHiImpact + iGrandAugKaizen%></td>
                                        <td colspan="2" align="center"><%= iGrandSepHiImpact + iGrandSepKaizen%></td>
                                        <td colspan="2" align="center"><%= iGrandOctHiImpact + iGrandOctKaizen%></td>
                                        <td colspan="2" align="center"><%= iGrandNovHiImpact + iGrandNovKaizen%></td>
                                        <td colspan="2" align="center"><%= iGrandDecHiImpact + iGrandDecKaizen%></td>
                                        <td colspan="2" align="center"><%= iGrandJanHiImpact + iGrandJanKaizen%></td>
                                        <td colspan="2" align="center"><%= iGrandFebHiImpact + iGrandFebKaizen%></td>
                                        <td colspan="2" align="center"><%= iGrandMarHiImpact + iGrandMarKaizen%></td>
                                        <td colspan="2" align="center"><%= iGrandAprHiImpact + iGrandAprKaizen + iGrandMayHiImpact + iGrandMayKaizen + iGrandJunHiImpact + iGrandJunKaizen + iGrandJulHiImpact + iGrandJulKaizen + iGrandAugHiImpact + iGrandAugKaizen + iGrandSepHiImpact + iGrandSepKaizen + iGrandOctHiImpact + iGrandOctKaizen + iGrandNovHiImpact + iGrandNovKaizen + iGrandDecHiImpact + iGrandDecKaizen + iGrandJanHiImpact + iGrandJanKaizen + iGrandFebHiImpact + iGrandFebKaizen + iGrandMarHiImpact + iGrandMarKaizen%></td>
                                    </tr>


                                </table>

                            </div>
                            <div class="fixedFoot">

                            </div>
                        </div>
                    </div>

                    <script>
                        parent.animatedcollapse.hide('div_img')
                    </script>

                    <%

                                }

                    %>

                    </center>

                    </body>
                    </html>
