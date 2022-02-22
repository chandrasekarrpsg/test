<%-- 
    Document   : bill_entry
    Created on : Dec 26, 2012, 2:48:58 PM
    Author     : debasis saha
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="Order.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%!    OrderProcessBeanRemote hRemote = null;
    //htmaNewRemote hRemote1 = null ;
    InitialContext ic = null;

    public void jspInit() {
        try {
            ic = new InitialContext();
            //hRemote = (OrderProcessBeanRemote) ic.lookup("Order.OrderProcessBeanRemote");
            hRemote = (OrderProcessBeanRemote) ic.lookup("java:comp/env/OrderProcessBeanRemote");
            //hRemote = (OrderProcessBeanRemote) ic.lookup("ejb/OrderProcessBean");
            //hRemote1 = (htmaNewRemote)ic.lookup(htmaNewRemote.class.getName());
        } catch (Exception e) {
            System.out.println("bill_entry.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript" src="js/sel_date.js"></script>
        <script type="text/javascript" src="js/sel_month.js"></script>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/animatedcollapse.js"></script>
        <script type="text/javascript" src="js/ordGenScript.js"></script>
        <script type="text/javascript" src="js/ordBlScrnScript.js"></script>
        <script>

            function preScript(){
                /*if(f1.sOrdGenStnCd.value == '014' || f1.sOrdGenStnCd.value == '002'){
                    animatedcollapse.show('divIso_1');
                }*/

                chngBill_type();

                if(f1.hUrgntPmnt.value == 'Y'){
                    f1.sUrgntPmnt.checked = 1;
                    animatedcollapse.show("divUrgntPmntPrntOut");

                }else{
                    f1.sUrgntPmnt.checked = 0;
                    animatedcollapse.hide("divUrgntPmntPrntOut");

                }
                if(f1.hUrgntPmntInvAttach.value == 'Y'){
                    f1.sUrgntPmntInvAttach.checked = 1;
                }else if(f1.hUrgntPmntInvAttach.value == 'N'){
                    f1.sUrgntPmntInvAttach.checked = 0;
                }

                if(f1.sOrdForStnCd.value != '019' && f1.sOrdForStnCd.value != '042'){
                    if(f1.sOrdTyp.value == 'T' || f1.sOrdTyp.value == 'R'
                        ||
                        f1.sJobComp.value == 'N' && (f1.sOrdTyp.value == 'O' || f1.sOrdTyp.value == 'L' || f1.sOrdTyp.value == 'C')){

                        animatedcollapse.hide("divIso_2");
                        animatedcollapse.show("divIso_1");
                        clickImg(f1.imgIso_2);
                    }
                }

                
                if(f1.hCancel.value == 'Y')f2.sCancel.checked = 1;

                butnDisplay();

                f1.sBlRecvdDt.focus();
                f1.sBlRecvdDt.select();

                //getDiffPermit();
                calcSBlAmt();
                menuDisplay();


            }

            var iShow_1=0;
            var iShow_2=0;
            var iShow_3=0;           

            function show(div_no){
            
                if(div_no == 1){
                    if(iShow_1 == 0){
                        iShow_1=1;                       
                        animatedcollapse.show('div_1');
                        document.f1.img_1.src='Pics/Order/minus_1.png';
                        //alert(document.getElementById("span_1").data);
                        //document.getElementById("span_1").firstChild.data="hide";
                    }else{

                        iShow_1=0;
                        animatedcollapse.hide('div_1');
                        document.f1.img_1.src='Pics/Order/plus_1.png';
                        //document.getElementById("span_1").firstChild.data="show";
                    }
                    

                }else if(div_no == 2){
                    
                    if(iShow_2 == 0){
                        iShow_2=1;
                        animatedcollapse.show('div_2');
                        //alert(document.getElementById("span_1").data);
                        //document.getElementById("span_2").firstChild.data="hide";
                    }else{

                        iShow_2=0;
                        animatedcollapse.hide('div_2');
                        //document.getElementById("span_2").firstChild.data="show";
                    }
                }else if(div_no == 3){
                    if(iShow_3 == 0){
                        iShow_3=1;
                        animatedcollapse.show('div_3');
                        //alert(document.getElementById("span_1").data);
                        //document.getElementById("span_2").firstChild.data="hide";
                    }else{

                        iShow_3=0;
                        animatedcollapse.hide('div_3');
                        //document.getElementById("span_2").firstChild.data="show";
                    }
                }
            }


            function clickImg(obj){
                var imgNm = obj.src.substring(obj.src.lastIndexOf('/')+1,obj.src.length);
                //alert(imgNm);
                if(obj.name=='imgBlRmrk' || obj.name=='imgUrgntPmnt' || obj.name=='imgCancel_2' || obj.name=='imgIso_2'){
                    if(imgNm ==  'plus_1.png'){
                        //alert('div'+obj.name.substring(3))
                        animatedcollapse.show('div'+obj.name.substring(3));
                        obj.src =  'Pics/Order/minus_1.png'
                    }else if(imgNm == 'minus_1.png'){
                        animatedcollapse.hide('div'+obj.name.substring(3));
                        obj.src =  'Pics/Order/plus_1.png'
                    }
                }
                return true ;
            }

            function edit(){
                edit_onclick();
            }

            function old() {
                lock_controls(0);
            }

            function blCancel(sUpdRmrk){

                alert(sUpdRmrk);
                if(sUpdRmrk == 'Cancel Sucessful !'){
                    f1.hCancel.value = 'Y';
                    butnDisplay();
                    getDiffPermit();
                }
                return true;
            }

            function setChkBoxVal(obj){
                if(obj.checked == 1)obj.value = 'Y'
                else obj.value = 'N'
             
                return true;
            }

            var chngBill_type = function(){

                if( f1.sBill_type.value == '' ){
                    animatedcollapse.hide('divServTax_1');
                    animatedcollapse.hide('divServTax_2');
                    animatedcollapse.hide('divVat_1');
                    animatedcollapse.hide('divVat_2');
                    animatedcollapse.hide('divOt_1');
                    animatedcollapse.hide('divOt_2');
                    animatedcollapse.hide('divOthAmt_1');
                    animatedcollapse.hide('divOthAmt_2');
                    animatedcollapse.hide('divGst_other_amount_1');
                    animatedcollapse.hide('divGst_other_amount_2');
                    animatedcollapse.hide('divGst_taxable_amount_1');
                    animatedcollapse.hide('divGst_taxable_amount_2');
                    animatedcollapse.hide('divCgst_1');
                    animatedcollapse.hide('divCgst_2');
                    animatedcollapse.hide('divSgst_1');
                    animatedcollapse.hide('divSgst_2');
                    animatedcollapse.hide('divGst_1');
                    animatedcollapse.hide('divGst_2');
                    animatedcollapse.hide('divIgst_1');
                    animatedcollapse.hide('divIgst_2');
                    animatedcollapse.hide('divOther_tax_desc_1');
                    animatedcollapse.hide('divOther_tax_desc_2');
                    animatedcollapse.hide('divOther_tax_amount_1');
                    animatedcollapse.hide('divOther_tax_amount_2');
                    animatedcollapse.hide('divOvertime_1');
                    animatedcollapse.hide('divOvertime_2');
                }else if( f1.sBill_type.value == '1' ){
                    animatedcollapse.show('divServTax_1');
                    animatedcollapse.show('divServTax_2');
                    animatedcollapse.show('divVat_1');
                    animatedcollapse.show('divVat_2');
                    animatedcollapse.show('divOt_1');
                    animatedcollapse.show('divOt_2');
                    animatedcollapse.show('divOthAmt_1');
                    animatedcollapse.show('divOthAmt_2');
                    animatedcollapse.hide('divGst_other_amount_1');
                    animatedcollapse.hide('divGst_other_amount_2');
                    animatedcollapse.hide('divGst_taxable_amount_1');
                    animatedcollapse.hide('divGst_taxable_amount_2');
                    animatedcollapse.hide('divCgst_1');
                    animatedcollapse.hide('divCgst_2');
                    animatedcollapse.hide('divSgst_1');
                    animatedcollapse.hide('divSgst_2');
                    animatedcollapse.hide('divGst_1');
                    animatedcollapse.hide('divGst_2');
                    animatedcollapse.hide('divIgst_1');
                    animatedcollapse.hide('divIgst_2');
                    animatedcollapse.hide('divOther_tax_desc_1');
                    animatedcollapse.hide('divOther_tax_desc_2');
                    animatedcollapse.hide('divOther_tax_amount_1');
                    animatedcollapse.hide('divOther_tax_amount_2');
                    animatedcollapse.hide('divOvertime_1');
                    animatedcollapse.hide('divOvertime_2');

                }else if( f1.sBill_type.value == '2' ){
                    animatedcollapse.hide('divServTax_1');
                    animatedcollapse.hide('divServTax_2');
                    animatedcollapse.hide('divVat_1');
                    animatedcollapse.hide('divVat_2');
                    animatedcollapse.hide('divOt_1');
                    animatedcollapse.hide('divOt_2');
                    animatedcollapse.hide('divOthAmt_1');
                    animatedcollapse.hide('divOthAmt_2');
                    animatedcollapse.show('divGst_other_amount_1');
                    animatedcollapse.show('divGst_other_amount_2');
                    animatedcollapse.show('divGst_taxable_amount_1');
                    animatedcollapse.show('divGst_taxable_amount_2');
                    animatedcollapse.show('divCgst_1');
                    animatedcollapse.show('divCgst_2');
                    animatedcollapse.show('divSgst_1');
                    animatedcollapse.show('divSgst_2');
                    animatedcollapse.show('divGst_1');
                    animatedcollapse.show('divGst_2');
                    animatedcollapse.show('divIgst_1');
                    animatedcollapse.show('divIgst_2');
                    animatedcollapse.show('divOther_tax_desc_1');
                    animatedcollapse.show('divOther_tax_desc_2');
                    animatedcollapse.show('divOther_tax_amount_1');
                    animatedcollapse.show('divOther_tax_amount_2');
                    animatedcollapse.show('divOvertime_1');
                    animatedcollapse.show('divOvertime_2');

                }

                return true ;
            }

            

        </script>
        <style>
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
            .table {
                font-family     : verdana;
                font-size       : 14px;
                text-align      : left;
            }

            .table_thead  {
                cursor : pointer;
            }

            .table_thead_tr{
                background : #ffdd00;
            }

            .table_tfoot_tr {
                background : #ffffff;
            }

            .table_thead_tr_th{
                border-left   : 1pt solid red ;
                border-top : 1px solid red ;
                border-bottom : 1px solid red ;
            }

            .table_tfoot_tr_th{
                border-left : 1pt solid red ;
                border-top  : 1px solid red ;
            }

            .table_tbody_tr_td{
                border-left   : 1pt solid green ;
                border-right   : 1pt solid green ;
                border-top : 1pt solid green ;
                border-bottom : 1pt solid green ;
            }

        </style>
    </head>
    <body bgcolor="" background="Pics/Order/lblue047.gif" onload="if(f1.sBlId.value == ''){preScript();old();someFldReadOnly();}else{preScript();lock_controls(1);}" onunlouad="ld()">

        <jsp:useBean id="orderBean" class="VO.OrderBean" scope="session"/>

        <form name="f1" align="center" action="OrderProcessServlet" method="post" onsubmit="">
            <input type="hidden" name="sCallNm" value="insUpdBlDtl">
            <input type="hidden" name="bill_cancel" value="<bill_cancel>">
            <input type="hidden" name="bill_cl" value="<bill_cl>">
            <input type="hidden" name="billref" value="<billref>">
            <input type="hidden" name="cert_by" value="<cert_by>">
            <input type="hidden" name="ordref" value="<ordref>">
            <input type="hidden" name="rowid" value="<rowid>">


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





                        String sOrdId = new String();
                        String sBlId = new String();
                        sOrdId = request.getParameter("sOrdId");

                        if (request.getParameter("sBlId") != null) {
                            sBlId = request.getParameter("sBlId");
                        }

                        //System.out.println("sOrdId : " + sOrdId);
                        //System.out.println("sBlId : " + sBlId);
                        String sOrdGenStnCd = new String();
                        String sOrdGenStnShrtNm = new String();
                        String sOrdForStnCd = new String();
                        String sOrdForStnShrtNm = new String();
                        String sOrdForStnLongNm = new String();
                        String sOrdForDeptCd = new String();
                        String sOrdNo = new String();
                        String sOrdSts = new String();
                        String sOrdBy = new String();
                        String sOrdDt = new String();
                        String sJobPlace = new String();
                        String sJobComp = new String();
                        String sOrdTyp = new String();
                        String sRetnPctg = new String();
                        String sOrdAmt = new String();
                        String sOrdMatCost = new String();
                        String sOrdLabChrg = new String();

                        String sMatCost = new String();
                        String sLabChrg = new String();
                        String sGrosAmt = new String();
                        String sErpCd = new String();

                        String sBlNo = new String();
                        String sBlDt = new String();

                        String sBill_type = new String();
                        String sOt = new String();
                        String sServTax = new String();
                        String sVat = new String();
                        String sOthAmt = new String();
                        String sGst_other_amount = new String();
                        String sGst_taxable_amount = new String();
                        String sCgst = new String();
                        String sSgst = new String();
                        String sIgst = new String();
                        String sGst = new String();
                        String sOther_tax_desc = new String();
                        String sOther_tax_amount = new String();
                        String sOvertime = new String();
                        String sBlAmt = new String();

                        String sJobMnth = new String();
                        String sBlRealDt = new String();
                        String sBlRecvdDt = new String();
                        String sBlCertBy = new String();
                        String sBlCertByNm = new String();
                        String sBlRmrk = new String();
                        String sUrgntPmnt = new String();
                        String sUrgntPmntRmrk = new String();
                        String sUrgntPmntInvAttach = new String();
                        String sBlCancel = new String();
                        String sBlCancelBy = new String();
                        String sBlCancelByNm = new String();
                        String sBlCancelDt = new String();
                        String sBlCancelRmrk = new String();

                        String sBlRefId = new String();
                        String sFinRecvdDt = new String();

                        String sJobQuality = new String();
                        String sTimExec = new String();
                        String sEhsComp = new String();

                        String sSysDt = new String();

                        sBlCertBy = sLoginEmpCd;
                        sBlCertByNm = sLoginEmpNm;
                        //sBlCancelBy = sLoginEmpCd;
                        //sBlCancelByNm = sLoginEmpNm;

                        String sOrdCancel = new String();
                        String sOrdCancelWef = new String();


                        Iterator iterateOuter = null;
                        Iterator iterateInner = null;
                        List rows = null;
                        List lstSysDt = null;

                        rows = null;
                        iterateOuter = null;
                        iterateInner = null;
                        lstSysDt = hRemote.getSysDt();
                        iterateOuter = lstSysDt.iterator();
                        while (iterateOuter.hasNext()) {
                            rows = (List) iterateOuter.next();
                            iterateInner = rows.iterator();
                            while (iterateInner.hasNext()) {
                                sSysDt = (String) iterateInner.next();
                            }
                        }

                        sBlRealDt = sSysDt;
                        //sBlCancelDt = sSysDt;




                        iterateOuter = null;
                        iterateInner = null;
                        rows = null;
                        List lstOrdDtls = null;
                        List lstBlDtls = null;

                        if (!sOrdId.equals("")) {
                            rows = null;
                            iterateOuter = null;
                            iterateInner = null;
                            lstOrdDtls = hRemote.getOrdDtls(sOrdId, 2);
                            iterateOuter = lstOrdDtls.iterator();
                            while (iterateOuter.hasNext()) {
                                rows = (List) iterateOuter.next();
                                iterateInner = rows.iterator();
                                while (iterateInner.hasNext()) {
                                    sOrdGenStnCd = (String) iterateInner.next();

                                    List lstStnNm = null;
                                    List rows_2 = null;
                                    Iterator iterateOuter_2 = null;
                                    Iterator iterateInner_2 = null;
                                    lstStnNm = hRemote.getStnNm(sOrdGenStnCd);
                                    iterateOuter_2 = lstStnNm.iterator();
                                    while (iterateOuter_2.hasNext()) {
                                        rows = (List) iterateOuter_2.next();

                                        iterateInner_2 = rows.iterator();
                                        while (iterateInner_2.hasNext()) {
                                            sOrdGenStnShrtNm = (String) iterateInner_2.next();
                                            iterateInner_2.next();

                                        }
                                    }

                                    sOrdForStnCd = (String) iterateInner.next();

                                    lstStnNm = null;
                                    rows_2 = null;
                                    iterateOuter_2 = null;
                                    iterateInner_2 = null;
                                    lstStnNm = hRemote.getStnNm(sOrdForStnCd);
                                    iterateOuter_2 = lstStnNm.iterator();
                                    while (iterateOuter_2.hasNext()) {
                                        rows = (List) iterateOuter_2.next();

                                        iterateInner_2 = rows.iterator();
                                        while (iterateInner_2.hasNext()) {
                                            iterateInner_2.next();
                                            sOrdForStnLongNm = (String) iterateInner_2.next();

                                        }
                                    }
                                    sOrdForDeptCd = (String) iterateInner.next();
                                    sOrdNo = ((String) iterateInner.next()).trim();
                                    sOrdSts = ((String) iterateInner.next()).trim();
                                    sOrdBy = ((String) iterateInner.next()).trim();
                                    sOrdDt = ((String) iterateInner.next()).trim();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    sOrdTyp = (String) iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    sJobPlace = (String) iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    sErpCd = ((String) iterateInner.next()).trim();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    sJobComp = (String) iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    sRetnPctg = ((String) iterateInner.next()).trim();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    sOrdMatCost = ((String) iterateInner.next()).trim();
                                    sMatCost = sOrdMatCost;
                                    sOrdLabChrg = ((String) iterateInner.next()).trim();
                                    sLabChrg = sOrdLabChrg;
                                    iterateInner.next();
                                    sOrdAmt = ((String) iterateInner.next()).trim();

                                    sGrosAmt = "" + (Double.parseDouble("0" + sMatCost) + Double.parseDouble("0" + sLabChrg));

                                    sGrosAmt = sGrosAmt.format("%.2f", Double.parseDouble(sGrosAmt));
                                    sOthAmt = "" + (Double.parseDouble("0" + sOrdAmt) - (Double.parseDouble("0" + sMatCost) + Double.parseDouble("0" + sLabChrg)));
                                    sOthAmt = sOthAmt.format("%.2f", Double.parseDouble(sOthAmt));
                                    sGst_other_amount = sOthAmt.format("%.2f", Double.parseDouble(sOthAmt));
                                    sGst_taxable_amount = "" + (Double.parseDouble("0" + sGrosAmt) + Double.parseDouble(sGst_other_amount));

                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    sOrdCancel = (String) iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    sOrdCancelWef = ((String) iterateInner.next()).trim();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();

                                }
                            }
                            if (!sBlId.equals("")) {
                                rows = null;
                                iterateOuter = null;
                                iterateInner = null;
                                lstBlDtls = hRemote.getBlDtls(sOrdId, sBlId);
                                iterateOuter = lstBlDtls.iterator();
                                while (iterateOuter.hasNext()) {
                                    rows = (List) iterateOuter.next();
                                    iterateInner = rows.iterator();
                                    while (iterateInner.hasNext()) {
                                        sOrdForStnCd = (String) iterateInner.next();

                                        iterateInner.next();
                                        sOrdNo = (String) iterateInner.next();
                                        sBlId = (String) iterateInner.next();
                                        sBlCertBy = (String) iterateInner.next();
                                        List lstUsrDtls = null;
                                        List rows_2 = null;
                                        Iterator iterateOuter_2 = null;
                                        Iterator iterateInner_2 = null;
                                        lstUsrDtls = hRemote.getUsrDtls(sBlCertBy);
                                        iterateOuter_2 = lstUsrDtls.iterator();
                                        while (iterateOuter_2.hasNext()) {
                                            rows = (List) iterateOuter_2.next();

                                            iterateInner_2 = rows.iterator();
                                            while (iterateInner_2.hasNext()) {
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();

                                                sBlCertByNm = (String) iterateInner_2.next() + " " + (String) iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                            }
                                        }
                                        sBlRealDt = ((String) iterateInner.next()).trim();


                                        sBlNo = ((String) iterateInner.next()).trim();
                                        sBlDt = ((String) iterateInner.next()).trim();
                                        sBlRecvdDt = ((String) iterateInner.next()).trim();

                                        sMatCost = ((String) iterateInner.next()).trim();
                                        sLabChrg = ((String) iterateInner.next()).trim();
                                        sGrosAmt = ((String) iterateInner.next()).trim();

                                        sBill_type = ((String) iterateInner.next()).trim();
                                        sServTax = ((String) iterateInner.next()).trim();
                                        sVat = ((String) iterateInner.next()).trim();
                                        sOt = ((String) iterateInner.next()).trim();
                                        sOthAmt = ((String) iterateInner.next()).trim();
                                        sGst_other_amount = ((String) iterateInner.next()).trim();
                                        sGst_taxable_amount = ((String) iterateInner.next()).trim();
                                        sCgst = ((String) iterateInner.next()).trim();
                                        sSgst = ((String) iterateInner.next()).trim();
                                        sIgst = ((String) iterateInner.next()).trim();
                                        sGst = ((String) iterateInner.next()).trim();
                                        sOther_tax_desc = ((String) iterateInner.next()).trim();
                                        sOther_tax_amount = ((String) iterateInner.next()).trim();
                                        sOvertime = ((String) iterateInner.next()).trim();
                                        sBlAmt = ((String) iterateInner.next()).trim();

                                        sRetnPctg = ((String) iterateInner.next()).trim();

                                        sJobMnth = ((String) iterateInner.next()).trim();
                                        sUrgntPmnt = ((String) iterateInner.next()).trim();
                                        sUrgntPmntInvAttach = ((String) iterateInner.next()).trim();
                                        sUrgntPmntRmrk = ((String) iterateInner.next()).trim();
                                        sBlRmrk = ((String) iterateInner.next()).trim();
                                        sJobQuality = ((String) iterateInner.next()).trim();
                                        sTimExec = ((String) iterateInner.next()).trim();
                                        sEhsComp = ((String) iterateInner.next()).trim();
                                        sBlRefId = ((String) iterateInner.next()).trim();
                                        sFinRecvdDt = ((String) iterateInner.next()).trim();
                                        sBlCancel = ((String) iterateInner.next()).trim();
                                        sBlCancelBy = ((String) iterateInner.next()).trim();

                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstUsrDtls = hRemote.getUsrDtls(sBlCancelBy);
                                        iterateOuter_2 = lstUsrDtls.iterator();
                                        while (iterateOuter_2.hasNext()) {
                                            rows = (List) iterateOuter_2.next();

                                            iterateInner_2 = rows.iterator();
                                            while (iterateInner_2.hasNext()) {
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();

                                                sBlCancelByNm = (String) iterateInner_2.next() + " " + (String) iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                            }
                                        }
                                        sBlCancelDt = ((String) iterateInner.next()).trim();
                                        sBlCancelRmrk = ((String) iterateInner.next()).trim();


                                        //sFinRef = ((String) iterateInner.next()).trim();
                                        //sFinDt = ((String) iterateInner.next()).trim();


                                    }
                                }
                            }

                            if (sRetnPctg.equals("")) {
                                sRetnPctg = "NIL";
                            }

                            if (sBlCancelBy.equals("")) {
                                sBlCancelBy = sLoginEmpCd;
                                sBlCancelByNm = sLoginEmpNm;
                                sBlCancelDt = sSysDt;
                            }


                            String sOrdEntryPermit = new String();

                            String sBlEntryPermit = new String();
                            String sBlSrchPermit = new String();
                            String sOrdCopyPermit = new String();
                            String sBlEditPermit = new String();
                            String sBlCancelPermit = new String();

                            //String sBlEditPermit = "true";
                            //String sBlCancelPermit = "true";


                            rows = null;
                            iterateOuter = null;
                            iterateInner = null;

                            Map mapDiffPermit = new HashMap();
                            mapDiffPermit.put("sLoginEmpCd", sLoginEmpCd);
                            mapDiffPermit.put("sLoginEmpLvl", sLoginEmpLvl);
                            mapDiffPermit.put("sLoginAdmMkr", sLoginAdmMkr);
                            mapDiffPermit.put("sLoginStnCd", sLoginStnCd);
                            mapDiffPermit.put("sLoginDeptCd", sLoginDeptCd);
                            mapDiffPermit.put("sOrdGenStnCd", sOrdGenStnCd);
                            mapDiffPermit.put("sOrdForStnCd", sOrdForStnCd);
                            mapDiffPermit.put("sOrdForDeptCd", sOrdForDeptCd);
                            mapDiffPermit.put("sOrdId", sOrdId);
                            mapDiffPermit.put("sOrdSts", sOrdSts);
                            mapDiffPermit.put("sOrdBy", sOrdBy);
                            mapDiffPermit.put("sOrdTyp", sOrdTyp);
                            mapDiffPermit.put("sOrdCancel", sOrdCancel);
                            mapDiffPermit.put("sBlId", sBlId);
                            mapDiffPermit.put("sBlCertBy", sBlCertBy);
                            mapDiffPermit.put("sBlCancel", sBlCancel);
                            mapDiffPermit.put("sBlRefId", sBlRefId);

                            /*System.out.println("111 : "+sOrdId);
                            System.out.println("111 : "+sOrdSts);
                            System.out.println("111 : "+sOrdBy);
                            System.out.println("111 : "+sOrdTyp);
                            System.out.println("111 : "+sOrdCancel);
                            System.out.println("111 : "+sBlId);
                            System.out.println("111 : "+sBlCertBy);
                            System.out.println("111 : "+sBlCancel);
                            System.out.println("111 : "+sBlRefId);*/


                            List lstDiffPermit = hRemote.getDiffPermit(mapDiffPermit);
                            iterateOuter = lstDiffPermit.iterator();

                            while (iterateOuter.hasNext()) {
                                rows = (List) iterateOuter.next();

                                iterateInner = rows.iterator();
                                while (iterateInner.hasNext()) {
                                    sOrdEntryPermit = (String) iterateInner.next();
                                    iterateInner.next();
                                    iterateInner.next();
                                    sBlEntryPermit = (String) iterateInner.next();
                                    sBlSrchPermit = (String) iterateInner.next();
                                    sOrdCopyPermit = (String) iterateInner.next();
                                    sBlEditPermit = (String) iterateInner.next();
                                    sBlCancelPermit = (String) iterateInner.next();
                                }
                            }




                            /*if (!sBlId.equals("") && sBlCancel.equals("N")) {
                            bBlEditPermit = hRemote.getDiffBlPermit("BlEdit", sBlCertBy, sLoginEmpCd,sLoginStnCd,sLoginDeptCd,sOrdForStnCd,sOrdForDeptCd);
                            }

                            if (!sBlId.equals("") && sBlCancel.equals("N")) {
                            bBlCancelPermit = hRemote.getDiffBlPermit("BlCancel", sBlCertBy, sLoginEmpCd, sLoginStnCd,sLoginDeptCd,sOrdForStnCd,sOrdForDeptCd);
                            }

                            if (!sBlRefId.equals("")) {
                            bBlEditPermit = false;
                            bBlCancelPermit = false;
                            }*/
            %>

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

            <input type="hidden" name="sOrdGenStnCd" value="<%= sOrdGenStnCd%>">
            <input type="hidden" name="sOrdForStnCd" value="<%= sOrdForStnCd%>">
            <input type="hidden" name="sOrdForDeptCd" value="<%= sOrdForDeptCd%>">
            <input type="hidden" name="sOrdId" value="<%= sOrdId%>">
            <input type="hidden" name="sOrdNo" value="<%= sOrdNo%>">
            <input type="hidden" name="sOrdSts" value="<%= sOrdSts%>">
            <input type="hidden" name="sOrdBy" value="<%= sOrdBy%>">
            <input type="hidden" name="sOrdDt" value="<%= sOrdDt%>">
            <input type="hidden" name="sOrdTyp" value="<%= sOrdTyp%>">
            <input type="hidden" name="sJobPlace" value="<%= sJobPlace%>">
            <input type="hidden" name="sJobComp" value="<%= sJobComp%>">
            <input type="hidden" name="sRetnPctg" value='<%= ((sRetnPctg.equals("NIL")) ? "" : sRetnPctg)%>'>
            <input type="hidden" name="sOrdAmt" value="<%= sOrdAmt%>">
            <input type="hidden" name="sOrdMatCost" value="<%= sOrdMatCost%>">
            <input type="hidden" name="sOrdLabChrg" value="<%= sOrdLabChrg%>">
            <input type="hidden" name="sBlId" value="<%= sBlId%>">
            <input type="hidden" name="sBlCertBy" value="<%= sBlCertBy%>">
            <input type="hidden" name="sBlRealDt" value="<%= sBlRealDt%>">
            <input type="hidden" name="sGrosAmt" value="<%= sGrosAmt%>">
            <input type="hidden" name="sGst_taxable_amount" value="<%= sGst_taxable_amount%>">
            <input type="hidden" name="sBlAmt" value="<%= sBlAmt%>">
            <input type="hidden" name="hUrgntPmnt" value="<%= sUrgntPmnt%>">
            <input type="hidden" name="hUrgntPmntInvAttach" value="<%= sUrgntPmntInvAttach%>">
            <input type="hidden" name="hCancel" value="<%= sBlCancel%>">
            <input type="hidden" name="sBlRefId" value="<%= sBlRefId%>">
            <input type="hidden" name="sSysDt" value="<%= sSysDt%>">
            <input type="hidden" name="bBlEditPermit" value="<%= sBlEditPermit%>">
            <input type="hidden" name="bBlCancelPermit" value="<%= sBlCancelPermit%>">
            <input type="hidden" name="hJobMnth" value="">

            <input type="hidden" name="sOrdCancel" value="<%= sOrdCancel%>"/>
            <input type="hidden" name="sOrdCancelWef" value="<%= sOrdCancelWef%>"/>
            <input type="hidden" name="bOrdEntryPermit" value="<%= sOrdEntryPermit%>"/>
            <input type="hidden" name="bBlEntryPermit" value="<%= sBlEntryPermit%>"/>
            <input type="hidden" name="bBlSrchPermit" value="<%= sBlSrchPermit%>"/>
            <input type="hidden" name="bOrdCopyPermit" value="<%=sOrdCopyPermit%>"/>


            <center>
                <!--b><font face="Times New Roman" size="5" color="mediumblue">BILL&nbsp;&nbsp;&nbsp;ENTRY&nbsp;&nbsp;&nbsp;SCREEN</font></b-->

                <table width="35%">
                    <tr>
                        <td style="background-color : mediumblue">
                            <b><font face="Times New Roman" size="5" color="#ffffff">BILL&nbsp;&nbsp;&nbsp;ENTRY&nbsp;&nbsp;&nbsp;SCREEN</font></b>
                        </td>
                    </tr>
                </table>
                <table cellspacing="1" cellpadding="2" class="table" id="" width="85%" style="border-collapse: collapse" border="0">
                    <tbody>
                        <tr class="table_tbody_tr">
                            <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Bill&nbsp;for&nbsp;Order&nbsp;No.</b></font></td>
                            <td width="45%" bgcolor="b7dafd">
                                <font face="Tahoma" color="#000000"><b><%= sOrdNo%></b></font>
                            </td>
                            <td width="19%">
                                <font face="Times New Roman" color="#80080" size="3"><b>Retention(%)</b></font>
                            </td>
                            <td width="21%" bgcolor="b7dafd">
                                <font face="Tahoma" color="#000000"><b><%= sRetnPctg%></b></font>
                            </td>
                        </tr>
                        <tr class="table_tbody_tr">
                            <td><font face="Times New Roman" color="#80080" size="3"><b>Bill&nbsp;Certified&nbsp;By</b></font></td>
                            <td bgcolor="b7dafd">
                                <font face="Tahoma" color="#000000"><b><%= sBlCertByNm%></b></font>
                            </td>
                            <td>
                                <font face="Times New Roman" color="#80080" size="3"><b>Bill&nbsp;Released&nbsp;On</b></font>
                            </td>
                            <td bgcolor="b7dafd">
                                <font face="Tahoma" color="#000000"><b><%= sBlRealDt%></b></font>
                            </td>
                        </tr>
                        <tr class="table_tbody_tr">
                            <td><font face="Times New Roman" color="#80080" size="3"><b>Station</b></font></td>
                            <td bgcolor="b7dafd">
                                <font face="Tahoma" color="#000000"><b><%= sOrdForStnLongNm%></b></font>
                            </td>
                            <td>
                                <font face="Times New Roman" color="#80080" size="3"><b>Bill&nbsp;Received&nbsp;On</b><span style="color : red ; font-size : 12pt"><b>*</b></span></font>
                            </td>
                            <td>
                                <input type="text" name="sBlRecvdDt" size="20" value="<%= sBlRecvdDt%>"
                                       onfocus="this.select();"
                                       onclick="if(!this.readOnly){sel_date_cls('f1.sBlRecvdDt','js/');chkBlRecvdDt()}"
                                       onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkBlRecvdDt()){
                                           f1.sBlNo.focus();
                                           f1.sBlNo.select();

                                       }"
                                       />
                            </td>
                        </tr>
                        <tr class="table_tbody_tr">
                            <td><font face="Times New Roman" color="#80080" size="3"><b>Bill&nbsp;Number</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                            <td>
                                <input type="text" name="sBlNo" size="20" value="<%= sBlNo%>"
                                       onfocus="this.select();"
                                       onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkBlNo()){
                                       f1.sBlDt.focus();
                                       f1.sBlDt.select();
                                       
                                   }"
                                       />
                            </td>
                            <td>
                                <font face="Times New Roman" color="#80080" size="3"><b>Bill&nbsp;Date</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span>
                            </td>
                            <td>
                                <input type="text" name="sBlDt" size="20" value="<%= sBlDt%>"
                                       onfocus="this.select();"
                                       onclick="if(!this.readOnly){sel_date_cls('f1.sBlDt','js/');chkBlDt()}"
                                       onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkBlDt()){
                                   f1.sMatCost.focus();
                                   f1.sMatCost.select();

                               }"
                                       />
                            </td>
                        </tr>

                        <tr class="table_tbody_tr">
                            <td><font face="Times New Roman" color="#80080" size="3"><b>Material&nbsp;(Rs)</b></font></td>
                            <td>
                                <input type="text" name="sMatCost" size="20" value="<%= sMatCost%>" style="text-align: right"
                                       onfocus="this.select();"
                                       onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkMatCost() && chkLabChrg() && calcGrosAmt() ){
                               calcGst_taxable_amount()
                               calcSBlAmt();
                               f1.sLabChrg.focus();
                               f1.sLabChrg.select();
                                       
                           }"
                                       />
                            </td>
                            <td>
                                <font face="Times New Roman" color="#80080" size="3"><b>Labour&nbsp;(Rs)</b></font>
                            </td>
                            <td>
                                <input type="text" name="sLabChrg" size="20"  style="text-align: right" value="<%= sLabChrg%>" 
                                       onfocus="this.select();"
                                       onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkLabChrg() && chkMatCost() && calcGrosAmt() ){
                           calcGst_taxable_amount()
                           calcSBlAmt();
                           f1.sBill_type.focus();
                                       
                       }"
                                       />
                            </td>
                        </tr>

                        <tr class="table_tbody_tr">
                            <td colspan="3" style="background-color: #FFFFCC"><font face="Times New Roman" color="#80080" size="3" align="center"><b>Gross&nbsp;Bill&nbsp;Amount&nbsp;(of&nbsp;Material&nbsp;&amp;&nbsp;Labour)&nbsp;(Rs)</b></font></td>
                            <td style="background-color: #FFFFCC" align="right">
                                <span id="spanGrosAmt" style="color : #000000 ; font-size : 10pt"><%= sGrosAmt%>&nbsp;&nbsp;&nbsp;&nbsp;</span>

                            </td>
                        </tr>
                        <tr class="table_tbody_tr">
                            <td><font face="Times New Roman" color="#80080" size="3"><b>Bill&nbsp;Type&nbsp;</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                            <td colspan='3'>
                                <select name='sBill_type' onchange='chngBill_type();'>
                                    <option value=''>&nbsp;</option>
                                    <option value='1'>Service Tax</option>
                                    <option value='2'>GST</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="table_tbody_tr">
                            <td>
                                <div id="divServTax_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3"><b>Service&nbsp;tax&nbsp;(Rs)</b></font>
                                </div>
                            </td>
                            <td>
                                <div id="divServTax_2" style="display:none">
                                    <input type="text" name="sServTax" size="20" style="text-align: right" value="<%= sServTax%>"
                                           onfocus="this.select();"
                                           onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkSServTax()){
                           calcSBlAmt();
                           f1.sVat.focus();
                           f1.sVat.select();
                       }"
                                           />
                                </div>
                            </td>
                            <td>
                                <div id="divVat_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3" style="text-align: right"><b>VAT&nbsp;(Rs)</b></font>
                                </div>
                            </td>
                            <td>
                                <div id="divVat_2" style="display:none">
                                    <input type="text" name="sVat" size="20" style="text-align: right" value="<%= sVat%>"
                                           onfocus="this.select();"
                                           onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkSVat()){
                       if(f1.sOrdGenStnCd.value == '016'){
                           f1.sOt.focus();
                           f1.sOt.select();
                       }else{
                           f1.sOthAmt.focus();
                           f1.sOthAmt.select();
                       }
                       calcSBlAmt();
                   }"
                                           />
                                </div>
                            </td>
                        </tr>

                        <tr class="table_tbody_tr">
                            <td>
                                <div id="divOt_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3"><b>Overtime&nbsp;(Rs)</b></font></td>
                            </div>
                            <td>
                                <div id="divOt_2" style="display:none">
                                    <input type="text" name="sOt" size="20" style="text-align: right" value="<%= sOt%>"
                                           onfocus="this.select();"
                                           onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkSOt()){
                   calcSBlAmt();
                   f1.sOthAmt.focus();
                   f1.sOthAmt.select();
               }"
                                           />
                                </div>
                            </td>
                            <td>
                                <div id="divOthAmt_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3"><b>Other&nbsp;Amount&nbsp;(Rs)</b></font>
                                </div>
                            </td>
                            <td>
                                <div id="divOthAmt_2" style="display:none">
                                    <input type="text" name="sOthAmt" size="20" style="text-align: right" value="<%= sOthAmt%>"
                                           onfocus="this.select();"
                                           onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkSOthAmt()){
               calcSBlAmt();
               f1.sJobMnth.focus();
               f1.sJobMnth.select();
           }"
                                           />
                                </div>
                            </td>
                        </tr>
                        <tr class="table_tbody_tr">
                            <td>
                                <div id="divGst_other_amount_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3"><b>Other&nbsp;Amount&nbsp;(Rs)</b></font></td>
                            </div>
                            <td>
                                <div id="divGst_other_amount_2" style="display:none">
                                    <input type="text" name="sGst_other_amount" size="20" style="text-align: right" value="<%= sGst_other_amount%>"
                                           onfocus="this.select();"
                                           onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkGst_other_amount()){
           //calcIgst();
           //calcSBlAmt();
           calcGst_taxable_amount();
           calcSBlAmt();
           f1.sCgst.focus();
           f1.sCgst.select();
       }"
                                           />
                                </div>
                            </td>
                        </tr>
                        <tr class="table_tbody_tr">
                            <td colspan="3" style="background-color: #FFFFCC">
                                <div id="divGst_taxable_amount_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3" align="center"><b>Gst&nbsp;Taxable&nbsp;Amount&nbsp;(of&nbsp;Gross&nbsp;Bill&nbsp;Amount&nbsp;&amp;&nbsp;Other&nbsp;Amount)&nbsp;(Rs)</b></font>
                                </div>
                            </td>
                            <td style="background-color: #FFFFCC" align="right">
                                <div id="divGst_taxable_amount_2" style="display:none">
                                    <span id="spanGst_taxable_amount" style="color : #000000 ; font-size : 10pt"><%= sGst_taxable_amount%>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                </div>
                            </td>
                        </tr>
                        <tr class="table_tbody_tr">
                            <td>
                                <div id="divCgst_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3"><b>CGST&nbsp;(Rs)</b></font></td>
                            </div>
                            <td>
                                <div id="divCgst_2" style="display:none">
                                    <input type="text" name="sCgst" size="20" style="text-align: right" value="<%= sCgst%>"
                                           onfocus="this.select();"
                                           onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkCgst()){
       calcGst();
       calcSBlAmt();
       f1.sSgst.focus();
       f1.sSgst.select();
   }"
                                           />
                                </div>
                            </td>
                            <td>
                                <div id="divSgst_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3" style="text-align: right"><b>SGST&nbsp;(Rs)</b></font>
                                </div>
                            </td>
                            <td>
                                <div id="divSgst_2" style="display:none">
                                    <input type="text" name="sSgst" size="20" style="text-align: right" value="<%= sSgst%>"
                                           onfocus="this.select();"
                                           onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkSgst()){
   calcGst();
   calcSBlAmt();
   f1.sIgst.focus();
   f1.sIgst.select();
}"
                                           />
                                </div>
                            </td>
                        </tr>
                        <tr class="table_tbody_tr">
                            <td>
                                <div id="divIgst_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3"><b>IGST&nbsp;(Rs)</b></font></td>
                            </div>
                            <td>
                                <div id="divIgst_2" style="display:none">
                                    <input type="text" name="sIgst" size="20" style="text-align: right" value="<%= sIgst%>"
                                           onfocus="this.select();"
                                           onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkIgst()){
calcGst();
calcSBlAmt();
f1.sGst.focus();
f1.sGst.select();
}"
                                           />
                                </div>
                            </td>
                            <td>
                                <div id="divGst_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3"><b>GST&nbsp;(Rs)&nbsp;(&nbsp;=&nbsp;CGST+SGST+IGST&nbsp;)</b></font></td>
                            </div>
                            <td>
                                <div id="divGst_2" style="display:none">
                                    <input type="text" name="sGst" size="20" style="text-align: right" value="<%= sGst%>"
                                           onfocus="this.select();"
                                           onkeyup="if(!this.readOnly && window.event.keyCode == 13){
