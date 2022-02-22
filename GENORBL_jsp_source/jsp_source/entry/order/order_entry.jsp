<%-- 
    Document   : order_entry
    Created on : Dec 10, 2012, 12:51:43 PM
    Author     : debasis saha
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="Order.OrderProcessBeanRemote"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            System.out.println("order_entry.jsp can't be initialsed for " + e.getMessage());
        }
    }
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
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
            font-size       : 11px;
            text-align      : left;
        }

        .table_thead  {
            cursor : pointer;
        }

        .table_thead_tr {
            background : #ffdd00;
        }

        .table_tfoot_tr {
            background : #ffffff;
        }

        .table_thead_tr_th{
            border-left   : 1pt solid red ;
            border-right   : 1pt solid red ;
            border-top : 1px solid red ;
            border-bottom : 1px solid red ;
        }

        .table_tfoot_tr_th{
            border-left : 1pt solid red ;
            border-right : 1pt solid red ;
            border-top  : 1px solid red ;
            border-bottom : 1pt solid red ;
        }

        .table_tbody_tr_td{
            border-left   : 1pt solid green ;
            border-right   : 1pt solid green ;
            border-top : 1pt solid green ;
            border-bottom   : 1pt solid green ;
        }


    </style>


    <script type="text/javascript" src="js/sel_date.js"></script>
    <!--script type="text/javascript" src="js/form_functions.js"></script-->

    <!--script type="text/javascript" src="js/jquery-1.9.1.js"></script-->
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <!--script type="text/javascript" src="js/jquery.alerts.js"></script-->
    <script type="text/javascript" src="js/animatedcollapse.js"></script>
    <script type = "text/javascript" src = "js/scrollabletable.js"></script>
    <script type="text/javascript" src="js/ordGenScript.js"></script>
    <script type="text/javascript" src="js/ordScrnScript.js"></script>
    <script type="text/javascript">
        var arrVndrDtls = new Array();


        function chkRadio(obj){
            var val = obj.value;

            if(val=="sVndrNm_11"){                                 
                document.forms[0].sVndrNm_11.disabled=0;
                document.forms[0].sVndrNm_12.value="";
                document.forms[0].sVndrNm_12.readOnly=1;
            }else if(val=="sVndrNm_12"){
                document.forms[0].sVndrNm_12.readOnly=0;
                document.forms[0].sVndrNm_11.value="";
                document.forms[0].sVndrNm_11.disabled=1;
            }

            if(val=="sVndrNm_21"){
                document.forms[0].sVndrNm_21.disabled=0;
                document.forms[0].sVndrNm_22.value="";
                document.forms[0].sVndrNm_22.readOnly=1;
            }else if(val=="sVndrNm_22"){
                document.forms[0].sVndrNm_22.readOnly=0;
                document.forms[0].sVndrNm_21.value="";
                document.forms[0].sVndrNm_21.disabled=1;
            }
        }

        var iFrstTime = 0 ;

        function chkVndrCdNm(){
            /*var iIndx = f1.sVndrCdNm.selectedIndex;
            var sVndrCd = arrVndrDtls[iIndx][0];
            var sVndrNm = arrVndrDtls[iIndx][1];
            var sWageLiab = arrVndrDtls[iIndx][2];

            f1.sVndrCd.value = sVndrCd;
            f1.sVndrNm.value = sVndrNm;*/

            sVndrCd = f1.sVndrCd.value;
            sVndrNm = f1.sVndrNm.value;
            sWageLiab = f1.sWageLiab.value;

            if(sVndrCd == ""){
                document.getElementById("spanWageLiab").firstChild.data = sWageLiab ;
                animatedcollapse.show('divSpanWageLiab');
                animatedcollapse.hide('divRadWageLiab');
                document.getElementById("spanWageLiabComment").firstChild.data = ""
            }else{

                if(sWageLiab == 'N'){
                    document.getElementById("spanWageLiab").firstChild.data = sWageLiab;
                    f1.radWageLiab[1].checked=true;
                    animatedcollapse.show('divSpanWageLiab');
                    animatedcollapse.hide('divRadWageLiab');
                    f1.sRetnPctg.selectedIndex = 0;
                    document.getElementById("spanWageLiabComment").firstChild.data = "The selected party does not have any wage liability"


                }else{
                    
                    if(iFrstTime == 0){
                        if(f1.sRetnPctg.selectedIndex == 0 || f1.sRetnPctg.selectedIndex == 1){
                            f1.radWageLiab[1].checked=true;
                            document.getElementById("spanWageLiabComment").firstChild.data = "You have confirmed that although this Party has wage liability however no retention money will be withheld for this particular Order"
                            
                        }else{
                            f1.radWageLiab[0].checked=true;
                            document.getElementById("spanWageLiabComment").firstChild.data = "This Party has wage liability. " + f1.sRetnPctg.value + "% Retention money on Labour component has to be deducted"
                        }
                    }else{
                        f1.radWageLiab[0].checked=true;
                        f1.sRetnPctg.selectedIndex = 2;
                        document.getElementById("spanWageLiabComment").firstChild.data = "This Party has wage liability. " + f1.sRetnPctg.value + "% Retention money on Labour component has to be deducted"
                    }
                    animatedcollapse.hide('divSpanWageLiab');
                    animatedcollapse.show('divRadWageLiab');
                }
            }
        }

        function chkRadWageLiab(){         
            if(f1.radWageLiab[0].checked == true){
                f1.sRetnPctg.selectedIndex = 2;
                document.getElementById("spanWageLiabComment").firstChild.data = "This Party has wage liability. " + f1.sRetnPctg.value + "% Retention money on Labour component has to be deducted"
            }else if(f1.radWageLiab[1].checked == true){
                f1.sRetnPctg.selectedIndex = 1;
                document.getElementById("spanWageLiabComment").firstChild.data = "You have confirmed that although this Party has wage liability however no retention money will be withheld for this particular Order"
            }
        }

        

        function equip_onchange() {
            var plantselected=document.f1.sPlRef.options[document.f1.sPlRef.options.selectedIndex].value
            eval("var equipval=document.f1.sEquipCd"+plantselected+".options[document.f1.sEquipCd"+plantselected+".options.selectedIndex].value")
            document.f1.sEquipCd.value=equipval
        }



        function edit(){
            
            edit_onclick();
                
        }



        

        




        function sel_budg()
        {
            if(document.forms[1].edit_btn.value == 'Edit')return false;
            var url="budgetOrd.jsp?sLov="+f1.sOrdTyp.value;
            window.f1.sBudgHead.value="Please wait.........."
            window.f1.sBudgHeadDesc.value="Please wait.........."
            window.status="Opening Budget Heads Menu !. Please wait....................."
            var c=showModalDialog(url,0,"dialogWidth:1000px;dialogHeight:650px");
            window.status=" "
            if (c!=null) {
                budg = c.split("|");
                document.f1.sSeqNo.value=budg[0]
                document.f1.sBudgHead.value=budg[1]
                document.f1.sBudgHeadDesc.value=budg[2]
            }
            else {
                document.f1.sSeqNo.value=""
                document.f1.sBudgHead.value=""
                document.f1.sBudgHeadDesc.value=""
            }
            return true;
        }

        function showPdf(id)
        {
            var url="showPdfIframe.jsp?sCallNo=1&sFlNm="+document.getElementById(id).value+"&sIpAddr="+f1.sIpAddr.value+"&sOrdId="+f1.sOrdId.value;
            
            window.status="Please wait....................."+document.getElementById(id).value
            var c=showModalDialog(url,0,"dialogWidth:1000px;dialogHeight:650px");

            window.status=" "

            //window.open("showPdfIframe.jsp?sFlNm="+document.getElementById(id).value+"&sIpAddr="+f1.sIpAddr.value+"&sOrdId="+f1.sOrdId.value,"_blank");
        }

        function getEquip(iPlRef){
            var xmldiffrnciator = Math.floor(Math.random()*100000);
            var parameter = "sCallNm=equip" ;
            parameter += "&sOrdForStnCd="+f1.sOrdForStnCd.value ;
            parameter += "&iPlRef="+iPlRef ;
            parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
            var url = "OrderProcessServlet?" + parameter ;
            var myval = new Object();
            var equipXML ;
            try{
                equipXML = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    equipXML = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    equipXML = new XMLHttpRequest();
                }
            }
            equipXML.open('POST',url,true);
            equipXML.send('');
            equipXML.onreadystatechange = function(){
                if(equipXML.readyState == 4){
                    //alert(equipXML.responseText);
                    myval = equipXML.responseXML.getElementsByTagName("EQUIP");

                    for(i = document.f1.sEquipCd.options.length - 1 ; i > 0 ; i--){
                        document.f1.sEquipCd.remove(i) ;
                    }

                    for(var i = 0 ; i < myval.length ; i++){
                        var cell = myval[i].childNodes[0].nodeValue.split("|");
                        //alert(cell[0]+"---"+cell[1]);
                        option = new Option(cell[1],cell[0]) ;
                        document.f1.sEquipCd.add(option) ;

                    }
                }
            }
        }

        function getRefNo(){
            var xmldiffrnciator = Math.floor(Math.random()*100000);
            var parameter = "sCallNm=refNo" ;
            parameter += "&sOrdId="+f1.sOrdId.value ;
            parameter += "&sOrdForStnCd="+f1.sOrdForStnCd.value ;
            parameter += "&sOrdForDeptCd="+f1.sOrdForDeptCd.value ;
            parameter += "&sOrdTyp="+f1.sOrdTyp.value ;
            parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
            var url = "OrderProcessServlet?" + parameter ;
            var myval = new Object();
            //alert(url);
            var refNoXML ;
            try{
                refNoXML = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    refNoXML = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    refNoXML = new XMLHttpRequest();
                }
            }
            refNoXML.open('POST',url,true);
            refNoXML.send('');
            refNoXML.onreadystatechange = function(){
                if(refNoXML.readyState == 4){
                    //alert(refNoXML.responseText);
                    myval = refNoXML.responseXML.getElementsByTagName("REFNO");

                    for(i = document.f1.sPrevOrdId.options.length - 1 ; i > 0 ; i--){
                        document.f1.sPrevOrdId.remove(i) ;
                    }

                    for(var i = 0 ; i < myval.length ; i++){
                        var cell = myval[i].childNodes[0].nodeValue.split("|");
                        //alert(cell[0]+"---"+cell[1]);
                        option = new Option(cell[1]+'---'+cell[2],cell[0]) ;
                        document.f1.sPrevOrdId.add(option) ;

                    }

                    if(f1.sPrevOrdNo.value == ''){
                        f1.sPrevOrdId.value = '';
                        //f1.sOrdNewRNew[0].checked = 1;
                        document.getElementById("sOrdNewRNew_1").checked=1;
                    }else{
                        //alert(f1.sPrevOrdNo.value + '---' + f1.sPrevOrdDt.value);
                        //alert('f1.sPrevOrdId.options.length : ' + f1.sPrevOrdId.options.length)
                        for(i = f1.sPrevOrdId.options.length - 1 ; i>0 ; i--){
                            //alert(f1.sPrevOrdId.options[i].text)
                    
                            if(f1.sPrevOrdId.options[i].text == f1.sPrevOrdNo.value + '---' + f1.sPrevOrdDt.value){
                                f1.sPrevOrdId.selectedIndex = i ;
                                //f1.sOrdNewRNew[1].checked = true;
                                //alert(document.getElementById("sOrdNewRNew_2"));
                                document.getElementById("sOrdNewRNew_2").checked=1;
                                chkSOrdNewRnew();
                            }
                        }
                    }
                }
            }
        }

        function getRefNoOne(){
            var xmldiffrnciator = Math.floor(Math.random()*100000);
            var parameter = "sCallNm=refNoOne" ;
            parameter += "&sOrdId="+f1.sOrdId.value ;
            parameter += "&sOrdForStnCd="+f1.sOrdForStnCd.value ;
            parameter += "&sOrdForDeptCd="+f1.sOrdForDeptCd.value ;
            parameter += "&sOrdTyp="+f1.sOrdTyp.value ;
            parameter += "&sOrdDtFrm="+f1.sOrdDtFrm.value ;
            parameter += "&sOrdDtTo="+f1.sOrdDtTo.value ;
            parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
            var url = "OrderProcessServlet?" + parameter ;
            var myval = new Object();
            //alert(url);
            var refNoOneXML ;
            try{
                refNoOneXML = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    refNoOneXML = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    refNoOneXML = new XMLHttpRequest();
                }
            }
            refNoOneXML.open('POST',url,true);
            refNoOneXML.send('');
            refNoOneXML.onreadystatechange = function(){
                if(refNoOneXML.readyState == 4){
                    //alert(equipXML.responseText);
                    myval = refNoOneXML.responseXML.getElementsByTagName("REFNO");

                    for(i = document.f1.sPrevOrdOneId.options.length - 1 ; i > 0 ; i--){
                        document.f1.sPrevOrdOneId.remove(i) ;
                    }

                    for(var i = 0 ; i < myval.length ; i++){
                        var cell = myval[i].childNodes[0].nodeValue.split("|");
                        //alert(cell[0]+"---"+cell[1]);
                        option = new Option(cell[1]+'---'+cell[2],cell[0]) ;
                        document.f1.sPrevOrdOneId.add(option) ;

                    }

                    
                }
            }
        }

        function getUnit(){
            var xmldiffrnciator = Math.floor(Math.random()*100000);
            var parameter = "sCallNm=unit" ;
            parameter += "&sOrdForStnCd="+f1.sOrdForStnCd.value ;
            parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
            var url = "OrderProcessServlet?" + parameter ;
            var myval = new Object();
            //alert(url);
            var unitXML ;
            try{
                unitXML = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    unitXML = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    unitXML = new XMLHttpRequest();
                }
            }
            unitXML.open('POST',url,true);
            unitXML.send('');
            unitXML.onreadystatechange = function(){
                if(unitXML.readyState == 4){
                    //alert(unitXML.responseText);
                    myval = unitXML.responseXML.getElementsByTagName("UNIT");

                    for(i = document.f1.sUnit.options.length - 1 ; i > 0 ; i--){
                        document.f1.sUnit.remove(i) ;
                    }

                    for(var i = 0 ; i < myval.length ; i++){
                        var cell = myval[i].childNodes[0].nodeValue.split("|");
                        //alert(cell[0]+"---"+cell[1]);
                        option = new Option(cell[2],cell[0]+"|"+cell[1]) ;
                        document.f1.sUnit.add(option) ;

                    }
                }
            }
        }

        function getOrdTyp(){
            var xmldiffrnciator = Math.floor(Math.random()*100000);
            var parameter = "sCallNm=ordTyp" ;
            parameter += "&sOrdForStnCd="+f1.sOrdForStnCd.value ;
            parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
            var url = "OrderProcessServlet?" + parameter ;
            var myval = new Object();
            //alert(url);
            var unitXML ;
            try{
                ordTypXML = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    ordTypXML = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    ordTypXML = new XMLHttpRequest();
                }
            }
            ordTypXML.open('POST',url,true);
            ordTypXML.send('');
            ordTypXML.onreadystatechange = function(){
                if(ordTypXML.readyState == 4){
                    //alert(equipXML.responseText);
                    myval = ordTypXML.responseXML.getElementsByTagName("ORDTYP");

                    for(i = document.f1.sOrdTyp.options.length - 1 ; i > 0 ; i--){
                        document.f1.sOrdTyp.remove(i) ;
                    }

                    for(var i = 0 ; i < myval.length ; i++){
                        var cell = myval[i].childNodes[0].nodeValue.split("|");
                        //alert(cell[0]+"---"+cell[1]);
                        option = new Option(cell[1],cell[0]) ;
                        document.f1.sOrdTyp.add(option) ;

                    }
                }
            }
        }

        

        function getPlant(){
            var xmldiffrnciator = Math.floor(Math.random()*100000);
            var parameter = "sCallNm=plant" ;
            parameter += "&sOrdForStnCd="+f1.sOrdForStnCd.value;
            parameter += "&sJobTyp="+f1.sJobTyp.value ;
            parameter += "&sUnit="+f1.sUnit.value.substring(0,f1.sUnit.value.indexOf("|")) ;
            parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
            var url = "OrderProcessServlet?" + parameter ;
            //alert(url);
            var myval = new Object();
            var plantXML ;
            try{
                plantXML = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    plantXML = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    plantXML = new XMLHttpRequest();
                }
            }
            plantXML.open('POST',url,true);
            plantXML.send('');
            plantXML.onreadystatechange = function(){
                if(plantXML.readyState == 4){
                    //alert(plantXML.responseText);
                    myval = plantXML.responseXML.getElementsByTagName("PLANT");

                    for(i = document.f1.sPlRef.options.length - 1 ; i > 0 ; i--){
                        document.f1.sPlRef.remove(i) ;
                    }

                    for(var i = 0 ; i < myval.length ; i++){
                        var cell = myval[i].childNodes[0].nodeValue.split("|");
                        //alert(cell[0]+"---"+cell[1]);
                        option = new Option(cell[1],cell[0]) ;
                        document.f1.sPlRef.add(option) ;

                    }
                }
            }
        }

        function getAnnexFlNms(){
            f1.sNoFl.value = 0;
            var xmldiffrnciator = Math.floor(Math.random()*100000);
            var parameter = "sCallNm=annexFlNms" ;
            parameter += "&sOrdId="+f1.sOrdId.value ;
            parameter += "&sIpAddr="+f1.sIpAddr.value ;
            parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
            var url = "OrderProcessServlet?" + parameter ;
            //alert(url);
            var myval = new Object();
            var annexFlXML ;
            try{
                annexFlXML = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    annexFlXML = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    annexFlXML = new XMLHttpRequest();
                }
            }
            annexFlXML.open('POST',url,true);
            annexFlXML.send('');
            annexFlXML.onreadystatechange = function(){
                if(annexFlXML.readyState == 4){
                    //alert(annexFlXML.responseText);
                    myval = annexFlXML.responseXML.getElementsByTagName("ANNEXFL");


                    tab = document.getElementById("tabFl");

                    /*for(j = tab.rows.length - 1 ; j >= 0 ; j--){
                        tab.deleteRow(j);
                    }

                    tab_head = tab.createTHead();
                    tab_head.className='table_thead';

                    tr = tab_head.insertRow(0);
                    tr.className="table_thead_tr";

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Uploaded File";

                    f1.sNoFl.value = parseInt(f1.sNoFl.value) + 1;
                    tab = document.getElementById("tabFl");*/

                

                    //alert(f1.sNoFl.value);
                    //alert(myval.length)
                    for(var i = 1 ; i <= myval.length ; i++){
                        var cell = myval[i-1].childNodes[0].nodeValue;
                        //alert(cell);
                        f1.sNoFl.value = parseInt(f1.sNoFl.value) + 1;
                        tr = tab.insertRow(parseInt(f1.sNoFl.value));

                        td = tr.insertCell(tr.cells.length);
                        td.className = 'table_tbody_tr_td'
                        td.innerHTML = "<input type = 'checkbox' name='sChkFl_" + f1.sNoFl.value + "' id='sChkFl_" + f1.sNoFl.value + "' size='10' onclick='visDivDelFl(this.id)'/>"
                                           

                        td = tr.insertCell(tr.cells.length);
                        td.className = 'table_tbody_tr_td'
                        td.innerHTML = "<input type = 'text' name='sFlNm_" + f1.sNoFl.value + "' id='sFlNm_" + f1.sNoFl.value + "' size='15' value='" + cell + "' onclick='showPdf(this.id)'/>"
                        
                    }
                }
            }
        }


        function getVndrDocDtl(sVndrCd){
            var xmldiffrnciator = Math.floor(Math.random()*100000);
            var parameter = "sCallNm=vndrDocDtl" ;
            parameter += "&sVndrCd="+sVndrCd;
            parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
            var url = "OrderProcessServlet?" + parameter ;
            //alert(url);
            var myval = new Object();
            var vndrDocDtlXML ;
            try{
                vndrDocDtlXML = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    vndrDocDtlXML = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    vndrDocDtlXML = new XMLHttpRequest();
                }
            }
            vndrDocDtlXML.open('POST',url,true);
            vndrDocDtlXML.send('');
            vndrDocDtlXML.onreadystatechange = function(){
                if(vndrDocDtlXML.readyState == 4){
                    //alert(vndrDocDtlXML.responseText);
                    myval = vndrDocDtlXML.responseXML.getElementsByTagName("VNDRDOCDTL");
                    str=""
                    j = 0;
                    for(var i = 1 ; i <= myval.length ; i++){
                        j++;
                        str = str + i + ". " + myval[i-1].childNodes[0].nodeValue + "\n" ;
                    }
                    if(j > 0)
                        alert("The following documents are yet to receive\n\n" + str);

                }
            }
        }

        function old() {
            lock_controls(0);
            
            
            //document.forms[0].sVndrNm_11.value=document.forms[0].sVndrNm_1.value;
            //alert(document.forms[0].sVndrNm_1.value.length);
            //alert(document.forms[0].sVndrNm_11.selectedIndex)
            

            //alert(document.forms[0].radVndrNm_1[0].checked);
            //alert(document.forms[0].sVndrNm_2.value);

            

            /*document.forms[0].radVndrNm_1[0].disabled=1;
        document.forms[0].radVndrNm_1[1].disabled=1;
        document.forms[0].radVndrNm_2[0].disabled=1;
        document.forms[0].radVndrNm_2[1].disabled=1;*/
        }

        function clickImg(obj){
            var imgNm = obj.src.substring(obj.src.lastIndexOf('/')+1,obj.src.length);
            if(obj.name=='imgOrdRmrk' || obj.name=='imgAnnex' || obj.name=='imgCancel_2' || obj.name=='imgRecommendNote'){
                if(imgNm ==  'plus_1.png'){
                    animatedcollapse.show('div'+obj.name.substring(3));
                    obj.src =  'Pics/Order/minus_1.png'
                }else if(imgNm == 'minus_1.png'){
                    animatedcollapse.hide('div'+obj.name.substring(3));
                    obj.src =  'Pics/Order/plus_1.png'
                }
            }else if(obj.name=='imgVndrDtls_3'){
                if(imgNm ==  'plus_1.png'){
                    //alert('div'+obj.name.substring(3)+'1');
                    animatedcollapse.show('div'+obj.name.substring(3)+'1'); 
                    obj.src =  'Pics/Order/minus_1.png'
                }else if(imgNm == 'minus_1.png'){
                    animatedcollapse.hide('div'+obj.name.substring(3)+'1'); 
                    obj.src =  'Pics/Order/plus_1.png'
                }
            }
            return true ;
        }

        var iShow_1=0;
        var iShow_4=0;
        var iShow_7=0;
        var iShow_10=0;
        var iShow_14=0;
        var iShow_18=0;
        var iShow_21=0;
        var iShow_22=0;
        var iShowRecommendNote=0;

        function show(div_no){

            if(div_no == 1){
                if(iShow_1 == 0){
                    iShow_1=1;
                    animatedcollapse.show('div_1');
                    animatedcollapse.show('div_2');
                    animatedcollapse.show('div_3');
                    document.forms[0].img_1.src='Pics/Order/minus_1.png';
                    //alert(document.getElementById("span_1").data);
                    //document.getElementById("span_1").firstChild.data="hide";
                }else{

                    iShow_1=0;
                    animatedcollapse.hide('div_1');
                    animatedcollapse.hide('div_2');
                    animatedcollapse.hide('div_3');
                    document.forms[0].img_1.src='Pics/Order/plus_1.png';
                    //document.getElementById("span_1").firstChild.data="show";
                }


            }else if(div_no == 4){

                if(iShow_4 == 0){
                    iShow_4=1;
                    animatedcollapse.show('div_4');
                    animatedcollapse.show('div_5');
                    animatedcollapse.show('div_6');
                    document.forms[0].img_2.src='Pics/Order/minus_1.png';
                    //alert(document.getElementById("span_1").data);
                    //document.getElementById("span_2").firstChild.data="hide";
                }else{

                    iShow_4=0;
                    animatedcollapse.hide('div_4');
                    animatedcollapse.hide('div_5');
                    animatedcollapse.hide('div_6');
                    document.forms[0].img_2.src='Pics/Order/plus_1.png';

                    //document.getElementById("span_2").firstChild.data="show";
                }
            }else if(div_no == 7){
                if(f1.sQuotnTyp.value == ""){
                    alert('Please select Quotation Type');
                    f1.sQuotnTyp.focus();
                    return false;
                }else{
                    if(iShow_7 == 0){
                        iShow_14=0;
                        iShow_10=0;
                        iShow_7=1;
                        animatedcollapse.hide('div_14');
                        animatedcollapse.hide('div_15');
                        animatedcollapse.hide('div_16');
                        animatedcollapse.hide('div_17');
                        animatedcollapse.hide('div_10');
                        animatedcollapse.hide('div_11');
                        animatedcollapse.hide('div_12');
                        animatedcollapse.hide('div_13');
                        animatedcollapse.show('div_7');
                        animatedcollapse.show('div_8');
                        animatedcollapse.show('div_9');
                        document.forms[0].img_5.src='Pics/Order/plus_1.png';
                        document.forms[0].img_4.src='Pics/Order/plus_1.png';
                        document.forms[0].img_3.src='Pics/Order/minus_1.png';
                        //alert(document.getElementById("span_1").data);
                        //document.getElementById("span_3").firstChild.data="hide";
                    }else{

                        iShow_14=0;
                        iShow_10=0;
                        iShow_7=0;
                        animatedcollapse.hide('div_14');
                        animatedcollapse.hide('div_15');
                        animatedcollapse.hide('div_16');
                        animatedcollapse.hide('div_17');
                        animatedcollapse.hide('div_10');
                        animatedcollapse.hide('div_11');
                        animatedcollapse.hide('div_12');
                        animatedcollapse.hide('div_13');
                        animatedcollapse.hide('div_7');
                        animatedcollapse.hide('div_8');
                        animatedcollapse.hide('div_9');
                        document.forms[0].img_5.src='Pics/Order/plus_1.png';
                        document.forms[0].img_4.src='Pics/Order/plus_1.png';
                        document.forms[0].img_3.src='Pics/Order/plus_1.png';
                    }
                }
            }else if(div_no == 10){
                if(iShow_10 == 0){
                    iShow_14=0;
                    iShow_10=1;

                    animatedcollapse.hide('div_14');
                    animatedcollapse.hide('div_15');
                    animatedcollapse.hide('div_16');
                    animatedcollapse.hide('div_17');
                    animatedcollapse.show('div_10');
                    animatedcollapse.show('div_11');
                    animatedcollapse.show('div_12');
                    animatedcollapse.show('div_13');
                    document.forms[0].img_5.src='Pics/Order/plus_1.png';
                    document.forms[0].img_4.src='Pics/Order/minus_1.png';

                    //alert(document.getElementById("span_1").data);
                    //document.getElementById("span_4").firstChild.data="hide";
                }else{

                    iShow_14=0;
                    iShow_10=0;

                    animatedcollapse.hide('div_14');
                    animatedcollapse.hide('div_15');
                    animatedcollapse.hide('div_16');
                    animatedcollapse.hide('div_17');
                    animatedcollapse.hide('div_10');
                    animatedcollapse.hide('div_11');
                    animatedcollapse.hide('div_12');
                    animatedcollapse.hide('div_13');
                    document.forms[0].img_5.src='Pics/Order/plus_1.png';
                    document.forms[0].img_4.src='Pics/Order/plus_1.png';

                    //document.getElementById("span_3").firstChild.data="show";

                }
            }else if(div_no == 14){
                if(iShow_14 == 0){
                    iShow_14=1;
                    animatedcollapse.show('div_14');
                    animatedcollapse.show('div_15');
                    animatedcollapse.show('div_16');
                    animatedcollapse.show('div_17');
                    document.forms[0].img_5.src='Pics/Order/minus_1.png';
                    //alert(document.getElementById("span_1").data);
                    //document.getElementById("span_4").firstChild.data="hide";
                }else{

                    iShow_14=0;
                    animatedcollapse.hide('div_14');
                    animatedcollapse.hide('div_15');
                    animatedcollapse.hide('div_16');
                    animatedcollapse.hide('div_17');
                    document.forms[0].img_5.src='Pics/Order/plus_1.png';
                    //document.getElementById("span_3").firstChild.data="show";

                }
            }else if(div_no == 18){
                if(iShow_18 == 0){
                    iShow_18=1;
                    animatedcollapse.show('div_18');
                    animatedcollapse.show('div_19');
                    animatedcollapse.show('div_20');
                    document.forms[0].img_6.src='Pics/Order/minus_1.png';
                }else{

                    iShow_18=0;
                    animatedcollapse.hide('div_18');
                    animatedcollapse.hide('div_19');
                    animatedcollapse.hide('div_20');
                    document.forms[0].img_6.src='Pics/Order/plus_1.png';
                }
            }/*else if(div_no == 21){
                if(iShow_21 == 0){                   
                    animatedcollapse.show('div_21');
                }else{                    
                    animatedcollapse.hide('div_21');
                }
            }else if(div_no == 22){
                if(iShow_22 == 0){
                    animatedcollapse.show('div_22');
                }else{
                    animatedcollapse.hide('div_22');
                }
            }*/
            else if(div_no == 'recommendNote'){
                if(iShowRecommendNote == 0){
                    iShowRecommendNote=1;
                    animatedcollapse.show('div_recommendNote_1');
                    document.forms[0].img_recommendNote.src='Pics/Order/minus_1.png';
                }else{

                    iShowRecommendNote=0;
                    animatedcollapse.hide('div_recommendNote_1');
                    document.forms[0].img_recommendNote.src='Pics/Order/plus_1.png';
                }

            }
        }

        function chkSOrdForStnCd(){
            if(f1.sOrdForStnCd.value == ""){
                alert('Pl. Select a value');
                //jAlert('Pl. Select a value', 'Alert Dialog');
                f1.sOrdForStnCd.focus();
                return false;
            }
            return true;
        }

        function chkDivJobComp_1(){
            if(f1.sOrdTyp.value=='O' || f1.sOrdTyp.value=='C'||f1.sOrdTyp.value=='L'){
                f1.sJobComp.value = "N"
                animatedcollapse.hide('divJobComp_2');
                animatedcollapse.show('divJobComp_1');
            }
            return true;
        }

        function chkSJobComp(){
            if(f1.sJobComp.value == 'Y'){
                animatedcollapse.show('divJobComp_2');
            }else{
                animatedcollapse.hide('divJobComp_2');
            }
        }

        function chkSOrdNewRnew(){
            if(f1.sOrdNewRnew[0].checked==1){
                animatedcollapse.hide('divPrevRefNo_1');
                animatedcollapse.hide('divPrevRefNo_2');
                animatedcollapse.hide('divPrevRefNo_3');
            }else{
                animatedcollapse.show('divPrevRefNo_1');
                animatedcollapse.show('divPrevRefNo_2');
                animatedcollapse.show('divPrevRefNo_3');
            }
            return true;
        }

        function chkSQuotnTyp(){
            if(f1.sQuotnTyp.value == ""){
                animatedcollapse.hide('divVndrDtls_31');
                //animatedcollapse.hide('divVndrDtls_32');
                //animatedcollapse.hide('divVndrDtls_33');
                f1.imgVndrDtls_3.src =  'Pics/Order/plus_1.png'
                animatedcollapse.hide('divVndrDtls_21');
                //animatedcollapse.hide('divVndrDtls_22');
                //animatedcollapse.hide('divVndrDtls_23');
                animatedcollapse.hide('divVndrDtls_11');
                //animatedcollapse.hide('divVndrDtls_12');
                //animatedcollapse.hide('divVndrDtls_13');
            }else if(f1.sQuotnTyp.value == "L"){
                animatedcollapse.hide('divVndrDtls_31');
                //animatedcollapse.hide('divVndrDtls_32');
                //animatedcollapse.hide('divVndrDtls_33');
                f1.imgVndrDtls_3.src =  'Pics/Order/plus_1.png'
                animatedcollapse.show('divVndrDtls_21');
                //animatedcollapse.show('divVndrDtls_22');
                //animatedcollapse.show('divVndrDtls_23');
                animatedcollapse.show('divVndrDtls_11');
                //animatedcollapse.show('divVndrDtls_12');
                //animatedcollapse.show('divVndrDtls_13');
                chkVndrCdNm();
            }else if(f1.sQuotnTyp.value == "S"){
                animatedcollapse.hide('divVndrDtls_31');
                //animatedcollapse.hide('divVndrDtls_32');
                //animatedcollapse.hide('divVndrDtls_33');
                f1.imgVndrDtls_3.src =  'Pics/Order/plus_1.png'
                animatedcollapse.hide('divVndrDtls_21');
                //animatedcollapse.hide('divVndrDtls_22');
                //animatedcollapse.hide('divVndrDtls_23');
                animatedcollapse.show('divVndrDtls_11');
                //animatedcollapse.show('divVndrDtls_12');
                //animatedcollapse.show('divVndrDtls_13');
                chkVndrCdNm();
            }
        



            if(f1.sQuotnTyp.value == "" || f1.sQuotnTyp.value == "L"){
                iShowRecommendNote=0;
                //animatedcollapse.hide('div_recommendNote_1');
                //document.forms[0].img_recommendNote.src='Pics/Order/plus_1.png';
                animatedcollapse.hide('div_recommend_1');
            }else if(f1.sQuotnTyp.value == "S"){
                iShowRecommendNote=0;
                //animatedcollapse.hide('div_recommendNote_1');
                //document.forms[0].img_recommendNote.src='Pics/Order/plus_1.png';
                animatedcollapse.show('div_recommend_1');
            }
            return true ;
        }

        function noenter(){
            if(window.event.keyCode == 13)return false;
        }

        function goToTarget(obj){

            var name = obj.name;
            var id = obj.id

            if(name.substring(0,7) == 'sQuotn_'){
                document.getElementById("sQuotnDt_" + id.substring(7)).focus();
            }else if(name.substring(0,9) == 'sQuotnDt_'){
                document.getElementById("sMatCost_" + id.substring(9)).focus();
            }else if(name.substring(0,9) == 'sMatCost_'){
                document.getElementById("sLabChrg_" + id.substring(9)).focus();
            }else if(name.substring(0,9) == 'sLabChrg_'){
                //alert(parseInt(id.substring(9),10))
                document.getElementById("sQuotn_" + (parseInt(id.substring(9),10) + 1)).focus();
            }
        }

        

        /*function chkMatCost(obj){
            var dMatCost = obj.value;
            if(dMatCost == ''){
                alert('Please enter Material Cost.');
                obj.focus();
                return false;
            }
            if(!isAmt(obj))return false;
            return true ;
        }

        function chkLabChrg(obj){
            var dLabChrg = obj.value;
            if(dLabChrg == ''){
                alert('Please enter Labour Charge.');
                obj.focus();
                return false;
            }
            if(!isAmt(obj))return false;
            return true ;
        }*/



        function chkSClubbed(){

            if( f1.sOrdId.value == '' ){
                animatedcollapse.hide('divTax_text_1');
                animatedcollapse.show('divTax_text_2');
            }else{
                if(date_compare_no_alert(f1.sOrdDt,f1.sGST_start_dt,'Order Date','GST Start Date','<=',f1.sGST_start_dt)){
                    animatedcollapse.show('divTax_text_1');
                    animatedcollapse.hide('divTax_text_2');
                }else{
                    animatedcollapse.hide('divTax_text_1');
                    animatedcollapse.show('divTax_text_2');
                }
            }

            if(f1.sClubbed.value == 'Y'){

                var tab ;

                for(i = 1 ; i <= 3 ; i++){

                    tab = document.getElementById("myScrollTable_" + i);

                    for(j = tab.rows.length - 1 ; j >= 0 ; j--){
                        tab.deleteRow(j);
                    }

                    tab_head = tab.createTHead();
                    tab_head.className='table_thead';

                    tr = tab_head.insertRow(0);
                    tr.className="table_thead_tr";

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Quotation No.";

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Date";

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Material&nbsp;Cost(Rs.)";

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Labour&nbsp;Charge(Rs.)";

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Other&nbsp;Consumables(Rs.)";

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Amount(Rs.)";


                    //var i = tab.rows.length ;
                    //alert('1');

                    for(j = 1 ; j <= 3 ; j++){

                        tr = tab.insertRow(j);

                        td = tr.insertCell(tr.cells.length);
                        td.className = 'table_tbody_tr_td'
                        td.innerHTML = "<input name='sQuotn_" + i + j + "' id='sQuotn_" + i + j + "'  size='15' value='' onfocus='this.select();' onkeyup='if(window.event.keyCode == 13)goToTarget(this);return noenter();' />"

                        td = tr.insertCell(tr.cells.length);
                        td.className = 'table_tbody_tr_td'
                        td.innerHTML = "<input name='sQuotnDt_" + i + j + "' id='sQuotnDt_" + i + j + "' size='11' value='' onfocus='this.select();' onclick=\"if(!this.readOnly){sel_date_cls('f1.'\+ this.name ,'js/')}\" onkeyup='if(window.event.keyCode == 13)goToTarget(this);return noenter();' />"

                        td = tr.insertCell(tr.cells.length);
                        td.className = 'table_tbody_tr_td'
                        td.innerHTML = "<input name='sMatCost_" + i + j + "' id='sMatCost_" + i + j + "' size='9' value='' style = 'text-align : right' onfocus='this.select();' onkeyup='if(window.event.keyCode==13){calcCost("+i+")}'/>"

                        td = tr.insertCell(tr.cells.length);
                        td.className = 'table_tbody_tr_td'
                        td.innerHTML = "<input name='sLabChrg_" + i + j + "' id='sLabChrg_" + i + j + "' size='9' value='' style = 'text-align : right' onfocus='this.select();' onkeyup='if(window.event.keyCode==13){calcCost("+i+")}' />"

                        td = tr.insertCell(tr.cells.length);
                        td.className = 'table_tbody_tr_td'
                        td.innerHTML = "<input name='sOthCnsmabl_" + i + j + "' id='sOthCnsmabl_" + i + j + "' size='13' value='' style = 'text-align : right' onfocus='this.select();' onkeyup='if(window.event.keyCode==13){calcCost("+i+")}' />"

                        td = tr.insertCell(tr.cells.length);
                        td.className = 'table_tbody_tr_td'
                        td.innerHTML = "<input name='sTotCost_" + i + j + "' id='sTotCost_" + i + j + "' size='9' value='' style = 'text-align : right' onfocus='this.select();getSum(this.id)' onkeyup='if(window.event.keyCode==13){calcCost("+i+")}'/>"

                    }

                    if(i == 1){

                        //tab_tfoot = tab.createTFoot();
                        //tab_tfoot.className="table_tfoot"
                        tr = tab.insertRow(4);
                        tr.className="table_tfoot_tr"

                        th=tr.insertCell(tr.cells.length);
                        th.className = "table_tfoot_tr_th"
                        th.colSpan="2"
                        th.innerHTML="Summary of Vendor 1";

                        th=tr.insertCell(tr.cells.length);
                        th.className = "table_tfoot_tr_th"
                        th.align="right";
                        th.innerHTML="<span id='spanTotMatCost'>&nbsp</span>";

                        th=tr.insertCell(tr.cells.length);
                        th.className = "table_tfoot_tr_th"
                        th.align="right";
                        th.innerHTML="<span id='spanTotLabChrg'>&nbsp</span>";

                        th=tr.insertCell(tr.cells.length);
                        th.className = "table_tfoot_tr_th"
                        th.align="right";
                        th.innerHTML="<span id='spanTotOthCnsmabl'>&nbsp</span>";

                        th=tr.insertCell(tr.cells.length);
                        th.className = "table_tfoot_tr_th"
                        th.align="right";
                        th.innerHTML="<span id='spanTotTotCost'>&nbsp</span>";

                    }

                }

                f1.sQuotn_11.value = f1.hQuotn_11.value;
                f1.sQuotnDt_11.value = f1.hQuotnDt_11.value;
                f1.sMatCost_11.value = f1.hMatCost_11.value;
                f1.sLabChrg_11.value = f1.hLabChrg_11.value;
                f1.sOthCnsmabl_11.value = f1.hOthCnsmabl_11.value;
                f1.sTotCost_11.value = f1.hTotCost_11.value;
                f1.sQuotn_12.value = f1.hQuotn_12.value;
                f1.sQuotnDt_12.value = f1.hQuotnDt_12.value;
                f1.sMatCost_12.value = f1.hMatCost_12.value;
                f1.sLabChrg_12.value = f1.hLabChrg_12.value;
                f1.sOthCnsmabl_12.value = f1.hOthCnsmabl_12.value;
                f1.sTotCost_12.value = f1.hTotCost_12.value;
                f1.sQuotn_13.value = f1.hQuotn_13.value;
                f1.sQuotnDt_13.value = f1.hQuotnDt_13.value;
                f1.sMatCost_13.value = f1.hMatCost_13.value;
                f1.sLabChrg_13.value = f1.hLabChrg_13.value;
                f1.sOthCnsmabl_13.value = f1.hOthCnsmabl_13.value;
                f1.sTotCost_13.value = f1.hTotCost_13.value;

                f1.sQuotn_21.value = f1.hQuotn_21.value;
                f1.sQuotnDt_21.value = f1.hQuotnDt_21.value;
                f1.sMatCost_21.value = f1.hMatCost_21.value;
                f1.sLabChrg_21.value = f1.hLabChrg_21.value;
                f1.sOthCnsmabl_21.value = f1.hOthCnsmabl_21.value;
                f1.sTotCost_21.value = f1.hTotCost_21.value;
                f1.sQuotn_22.value = f1.hQuotn_22.value;
                f1.sQuotnDt_22.value = f1.hQuotnDt_22.value;
                f1.sMatCost_22.value = f1.hMatCost_22.value;
                f1.sLabChrg_22.value = f1.hLabChrg_22.value;
                f1.sOthCnsmabl_22.value = f1.hOthCnsmabl_22.value;
                f1.sTotCost_22.value = f1.hTotCost_22.value;
                f1.sQuotn_23.value = f1.hQuotn_23.value;
                f1.sQuotnDt_23.value = f1.hQuotnDt_23.value;
                f1.sMatCost_23.value = f1.hMatCost_23.value;
                f1.sLabChrg_23.value = f1.hLabChrg_23.value;
                f1.sOthCnsmabl_23.value = f1.hOthCnsmabl_23.value;
                f1.sTotCost_23.value = f1.hTotCost_23.value;

                f1.sQuotn_31.value = f1.hQuotn_31.value;
                f1.sQuotnDt_31.value = f1.hQuotnDt_31.value;
                f1.sMatCost_31.value = f1.hMatCost_31.value;
                f1.sLabChrg_31.value = f1.hLabChrg_31.value;
                f1.sOthCnsmabl_31.value = f1.hOthCnsmabl_31.value;
                f1.sTotCost_31.value = f1.hTotCost_31.value;
                f1.sQuotn_32.value = f1.hQuotn_32.value;
                f1.sQuotnDt_32.value = f1.hQuotnDt_32.value;
                f1.sMatCost_32.value = f1.hMatCost_32.value;
                f1.sLabChrg_32.value = f1.hLabChrg_32.value;
                f1.sOthCnsmabl_32.value = f1.hOthCnsmabl_32.value;
                f1.sTotCost_32.value = f1.hTotCost_32.value;
                f1.sQuotn_33.value = f1.hQuotn_33.value;
                f1.sQuotnDt_33.value = f1.hQuotnDt_33.value;
                f1.sMatCost_33.value = f1.hMatCost_33.value;
                f1.sLabChrg_33.value = f1.hLabChrg_33.value;
                f1.sOthCnsmabl_33.value = f1.hOthCnsmabl_33.value;
                f1.sTotCost_33.value = f1.hTotCost_33.value;

 
                
            }else{

                for(i = 1 ; i <= 3 ; i++){

                    tab = document.getElementById("myScrollTable_" + i);

                    for(j = tab.rows.length - 1 ; j >= 0 ; j--){
                        tab.deleteRow(j);
                    }

                    tab_head = tab.createTHead();
                    tab_head.className='table_thead';

                    tr = tab_head.insertRow(0);
                    tr.className="table_thead_tr";

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Quotation No.";

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Date";

                    if(i == 1){

                        th=tr.insertCell(tr.cells.length);
                        th.className = "table_thead_tr_th"
                        th.innerHTML="Quotation Received Date";

                    }

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Material&nbsp;Cost(Rs.)";

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Labour&nbsp;Charge(Rs.)";

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Other&nbsp;Consumables(Rs.)";

                    th=tr.insertCell(tr.cells.length);
                    th.className = "table_thead_tr_th"
                    th.innerHTML="Amount(Rs.)";


                    //var i = tab.rows.length ;
                    //alert('1');

                    tr = tab.insertRow(1);

                    td = tr.insertCell(tr.cells.length);
                    td.className = 'table_tbody_tr_td'
                    td.innerHTML = "<input name='sQuotn_" + i + "1' id='sQuotn_" + i + "1' size='15' value='' onfocus='this.select();' onkeyup='if(window.event.keyCode == 13)goToTarget(this);return noenter();' />"

                    td = tr.insertCell(tr.cells.length);
                    td.className = 'table_tbody_tr_td'
                    td.innerHTML = "<input name='sQuotnDt_" + i + "1' id='sQuotnDt_" + i + "1' size='11' value='' onfocus='this.select();' onclick=\"if(!this.readOnly){sel_date_cls('f1.'\+ this.name ,'js/')}\" onkeyup='if(window.event.keyCode == 13)goToTarget(this);return noenter();' />"

                    if(i == 1){
                        td = tr.insertCell(tr.cells.length);
                        td.className = 'table_tbody_tr_td'
                        td.innerHTML = "<input name='sQuotnRecvdDt' id='sQuotnRecvdDt' size='11' value='' onfocus='this.select();' onclick=\"if(!this.readOnly){sel_date_cls('f1.sQuotnRecvdDt','js/')}\" onkeyup='if(window.event.keyCode == 13)goToTarget(this);return noenter();' />"
                    }

                    td = tr.insertCell(tr.cells.length);
                    td.className = 'table_tbody_tr_td'
                    td.innerHTML = "<input name='sMatCost_" + i + "1' id='sMatCost_" + i + "1' size='9' value='' style = 'text-align : right' onfocus='this.select()' onkeyup='' />"

                    td = tr.insertCell(tr.cells.length);
                    td.className = 'table_tbody_tr_td'
                    td.innerHTML = "<input name='sLabChrg_" + i + "1' id='sLabChrg_" + i + "1' size='9' value='' style = 'text-align : right' onfocus='this.select();' onkeyup='' />"

                    td = tr.insertCell(tr.cells.length);
                    td.className = 'table_tbody_tr_td'
                    td.innerHTML = "<input name='sOthCnsmabl_" + i + "1' id='sOthCnsmabl_" + i + "1' size='13' value='' style = 'text-align : right' onfocus='this.select();' onkeyup='' />"

                    td = tr.insertCell(tr.cells.length);
                    td.className = 'table_tbody_tr_td'
                    td.innerHTML = "<input name='sTotCost_" + i + "1' id='sTotCost_" + i + "1' size='9' value='' style = 'text-align : right' onfocus='this.select();getSum(this.id)' />"

                }

                f1.sQuotn_11.value = f1.hQuotn_11.value;
                f1.sQuotnDt_11.value = f1.hQuotnDt_11.value;
                f1.sQuotnRecvdDt.value = f1.hQuotnRecvdDt.value;
                f1.sMatCost_11.value = f1.hMatCost_11.value;
                f1.sLabChrg_11.value = f1.hLabChrg_11.value;
                f1.sOthCnsmabl_11.value = f1.hOthCnsmabl_11.value;
                f1.sTotCost_11.value = f1.hTotCost_11.value;
                f1.sQuotn_21.value = f1.hQuotn_21.value;
                f1.sQuotnDt_21.value = f1.hQuotnDt_21.value;
                f1.sMatCost_21.value = f1.hMatCost_21.value;
                f1.sLabChrg_21.value = f1.hLabChrg_21.value;
                f1.sOthCnsmabl_21.value = f1.hOthCnsmabl_21.value;
                f1.sTotCost_21.value = f1.hTotCost_21.value;
                f1.sQuotn_31.value = f1.hQuotn_31.value;
                f1.sQuotnDt_31.value = f1.hQuotnDt_31.value;
                f1.sMatCost_31.value = f1.hMatCost_31.value;
                f1.sLabChrg_31.value = f1.hLabChrg_31.value;
                f1.sOthCnsmabl_31.value = f1.hOthCnsmabl_31.value;
                f1.sTotCost_31.value = f1.hTotCost_31.value;


                

            }



        }

        function chkSJobPlace(){

            if(f1.sOrdForStnCd.value != "" && f1.sOrdForStnCd.value != "019" && f1.sOrdForStnCd.value != "042"){
                if(f1.sJobPlace.value == 'I'){
                    animatedcollapse.hide('divSafety_1');
                    animatedcollapse.show('divSafety_2');
                    f1.sSafety.value = 'Y'

                    animatedcollapse.show('divEnv_1');
                    animatedcollapse.hide('divEnv_2');
                    f1.sEnv.value = 'Y'

                    animatedcollapse.hide('divEsi_1');
                    animatedcollapse.show('divEsi_2');
                    f1.sEsi.value = 'Y'
               
                }else{
                    animatedcollapse.show('divSafety_1');
                    animatedcollapse.hide('divSafety_2');
                    f1.sSafety.value = 'Y'

                    animatedcollapse.hide('divEnv_1');
                    animatedcollapse.show('divEnv_2');
                    f1.sEnv.value = 'N'

                    animatedcollapse.show('divEsi_1');
                    animatedcollapse.hide('divEsi_2');
                    f1.sEsi.value = 'Y'
                }
            }else{
                if(f1.sJobPlace.value == 'I'){
                    animatedcollapse.show('divSafety_1');
                    animatedcollapse.hide('divSafety_2');
                    f1.sSafety.value = 'Y'

                    animatedcollapse.show('divEnv_1');
                    animatedcollapse.hide('divEnv_2');
                    f1.sEnv.value = 'Y'

                    animatedcollapse.show('divEsi_1');
                    animatedcollapse.hide('divEsi_2');
                    f1.sEsi.value = 'Y'

                }else{
                    animatedcollapse.show('divSafety_1');
                    animatedcollapse.hide('divSafety_2');
                    f1.sSafety.value = 'Y'

                    animatedcollapse.show('divEnv_1');
                    animatedcollapse.hide('divEnv_2');
                    f1.sEnv.value = 'N'

                    animatedcollapse.show('divEsi_1');
                    animatedcollapse.hide('divEsi_2');
                    f1.sEsi.value = 'Y'
                }

            }
            chngSafety();
        }

        var chngSafety = function(){

            if(f1.sSafety.value == 'Y'){
                animatedcollapse.show('divScmp_clause_1');
                animatedcollapse.hide('divScmp_clause_2');
                f1.sScmp_clause.value = 'Y';
            }else{
                animatedcollapse.hide('divScmp_clause_1');
                animatedcollapse.show('divScmp_clause_2');
                f1.sScmp_clause.value = 'N';
            }

            return true;
        }

        function chkDivIso(){

            if( (f1.sOrdForStnCd.value != '019' && f1.sOrdForStnCd.value != '042') &&
                (f1.sOrdTyp.value == 'O' || f1.sOrdTyp.value == 'C'||f1.sOrdTyp.value == 'L') &&
                f1.sJobComp.value == 'Y'){
                animatedcollapse.show('divIso');
            }else{
                animatedcollapse.hide('divIso');
            }
        }

        function getPrevOrdDesc(obj){

            var sPrevOrdId = obj.value;
            document.getElementById("iFramePrevOrdDesc").src="OrderProcessServlet?sCallNm=prevOrdDesc&sPrevOrdId="+sPrevOrdId;
            
            return true;
        }

        function setJobDesc(){
            var iFramePrevOrdDesc=document.getElementById("iFramePrevOrdDesc")
            

            if ( iFramePrevOrdDesc.contentDocument )
            { // FF
                iFramePrevOrdDescBody = iFramePrevOrdDesc.contentDocument.getElementsByTagName('body')[0];
            }
            else if ( iFramePrevOrdDesc.contentWindow )
            { // IE
                iFramePrevOrdDescBody = iFramePrevOrdDesc.contentWindow.document.getElementsByTagName('body')[0];
            }
    
            f1.sJobDesc.value=iFramePrevOrdDesc.contentWindow.document.body.innerHTML;
 
        }

        /*function getVndrDtls(){

            var sVndrCd = f1.sVndrCd.value;
            document.getElementById("iFramePrevOrdDesc").src="OrderProcessServlet?sCallNm=vndrDtls&sVndrCd="+sVndrCd;
            
            return true;
        }*/


        function getVndrDtls(nm)
        {

            if(document.forms[1].edit_btn.value == 'Edit')return false;
            var url="vndrAddr_2.jsp?sVndrNmLike=";
            if(nm == 'sVndrNm'){
                //window.f1.sVndrNm.value="Please wait.........."
            }else if(nm == 'sVndrNm_1'){
                //window.f1.sVndrNm_1.value="Please wait.........."
            }else if(nm == 'sVndrNm_2'){
                //window.f1.sVndrNm_2.value="Please wait.........."
            }
            window.status="Opening Vendor Details Menu !. Please wait....................."
            var o=showModalDialog(url,0,"dialogWidth:1000px;dialogHeight:650px");
            window.status=" "
            
            var frstParam = o.frstParam;
            var secondParam = o.secondParam ;
            var thirdParam = o.thirdParam ;

            //alert(frstParam+"-"+secondParam);
            
            while(frstParam=="recall"){

                url="vndrAddr_2.jsp?sVndrNmLike="+secondParam;
                o=showModalDialog(url,0,"dialogWidth:1000px;dialogHeight:650px");

                frstParam = o.frstParam;
                secondParam = o.secondParam ;
                thirdParam = o.thirdParam ;

            }

            if(frstParam != "close"){
                if(nm == 'sVndrNm'){
                    iFrstTime = 1;
                    document.f1.sVndrCd.value=frstParam
                    document.f1.sVndrNm.value=secondParam
                    document.f1.sWageLiab.value=thirdParam
                    //alert(document.f1.sWageLiab.value);
                    chkVndrCdNm();
                    getVndrDocDtl(frstParam);
                }else if(nm == 'sVndrNm_1'){                 
                    document.f1.sVndrNm_1.value=secondParam
                }else if(nm == 'sVndrNm_2'){
                    document.f1.sVndrNm_2.value=secondParam
                }
            }
            
        }


        function setVndrDtls(){
            var iFramePrevOrdDesc=document.getElementById("iFramePrevOrdDesc")
            

            if ( iFramePrevOrdDesc.contentDocument )
            { // FF
                iFramePrevOrdDescBody = iFramePrevOrdDesc.contentDocument.getElementsByTagName('body')[0];
            }
            else if ( iFramePrevOrdDesc.contentWindow )
            { // IE
                iFramePrevOrdDescBody = iFramePrevOrdDesc.contentWindow.document.getElementsByTagName('body')[0];
            }
    
            document.getElementById("divVndrDtls").innerHTML=iFramePrevOrdDesc.contentWindow.document.body.innerHTML;
 
        }

        function showDivVndrDtls(){
            divVndrDtls.style.visibility="visible"
        }

        function hideDivVndrDtls(){
            divVndrDtls.style.visibility="hidden"
        }


        function preScript(){
            chkSOrdTyp();
            chkDivJobComp_1();
            f1.sJobComp.value=f1.hJobComp.value;
                                 
            chkSJobComp();
            chkSJobPlace();
            f1.sSafety.value=f1.hSafety.value;
            chngSafety();
            f1.sScmp_clause.value=f1.hScmp_clause.value;
            f1.sEnv.value=f1.hEnv.value;
            f1.sEsi.value=f1.hEsi.value;

            if(f1.hEnvExp.value == 'Y')f1.sEnvExp.checked = 1;
            else if(f1.hEnvExp.value == 'N')f1.sEnvExp.checked = 0;

            if(f1.hSafetyExp.value == 'Y')f1.sSafetyExp.checked = 1;
            else if(f1.hSafetyExp.value == 'N')f1.sSafetyExp.checked = 0;

            if(f1.hHealthExp.value == 'Y')f1.sHealthExp.checked = 1;
            else if(f1.hHealthExp.value == 'N')f1.sHealthExp.checked = 0;

            if(f1.sOrdId.value != '' && f1.sEnvExp.checked == 0 && f1.sSafetyExp.checked == 0 && f1.sHealthExp.checked == 0){
                f1.sNoneOfThese.checked = 1;               
                /*f1.sEnvExp.disabled = true ;               
                f1.sSafetyExp.disabled = true ;              
                f1.sHealthExp.disabled = true ;*/
            }

            chkSClubbed();
           
            if(f1.sRecommend.value != '')
                f1.sQuotnTyp.value = 'S'
            else if(f1.sOrdId.value != ''&& f1.sRecommend.value == '')
                f1.sQuotnTyp.value = 'L'
            else
                f1.sQuotnTyp.value = ''

            chkSQuotnTyp();
            if(f1.sClubbed.value == 'Y'){
                document.getElementById("spanTotMatCost").firstChild.data=f1.sTotMatCost_1.value
                document.getElementById("spanTotLabChrg").firstChild.data=f1.sTotLabChrg_1.value
                document.getElementById("spanTotOthCnsmabl").firstChild.data=f1.sTotOthCnsmabl_1.value
                document.getElementById("spanTotTotCost").firstChild.data=f1.sTotTotCost_1.value
            }
            chkDivIso();
            getAnnexFlNms();

            butnDisplay();
            menuDisplay();

            /*if(f1.sPrevOrdNo.value == ''){
                f1.sPrevOrdId.value = '';
                //f1.sOrdNewRNew[0].checked = 1;
                document.getElementById("sOrdNewRNew_1").checked=1;
            }else{
                //alert(f1.sPrevOrdNo.value + '---' + f1.sPrevOrdDt.value);
                alert('f1.sPrevOrdId.options.length : ' + f1.sPrevOrdId.options.length)
                for(i = f1.sPrevOrdId.options.length - 1 ; i>0 ; i--){
                    alert(f1.sPrevOrdId.options[i].text)
                    
                    if(f1.sPrevOrdId.options[i].text == f1.sPrevOrdNo.value + '---' + f1.sPrevOrdDt.value){
                        f1.sPrevOrdId.selectedIndex = i ;
                        //f1.sOrdNewRNew[1].checked = true;
                        alert(document.getElementById("sOrdNewRNew_2"));
                        document.getElementById("sOrdNewRNew_2").checked=1;
                        //chkSOrdNewRnew();
                    }
                }
            }*/

            if(f1.sCancel.value == 'Y')f2.hCancel.checked = 1;

            
            
            return true ;
        }


        function upldFl(){
            /*alert(f1.fileName.value)
            formUpldFl.fileName.value = f1.fileName.value;
            alert(formUpldFl.fileName.value)
            formUpldFl.submit();*/

            /*var target_form = document.forms.formUpldFl;
            alert('1');
            if (target_form.fileName_2 != undefined) {
                target_form.removeChild(target_form.fileName_2);
            }

            var elem = document.getElementById("fileName_1");
            alert('2');
            var copy = elem.cloneNode(true);
            copy.name="fileName_2"
            copy.id="fileName_2"
            alert(copy.id);
            alert('3');

            target_form.appendChild(copy); 

            alert(target_form.fileName_2.value);*/
            alert($('#fileName_1').val());

            $('#fileName_2').val($('#fileName_1').val());

            alert($('#fileName_2').val());

        }


        function upldMsg(sUpldMkr,sFlNm){
            document.getElementById("iFrameUpldFl").src = 'upldFl.jsp?sOrdId='+f1.sOrdId.value+'&sIpAddr='+f1.sIpAddr.value;
            if(sUpldMkr == '1'){
                alert('File ' + sFlNm + ' Uploaded Sucessfully');
                
                f1.sNoFl.value = parseInt(f1.sNoFl.value) + 1;
                tab = document.getElementById("tabFl");

                tr = tab.insertRow(f1.sNoFl.value);


                td = tr.insertCell(tr.cells.length);
                td.className = 'table_tbody_tr_td'
                td.innerHTML = "<input type = 'checkbox' name='sChkFl_" + f1.sNoFl.value + "' id='sChkFl_" + f1.sNoFl.value + "' size='10' onclick='visDivDelFl(this.id)'/>"

                td = tr.insertCell(tr.cells.length);
                td.className = 'table_tbody_tr_td'
                td.innerHTML = "<input type = 'text' name='sFlNm_" + f1.sNoFl.value + "' id='sFlNm_" + f1.sNoFl.value + "' size='15' value='" + sFlNm + "' onclick='showPdf(this.id)'/>"

                
            }else if(sUpldMkr == '0'){
                alert('File ' + sFlNm + ' Upload Failed !');
            }

            return true;
            
        }

        function visDivDelFl(id){
            //alert('1');

            if(document.getElementById(id).checked == 1){

                document.getElementById("divDelFl").style.display = 'inline';

            }else{
                flag = 0;
                for(i = 1 ; i <= parseInt(f1.sNoFl.value) ; i++)
                    if(document.getElementById('sChkFl_'+i).checked == 1)flag = 1;

                if(flag == 0)document.getElementById("divDelFl").style.display = 'none'
                else document.getElementById("divDelFl").style.display = 'inline';

            }

            return true;
        }



        function delFl(){

            sLstFlNm = '';
            for(i = 1 ; i <= parseInt(f1.sNoFl.value) ; i++)
                if(document.getElementById('sChkFl_'+i).checked == 1)
                    sLstFlNm = sLstFlNm + document.getElementById('sFlNm_'+i).value + '|' ;

            var xmldiffrnciator = Math.floor(Math.random()*100000);
            var parameter = "sCallNm=delFl" ;
            parameter += "&sOrdId="+f1.sOrdId.value;
            parameter += "&sIpAddr="+f1.sIpAddr.value ;
            parameter += "&sLstFlNm="+sLstFlNm ;
            parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
            var url = "OrderProcessServlet?" + parameter ;
            //alert(url);
            
            var myval = new Object();
            var delFlXML ;
            try{
                delFlXML = new ActiveXObject("Msxml2.XMLHTTP");
            }catch(e){
                try{
                    delFlXML = new ActiveXObject("Microsoft.XMLHTTP");
                }catch(e){
                    delFlXML = new XMLHttpRequest();
                }
            }
            delFlXML.open('POST',url,true);
            delFlXML.send('');
            delFlXML.onreadystatechange = function(){
                if(delFlXML.readyState == 4){
                    //alert(plantXML.responseText);
                    myval = delFlXML.responseXML.getElementsByTagName("RESULT");
                    if(myval[0].childNodes[0].nodeValue == 'Y'){
                        alert('File Deletion Successful');
                        document.getElementById("divDelFl").style.display = 'none'

                        tab = document.getElementById("tabFl");
                        for(i = parseInt(f1.sNoFl.value) ; i >= 1 ; i--){
                            tab.deleteRow(i);
                        }
                        
                        f1.sNoFl.value = 0;


                        getAnnexFlNms()
                    }
                    
                }
            }

            return true;
        }

        
        

        




    </script>
