<html>

    <head>
        <meta name="GENERATOR" content="Microsoft FrontPage 3.0">
        <meta name="Microsoft Border" content="none">
        <base target="contents">
        <title>Banner</title>

        <style>
            .sel{
                cursor: hand;
                font-family: Times New Roman;
                font-style: normal;
                font-weight: bold;
                background-color: silver;
                color: navy;
                text-decoration: none
            }
            .desel {
                cursor: hand;
                font-family: Times New Roman;
                font-style: normal;
                background-color: aqua;
                color: silver;
                text-decoration: none
            }
        </style>
    </head>
    <script language="javascript">

        function detail(qstring)
        {
            window.open("order_entry.asp?"+qstring,"detail");
        }



        function show_o(qstring) {
            t1.className="sel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="desel";
            t6.className="desel";
            t7.className="desel";
            t8.className="desel";
            t9.className="desel";
            t10.className="desel";
            //window.open("order_entry.asp?"+qstring,"detail");
            form_1.action="order_entry.jsp";
            form_1.method="post";
            form_1.sDept.value=sDept;
            form_1.sUnit.value=sUnit;
            form_1.sTc.value=sTc;
            form_1.sJobTyp.value=sJobTyp;
            form_1.sOrdId.value=sOrdId;
            form_1.submit();
        }
        function show_q(qstring) {
            t1.className="desel";
            t2.className="sel";
            t3.className="desel";
            t4.className="desel";
            t5.className="desel";
            t6.className="desel";
            t7.className="desel";
            t8.className="desel";
            t9.className="desel";
            t10.className="desel";
            window.open("quotation_entry.asp?"+qstring,"detail");
        }
        function show_b(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="sel";
            t4.className="desel";
            t5.className="desel";
            t6.className="desel";
            t7.className="desel";
            t8.className="desel";
            t9.className="desel";
            t10.className="desel";
            window.open("bill_list.asp?"+qstring,"detail");
        }


        function show_cancel_order(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="desel";
            t6.className="desel";
            t7.className="desel";
            t8.className="desel";
            t9.className="sel";
            t10.className="desel";
            window.open("order_cancel.asp?"+qstring,"detail");
        }



        function show_annex(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="sel";
            t5.className="desel";
            t6.className="desel";
            t7.className="desel";
            t8.className="desel";
            t9.className="desel";
            t10.className="desel";
            form_1.action="Annexure_entry.jsp";
            form_1.method="post";
            form_1.sDept.value=sDept;
            form_1.sUnit.value=sUnit;
            form_1.sTc.value=sTc;
            form_1.sJobTyp.value=sJobTyp;
            form_1.sOrdId.value=sOrdId;
            form_1.submit();
            //window.open("Annexure_entry.asp?"+qstring,"detail");
        }

        function show_rep_o(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="sel";
            t6.className="desel";
            t7.className="desel";
            t8.className="desel";
            t9.className="desel";
            t10.className="desel";
            window.open("onetime_order.asp?"+qstring,"detail");
        }

        function show_rep_tc(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="sel";
            t6.className="desel";
            t7.className="desel";
            t8.className="desel";
            t9.className="desel";
            t10.className="desel";
            window.open("tc_order.asp?"+qstring,"detail");
        }





        function show_rep_o_file(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="desel";
            t6.className="sel";
            t7.className="desel";
            t8.className="desel";
            t9.className="desel";
            t10.className="desel";
            window.open("onetime_order.asp?"+qstring,"detail");
        }

        function show_rep_tc_file(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="desel";
            t6.className="sel";
            t7.className="desel";
            t8.className="desel";
            t9.className="desel";
            t10.className="desel";
            window.open("tc_order.asp?"+qstring,"detail");
        }




        function show_rep_o_file_p1(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="desel";
            t6.className="sel";
            t7.className="desel";
            t8.className="desel";
            t9.className="desel";
            t10.className="desel";
            window.open("onetime_order_p1.asp?"+qstring,"detail");
        }



        function show_rep_o_file_p2(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="desel";
            t6.className="desel";
            t7.className="desel";
            t8.className="desel";
            t9.className="desel";
            t9.className="sel";
            t10.className="desel";
            window.open("onetime_order_p2.asp?"+qstring,"detail");
        }




        function show_rep_tc_file_p1(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="desel";
            t6.className="sel";
            t7.className="desel";
            t8.className="desel";
            t9.className="desel";
            t10.className="desel";
            window.open("tc_order_p1.asp?"+qstring,"detail");
        }



        function show_rep_tc_file_p2(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="desel";
            t6.className="desel";
            t7.className="desel";
            t8.className="desel";
            t9.className="sel";
            t10.className="desel";
            window.open("tc_order_p2.asp?"+qstring,"detail");
        }




        function show_rep_o_fin(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="desel";
            t6.className="desel";
            t7.className="sel";
            t8.className="desel";
            t9.className="desel";
            t10.className="desel";
            window.open("onetime_order.asp?"+qstring,"detail");
        }

        function show_rep_tc_fin(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="desel";
            t6.className="desel";
            t7.className="sel";
            t8.className="desel";
            t9.className="desel";
            t10.className="desel";
            window.open("tc_order.asp?"+qstring,"detail");
        }

        function show_rep_annex(qstring) {
            t1.className="desel";
            t2.className="desel";
            t3.className="desel";
            t4.className="desel";
            t5.className="desel";
            t6.className="desel";
            t7.className="desel";
            t8.className="sel";
            t9.className="desel";
            t10.className="desel";
            window.open("Annexure_report.asp?"+qstring,"detail");
        }


        function back_ocl(){
            var order_list_qrystr="=session(order_list_qrystr)"
            var url="order_list.asp" + order_list_qrystr
            //alert(url)
            window.parent.navigate(url)
            //history.back()
        }

    </script>


    <body bgcolor="ghostwhite" text="#000080">
        <%

                    String sJobTyp = request.getParameter("sJobTyp");
                    String sUnit = request.getParameter("sUnit");
                    String sDept = request.getParameter("sDept");
                    String sTc = request.getParameter("sTc");
                    String sOrdId = request.getParameter("sOrdId");
        %>
        <div align="center"><center>

                <table border="1" cellpadding="2" cellspacing="4" style="border-collapse: collapse; border-style: outset; border-width: 0; ">
                    <tr>
                        <%
                                    if (sOrdId.equals("")) {
                        %>
                        <td id="t1" bgcolor="#00ffff"
                            onMouseOver="window.event.srcElement.style.cursor='hand'"
                            onclick="show_o();"
                            style="border-color : #800000 ; border-style: outset; border-width: 4pt; padding-left:2pt; padding-right:2pt; padding-top:0pt"
                            <p align="center"><font size="3"><strong>Order Entry</strong></font></p>
                        </td>
                        <%                                                    }
                        %>
                        <td id="t4" bgcolor="#00ffff"
                            style="border-color : #800000 ; border-style: outset; border-width: 4pt; padding-left:2pt; padding-right:2pt; padding-top:0pt"
                            onMouseOver="window.event.srcElement.style.cursor='hand'"
                            onclick="return show_annex('dept=<=dept>&amp;contract_type=<=contract_type>&amp;rev=<=rev>&amp;sl_no=<=sl_no>&amp;last_rev_no=<=last_rev_no>&amp;ord_ref=<=ord_ref>')">

                            <p align="center"><font size="3"><strong>Annexure Entry</strong></font></p></td>
                        <td id="t2" bgcolor="#00ffff"
                            onMouseOver="window.event.srcElement.style.cursor='hand'"
                            onclick="return show_q('dept=<=dept>&amp;contract_type=<=contract_type>&amp;rev=<=rev>&amp;sl_no=<=sl_no>&amp;last_rev_no=<=last_rev_no>&amp;ord_ref=<=ord_ref>')"
                            style="border-color : #800000 ; border-style: outset; border-width: 4pt; padding-left:2pt; padding-right:2pt; padding-top:0pt">
                            <font size="3"><strong>Quotation Entry</strong></font></td>
                        <td id="t3" bgcolor="#00ffff" 
                            style="border-color : #800000 ; border-style: outset; border-width: 4pt; padding-left:2pt; padding-right:2pt; padding-top:0pt"
                            onMouseOver="window.event.srcElement.style.cursor='hand'"
                            onclick="return show_b('dept=<=dept>&amp;contract_type=<=contract_type>&amp;rev=<=rev>&amp;sl_no=<=sl_no>&amp;last_rev_no=<=last_rev_no>&amp;ord_ref=<=ord_ref>')">
                            <p align="center"><font size="3"><strong>Bill Entry</strong></font></p>
                        </td>
                        <td id="t10" bgcolor="#00ffff" 
                            style="border-color : #800000 ; border-style: outset; border-width: 4pt; padding-left:2pt; padding-right:2pt; padding-top:0pt"
                            onMouseOver="window.event.srcElement.style.cursor='hand'"
                            onclick="return show_cancel_order('dept=<=dept>&amp;contract_type=<=contract_type>&amp;rev=<=rev>&amp;sl_no=<=sl_no>&amp;last_rev_no=<=last_rev_no>&amp;ord_ref=<=ord_ref>')">
                            <p align="center"><font size="3"><strong>Cancel Order</strong></font></p>
                        </td>
                        <td id="t5" bgcolor="#00ffff" 
                            style="border-color : #800000 ; border-style: outset; border-width: 4pt; padding-left:2pt; padding-right:2pt; padding-top:0pt"
                            onMouseOver="window.event.srcElement.style.cursor='hand'"
                            onclick="return show_rep_o('ord_ref==ord_ref&amp;typ=C')">
                            <p align="center"><font size="3"><strong>Contractor Copy</strong></font></p>
                        </td>
                        <td id="t6" bgcolor="#00ffff" 
                            style="border-color : #800000 ; border-style: outset; border-width: 4pt; padding-left:2pt; padding-right:2pt; padding-top:0pt"
                            onmouseover="window.event.srcElement.style.cursor='hand'"
                            onclick="return show_rep_o_file_p1('ord_ref=<=ord_ref>&amp;typ=F')">
                            <p align="center"><font size="3"><strong>File Copy(Page 1)</strong></font></p></td>
                        <td id="t9" bgcolor="#00ffff" 
                            style="border-color : #800000 ; border-style: outset; border-width: 4pt; padding-left:2pt; padding-right:2pt; padding-top:0pt"
                            onmouseover="window.event.srcElement.style.cursor='hand'"
                            onclick="return show_rep_o_file_p2('ord_ref=<=ord_ref>&amp;typ=F')">            
                            <p align="center"><strong><font size="3">File Copy(Page 2)</font></strong></p>
                        </td>
                        <td id="t7" bgcolor="#00ffff" 
                            style="border-color : #800000 ; border-style: outset; border-width: 4pt; padding-left:2pt; padding-right:2pt; padding-top:0pt"
                            onmouseover="window.event.srcElement.style.cursor='hand'"
                            onclick="return show_rep_o_fin('ord_ref=<=ord_ref>&amp;typ=Fin')">
                            <p align="center"><strong><font size="3">Finance Copy</font></strong></p>
                        </td>
                        <td id="t8" bgcolor="#00ffff" 
                            style="border-color : #800000 ; border-style: outset; border-width: 4pt; padding-left:2pt; padding-right:2pt; padding-top:0pt"
                            onmouseover="window.event.srcElement.style.cursor='hand'"
                            onclick="return show_rep_annex('ord_ref=<=ord_ref>&amp;typ=Fin')">
                            <p align="center"><strong><font size="3">Annexure</font></strong></p>
                        </td>
                        <td onclick="return back_ocl('')"
                            style="border-color : #800000 ; border-style: outset; border-width: 4pt; padding-left:2pt; padding-right:2pt; padding-top:0pt">
                            <input type="button" value="Back to List" name="back">
                        </td>
                    </tr>
                </table>
            </center></div>
                        
                        <form name="form_1" target="detail">
                            <input type="hidden" name="sDept"/>
                            <input type="hidden" name="sUnit"/>
                            <input type="hidden" name="sJobTyp"/>
                            <input type="hidden" name="sTc"/>
                            <input type="hidden" name="sOrdId"/>
                        </form>

        <script type="text/javascript">
            var sDept = "<%= sDept%>";
            var sUnit = "<%= sUnit%>";
            var sJobTyp = "<%= sJobTyp%>";
            var sTc = "<%= sTc%>";
            var sOrdId = "<%= sOrdId%>";

        </script>
    </body>
</html>