calcSBlAmt();
f1.sOther_tax_desc.focus();
f1.sOther_tax_desc.select();
}"
                                           />
                                </div>
                            </td>
                        </tr>
                        <tr class="table_tbody_tr">
                            <td>
                                <div id="divOther_tax_desc_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3"><b>Any&nbsp;Other&nbsp;Tax&nbsp;(Description)&nbsp;</b></font>
                                </div>
                            </td>
                            <td>
                                <div id="divOther_tax_desc_2" style="display:none">
                                    <input type="text" name="sOther_tax_desc" size="25" maxlength="25" style="" value="<%= sOther_tax_desc%>"
                                           onfocus="this.select();"
                                           onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkOther_tax_desc()){
calcSBlAmt();
f1.sOther_tax_amount.focus();
f1.sOther_tax_amount.select();
}"
                                           />
                                </div>
                            </td>
                            <td>
                                <div id="divOther_tax_amount_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3"><b>Any&nbsp;Other&nbsp;Tax&nbsp;(Amount)&nbsp;</b></font>
                                </div>
                            </td>
                            <td>
                                <div id="divOther_tax_amount_2" style="display:none">
                                    <input type="text" name="sOther_tax_amount" size="20" style="text-align: right" value="<%= sOther_tax_amount%>"
                                           onfocus="this.select();"
                                           onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkOther_tax_amount()){
calcSBlAmt();
f1.sOvertime.focus();
f1.sOvertime.select();
}"
                                           />
                                </div>
                            </td>
                        </tr>
                        <tr class="table_tbody_tr">                           
                            <td>
                                <div id="divOvertime_1" style="display:none">
                                    <font face="Times New Roman" color="#80080" size="3"><b>Overtime&nbsp;(Rs)&nbsp;</b></font>
                                </div>
                            </td>
                            <td colspan='4'>
                                <div id="divOvertime_2" style="display:none">
                                    <input type="text" name="sOvertime" size="25" maxlength="25" style="text-align: right" value="<%= sOvertime%>"
                                           onfocus="this.select();"
                                           onkeyup="if(!this.readOnly && window.event.keyCode == 13 && chkOvertime()){
