<%--
    Document   : nomination
    Created on : May 20, 2013, 12:15:01 PM
    Author     : sibashis_chatterjee
--%>

<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="Ipicms.IpicmsProcessBeanRemote"%>
<%@page import="genOrblJavaPackage.MakeConnectionGENORBL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date, java.util.Calendar"%>
<%@page import="java.sql.*, java.io.*" %>

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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IPICMS - nomination entries</title>
        <link rel="stylesheet" type="text/css" href="ipicms_nomination_style.css" />
        <style>
            .table {
                font-family     : verdana;
                font-size       : 11px;
                text-align      : left;
            }
        </style>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/animatedcollapse.js"></script>
        <script type="text/javascript" src="ipicms_nomination_script.js"></script>
        <!--script type="text/javascript" src="ipicms_datetimepicker.js"></script-->
        <script type="text/javascript" src="js/sel_date.js"></script>
        <script type="text/javascript" src="js/sel_month.js"></script>
        <script type="text/javascript" src="js/kaizenGenScript.js"></script>
        <script>
            function noenter(){
                if(window.event.keyCode == '13'){
                    return false;
                }
                return true;
            }

            function preScript(){
                //alert(f1.oev1.value + "-" + f1.oev1.selectedIndex)
                //alert(f1.oevTmp1.value + "-" + f1.oevTmp1.value);
                //if(f1.oev1.value == "")alert('YES-0')
                //if(f1.oevTmp1.value == "")alert('YES')
                f1.oev1.value = f1.oevTmp1.value             
                oevfx(1);
                f1.sSaluteCd_1.value = f1.sSaluteCdTmp_1.value
                document.getElementById("divNm_12").innerHTML = f1.sNmTmp_1.value;
                document.getElementById("divCd_11").innerHTML = f1.sVndrCdTmp_1.value;
                f1.sCd_1.value = f1.sCdTmp_1.value
                f1.sDesgCd_1.value = f1.sDesgCdTmp_1.value
                f1.sDesgDesc_1.value = f1.sDesgDescTmp_1.value
                document.getElementById("divDesg_11").innerHTML = f1.sDesgDescTmp_1.value;
                f1.sDeptCd_1.value = f1.sDeptCdTmp_1.value
                //alert(f1.sDeptCd_1.selectedIndex)
                document.getElementById("divDept_11").innerHTML = f1.sDeptCd_1.options[f1.sDeptCd_1.selectedIndex].text;
                f1.sVndrCd_1.value = f1.sVndrCdTmp_1.value
                f1.sVndrNm_1.value = f1.sVndrNmTmp_1.value
                f1.sVndrCoNm_1.value = f1.sVndrCoNmTmp_1.value
                f1.sVndrDesgCd_1.value = f1.sVndrDesgCdTmp_1.value

                f1.oev2.value = f1.oevTmp2.value             
                oevfx(2);
                f1.sSaluteCd_2.value = f1.sSaluteCdTmp_2.value
                document.getElementById("divNm_22").innerHTML = f1.sNmTmp_2.value;
                document.getElementById("divCd_21").innerHTML = f1.sVndrCdTmp_2.value;
                f1.sCd_2.value = f1.sCdTmp_2.value
                f1.sDesgCd_2.value = f1.sDesgCdTmp_2.value
                f1.sDesgDesc_2.value = f1.sDesgDescTmp_2.value
                document.getElementById("divDesg_21").innerHTML = f1.sDesgDescTmp_2.value;
                f1.sDeptCd_2.value = f1.sDeptCdTmp_2.value
                document.getElementById("divDept_21").innerHTML = f1.sDeptCd_2.options[f1.sDeptCd_2.selectedIndex].text;
                f1.sVndrCd_2.value = f1.sVndrCdTmp_2.value
                f1.sVndrNm_2.value = f1.sVndrNmTmp_2.value
                f1.sVndrCoNm_2.value = f1.sVndrCoNmTmp_2.value
                f1.sVndrDesgCd_2.value = f1.sVndrDesgCdTmp_2.value

                f1.oev3.value = f1.oevTmp3.value             
                oevfx(3);
                f1.sSaluteCd_3.value = f1.sSaluteCdTmp_3.value
                document.getElementById("divNm_32").innerHTML = f1.sNmTmp_3.value;
                document.getElementById("divCd_31").innerHTML = f1.sVndrCdTmp_3.value;
                f1.sCd_3.value = f1.sCdTmp_3.value
                f1.sDesgCd_3.value = f1.sDesgCdTmp_3.value
                f1.sDesgDesc_3.value = f1.sDesgDescTmp_3.value
                document.getElementById("divDesg_31").innerHTML = f1.sDesgDescTmp_3.value;
                f1.sDeptCd_3.value = f1.sDeptCdTmp_3.value
                document.getElementById("divDept_31").innerHTML = f1.sDeptCd_3.options[f1.sDeptCd_3.selectedIndex].text;
                f1.sVndrCd_3.value = f1.sVndrCdTmp_3.value
                f1.sVndrNm_3.value = f1.sVndrNmTmp_3.value
                //alert(f1.sVndrDesgCdTmp_3.value)
                f1.sVndrCoNm_3.value = f1.sVndrCoNmTmp_3.value
                f1.sVndrDesgCd_3.value = f1.sVndrDesgCdTmp_3.value


                f1.oev4.value = f1.oevTmp4.value             
                oevfx(4);
                f1.sSaluteCd_4.value = f1.sSaluteCdTmp_4.value
                document.getElementById("divNm_42").innerHTML = f1.sNmTmp_4.value;
                document.getElementById("divCd_41").innerHTML = f1.sVndrCdTmp_4.value;
                f1.sCd_4.value = f1.sCdTmp_4.value
                f1.sDesgCd_4.value = f1.sDesgCdTmp_4.value
                f1.sDesgDesc_4.value = f1.sDesgDescTmp_4.value
                document.getElementById("divDesg_41").innerHTML = f1.sDesgDescTmp_4.value;
                f1.sDeptCd_4.value = f1.sDeptCdTmp_4.value
                document.getElementById("divDept_41").innerHTML = f1.sDeptCd_4.options[f1.sDeptCd_4.selectedIndex].text;
                f1.sVndrCd_4.value = f1.sVndrCdTmp_4.value
                f1.sVndrNm_4.value = f1.sVndrNmTmp_4.value
                f1.sVndrCoNm_4.value = f1.sVndrCoNmTmp_4.value
                f1.sVndrDesgCd_4.value = f1.sVndrDesgCdTmp_4.value



                f1.oev5.value = f1.oevTmp5.value             
                oevfx(5);
                f1.sSaluteCd_5.value = f1.sSaluteCdTmp_5.value
                document.getElementById("divNm_52").innerHTML = f1.sNmTmp_5.value;
                document.getElementById("divCd_51").innerHTML = f1.sVndrCdTmp_5.value;
                f1.sCd_5.value = f1.sCdTmp_5.value
                f1.sDesgCd_5.value = f1.sDesgCdTmp_5.value
                f1.sDesgDesc_5.value = f1.sDesgDescTmp_5.value
                document.getElementById("divDesg_51").innerHTML = f1.sDesgDescTmp_5.value;
                f1.sDeptCd_5.value = f1.sDeptCdTmp_5.value
                document.getElementById("divDept_51").innerHTML = f1.sDeptCd_5.options[f1.sDeptCd_5.selectedIndex].text;
                f1.sVndrCd_5.value = f1.sVndrCdTmp_5.value
                f1.sVndrNm_5.value = f1.sVndrNmTmp_5.value
                f1.sVndrCoNm_5.value = f1.sVndrCoNmTmp_5.value
                f1.sVndrDesgCd_5.value = f1.sVndrDesgCdTmp_5.value

                
                butnDisplay();
                if(f1.sMode.value == 'N')menuDisplay();

                getPicFlNms('bef')
                getPicFlNms('aft')

                //showMsg();


                if(f1.sLoginEmpKaizenMkr.value == '4'){
                    animatedcollapse.show('divCatgTyp');
                }else{
                    animatedcollapse.hide('divCatgTyp');
                }

                if(f1.sLoginEmpKaizenMkr.value == '4' && f1.sStg.value == '5'){
                    butnConfirm.value = ' Award';
                }else{
                    butnConfirm.value = ' Forward';
                }

                /*//Send Back Block

              

                if(f1.sLoginEmpKaizenMkr.value == '1' && f1.sStg.value == '1' && f1.sSendBackMkr.value == 'Y'){
                    animatedcollapse.show('divSendBack');
                    lock_controls_sendBack(1);
                    animatedcollapse.hide('divButnSendBack');                  
                }else if(f1.sLoginEmpKaizenMkr.value == '2' && f1.sStg.value == '2'){

                    if(f1.sEditPermit.value == 'false'){
                        animatedcollapse.show('divSendBack');
                        lock_controls_sendBack(1);
                        animatedcollapse.hide('divButnSendBack');
                    }else if(f2.sSendBackMkr.value == 'N'){
                        animatedcollapse.show('divSendBack');
                        animatedcollapse.hide('divButnSendBack');
                    }
                    
                }else if(f1.sLoginEmpKaizenMkr.value == '3' && f1.sStg.value == '3'){
                    if(f1.sEditPermit.value == 'false'){
                        animatedcollapse.show('divSendBack');
                        lock_controls_sendBack(1);
                        animatedcollapse.hide('divButnSendBack');
                    }else if(f2.sSendBackMkr.value == 'N'){
                        animatedcollapse.show('divSendBack');
                        animatedcollapse.hide('divButnSendBack');
                    }
                }else if(f1.sLoginEmpKaizenMkr.value == '4' && f1.sStg.value == '5'){
                    if(f1.sEditPermit.value == 'false'){
                        animatedcollapse.show('divSendBack');
                        lock_controls_sendBack(1);
                        animatedcollapse.hide('divButnSendBack');
                    }else if(f2.sSendBackMkr.value == 'N'){
                        animatedcollapse.show('divSendBack');
                        animatedcollapse.hide('divButnSendBack');
                    }
                }else{
                    animatedcollapse.hide('divSendBack');
                    animatedcollapse.hide('divButnSendBack');     
                }

                



                //Send Back Block*/


                //Cancel/Reject Block

                if(f1.sStg.value == '1' || f1.sStg.value == '2' || f1.sStg.value == '3' || f1.sStg.value == '5' || f1.sStg.value == '4' || f1.sStg.value == '6' || f1.sStg.value == '8'){

                    if(f1.sStg.value == '1'){
                        document.getElementById("spanCancelHdg").innerHTML = "Cancellation";
                        document.getElementById("spanCancelMkr").innerHTML = "Cancel";
                        document.getElementById("spanCancelRsn").innerHTML = "Cancel Reason";
                        butnCancel.value = "Cancel the Nomination"
                        
                    }else if(f1.sStg.value == '2' || f1.sStg.value == '3' || f1.sStg.value == '5' || f1.sStg.value == '4' || f1.sStg.value == '6' || f1.sStg.value == '8'){
                        document.getElementById("spanCancelHdg").innerHTML = "Rejection";
                        document.getElementById("spanCancelMkr").innerHTML = "Reject";
                        document.getElementById("spanCancelRsn").innerHTML = "Reject Reason";
                        butnCancel.value = "Reject the Nomination"
                    }
                    
                }
               

                if(f3.sCancelMkr.value == 'Y'){
                    animatedcollapse.show('divCancel');
                    lock_controls_cancel(1);
                }else if(f1.sCancelPermit.value == 'true'){
                    animatedcollapse.show('divCancel');
                }else{
                    animatedcollapse.hide('divCancel');
                }

                //Cancel/Reject Block

                //Signatory Block

                if(f1.sStg.value == '2' || f1.sStg.value == '4'){
                    animatedcollapse.show('divLvl1');
                }else if(f1.sStg.value == '3' || f1.sStg.value == '6'){
                    animatedcollapse.show('divLvl1');
                    animatedcollapse.show('divLvl2');
                }else if(f1.sStg.value == '5' || f1.sStg.value == '8'){
                    animatedcollapse.show('divLvl1');
                    animatedcollapse.show('divLvl2');
                    animatedcollapse.show('divLvl3');
                }else if(f1.sStg.value == '7'){
                    animatedcollapse.show('divLvl1');
                    animatedcollapse.show('divLvl2');
                    animatedcollapse.show('divLvl3');
                    animatedcollapse.show('divLvl4');
                }

                //Signatory Block

                
                return true;
            }

            function showMsg(){

                if(sMsg.value != ''){

                    alert(sMsg.value);
                }
                return true;
            }


            function getPicFlNms(sTyp){

                var iTabNo ;

                if(sTyp == 'bef'){
                    iTabNo = 1;
                }else if(sTyp == 'aft'){
                    iTabNo = 2;
                }

                document.getElementById("sNoFl_" + iTabNo).value = 0 ;

                var xmldiffrnciator = Math.floor(Math.random()*100000);
                var parameter = "sCallNm=ipicmsFlNms" ;
                parameter += "&sContestId="+f1.sContestId.value ;
                parameter += "&sIpAddr="+f1.sIpAddr.value ;
                parameter += "&sTyp="+sTyp ;
                parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
                var url = "IpicmsProcessServlet?" + parameter ;
                //alert(url);
                var myval = new Object();
                var PicFlXML ;
                try{
                    PicFlXML = new ActiveXObject("Msxml2.XMLHTTP");
                }catch(e){
                    try{
                        PicFlXML = new ActiveXObject("Microsoft.XMLHTTP");
                    }catch(e){
                        PicFlXML = new XMLHttpRequest();
                    }
                }
                PicFlXML.open('POST',url,true);
                PicFlXML.send('');
                PicFlXML.onreadystatechange = function(){
                    if(PicFlXML.readyState == 4){
                        //alert(PicFlXML.responseText);
                        myval = PicFlXML.responseXML.getElementsByTagName("IPICMSPIC_"+sTyp);


                        tab = document.getElementById("tabFl_" + iTabNo);

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
                            document.getElementById("sNoFl_" + iTabNo).value = parseInt(document.getElementById("sNoFl_" + iTabNo).value) + 1;
                            tr = tab.insertRow(parseInt(document.getElementById("sNoFl_" + iTabNo).value));

                            td = tr.insertCell(tr.cells.length);
                            td.className = 'table_tbody_tr_td'
                            td.innerHTML = "<input type = 'checkbox' name='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' id='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' size='10' onclick='visDivDelFl(this.id)'/>"


                            td = tr.insertCell(tr.cells.length);
                            td.className = 'table_tbody_tr_td'
                            td.innerHTML = "<input type = 'text' name='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' size='15' value='" + cell + "' onclick='showPdf(this.id)'/>"

                        }
                    }
                }
            }


            function upldMsg(sUpldMkr,sFlNm,sTyp){

                //alert(sTyp)
                var iTabNo ;

                if(sTyp == 'bef'){
                    iTabNo = 1;
                }else if(sTyp == 'aft'){
                    iTabNo = 2;
                }


                document.getElementById("iFrameUpldFl_" + iTabNo).src = 'ipicms_upldFl.jsp?sContestId='+f1.sContestId.value+'&sIpAddr='+f1.sIpAddr.value + "&sTyp=" + sTyp;
                if(sUpldMkr == '1'){
                    alert('File ' + sFlNm + ' Uploaded Sucessfully');
                
                    document.getElementById("sNoFl_" + iTabNo).value = parseInt(document.getElementById("sNoFl_" + iTabNo).value) + 1;
                    tab = document.getElementById("tabFl_" + iTabNo);

                    tr = tab.insertRow(document.getElementById("sNoFl_" + iTabNo).value);


                    td = tr.insertCell(tr.cells.length);
                    td.className = 'table_tbody_tr_td'
                    td.innerHTML = "<input type = 'checkbox' name='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' id='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' size='10' onclick='visDivDelFl(this.id)'/>"

                    td = tr.insertCell(tr.cells.length);
                    td.className = 'table_tbody_tr_td'
                    td.innerHTML = "<input type = 'text' name='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' size='15' value='" + sFlNm + "' onclick='showPdf(this.id)'/>"

                
                }else if(sUpldMkr == '0'){
                    alert('File ' + sFlNm + ' Upload Failed !');
                }

                return true;
            
            }

            function visDivDelFl(id){
                //alert('1');
                iTabNo = id.substring(7,8);

                if(document.getElementById(id).checked == 1){

                    document.getElementById("divDelFl_" + iTabNo).style.display = 'inline';

                }else{
                    flag = 0;
                    for(i = 1 ; i <= parseInt(document.getElementById("sNoFl_" + iTabNo).value) ; i++)
                        if(document.getElementById('sChkFl_'+iTabNo+'_'+i).checked == 1)flag = 1;

                    if(flag == 0)document.getElementById("divDelFl_"+iTabNo).style.display = 'none'
                    else document.getElementById("divDelFl_"+iTabNo).style.display = 'inline';

                }

                return true;
            }



            function delFl(sTyp){

                var iTabNo ;

                if(sTyp == 'bef'){
                    iTabNo = 1;
                }else if(sTyp == 'aft'){
                    iTabNo = 2;
                }

                sLstFlNm = '';
                for(i = 1 ; i <= parseInt(document.getElementById("sNoFl_" + iTabNo).value) ; i++)
                    if(document.getElementById('sChkFl_'+iTabNo+'_'+i).checked == 1)
                        sLstFlNm = sLstFlNm + document.getElementById('sFlNm_'+iTabNo+'_'+i).value + '|' ;

                var xmldiffrnciator = Math.floor(Math.random()*100000);
                var parameter = "sCallNm=delFl" ;
                parameter += "&sContestId="+f1.sContestId.value;
                parameter += "&sIpAddr="+f1.sIpAddr.value ;
                parameter += "&sTyp="+sTyp ;
                parameter += "&sLstFlNm="+sLstFlNm ;
                parameter += "&xmldiffrnciator=" + xmldiffrnciator ;
                var url = "IpicmsProcessServlet?" + parameter ;
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
                            document.getElementById("divDelFl_"+iTabNo).style.display = 'none'

                            tab = document.getElementById("tabFl_"+iTabNo);
                            for(i = parseInt(document.getElementById("sNoFl_" + iTabNo).value) ; i >= 1 ; i--){
                                tab.deleteRow(i);
                            }

                            document.getElementById("sNoFl_" + iTabNo).value = 0;


                            getPicFlNms(sTyp);
                        }

                    }
                }

                return true;
            }

            function showPdf(id)
            {
                var sTyp
                iTabNo = id.substring(6,7);
                if(iTabNo == 1)sTyp = 'bef'
                else if(iTabNo == 2)sTyp = 'aft'
                var url="ipicms_showPdfIframe.jsp?sCallNo=1&sFlNm="+document.getElementById(id).value+"&sIpAddr="+f1.sIpAddr.value+"&sContestId="+f1.sContestId.value+"&sTyp="+sTyp;

                window.status="Please wait....................."+document.getElementById(id).value
                var c=showModalDialog(url,0,"dialogWidth:1000px;dialogHeight:650px");

                window.status=" "

                //window.open("showPdfIframe.jsp?sFlNm="+document.getElementById(id).value+"&sIpAddr="+f1.sIpAddr.value+"&sOrdId="+f1.sOrdId.value,"_blank");
            }

            function copyVndrDesgCd(id){

                id_no = id.substring(12);

                document.getElementById("sDesgCd_" + id_no).value = document.getElementById(id).value;
                document.getElementById("sDesgDesc_" + id_no).value = document.getElementById(id).options[document.getElementById(id).selectedIndex].text;

                return true;
            }

            function chngSCancelMkr(){

                if(f3.sCancelMkr.value == 'Y'){
                    f2.sSendBackMkr.value = 'N';
                    chngSSendBackMkr()
                    animatedcollapse.hide('divButnEdit');
                    animatedcollapse.hide('divButnSendBack');
                    animatedcollapse.hide('divButnConfirm');
                    animatedcollapse.show('divButnCancel');
                }else{
                    butnDisplay();
                }

                return true;
            }

            function chngSSendBackMkr(){

                if(f2.sSendBackMkr.value == 'Y'){
                    f3.sCancelMkr.value = 'N';
                    chngSCancelMkr();
                    animatedcollapse.hide('divButnEdit');
                    animatedcollapse.show('divButnSendBack');
                    animatedcollapse.hide('divButnConfirm');
                    animatedcollapse.hide('divButnCancel');
                }else{
                    butnDisplay();
                }

                return true;
            }

             

        </script>
    </head>
    <body class="" background="Pics/Order/lblue047.gif" onload="if(f1.sContestId.value == ''){preScript();lock_controls(0);someFldReadOnly();}else{preScript();lock_controls(1);}">
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

                    String sMsg = request.getParameter("sMsg");

                    String sSysDt = new String();

                    String sContestId = request.getParameter("sContestId");
                    String sMode = request.getParameter("sMode");

                    String sContestIdFul = new String();
                    String sPropBy = new String();
                    String sPropByNm = new String();
                    String sPropDt = new String();
                    String sLastEditBy = new String();
                    String sLastEditByNm = new String();
                    String sLastEditDt = new String();
                    String sStnCd = new String();
                    String sStnShrtNm = new String();
                    String sStnLongNm = new String();
                    String sDeptCd = new String();
                    String sDeptShrtNm = new String();
                    String sDeptLongNm = new String();
                    String sKaizenForDeptCd = new String();
                    String sTitle = new String();
                    String sIntSts = new String();
                    String sAct = new String();
                    String sRslt = new String();
                    String sCostSave = new String();
                    String sStDt = new String();
                    String sEndDt = new String();
                    String sCatgTyp = new String();
                    String sContestMnthYr = new String();
                    String sStg = new String();
                    String sOffLvl = new String();
                    String sSigId = new String();
                    String sCancelMkr = new String(" ");
                    String sCancelBy = new String();
                    String sCancelDt = new String();
                    String sCancelRsn = new String();

                    String sSendBackMkr = new String("");
                    String sSendBackBy = new String();
                    String sSendBackByNm = new String();
                    String sSendBackDt = new String();
                    String sSendBackRsn = new String();

                    String sOev_1 = new String(" ");
                    String sSaluteCd_1 = new String(" ");
                    String sNm_1 = new String();
                    String sCd_1 = new String();
                    String sDesgCd_1 = new String("");
                    String sDesgDesc_1 = new String();
                    String sDeptCd_1 = new String(" ");
                    String sVndrCd_1 = new String();
                    String sVndrNm_1 = new String();
                    String sVndrCoNm_1 = new String();
                    String sVndrDesgCd_1 = new String(" ");

                    String sOev_2 = new String(" ");
                    String sSaluteCd_2 = new String(" ");
                    String sNm_2 = new String();
                    String sCd_2 = new String();
                    String sDesgCd_2 = new String();
                    String sDesgDesc_2 = new String();
                    String sDeptCd_2 = new String(" ");
                    String sVndrCd_2 = new String();
                    String sVndrNm_2 = new String();
                    String sVndrCoNm_2 = new String();
                    String sVndrDesgCd_2 = new String(" ");

                    String sOev_3 = new String(" ");
                    String sSaluteCd_3 = new String(" ");
                    String sNm_3 = new String();
                    String sCd_3 = new String();
                    String sDesgCd_3 = new String();
                    String sDesgDesc_3 = new String();
                    String sDeptCd_3 = new String(" ");
                    String sVndrCd_3 = new String();
                    String sVndrNm_3 = new String();
                    String sVndrCoNm_3 = new String();
                    String sVndrDesgCd_3 = new String(" ");

                    String sOev_4 = new String(" ");
                    String sSaluteCd_4 = new String(" ");
                    String sNm_4 = new String();
                    String sCd_4 = new String();
                    String sDesgCd_4 = new String();
                    String sDesgDesc_4 = new String();
                    String sDeptCd_4 = new String(" ");
                    String sVndrCd_4 = new String();
                    String sVndrNm_4 = new String();
                    String sVndrCoNm_4 = new String();
                    String sVndrDesgCd_4 = new String(" ");

                    String sOev_5 = new String(" ");
                    String sSaluteCd_5 = new String(" ");
                    String sNm_5 = new String();
                    String sCd_5 = new String();
                    String sDesgCd_5 = new String();
                    String sDesgDesc_5 = new String();
                    String sDeptCd_5 = new String(" ");
                    String sVndrCd_5 = new String();
                    String sVndrNm_5 = new String();
                    String sVndrCoNm_5 = new String();
                    String sVndrDesgCd_5 = new String(" ");

                    String sIpAddr = request.getRemoteAddr();

                    String sLvl_1_cd = new String();
                    String sLvl_1_nm = new String();
                    String sLvl_1_dt = new String();
                    String sLvl_2_cd = new String();
                    String sLvl_2_nm = new String();
                    String sLvl_2_dt = new String();
                    String sLvl_3_cd = new String();
                    String sLvl_3_nm = new String();
                    String sLvl_3_dt = new String();
                    String sLvl_4_cd = new String();
                    String sLvl_4_nm = new String();
                    String sLvl_4_dt = new String();


                    Iterator iterateOuter = null;
                    Iterator iterateInner = null;
                    List rows = null;

                    Iterator iterateOuter_2 = null;
                    Iterator iterateInner_2 = null;
                    List rows_2 = null;


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

                    sPropBy = sLoginEmpCd;
                    sPropByNm = sLoginEmpNm;
                    sPropDt = sSysDt;
                    sStnCd = sLoginStnCd;
                    sStnShrtNm = sLoginStnShrtNm;
                    sStnLongNm = sLoginStnLongNm;
                    sDeptCd = sLoginDeptCd;
                    sDeptShrtNm = sLoginDeptShrtNm;
                    sDeptLongNm = sLoginDeptLongNm;

                    List lstOffNm = null;
                    List lstEmpNm = null;
                    List lstVndrCoNm = null;
                    List lstSalute = null;
                    List lstCatgTyp = null;
                    List lstVndrDesg = null;
                    List lstContestantTyp = null;


                    /*String off_id;
                    int offlevel = 0;
                    String proposedby, proposaldate, lasteditedby, lasteditedon, office;
                    String desgcode = new String ("");
                    String officerfname = new String ("");
                    proposedby = new String ("");
                    office = new String ("");
                    String officerlname = new String ("");
                    String deptcode = new String ("");
                    String officecode = new String ("");
                    off_id = request.getParameter ("currentuser");
                    DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
                    Connection con = DriverManager.getConnection ("jdbc:oracle:oci8:@devdb", "trainee", "trainee");
                    Statement stmt = con.createStatement ();
                    String query = new String ("SELECT * FROM IDCMS_OFF_MST WHERE OFFICER_CODE=\'" + off_id + "\'");
                    ResultSet rs = stmt.executeQuery (query);
                    while (rs.next()) {
                    officerfname = rs.getString ("OFFICER_FNAME");
                    officerlname = rs.getString ("OFFICER_LNAME");
                    deptcode = rs.getString ("DEPT_CODE");
                    officecode = rs.getString ("OFFICE_CODE");
                    offlevel = rs.getInt ("OFF_LEVEL");
                    desgcode = rs.getString ("DESG_CODE");
                    }
                    rs.close ();
                    stmt.close ();
                    if (officerfname!="" && officerlname!="") {
                    proposedby = officerfname + " " + officerlname;

                    }*/
                    String date = new String("");
                    /*String months[] = { "Jan", "Feb", "Mar", "Apr",
                    "May", "Jun", "Jul", "Aug",
                    "Sep", "Oct", "Nov", "Dec"};
                    String date = new String ("");
                    Calendar calendar = Calendar.getInstance();
                    date = calendar.get(Calendar.DATE) + "-";
                    date += months[calendar.get(Calendar.MONTH)] + "-";
                    date += calendar.get(Calendar.YEAR);*/
                    /*stmt = con.createStatement ();
                    query = "SELECT to_char (SYSDATE, 'DD-MON-YYYY') AS NOW FROM DUAL";
                    rs = stmt.executeQuery(query);
                    while (rs.next()) {
                    date = rs.getString ("NOW");
                    }
                    rs.close ();
                    stmt.close ();*/
                    /*proposaldate = date;
                    lasteditedby = proposedby;
                    lasteditedon = date;
                    stmt = con.createStatement();
                    query = "SELECT * FROM IDCMS_OFFICE_MST where OFFICE_ID=\'" + officecode + "\'";
                    rs = stmt.executeQuery(query);
                    while (rs.next()) {
                    office = rs.getString("OFFICE_DESC");
                    }
                    rs.close();
                    stmt.close();
                    con.close();*/

                    if (sContestId.equals("")) {
                    } else {
                        System.out.println("111");
                        List lstIpicms = null;
                        rows = null;
                        iterateOuter = null;
                        iterateInner = null;

                        lstIpicms = hRemote.getIpicmsMst(sContestId);

                        iterateOuter = lstIpicms.iterator();

                        while (iterateOuter.hasNext()) {
                            rows = (List) iterateOuter.next();

                            iterateInner = rows.iterator();

                            while (iterateInner.hasNext()) {
                                System.out.println("222");
                                sContestIdFul = ((String) iterateInner.next()).trim();
                                iterateInner.next();
                                iterateInner.next();
                                sPropBy = ((String) iterateInner.next()).trim();

                                lstOffNm = null;
                                rows_2 = null;
                                iterateOuter_2 = null;
                                iterateInner_2 = null;
                                lstOffNm = hRemote.getOffDtls(sPropBy);
                                iterateOuter_2 = lstOffNm.iterator();
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
                                        sPropByNm = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();

                                    }
                                }

                                sPropDt = ((String) iterateInner.next()).trim();

                                sLastEditBy = ((String) iterateInner.next()).trim();

                                lstOffNm = null;
                                rows_2 = null;
                                iterateOuter_2 = null;
                                iterateInner_2 = null;
                                lstOffNm = hRemote.getOffDtls(sLastEditBy);
                                iterateOuter_2 = lstOffNm.iterator();
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
                                        sLastEditByNm = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();

                                    }
                                }

                                sLastEditDt = ((String) iterateInner.next()).trim();

                                sStnCd = ((String) iterateInner.next()).trim();
                                System.out.println("333");

                                List lstStnNm = null;
                                rows_2 = null;
                                iterateOuter_2 = null;
                                iterateInner_2 = null;
                                lstStnNm = hRemote.getStnNm(sStnCd);
                                iterateOuter_2 = lstStnNm.iterator();
                                while (iterateOuter_2.hasNext()) {
                                    rows_2 = (List) iterateOuter_2.next();

                                    iterateInner_2 = rows_2.iterator();
                                    while (iterateInner_2.hasNext()) {
                                        sStnShrtNm = (String) iterateInner_2.next();
                                        sStnLongNm = (String) iterateInner_2.next();

                                    }
                                }
                                System.out.println("444");

                                sDeptCd = ((String) iterateInner.next()).trim();

                                sKaizenForDeptCd = ((String) iterateInner.next()).trim();

                                List lstDeptNm = null;
                                rows_2 = null;
                                iterateOuter_2 = null;
                                iterateInner_2 = null;
                                lstDeptNm = hRemote.getDeptNm(sStnCd, sDeptCd);
                                iterateOuter_2 = lstDeptNm.iterator();
                                while (iterateOuter_2.hasNext()) {
                                    rows_2 = (List) iterateOuter_2.next();

                                    iterateInner_2 = rows_2.iterator();
                                    while (iterateInner_2.hasNext()) {
                                        sDeptShrtNm = (String) iterateInner_2.next();
                                        sDeptLongNm = (String) iterateInner_2.next();

                                    }
                                }
                                System.out.println("555");

                                sTitle = ((String) iterateInner.next()).trim();

                                sIntSts = ((String) iterateInner.next()).trim();

                                sAct = ((String) iterateInner.next()).trim();

                                sRslt = ((String) iterateInner.next()).trim();

                                sCostSave = ((String) iterateInner.next()).trim();

                                sStDt = ((String) iterateInner.next()).trim();

                                sEndDt = ((String) iterateInner.next()).trim();
                                System.out.println("666");
                                sCatgTyp = ((String) iterateInner.next()).trim();
                                System.out.println("777");
                                sContestMnthYr = ((String) iterateInner.next()).trim();

                                sStg = ((String) iterateInner.next()).trim();

                                sOffLvl = ((String) iterateInner.next()).trim();

                                sSigId = ((String) iterateInner.next()).trim();

                                sCancelMkr = ((String) iterateInner.next()).trim();

                                sCancelBy = ((String) iterateInner.next()).trim();

                                sCancelDt = ((String) iterateInner.next()).trim();

                                sCancelRsn = ((String) iterateInner.next()).trim();

                                sLvl_1_cd = ((String) iterateInner.next()).trim();

                                lstOffNm = null;
                                rows_2 = null;
                                iterateOuter_2 = null;
                                iterateInner_2 = null;
                                lstOffNm = hRemote.getOffDtls(sLvl_1_cd);
                                iterateOuter_2 = lstOffNm.iterator();
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
                                        sLvl_1_nm = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();

                                    }
                                }

                                sLvl_1_dt = ((String) iterateInner.next()).trim();

                                sLvl_2_cd = ((String) iterateInner.next()).trim();

                                lstOffNm = null;
                                rows_2 = null;
                                iterateOuter_2 = null;
                                iterateInner_2 = null;
                                lstOffNm = hRemote.getOffDtls(sLvl_2_cd);
                                iterateOuter_2 = lstOffNm.iterator();
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
                                        sLvl_2_nm = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();

                                    }
                                }

                                sLvl_2_dt = ((String) iterateInner.next()).trim();

                                sLvl_3_cd = ((String) iterateInner.next()).trim();

                                lstOffNm = null;
                                rows_2 = null;
                                iterateOuter_2 = null;
                                iterateInner_2 = null;
                                lstOffNm = hRemote.getOffDtls(sLvl_3_cd);
                                iterateOuter_2 = lstOffNm.iterator();
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
                                        sLvl_3_nm = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();

                                    }
                                }

                                sLvl_3_dt = ((String) iterateInner.next()).trim();


                                sLvl_4_cd = ((String) iterateInner.next()).trim();

                                lstOffNm = null;
                                rows_2 = null;
                                iterateOuter_2 = null;
                                iterateInner_2 = null;
                                lstOffNm = hRemote.getOffDtls(sLvl_4_cd);
                                iterateOuter_2 = lstOffNm.iterator();
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
                                        sLvl_4_nm = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();

                                    }
                                }

                                sLvl_4_dt = ((String) iterateInner.next()).trim();




                                sSendBackMkr = ((String) iterateInner.next()).trim();

                                sSendBackBy = ((String) iterateInner.next()).trim();

                                lstOffNm = null;
                                rows_2 = null;
                                iterateOuter_2 = null;
                                iterateInner_2 = null;
                                lstOffNm = hRemote.getOffDtls(sSendBackBy);
                                iterateOuter_2 = lstOffNm.iterator();
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
                                        sSendBackByNm = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();
                                        iterateInner_2.next();

                                    }
                                }

                                sSendBackDt = ((String) iterateInner.next()).trim();

                                sSendBackRsn = ((String) iterateInner.next()).trim();
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
                                iterateInner.next();
                                iterateInner.next();
                                iterateInner.next();
                                iterateInner.next();
                                iterateInner.next();

                            }
                        }

                        List lstIpicmsDtl = null;
                        rows = null;
                        iterateOuter = null;
                        iterateInner = null;
                        int i = 0;

                        lstIpicmsDtl = hRemote.getIpicmsDtl(sContestId);

                        iterateOuter = lstIpicmsDtl.iterator();

                        while (iterateOuter.hasNext()) {
                            i++;
                            rows = (List) iterateOuter.next();

                            iterateInner = rows.iterator();

                            while (iterateInner.hasNext()) {
                                //System.out.println("222");

                                if (i == 1) {
                                    //System.out.println("888");
                                    sOev_1 = ((String) iterateInner.next()).trim();
                                    sSaluteCd_1 = (String) iterateInner.next();

                                    sCd_1 = ((String) iterateInner.next()).trim();

                                    if (sOev_1.equals("o")) {

                                        lstOffNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstOffNm = hRemote.getOffDtls(sCd_1);
                                        iterateOuter_2 = lstOffNm.iterator();
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
                                                sNm_1 = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();

                                            }
                                        }
                                    } else if (sOev_1.equals("e")) {
                                        lstEmpNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstEmpNm = hRemote.getEmpDtls(sCd_1);
                                        iterateOuter_2 = lstEmpNm.iterator();
                                        while (iterateOuter_2.hasNext()) {
                                            rows_2 = (List) iterateOuter_2.next();

                                            iterateInner_2 = rows_2.iterator();
                                            while (iterateInner_2.hasNext()) {
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                sNm_1 = (String) iterateInner_2.next();

                                            }
                                        }
                                    }
                                    sDeptCd_1 = (String) iterateInner.next();
                                    sDesgCd_1 = ((String) iterateInner.next()).trim();
                                    if (sOev_1.equals("v")) {
                                        if (sDesgCd_1.equals("")) {
                                            sVndrDesgCd_1 = " ";
                                        } else {
                                            sVndrDesgCd_1 = sDesgCd_1;
                                        }
                                    }
                                    sDesgDesc_1 = ((String) iterateInner.next()).trim();
                                    sVndrCd_1 = ((String) iterateInner.next()).trim();
                                    if (sOev_1.equals("v")) {

                                        lstVndrCoNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstVndrCoNm = hRemote.getVndrDtls(sVndrCd_1);
                                        iterateOuter_2 = lstVndrCoNm.iterator();
                                        while (iterateOuter_2.hasNext()) {
                                            rows_2 = (List) iterateOuter_2.next();

                                            iterateInner_2 = rows_2.iterator();
                                            while (iterateInner_2.hasNext()) {
                                                iterateInner_2.next();
                                                sVndrCoNm_1 = (String) iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                            }
                                        }
                                    }
                                    sVndrNm_1 = ((String) iterateInner.next()).trim();
                                    iterateInner.next();
                                    //System.out.println("999");
                                } else if (i == 2) {
                                    sOev_2 = ((String) iterateInner.next()).trim();
                                    sSaluteCd_2 = (String) iterateInner.next();

                                    sCd_2 = ((String) iterateInner.next()).trim();

                                    if (sOev_2.equals("o")) {

                                        lstOffNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstOffNm = hRemote.getOffDtls(sCd_2);
                                        iterateOuter_2 = lstOffNm.iterator();
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
                                                sNm_2 = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();

                                            }
                                        }
                                    } else if (sOev_2.equals("e")) {
                                        lstEmpNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstEmpNm = hRemote.getEmpDtls(sCd_2);
                                        iterateOuter_2 = lstEmpNm.iterator();
                                        while (iterateOuter_2.hasNext()) {
                                            rows_2 = (List) iterateOuter_2.next();

                                            iterateInner_2 = rows_2.iterator();
                                            while (iterateInner_2.hasNext()) {
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                sNm_2 = (String) iterateInner_2.next();

                                            }
                                        }
                                    }
                                    sDeptCd_2 = (String) iterateInner.next();
                                    sDesgCd_2 = ((String) iterateInner.next()).trim();
                                    if (sOev_2.equals("v")) {
                                        if (sDesgCd_2.equals("")) {
                                            sVndrDesgCd_2 = " ";
                                        } else {
                                            sVndrDesgCd_2 = sDesgCd_2;
                                        }
                                    }
                                    sDesgDesc_2 = ((String) iterateInner.next()).trim();
                                    sVndrCd_2 = ((String) iterateInner.next()).trim();
                                    if (sOev_2.equals("v")) {

                                        lstVndrCoNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstVndrCoNm = hRemote.getVndrDtls(sVndrCd_2);
                                        iterateOuter_2 = lstVndrCoNm.iterator();
                                        while (iterateOuter_2.hasNext()) {
                                            rows_2 = (List) iterateOuter_2.next();

                                            iterateInner_2 = rows_2.iterator();
                                            while (iterateInner_2.hasNext()) {
                                                iterateInner_2.next();
                                                sVndrCoNm_2 = (String) iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                            }
                                        }
                                    }
                                    sVndrNm_2 = ((String) iterateInner.next()).trim();
                                    iterateInner.next();
                                } else if (i == 3) {
                                    sOev_3 = ((String) iterateInner.next()).trim();
                                    sSaluteCd_3 = (String) iterateInner.next();

                                    sCd_3 = ((String) iterateInner.next()).trim();

                                    if (sOev_3.equals("o")) {

                                        lstOffNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstOffNm = hRemote.getOffDtls(sCd_3);
                                        iterateOuter_2 = lstOffNm.iterator();
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
                                                sNm_3 = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();

                                            }
                                        }
                                    } else if (sOev_3.equals("e")) {
                                        lstEmpNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstEmpNm = hRemote.getEmpDtls(sCd_3);
                                        iterateOuter_2 = lstEmpNm.iterator();
                                        while (iterateOuter_2.hasNext()) {
                                            rows_2 = (List) iterateOuter_2.next();

                                            iterateInner_2 = rows_2.iterator();
                                            while (iterateInner_2.hasNext()) {
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                sNm_3 = (String) iterateInner_2.next();

                                            }
                                        }
                                    }
                                    sDeptCd_3 = (String) iterateInner.next();
                                    sDesgCd_3 = ((String) iterateInner.next()).trim();

                                    if (sOev_3.equals("v")) {
                                        if (sDesgCd_3.equals("")) {
                                            sVndrDesgCd_3 = " ";
                                        } else {
                                            sVndrDesgCd_3 = sDesgCd_3;
                                        }
                                    }
                                    sDesgDesc_3 = ((String) iterateInner.next()).trim();
                                    sVndrCd_3 = ((String) iterateInner.next()).trim();
                                    if (sOev_3.equals("v")) {

                                        lstVndrCoNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstVndrCoNm = hRemote.getVndrDtls(sVndrCd_3);
                                        iterateOuter_2 = lstVndrCoNm.iterator();
                                        while (iterateOuter_2.hasNext()) {
                                            rows_2 = (List) iterateOuter_2.next();

                                            iterateInner_2 = rows_2.iterator();
                                            while (iterateInner_2.hasNext()) {
                                                iterateInner_2.next();
                                                sVndrCoNm_3 = (String) iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                            }
                                        }
                                    }
                                    sVndrNm_3 = ((String) iterateInner.next()).trim();
                                    iterateInner.next();
                                } else if (i == 4) {
                                    sOev_4 = ((String) iterateInner.next()).trim();
                                    sSaluteCd_4 = (String) iterateInner.next();

                                    sCd_4 = ((String) iterateInner.next()).trim();

                                    if (sOev_4.equals("o")) {

                                        lstOffNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstOffNm = hRemote.getOffDtls(sCd_4);
                                        iterateOuter_2 = lstOffNm.iterator();
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
                                                sNm_4 = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();

                                            }
                                        }
                                    } else if (sOev_4.equals("e")) {
                                        lstEmpNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstEmpNm = hRemote.getEmpDtls(sCd_4);
                                        iterateOuter_2 = lstEmpNm.iterator();
                                        while (iterateOuter_2.hasNext()) {
                                            rows_2 = (List) iterateOuter_2.next();

                                            iterateInner_2 = rows_2.iterator();
                                            while (iterateInner_2.hasNext()) {
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                sNm_4 = (String) iterateInner_2.next();

                                            }
                                        }
                                    }
                                    sDeptCd_4 = (String) iterateInner.next();
                                    sDesgCd_4 = ((String) iterateInner.next()).trim();
                                    if (sOev_4.equals("v")) {
                                        if (sDesgCd_4.equals("")) {
                                            sVndrDesgCd_4 = " ";
                                        } else {
                                            sVndrDesgCd_4 = sDesgCd_4;
                                        }
                                    }
                                    sDesgDesc_4 = ((String) iterateInner.next()).trim();
                                    sVndrCd_4 = ((String) iterateInner.next()).trim();
                                    if (sOev_4.equals("v")) {

                                        lstVndrCoNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstVndrCoNm = hRemote.getVndrDtls(sVndrCd_4);
                                        iterateOuter_2 = lstVndrCoNm.iterator();
                                        while (iterateOuter_2.hasNext()) {
                                            rows_2 = (List) iterateOuter_2.next();

                                            iterateInner_2 = rows_2.iterator();
                                            while (iterateInner_2.hasNext()) {
                                                iterateInner_2.next();
                                                sVndrCoNm_4 = (String) iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                            }
                                        }
                                    }
                                    sVndrNm_4 = ((String) iterateInner.next()).trim();
                                    iterateInner.next();
                                } else if (i == 5) {
                                    sOev_5 = ((String) iterateInner.next()).trim();
                                    sSaluteCd_5 = (String) iterateInner.next();

                                    sCd_5 = ((String) iterateInner.next()).trim();

                                    if (sOev_5.equals("o")) {

                                        lstOffNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstOffNm = hRemote.getOffDtls(sCd_5);
                                        iterateOuter_2 = lstOffNm.iterator();
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
                                                sNm_5 = (String) iterateInner_2.next() + (String) iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();

                                            }
                                        }
                                    } else if (sOev_5.equals("e")) {
                                        lstEmpNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstEmpNm = hRemote.getEmpDtls(sCd_5);
                                        iterateOuter_2 = lstEmpNm.iterator();
                                        while (iterateOuter_2.hasNext()) {
                                            rows_2 = (List) iterateOuter_2.next();

                                            iterateInner_2 = rows_2.iterator();
                                            while (iterateInner_2.hasNext()) {
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                sNm_5 = (String) iterateInner_2.next();

                                            }
                                        }
                                    }
                                    sDeptCd_5 = (String) iterateInner.next();
                                    sDesgCd_5 = ((String) iterateInner.next()).trim();
                                    if (sOev_5.equals("v")) {
                                        if (sDesgCd_5.equals("")) {
                                            sVndrDesgCd_5 = " ";
                                        } else {
                                            sVndrDesgCd_5 = sDesgCd_5;
                                        }
                                    }
                                    sDesgDesc_5 = ((String) iterateInner.next()).trim();
                                    sVndrCd_5 = ((String) iterateInner.next()).trim();
                                    if (sOev_5.equals("v")) {

                                        lstVndrCoNm = null;
                                        rows_2 = null;
                                        iterateOuter_2 = null;
                                        iterateInner_2 = null;
                                        lstVndrCoNm = hRemote.getVndrDtls(sVndrCd_5);
                                        iterateOuter_2 = lstVndrCoNm.iterator();
                                        while (iterateOuter_2.hasNext()) {
                                            rows_2 = (List) iterateOuter_2.next();

                                            iterateInner_2 = rows_2.iterator();
                                            while (iterateInner_2.hasNext()) {
                                                iterateInner_2.next();
                                                sVndrCoNm_5 = (String) iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                                iterateInner_2.next();
                                            }
                                        }
                                    }
                                    sVndrNm_5 = ((String) iterateInner.next()).trim();
                                    iterateInner.next();
                                }
                            }
                        }

                        //System.out.println("oev2 : " + sOev_2);

                    }
                    //System.out.println("oev2 : " + sOev_2);

                    String sEntryPermit = new String("true");
                    String sEditPermit = new String("true");
                    String sCancelPermit = new String("true");


                    Map mapDiffPermit = new HashMap();
                    mapDiffPermit.put("sLoginEmpCd", sLoginEmpCd);
                    mapDiffPermit.put("sLoginStnCd", sLoginStnCd);
                    mapDiffPermit.put("sLoginDeptCd", sLoginDeptCd);
                    mapDiffPermit.put("sLoginEmpKaizenMkr", sLoginEmpKaizenMkr);
                    mapDiffPermit.put("sStnCd", sStnCd);
                    mapDiffPermit.put("sDeptCd", sDeptCd);
                    mapDiffPermit.put("sKaizenForDeptCd", sKaizenForDeptCd);
                    mapDiffPermit.put("sContestId", sContestId);
                    mapDiffPermit.put("sStg", sStg);
                    mapDiffPermit.put("sCancelMkr", sCancelMkr);


                    List lstDiffPermit = hRemote.getDiffPermit(mapDiffPermit);
                    iterateOuter = lstDiffPermit.iterator();

                    while (iterateOuter.hasNext()) {
                        rows = (List) iterateOuter.next();

                        iterateInner = rows.iterator();
                        while (iterateInner.hasNext()) {
                            sEntryPermit = (String) iterateInner.next();
                            sEditPermit = (String) iterateInner.next();
                            sCancelPermit = (String) iterateInner.next();
                        }
                    }



                    if (sSendBackMkr.equals("") || sSendBackMkr.equals("N")) {
                        sSendBackBy = sLoginEmpCd;
                        sSendBackByNm = sLoginEmpNm;
                        sSendBackDt = sSysDt;
                    }






                    //System.out.println("sLoginEmpKaizenMkr : " + sLoginEmpKaizenMkr);

                    String off_id;
                    String offlevel = new String();
                    String proposedby, proposaldate, lasteditedby, lasteditedon, office;
                    String desgcode = new String("");
                    String officerfname = new String("");
                    proposedby = new String("");
                    office = new String("");
                    String officerlname = new String("");
                    String deptcode = new String("");
                    String officecode = new String("");
                    off_id = request.getParameter("currentuser");

                    //MakeConnectionGENORBL mk = null;
                    //PreparedStatement ps = null;
                    //ResultSet rs = null;

                    List lstDept = null;
                    rows = null;
                    iterateOuter = null;
                    iterateInner = null;

                    try {
                        //mk = new MakeConnectionGENORBL();
                        /*DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
                        Connection con = DriverManager.getConnection("jdbc:oracle:oci8:@devdb", "trainee", "trainee");
                        Statement stmt = con.createStatement();
                        String query = new String("SELECT * FROM IDCMS_OFF_MST WHERE OFFICER_CODE=\'" + off_id + "\'");
                        ResultSet rs = stmt.executeQuery(query);
                        while (rs.next()) {
                        officerfname = rs.getString("OFFICER_FNAME");
                        officerlname = rs.getString("OFFICER_LNAME");
                        deptcode = rs.getString("DEPT_CODE");
                        officecode = rs.getString("OFFICE_CODE");
                        offlevel = rs.getInt("OFF_LEVEL");
                        desgcode = rs.getString("DESG_CODE");
                        }
                        rs.close();
                        stmt.close();*/

                        deptcode = sLoginDeptCd;
                        officecode = sLoginStnCd;
                        offlevel = sLoginEmpKaizenMkr;

                        //System.out.println("1111 : " + offlevel);

                        if (officerfname != "" && officerlname != "") {
                            proposedby = officerfname + " " + officerlname;
                            proposedby = sLoginEmpNm;
                        }
                        date = new String("");
                        /*String months[] = { "Jan", "Feb", "Mar", "Apr",
                        "May", "Jun", "Jul", "Aug",
                        "Sep", "Oct", "Nov", "Dec"};
                        String date = new String ("");
                        Calendar calendar = Calendar.getInstance();
                        date = calendar.get(Calendar.DATE) + "-";
                        date += months[calendar.get(Calendar.MONTH)] + "-";
                        date += calendar.get(Calendar.YEAR);*/
                        /*stmt = con.createStatement();
                        query = "SELECT to_char (SYSDATE, 'DD-MON-YYYY') AS NOW FROM DUAL";
                        rs = stmt.executeQuery(query);*/


                        /*stmt = con.createStatement();
                        query = "SELECT * FROM IDCMS_OFFICE_MST where OFFICE_ID=\'" + officecode + "\'";
                        rs = stmt.executeQuery(query);
                        while (rs.next()) {
                        office = rs.getString("OFFICE_DESC");
                        }
                        rs.close();
                        stmt.close();
                        con.close();*/

                        if (sLoginEmpKaizenMkr.equals("3") && sStg.equals("2")) {
                            sLoginEmpKaizenMkr = "2";
                        }

        %>


        <!--table>
            <tr>
                <td style="border:none;">
                    <form method="post" action="inbox.jsp" name="inbox_form">
                        <input type="hidden" value="<%=request.getParameter("currentuser")%>" name="currentuser" />
                        <input type="submit" value="inbox" />
                    </form>
                </td>
                <td style="width: 90%; border: none;"></td>
                <td style="border:none;">
                    <input type="button" value="back" onclick="back();" />
                </td>
            </tr>
        </table!-->
        <div align="center">
            <table width="40%">
                <tr>
                    <td style="background-color : mediumblue">
                        <b><font face="Times New Roman" size="5" color="#ffffff">KAIZEN&nbsp;&nbsp;&nbsp;CONTEST&nbsp;&nbsp;&nbsp;FORM&nbsp;&nbsp;&nbsp;ENTRY&nbsp;&nbsp;&nbsp;SCREEN</font></b>
                    </td>
                </tr>
            </table>

            <fieldset>
                <!--center><legend><b><font face="Times New Roman" size="5" color="#ffffff">KAIGEN&nbsp;&nbsp;&nbsp;CONTEST&nbsp;&nbsp;&nbsp;FORM&nbsp;&nbsp;&nbsp;ENTRY&nbsp;&nbsp;&nbsp;SCREEN</font></b></b></legend></center-->
                <form method="post" action="IpicmsProcessServlet" name="f1" onsubmit="return validate()" >
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

                    <input type="hidden" name="sStg" value="<%= sStg%>" />
                    <input type="hidden" name="sMode" value="<%= sMode%>" />


                    <input type="hidden" name="sEntryPermit" value="<%= sEntryPermit%>" />
                    <input type="hidden" name="sEditPermit" value="<%= sEditPermit%>" />
                    <input type="hidden" name="sCancelPermit" value="<%= sCancelPermit%>" />

                    <input type="hidden" name="sVndrCd_1" id="sVndrCd_1" value="" />
                    <input type="hidden" name="sVndrCd_2" id="sVndrCd_2" value="" />
                    <input type="hidden" name="sVndrCd_3" id="sVndrCd_3" value="" />
                    <input type="hidden" name="sVndrCd_4" id="sVndrCd_4" value="" />
                    <input type="hidden" name="sVndrCd_5" id="sVndrCd_5" value="" />

                    <input type="hidden" name="sDesgCd_1" id="sDesgCd_1" value="" />
                    <input type="hidden" name="sDesgCd_2" id="sDesgCd_2" value="" />
                    <input type="hidden" name="sDesgCd_3" id="sDesgCd_3" value="" />
                    <input type="hidden" name="sDesgCd_4" id="sDesgCd_4" value="" />
                    <input type="hidden" name="sDesgCd_5" id="sDesgCd_5" value="" />

                    <input type="hidden" name="sContestId" value="<%= sContestId%>" />
                    <input type="hidden" name="sPropBy" value="<%= sPropBy%>" />
                    <input type="hidden" name="sPropDt" value="<%= sPropDt%>" />
                    <input type="hidden" name="sStnCd" value="<%= sStnCd%>" />
                    <input type="hidden" name="sDeptCd" value="<%= sDeptCd%>" />

                    <input type="hidden" name="oevTmp1" value="" />
                    <input type="hidden" name="sSaluteCdTmp_1" value="" />
                    <input type="hidden" name="sNmTmp_1" value="" />
                    <input type="hidden" name="sCdTmp_1" value="" />
                    <input type="hidden" name="sDesgCdTmp_1" value="" />
                    <input type="hidden" name="sDesgDescTmp_1" value="" />
                    <input type="hidden" name="sDeptCdTmp_1" value="" />
                    <input type="hidden" name="sVndrCdTmp_1" value="" />
                    <input type="hidden" name="sVndrNmTmp_1" value="" />
                    <input type="hidden" name="sVndrCoNmTmp_1" value="" />
                    <input type="hidden" name="sVndrDesgCdTmp_1" value="" />

                    <input type="hidden" name="oevTmp2" value="" />
                    <input type="hidden" name="sSaluteCdTmp_2" value="" />
                    <input type="hidden" name="sNmTmp_2" value="" />
                    <input type="hidden" name="sCdTmp_2" value="" />
                    <input type="hidden" name="sDesgCdTmp_2" value="" />
                    <input type="hidden" name="sDesgDescTmp_2" value="" />
                    <input type="hidden" name="sDeptCdTmp_2" value="" />
                    <input type="hidden" name="sVndrCdTmp_2" value="" />
                    <input type="hidden" name="sVndrNmTmp_2" value="" />
                    <input type="hidden" name="sVndrCoNmTmp_2" value="" />
                    <input type="hidden" name="sVndrDesgCdTmp_2" value="" />

                    <input type="hidden" name="oevTmp3" value="" />
                    <input type="hidden" name="sSaluteCdTmp_3" value="" />
                    <input type="hidden" name="sNmTmp_3" value="" />
                    <input type="hidden" name="sCdTmp_3" value="" />
                    <input type="hidden" name="sDesgCdTmp_3" value="" />
                    <input type="hidden" name="sDesgDescTmp_3" value="" />
                    <input type="hidden" name="sDeptCdTmp_3" value="" />
                    <input type="hidden" name="sVndrCdTmp_3" value="" />
                    <input type="hidden" name="sVndrNmTmp_3" value="" />
                    <input type="hidden" name="sVndrCoNmTmp_3" value="" />
                    <input type="hidden" name="sVndrDesgCdTmp_3" value="" />

                    <input type="hidden" name="oevTmp4" value="" />
                    <input type="hidden" name="sSaluteCdTmp_4" value="" />
                    <input type="hidden" name="sNmTmp_4" value="" />
                    <input type="hidden" name="sCdTmp_4" value="" />
                    <input type="hidden" name="sDesgCdTmp_4" value="" />
                    <input type="hidden" name="sDesgDescTmp_4" value="" />
                    <input type="hidden" name="sDeptCdTmp_4" value="" />
                    <input type="hidden" name="sVndrCdTmp_4" value="" />
                    <input type="hidden" name="sVndrNmTmp_4" value="" />
                    <input type="hidden" name="sVndrCoNmTmp_4" value="" />
                    <input type="hidden" name="sVndrDesgCdTmp_4" value="" />

                    <input type="hidden" name="oevTmp5" value="" />
                    <input type="hidden" name="sSaluteCdTmp_5" value="" />
                    <input type="hidden" name="sNmTmp_5" value="" />
                    <input type="hidden" name="sCdTmp_5" value="" />
                    <input type="hidden" name="sDesgCdTmp_5" value="" />
                    <input type="hidden" name="sDesgDescTmp_5" value="" />
                    <input type="hidden" name="sDeptCdTmp_5" value="" />
                    <input type="hidden" name="sVndrCdTmp_5" value="" />
                    <input type="hidden" name="sVndrNmTmp_5" value="" />
                    <input type="hidden" name="sVndrCoNmTmp_5" value="" />
                    <input type="hidden" name="sVndrDesgCdTmp_5" value="" />

                    <input type="hidden" name="sNoFl_1" id="iNoFl_1" value="0" />
                    <input type="hidden" name="sNoFl_2" id="iNoFl_2" value="0" />
                    <input type="hidden" name="sIpAddr" value="<%= sIpAddr%>" />

                    <input type="hidden" name="sCatgTypTmp" value="<%= sCatgTyp%>" />
                    <input type="hidden" name="sSysDt" value="<%= sSysDt%>" />




                    <table class="tab1" width="100%">
                        <tr>
                            <td class="tab1c1" style="background-color: aqua; color: black;">Reference No:&nbsp;</td>
                            <td colspan="3"><%= sContestIdFul%></td>
                        </tr>
                        <tr>
                            <td class="tab1c1" style="background-color: aqua; color: black;">Proposed By:&nbsp;</td>
                            <td class="tab1c2"><%=sPropByNm%></td>
                            <td class="tab1c3" style="background-color: aqua; color: black;">Date:&nbsp;</td>
                            <td class="tab1c3"><%=sPropDt%></td>
                        </tr>
                        <tr>
                            <td class="tab1c1" style="background-color: aqua; color: black;">Last Edited By:&nbsp;</td>
                            <td class="tab1c2"><%=sLastEditByNm%></td>
                            <td class="tab1c3" style="background-color: aqua; color: black;">Last Edited On:&nbsp;</td>
                            <td class="tab1c3"><%=sLastEditDt%></td>
                        </tr>
                        <tr>
                            <td class="tab1c1" style="background-color: aqua; color: black;">Station</td>
                            <td class="tab1c2"><%=sStnLongNm%></td>
                            <td class="tab1c3" style="background-color: aqua; color: black;">Kaizen&nbsp;For&nbsp;Department:&nbsp;<span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                            <td class="tab1c3">

                                <select name = "sKaizenForDeptCd" id = "sKaizenForDeptCd">

                                    <option value="">SELECT</option>
                                    <%

                                                            lstDept = null;
                                                            rows = null;
                                                            iterateOuter = null;
                                                            iterateInner = null;
                                                            String sDeptCdTmp = null;
                                                            String sDeptDesc = null;


                                                            //System.out.println(sOrdForStnCd);
                                                            //System.out.println(sOrdForDeptCd);
                                                            lstDept = hRemote.getDept(sStnCd);
                                                            iterateOuter = lstDept.iterator();

                                                            while (iterateOuter.hasNext()) {
                                                                rows = (List) iterateOuter.next();

                                                                iterateInner = rows.iterator();
                                                                while (iterateInner.hasNext()) {
                                                                    sDeptCdTmp = (String) iterateInner.next();
                                                                    sDeptDesc = (String) iterateInner.next();


                                    %>
                                    <option value="<%= sDeptCdTmp%>"><%= sDeptDesc%></option>

                                    <%
                                                                }
                                                            }
                                    %>


                                </select>

                            </td>
                        </tr>
                    </table>
                    <table class="tab2" width="80%">
                        <tr class="thdr">
                            <td class="tab2c1"><b>Serial No</b></td>
                            <td class="tab2c2"><b>Name(s)</b></td>
                            <td class="tab2c1"><b>Code</b></td>
                            <td class="tab2c2"><b>Designation</b></td>
                            <td class="tab2c2"><b>Dept/Company</b></td>
                        </tr>
                        <tr>
                            <td>1
                                <select name="oev1" style="width:90px;" id="s1" onchange="oevfx (1);">
                                    <option value=" ">&nbsp;</option>
                                    <%

                                                            lstContestantTyp = null;
                                                            rows = null;
                                                            iterateOuter = null;
                                                            iterateInner = null;
                                                            String sContestantTypTmp = null;
                                                            String sContestantTypDesc = null;


                                                            //System.out.println(sOrdForStnCd);
                                                            //System.out.println(sOrdForDeptCd);
                                                            lstContestantTyp = hRemote.getContestantTyp();
                                                            iterateOuter = lstContestantTyp.iterator();

                                                            while (iterateOuter.hasNext()) {
                                                                rows = (List) iterateOuter.next();

                                                                iterateInner = rows.iterator();
                                                                while (iterateInner.hasNext()) {
                                                                    sContestantTypTmp = (String) iterateInner.next();
                                                                    sContestantTypDesc = (String) iterateInner.next();
                                                                }

                                    %>
                                    <option value="<%= sContestantTypTmp%>"><%= sContestantTypDesc%></option>

                                    <%
                                                            }
                                    %>

                                </select>
                            </td>
                            <td id="nms1">
                                <table border="" style="border-collapse : collapse">
                                    <tr>
                                        <td style="border : none">
                                            <div id="divNm_11" style="width: 50px; background: #FFFFCC ; display : none">

                                                <select name = "sSaluteCd_1" id = "sSaluteCd_1" style="width : 60px">

                                                    <option value=" ">SELECT</option>
                                                    <%

                                                                            lstSalute = null;
                                                                            rows = null;
                                                                            iterateOuter = null;
                                                                            iterateInner = null;
                                                                            String sSaluteCdTmp = null;
                                                                            String sSaluteDesc = null;


                                                                            //System.out.println(sOrdForStnCd);
                                                                            //System.out.println(sOrdForDeptCd);
                                                                            lstSalute = hRemote.getSalute();
                                                                            iterateOuter = lstSalute.iterator();

                                                                            while (iterateOuter.hasNext()) {
                                                                                rows = (List) iterateOuter.next();

                                                                                iterateInner = rows.iterator();
                                                                                while (iterateInner.hasNext()) {
                                                                                    sSaluteCdTmp = (String) iterateInner.next();
                                                                                    sSaluteDesc = (String) iterateInner.next();
                                                                                }

                                                    %>
                                                    <option value="<%= sSaluteCdTmp%>"><%= sSaluteDesc%></option>

                                                    <%
                                                                            }
                                                    %>


                                                </select>
                                            </div>
                                        </td>
                                        <td style="border : none">
                                            <div id="divNm_12" style="width: 150px; background: #FFFFCC ; display : none">
                                                &nbsp;
                                            </div>
                                            <div id="divNm_13" style="width: 150px; background: #FFFFCC ; display : none">
                                                <input type="text" name="sVndrNm_1" id="sVndrNm_1" size="25"/>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td id="cds1">
                                <div id="divCd_11" style="width: 100px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divCd_12" style="width: 100px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sCd_1" id="sCd_1" size="7" maxlength = '6' onkeyup="if(this.value.length == 6){showNames(1,this.value);}"/>
                                </div>
                            </td>
                            <td id="dss1">
                                <div id="divDesg_11" style="width: 150px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divDesg_12" style="width: 150px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sDesgDesc_1" id="sDesgDesc_1" size="25"/>
                                </div>
                                <div id="divDesg_13" style="width: 150px; background: #FFFFCC ; display : none">
                                    <select name = "sVndrDesgCd_1" id = "sVndrDesgCd_1" style="width : 120px" onchange="copyVndrDesgCd(this.id)">

                                        <option value=" ">SELECT</option>
                                        <%

                                                                lstVndrDesg = null;
                                                                rows = null;
                                                                iterateOuter = null;
                                                                iterateInner = null;
                                                                String sVndrDesgCdTmp = null;
                                                                String sVndrDesgDescTmp = null;


                                                                //System.out.println(sOrdForStnCd);
                                                                //System.out.println(sOrdForDeptCd);
                                                                lstVndrDesg = hRemote.getVndrDesg();
                                                                iterateOuter = lstVndrDesg.iterator();

                                                                while (iterateOuter.hasNext()) {
                                                                    rows = (List) iterateOuter.next();

                                                                    iterateInner = rows.iterator();
                                                                    while (iterateInner.hasNext()) {
                                                                        sVndrDesgCdTmp = (String) iterateInner.next();
                                                                        sVndrDesgDescTmp = (String) iterateInner.next();
                                                                    }

                                        %>
                                        <option value="<%= sVndrDesgCdTmp%>"><%= sVndrDesgDescTmp%></option>

                                        <%
                                                                }
                                        %>


                                    </select>
                                </div>
                            </td>
                            <td id="dcs1">
                                <div id="divDept_11" style="width: 100px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divDept_12" style="width: 170px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sVndrCoNm_1" id="sVndrCoNm_1" size="25" onclick="getVndrDtls(this.name)"/>
                                </div>
                                <div id="divDept_13" style="width: 100px; background: #FFFFCC ; display : none">
                                    <select name = "sDeptCd_1" id = "sDeptCd_1">

                                        <option value=" ">SELECT</option>
                                        <%

                                                                lstDept = null;
                                                                rows = null;
                                                                iterateOuter = null;
                                                                iterateInner = null;
                                                                sDeptCdTmp = null;
                                                                sDeptDesc = null;


                                                                //System.out.println(sOrdForStnCd);
                                                                //System.out.println(sOrdForDeptCd);
                                                                lstDept = hRemote.getDept(sStnCd);
                                                                iterateOuter = lstDept.iterator();

                                                                while (iterateOuter.hasNext()) {
                                                                    rows = (List) iterateOuter.next();

                                                                    iterateInner = rows.iterator();
                                                                    while (iterateInner.hasNext()) {
                                                                        sDeptCdTmp = (String) iterateInner.next();
                                                                        sDeptDesc = (String) iterateInner.next();


                                        %>
                                        <option value="<%= sDeptCdTmp%>"><%= sDeptDesc%></option>

                                        <%
                                                                    }
                                                                }
                                        %>


                                    </select>

                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>2
                                <select name="oev2" style="width:90px;" id="s2" onchange="oevfx (2);">
                                    <option value=" ">&nbsp;</option>
                                    <%

                                                            lstContestantTyp = null;
                                                            rows = null;
                                                            iterateOuter = null;
                                                            iterateInner = null;
                                                            sContestantTypTmp = null;
                                                            sContestantTypDesc = null;


                                                            //System.out.println(sOrdForStnCd);
                                                            //System.out.println(sOrdForDeptCd);
                                                            lstContestantTyp = hRemote.getContestantTyp();
                                                            iterateOuter = lstContestantTyp.iterator();

                                                            while (iterateOuter.hasNext()) {
                                                                rows = (List) iterateOuter.next();

                                                                iterateInner = rows.iterator();
                                                                while (iterateInner.hasNext()) {
                                                                    sContestantTypTmp = (String) iterateInner.next();
                                                                    sContestantTypDesc = (String) iterateInner.next();
                                                                }

                                    %>
                                    <option value="<%= sContestantTypTmp%>"><%= sContestantTypDesc%></option>

                                    <%
                                                            }
                                    %>
                                </select>
                            </td>
                            <td id="nms2">
                                <table border="" style="border-collapse : collapse">
                                    <tr>
                                        <td style="border : none">
                                            <div id="divNm_21" style="width: 50px; background: #FFFFCC ; display : none">

                                                <select name = "sSaluteCd_2" id = "sSaluteCd_2" style="width : 60px">

                                                    <option value=" ">SELECT</option>
                                                    <%

                                                                            lstSalute = null;
                                                                            rows = null;
                                                                            iterateOuter = null;
                                                                            iterateInner = null;
                                                                            sSaluteCdTmp = null;
                                                                            sSaluteDesc = null;


                                                                            //System.out.println(sOrdForStnCd);
                                                                            //System.out.println(sOrdForDeptCd);
                                                                            lstSalute = hRemote.getSalute();
                                                                            iterateOuter = lstSalute.iterator();

                                                                            while (iterateOuter.hasNext()) {
                                                                                rows = (List) iterateOuter.next();

                                                                                iterateInner = rows.iterator();
                                                                                while (iterateInner.hasNext()) {
                                                                                    sSaluteCdTmp = (String) iterateInner.next();
                                                                                    sSaluteDesc = (String) iterateInner.next();
                                                                                }

                                                    %>
                                                    <option value="<%= sSaluteCdTmp%>"><%= sSaluteDesc%></option>

                                                    <%
                                                                            }
                                                    %>


                                                </select>
                                            </div>
                                        </td>
                                        <td style="border : none">
                                            <div id="divNm_22" style="width: 150px; background: #FFFFCC ; display : none">
                                                &nbsp;
                                            </div>
                                            <div id="divNm_23" style="width: 150px; background: #FFFFCC ; display : none">
                                                <input type="text" name="sVndrNm_2" id="sVndrNm_2" size="25"/>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td id="cds2">
                                <div id="divCd_21" style="width: 100px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divCd_22" style="width: 100px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sCd_2" id="sCd_2" size="7" maxlength = '6' onkeyup="if(this.value.length == 6){showNames(2,this.value);}"/>
                                </div>
                            </td>
                            <td id="dss2">
                                <div id="divDesg_21" style="width: 150px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divDesg_22" style="width: 150px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sDesgDesc_2" id="sDesgDesc_2" size="25"/>
                                </div>
                                <div id="divDesg_23" style="width: 150px; background: #FFFFCC ; display : none">
                                    <select name = "sVndrDesgCd_2" id = "sVndrDesgCd_2" style="width : 120px" onchange="copyVndrDesgCd(this.id)">

                                        <option value=" ">SELECT</option>
                                        <%

                                                                lstVndrDesg = null;
                                                                rows = null;
                                                                iterateOuter = null;
                                                                iterateInner = null;
                                                                sVndrDesgCdTmp = null;
                                                                sVndrDesgDescTmp = null;


                                                                //System.out.println(sOrdForStnCd);
                                                                //System.out.println(sOrdForDeptCd);
                                                                lstVndrDesg = hRemote.getVndrDesg();
                                                                iterateOuter = lstVndrDesg.iterator();

                                                                while (iterateOuter.hasNext()) {
                                                                    rows = (List) iterateOuter.next();

                                                                    iterateInner = rows.iterator();
                                                                    while (iterateInner.hasNext()) {
                                                                        sVndrDesgCdTmp = (String) iterateInner.next();
                                                                        sVndrDesgDescTmp = (String) iterateInner.next();
                                                                    }

                                        %>
                                        <option value="<%= sVndrDesgCdTmp%>"><%= sVndrDesgDescTmp%></option>

                                        <%
                                                                }
                                        %>


                                    </select>
                                </div>
                            </td>
                            <td id="dcs2">
                                <div id="divDept_21" style="width: 100px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divDept_22" style="width: 170px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sVndrCoNm_2" id="sVndrCoNm_2" size="25" onclick="getVndrDtls(this.name)"/>
                                </div>
                                <div id="divDept_23" style="width: 100px; background: #FFFFCC ; display : none">
                                    <select name = "sDeptCd_2" id = "sDeptCd_2">

                                        <option value=" ">SELECT</option>
                                        <%

                                                                lstDept = null;
                                                                rows = null;
                                                                iterateOuter = null;
                                                                iterateInner = null;
                                                                sDeptCdTmp = null;
                                                                sDeptDesc = null;


                                                                //System.out.println(sOrdForStnCd);
                                                                //System.out.println(sOrdForDeptCd);
                                                                lstDept = hRemote.getDept(sStnCd);
                                                                iterateOuter = lstDept.iterator();

                                                                while (iterateOuter.hasNext()) {
                                                                    rows = (List) iterateOuter.next();

                                                                    iterateInner = rows.iterator();
                                                                    while (iterateInner.hasNext()) {
                                                                        sDeptCdTmp = (String) iterateInner.next();
                                                                        sDeptDesc = (String) iterateInner.next();


                                        %>
                                        <option value="<%= sDeptCdTmp%>"><%= sDeptDesc%></option>

                                        <%
                                                                    }
                                                                }
                                        %>


                                    </select>

                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td>3
                                <select name="oev3" style="width:90px;" id="s3" onchange="oevfx (3);">
                                    <option value=" ">&nbsp;</option>
                                    <%

                                                            lstContestantTyp = null;
                                                            rows = null;
                                                            iterateOuter = null;
                                                            iterateInner = null;
                                                            sContestantTypTmp = null;
                                                            sContestantTypDesc = null;


                                                            //System.out.println(sOrdForStnCd);
                                                            //System.out.println(sOrdForDeptCd);
                                                            lstContestantTyp = hRemote.getContestantTyp();
                                                            iterateOuter = lstContestantTyp.iterator();

                                                            while (iterateOuter.hasNext()) {
                                                                rows = (List) iterateOuter.next();

                                                                iterateInner = rows.iterator();
                                                                while (iterateInner.hasNext()) {
                                                                    sContestantTypTmp = (String) iterateInner.next();
                                                                    sContestantTypDesc = (String) iterateInner.next();
                                                                }

                                    %>
                                    <option value="<%= sContestantTypTmp%>"><%= sContestantTypDesc%></option>

                                    <%
                                                            }
                                    %>
                                </select>
                            </td>
                            <td id="nms3">
                                <table border="" style="border-collapse : collapse">
                                    <tr>
                                        <td style="border : none">
                                            <div id="divNm_31" style="width: 50px; background: #FFFFCC ; display : none">

                                                <select name = "sSaluteCd_3" id = "sSaluteCd_3" style="width : 60px">

                                                    <option value=" ">SELECT</option>
                                                    <%

                                                                            lstSalute = null;
                                                                            rows = null;
                                                                            iterateOuter = null;
                                                                            iterateInner = null;
                                                                            sSaluteCdTmp = null;
                                                                            sSaluteDesc = null;


                                                                            //System.out.println(sOrdForStnCd);
                                                                            //System.out.println(sOrdForDeptCd);
                                                                            lstSalute = hRemote.getSalute();
                                                                            iterateOuter = lstSalute.iterator();

                                                                            while (iterateOuter.hasNext()) {
                                                                                rows = (List) iterateOuter.next();

                                                                                iterateInner = rows.iterator();
                                                                                while (iterateInner.hasNext()) {
                                                                                    sSaluteCdTmp = (String) iterateInner.next();
                                                                                    sSaluteDesc = (String) iterateInner.next();
                                                                                }

                                                    %>
                                                    <option value="<%= sSaluteCdTmp%>"><%= sSaluteDesc%></option>

                                                    <%
                                                                            }
                                                    %>


                                                </select>
                                            </div>
                                        </td>
                                        <td style="border : none">
                                            <div id="divNm_32" style="width: 150px; background: #FFFFCC ; display : none">
                                                &nbsp;
                                            </div>
                                            <div id="divNm_33" style="width: 150px; background: #FFFFCC ; display : none">
                                                <input type="text" name="sVndrNm_3" id="sVndrNm_3" size="25"/>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td id="cds3">
                                <div id="divCd_31" style="width: 100px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divCd_32" style="width: 100px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sCd_3" id="sCd_3" size="7" maxlength = '6' onkeyup="if(this.value.length == 6){showNames(3,this.value);}"/>
                                </div>
                            </td>
                            <td id="dss3">
                                <div id="divDesg_31" style="width: 150px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divDesg_32" style="width: 150px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sDesgDesc_3" id="sDesgDesc_3" size="25"/>
                                </div>
                                <div id="divDesg_33" style="width: 150px; background: #FFFFCC ; display : none">
                                    <select name = "sVndrDesgCd_3" id = "sVndrDesgCd_3" style="width : 120px" onchange="copyVndrDesgCd(this.id)">

                                        <option value=" ">SELECT</option>
                                        <%

                                                                lstVndrDesg = null;
                                                                rows = null;
                                                                iterateOuter = null;
                                                                iterateInner = null;
                                                                sVndrDesgCdTmp = null;
                                                                sVndrDesgDescTmp = null;


                                                                //System.out.println(sOrdForStnCd);
                                                                //System.out.println(sOrdForDeptCd);
                                                                lstVndrDesg = hRemote.getVndrDesg();
                                                                iterateOuter = lstVndrDesg.iterator();

                                                                while (iterateOuter.hasNext()) {
                                                                    rows = (List) iterateOuter.next();

                                                                    iterateInner = rows.iterator();
                                                                    while (iterateInner.hasNext()) {
                                                                        sVndrDesgCdTmp = (String) iterateInner.next();
                                                                        sVndrDesgDescTmp = (String) iterateInner.next();
                                                                    }

                                        %>
                                        <option value="<%= sVndrDesgCdTmp%>"><%= sVndrDesgDescTmp%></option>

                                        <%
                                                                }
                                        %>


                                    </select>
                                </div>
                            </td>
                            <td id="dcs3">
                                <div id="divDept_31" style="width: 100px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divDept_32" style="width: 170px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sVndrCoNm_3" id="sVndrCoNm_3" size="25" onclick="getVndrDtls(this.name)"/>
                                </div>
                                <div id="divDept_33" style="width: 100px; background: #FFFFCC ; display : none">
                                    <select name = "sDeptCd_3" id = "sDeptCd_3">

                                        <option value=" ">SELECT</option>
                                        <%

                                                                lstDept = null;
                                                                rows = null;
                                                                iterateOuter = null;
                                                                iterateInner = null;
                                                                sDeptCdTmp = null;
                                                                sDeptDesc = null;


                                                                //System.out.println(sOrdForStnCd);
                                                                //System.out.println(sOrdForDeptCd);
                                                                lstDept = hRemote.getDept(sStnCd);
                                                                iterateOuter = lstDept.iterator();

                                                                while (iterateOuter.hasNext()) {
                                                                    rows = (List) iterateOuter.next();

                                                                    iterateInner = rows.iterator();
                                                                    while (iterateInner.hasNext()) {
                                                                        sDeptCdTmp = (String) iterateInner.next();
                                                                        sDeptDesc = (String) iterateInner.next();


                                        %>
                                        <option value="<%= sDeptCdTmp%>"><%= sDeptDesc%></option>

                                        <%
                                                                    }
                                                                }
                                        %>


                                    </select>

                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td>4
                                <select name="oev4" style="width:90px;" id="s4" onchange="oevfx (4);">
                                    <option value=" ">&nbsp;</option>
                                    <%

                                                            lstContestantTyp = null;
                                                            rows = null;
                                                            iterateOuter = null;
                                                            iterateInner = null;
                                                            sContestantTypTmp = null;
                                                            sContestantTypDesc = null;


                                                            //System.out.println(sOrdForStnCd);
                                                            //System.out.println(sOrdForDeptCd);
                                                            lstContestantTyp = hRemote.getContestantTyp();
                                                            iterateOuter = lstContestantTyp.iterator();

                                                            while (iterateOuter.hasNext()) {
                                                                rows = (List) iterateOuter.next();

                                                                iterateInner = rows.iterator();
                                                                while (iterateInner.hasNext()) {
                                                                    sContestantTypTmp = (String) iterateInner.next();
                                                                    sContestantTypDesc = (String) iterateInner.next();
                                                                }

                                    %>
                                    <option value="<%= sContestantTypTmp%>"><%= sContestantTypDesc%></option>

                                    <%
                                                            }
                                    %>
                                </select>
                            </td>
                            <td id="nms4">
                                <table border="" style="border-collapse : collapse">
                                    <tr>
                                        <td style="border : none">
                                            <div id="divNm_41" style="width: 50px; background: #FFFFCC ; display : none">

                                                <select name = "sSaluteCd_4" id = "sSaluteCd_4" style="width : 60px">

                                                    <option value=" ">SELECT</option>
                                                    <%

                                                                            lstSalute = null;
                                                                            rows = null;
                                                                            iterateOuter = null;
                                                                            iterateInner = null;
                                                                            sSaluteCdTmp = null;
                                                                            sSaluteDesc = null;


                                                                            //System.out.println(sOrdForStnCd);
                                                                            //System.out.println(sOrdForDeptCd);
                                                                            lstSalute = hRemote.getSalute();
                                                                            iterateOuter = lstSalute.iterator();

                                                                            while (iterateOuter.hasNext()) {
                                                                                rows = (List) iterateOuter.next();

                                                                                iterateInner = rows.iterator();
                                                                                while (iterateInner.hasNext()) {
                                                                                    sSaluteCdTmp = (String) iterateInner.next();
                                                                                    sSaluteDesc = (String) iterateInner.next();
                                                                                }

                                                    %>
                                                    <option value="<%= sSaluteCdTmp%>"><%= sSaluteDesc%></option>

                                                    <%
                                                                            }
                                                    %>


                                                </select>
                                            </div>
                                        </td>
                                        <td style="border : none">
                                            <div id="divNm_42" style="width: 150px; background: #FFFFCC ; display : none">
                                                &nbsp;
                                            </div>
                                            <div id="divNm_43" style="width: 150px; background: #FFFFCC ; display : none">
                                                <input type="text" name="sVndrNm_4" id="sVndrNm_4" size="25"/>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td id="cds4">
                                <div id="divCd_41" style="width: 100px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divCd_42" style="width: 100px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sCd_4" id="sCd_4" size="7" maxlength = '6' onkeyup="if(this.value.length == 6){showNames(4,this.value);}"/>
                                </div>
                            </td>
                            <td id="dss4">
                                <div id="divDesg_41" style="width: 150px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divDesg_42" style="width: 150px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sDesgDesc_4" id="sDesgDesc_4" size="25"/>
                                </div>
                                <div id="divDesg_43" style="width: 150px; background: #FFFFCC ; display : none">
                                    <select name = "sVndrDesgCd_4" id = "sVndrDesgCd_4" style="width : 120px" onchange="copyVndrDesgCd(this.id)">

                                        <option value=" ">SELECT</option>
                                        <%

                                                                lstVndrDesg = null;
                                                                rows = null;
                                                                iterateOuter = null;
                                                                iterateInner = null;
                                                                sVndrDesgCdTmp = null;
                                                                sVndrDesgDescTmp = null;


                                                                //System.out.println(sOrdForStnCd);
                                                                //System.out.println(sOrdForDeptCd);
                                                                lstVndrDesg = hRemote.getVndrDesg();
                                                                iterateOuter = lstVndrDesg.iterator();

                                                                while (iterateOuter.hasNext()) {
                                                                    rows = (List) iterateOuter.next();

                                                                    iterateInner = rows.iterator();
                                                                    while (iterateInner.hasNext()) {
                                                                        sVndrDesgCdTmp = (String) iterateInner.next();
                                                                        sVndrDesgDescTmp = (String) iterateInner.next();
                                                                    }

                                        %>
                                        <option value="<%= sVndrDesgCdTmp%>"><%= sVndrDesgDescTmp%></option>

                                        <%
                                                                }
                                        %>


                                    </select>
                                </div>
                            </td>
                            <td id="dcs4">
                                <div id="divDept_41" style="width: 100px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divDept_42" style="width: 170px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sVndrCoNm_4" id="sVndrCoNm_4" size="25" onclick="getVndrDtls(this.name)"/>
                                </div>

                                <div id="divDept_42" style="width: 100px; background: #FFFFCC ; display : none">
                                    <select name = "sDeptCd_4" id = "sDeptCd_4">

                                        <option value=" ">SELECT</option>
                                        <%

                                                                lstDept = null;
                                                                rows = null;
                                                                iterateOuter = null;
                                                                iterateInner = null;
                                                                sDeptCdTmp = null;
                                                                sDeptDesc = null;


                                                                //System.out.println(sOrdForStnCd);
                                                                //System.out.println(sOrdForDeptCd);
                                                                lstDept = hRemote.getDept(sStnCd);
                                                                iterateOuter = lstDept.iterator();

                                                                while (iterateOuter.hasNext()) {
                                                                    rows = (List) iterateOuter.next();

                                                                    iterateInner = rows.iterator();
                                                                    while (iterateInner.hasNext()) {
                                                                        sDeptCdTmp = (String) iterateInner.next();
                                                                        sDeptDesc = (String) iterateInner.next();


                                        %>
                                        <option value="<%= sDeptCdTmp%>"><%= sDeptDesc%></option>

                                        <%
                                                                    }
                                                                }
                                        %>


                                    </select>

                                </div>

                            </td>
                        </tr>
                        <tr>
                            <td>5
                                <select name="oev5" style="width:90px;" id="s5" onchange="oevfx (5);">
                                    <option value=" ">&nbsp;</option>
                                    <%

                                                            lstContestantTyp = null;
                                                            rows = null;
                                                            iterateOuter = null;
                                                            iterateInner = null;
                                                            sContestantTypTmp = null;
                                                            sContestantTypDesc = null;


                                                            //System.out.println(sOrdForStnCd);
                                                            //System.out.println(sOrdForDeptCd);
                                                            lstContestantTyp = hRemote.getContestantTyp();
                                                            iterateOuter = lstContestantTyp.iterator();

                                                            while (iterateOuter.hasNext()) {
                                                                rows = (List) iterateOuter.next();

                                                                iterateInner = rows.iterator();
                                                                while (iterateInner.hasNext()) {
                                                                    sContestantTypTmp = (String) iterateInner.next();
                                                                    sContestantTypDesc = (String) iterateInner.next();
                                                                }

                                    %>
                                    <option value="<%= sContestantTypTmp%>"><%= sContestantTypDesc%></option>

                                    <%
                                                            }
                                    %>
                                </select>
                            </td>
                            <td id="nms5">
                                <table border="" style="border-collapse : collapse">
                                    <tr>
                                        <td style="border : none">
                                            <div id="divNm_51" style="width: 50px; background: #FFFFCC ; display : none">

                                                <select name = "sSaluteCd_5" id = "sSaluteCd_5" style="width : 60px">

                                                    <option value=" ">SELECT</option>
                                                    <%

                                                                            lstSalute = null;
                                                                            rows = null;
                                                                            iterateOuter = null;
                                                                            iterateInner = null;
                                                                            sSaluteCdTmp = null;
                                                                            sSaluteDesc = null;


                                                                            //System.out.println(sOrdForStnCd);
                                                                            //System.out.println(sOrdForDeptCd);
                                                                            lstSalute = hRemote.getSalute();
                                                                            iterateOuter = lstSalute.iterator();

                                                                            while (iterateOuter.hasNext()) {
                                                                                rows = (List) iterateOuter.next();

                                                                                iterateInner = rows.iterator();
                                                                                while (iterateInner.hasNext()) {
                                                                                    sSaluteCdTmp = (String) iterateInner.next();
                                                                                    sSaluteDesc = (String) iterateInner.next();
                                                                                }


                                                    %>
                                                    <option value="<%= sSaluteCdTmp%>"><%= sSaluteDesc%></option>

                                                    <%
                                                                            }
                                                    %>


                                                </select>
                                            </div>
                                        </td>
                                        <td style="border : none">
                                            <div id="divNm_52" style="width: 150px; background: #FFFFCC ; display : none">
                                                &nbsp;
                                            </div>
                                            <div id="divNm_53" style="width: 150px; background: #FFFFCC ; display : none">
                                                <input type="text" name="sVndrNm_5" id="sVndrNm_5" size="25"/>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td id="cds5">
                                <div id="divCd_51" style="width: 100px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divCd_52" style="width: 100px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sCd_5" id="sCd_5" size="7" maxlength = '6' onkeyup="if(this.value.length == 6){showNames(5,this.value);}"/>
                                </div>
                            </td>
                            <td id="dss5">
                                <div id="divDesg_51" style="width: 150px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divDesg_52" style="width: 100px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sDesgDesc_5" id="sDesgDesc_5" size="25"/>
                                </div>
                                <div id="divDesg_53" style="width: 150px; background: #FFFFCC ; display : none">
                                    <select name = "sVndrDesgCd_5" id = "sVndrDesgCd_5" style="width : 120px" onchange="copyVndrDesgCd(this.id)">

                                        <option value=" ">SELECT</option>
                                        <%

                                                                lstVndrDesg = null;
                                                                rows = null;
                                                                iterateOuter = null;
                                                                iterateInner = null;
                                                                sVndrDesgCdTmp = null;
                                                                sVndrDesgDescTmp = null;


                                                                //System.out.println(sOrdForStnCd);
                                                                //System.out.println(sOrdForDeptCd);
                                                                lstVndrDesg = hRemote.getVndrDesg();
                                                                iterateOuter = lstVndrDesg.iterator();

                                                                while (iterateOuter.hasNext()) {
                                                                    rows = (List) iterateOuter.next();

                                                                    iterateInner = rows.iterator();
                                                                    while (iterateInner.hasNext()) {
                                                                        sVndrDesgCdTmp = (String) iterateInner.next();
                                                                        sVndrDesgDescTmp = (String) iterateInner.next();
                                                                    }

                                        %>
                                        <option value="<%= sVndrDesgCdTmp%>"><%= sVndrDesgDescTmp%></option>

                                        <%
                                                                }
                                        %>


                                    </select>
                                </div>
                            </td>
                            <td id="dcs5">
                                <div id="divDept_51" style="width: 100px; background: #FFFFCC ; display : none">
                                    &nbsp;
                                </div>
                                <div id="divDept_52" style="width: 170px; background: #FFFFCC ; display : none">
                                    <input type="text" name="sVndrCoNm_5" id="sVndrCoNm_5" size="25" onclick="getVndrDtls(this.name)"/>
                                </div>
                                <div id="divDept_53" style="width: 100px; background: #FFFFCC ; display : none">
                                    <select name = "sDeptCd_5" id = "sDeptCd_5">

                                        <option value=" ">SELECT</option>
                                        <%

                                                                lstDept = null;
                                                                rows = null;
                                                                iterateOuter = null;
                                                                iterateInner = null;
                                                                sDeptCdTmp = null;
                                                                sDeptDesc = null;


                                                                //System.out.println(sOrdForStnCd);
                                                                //System.out.println(sOrdForDeptCd);
                                                                lstDept = hRemote.getDept(sStnCd);
                                                                iterateOuter = lstDept.iterator();

                                                                while (iterateOuter.hasNext()) {
                                                                    rows = (List) iterateOuter.next();

                                                                    iterateInner = rows.iterator();
                                                                    while (iterateInner.hasNext()) {
                                                                        sDeptCdTmp = (String) iterateInner.next();
                                                                        sDeptDesc = (String) iterateInner.next();


                                        %>
                                        <option value="<%= sDeptCdTmp%>"><%= sDeptDesc%></option>

                                        <%
                                                                    }
                                                                }
                                        %>


                                    </select>

                                </div>

                            </td>
                        </tr>
                    </table>
                    <table class="tab3" width="80%">
                        <tr class="thdr" style="text-align: left;"><td>Contest Theme / Title:</td></tr>
                        <tr><td><textarea name="sTitle" rows="3"><%= sTitle%></textarea></td></tr>
                        <tr class="thdr" style="text-align: left;"><td>Problem / Initial Status / Analysis:</td></tr>
                        <tr><td><textarea name="sIntSts" rows="3"><%= sIntSts%></textarea></td></tr>
                        <tr class="thdr" style="text-align: left;"><td>Action:</td></tr>
                        <tr><td><textarea name="sAct" rows="3"><%= sAct%></textarea></td></tr>
                        <tr class="thdr" style="text-align: left;"><td>Results:</td></tr>
                        <tr><td><textarea name="sRslt" rows="3"><%= sRslt%></textarea></td></tr>
                        <tr class="thdr" style="text-align: left;"><td>Gain / Cost Saving:</td></tr>
                        <tr><td><textarea name="sCostSave" rows="3"><%= sCostSave%></textarea></td></tr>
                    </table>
                    <!--
                    <table class="tab4">
                        <tr class="thdr">
                            <td>Sketch / Picture of Initial Condition (Before)</td>
                            <td>Sketch / Picture of Improved Condition (After)</td>
                        </tr>
                        <tr>
                            <td><input type="file" name="before" /></td>
                            <td><input type="file" name="after" /></td>
                        </tr>
                    </table>
                    -->
                    <table width="70%">
                        <tr class="thdr">
                            <td colspan="2">Sketch / Picture of Initial Condition (Before)</td>
                            <td colspan="2">Sketch / Picture of Improved Condition (After)</td>
                        </tr>
                        <tr>

                            <td valign="top" width="20%">
                                <table class="table" id="tabFl_1">
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
                                    <div id="divDelFl_1" style="width: 20px; background : #000040; display:none">
                                        <input type="button" value="Delete File" name="butnDelFl_1" style="background-color : #ffffff" onclick="delFl('bef');">
                                    </div>
                                </center>
                            </td>
                            <td valign="top" width="30%">
                                <iframe id ="iFrameUpldFl_1" name ="iFrameUpldFl_1" src="ipicms_upldFl.jsp?sContestId=<%= sContestId%>&sIpAddr=<%= sIpAddr%>&sTyp=bef" height="140px" width="350px" frameborder="0">

                                </iframe>
                            </td>

                            <td valign="top" width="20%">
                                <table class="table" id="tabFl_2">
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
                                    <div id="divDelFl_2" style="width: 20px; background : #000040; display:none">
                                        <input type="button" value="Delete File" name="butnDelFl_2" style="background-color : #ffffff" onclick="delFl('aft');">
                                    </div>
                                </center>
                            </td>
                            <td valign="top" width="30%">
                                <iframe id ="iFrameUpldFl_2" name ="iFrameUpldFl_2" src="ipicms_upldFl.jsp?sContestId=<%= sContestId%>&sIpAddr=<%= sIpAddr%>&sTyp=aft" height="140px" width="350px" frameborder="0">

                                </iframe>
                            </td>
                        </tr>
                    </table>




                    <input type="hidden" name="before" /><input type="hidden" name="after" />
                    <table class="tab5" width="80%">
                        <tr>
                            <td style="width:12.5%;">Start Date<span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                            <td style="width:25%;">

                                <input name="sStDt" size="11" value="<%= sStDt%>" readonly
                                       onclick="if(!this.readOnly)sel_date_cls('f1.sStDt','js/')"/>


                                <!--input id="date1" type="text" name="sStDt" size="10" value="< sStDt>"/>
                                                                <a href="javascript:NewCal('date1','ddmmyyyy')"><img src="cal.gif" width="16" height="16" alt="Pick a date" style="vertical-align: middle;"></a-->
                            </td>
                            <td style="width:37.5%;">End Date<span style="color : red ; font-size : 12pt"><b>*</b></span></td>

                            <td style="width:28%;">
                                <input name="sEndDt" size="11" value="<%= sEndDt%>" readonly
                                       onclick="if(!this.readOnly)sel_date_cls('f1.sEndDt','js/')"/>

                                <!--input id="date2" type="text" name="sEndDt" size="11" value="< sEndDt>"/>
                                <a href="javascript:NewCal('date2','ddmmyyyy')"><img src="cal.gif" width="16" height="16" alt="Pick a date" style="vertical-align: middle;"></a-->

                            </td>
                        </tr>

                        <tr>
                            <td style="width:12.5%;">Award Type</td>
                            <td style="width:25%;">
                                <div id="divCatgTyp" style="width: 100px; background: #FFFFCC ; display : none">
                                    <select name = "sCatgTyp" id = "sCatgTyp">

                                        <option value="">SELECT</option>
                                        <%

                                                                lstCatgTyp = null;
                                                                rows = null;
                                                                iterateOuter = null;
                                                                iterateInner = null;
                                                                String sCatgCd = null;
                                                                String sCatgDesc = null;


                                                                //System.out.println(sOrdForStnCd);
                                                                //System.out.println(sOrdForDeptCd);
                                                                lstCatgTyp = hRemote.getCatgTyp();
                                                                iterateOuter = lstCatgTyp.iterator();

                                                                while (iterateOuter.hasNext()) {
                                                                    rows = (List) iterateOuter.next();

                                                                    iterateInner = rows.iterator();
                                                                    while (iterateInner.hasNext()) {
                                                                        sCatgCd = (String) iterateInner.next();
                                                                        sCatgDesc = (String) iterateInner.next();
                                                                        iterateInner.next();

                                        %>
                                        <option value="<%= sCatgCd%>"><%= sCatgDesc%></option>

                                        <%
                                                                    }
                                                                }
                                        %>


                                    </select>
                                </div>
                            </td>
                            <td style="width:37.5%;">Contest For Month/Year<span style="color : red ; font-size : 12pt"><b>*</b></span></td>
                            <td style="width:25%;">
                                <!--select name="sContestMnth" style="width:50px;">
                                    <option value="XX"></option>
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
                                <select>
                                <input type="text" name="sContestYr" size="6" value="<sContestYr>"-->

                                <input type="text" name="sContestMnthYr" size="6" value="<%= sContestMnthYr%>"
                                       onfocus="this.select();"
                                       onclick="if(edit_btn.value == 'Save'){sel_month('f1.sContestMnthYr','js/');}"
                                       />
                            </td>
                        </tr>
                    </table>
                </form>

                <form method="post" action="IpicmsProcessServlet" name="f2" onsubmit="return validate()" >
                    <div id="divSendBack" style="width: 900px; background: #FFFFCC ; display : none">
                        <table class="tab5" width="80%">

                            <input type="hidden" name="sCallNm" value="">
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

                            <input type="hidden" name="sContestId" value="<%= sContestId%>">
                            <input type="hidden" name="sMode" value="<%= sMode%>" />

                            <tr>
                                <td colspan="4">

                                    <table class="tab5" width="80%">
                                        <tr class="thdr" style="text-align: center;">
                                            <td colspan="4"><span id="spanSendBackHdg">Send Back</span></td>
                                        </tr>
                                        <tr>
                                            <td style="width:12.5%;font-weight: bold;"><span id="spanSendBackMkr">Send Back</span></td>
                                            <td colspan="3">
                                                <select name="sSendBackMkr" onchange="chngSSendBackMkr();">
                                                    <option value=' '></option>
                                                    <option value='Y'>yes</option>
                                                    <option value='N'>no</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:12.5%;">Send Back Date</td>
                                            <td style="width:25%;"><%= sSendBackDt%></td>
                                            <td style="width:37.5%;">Send Back By</td>
                                            <td style="width:25%;"><%= sSendBackByNm%></td>
                                        </tr>
                                        <tr>
                                            <td style="width:12.5%;font-weight: bold;"><span id="spanSendBackRsn">Reason for Send Back</span></td>
                                            <td colspan="3">
                                                <textarea name="sSendBackRsn" rows="2"><%= sSendBackRsn%></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                    <%//}%>


                                </td>
                            </tr>
                        </table>
                    </div>
                </form>

                <div id="divLvl1" style="width: 800px; background: #FFFFCC ; display : none">
                    <table class="tab5" width="80%">
                        <tr class="thdr">
                            <td colspan="4">Form Submission</td>
                        </tr>
                        <tr>
                            <td style="width:12.5%;">Submission Date</td>
                            <td style="width:25%;"><%= sLvl_1_dt%></td>
                            <td style="width:37.5%;">Submitted By</td>
                            <td style="width:25%;"><%= sLvl_1_nm%></td>
                        </tr>
                    </table>
                </div>

                <div id="divLvl2" style="width: 800px; background: #FFFFCC ; display : none">
                    <table class="tab5" width="80%">
                        <tr class="thdr">
                            <td colspan="4">Manager Approval</td>
                        </tr>
                        <tr>
                            <td style="width:12.5%;">Approval Date</td>
                            <td style="width:25%;"><%= sLvl_2_dt%></td>
                            <td style="width:37.5%;">Approved By</td>
                            <td style="width:25%;"><%= sLvl_2_nm%></td>
                        </tr>
                    </table>
                </div>
                <div id="divLvl3" style="width: 800px; background: #FFFFCC ; display : none">
                    <table class="tab5" width="80%">
                        <tr class="thdr">
                            <td colspan="4">Station/Departmental Level  Quality Monitoring Officers Approval</td>
                        </tr>
                        <tr>
                            <td style="width:12.5%;">Approval Date</td>
                            <td style="width:25%;"><%= sLvl_3_dt%></td>
                            <td style="width:37.5%;">Approved By</td>
                            <td style="width:25%;"><%= sLvl_3_nm%></td>
                        </tr>
                    </table>
                </div>
                <div id="divLvl4" style="width: 800px; background: #FFFFCC ; display : none">
                    <table class="tab5" width="80%">
                        <tr class="thdr">
                            <td colspan="4">Corporate Level  Quality Monitoring Officers Approval</td>
                        </tr>
                        <tr>
                            <td style="width:12.5%;">Approval Date</td>
                            <td style="width:25%;"><%= sLvl_4_dt%></td>
                            <td style="width:37.5%;">Approved By</td>
                            <td style="width:25%;"><%= sLvl_4_nm%></td>
                        </tr>
                    </table>
                </div>
                <% //if (Integer.parseInt(offlevel) > 1) {%>
                <form method="post" action="IpicmsProcessServlet" name="f3" onsubmit="return validate()" >
                    <div id="divCancel" style="width: 900px; background: #FFFFCC ; display : none">
                        <table class="tab5" width="80%">

                            <input type="hidden" name="sCallNm" value="">
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

                            <input type="hidden" name="sContestId" value="<%= sContestId%>">
                            <input type="hidden" name="sMode" value="<%= sMode%>" />

                            <tr>
                                <td colspan="4">

                                    <table class="tab5" width="80%">
                                        <tr class="thdr" style="text-align: center;">
                                            <td colspan="4"><span id="spanCancelHdg">Cancellation</span></td>
                                        </tr>
                                        <tr>
                                            <td style="width:12.5%;font-weight: bold;"><span id="spanCancelMkr">Cancel</span></td>
                                            <td colspan="3">
                                                <select name="sCancelMkr" onchange="chngSCancelMkr();">
                                                    <option value=' '></option>
                                                    <option value='Y'>yes</option>
                                                    <option value='N'>no</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width:12.5%;font-weight: bold;"><span id="spanCancelRsn">Reason for Cancel</span></td>
                                            <td colspan="3">
                                                <textarea name="sCancelRsn" rows="2"><%= sCancelRsn%></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                    <%//}%>


                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
                <br>
                <div id="divButn" style="width: 800px; background: #000040;">
                    <center>
                        <table cellspacing="1" cellpadding="2" class="table" id="" width="100%" style="border-collapse: collapse" border="0">

                            <tr>
                                <td>
                                    <div id="divButnEdit" style="width: 100px; background: #000040;display : none">
                                        <input type="button" value="Edit" name="edit_btn" style="width : 100px ;background-color : #ffffff" onclick="edit_onclick();if(this.value == 'Save'){animatedcollapse.hide('divButnConfirm');}else{animatedcollapse.show('divButnConfirm');}">
                                    </div>
                                </td>
                                <td>
                                    <div id="divButnSendBack" style="width: 120px; background: #000040;display : none">
                                        <input type="button" value="Return With Comments" name="butnSentBack" style="background-color : #ffffff" onclick="if(f2.sSendBackMkr.value == 'Y'){
                                                                                                                                                                                        
                                            f2.sCallNm.value='sentBack';
                                                                                                                                                                                        
                                                                                                                                                                                            
                                                                                                                                                                                        
                                            f2.submit();
                                        }"/>
                                    </div>
                                </td>
                                <td>
                                    <div id="divButnConfirm" style="width: 100px; background: #000040;display : none">
                                        <input type="button" value=" Forward" name="butnConfirm" style="background-color : #ffffff" onclick="f1.sCallNm.value='conf';f1.sCatgTyp.disabled = false ; f1.submit();">
                                    </div>
                                </td>
                                <!--td>
                                    <div id="divButnReject" style="width: 140px; background: #000040; ">
                                        <input type="button" value="Reject With Comments" name="butnReject" style = "text-align : center;" style="background-color : #ffffff" onclick="f1.sCallNm.value='reject';f1.submit();">
                                    </div>
                                </td-->
                                <td>
                                    <div id="divButnCancel" style="width: 140px; background: #000040;display : none">
                                        <input type="button" value="Cancel the Nomination" name="butnCancel" style = "text-align : center;background-color : #ffffff" onclick="if(f3.sCancelMkr.value == 'Y'){
                                        if(f1.sStg.value=='1'){
                                            f3.sCallNm.value='cancel';
                                        }else{
                                            f3.sCallNm.value='reject';
                                        }
                                        f3.submit();
                                    }"/>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </center>
                </div>
                <%
                                        String name = new String("");
                                        name = request.getParameter("currentuser");
                %>
                <input type="hidden" name="currentuser" value="<%=name%>" />
                <input type="hidden" name="sMsg" value="<%= sMsg%>" />
                <!--input type="submit" value="save" /-->

            </fieldset>

        </div>

        <script>
    animatedcollapse.addDiv('divCatgTyp', 'optional_attribute_string')
    animatedcollapse.addDiv('divCancel', 'optional_attribute_string')
    animatedcollapse.addDiv('divSendBack', 'optional_attribute_string')
    animatedcollapse.addDiv('divButnEdit', 'optional_attribute_string')
    animatedcollapse.addDiv('divButnSendBack', 'optional_attribute_string')
    animatedcollapse.addDiv('divButnConfirm', 'optional_attribute_string')
    animatedcollapse.addDiv('divButnReject', 'optional_attribute_string')
    animatedcollapse.addDiv('divButnCancel', 'optional_attribute_string')


           
    animatedcollapse.addDiv('divNm_11', 'optional_attribute_string')
    animatedcollapse.addDiv('divNm_12', 'optional_attribute_string')
    animatedcollapse.addDiv('divNm_13', 'optional_attribute_string')
    animatedcollapse.addDiv('divCd_11', 'optional_attribute_string')
    animatedcollapse.addDiv('divCd_12', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_11', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_12', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_13', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_11', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_12', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_13', 'optional_attribute_string')

    animatedcollapse.addDiv('divNm_21', 'optional_attribute_string')
    animatedcollapse.addDiv('divNm_22', 'optional_attribute_string')
    animatedcollapse.addDiv('divNm_23', 'optional_attribute_string')
    animatedcollapse.addDiv('divCd_21', 'optional_attribute_string')
    animatedcollapse.addDiv('divCd_22', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_21', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_22', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_23', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_21', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_22', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_23', 'optional_attribute_string')

    animatedcollapse.addDiv('divNm_31', 'optional_attribute_string')
    animatedcollapse.addDiv('divNm_32', 'optional_attribute_string')
    animatedcollapse.addDiv('divNm_33', 'optional_attribute_string')
    animatedcollapse.addDiv('divCd_31', 'optional_attribute_string')
    animatedcollapse.addDiv('divCd_32', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_31', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_32', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_33', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_31', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_32', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_33', 'optional_attribute_string')

    animatedcollapse.addDiv('divNm_41', 'optional_attribute_string')
    animatedcollapse.addDiv('divNm_42', 'optional_attribute_string')
    animatedcollapse.addDiv('divNm_43', 'optional_attribute_string')
    animatedcollapse.addDiv('divCd_41', 'optional_attribute_string')
    animatedcollapse.addDiv('divCd_42', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_41', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_42', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_43', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_41', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_42', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_43', 'optional_attribute_string')

    animatedcollapse.addDiv('divNm_51', 'optional_attribute_string')
    animatedcollapse.addDiv('divNm_52', 'optional_attribute_string')
    animatedcollapse.addDiv('divNm_53', 'optional_attribute_string')
    animatedcollapse.addDiv('divCd_51', 'optional_attribute_string')
    animatedcollapse.addDiv('divCd_52', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_51', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_52', 'optional_attribute_string')
    animatedcollapse.addDiv('divDesg_53', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_51', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_52', 'optional_attribute_string')
    animatedcollapse.addDiv('divDept_53', 'optional_attribute_string')

    animatedcollapse.addDiv('divLvl1', 'optional_attribute_string')
    animatedcollapse.addDiv('divLvl2', 'optional_attribute_string')
    animatedcollapse.addDiv('divLvl3', 'optional_attribute_string')
    animatedcollapse.addDiv('divLvl4', 'optional_attribute_string')
            
            
    animatedcollapse.init();

    f1.sKaizenForDeptCd.value = "<%= sKaizenForDeptCd%>"


    f1.oevTmp1.value = "<%= sOev_1%>"
    //alert("f1.oevTmp1.value : " + f1.oevTmp1.value)
    //oevfx (1);
    f1.sSaluteCdTmp_1.value = "<%= sSaluteCd_1%>"
    f1.sNmTmp_1.value = "<%= sNm_1%>"
    f1.sCdTmp_1.value = "<%= sCd_1%>"
    f1.sDesgCdTmp_1.value = "<%= sDesgCd_1%>"
    f1.sDesgDescTmp_1.value = "<%= sDesgDesc_1%>"
    f1.sDeptCdTmp_1.value = "<%= sDeptCd_1%>"
    f1.sVndrCdTmp_1.value = "<%= sVndrCd_1%>"
    f1.sVndrNmTmp_1.value = "<%= sVndrNm_1%>"
    f1.sVndrCoNmTmp_1.value = "<%= sVndrCoNm_1%>"
    f1.sVndrDesgCdTmp_1.value = "<%= sVndrDesgCd_1%>"

    f1.oevTmp2.value = "<%= sOev_2%>"
    //oevfx (2);
    f1.sSaluteCdTmp_2.value = "<%= sSaluteCd_2%>"
    f1.sNmTmp_2.value = "<%= sNm_2%>"
    f1.sCdTmp_2.value = "<%= sCd_2%>"
    f1.sDesgCdTmp_2.value = "<%= sDesgCd_2%>"
    f1.sDesgDescTmp_2.value = "<%= sDesgDesc_2%>"
    f1.sDeptCdTmp_2.value = "<%= sDeptCd_2%>"
    f1.sVndrCdTmp_2.value = "<%= sVndrCd_2%>"
    f1.sVndrNmTmp_2.value = "<%= sVndrNm_2%>"
    f1.sVndrCoNmTmp_2.value = "<%= sVndrCoNm_2%>"
    f1.sVndrDesgCdTmp_2.value = "<%= sVndrDesgCd_2%>"

    f1.oevTmp3.value = "<%= sOev_3%>"
    ///oevfx (3);
    f1.sSaluteCdTmp_3.value = "<%= sSaluteCd_3%>"
    f1.sNmTmp_3.value = "<%= sNm_3%>"
    f1.sCdTmp_3.value = "<%= sCd_3%>"
    f1.sDesgCdTmp_3.value = "<%= sDesgCd_3%>"
    f1.sDesgDescTmp_3.value = "<%= sDesgDesc_3%>"
    f1.sDeptCdTmp_3.value = "<%= sDeptCd_3%>"
    f1.sVndrCdTmp_3.value = "<%= sVndrCd_3%>"
    f1.sVndrNmTmp_3.value = "<%= sVndrNm_3%>"
    f1.sVndrCoNmTmp_3.value = "<%= sVndrCoNm_3%>"
    f1.sVndrDesgCdTmp_3.value = "<%= sVndrDesgCd_3%>"

    f1.oevTmp4.value = "<%= sOev_4%>"
    //oevfx (4);
    f1.sSaluteCdTmp_4.value = "<%= sSaluteCd_4%>"
    f1.sNmTmp_4.value = "<%= sNm_4%>"
    f1.sCdTmp_4.value = "<%= sCd_4%>"
    f1.sDesgCdTmp_4.value = "<%= sDesgCd_4%>"
    f1.sDesgDescTmp_4.value = "<%= sDesgDesc_4%>"
    f1.sDeptCdTmp_4.value = "<%= sDeptCd_4%>"
    f1.sVndrCdTmp_4.value = "<%= sVndrCd_4%>"
    f1.sVndrNmTmp_4.value = "<%= sVndrNm_4%>"
    f1.sVndrCoNmTmp_4.value = "<%= sVndrCoNm_4%>"
    f1.sVndrDesgCdTmp_4.value = "<%= sVndrDesgCd_4%>"

    f1.oevTmp5.value = "<%= sOev_5%>"
    //oevfx (5);
    f1.sSaluteCdTmp_5.value = "<%= sSaluteCd_5%>"
    f1.sNmTmp_5.value = "<%= sNm_5%>"
    f1.sCdTmp_5.value = "<%= sCd_5%>"
    f1.sDesgCdTmp_5.value = "<%= sDesgCd_5%>"
    f1.sDesgDescTmp_5.value = "<%= sDesgDesc_5%>"
    f1.sDeptCdTmp_5.value = "<%= sDeptCd_5%>"
    f1.sVndrCdTmp_5.value = "<%= sVndrCd_5%>"
    f1.sVndrNmTmp_5.value = "<%= sVndrNm_5%>"
    f1.sVndrCoNmTmp_5.value = "<%= sVndrCoNm_5%>"
    f1.sVndrDesgCdTmp_5.value = "<%= sVndrDesgCd_5%>"

    f1.sCatgTyp.value = "<%= sCatgTyp%>"
    f2.sSendBackMkr.value = "<%= sSendBackMkr%>"
    f3.sCancelMkr.value = "<%= sCancelMkr%>"


            

            


        </script>

        <%

                    } catch (Exception e) {
                    } finally {
                        /*if (rs != null) {
                        rs.close();
                        }
                        if (ps != null) {
                        ps.close();
                        }
                        if (mk.con != null) {
                        mk.con.close();
                        }*/
                    }
        %>

    </body>
</html>