</head>
<body>
<body background="Pics/Order/lblue047.gif" onload="if(f1.sOrdId.value == ''){preScript();old();someFldReadOnly();}else{preScript();lock_controls(1);if(f1.sCancel.value == 'Y')lock_controls_cancel(1);}" onunlouad="ld()">
    <jsp:useBean id="loginBean" class="VO.LoginBean" scope="session" />

    <%

                String sOrdId = request.getParameter("sOrdId");

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

                String sOrdBy = sLoginEmpCd;
                String sOrdByNm = sLoginEmpNm;



                //String sUnitDesc = new String("");
                String sJobTypDesc = new String("");
                String sPlCdCl = new String("");
                //String sEmpCd = new String("");

                //List lstEquipMst = hRemote.getEquip_mst();


                /*ord_by=session("ord_by")
                action=request("action")
                f_yr=fin_yr(date)

                s_dept=session("s_dept")
                'Response.Write(s_dept)
                contract_type=session("contract_type")
                'Response.Write(contract_type)
                st_dt=session("st_dt")
                end_dt=session("end_dt")
                ord_no=session("ord_no")
                cont=session("cont")
                rev=session("rev")
                cancel=session("cancel")
                sl_no=request("sl_no")
                last_rev_no=request("last_rev_no")
                ord_ref=session("ord_ref")*/

                String sOrdGenStnCd = sLoginStnCd;
                String sOrdGenStnShrtNm = sLoginStnShrtNm;
                String sOrdGenStnLongNm = sLoginStnLongNm;
                /*String sOrdForStnCd = sLoginStnCd;
                String sOrdForStnShrtNm = sLoginStnShrtNm;
                String sOrdForStnLongNm = sLoginStnLongNm;
                String sOrdForDeptCd = sLoginDeptCd;
                String sOrdForDeptShrtNm = sLoginDeptShrtNm;*/

                String sOrdForStnCd = new String();
                String sOrdForStnShrtNm = new String();
                String sOrdForStnLongNm = new String();

                if (!(sOrdId.equals("") && sLoginStnCd.equals("019"))) {
                    sOrdForStnCd = sLoginStnCd;
                    sOrdForStnShrtNm = sLoginStnShrtNm;
                    sOrdForStnLongNm = sLoginStnLongNm;
                }

                String sOrdForDeptCd = sLoginDeptCd;
                String sOrdForDeptShrtNm = sLoginDeptShrtNm;


                String sOrdNo = new String();
                String sSysDt = new String("");
                String sOrdDt = new String("");
                String sLastEditBy = new String();
                String sLastEditByNm = new String();
                String sLastEditDt = new String();
                String sJobTyp = new String("M");
                String sOrdTyp = new String();
                String sUnit = new String("|");
                String sTcFrm = new String();
                String sTcTo = new String();
                String sBlFreq = new String();
                String sPrevOrdNo = new String();
                String sPrevOrdDt = new String();
                String sRContRmrk = new String();
                String sCapexSchmeNo = new String();
                String sCapexSchmeDesc = new String();
                String sPlRef = new String();
                String sEquipCd = new String();
                String sJobPlace = new String("I");
                String sEsi = new String("Y");
                String sSafety = new String("Y");
                String sScmp_clause = new String("Y");
                String sEnv = new String("Y");
                String sEnvExp = new String("N");
                String sSafetyExp = new String("N");
                String sHealthExp = new String("N");

                String sSeqNo = new String();
                String sBudgHead = new String();
                String sBudgHeadDesc = new String();
                String sErpCd = new String();
                String sJobDesc = new String();
                String sAnnex = new String();
                String sOrdRmrk = new String();

                String sJobComp = new String();
                String sJobQuality = new String();
                String sTimExec = new String();
                String sEhsComp = new String();
                String sJobStDt = new String();
                String sJobEndDt = new String();
                String sClubbed = new String("N");
                String sRecommend = new String();
                String sRecommendNote = new String();
                String sOrdVndrCd = new String();
                String sOrdVndrNm = new String();
                String sWageLiab = new String();
                String sQuotn_11 = new String();
                String sQuotnDt_11 = new String();
                String sQuotnRecvdDt = new String();
                String sRetnPctg = new String();
                String sRetnPctgTab = new String();
                String sMatCost_11 = new String();
                String sLabChrg_11 = new String();
                String sOthCnsmabl_11 = new String();
                String sTotCost_11 = new String();
                String sQuotn_12 = new String();
                String sQuotnDt_12 = new String();
                String sMatCost_12 = new String();
                String sLabChrg_12 = new String();
                String sOthCnsmabl_12 = new String();
                String sTotCost_12 = new String();
                String sQuotn_13 = new String();
                String sQuotnDt_13 = new String();
                String sMatCost_13 = new String();
                String sLabChrg_13 = new String();
                String sOthCnsmabl_13 = new String();
                String sTotCost_13 = new String();
                String sTotMatCost_1 = new String();
                String sTotLabChrg_1 = new String();
                String sTotOthCnsmabl_1 = new String();
                String sTotTotCost_1 = new String();

                String sOrdVndrNm_1 = new String();
                String sQuotn_21 = new String();
                String sQuotnDt_21 = new String();
                String sMatCost_21 = new String();
                String sLabChrg_21 = new String();
                String sOthCnsmabl_21 = new String();
                String sTotCost_21 = new String();
                String sQuotn_22 = new String();
                String sQuotnDt_22 = new String();
                String sMatCost_22 = new String();
                String sLabChrg_22 = new String();
                String sOthCnsmabl_22 = new String();
                String sTotCost_22 = new String();
                String sQuotn_23 = new String();
                String sQuotnDt_23 = new String();
                String sMatCost_23 = new String();
                String sLabChrg_23 = new String();
                String sOthCnsmabl_23 = new String();
                String sTotCost_23 = new String();

                String sOrdVndrNm_2 = new String();
                String sQuotn_31 = new String();
                String sQuotnDt_31 = new String();
                String sMatCost_31 = new String();
                String sLabChrg_31 = new String();
                String sOthCnsmabl_31 = new String();
                String sTotCost_31 = new String();
                String sQuotn_32 = new String();
                String sQuotnDt_32 = new String();
                String sMatCost_32 = new String();
                String sLabChrg_32 = new String();
                String sOthCnsmabl_32 = new String();
                String sTotCost_32 = new String();
                String sQuotn_33 = new String();
                String sQuotnDt_33 = new String();
                String sMatCost_33 = new String();
                String sLabChrg_33 = new String();
                String sOthCnsmabl_33 = new String();
                String sTotCost_33 = new String();


                String sGenQuotn_1 = new String();
                String sGenQuotnDt_1 = new String();
                String sGenQuotnAmt_1 = new String();
                String sGenQuotn_2 = new String();
                String sGenQuotnDt_2 = new String();
                String sGenQuotnAmt_2 = new String();

                String sOrdSts = new String();
                String sOrdStsDesc = new String();






                String sTrmRnew = new String();





                String sCancel = new String();
                String sCancelBy = new String();
                String sCancelByNm = new String();
                String sCancelDt = new String();
                String sCancelRsn = new String();
                String sCancelWef = new String();

                String sCapexAc = new String();

                String sConf1Cd = new String();
                String sConf1Dt = new String();
                String sConf2Cd = new String();
                String sConf2Dt = new String();
                String sConf3Cd = new String();
                String sConf3Dt = new String();
                String sSentBackRmrk = new String();
                String sSentBackDt = new String();

                String sIpAddr = request.getRemoteAddr();




                int iPlRef = 0;
                String sPlCd = new String();
                int iRefNo = 0;

                Iterator iterateOuter = null;
                Iterator iterateInner = null;
                List rows = null;
                List lstPlCcEquipMst = null;
                List lstOrdByNm = null;

                rows = null;
                iterateOuter = null;
                iterateInner = null;
                List lstSysDt = hRemote.getSysDt();
                iterateOuter = lstSysDt.iterator();
                while (iterateOuter.hasNext()) {
                    rows = (List) iterateOuter.next();
                    iterateInner = rows.iterator();
                    while (iterateInner.hasNext()) {
                        sSysDt = (String) iterateInner.next();
                    }
                }

                sOrdDt = sSysDt;

                List lstRetnPctgTab = null;


                lstRetnPctgTab = hRemote.getRetnPctg(sOrdDt);
                iterateOuter = lstRetnPctgTab.iterator();

                while (iterateOuter.hasNext()) {
                    rows = (List) iterateOuter.next();

                    iterateInner = rows.iterator();
                    while (iterateInner.hasNext()) {
                        sRetnPctgTab = (String) iterateInner.next();
                    }
                }


                String sNoFl = new String("0");




                //String sOrdNo = new String("");
                String sCond = new String("");

                //System.out.println("sOrdId : " + sOrdId);

                if (sOrdId.equals("")) {
                } else {
                    List lstOrdDtls = null;
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
                                rows_2 = (List) iterateOuter_2.next();

                                iterateInner_2 = rows_2.iterator();
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
                                rows_2 = (List) iterateOuter_2.next();

                                iterateInner_2 = rows_2.iterator();
                                while (iterateInner_2.hasNext()) {
                                    sOrdForStnShrtNm = (String) iterateInner_2.next();
                                    sOrdForStnLongNm = (String) iterateInner_2.next();

                                }
                            }
                            sOrdForDeptCd = (String) iterateInner.next();
                            List lstDeptNm = null;
                            rows_2 = null;
                            iterateOuter_2 = null;
                            iterateInner_2 = null;
                            lstDeptNm = hRemote.getDeptNm(sOrdForStnCd, sOrdForDeptCd);
                            iterateOuter_2 = lstDeptNm.iterator();
                            while (iterateOuter_2.hasNext()) {
                                rows_2 = (List) iterateOuter_2.next();

                                iterateInner_2 = rows_2.iterator();
                                while (iterateInner_2.hasNext()) {
                                    sOrdForDeptShrtNm = (String) iterateInner_2.next();
                                    iterateInner_2.next();

                                }
                            }
                            //System.out.println("11111");
                            sOrdNo = (String) iterateInner.next();
                            sOrdSts = (String) iterateInner.next();

                            List lstOrdStsDesc = null;
                            rows_2 = null;
                            iterateOuter_2 = null;
                            iterateInner_2 = null;
                            lstOrdStsDesc = hRemote.getOrdStsDesc(sOrdGenStnCd, sOrdSts);
                            iterateOuter_2 = lstOrdStsDesc.iterator();
                            while (iterateOuter_2.hasNext()) {
                                rows_2 = (List) iterateOuter_2.next();

                                iterateInner_2 = rows_2.iterator();
                                while (iterateInner_2.hasNext()) {
                                    sOrdStsDesc = (String) iterateInner_2.next();

                                }
                            }
                            sOrdBy = (String) iterateInner.next();

                            List lstUsrDtls = null;
                            rows_2 = null;
                            iterateOuter_2 = null;
                            iterateInner_2 = null;
                            lstUsrDtls = hRemote.getUsrDtls(sOrdBy);
                            iterateOuter_2 = lstUsrDtls.iterator();
                            while (iterateOuter_2.hasNext()) {
                                rows_2 = (List) iterateOuter_2.next();

                                iterateInner_2 = rows_2.iterator();
                                while (iterateInner_2.hasNext()) {
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();

                                    sOrdByNm = (String) iterateInner_2.next() + " " + (String) iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                }
                            }

                            sOrdDt = (String) iterateInner.next();
                            sLastEditBy = ((String) iterateInner.next()).trim();
                            lstUsrDtls = null;
                            rows_2 = null;
                            iterateOuter_2 = null;
                            iterateInner_2 = null;
                            lstUsrDtls = hRemote.getUsrDtls(sLastEditBy);
                            iterateOuter_2 = lstUsrDtls.iterator();
                            while (iterateOuter_2.hasNext()) {
                                rows_2 = (List) iterateOuter_2.next();

                                iterateInner_2 = rows_2.iterator();
                                while (iterateInner_2.hasNext()) {
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();

                                    sLastEditByNm = (String) iterateInner_2.next() + " " + (String) iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                }
                            }
                            sLastEditDt = ((String) iterateInner.next()).trim();
                            sJobTyp = (String) iterateInner.next();
                            sOrdTyp = (String) iterateInner.next();
                            sUnit = (String) iterateInner.next();
                            sTcFrm = ((String) iterateInner.next()).trim();
                            sTcTo = ((String) iterateInner.next()).trim();
                            //sTrmRnew = "" + ((BigDecimal) iterateInner.next()).intValue();
                            iterateInner.next();
                            sBlFreq = ((String) iterateInner.next()).trim();
                            sPrevOrdNo = ((String) iterateInner.next()).trim();
                            sPrevOrdDt = ((String) iterateInner.next()).trim();
                            sRContRmrk = ((String) iterateInner.next()).trim();
                            sCapexSchmeNo = ((String) iterateInner.next()).trim();
                            if (!sCapexSchmeNo.equals("")) {
                                sCapexSchmeDesc = hRemote.getCapexSchmeDesc(sOrdForStnCd, sCapexSchmeNo);
                            }
                            //System.out.println("sTcTo : " + sTcTo);
                            sEquipCd = "" + ((BigDecimal) iterateInner.next()).intValue();
                            sJobPlace = (String) iterateInner.next();
                            sEsi = (String) iterateInner.next();
                            sSafety = (String) iterateInner.next();
                            sScmp_clause = (String) iterateInner.next();
                            sEnv = (String) iterateInner.next();
                            sEnvExp = (String) iterateInner.next();
                            sSafetyExp = (String) iterateInner.next();
                            sHealthExp = (String) iterateInner.next();
                            sSeqNo = (String) iterateInner.next();
                            sBudgHead = (String) iterateInner.next();
                            sBudgHeadDesc = hRemote.getBudgHeadDesc(sBudgHead, sSeqNo);
                            sErpCd = ((String) iterateInner.next()).trim();
                            sJobDesc = ((String) iterateInner.next()).trim();
                            sAnnex = ((String) iterateInner.next()).trim();
                            sOrdRmrk = ((String) iterateInner.next()).trim();
                            sJobComp = (String) iterateInner.next();
                            sJobQuality = ((String) iterateInner.next()).trim();
                            sTimExec = ((String) iterateInner.next()).trim();
                            sEhsComp = ((String) iterateInner.next()).trim();
                            sJobStDt = ((String) iterateInner.next()).trim();
                            sJobEndDt = ((String) iterateInner.next()).trim();
                            sClubbed = (String) iterateInner.next();
                            sRecommend = ((String) iterateInner.next()).trim();
                            sRecommendNote = ((String) iterateInner.next()).trim();


                            sOrdVndrCd = ((String) iterateInner.next()).trim();
                            sOrdVndrNm = ((String) iterateInner.next()).trim();

                            List lstWageLiab = null;
                            rows_2 = null;
                            iterateOuter_2 = null;
                            iterateInner_2 = null;
                            lstWageLiab = hRemote.getVndrDtls(sOrdVndrCd);
                            iterateOuter_2 = lstWageLiab.iterator();
                            while (iterateOuter_2.hasNext()) {
                                rows_2 = (List) iterateOuter_2.next();

                                iterateInner_2 = rows_2.iterator();
                                while (iterateInner_2.hasNext()) {
                                    sWageLiab = (String) iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();

                                }
                            }

                            sQuotn_11 = ((String) iterateInner.next()).trim();
                            sQuotnDt_11 = ((String) iterateInner.next()).trim();
                            sQuotnRecvdDt = ((String) iterateInner.next()).trim();
                            sRetnPctg = ((String) iterateInner.next()).trim();

                            lstRetnPctgTab = null;
                            rows_2 = null;
                            iterateOuter_2 = null;
                            iterateInner_2 = null;
                            lstRetnPctgTab = hRemote.getRetnPctg(sOrdDt);
                            iterateOuter_2 = lstRetnPctgTab.iterator();

                            while (iterateOuter_2.hasNext()) {
                                rows_2 = (List) iterateOuter_2.next();

                                iterateInner_2 = rows_2.iterator();
                                while (iterateInner_2.hasNext()) {
                                    sRetnPctgTab = (String) iterateInner_2.next();
                                }
                            }
                            //System.out.println("22222");




                            sMatCost_11 = ((String) iterateInner.next()).trim();
                            sLabChrg_11 = ((String) iterateInner.next()).trim();
                            sOthCnsmabl_11 = ((String) iterateInner.next()).trim();
                            sTotCost_11 = ((String) iterateInner.next()).trim();
                            sQuotn_12 = ((String) iterateInner.next()).trim();
                            sQuotnDt_12 = ((String) iterateInner.next()).trim();
                            sMatCost_12 = ((String) iterateInner.next()).trim();
                            sLabChrg_12 = ((String) iterateInner.next()).trim();
                            sOthCnsmabl_12 = ((String) iterateInner.next()).trim();
                            sTotCost_12 = ((String) iterateInner.next()).trim();
                            sQuotn_13 = ((String) iterateInner.next()).trim();
                            sQuotnDt_13 = ((String) iterateInner.next()).trim();
                            sMatCost_13 = ((String) iterateInner.next()).trim();
                            sLabChrg_13 = ((String) iterateInner.next()).trim();
                            sOthCnsmabl_13 = ((String) iterateInner.next()).trim();
                            sTotCost_13 = ((String) iterateInner.next()).trim();
                            sTotMatCost_1 = ((String) iterateInner.next()).trim();
                            sTotLabChrg_1 = ((String) iterateInner.next()).trim();
                            sTotOthCnsmabl_1 = ((String) iterateInner.next()).trim();
                            sTotTotCost_1 = ((String) iterateInner.next()).trim();

                            sOrdVndrNm_1 = ((String) iterateInner.next()).trim();
                            sQuotn_21 = ((String) iterateInner.next()).trim();
                            sQuotnDt_21 = ((String) iterateInner.next()).trim();
                            sMatCost_21 = ((String) iterateInner.next()).trim();
                            sLabChrg_21 = ((String) iterateInner.next()).trim();
                            sOthCnsmabl_21 = ((String) iterateInner.next()).trim();
                            sTotCost_21 = ((String) iterateInner.next()).trim();
                            sQuotn_22 = ((String) iterateInner.next()).trim();
                            sQuotnDt_22 = ((String) iterateInner.next()).trim();
                            sMatCost_22 = ((String) iterateInner.next()).trim();
                            sLabChrg_22 = ((String) iterateInner.next()).trim();
                            sOthCnsmabl_22 = ((String) iterateInner.next()).trim();
                            sTotCost_22 = ((String) iterateInner.next()).trim();
                            sQuotn_23 = ((String) iterateInner.next()).trim();
                            sQuotnDt_23 = ((String) iterateInner.next()).trim();
                            sMatCost_23 = ((String) iterateInner.next()).trim();
                            sLabChrg_23 = ((String) iterateInner.next()).trim();
                            sOthCnsmabl_23 = ((String) iterateInner.next()).trim();
                            sTotCost_23 = ((String) iterateInner.next()).trim();

                            sOrdVndrNm_2 = ((String) iterateInner.next()).trim();
                            sQuotn_31 = ((String) iterateInner.next()).trim();
                            sQuotnDt_31 = ((String) iterateInner.next()).trim();
                            sMatCost_31 = ((String) iterateInner.next()).trim();
                            sLabChrg_31 = ((String) iterateInner.next()).trim();
                            sOthCnsmabl_31 = ((String) iterateInner.next()).trim();
                            sTotCost_31 = ((String) iterateInner.next()).trim();
                            sQuotn_32 = ((String) iterateInner.next()).trim();
                            sQuotnDt_32 = ((String) iterateInner.next()).trim();
                            sMatCost_32 = ((String) iterateInner.next()).trim();
                            sLabChrg_32 = ((String) iterateInner.next()).trim();
                            sOthCnsmabl_32 = ((String) iterateInner.next()).trim();
                            sTotCost_32 = ((String) iterateInner.next()).trim();
                            sQuotn_33 = ((String) iterateInner.next()).trim();
                            sQuotnDt_33 = ((String) iterateInner.next()).trim();
                            sMatCost_33 = ((String) iterateInner.next()).trim();
                            sLabChrg_33 = ((String) iterateInner.next()).trim();
                            sOthCnsmabl_33 = ((String) iterateInner.next()).trim();
                            sTotCost_33 = ((String) iterateInner.next()).trim();
                            sGenQuotn_1 = ((String) iterateInner.next()).trim();
                            sGenQuotnDt_1 = ((String) iterateInner.next()).trim();
                            sGenQuotnAmt_1 = ((String) iterateInner.next()).trim();
                            sGenQuotn_2 = ((String) iterateInner.next()).trim();
                            sGenQuotnDt_2 = ((String) iterateInner.next()).trim();
                            sGenQuotnAmt_2 = ((String) iterateInner.next()).trim();

                            sCancel = (String) iterateInner.next();
                            sCancelBy = (String) iterateInner.next();
                            lstUsrDtls = null;
                            rows_2 = null;
                            iterateOuter_2 = null;
                            iterateInner_2 = null;
                            lstUsrDtls = hRemote.getUsrDtls(sCancelBy);
                            iterateOuter_2 = lstUsrDtls.iterator();
                            while (iterateOuter_2.hasNext()) {
                                rows_2 = (List) iterateOuter_2.next();

                                iterateInner_2 = rows_2.iterator();
                                while (iterateInner_2.hasNext()) {
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();

                                    sCancelByNm = (String) iterateInner_2.next() + " " + (String) iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                    iterateInner_2.next();
                                }
                            }
                            sCancelDt = ((String) iterateInner.next()).trim();
                            sCancelRsn = ((String) iterateInner.next()).trim();
                            sCancelWef = ((String) iterateInner.next()).trim();

                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            sSentBackRmrk = ((String) iterateInner.next()).trim();
                            sSentBackDt = ((String) iterateInner.next()).trim();



                            /*iTcRev = ((BigDecimal) iterateInner.next()).intValue();
                            sOrdDt = (String) iterateInner.next();
                            sAcNo = (String) iterateInner.next();
                            iEquipCd = ((BigDecimal) iterateInner.next()).intValue();
                            sScope = (String) iterateInner.next();
                            sOrdAmt = (String) iterateInner.next();
                            sEsi = (String) iterateInner.next();
                            sStDt = (String) iterateInner.next();
                            sEndDt = (String) iterateInner.next();
                            sRetn = (String) iterateInner.next();
                            sOrdBy = (String) iterateInner.next();
                            iterateInner.next();
                            sSts = (String) iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            sBudgAc = (String) iterateInner.next();
                            iterateInner.next();
                            sFuelTyp = (String) iterateInner.next();
                            iterateInner.next();
                            sJobTyp = (String) iterateInner.next();
                            iBrp = ((BigDecimal) iterateInner.next()).intValue();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            sSafetyClause = (String) iterateInner.next();
                            sCleanClause = (String) iterateInner.next();
                            sCancel = (String) iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            iterateInner.next();
                            sOrdByNm = (String) iterateInner.next();
                            iterateInner.next();
                            sUnit = "" + ((BigDecimal) iterateInner.next()).intValue();
                            sErpAcNo = (String) iterateInner.next();
                            sRemarks = (String) iterateInner.next();
                            sCapSchmeNo = (String) iterateInner.next();
                            sRcComment = (String) iterateInner.next();*/
                        }
                    }


                    /*System.out.println("sErpAcNo : " + sErpAcNo);

                    if (sErpAcNo == null) {
                    System.out.println("sErpAcNo : " + sErpAcNo);
                    }*/

                    /*lstPlCcEquipMst = null;
                    rows = null;
                    iterateOuter = null;
                    iterateInner = null;

                    sCond = " AND b.refno = " + iEquipCd;
                    lstPlCcEquipMst = hRemote.getPlCcEquipMst(sCond);
                    iterateOuter = lstPlCcEquipMst.iterator();

                    while (iterateOuter.hasNext()) {
                    rows = (List) iterateOuter.next();

                    iterateInner = rows.iterator();
                    while (iterateInner.hasNext()) {
                    iterateInner.next();
                    iterateInner.next();
                    iPlRef = ((BigDecimal) iterateInner.next()).intValue();
                    iterateInner.next();
                    iterateInner.next();
                    iterateInner.next();
                    iterateInner.next();
                    iRefNo = ((BigDecimal) iterateInner.next()).intValue();
                    iterateInner.next();

                    }
                    }*/
                }

                DateFormat parser = new SimpleDateFormat("dd-MMM-yyyy");
                DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                Date convertedDate = parser.parse(sOrdDt);
                String sOrdDtDiffFormat = formatter.format(convertedDate);


                if (sCancel.equals("N")) {
                    sCancelBy = sLoginEmpCd;
                    sCancelByNm = sLoginEmpNm;
                    sCancelDt = sSysDt;
                }


                //boolean bUpdPermit = true;

                String sOrdEntryPermit = new String("true");
                String sOrdEditPermit = new String("true");
                String sOrdCancelPermit = new String("true");
                String sBlEntryPermit = new String("true");
                String sBlSrchPermit = new String("true");
                String sOrdCopyPermit = new String("true");

                /*if (!sOrdId.equals("")) {
                bUpdPermit = hRemote.getUpdPermit(sLoginStnCd, sLoginDeptCd, sOrdForStnCd, sOrdForDeptCd);
                }*/




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
                mapDiffPermit.put("sOrdCancel", sCancel);
                mapDiffPermit.put("sBlId", "");
                mapDiffPermit.put("sBlCertBy", "");
                mapDiffPermit.put("sBlCancel", "");
                mapDiffPermit.put("sBlRefId", "");

                List lstDiffPermit = hRemote.getDiffPermit(mapDiffPermit);
                iterateOuter = lstDiffPermit.iterator();

                while (iterateOuter.hasNext()) {
                    rows = (List) iterateOuter.next();

                    iterateInner = rows.iterator();
                    while (iterateInner.hasNext()) {
                        sOrdEntryPermit = (String) iterateInner.next();
                        sOrdEditPermit = (String) iterateInner.next();
                        sOrdCancelPermit = (String) iterateInner.next();
                        sBlEntryPermit = (String) iterateInner.next();
                        sBlSrchPermit = (String) iterateInner.next();
                        sOrdCopyPermit = (String) iterateInner.next();
                        iterateInner.next();
                        iterateInner.next();
                    }
                }




                /*if (!(sJobTyp.equals("") && sUnit.equals(""))) {
                if (sJobTyp.equals("M")) {
                sPlCdCl = " WHERE m_cc is NOT NULL AND unit LIKE '%" + sUnit + "%'";
                } else {
                sPlCdCl = " WHERE o_cc is NOT NULL AND unit LIKE '%" + sUnit + "%'";
                }
                }*/

                //sOrdNo = "BBGS/" + sOrdTyp + "/" + sOrdDept + "/" + iSlNo;

                /*if (!sUnit.equals("")) {
                if (sUnit.equals("1")) {
                sUnitDesc = "1&2";
                } else if (sUnit.equals("2")) {
                sUnitDesc = "3";
                } else if (sUnit.equals("3")) {
                sUnitDesc = "Common";
                }
                }

                if (!sJobTyp.equals("")) {
                if (sJobTyp.equals("M")) {
                sJobTypDesc = "Maintenance";
                } else {
                sJobTypDesc = "Operation";
                }
                }*/

                Calendar cal_1 = Calendar.getInstance();
                Calendar cal_2 = Calendar.getInstance();

                cal_1.set(Calendar.YEAR, 3, 1);
                cal_1.set(Calendar.YEAR, 3, 10);

                Date date_1 = cal_1.getTime();
                Date date_2 = cal_2.getTime();

                int iAllow = 0;

                if (new Date().getTime() >= date_1.getTime() && new Date().getTime() <= date_2.getTime()) {
                    iAllow = 1;
                }

                //System.out.println("222");


                //sEmpCd = loginBean.getsEmpCd();
                //System.out.println("333");
                int iDeptPermit = 0;
                //iDeptPermit = hRemote.getDeptPermit(sLoginDept, sOrdDept);
                //System.out.println(sLoginDept);
                //System.out.println(sOrdDept);


                //System.out.println("sAcNo : " + sAcNo);

                //String sSysDt = new String("06-FEB-2013");

                // System.out.println("111");


                if (sOrdGenStnCd.equals("016") && sOrdSts.equals("0") && sLoginAdmMkr.equals("P")) {
                    sLoginEmpLvl = "1";
                } else if (sOrdGenStnCd.equals("016") && sOrdSts.equals("4") && sLoginAdmMkr.equals("P")) {
                    sLoginEmpLvl = "2";
                }

                if (sOrdGenStnCd.equals("014") && (sOrdSts.equals("") || sOrdSts.equals("0")) && sLoginAdmMkr.equals("P")) {
                    sLoginEmpLvl = "1";
                } else if (sOrdGenStnCd.equals("014") && sOrdSts.equals("3") && sLoginAdmMkr.equals("P")) {
                    sLoginEmpLvl = "2";
                }


    %>    
    <!--div style="z-index :  50"-->
    <form name="f1" align="center" action="OrderProcessServlet" method="post">
        <input type="hidden" name="sCallNm" value="updOrdDtl">
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
        <input type="hidden" name="sSysDt" value="<%= sSysDt%>"/>

        <input type="hidden" name="sOrdGenStnCd" value="<%=sOrdGenStnCd%>"/>

        <input type="hidden" name="sOrdSts" value="<%=sOrdSts%>"/>
        <input type="hidden" name="sPrevOrdNo" value="<%= sPrevOrdNo%>" />
        <input type="hidden" name="sPrevOrdDt" value="<%= sPrevOrdDt%>" />

        <input type="hidden" name="hQuotn_11" value="<%= sQuotn_11%>"/>
        <input type="hidden" name="hQuotnDt_11" value="<%= sQuotnDt_11%>"/>
        <input type="hidden" name="hQuotnRecvdDt" value="<%= sQuotnRecvdDt%>"/>
        <input type="hidden" name="hMatCost_11" value="<%= sMatCost_11%>"/>
        <input type="hidden" name="hLabChrg_11" value="<%= sLabChrg_11%>"/>
        <input type="hidden" name="hOthCnsmabl_11" value="<%= sOthCnsmabl_11%>"/>
        <input type="hidden" name="hTotCost_11" value="<%= sTotCost_11%>"/>
        <input type="hidden" name="hQuotn_12" value="<%= sQuotn_12%>"/>
        <input type="hidden" name="hQuotnDt_12" value="<%= sQuotnDt_12%>"/>
        <input type="hidden" name="hMatCost_12" value="<%= sMatCost_12%>"/>
        <input type="hidden" name="hLabChrg_12" value="<%= sLabChrg_12%>"/>
        <input type="hidden" name="hOthCnsmabl_12" value="<%= sOthCnsmabl_12%>"/>
        <input type="hidden" name="hTotCost_12" value="<%= sTotCost_12%>"/>
        <input type="hidden" name="hQuotn_13" value="<%= sQuotn_13%>"/>
        <input type="hidden" name="hQuotnDt_13" value="<%= sQuotnDt_13%>"/>
        <input type="hidden" name="hMatCost_13" value="<%= sMatCost_13%>"/>
        <input type="hidden" name="hLabChrg_13" value="<%= sLabChrg_13%>"/>
        <input type="hidden" name="hOthCnsmabl_13" value="<%= sOthCnsmabl_13%>"/>
        <input type="hidden" name="hTotCost_13" value="<%= sTotCost_13%>"/>
        <input type="hidden" name="hQuotn_21" value="<%= sQuotn_21%>"/>
        <input type="hidden" name="hQuotnDt_21" value="<%= sQuotnDt_21%>"/>
        <input type="hidden" name="hMatCost_21" value="<%= sMatCost_21%>"/>
        <input type="hidden" name="hLabChrg_21" value="<%= sLabChrg_21%>"/>
        <input type="hidden" name="hOthCnsmabl_21" value="<%= sOthCnsmabl_21%>"/>
        <input type="hidden" name="hTotCost_21" value="<%= sTotCost_21%>"/>
        <input type="hidden" name="hQuotn_22" value="<%= sQuotn_22%>"/>
        <input type="hidden" name="hQuotnDt_22" value="<%= sQuotnDt_22%>"/>
        <input type="hidden" name="hMatCost_22" value="<%= sMatCost_22%>"/>
        <input type="hidden" name="hLabChrg_22" value="<%= sLabChrg_22%>"/>
        <input type="hidden" name="hOthCnsmabl_22" value="<%= sOthCnsmabl_22%>"/>
        <input type="hidden" name="hTotCost_22" value="<%= sTotCost_22%>"/>
        <input type="hidden" name="hQuotn_23" value="<%= sQuotn_23%>"/>
        <input type="hidden" name="hQuotnDt_23" value="<%= sQuotnDt_23%>"/>
        <input type="hidden" name="hMatCost_23" value="<%= sMatCost_23%>"/>
        <input type="hidden" name="hLabChrg_23" value="<%= sLabChrg_23%>"/>
        <input type="hidden" name="hOthCnsmabl_23" value="<%= sOthCnsmabl_23%>"/>
        <input type="hidden" name="hTotCost_23" value="<%= sTotCost_23%>"/>
        <input type="hidden" name="hQuotn_31" value="<%= sQuotn_31%>"/>
        <input type="hidden" name="hQuotnDt_31" value="<%= sQuotnDt_31%>"/>
        <input type="hidden" name="hMatCost_31" value="<%= sMatCost_31%>"/>
        <input type="hidden" name="hLabChrg_31" value="<%= sLabChrg_31%>"/>
        <input type="hidden" name="hOthCnsmabl_31" value="<%= sOthCnsmabl_31%>"/>
        <input type="hidden" name="hTotCost_31" value="<%= sTotCost_31%>"/>
        <input type="hidden" name="hQuotn_32" value="<%= sQuotn_32%>"/>
        <input type="hidden" name="hQuotnDt_32" value="<%= sQuotnDt_32%>"/>
        <input type="hidden" name="hMatCost_32" value="<%= sMatCost_32%>"/>
        <input type="hidden" name="hLabChrg_32" value="<%= sLabChrg_32%>"/>
        <input type="hidden" name="hOthCnsmabl_32" value="<%= sOthCnsmabl_32%>"/>
        <input type="hidden" name="hTotCost_32" value="<%= sTotCost_32%>"/>
        <input type="hidden" name="hQuotn_33" value="<%= sQuotn_33%>"/>
        <input type="hidden" name="hQuotnDt_33" value="<%= sQuotnDt_33%>"/>
        <input type="hidden" name="hMatCost_33" value="<%= sMatCost_33%>"/>
        <input type="hidden" name="hLabChrg_33" value="<%= sLabChrg_33%>"/>
        <input type="hidden" name="hOthCnsmabl_33" value="<%= sOthCnsmabl_33%>"/>
        <input type="hidden" name="hTotCost_33" value="<%= sTotCost_33%>"/>

        <input type="hidden" name="hSafety" value="<%= sSafety%>"/>
        <input type="hidden" name="hScmp_clause" value="<%= sScmp_clause%>"/>
        <input type="hidden" name="hEnv" value="<%= sEnv%>"/>
        <input type="hidden" name="hEsi" value="<%= sEsi%>"/>
        <input type="hidden" name="hUnit" value="<%= sUnit%>"/>
        <input type="hidden" name="bOrdEditPermit" value="<%= sOrdEditPermit%>"/>
        <input type="hidden" name="bOrdEntryPermit" value="<%= sOrdEntryPermit%>"/>
        <input type="hidden" name="bBlEntryPermit" value="<%= sBlEntryPermit%>"/>
        <input type="hidden" name="bBlSrchPermit" value="<%= sBlSrchPermit%>"/>
        <input type="hidden" name="bOrdCopyPermit" value="<%= sOrdCopyPermit%>"/>
        <input type="hidden" name="bOrdCancelPermit" value="<%= sOrdCancelPermit%>"/>
        <input type="hidden" name="sCancel" value="<%= sCancel%>"/>
        <input type="hidden" name="sConfLvl" value=""/>
        <input type="hidden" name="sTotMatCost_1" value="<%= sTotMatCost_1%>"/>
        <input type="hidden" name="sTotLabChrg_1" value="<%= sTotLabChrg_1%>"/>
        <input type="hidden" name="sTotOthCnsmabl_1" value="<%= sTotOthCnsmabl_1%>"/>
        <input type="hidden" name="sTotTotCost_1" value="<%= sTotTotCost_1%>"/>
        <input type="hidden" name="sTotTotCost_2" value=""/>
        <input type="hidden" name="sTotTotCost_3" value=""/>

        <input type="hidden" name="sNoFl" value="<%= sNoFl%>"/>
        <input type="hidden" name="sFlNm" value=""/>
        <input type="hidden" name="sIpAddr" value="<%= sIpAddr%>"/>
        <input type="hidden" name="sSeqNo" value="<%= sSeqNo%>"/>
        <input type="hidden" name="sWageLiab" value="<%= sWageLiab%>"/>

        <input type="hidden" name="quotnBlk_1" name="quotnBlk_1" value=""/>
        <input type="hidden" name="quotnBlk_2" name="quotnBlk_2" value=""/>
        <input type="hidden" name="quotnBlk_3" name="quotnBlk_3" value=""/>
        <input type="hidden" name="quotnRow_11" id="quotnRow_11" value=""/>
        <input type="hidden" name="quotnRow_12" id="quotnRow_12" value=""/>
        <input type="hidden" name="quotnRow_13" id="quotnRow_13" value=""/>
        <input type="hidden" name="quotnRow_21" id="quotnRow_21" value=""/>
        <input type="hidden" name="quotnRow_22" id="quotnRow_22" value=""/>
        <input type="hidden" name="quotnRow_23" id="quotnRow_23" value=""/>
        <input type="hidden" name="quotnRow_31" id="quotnRow_31" value=""/>
        <input type="hidden" name="quotnRow_32" id="quotnRow_32" value=""/>
        <input type="hidden" name="quotnRow_33" id="quotnRow_33" value=""/>

        <input type="hidden" name="hJobComp" value="<%= sJobComp%>"/>

        <input type="hidden" name="hEnvExp" value="<%= sEnvExp%>"/>
        <input type="hidden" name="hSafetyExp" value="<%= sSafetyExp%>"/>
        <input type="hidden" name="hHealthExp" value="<%= sHealthExp%>"/>
        <input type="hidden" name="sGST_start_dt" value="01-jul-2017"/>




        <%
                    List lstOrdDept = null;
                    rows = null;
                    iterateOuter = null;
                    iterateInner = null;

                    lstOrdDept = hRemote.getOrdDept(sLoginStnCd, sLoginDeptCd);

                    iterateOuter = lstOrdDept.iterator();

                    int iCntOrdDept = 0;

                    while (iterateOuter.hasNext()) {
                        rows = (List) iterateOuter.next();

                        iterateInner = rows.iterator();
                        while (iterateInner.hasNext()) {
                            iCntOrdDept = iCntOrdDept + 1;
                            iterateInner.next();
                            iterateInner.next();
                        }
                    }

        %>




        <input type="hidden" name="sOrdId" value="<%=sOrdId%>">
        <input type="hidden" name="sOrdDt" value="<%=sOrdDt%>">
        <input type="hidden" name="sOrdBy" value="<%=sOrdBy%>">

        <input type="hidden" name="sVndrCd" value="<%= sOrdVndrCd%>"/>


        <div style="display : none">
            <select name="sRetnPctg">
                <option value="">N</option>
                <option value="0">NF</option>
                <option value="<%= sRetnPctgTab%>" selected>Y</option>
            </select>
        </div>

        <div align="center">
            <table width="40%">
                <tr>
                    <td style="background-color : mediumblue">
                        <b><font face="Times New Roman" size="5" color="#ffffff">ORDER&nbsp;&nbsp;&nbsp;ENTRY&nbsp;&nbsp;&nbsp;SCREEN</font></b>
                    </td>
                </tr>
            </table>
            <table cellspacing="1" cellpadding="2" class="table" id="" width="100%" style="border-collapse: collapse ; border:2pt solid mediumblue">
                <tbody>
                    <!--tr>
                        <td class="table_tbody_tr_td"><font face="Times New Roman" color="#80080" size="3"><b>Order By Name</b></font></td>
                        <td class="table_tbody_tr_td"><input name="sOrdByNm" size="30" value="<sOrdByNm>"></td>
                        <td class="table_tbody_tr_td"><font face="Times New Roman" color="#80080" size="3"><b>Code</b></font></td>
                        <td class="table_tbody_tr_td"><input name="sOrdBy" size="8" value="<sOrdBy>"></td>
                        <td class="table_tbody_tr_td"><font face="Times New Roman" color="#80080" size="3"><b>Applicable For Unit</b></font></td>
                        <td class="table_tbody_tr_td" align="center" bgcolor="#ece9d8"><font face="Tahoma" color="#000000"><b><sUnitDesc></b></font></td>
                    </tr-->
                    <tr>
                        <td colspan="3" align="left">
                            <table width ="100%">
                                <tr>
                                    <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Order&nbsp;No</b></font></td>
                                    <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                    <td width="30%" align="center" bgcolor="b7dafd"><font face="Tahoma" color="#000000"><b><%= sOrdNo%></b></font></td>                             
                                    <td width="4%">&nbsp;</td>
                                    <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Order&nbsp;Status</b></font></td>
                                    <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                    <td width="30%" align="center" bgcolor="#b7dafd"><font face="Tahoma" color="#000000"><b><%= ((sCancel.equals("Y")) ? "CANCELLED ORDER" : sOrdStsDesc)%></b></font></td>

                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="left">
                            <table width ="100%">
                                <tr>
                                    <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Order By</b></font></td>
                                    <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                    <td width="30%" align="center" bgcolor="b7dafd"><font face="Tahoma" color="#000000"><b><%= sOrdByNm%></b></font></td>                             
                                    <td width="4%">&nbsp;</td>
                                    <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Order Date</b></font></td>
                                    <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                    <td width="30%" align="center" bgcolor="#b7dafd"><font face="Tahoma" color="#000000"><b><%= sOrdDt%></b></font></td>

                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="left">
                            <table width ="100%">
                                <tr>
                                    <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Last Edited By</b></font></td>
                                    <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                    <td width="30%" align="center" bgcolor="b7dafd"><font face="Tahoma" color="#000000"><b><%= sLastEditByNm%></b></font></td>                             
                                    <td width="4%">&nbsp;</td>
                                    <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Last Edited On</b></font></td>
                                    <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                    <td width="30%" align="center" bgcolor="#b7dafd"><font face="Tahoma" color="#000000"><b><%= sLastEditDt%></b></font></td>

                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="left">
                            <table width ="100%">
                                <tr>
                                    <td width="15%" ><font face="Times New Roman" color="#80080" size="3"><b>Station</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                                    <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>

                                    <%    if (sLoginStnCd.equals("019") && sOrdEditPermit.equals("true")) {

                                    %>
                                    <td width="30%">
                                        <b><font face="Times New Roman" color="#FFFFFF">
                                                <select name="sOrdForStnCd" size="1" onchange="getUnit();getOrdTyp();getRefNo();getPlant();chkDivIso();chkSJobPlace()">
                                                    <option value="">SELECT</option>
                                                    <option value="016">BBGS</option>
                                                    <option value="019">CTM</option>
                                                    <option value="013">NCGS</option>
                                                    <option value="002">SGS</option>
                                                    <option value="014">TGS</option>
                                                </select>
                                            </font></b>
                                    </td>

                                    <%                                    } else {

                                    %>   
                                <input type="hidden" name="sOrdForStnCd" value="<%=sOrdForStnCd%>"/>
                                <td width="30%" align="center" bgcolor="#b7dafd"><font face="Tahoma" color="#000000"><b><%= sOrdForStnLongNm%></b></font></td>
                                <%
                                            }

                                %>

                                <td width="4%">&nbsp;</td>
                                <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Unit</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                                <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="30%" align="left">
                                    <select name="sUnit" size="1" onchange="getPlant();">
                                        <option value="|">SELECT</option>
                                        <%

                                                    List lstUnit = null;
                                                    rows = null;
                                                    iterateOuter = null;
                                                    iterateInner = null;
                                                    String sUnitErp = null;
                                                    String sUnitNo = null;
                                                    String sUnitDesc = null;

                                                    //System.out.println(sOrdForStnCd);
                                                    //System.out.println(sOrdForDeptCd);
                                                    lstUnit = hRemote.getUnit(sOrdForStnCd);
                                                    iterateOuter = lstUnit.iterator();

                                                    while (iterateOuter.hasNext()) {
                                                        rows = (List) iterateOuter.next();

                                                        iterateInner = rows.iterator();
                                                        while (iterateInner.hasNext()) {
                                                            sUnitErp = (String) iterateInner.next();
                                                            sUnitNo = (String) iterateInner.next();
                                                            sUnitDesc = (String) iterateInner.next();

                                        %>
                                        <option value="<%= sUnitErp%>|<%= sUnitNo%>"><%= sUnitDesc%></option>

                                        <%
                                                        }
                                                    }
                                        %>


                                    </select>
                                </td>

                    </tr>
            </table>
            </td>
            </tr>
            <tr>
                <td colspan="3" align="left">
                    <table width ="100%">
                        <tr>
                            <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Order&nbsp;For&nbsp;Dept.</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                            <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>

                            <%

                                        if (sOrdEditPermit.equals("true") && (iCntOrdDept <= 1) || sOrdEditPermit.equals("false")) {

                            %>
                        <input type="hidden" name="sOrdForDeptCd" value="<%=sOrdForDeptCd%>"/>

                        <td width="15%" align="center" bgcolor="#b7dafd"><font face="Tahoma" color="#000000"><b><%= sOrdForDeptShrtNm%></b></font></td>


                        <%
                                                                } else {
                        %>

                        <td width="15%">
                            <select name="sOrdForDeptCd" size="1" onchange="getRefNo();">
                                <option value="">SELECT</option>
                                <%
                                                                            rows = null;
                                                                            iterateOuter = null;
                                                                            iterateInner = null;
                                                                            String sOrdDeptCd = null;
                                                                            String sOrdDeptDesc = null;

                                                                            //System.out.println(sOrdForStnCd);
                                                                            //System.out.println(sOrdForDeptCd);
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
                        </td>

                        <%
                                    }
                        %>
                        <td width="1%">&nbsp;</td>
                        <td width="12%"><font face="Times New Roman" color="#80080" size="3"><b>Job Nature</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                        <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                        <td width="10%" align="left">
                            <b><font face="Times New Roman" color="#FFFFFF">
                                    <select name="sJobTyp" size="1" onchange="getPlant();">
                                        <option selected value="M">Maintenance</option>
                                        <option value="O">Operational</option>
                                    </select>
                                </font></b>
                        </td>
                        <td width="1%">&nbsp;</td>
                        <td width="10%"><font face="Times New Roman" color="#80080" size="3"><b>Order Type</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                        <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                        <td align="left">

                            <select name="sOrdTyp" onchange="chkSOrdTyp();chkDivJobComp_1();chkDivIso();">
                                <option value="">SELECT</option>
                                <%

                                            List lstOrdTyp = null;
                                            rows = null;
                                            iterateOuter = null;
                                            iterateInner = null;


                                            lstOrdTyp = hRemote.getOrdTyp(sOrdForStnCd);
                                            iterateOuter = lstOrdTyp.iterator();

                                            while (iterateOuter.hasNext()) {
                                                rows = (List) iterateOuter.next();

                                                iterateInner = rows.iterator();
                                                while (iterateInner.hasNext()) {

                                %>
                                <option value="<%= (String) iterateInner.next()%>"><%= (String) iterateInner.next()%></option>

                                <%
                                                }
                                            }
                                %>


                            </select>
                        </td>
            </tr>
            </table>
            </td>
            </tr>

            <tr>
                <td colspan="3" align="left">
                    <div id="divPrevOrdOneDesc" style="background-color : #deffdd ; display : none" >
                        <table width ="100%">
                            <tr>
                                <td colspan="9" align="center">
                                    <font face="Times New Roman" color="mediumblue" size="3"><b>Get Job Desc of Previous Order</b></font>
                                </td>
                            </tr>
                            <tr>
                                <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Order Date   From</b></font></td>
                                <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="12%" align="left">
                                    <input name="sOrdDtFrm" size="11" value="" readonly
                                           onclick="if(!this.readOnly)sel_date_cls('f1.sOrdDtFrm','js/')"/>
                                </td>
                                <td width="8%"><font face="Times New Roman" color="#80080" size="3"><b>To</b></font></td>
                                <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="18%" align="left">
                                    <input name="sOrdDtTo" size="11" value="" readonly
                                           onclick="if(!this.readOnly)sel_date_cls('f1.sOrdDtTo','js/')"/>
                                    &nbsp;<img src="Pics/Order/right_arrow_1.jpg" width="25px" height="16px" title="Click to Populate Prev. Order No." style = "cursor : pointer" onclick="if(!f1.sOrdDtFrm.readOnly && chkSOrdDtFrm() && chkSOrdDtTo() && chkSOrdDtFrmTo()){
                                        getRefNoOne();
                                    }else{
                                        for(i = document.f1.sPrevOrdOneId.options.length - 1 ; i > 0 ; i--){
                                            document.f1.sPrevOrdOneId.remove(i) ;
                                        }
                                        getPrevOrdDesc(f1.sPrevOrdOneId);
                                    }"
                                               />
                                </td>
                                <td width="10%">
                                    <font face="Times New Roman" color="#80080" size="3"><b>Prev. Ref No.</b></font>
                                </td>
                                <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td>
                                    <select name="sPrevOrdOneId" size="1" onchange="getPrevOrdDesc(this);">
                                        <option value="">SELECT</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>

            </tr>
            <tr>
                <td colspan="3" align="left">
                    <div id="div_21" style="background-color : #deffdd ; display : none">
                        <table width ="100%">
                            <tr>
                                <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>New / Renewal</b></font></td>
                                <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="17%" align="left">
                                    <input type="radio" name="sOrdNewRnew" id= "sOrdNewRnew_1" value="New" onclick="chkSOrdNewRnew(this)"/>New&nbsp;<input type="radio" name="sOrdNewRnew" id= "sOrdNewRnew_2" value="Renew" onclick="chkSOrdNewRnew(this)"/>Renewal
                                </td>



                                <td width="12%">
                                    <div id="divPrevRefNo_1" style="display : none">
                                        <font face="Times New Roman" color="#80080" size="3"><b>Prev. Ref No.</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span>
                                    </div>
                                </td>
                                <td width="3%">
                                    <div id="divPrevRefNo_2" style="display : none">
                                        <font face="Times New Roman" color="#80080" size="3"><b>:</b></font>
                                    </div>
                                </td>
                                <td colspan="3" align="left">
                                    <div id="divPrevRefNo_3" style="display : none">
                                        <select name="sPrevOrdId" size="1" onchange="getPrevOrdDesc(this);">
                                            <option value="">SELECT</option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Start Date</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                                <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="17%" align="left">
                                    <input name="sTcFrm" size="11" value="<%= sTcFrm%>" readonly
                                           onclick="sel_date_cls('f1.sTcFrm','js/')"/>
                                </td>
                                <td width="12%"><font face="Times New Roman" color="#80080" size="3"><b>End Date</b><span style="color : red ; font-size : 12pt"><b>*</b></span></font></td>
                                <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="13%" align="left">
                                    <input name="sTcTo" size="11" value="<%= sTcTo%>" readonly
                                           onclick="sel_date_cls('f1.sTcTo','js/')"/>
                                </td>
                                <td width="12%"><font face="Times New Roman" color="#80080" size="3"><b>Bill Frequency</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                                <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td align="left">
                                    <select name="sBlFreq" size="1">
                                        <option value="">SELECT</option>
                                        <option value="M">Monthly</option>
                                        <option value="B">Bi-monthly</option>
                                        <option value="Q">Quarterly</option>
                                        <option value="H">Half Yearly</option>
                                        <option value="Y">Yearly</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="left">
                    <div id="div_22" style="background-color : #deffdd ; display : none">
                        <table width ="100%">
                            <tr>
                                <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Capex Scheme No</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                                <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="15%" align="left">
                                    <input name="sCapexSchmeNo" size="10" value="<%= sCapexSchmeNo%>" readonly onclick="getCapexSchme()"/>
                                </td>
                                <td width="12%"><font face="Times New Roman" color="#80080" size="3"><b>Description</b></font></td>
                                <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td align="left">
                                    <input name="sCapexSchmeDesc" size="40" value="<%= sCapexSchmeDesc%>" readonly onclick="getCapexSchme()"/>
                                </td>

                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="left">
                    <div id="div_23" style="background-color : #deffdd ; display : none">
                        <table width ="100%">
                            <tr>
                                <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Rate Contract Remarks</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                                <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td align="left">
                                    <textarea rows="5" name="sRContRmrk" cols="66"><%=sRContRmrk%></textarea>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="left">

                    <table width ="100%">
                        <tr>
                            <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Plant</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                            <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td align="left">
                                <select name="sPlRef" size="1" style="Z-INDEX:-100;" onchange="getEquip(this.value);">
                                    <option value="">SELECT</option>

                                    <%          sPlCdCl = " WHERE unit LIKE '%" + sUnit.substring(0, sUnit.indexOf("|")) + "%'"
                                                        + " AND station = '" + sOrdForStnCd + "'";
                                                if (sJobTyp.equals("M")) {
                                                    sPlCdCl += " AND m_cc IS NOT NULL";
                                                } else {
                                                    sPlCdCl += " AND o_cc IS NOT NULL";
                                                }
                                                System.out.println("11111 : " + sPlCdCl);
                                                List lstPlCcMst = hRemote.getPl_cc_mst(sPlCdCl);
                                                rows = null;
                                                iterateOuter = null;
                                                iterateInner = null;
                                                iterateOuter = lstPlCcMst.iterator();
                                                while (iterateOuter.hasNext()) {
                                                    rows = (List) iterateOuter.next();

                                                    iterateInner = rows.iterator();
                                                    while (iterateInner.hasNext()) {
                                    %>

                                    <option value="<%= (String) iterateInner.next()%>"><%= (String) iterateInner.next()%></option>

                                    <%
                                                    }
                                                }

                                    %>
                                </select>
                            </td>

                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="left">

                    <table width ="100%">
                        <tr>
                            <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Equipment</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                            <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td width="82%" align="left">
                                <select name="sEquipCd" style="z-index: -100" onchange="">
                                    <option value="">SELECT</option>
                                    <%
                                                lstPlCcEquipMst = null;
                                                rows = null;
                                                iterateOuter = null;
                                                iterateInner = null;
                                                iPlRef = 0;
                                                iRefNo = 0;
                                                sCond = " AND b.equipment = '" + sEquipCd + "'"
                                                        + " AND a.station = '" + sOrdForStnCd + "'"
                                                        + " AND b.station = '" + sOrdForStnCd + "'";
                                                lstPlCcEquipMst = hRemote.getPlCcEquipMst(sCond);
                                                iterateOuter = lstPlCcEquipMst.iterator();
                                                while (iterateOuter.hasNext()) {
                                                    rows = (List) iterateOuter.next();

                                                    iterateInner = rows.iterator();


                                                    while (iterateInner.hasNext()) {
                                                        iterateInner.next();
                                                        iterateInner.next();
                                                        sPlRef = "" + ((BigDecimal) iterateInner.next()).intValue();
                                                        iterateInner.next();
                                                        iterateInner.next();
                                                        iterateInner.next();
                                                        iterateInner.next();
                                                        iRefNo = ((BigDecimal) iterateInner.next()).intValue();

                                                    }
                                                }

                                                lstPlCcEquipMst = null;
                                                rows = null;
                                                iterateOuter = null;
                                                iterateInner = null;
                                                sCond = " AND a.plant_ref = '" + sPlRef + "'"
                                                        + " AND a.station = '" + sOrdForStnCd + "'"
                                                        + " AND b.station = '" + sOrdForStnCd + "'";

                                                lstPlCcEquipMst = hRemote.getPlCcEquipMst(sCond);
                                                iterateOuter = lstPlCcEquipMst.iterator();
                                                String sEquipDesc = new String();
                                                while (iterateOuter.hasNext()) {
                                                    rows = (List) iterateOuter.next();

                                                    iterateInner = rows.iterator();

                                                    while (iterateInner.hasNext()) {
                                                        iterateInner.next();
                                                        iterateInner.next();
                                                        sPlRef = "" + ((BigDecimal) iterateInner.next()).intValue();
                                                        iterateInner.next();
                                                        iterateInner.next();
                                                        iterateInner.next();
                                                        sEquipDesc = (String) iterateInner.next();
                                                        iRefNo = ((BigDecimal) iterateInner.next()).intValue();%>
                                    <option value="<%=iRefNo%>"><%= sEquipDesc%></option>

                                    <%    }
                                                }%>
                                </select>

                            </td>

                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="left">

                    <table width ="100%">
                        <tr>
                            <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Job Desc</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                            <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td width="82%"><textarea name="sJobDesc" cols="73" rows="4" onfocus="this.select();"><%= sJobDesc%></textarea></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="3" align="left">

                    <table width ="100%">
                        <tr>
                            <td width="15%">
                                <table>
                                    <tr>
                                        <td>
                                            <img name="imgAnnex" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/>
                                        </td>
                                        <td>
                                            &nbsp;<font face="Times New Roman" color="#80080" size="3"><b>Annexure</b></font>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td width="82%">
                                <div id="divAnnex" style="width: 850px; background: #FFFFCC; display:none">
                                    <table>
                                        <tr>
                                            <td width="40%">
                                                <textarea rows="5" name="sAnnex" cols="35" onfocus="this.select();"><%=sAnnex%></textarea>
                                            </td>
                                            <td valign="top" width="35%">
                                                <table class="table" id="tabFl">
                                                    <thead class="table_thead">
                                                        <tr class="table_thead_tr">
                                                            <th>Del<br>Mkr.</th>
                                                            <th>Uploaded&nbsp;File</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    </tbody>
                                                </table>
                                                <br/>
                                                <center>
                                                    <div id="divDelFl" style="width: 20px; background : #000040; display:none">
                                                        <input type="button" value="Delete File" name="butnDelFl" onclick="delFl();">
                                                    </div>
                                                </center>
                                            </td>
                                            <td valign="top" width="25%"> 
                                                <iframe id ="iFrameUpldFl" name ="iFrameUpldFl" src="upldFl.jsp?sOrdId=<%= sOrdId%>&sIpAddr=<%= sIpAddr%>" height="140px" width="350px" frameborder="0">

                                                </iframe>
                                            </td>
                                        </tr>
                                    </table>

                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="left">

                    <table width ="100%">
                        <tr>
                            <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Budget Head</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                            <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td width="15%"><input name="sBudgHead" size="15" value="<%=sBudgHead%>" onclick="sel_budg()"></td>
                            <td width="1%">&nbsp;</td>
                            <td width="12%"><font face="Times New Roman" color="#80080" size="3"><b>Description</b></font></td>
                            <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td width="30%"><input name="sBudgHeadDesc" size="30" value="<%=sBudgHeadDesc%>" onclick="sel_budg()"></td>
                            <td><a href="#" onclick="if(chkSOrdForStnCd() && chkSBudgHead()){budgPos();}"><font face="Times New Roman" color="blue" size="3">Click To View Budget Position</font></a></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="3" >

                    <div id="divJobComp_1" style="width: 700px; background: #FFFFCC; display : none">

                        <table>
                            <tr>
                                <td>
                                    <font face="Times New Roman" color="#80080" size="3"><b>Job&nbsp;Complete&nbsp;:</b></font>
                                    <select name="sJobComp" onchange="chkSJobComp();chkDivIso();">
                                        <option value="Y">Yes</option>
                                        <option value="N">No</option>
                                    </select>
                                </td>
                                <td>

                                    <div id="divJobComp_2" style="width: 500px; background: #FFFFCC; display : none">


                                        <font face="Times New Roman" color="#80080" size="3"><b>&nbsp;Job&nbsp;Start&nbsp;Date&nbsp;:</b></font>
                                        <input name="sJobStDt" size="11" value="<%= sJobStDt%>" readonly
                                               onfocus="this.select();" onclick="if(!this.readOnly)sel_date_cls('f1.sJobStDt','js/')"/>
                                        <font face="Times New Roman" color="#80080" size="3"><b>&nbsp;Job&nbsp;End&nbsp;Date&nbsp;:</b></font>
                                        <input name="sJobEndDt" size="11" value="<%= sJobEndDt%>" readonly
                                               onfocus="this.select();" onclick="if(!this.readOnly)sel_date_cls('f1.sJobEndDt','js/')"/>
                                    </div>
                                </td>

                            </tr>
                        </table>
                    </div>

                </td>

            <tr>
                <td colspan="3" align="left">
                    <div style="z-index : 50">

                        <table width ="100%">
                            <tr>
                                <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Job&nbsp;Place</b></font></td>
                                <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="5%" align="left">
                                    <select name = "sJobPlace" size = "1" onchange="chkSJobPlace();">
                                        <option value = "I">Inside</option>
                                        <option value = "O">Outside</option>
                                    </select>
                                </td>
                                <td width="1%">&nbsp;</td>
                                <td width="10%"><font face="Times New Roman" color="#80080" size="3"><b>Safety Clause</b></font></td>
                                <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="8%" align="left">
                                    <div id="divSafety_1" style="width: 100px; background: #FFFFCC">
                                        <select name = "sSafety" onchange="chngSafety();">
                                            <option value = "Y">Yes</option>
                                            <option value = "N">No</option>
                                        </select>
                                    </div>
                                    <div id="divSafety_2" style="width: 100px; background: #FFFFCC">
                                        <font face="Tahoma" color="#000000"><b>APPLICABLE</b></font>
                                    </div>
                                </td>
                                <td width="1%">&nbsp;</td>
                                <td width="5%"><font face="Times New Roman" color="#80080" size="3"><b>SCMP</b></font></td>
                                <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="9%" align="left">
                                    <div id="divScmp_clause_1" style="width: 100px; background: #FFFFCC">
                                        <select name = "sScmp_clause">
                                            <option value = "Y">Yes</option>
                                            <option value = "N">No</option>
                                        </select>
                                    </div>
                                    <div id="divScmp_clause_2" style="width: 100px; background: #FFFFCC">
                                        <font face="Tahoma" color="#000000"><b>NOT&nbsp;APPLICABLE</b></font>
                                    </div>
                                </td>
                                <td width="1%">&nbsp;</td>
                                <td width="12%"><font face="Times New Roman" color="#80080" size="3"><b>Site Cleaning Clause</b></font></td>
                                <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="8%" align="left">
                                    <div id="divEnv_1" style="width: 100px; background: #FFFFCC">
                                        <select name = "sEnv">
                                            <option value = "Y">Yes</option>
                                            <option value = "N">No</option>
                                        </select>
                                    </div>
                                    <div id="divEnv_2" style="width: 100px; background: #FFFFCC">
                                        <font face="Tahoma" color="#000000"><b>NOT&nbsp;APPLICABLE</b></font>
                                    </div>
                                </td>
                                <td width="1%">&nbsp;</td>
                                <td width="10%"><font face="Times New Roman" color="#80080" size="3"><b>ESI Applicable</b></font></td>
                                <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="8%" align="left">
                                    <div id="divEsi_1" style="width: 100px; background: #FFFFCC">
                                        <select name = "sEsi">
                                            <option value = "Y">Yes</option>
                                            <option value = "N">No</option>
                                        </select>
                                    </div>
                                    <div id="divEsi_2" style="width: 100px; background: #FFFFCC">
                                        <font face="Tahoma" color="#000000"><b>APPLICABLE</b></font>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>

            <tr>
                <td colspan="3" align="left">
                    <table width ="100%">
                        <tr>
                            <td width="22%"><font face="Times New Roman" color="#80080" size="3"><b>Environment&nbsp;Related&nbsp;Expense</b></font></td>
                            <td width="1%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td width="3%"><input type="checkbox" name="sEnvExp" /></td>
                            <td width="1%">&nbsp;</td>
                            <td width="17%"><font face="Times New Roman" color="#80080" size="3"><b>Safety&nbsp;Related&nbsp;Expense</b></font></td>
                            <td width="1%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td width="3%"><input type="checkbox" name="sSafetyExp" /></td>
                            <td width="1%">&nbsp;</td>
                            <td width="17%"><font face="Times New Roman" color="#80080" size="3"><b>Health&nbsp;Related&nbsp;Expense</b></font></td>
                            <td width="1%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td width="3%"><input type="checkbox" name="sHealthExp" /></td>
                            <td width="1%">&nbsp;</td>
                            <td width="10%"><font face="Times New Roman" color="#80080" size="3"><b>None&nbsp;Of&nbsp;these</b></font></td>
                            <td width="1%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td><input type="checkbox" name="sNoneOfThese" onclick="if(!this.disabled){
                            if(this.checked){
                                f1.sEnvExp.checked = false;
                                f1.sEnvExp.disabled = true ;
                                f1.sSafetyExp.checked = false;
                                f1.sSafetyExp.disabled = true ;
                                f1.sHealthExp.checked = false;
                                f1.sHealthExp.disabled = true ;
                            }else{
                                f1.sEnvExp.disabled = false ;
                                f1.sSafetyExp.disabled = false ;
                                f1.sHealthExp.disabled = false ;
                            }
                        }"/></td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="3" align="left">
                    <table width ="100%">
                        <tr>
                            <td width="14%">
                                <font face="Times New Roman" color="#80080" size="3"><b>Clubbed&nbsp;Order</b></font>
                            </td>
                            <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td width="8%">
                                <select name="sClubbed" onchange="chkSClubbed();">
                                    <option value="Y">Yes</option>
                                    <option value="N" selected>No</option>
                                </select>
                            </td>
                            <td width="1%">&nbsp;</td>
                            <td width="14%">
                                <font face="Times New Roman" color="#80080" size="3"><b>Quotation Type</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span>
                            </td>
                            <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td>
                                <select name="sQuotnTyp" onchange="chkSQuotnTyp();">
                                    <option value="">&nbsp;</option>
                                    <option value="L">Lower Quotation</option>
                                    <option value="S">Single Quotation</option>
                                </select>
                            </td>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="3" align="left">
                    <div id="div_recommend_1" style="display:none">
                        <table width ="100%">
                            <tr>
                                <td width="15%">

                                    <font face="Times New Roman" color="#80080" size="3"><b>Recommendation</b></font><span style="color : red ; font-size : 12pt"><b>*</b></span>

                                </td>
                                <td width="3%">

                                    <font face="Times New Roman" color="#80080" size="3"><b>:</b></font>

                                </td>
                                <td width="82%">

                                    <select name="sRecommend" style ="font-size: 12px ; width : 785px" onchange="">
                                        <option value="">SELECT</option>

                                        <%                                                    List lstRecommend = hRemote.getRecommend();
                                                    rows = null;
                                                    iterateOuter = null;
                                                    iterateInner = null;
                                                    iterateOuter = lstRecommend.iterator();
                                                    while (iterateOuter.hasNext()) {
                                                        rows = (List) iterateOuter.next();

                                                        iterateInner = rows.iterator();
                                                        while (iterateInner.hasNext()) {
                                        %>

                                        <option value="<%= (String) iterateInner.next()%>"><%= iterateInner.next()%></option>

                                        <%
                                                        }
                                                    }

                                        %>
                                    </select>

                                </td>
                        </table>
                    </div>
                </td>

            </tr>

            <tr>
                <td colspan="3" align="left">

                    <table width ="100%">
                        <tr>
                            <td width="15%">
                                <table>
                                    <tr>
                                        <td>
                                            <img name="imgRecommendNote" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/>
                                        </td>
                                        <td>
                                            &nbsp;<font face="Times New Roman" color="#80080" size="3"><b>Addl.&nbsp;notes&nbsp;on<br>&nbsp;Recommendation</b></font>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="4%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td>
                                <div id="divRecommendNote" style="width: 620px; background: #FFFFCC; display:none">
                                    <table>
                                        <tr>
                                            <td width="100%">
                                                <textarea rows="5" name="sRecommendNote" cols="73" onfocus="this.select();"><%=sRecommendNote%></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>

                <td colspan="3" align="center">

                    <div id="divVndrDtls_11" style="width: 950px; background: #FFFFCC; display:none">

                        <table width ="100%">
                            <tr>
                                <td colspan="3" align="center">
                                    <font face="Times New Roman" color="mediumblue" size="3"><b><i><u>Vendor&nbsp;1&nbsp;Details&nbsp;(Vendor on whom the Order is being placed)</u></i></b></font>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <!--td width="15%">
                                    <font face="Times New Roman" color="#80080" size="3"><b>Vendor&nbsp;1&nbsp;Details</b></font>
                                </td>




                                <td width="3%">

                                    <font face="Times New Roman" color="#80080" size="3"><b>:</b></font>

                                </td-->
                                <td width="100%">
                                    <center>
                                        <table cellspacing="1" cellpadding="2" class="table" id="" width="400" style="border-collapse: collapse">
                                            <thead class="table_thead">
                                                <tr class="table_thead_tr">
                                                    <th class="table_thead_tr_th">Vendor<span style="color : red ; font-size : 12pt"><b>*</b></span></th>
                                                    <th class="table_thead_tr_th">Wage&nbsp;Liability</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="table_tbody_tr">
                                                    <td class="table_tbody_tr_td">
                                                        <input type="text" name="sVndrNm" size="44" value="<%=sOrdVndrNm%>" onclick="getVndrDtls(this.name)">

                                                    </td>
                                                    <td class="table_tbody_tr_td" style="border-right : 1pt solid green">
                                                        <div id="divSpanWageLiab" style="display:none">
                                                            <span id="spanWageLiab">&nbsp;</span>
                                                        </div>
                                                        <div id="divRadWageLiab" style="display:none">
                                                            <input type="radio" name="radWageLiab" value="Yes" onclick="chkRadWageLiab(this)">Yes&nbsp;<input type="radio" name="radWageLiab" value="No" onclick="chkRadWageLiab(this)">No
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr class="table_tbody_tr">
                                                    <td class="table_tbody_tr_td" colspan="2" style="border-right : 1pt solid green">
                                                        <font face='Times New Roman' color='#80080' size='3'><b><span id="spanWageLiabComment">&nbsp;</span></b></font>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <br>
                                        <table cellspacing="1" cellpadding="2" class="table" id="myScrollTable_1" width="400" style="border-collapse: collapse">

                                        </table>

                                    </center>


                                </td>

                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <div id="divTax_text_1" style="display:none">
                                        <font face="Times New Roman" color="#000000" size="3"><b><u>VAT&nbsp;will&nbsp;be&nbsp;applicable&nbsp;on&nbsp;Material&nbsp;value&nbsp;you&nbsp;entered<br>Service&nbsp;Tax&nbsp;will&nbsp;be&nbsp;applicable&nbsp;on&nbsp;Labour&nbsp;value&nbsp;you&nbsp;entered<br>If&nbsp;you&nbsp;enter&nbsp;"Material&nbsp;Cost",&nbsp;the&nbsp;whole&nbsp;Order&nbsp;value&nbsp;will&nbsp;attract&nbsp;Works&nbsp;Contract&nbsp;tax</u></b></font>
                                    </div>
                                </td>
                            </tr>
                            <tr>                               
                                <td colspan="3" align="center">
                                    <div id="divTax_text_2" style="display:none">
                                        <font face="Times New Roman" color="#000000" size="3"><b><u>GST&nbsp;will&nbsp;be&nbsp;applicable&nbsp;for&nbsp;this&nbsp;order</u></b></font>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>

            <tr>

                <td colspan="3" align="center">

                    <div id="divVndrDtls_21" style="width: 950px; background: #FFFFCC; display:none">

                        <table width ="100%">
                            <tr>
                                <td colspan="3" align="center">
                                    <font face="Times New Roman" color="mediumblue" size="3"><b><i><u>Vendor&nbsp;2&nbsp;Details</u></i></b></font>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <!--td width="15%">
                                    <font face="Times New Roman" color="#80080" size="3"><b>Vendor&nbsp;2&nbsp;Details</b></font>
                                </td>




                                <td width="3%">

                                    <font face="Times New Roman" color="#80080" size="3"><b>:</b></font>

                                </td-->
                                <td width="100%">
                                    <center>
                                        <table cellspacing="1" cellpadding="2" class="table" id="" width="300" style="border-collapse: collapse">
                                            <thead class="table_thead">
                                                <tr class="table_thead_tr">
                                                    <th class="table_thead_tr_th">Vendor</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="table_tbody_tr">
                                                    <td class="table_tbody_tr_td">
                                                        <input type="text" name="sVndrNm_1" size="44" value="<%=sOrdVndrNm_1%>" onclick="getVndrDtls(this.name)">
                                                    </td>

                                                </tr>

                                            </tbody>
                                        </table>
                                        <br>
                                        <table cellspacing="1" cellpadding="2" class="table" id="myScrollTable_2" width="400" style="border-collapse: collapse">

                                        </table>

                                    </center>
                                    <br>
                                    <center>
                                        <table>
                                            <tr>
                                                <td>
                                                    <img name="imgVndrDtls_3" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/>
                                                </td>
                                                <td>
                                                    &nbsp;<font face="Times New Roman" color="#80080" size="3"><b>Click to enter Vendor-3 Details</b></font>
                                                </td>
                                            </tr>
                                        </table>
                                    </center>


                                </td>

                            </tr>
                        </table>
                    </div>
                </td>
            </tr>

            <tr>

                <td colspan="3" align="center">

                    <div id="divVndrDtls_31" style="width: 950px; background: #FFFFCC; display:none">

                        <table width ="100%">
                            <tr>
                                <td colspan="3" align="center">
                                    <font face="Times New Roman" color="mediumblue" size="3"><b><i><u>Vendor&nbsp;3&nbsp;Details</u></i></b></font>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3">&nbsp;</td>
                            </tr>
                            <tr>
                                <!--td width="15%">
                                    <font face="Times New Roman" color="#80080" size="3"><b>Vendor&nbsp;3&nbsp;Details</b></font>
                                </td>




                                <td width="3%">

                                    <font face="Times New Roman" color="#80080" size="3"><b>:</b></font>

                                </td-->
                                <td width="100%">

                                    <center>
                                        <table cellspacing="1" cellpadding="2" class="table" id="" width="300" style="border-collapse: collapse">
                                            <thead class="table_thead">
                                                <tr class="table_thead_tr">
                                                    <th class="table_thead_tr_th">Vendor</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="table_tbody_tr">
                                                    <td class="table_tbody_tr_td">
                                                        <input type="text" name="sVndrNm_2" size="44" value="<%=sOrdVndrNm_2%>" onclick="getVndrDtls(this.name)">
                                                    </td>

                                                </tr>

                                            </tbody>
                                        </table>
                                        <br>
                                        <table cellspacing="1" cellpadding="2" class="table" id="myScrollTable_3" width="400" style="border-collapse: collapse">

                                        </table>

                                    </center>
                                </td>

                            </tr>
                        </table>
                    </div>
                </td>
            </tr>

            <tr>
                <td style ="border-right : none" width="15%" valign = "center">
                    <table>
                        <tr>
                            <td>
                                &nbsp;<img name="img_6" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "show(18)"/>
                            </td>
                            <td>
                                &nbsp;<font face="Times New Roman" color="#80080" size="3"><b>General&nbsp;Quotation</b></font>
                            </td>
                        </tr>
                    </table>
                </td>
                <!--td style ="border-right : none" width="3%">
                    <div id="divVndrDtls_12" style="display : none">
                        <font face="Times New Roman" color="#80080" size="3"><b>:</b></font>
                    </div>
                </td-->
                <td style ="border-left : none" width="82%">
                    <div id="div_18" style="display : none">
                        &nbsp;
                    </div>
                    <div id="div_19" style="width: 550px; background: #FFFFCC; display:none">
                        <center>
                            <table cellspacing="1" cellpadding="2" class="table" id="" width="400" style="border-collapse: collapse">
                                <thead class="table_thead">
                                    <tr class="table_thead_tr">
                                        <th class="table_thead_tr_th">General Quotation No.</th>
                                        <th class="table_thead_tr_th">General Quotation Date</th>
                                        <th class="table_thead_tr_th" style="border-right : 1pt solid red">General Quotation Amt.</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="table_tbody_tr">
                                        <td class="table_tbody_tr_td"><input name="sGenQuotn_1" id="sGenQuotn_1" size="15" value="<%=sGenQuotn_1%>" onfocus="this.select();" onclick=""/></td>
                                        <td class="table_tbody_tr_td"><input name="sGenQuotnDt_1" id="sGenQuotnDt_1" size="11" value="<%=sGenQuotnDt_1%>" onfocus="this.select();" onclick="if(!this.readOnly)sel_date_cls('f1.sGenQuotnDt_1','js/')"/></td>
                                        <td class="table_tbody_tr_td" style="border-right : 1pt solid green"><input name="sGenQuotnAmt_1" id="sGenQuotnAmt_1" size="9" value="<%=sGenQuotnAmt_1%>" style = "text-align : right" onfocus="this.select();" onclick=""/></td>
                                    </tr>
                                    <tr class="table_tbody_tr">
                                        <td class="table_tbody_tr_td"><input name="sGenQuotn_2" id="sGenQuotn_2" size="15" value="<%=sGenQuotn_2%>" onfocus="this.select();" onclick=""/></td>
                                        <td class="table_tbody_tr_td"><input name="sGenQuotnDt_2" id="sGenQuotnDt_2" size="11" value="<%=sGenQuotnDt_2%>" onfocus="this.select();" onclick="if(!this.readOnly)sel_date_cls('f1.sGenQuotnDt_2','js/')"/></td>
                                        <td class="table_tbody_tr_td" style="border-right : 1pt solid green"><input name="sGenQuotnAmt_2" id="sGenQuotnAmt_2" size="9" value="<%=sGenQuotnAmt_2%>" style = "text-align : right" onfocus="this.select();" onclick=""/></td>
                                    </tr>

                                </tbody>
                            </table>

                        </center>
                    </div>
                    <div id="div_20" style="display : none">
                        &nbsp;
                    </div>
                </td>
            </tr>

            <tr>
                <td colspan="3" align="left">
                    <div id="divIso" style="display : none">

                        <table width ="100%">
                            <tr>
                                <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Job&nbsp;Quality</b></font></td>
                                <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="8%" align="left">
                                    <input name="sJobQuality" size="11" value="<%= sJobQuality%>" readonly onfocus="this.select();" />
                                </td>
                                <td width="1%">&nbsp;</td>
                                <td width="12%"><font face="Times New Roman" color="#80080" size="3"><b>Timely&nbsp;Execution</b></font></td>
                                <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td width="8%" align="left">
                                    <input name="sTimExec" size="11" value="<%= sTimExec%>" readonly onfocus="this.select();" />
                                </td>
                                <td width="1%">&nbsp;</td>
                                <td width="17%"><font face="Times New Roman" color="#80080" size="3"><b>EHS&nbsp;Compliance</b></font></td>
                                <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                                <td align="left">
                                    <input name="sEhsComp" size="11" value="<%= sEhsComp%>" readonly onfocus="this.select();" />

                                </td>

                            </tr>
                        </table>
                    </div>
                </td>
            </tr>

            <tr>
                <td colspan="2" align="left">

                    <table width ="100%">
                        <tr>
                            <td width="15%">
                                <table>
                                    <tr>
                                        <td>
                                            <img name="imgOrdRmrk" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/>
                                        </td>
                                        <td>
                                            &nbsp;<font face="Times New Roman" color="#80080" size="3"><b>Remarks</b></font>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="2%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>
                            <td width="83%">
                                <div id="divOrdRmrk" style="width: 550px; background: #FFFFCC; display:none">
                                    <textarea rows="5" name="sOrdRmrk" cols="66" onfocus="this.select();"><%=sOrdRmrk%></textarea>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </div>
    </tbody>