calcSBlAmt();
f1.sJobMnth.focus();
f1.sJobMnth.select();
}"
                                           />
                                </div>
                            </td>
                        </tr>
                        <tr class="table_tbody_tr">
                            <td colspan="3" style="background-color: #FFFFCC"><font face="Times New Roman" color="#80080" size="3" align="center"><b>Net&nbsp;Bill&nbsp;Amount&nbsp;(Rs)</b></font></td>
                            <td style="background-color: #FFFFCC" align="right">
                                <span id="spanBlAmt" style="color : #000000 ; font-size : 10pt"><%= sBlAmt%>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </td>
                        </tr>

                        <tr class="table_tbody_tr">
                            <td><font face="Times New Roman" color="#80080" size="3" align="center"><b>Job&nbsp;Done&nbsp;in&nbsp;Month</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                            <td>                               
                                <input type="text" name="sJobMnth" size="6" value="<%= sJobMnth%>"
                                       onfocus="this.select();"
                                       onclick="if(f2.edit_btn.value == 'Save'){sel_month('f1.sJobMnth','js/');chkJobMnth();}"
                                       />
                            </td>
                            <td colspan="2">
                                &nbsp;
                            </td>
                        </tr>

                        <tr class="table_tbody_tr">
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <img name="imgUrgntPmnt" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/>
                                        </td>
                                        <td>
                                            &nbsp;<font face="Times New Roman" color="#80080" size="3"><b>Urgent&nbsp;Payment</b></font>
                                        </td>
                                    </tr>
                                </table>
                            </td>

                            <td colspan="3" align="left">

                                <div id="divUrgntPmnt" style="width: 550px; background: #FFFFCC; display:none">
                                    <font face="Times New Roman" color="#0080FF" size="3"><b>Do you need this bill to be paid on Urgent basis ?</b></font>&nbsp;&nbsp;<input type="checkbox" name="sUrgntPmnt" /><br><br>
                                    <font face="Times New Roman" color="#0080FF" size="3"><b>Will the Invoice be attached with the Urgent Payment Request Form</b></font>&nbsp;&nbsp;<input type="checkbox" name="sUrgntPmntInvAttach" /><br><br>
                                    <font face="Times New Roman" color="#0080FF" size="3"><b><i>Reason&nbsp;for&nbsp;Urgent&nbsp;Payment</i>:</b></font><br>
                                    <textarea rows="5" name="sUrgntPmntRmrk" cols="66" onfocus="this.select();"><%=sUrgntPmntRmrk%></textarea>
                                    <div id="divUrgntPmntPrntOut" style="display : none">
                                        <a href="spbill_urgnt_pymnt_form.jsp?spbil_ref_h=<%= sBlId%>&billtype_h=N" target="_blank">Click to print Urgent Payment Form</a>
                                    </div>

                                </div>


                            </td>

                        </tr>

                        <tr>

                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <img name="imgBlRmrk" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/>
                                        </td>
                                        <td>
                                            &nbsp;<font face="Times New Roman" color="#80080" size="3"><b>Remarks</b></font>
                                        </td>
                                    </tr>
                                </table>
                            </td>


                            <td colspan="3">
                                <div id="divBlRmrk" style="width: 550px; background: #FFFFCC; display:none">
                                    <textarea rows="5" name="sBlRmrk" cols="66" onfocus="this.select();"><%=sBlRmrk%></textarea>
                                </div>
                            </td>
                        </tr>




                        <tr class="table_tbody_tr">
                            <td>
                                <div id="divIso_1" style="width: 120px; background: #FFFFCC; display:none">
                                    <table>
                                        <tr>
                                            <td>
                                                <img name="imgIso_2" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/>
                                            </td>
                                            <td>
                                                &nbsp;<font face="Times New Roman" color="#80080" size="3"><b>ISO&nbsp;Block</b></font>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>

                            <td colspan="3" align="left">

                                <div id="divIso_2" style="width: 680px; background: #FFFFCC; display:none">
                                    <table>
                                        <tr>
                                            <td><font face="Times New Roman" color="#80080" size="3"><b>Job&nbsp;Quality</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span>
                                            </td>
                                            <td><input name="sJobQuality" size="11" value="<%= sJobQuality%>" onfocus="this.select();"/></td>
                                            <td><font face="Times New Roman" color="#80080" size="3"><b>Timely&nbsp;Execution</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span>
                                            </td>
                                            <td><input name="sTimExec" size="11" value="<%= sTimExec%>" onfocus="this.select();"/></td>
                                            <td><font face="Times New Roman" color="#80080" size="3"><b>EHS&nbsp;Compliance</b></font>
                                            </td>
                                            <td><input name="sEhsComp" size="11" value="<%= sEhsComp%>" onfocus="this.select();"/></td>
                                        </tr>
                                    </table>
                                </div>

                            </td>

                        </tr>
                </table>
            </center>
        </form>
        <form name="f2" align="center" action="OrderProcessServlet" method="post" target="iFrameBlCancel">
            <input type="hidden" name="sCallNm" value="BlCancel"/>
            <input type="hidden" name="sOrdId" value="<%= sOrdId%>"/>
            <input type="hidden" name="sBlId" value="<%= sBlId%>"/>
            <input type="hidden" name="sBlCancel" value="Y"/>
            <input type="hidden" name="sBlCancelBy" value="<%= sBlCancelBy%>"/>
            <input type="hidden" name="sBlCancelDt" value="<%= sBlCancelDt%>"/>

            <center>
                <table cellspacing="1" cellpadding="2" class="table" id="" width="85%" style="border-collapse: collapse" border="0">

                    <tr class="table_tbody_tr">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <div id="divCancel_1" style="width: 110px; background: #FFFFCC; display:none">
                                <table>
                                    <tr>
                                        <td>
                                            <img name="imgCancel_2" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/>
                                        </td>
                                        <td>
                                            &nbsp;<font face="Times New Roman" color="#80080" size="3"><b>Bill&nbsp;Cancel</b></font>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>

                        <td align="left">

                            <div id="divCancel_2" style="width: 550px; background: #FFFFCC; display:none">
                                <table>
                                    <tr>
                                        <td><font face="Times New Roman" color="#80080" size="3"><b>Cancel&nbsp;this&nbsp;Bill&nbsp(&nbsp;<%= sBlNo%>&nbsp;)</b></font>
                                        </td>
                                        <td><input type="checkbox" name="sCancel" /></td>
                                    </tr>
                                    <tr>
                                        <td><font face="Times New Roman" color="#80080" size="3"><b>Canceled&nbsp;By</b></font>
                                        </td>
                                        <td bgcolor="b7dafd">
                                            <font face="Tahoma" color="#000000"><b><%= sBlCancelByNm%></b></font>

                                        </td>
                                    </tr>
                                    <tr>
                                        <td><font face="Times New Roman" color="#80080" size="3"><b>Canceled&nbsp;On</b></font>
                                        </td>
                                        <td bgcolor="b7dafd">
                                            <font face="Tahoma" color="#000000"><b><%= sBlCancelDt%></b></font>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td><font face="Times New Roman" color="#80080" size="3"><b>Reason&nbsp;for&nbsp;Cancellation</b></font>
                                        </td>
                                        <td colspan="3">
                                            <textarea rows="5" name="sBlCancelRmrk" cols="40" onfocus="this.select();"><%=sBlCancelRmrk%></textarea>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                        </td>

                    </tr>





                    <tr>
                        <td colspan="2" align="center">
                            <table>
                                <td><font face="Times New Roman" color="#0080FF" size="3"><b>Bill&nbsp;Code</b></font></td>
                                <td>&nbsp;</td>
                                <td bgcolor="ghostwhite" align="right">
                                    <%= sOrdGenStnShrtNm%>/BILL/<%= sBlId%>
                                </td>
                            </table>
                        </td>
                    </tr>

                    <%
                                                if (!sErpCd.equals("")) {
                    %>

                    <tr>
                        <td colspan="2" align="center">
                            <table>
                                <tr>

                                    <td align="left"><font face="Times New Roman" color="#0080FF" size="3"><b>ERP A/c No</b></font></td>
                                    <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=sErpCd.substring(0, 1)%> </font></td>
                                    <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=sErpCd.substring(1, 2)%></font></td>
                                    <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=sErpCd.substring(2, 3)%></font></td>
                                    <td bgcolor="#008000"><font face="Verdana" size="6"><%=sErpCd.substring(3, 4)%></font></td>
                                    <td bgcolor="#008000"><font face="Verdana" size="6"><%=sErpCd.substring(4, 5)%></font></td>
                                    <td bgcolor="#008000"><font face="Verdana" size="6"><%=sErpCd.substring(5, 6)%></font></td>
                                    <td bgcolor="#008000"><font face="Verdana" size="6"><%=sErpCd.substring(6, 7)%></font></td>
                                    <td bgcolor="#008000"><font face="Verdana" size="6"><%=sErpCd.substring(7, 8)%></font></td>
                                    <td bgcolor="#8000FF"><font face="Verdana" size="6"><%=sErpCd.substring(8, 9)%></font></td>
                                    <td bgcolor="#8000FF"><font face="Verdana" size="6"><%=sErpCd.substring(9, 10)%></font></td>
                                    <td bgcolor="#8000FF"><font face="Verdana" size="6"><%=sErpCd.substring(10, 11)%></font></td>
                                    <td bgcolor="#0080FF"><font face="Verdana" size="6"><%=sErpCd.substring(11, 12)%></font></td>
                                    <td bgcolor="#0080FF"><font face="Verdana" size="6"><%=sErpCd.substring(12, 13)%></font></td>
                                    <td bgcolor="#0080FF"><font face="Verdana" size="6"><%=sErpCd.substring(13, 14)%></font></td>
                                    <td bgcolor="#0080FF"><font face="Verdana" size="6"><%=sErpCd.substring(14, 15)%></font></td>
                                    <td bgcolor="#0080FF"><font face="Verdana" size="6"><%=sErpCd.substring(15, 16)%></font></td>
                                    <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=sErpCd.substring(16, 17)%></font></td>
                                    <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=sErpCd.substring(17, 18)%></font></td>
                                    <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=sErpCd.substring(18, 19)%></font></td>
                                    <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=sErpCd.substring(19, 20)%></font></td>
                                    <td bgcolor="#FF8000"><font face="Verdana" size="6"><%=sErpCd.substring(20, 21)%></font></td>

                                </tr>

                            </table>
                        </td>
                    </tr>

                    <%                                                    }
                    %>

                    <tr>
                        <td colspan="2">
                            &nbsp;
                        </td>
                    </tr>

                    <%

                                                if (!sBlId.equals("") && !sRetnPctg.equals("NIL") && Integer.parseInt(sRetnPctg) > 0) {
                                                    if ((!sLabChrg.equals("") || !sOt.equals("")) && (Double.parseDouble(0 + sLabChrg) + Double.parseDouble(0 + sOt) > 0)) {
                    %>

                    <tr>
                        <td colspan="2" align="center" style="background-color : #ffffcc">
                            <font face="Times New Roman" color="#80080" size="4"><b><%= sRetnPctg%>% of the amount Rs. <%= Double.parseDouble(0 + sLabChrg) + Double.parseDouble(0 + sOt)%> To be deducted as Retention money !<b></font>
                                        </td>
                                        </tr>

                                        <%
                                                                                            } else {
                                        %>
                                        <tr>
                                            <td colspan="2" align="center" style="background-color : #ffffcc">
                                                <font face="Times New Roman" color="#80080" size="4"><b><%= sRetnPctg%>% of the amount Rs. <%= sGrosAmt%> To be deducted as Retention money !<b></font>
                                                            </td>
                                                            </tr>


                                                            <%
                                                                                                                }

                                                            %>

                                                            <tr>
                                                                <td colspan="2">
                                                                    &nbsp;
                                                                </td>
                                                            </tr>

                                                            <%

                                                                                        }
                                                            %>



                                                            <tr>
                                                                <td colspan="2" align="middle" >
                                                                    <div id="divButn" style="width: 800px; background: #000040; display:none">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <div id="divButnEdit" style="width: 100px; background: #000040; display:none">
                                                                                        <input type="button" value="Edit" name="edit_btn" onclick="edit();">
                                                                                    </div>
                                                                                </td>
                                                                                <td>
                                                                                    <div id="divButnCancel" style="width: 120px; background: #000040; display:none">
                                                                                        <input type="button" value="Cancel the Bill" name="butnCancel" onclick="if(f2.sCancel.checked==1 && chkCancel()){f2.submit();}">
                                                                                    </div>
                                                                                </td>

                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </td>
                                                            </tr>

                                                            </tbody>
                                                            </table>
                                                            </center>
                                                            </form>

                                                            <div style="display:none">
                                                                <iframe id ="iFrameBlCancel" name ="iFrameBlCancel" src="" height="0px" width="0px">

                                                                </iframe>
                                                            </div>


                                                            <%
                                                                        }
                                                            %>
                                                            <script>

