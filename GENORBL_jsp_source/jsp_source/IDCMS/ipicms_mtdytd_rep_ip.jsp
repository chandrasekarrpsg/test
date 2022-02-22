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
                    var maintbheight = 450;
                    var maintbwidth = 920;

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

            function chkVal(){

                animatedcollapse.show("div_img");
                return true ;
            }
        </script>

    </head>
    <body onload="">
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
            <font face="Times New Roman" size="4" color="mediumblue"><b></b></font>
            <br>
            <form name="form_1" action = "ipicms_mtdytd_rep_op.jsp" method="post" target="iFrameIpicmsRepOp" onsubmit="return chkVal();">
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
                <div style="background-color : #deffdd">
                    <table width="80%">
                        <tr>
                            <td width="50%" align="left" style="border : 0pt">MTD & YTD KAIZEN REPORT FOR FINANCIAL YEAR :&nbsp;&nbsp; 
                            </td>
                            <td width="20%" align="left" style="border : 0pt">
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
                                                    sFinYr = (String) iterateOuter.next();
                                                    //iterateInner = rows.iterator();
                                                    //while (iterateInner.hasNext()) {

                                                    //sFinYrFrm = (String) iterateInner.next();
                                                    //sFinYr = (String) iterateInner.next();

                                                    //}%>
                                    <option value = "<%= sFinYr%>"><%= sFinYr%></option>
                                    <% }
                                    %>

                                </select>
                            </td>

                            <td width="20%" align="left" style="border : 0pt">
                                <input type="submit" value="SUBMIT"/>
                            </td>
                            <td width="10%" align="left" style="border : 0pt">
                                <div id="div_img" style="display : none">
                                    <center><img src="Pics/Order/ajax-loader5.gif" /></center>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </form>

            <iframe id ="iFrameIpicmsRepOp" name ="iFrameIpicmsRepOp" src="" frameborder ="0" height="480px" width="1000px">

            </iframe>

        </center>

        <script>

            animatedcollapse.addDiv('div_img','optional_attribute_string');
            animatedcollapse.init();

            //var t = new ScrollableTable(document.getElementById('fixedTable'), 400,950);
        </script>


    </body>
</html>