</table>
</form>

<form name="f2" align="center" action="OrderProcessServlet" method="post" target="iFramePrevOrdDesc">
    <input type="hidden" name="sCallNm" value="OrdCancel"/>
    <input type="hidden" name="sOrdId" value="<%= sOrdId%>"/>
    <input type="hidden" name="sCancel" value="Y"/>
    <input type="hidden" name="sCancelBy" value="<%= sCancelBy%>"/>
    <input type="hidden" name="sCancelDt" value="<%= sCancelDt%>"/>
    <input type="hidden" name="sLastBlDt" value=""/>

    <center>
        <table cellspacing="1" cellpadding="2" class="table" id="" width="100%" style="border-collapse: collapse" border="0">

            <tr class="table_tbody_tr">
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <div id="divCancel_1" style="width: 130px; background: #FFFFCC; display:none">
                        <table>
                            <tr>
                                <td>
                                    <img name="imgCancel_2" src="Pics/Order/plus_1.png" style="width : 20px ; height : 20px ; cursor : pointer" onclick = "clickImg(this);"/>
                                </td>
                                <td>
                                    &nbsp;<font face="Times New Roman" color="#80080" size="3"><b>Order&nbsp;Cancel</b></font>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>

                <td align="left">

                    <div id="divCancel_2" style="width: 750px; background: #FFFFCC; display:none">
                        <table>
                            <tr>
                                <td><font face="Times New Roman" color="#80080" size="3"><b>Cancel&nbsp;this&nbsp;Order&nbsp(&nbsp;<%= sOrdNo%>&nbsp;)</b></font>
                                </td>
                                <td><input type="checkbox" name="hCancel" /></td>
                            </tr>
                            <tr>
                                <td><font face="Times New Roman" color="#80080" size="3"><b>Canceled&nbsp;By</b></font>
                                </td>
                                <td bgcolor="b7dafd">
                                    <font face="Tahoma" color="#000000"><b><%= sCancelByNm%></b></font>

                                </td>
                            </tr>
                            <tr>
                                <td><font face="Times New Roman" color="#80080" size="3"><b>Canceled&nbsp;On</b></font>
                                </td>
                                <td bgcolor="b7dafd">
                                    <font face="Tahoma" color="#000000"><b><%= sCancelDt%></b></font>

                                </td>
                            </tr>
                            <tr>
                                <td><font face="Times New Roman" color="#80080" size="3"><b>Canceled&nbsp;From&nbsp;Date</b></font>
                                </td>
                                <td bgcolor="b7dafd">
                                    <input name="sCancelWef" size="11" value="<%=sCancelWef%>" onfocus="this.select();" onclick="if(!this.readOnly)sel_date_cls('f2.sCancelWef','js/')"/></td>
                                </td>
                            </tr>

                            <tr>
                                <td><font face="Times New Roman" color="#80080" size="3"><b>Reason&nbsp;for&nbsp;Cancellation</b></font>
                                </td>
                                <td colspan="3">
                                    <textarea rows="5" name="sCancelRsn" cols="40" onfocus="this.select();"><%=sCancelRsn%></textarea>
                                </td>
                            </tr>
                        </table>
                    </div>

                </td>

            </tr>



            <%                        if (!sErpCd.equals(
                                "")) {
            %>

            <tr align="center">
                <td colspan="2" class="table_tbody_tr_td" align="center">
                    <table>
                        <tr align="center">

                            <td><b><font face="Times New Roman" color="#80080" size="3">ERP A/c No</font></b></td>
                            <td bgcolor="#DD8000"><font face="Verdana" size="6"><%=sErpCd.substring(0, 1)%> </font></td>
                            <td bgcolor="#DD8000"><font face="Verdana" size="6"><%=sErpCd.substring(1, 2)%></font></td>
                            <td bgcolor="#DD8000"><font face="Verdana" size="6"><%=sErpCd.substring(2, 3)%></font></td>
                            <td bgcolor="#008000"><font face="Verdana" size="6"><%=sErpCd.substring(3, 4)%></font></td>
                            <td bgcolor="#008000"><font face="Verdana" size="6"><%=sErpCd.substring(4, 5)%></font></td>
                            <td bgcolor="#008000"><font face="Verdana" size="6"><%=sErpCd.substring(5, 6)%></font></td>
                            <td bgcolor="#008000"><font face="Verdana" size="6"><%=sErpCd.substring(6, 7)%></font></td>
                            <td bgcolor="#008000"><font face="Verdana" size="6"><%=sErpCd.substring(7, 8)%></font></td>
                            <td bgcolor="#8000FF"><font face="Verdana" size="6"><%=sErpCd.substring(8, 9)%></font></td>
                            <td bgcolor="#8000FF"><font face="Verdana" size="6"><%=sErpCd.substring(9, 10)%></font></td>
                            <td bgcolor="#8000FF"><font face="Verdana" size="6"><%=sErpCd.substring(10, 11)%></font></td>
                            <td bgcolor="#DD8000"><font face="Verdana" size="6"><%=sErpCd.substring(11, 12)%></font></td>
                            <td bgcolor="#DD8000"><font face="Verdana" size="6"><%=sErpCd.substring(12, 13)%></font></td>
                            <td bgcolor="#DD8000"><font face="Verdana" size="6"><%=sErpCd.substring(13, 14)%></font></td>
                            <td bgcolor="#DD8000"><font face="Verdana" size="6"><%=sErpCd.substring(14, 15)%></font></td>
                            <td bgcolor="#DD8000"><font face="Verdana" size="6"><%=sErpCd.substring(15, 16)%></font></td>
                            <td bgcolor="#5000FF"><font face="Verdana" size="6"><%=sErpCd.substring(16, 17)%></font></td>
                            <td bgcolor="#5000FF"><font face="Verdana" size="6"><%=sErpCd.substring(17, 18)%></font></td>
                            <td bgcolor="#5000FF"><font face="Verdana" size="6"><%=sErpCd.substring(18, 19)%></font></td>
                            <td bgcolor="#5000FF"><font face="Verdana" size="6"><%=sErpCd.substring(19, 20)%></font></td>
                            <td bgcolor="#5000FF"><font face="Verdana" size="6"><%=sErpCd.substring(20, 21)%></font></td>

                        </tr>
                    </table>
                </td>
            </tr>
            <%
                        }
            %>
            <tr>
                <td colspan="2" align="middle" >
                    <div id="divButn" style="width: 800px; background: #000040;">
                        <table>
                            <tr>
                                <td>
                                    <div id="divButnEdit" style="width: 100px; background: #000040; display:none">
                                        <input type="button" value="Edit" name="edit_btn" onclick="edit();if(this.value == 'Save'){animatedcollapse.hide('divButnConfirm');}else{animatedcollapse.show('divButnConfirm');}">
                                    </div>
                                </td>
                                <td>
                                    <div id="divButnSentBack" style="width: 100px; background: #000040; display:none">
                                        <input type="button" value="Send Back" name="butnSentBack" onclick="sentBack();">
                                    </div>
                                </td>
                                <td>
                                    <div id="divButnConfirm" style="width: 100px; background: #000040; display:none">
                                        <input type="button" value=" Confirm" name="butnConfirm" onclick="f1.sConfLvl.value=f1.sLoginEmpLvl.value;conf();">
                                    </div>
                                </td>
                                <td>
                                    <div id="divButnAllowBlReal" style="width: 120px; background: #000040; display:none">
                                        <input type="button" value="Allow Bill Release" name="butnAllowBlReal" style = "text-align : center;" onclick="f1.sConfLvl.value='2';conf();">
                                    </div>
                                </td>
                                <td>
                                    <div id="divButnOrdCancel" style="width: 140px; background: #000040;display:none">
                                        <input type="button" value="Cancel the Order" name="butnOrdCancel" style = "text-align : center;" onclick="if(hCancel.checked == 1){chkCancel()}"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>



        </table>