animatedcollapse.addDiv('div_1', 'optional_attribute_string');
animatedcollapse.addDiv('div_2', 'optional_attribute_string');
animatedcollapse.addDiv('div_3', 'optional_attribute_string');

animatedcollapse.addDiv('divServTax_1', 'optional_attribute_string');
animatedcollapse.addDiv('divServTax_2', 'optional_attribute_string');
animatedcollapse.addDiv('divVat_1', 'optional_attribute_string');
animatedcollapse.addDiv('divVat_2', 'optional_attribute_string');
animatedcollapse.addDiv('divOt_1', 'optional_attribute_string');
animatedcollapse.addDiv('divOt_2', 'optional_attribute_string');
animatedcollapse.addDiv('divOthAmt_1', 'optional_attribute_string');
animatedcollapse.addDiv('divOthAmt_2', 'optional_attribute_string');
animatedcollapse.addDiv('divGst_other_amount_1', 'optional_attribute_string');
animatedcollapse.addDiv('divGst_other_amount_2', 'optional_attribute_string');
animatedcollapse.addDiv('divGst_taxable_amount_1', 'optional_attribute_string');
animatedcollapse.addDiv('divGst_taxable_amount_2', 'optional_attribute_string');
animatedcollapse.addDiv('divCgst_1', 'optional_attribute_string');
animatedcollapse.addDiv('divCgst_2', 'optional_attribute_string');
animatedcollapse.addDiv('divSgst_1', 'optional_attribute_string');
animatedcollapse.addDiv('divSgst_2', 'optional_attribute_string');
animatedcollapse.addDiv('divGst_1', 'optional_attribute_string');
animatedcollapse.addDiv('divGst_2', 'optional_attribute_string');
animatedcollapse.addDiv('divIgst_1', 'optional_attribute_string');
animatedcollapse.addDiv('divIgst_2', 'optional_attribute_string');
animatedcollapse.addDiv('divOther_tax_desc_1', 'optional_attribute_string');
animatedcollapse.addDiv('divOther_tax_desc_2', 'optional_attribute_string');
animatedcollapse.addDiv('divOther_tax_amount_1', 'optional_attribute_string');
animatedcollapse.addDiv('divOther_tax_amount_2', 'optional_attribute_string');
animatedcollapse.addDiv('divOvertime_1', 'optional_attribute_string');
animatedcollapse.addDiv('divOvertime_2', 'optional_attribute_string');