</form>
<form method="post" name = "formSentBackRmrk" action="OrderProcessServlet" target="iFramePrevOrdDesc">
    <input type="hidden" name="sCallNm" value="sentBack" />
    <input type="hidden" name="sOrdId" value="<%= sOrdId%>" />
    <input type="hidden" name="sLoginEmpCd" value="<%= sLoginEmpCd%>" />
    <input type="hidden" name="sSentBackLvl" value="" />

    <table width="100%">

        <tr>
            <td align="left">
                <div id="divSentBackRmrk" style="width: 800px;display:none">

                    <table width ="100%">
                        <tr>
                            <td width="15%"><font face="Times New Roman" color="#80080" size="3"><b>Sent Back Remarks</b></font></td>
                            <td width="3%"><font face="Times New Roman" color="#80080" size="3"><b>:</b></font></td>

                            <td width="82%"><textarea name="sSentBackRmrk" cols="73" rows="4" onfocus="this.select();"><%= sSentBackRmrk%></textarea></td>

                        </tr>
                    </table>
            </td>
        </tr>
    </table>
</form>

<div style="display:none">
    <iframe id ="iFramePrevOrdDesc" name ="iFramePrevOrdDesc" src="" height="0px" width="0px">

    </iframe>
</div>

<!--div name="divVndrDtls" style="color: #0900C4; font: Helvetica 12pt;border: 1px solid black; top:200px ; left:300px ; z-index:100">
</div-->

<div id = "divVndrDtls" name="divVndrDtls" style = "z-index : 100 ; left : 220px ; top : 670px ; position : absolute ; font: Helvetica 12pt;border: 1px solid black; color: #ffffff ; background-color : #b7dafd ; width : 400px ; height : 100px ; visibility : hidden">



</div>

<form name="f3" action="order_entry.jsp" method="post">
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
    <input type="hidden" name="sOrdId" value="<%= sOrdId%>"/>
</form>


<script type="text/javascript">

//ffffcc

document.f1.sOrdForStnCd.value = "<%= sOrdForStnCd%>";
document.f1.sJobTyp.value="<%= sJobTyp%>";
document.f1.sOrdTyp.value="<%= sOrdTyp%>";
document.f1.sUnit.value="<%= sUnit%>";
document.f1.sBlFreq.value="<%= sBlFreq%>";
document.f1.sJobComp.value="<%= sJobComp%>";
document.f1.sJobPlace.value="<%= sJobPlace%>";
document.f1.sEsi.value="<%=sEsi%>";
document.f1.sSafety.value ="<%= sSafety%>";
document.f1.sEnv.value="<%=sEnv%>";
document.f1.sClubbed.value="<%=sClubbed%>";
document.f1.sRecommend.value="<%=sRecommend%>";
        