animatedcollapse.addDiv('divBlRmrk', 'optional_attribute_string');
animatedcollapse.addDiv('divUrgntPmnt', 'optional_attribute_string');
animatedcollapse.addDiv('divCancel_1', 'optional_attribute_string');
animatedcollapse.addDiv('divCancel_2', 'optional_attribute_string');
animatedcollapse.addDiv('divIso_1', 'optional_attribute_string');
animatedcollapse.addDiv('divIso_2', 'optional_attribute_string');
animatedcollapse.addDiv('divUrgntPmntPrntOut', 'optional_attribute_string');
animatedcollapse.addDiv('divButn', 'optional_attribute_string');
animatedcollapse.addDiv('divButnEdit', 'optional_attribute_string');
animatedcollapse.addDiv('divButnCancel', 'optional_attribute_string');
animatedcollapse.init();


if(f1.sBlId.value == ''){
            
if(window.parent.sBackClick.value == '0')window.parent.sBack.value= window.parent.sBack.value + '4';
window.parent.frames[1].document.getElementById("spanBack").firstChild.data='Back';
            
}else{
if(window.parent.sBackClick.value == '0')window.parent.sBack.value= window.parent.sBack.value + '5';
window.parent.frames[1].document.getElementById("spanBack").firstChild.data='Back';
}
window.parent.sBackClick.value = '0';

f1.sBill_type.value = "<%= sBill_type%>"


                                                            </script>



                                                            </body>
                                                            </html>