//document.f1.unit.value="<=iUnit >";
//document.f1.sRetnPctg.value="<sRetnPctg>";
        
//document.f1.sSts.value="<=sSts>";

document.f1.sPlRef.value="<%= sPlRef%>";
        
document.f1.sEquipCd.value="<%= sEquipCd%>";
f1.sRetnPctg.value = "<%= sRetnPctg%>"


//document.f1.sFuelTyp.value="<= sFuelTyp>";


    <%            // if (sOrdTyp.equals("T") || sOrdTyp.equals("R")) {
    %>
    

    <%            // }

                if (sOrdId.equals("") && (sOrdGenStnCd.equals("019"))) {

    %>
f1.sOrdForStnCd.value=""

    <%} else {

    %>

f1.sOrdForStnCd.value="<%= sOrdForStnCd%>"

    <%

                }

                if (sOrdId.equals("") && iCntOrdDept > 1) {

    %>
f1.sOrdForDeptCd.value=""

    <%    } else {

    %>

f1.sOrdForDeptCd.value="<%= sOrdForDeptCd%>"

    <%

                }

    %>

var iAllow="<%= iAllow%>";
var iDeptPermit = "<%= iDeptPermit%>";
var sLoginEmpCd="<%= sLoginEmpCd%>";
var sOrdBy = "<%= sOrdBy%>";
//var sOrdId = "< sOrdId>";
var sCancel="<%= sCancel%>";

function dt_to_num(x){
    var months=new Array('JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC');
    arr1=x.split("-");
    var val=0
    for(i=0; i<months.length;i++)
    {
        if (arr1[1]==months[i])
        {
            val=(arr1[2]*10000)+((i+1)*100)+ (arr1[0]*1);
            return val;
        }
    }
}
//document.forms[0].radVndrNm_1[0].checked=1;
//document.forms[0].radVndrNm_2[0].checked=1;
        

animatedcollapse.addDiv('divOrdRmrk', 'optional_attribute_string')
animatedcollapse.addDiv('divAnnex', 'optional_attribute_string')
animatedcollapse.addDiv('divVndrDtls_11', 'optional_attribute_string')
//animatedcollapse.addDiv('divVndrDtls_12', 'optional_attribute_string')
//animatedcollapse.addDiv('divVndrDtls_13', 'optional_attribute_string')
animatedcollapse.addDiv('divVndrDtls_21', 'optional_attribute_string')
//animatedcollapse.addDiv('divVndrDtls_22', 'optional_attribute_string')
//animatedcollapse.addDiv('divVndrDtls_23', 'optional_attribute_string')
animatedcollapse.addDiv('divVndrDtls_31', 'optional_attribute_string')
//animatedcollapse.addDiv('divVndrDtls_32', 'optional_attribute_string')
//animatedcollapse.addDiv('divVndrDtls_33', 'optional_attribute_string')


animatedcollapse.addDiv('div_18', 'optional_attribute_string')
animatedcollapse.addDiv('div_19', 'optional_attribute_string')
animatedcollapse.addDiv('div_20', 'optional_attribute_string')
animatedcollapse.addDiv('div_21', 'optional_attribute_string')
animatedcollapse.addDiv('div_22', 'optional_attribute_string')
animatedcollapse.addDiv('div_23', 'optional_attribute_string')
animatedcollapse.addDiv('div_recommend_1', 'optional_attribute_string')
animatedcollapse.addDiv('divRecommendNote', 'optional_attribute_string')
animatedcollapse.addDiv('divSpanWageLiab', 'optional_attribute_string')
animatedcollapse.addDiv('divRadWageLiab', 'optional_attribute_string')
animatedcollapse.addDiv('divTax_text_1', 'optional_attribute_string')
animatedcollapse.addDiv('divTax_text_2', 'optional_attribute_string')
animatedcollapse.addDiv('divPrevRefNo_1', 'optional_attribute_string')
animatedcollapse.addDiv('divPrevRefNo_2', 'optional_attribute_string')
animatedcollapse.addDiv('divPrevRefNo_3', 'optional_attribute_string')
animatedcollapse.addDiv('divPrevOrdOneDesc', 'optional_attribute_string')
animatedcollapse.addDiv('divJobComp_1', 'optional_attribute_string')
animatedcollapse.addDiv('divJobComp_2', 'optional_attribute_string')
animatedcollapse.addDiv('divSafety_1', 'optional_attribute_string')
animatedcollapse.addDiv('divSafety_2', 'optional_attribute_string')
animatedcollapse.addDiv('divScmp_clause_1', 'optional_attribute_string')
animatedcollapse.addDiv('divScmp_clause_2', 'optional_attribute_string')
animatedcollapse.addDiv('divEnv_1', 'optional_attribute_string')
animatedcollapse.addDiv('divEnv_2', 'optional_attribute_string')
animatedcollapse.addDiv('divEsi_1', 'optional_attribute_string')
animatedcollapse.addDiv('divEsi_2', 'optional_attribute_string')
animatedcollapse.addDiv('divIso', 'optional_attribute_string')
animatedcollapse.addDiv('divButn', 'optional_attribute_string')
animatedcollapse.addDiv('divButnEdit', 'optional_attribute_string')
animatedcollapse.addDiv('divButnSentBack', 'optional_attribute_string')
animatedcollapse.addDiv('divButnConfirm', 'optional_attribute_string')
animatedcollapse.addDiv('divButnAllowBlReal', 'optional_attribute_string')
animatedcollapse.addDiv('divButnSentBackRmrk', 'optional_attribute_string')
animatedcollapse.addDiv('divSentBackRmrk', 'optional_attribute_string')
animatedcollapse.addDiv('divButnOrdCancel', 'optional_attribute_string')
animatedcollapse.addDiv('divCancel_1', 'optional_attribute_string')
animatedcollapse.addDiv('divCancel_2', 'optional_attribute_string')
    
animatedcollapse.init()

window.parent.frames[1].sOrdTyp.value = "<%= sOrdTyp%>";

            
var t = new ScrollableTable(document.getElementById('tabFl'), 100,180);

scrpt_OrderId = "<%= sOrdId%>";
scrpt_OrderTp = "<%= sOrdTyp%>";
scrpt_OrderDt = "<%= sOrdDtDiffFormat%>";

        
        

//setTimeOut(chkSOrdTyp(),2000);


if(f1.sOrdId.value == ''){
            
    if(window.parent.sBackClick.value == '0')window.parent.sBack.value= window.parent.sBack.value + '1';
    window.parent.frames[1].document.getElementById("spanBack").firstChild.data='Close';
            
}else{
    if(window.parent.sBackClick.value == '0')window.parent.sBack.value= window.parent.sBack.value + '2';

    var sVarBack = window.parent.sBack.value;

    var iIndx = sVarBack.length - 1;
    for(j = sVarBack.length - 2 ; j >= 0 ; j--)
        if(sVarBack.charAt(j) != '2'){iIndx = j ; break}
                        

    if(sVarBack.charAt(iIndx) == '1')window.parent.frames[1].document.getElementById("spanBack").firstChild.data='Close';
    else if(sVarBack.charAt(iIndx) == '6')window.parent.frames[1].document.getElementById("spanBack").firstChild.data='Back';
}
window.parent.sBackClick.value = '0';


window.parent.frames[1].formPageSubt.sOrdId.value="<%= sOrdId%>";


/*$(document).ready(function() {
        $("#divVndrDtls").draggable( {containment: "", scroll: false} );
    }); */

/*var x = 0, y = 0;
        $(document).ready(function() {
            $('.movable').live('mousemove', function(event) {
                var deltaX = event.pageX - x,
                deltaY = event.pageY - y;

                x = event.pageX;
                y = event.pageY;

                var movable = $('.movable');
                movable.offset({
                    left: movable.offset().left + deltaX,
                    top: movable.offset().top + deltaY
                });
            });

            $("#divVndrDtls")
            .mousedown(function(event) {
                x = event.pageX;
                y = event.pageY;
                $(this).parent().addClass('movable');
            })
            .mouseup(function() {
                $(this).parent().removeClass('movable');
            });
        });*/
    
</script>

</body>
</html>
