﻿<%--
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
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.File"%>

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
        <link rel="stylesheet" type="text/css" href="Css/idcms/jquery-ui-1.11.1.css" />
        <link rel="stylesheet" type="text/css" href="Css/idcms/bootstrap-3.3.5.css" />
        <link rel="stylesheet" type="text/css" href="Css/idcms/ipicms_nomination_style.css" />
        <style>
            .table {
                font-family     : verdana;
                font-size       : 11px;
                text-align      : left;
            }
        </style>
        <script type="text/javascript" src="js/idcms/jquery-1.10.2.js"></script>
        <!--script type="text/javascript" src="js/jquery.min.js"></script-->
        <script type="text/javascript" src="js/idcms/jquery-ui-1.11.1.js"></script>
        <script type="text/javascript" src="js/idcms/bootstrap-3.3.5.js"></script>
        <script type="text/javascript" src="js/idcms/animatedcollapse.js"></script>
        <script type="text/javascript" src="js/idcms/ipicms_nomination_script_new.js"></script>
        <script type="text/javascript" src="js/idcms/sel_date.js"></script>
        <script type="text/javascript" src="js/idcms/sel_month.js"></script>
        <script type="text/javascript" src="js/idcms/kaizenGenScript.js"></script>
        <script type="text/javascript" src="js/idcms/characterCountdown.js"></script>
        <!--script type="text/javascript" src="js/idcms/scrollabletable.js"></script-->
        <script>
            function noenter(){
                if(window.event.keyCode == '13'){
                    return false;
                }
                return true;
            }

            function preScript(){

                //--------------------------Block A---------------------------------------//
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

                
                
                if( f1.hIdentified_by.value == 'S' ){
                    $('input[name="sIdentified_by"]')[0].checked = true ;
                }else if( f1.hIdentified_by.value == 'O' ){
                    $('input[name="sIdentified_by"]')[1].checked = true ;
                }

                //--------------------------END Block A---------------------------------------//

                //--------------------------Block B---------------------------------------//

                $('#sSymptom').characterCountdown({
                    countdownTarget: '#div_countdown_symptom', // the class, ID or element that will display the countdown
                    maxChars: 100 //  the maximum amount of characters
                });

                $('#sWho_face_problem').characterCountdown({
                    countdownTarget: '#div_countdown_who_face_problem', // the class, ID or element that will display the countdown
                    maxChars: 100 //  the maximum amount of characters
                });

                $('#sLocation_problem').characterCountdown({
                    countdownTarget: '#div_countdown_location_problem', // the class, ID or element that will display the countdown
                    maxChars: 100 //  the maximum amount of characters
                });

                //--------------------------END Block B---------------------------------------//

                //--------------------------Block C---------------------------------------//

                if( f1.hImprove_input.value == 'Y' ){
                    $('input[name="sImprove_input"]')[0].checked = true ;
                }
                if( f1.hImprove_methodology.value == 'Y' ){
                    $('input[name="sImprove_methodology"]')[0].checked = true ;
                }
                if( f1.hImprove_loss_reduction.value == 'Y' ){
                    $('input[name="sImprove_loss_reduction"]')[0].checked = true ;
                }
                if( f1.hImprove_process_modification.value == 'Y' ){
                    $('input[name="sImprove_process_modification"]')[0].checked = true ;
                }

                $('#sPrimary_root_cause').characterCountdown({
                    countdownTarget: '#div_countdown_primary_root_cause', // the class, ID or element that will display the countdown
                    maxChars: 200 //  the maximum amount of characters
                });

                if( f1.hWhy_why_analysis.value == 'Y' ){
                    $('input[name="sWhy_why_analysis"]')[0].checked = true ;
                }
                if( f1.hPareto_analysis.value == 'Y' ){
                    $('input[name="sPareto_analysis"]')[0].checked = true ;
                }
                if( f1.hFish_bone_diagram.value == 'Y' ){
                    $('input[name="sFish_bone_diagram"]')[0].checked = true ;
                }
                if( f1.hNone_analysis.value == 'Y' ){
                    $('input[name="sNone_analysis"]')[0].checked = true ;
                }

                //--------------------------END Block C---------------------------------------//

                //--------------------------Block D---------------------------------------//

                var json_arr = JSON.parse(f1.sJson_probable_soln.value);
                //alert(json_arr.length)
                var id = 0 ;
                $.each(json_arr,function(key,value){
                    id = add_row_probable_soln();//alert(value.sItem + '-' + value.sImprove_param + '-' + value.sUom + '-' + value.sBefore + '-' + value.sAfter);
                    $('#tr_probable_soln_'+id).children().eq(0).children('input').val(value.sProbable_soln);
                    if( id == f1.sFinally_implemented_soln.value ){
                        $('#tr_probable_soln_'+id).children().eq(1).children('input').attr('checked',true);
                        clkFinally_implemented_soln($('#tr_probable_soln_'+id).children().eq(1).children('input'));
                    }
                    //alert(json[key].fname + ' ' + json[key].lname);
                    //alert(value.fname + ' ' + value.lname);
                    /*$('#sBudget_head_seq').append($('<option>', {
                                value: value.budget_head_seq,
                                text: value.budget_head
                            }));*/
                });

                if( f1.hValidate_thru_experiment.value == 'Y' ){
                    $('input[name="sValidate_thru_experiment"]')[0].checked = true ;
                }
                if( f1.hEasier_to_implement.value == 'Y' ){
                    $('input[name="sEasier_to_implement"]')[0].checked = true ;
                }
                if( f1.hLow_cost.value == 'Y' ){
                    $('input[name="sLow_cost"]')[0].checked = true ;
                }
                if( f1.hMin_conflict_oth_interest.value == 'Y' ){
                    $('input[name="sMin_conflict_oth_interest"]')[0].checked = true ;
                }
                if( f1.hFavour_impact_ehs.value == 'Y' ){
                    $('input[name="sFavour_impact_ehs"]')[0].checked = true ;
                }
                if( f1.hOther_soln.value == 'Y' ){
                    $('input[name="sOther_soln"]')[0].checked = true ;
                    clkOther_soln();
                }
                if( f1.hInnovative_place.value == '1' ){
                    $('input[name="sInnovative_place"]')[0].checked = true ;
                }else if( f1.hInnovative_place.value == '2' ){
                    $('input[name="sInnovative_place"]')[1].checked = true ;
                }else if( f1.hInnovative_place.value == '3' ){
                    $('input[name="sInnovative_place"]')[2].checked = true ;
                }
                if( f1.hInnovative_none.value == 'Y' ){
                    $('input[name="sInnovative_none"]')[0].checked = true ;
                }
                if( f1.hUniqueness.value == '1' ){
                    $('input[name="sUniqueness"]')[0].checked = true ;
                }else if( f1.hUniqueness.value == '2' ){
                    $('input[name="sUniqueness"]')[1].checked = true ;
                }else if( f1.hUniqueness.value == '3' ){
                    $('input[name="sUniqueness"]')[2].checked = true ;
                }

                if( f1.hScope_of_replicability.value == '1' ){
                    $('input[name="sScope_of_replicability"]')[0].checked = true ;
                }else if( f1.hScope_of_replicability.value == '2' ){
                    $('input[name="sScope_of_replicability"]')[1].checked = true ;
                }else if( f1.hScope_of_replicability.value == '3' ){
                    $('input[name="sScope_of_replicability"]')[2].checked = true ;
                }else if( f1.hScope_of_replicability.value == '4' ){
                    $('input[name="sScope_of_replicability"]')[3].checked = true ;
                }
                //--------------------------END Block D---------------------------------------//
                
                //--------------------------Block E---------------------------------------//

                var json_arr = JSON.parse(f1.sJson_prfmnce_get.value);
                //alert(json_arr.length)
                var id = 0 ;
                $.each(json_arr,function(key,value){
                    id = add_row_prfmnce();//alert(value.sItem + '-' + value.sImprove_param + '-' + value.sUom + '-' + value.sBefore + '-' + value.sAfter);
                    $('#tr_prfmnce_'+id).children().eq(0).children('select').val(value.sItem);
                    $('#tr_prfmnce_'+id).children().eq(1).children('input').val(value.sImprove_param);
                    $('#tr_prfmnce_'+id).children().eq(2).children('input').val(value.sUom);
                    $('#tr_prfmnce_'+id).children().eq(3).children('input').val(value.sBefore);
                    $('#tr_prfmnce_'+id).children().eq(4).children('input').val(value.sAfter);
                    //alert(json[key].fname + ' ' + json[key].lname);
                    //alert(value.fname + ' ' + value.lname);
                    /*$('#sBudget_head_seq').append($('<option>', {
                                value: value.budget_head_seq,
                                text: value.budget_head
                            }));*/
                });

                if( f1.hBenefit_of_improve_continue.value == 'Y' ){
                    $('input[name="sBenefit_of_improve_continue"]')[0].checked = true ;
                    clkBenefit_of_improve_continue();
                }else if( f1.hBenefit_of_improve_continue.value == 'N' ){
                    $('input[name="sBenefit_of_improve_continue"]')[1].checked = true ;
                    clkBenefit_of_improve_continue();
                }

                //--------------------------END Block E---------------------------------------//

                //--------------------------Block F---------------------------------------//

                $('#sTitle').characterCountdown({
                    countdownTarget: '#div_countdown_title', // the class, ID or element that will display the countdown
                    maxChars: 135 //  the maximum amount of characters
                });

                //--------------------------END Block F---------------------------------------//
                
                //--------------------------Block G---------------------------------------//
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

                //--------------------------END Block G---------------------------------------//

                if(f1.sCallNm.value == 'session_expire'){
                    showDialog('Session Expired ! Please login again.');
                }else if(f1.sCallNm.value == 'insIpicms'){                    
                    showDialog('Insertion Successful !');
                }else if( f1.sCallNm.value == 'updIpicms' ){
                    showDialog('Updation Successful !');
                    
                }

                getPicFlNms('all');
                
                return true;
            }

            function showDialog(dialogContent){
                document.getElementById("spanDialog").firstChild.data = dialogContent;
                $("#dialog").dialog({
                    //autoOpen : false,
                    resizable : false,
                    //height : 150,
                    //width : 300,
                    modal : true,
                    title : "ALERT",
                    /*buttons:{
                        "Delete all items" : function(){
                            $(this).dialog("close");
                        },
                        Cancel : function(){
                            $(this).dialog("close");
                        }
                    }*/
                    buttons:[
                        {
                            text : "OK",
                            click : function(){
                                $(this).dialog("close");
                            }
                        }
                    ]
                }) ;
            }

            /*--------------------------------------------------------Validation of Block - 1 ---------------------------------------------------------------------------*/

            var chkKaizenForDeptCd = function(){

                if(f1.sKaizenForDeptCd.value == ''){
                    alert('Pl. Select a Department !');
                    f1.sKaizenForDeptCd.focus();
                    return false;
                }

                return true;
            }

            var chkContestant_dtl = function(){
                var flag = 0 ;
                for( var i = 1 ; i <= 5 ; i++ ){
                    if( $('#s'+i).val() != ' ' ){
                        if( chkSalute_cd(i) ){}
                        else return false ;

                        if( $('#s'+i).val() == 'o' ){
                            if( chkCd(i) ){}
                            else return false ;
                        }else if( $('#s'+i).val() == 'e' ){
                            if( chkCd(i) ){}
                            else return false ;

                            if( chkDesgDesc(i) ){}
                            else return false ;

                            if( chkDeptCd(i) ){}
                            else return false ;
                        }else if( $('#s'+i).val() == 'v' ){
                            if( chkVndrNm(i) ){}
                            else return false ;

                            if( chkVndrDesgCd(i) ){}
                            else return false ;

                            if( chkVndrCoNm(i) ){}
                            else return false ;
                        }
                    }
                }
                return true ;
            }

            var chkSalute_cd = function(id){

                if( $('#sSaluteCd_'+id).val() == ' ' ){
                    alert('Please select a Salutation !');
                    $('#sSaluteCd_'+id).focus();
                    return false ;
                }

                return true ;
            }

            var chkCd = function(id){

                if( $('#sCd_'+id).val() == '' ){
                    alert('Please Enter 6 digit Employee Code !');
                    $('#sCd_'+id).focus();
                    $('#sCd_'+id).select();
                    return false ;
                }

                return true ;
            }

            var chkDesgDesc = function(id){

                if( $('#sDesgDesc_'+id).val() == '' ){
                    alert('Please Enter Designation of Employee !');
                    $('#sDesgDesc_'+id).focus();
                    $('#sDesgDesc_'+id).select();
                    return false ;
                }

                return true ;
            }

            var chkDeptCd = function(id){

                if( $('#sDeptCd_'+id).val() == ' ' ){
                    alert('Please Select a Department !');
                    $('#sDeptCd_'+id).focus();
                    return false ;
                }

                return true ;
            }

            var chkVndrNm = function(id){

                if( $('#sVndrNm_'+id).val() == '' ){
                    alert('Please Enter Name of the Contractor !');
                    $('#sVndrNm_'+id).focus();
                    $('#sVndrNm_'+id).select();
                    return false ;
                }

                return true ;
            }

            var chkVndrDesgCd = function(id){

                if( $('#sVndrDesgCd_'+id).val() == ' ' ){
                    alert('Please Select Category of Contractor !');
                    $('#sVndrDesgCd_'+id).focus();
                    return false ;
                }

                return true ;
            }

            var chkVndrCoNm = function(id){

                if( $('#sVndrCoNm_'+id).val() == '' ){
                    alert('Please Enter Company Name of the Contractor !');
                    $('#sVndrCoNm_'+id).focus();
                    $('#sVndrCoNm_'+id).select();
                    return false ;
                }

                return true ;
            }

            var chkIdentified_by = function(){
                if( $("input[name='sIdentified_by']:checked").val() == undefined ){
                    alert('Who identified the problem / symptom ?');
                    return false ;
                }

                return true ;
            }

            var validate_form_block1 = function(){

                document.f1.hStatus_block1.value = '0';

                if( chkKaizenForDeptCd() ){}
                else{
                    document.f1.hStatus_block1.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkContestant_dtl() ){}
                else{
                    document.f1.hStatus_block1.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkIdentified_by() ){}
                else{
                    document.f1.hStatus_block1.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                document.f1.hStatus_block1.value = '1';

                if( f1.hValidation_typ.value == 'all' ){
                    validate_form_block2();
                }else{
                    alert('Validation Successful for Block A. Details of Applicant(s)');
                }

                return true ;
            }

            /*--------------------------------------------------------Validation of Block - 1 ---------------------------------------------------------------------------*/

            /*--------------------------------------------------------Validation of Block - 2 ---------------------------------------------------------------------------*/
            var chkSymptom = function(){
                if( myTrim($('#sSymptom').val()) == '' ){
                    alert('Please enter symptom/pain !');
                    $('#sSymptom').focus();
                    $('#sSymptom').select();
                    return false;
                }
                
                var html1 = $('#div_countdown_symptom').html();
                var index1 = html1.indexOf('Remaining');
                var index2 = html1.indexOf('chars');
                var no_of_char = myTrim(html1.substring(index1+9,index2)); 
                
                if( parseInt(no_of_char,10) < 0 ){
                    alert('You have entered more than maximum allowable characters(100) for symptom/pain !');
                    $('#sSymptom').focus();
                    $('#sSymptom').select();
                    return false;
                }
                return true ;
            }
            var chkWho_face_problem = function(){
                if( myTrim($('#sWho_face_problem').val()) == '' ){
                    alert('Who is/ are facing the problem ? Please Enter !');
                    $('#sWho_face_problem').focus();
                    $('#sWho_face_problem').select();
                    return false;
                }
                var html1 = $('#div_countdown_who_face_problem').html();
                var index1 = html1.indexOf('Remaining');
                var index2 = html1.indexOf('chars');
                var no_of_char = myTrim(html1.substring(index1+9,index2)); 
                
                if( parseInt(no_of_char,10) < 0 ){
                    alert('You have entered more than maximum allowable characters(100) for Who is/are facing the problem !');
                    $('#sWho_face_problem').focus();
                    $('#sWho_face_problem').select();
                    return false;
                }
                return true ;
            }
            var chkLocation_problem = function(){
                if( myTrim($('#sLocation_problem').val()) == '' ){
                    alert('Please enter Location of the problem or symptom? Site / machine / process');
                    $('#sLocation_problem').focus();
                    $('#sLocation_problem').select();
                    return false;
                }
                var html1 = $('#div_countdown_location_problem').html();
                var index1 = html1.indexOf('Remaining');
                var index2 = html1.indexOf('chars');
                var no_of_char = myTrim(html1.substring(index1+9,index2)); 
                
                if( parseInt(no_of_char,10) < 0 ){
                    alert('You have entered more than maximum allowable characters(100) for Location of the the problem or symptom !');
                    $('#sLocation_problem').focus();
                    $('#sLocation_problem').select();
                    return false;
                }
                return true ;
            }
            var validate_form_block2 = function(){

                document.f1.hStatus_block2.value = '0';

                if( chkSymptom() ){}
                else{
                    document.f1.hStatus_block2.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkWho_face_problem() ){}
                else{
                    document.f1.hStatus_block2.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkLocation_problem() ){}
                else{
                    document.f1.hStatus_block2.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                document.f1.hStatus_block2.value = '1';

                if( f1.hValidation_typ.value == 'all' ){
                    validate_form_block3();
                }else{
                    alert('Validation Successful for Block B. Diagnosis of Symptom / Pain / Problem');
                }


                return true ;
            }
            /*--------------------------------------------------------Validation of Block - 2 ---------------------------------------------------------------------------*/

            /*--------------------------------------------------------Validation of Block - 3 ---------------------------------------------------------------------------*/
 
            var chkImprove_aimed_at = function(){

                var iCnt = 0 ;
                if( $('input[name="sImprove_input"]')[0].checked == true ){
                    iCnt++ ;
                }
                if( $('input[name="sImprove_methodology"]')[0].checked == true ){
                    iCnt++ ;
                }
                if( $('input[name="sImprove_loss_reduction"]')[0].checked == true ){
                    iCnt++ ;
                }
                if( $('input[name="sImprove_process_modification"]')[0].checked == true ){
                    iCnt++ ;
                }
                
                if( iCnt == 0 ){
                    alert('Please select atleast one improvement !');
                    return false ;
                }

                return true ;
            }

            var chkPrimary_root_cause = function(){

                if( myTrim(f1.sPrimary_root_cause.value) == '' ){
                    alert('Primary Root Cause field can not be left blank/only space !');
                    f1.sPrimary_root_cause.focus();
                    f1.sPrimary_root_cause.select();
                    return false ;
                }
                var html1 = $('#div_countdown_primary_root_cause').html();
                var index1 = html1.indexOf('Remaining');
                var index2 = html1.indexOf('chars');
                var no_of_char = myTrim(html1.substring(index1+9,index2)); 
                
                if( parseInt(no_of_char,10) < 0 ){
                    alert('You have entered more than maximum allowable characters(200) for Primary Root Cause field !');
                    $('#sPrimary_root_cause').focus();
                    $('#sPrimary_root_cause').select();
                    return false;
                }

                return true ;
            }

            var chkRoot_cause_analysis = function(){
                var iCnt = 0 ;
                if( $('input[name="sWhy_why_analysis"]')[0].checked == true ){
                    iCnt++ ;
                }
                if( $('input[name="sPareto_analysis"]')[0].checked == true ){
                    iCnt++ ;
                }
                if( $('input[name="sFish_bone_diagram"]')[0].checked == true ){
                    iCnt++ ;
                }
                if( $('input[name="sNone_analysis"]')[0].checked == true ){
                    iCnt++ ;
                }
                
                if( iCnt == 0 ){
                    alert('Please select atleast one analysis to arrive at root cause !');
                    return false ;
                }


                return true ;
            }

            var chkAttach_root_cause_analysis = function(){

                if( $('input[name="sWhy_why_analysis"]')[0].checked == true && document.f1.sNoFl_4_w.value == 0 && document.f1.sNoFl_4_wp.value == 0 && document.f1.sNoFl_4_wf.value == 0 && document.f1.sNoFl_4_wpf.value == 0 ){
                    alert('Please upload atleast one attachment for Why Why Analysis !');
                    return false ;
                }
                if( $('input[name="sPareto_analysis"]')[0].checked == true && document.f1.sNoFl_4_p.value == 0 && document.f1.sNoFl_4_wp.value == 0 && document.f1.sNoFl_4_pf.value == 0 && document.f1.sNoFl_4_wpf.value == 0 ){
                    alert('Please upload atleast one attachment for Pareto Analysis !');
                    return false ;
                }
                if( $('input[name="sFish_bone_diagram"]')[0].checked == true && document.f1.sNoFl_4_f.value == 0 && document.f1.sNoFl_4_wf.value == 0 && document.f1.sNoFl_4_pf.value == 0 && document.f1.sNoFl_4_wpf.value == 0 ){
                    alert('Please upload atleast one attachment for Fish Bone Diagram !');
                    return false ;
                }
                return true ;
            }

            var validate_form_block3_1 = function(){
               
                if( chkImprove_aimed_at() ){}
                else{
                    document.f1.hStatus_block3_1.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkPrimary_root_cause() ){}
                else{
                    document.f1.hStatus_block3_1.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkRoot_cause_analysis() ){}
                else{
                    document.f1.hStatus_block3_1.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkAttach_root_cause_analysis() ){}
                else{
                    document.f1.hStatus_block3_1.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }
                document.f1.hStatus_block3_1.value = '1';

                validate_form_block3_2();
                
                return true ;
            }

            var chkPicture_problem_area = function(){

                if( f1.sNoFl_1.value == 0 ){
                    //confirm(
                    $('#myModal').modal({
                        show: 'true'
                    });
                    return false ;
                }
                return true ;
            }

            var set_status_block = function(block_no,block_sub_no,status){

                //alert(block_no + '-' + block_sub_no +'-'+status);

                $('#hStatus_'+'block'+block_no+'_'+block_sub_no).val(status);

                if( block_no == '3' && block_sub_no == '2' && status == '1' ){
                    validate_form_block3_3();
                }else{
                    f1.hValidation_typ.value = '';
                }

                return true ;
            }

            var validate_form_block3_2 = function(){

                if( chkPicture_problem_area() ){
                    document.f1.hStatus_block3_2.value = '1';
                    validate_form_block3_3();
                }else{
                    document.f1.hStatus_block3_2.value = '0';
                    return false ;
                }

                return true ;
            }

            var chkBef_picture = function(){
                if( f1.sNoFl_1.value > 0 && f1.sBef_picture.value == '' ){
                    alert('Please select a Picture / diagram showing problem area to be considered for future.');
                    f1.sBef_picture.focus();
                    return false ;
                }
                return true ;
            }

            var validate_form_block3_3 = function(){
                if( chkBef_picture() ){}
                else{
                    document.f1.hStatus_block3_3.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }
                
                document.f1.hStatus_block3_3.value = '1';

                if( f1.hValidation_typ.value == 'all' ){
                    validate_form_block4();
                }else{
                    alert('Validation Successful for Block C. From Symptom to finding of root cause');
                }

                //alert('I am successful !');
                
                return true ;
            }

            var validate_form_block3 = function(){

                document.f1.hStatus_block3_1.value = '0';
                document.f1.hStatus_block3_2.value = '0';
                document.f1.hStatus_block3_3.value = '0';

                validate_form_block3_1();

                //alert(f1.hStatus_block3_1.value + '-' + f1.hStatus_block3_2.value + '-' + f1.hStatus_block3_3.value)

                return true ;
            }

            var clkNone_analysis = function(){

                if( $('input[name="sNone_analysis"]')[0].checked == true ){
                    $('input[name="sWhy_why_analysis"]')[0].checked = false;
                    $('input[name="sWhy_why_analysis"]')[0].disabled = true;
                    $('input[name="sPareto_analysis"]')[0].checked = false;
                    $('input[name="sPareto_analysis"]')[0].disabled = true;
                    $('input[name="sFish_bone_diagram"]')[0].checked = false;
                    $('input[name="sFish_bone_diagram"]')[0].disabled = true;
                }else{
                    $('input[name="sWhy_why_analysis"]')[0].disabled = false;
                    $('input[name="sPareto_analysis"]')[0].disabled = false;
                    $('input[name="sFish_bone_diagram"]')[0].disabled = false;
                }

                return true ;

            }

            var select_file_upld_cause = function(){

                var html1 = "<span>Pl. select which file you want to upload.</span><br/>"

                if( $('input[name="sWhy_why_analysis"]')[0].checked == true ){
                    html1 += "<input type='checkbox' name='sFile_upld_cause_w' id='sFile_upld_cause_w'>&nbsp;Why Why Analysis<br/>"
                }

                if( $('input[name="sPareto_analysis"]')[0].checked == true ){
                    html1 += "<input type='checkbox' name='sFile_upld_cause_p' id='sFile_upld_cause_p'>&nbsp;Pareto Analysis<br/>"
                }

                if( $('input[name="sFish_bone_diagram"]')[0].checked == true ){
                    html1 += "<input type='checkbox' name='sFile_upld_cause_f' id='sFile_upld_cause_f'>&nbsp;Fish Bone Diagram</br/>"
                }

                if( $('input[name="sNone_analysis"]')[0].checked == true ){
                    html1 += "<input type='checkbox' name='sFile_upld_cause_n' id='sFile_upld_cause_n'>&nbsp;None of these</br>"
                }

                $('#td_file_upld_cause').html(html1);

                $('#file_upld_cause_modal').modal({
                    show: 'true'
                });

            }

            var file_upld_cause = function(){
                var sSub_typ ;

                var iCnt = 0 ;
                var sSub_typ = '';
                if( $('input[name="sFile_upld_cause_w"]')[0] != undefined && $('input[name="sFile_upld_cause_w"]')[0].checked == true ){
                    sSub_typ = sSub_typ + 'w';
                    iCnt++ ;
                }
                if( $('input[name="sFile_upld_cause_p"]')[0] != undefined && $('input[name="sFile_upld_cause_p"]')[0].checked == true ){
                    sSub_typ = sSub_typ + 'p';
                    iCnt++ ;
                }
                if( $('input[name="sFile_upld_cause_f"]')[0] != undefined && $('input[name="sFile_upld_cause_f"]')[0].checked == true ){
                    sSub_typ = sSub_typ + 'f';
                    iCnt++ ;
                }
                if( $('input[name="sFile_upld_cause_n"]')[0] != undefined && $('input[name="sFile_upld_cause_n"]')[0].checked == true ){
                    sSub_typ = sSub_typ + 'n';
                    iCnt++ ;
                }
                
                if( iCnt == 0 ){
                    alert('Pl. select which file you want to upload !');
                    return false ;
                }

                /*if( $('input[name="sFile_upld_cause"]:checked').val() == undefined ){
                    alert('Pl. select which file you want to upload !');
                    return false;
                }
                sSub_typ=$('input[name="sFile_upld_cause"]:checked').val();*/

                document.getElementById("iFrameUpldFl_4" ).src = 'ipicms_upldFl.jsp?sContestId='+f1.sContestId.value+'&sIpAddr='+f1.sIpAddr.value + "&sTyp=cause" + "&sSub_typ="+sSub_typ;

                var x = document.getElementById("iFrameUpldFl_4");
                var y = x.contentWindow.document;
                y.form1.sSub_typ.value = sSub_typ;
                y.form1.submit();

                return true ;
            }

            /*--------------------------------------------------------Validation of Block - 3 ---------------------------------------------------------------------------*/

            /*--------------------------------------------------------Validation of Block - 4 ---------------------------------------------------------------------------*/

            var chkProbable_soln = function(){

                var id = 0 ;
                $('#tab_probable_soln tr').each(function(index,element){
                    id = $(this).attr('id').substring(17);
                });
	
                if( id == 0 ){
                    alert('Please enter atleast one Probable Solution !')
                    return false ;
                }
                var bFlag = 1 ;
                $('#tab_probable_soln tr').each(function(index,element){
                    if( parseInt($(this).attr('id').substring(17),10) > 0 ){
                        $(element).children().each(function(index2,element2){
                            //alert($(element2).get(0).tagName)
                            if( index2 == 0 ){
                                if( $(element2).find('input').val() == '' ){
                                    alert('Probable Solution field can not be left blank !');
                                    $(element2).find('input').focus();
                                    $(element2).find('input').select();
                                    bFlag = 0 ;
                                    return false;
                                }
                            }

                        });
                        if(bFlag == 0)return false;
                    }
                });

                if( bFlag == 0 )return false;

                return true ;
            }

            var add_row_probable_soln = function(){

                var id = 0 ;
                $('#tab_probable_soln tr').each(function(index,element){
                    id = $(this).attr('id').substring(17);
                });//alert(id)
                
                $('#tr_probable_soln_'+id).after("<tr style='text-align: left' id='tr_probable_soln_"+(parseInt(id,10)+1)+"'>"
                    +  "<td><input type='text' size='75' maxlength='100'/></td>"
                    +  "<td><input type='radio' name='hFinally_implemented_soln' value="+(parseInt(id,10)+1)+" onclick='clkFinally_implemented_soln(this)'/></td>"
                    +  "<td><img name='' src='Pics/Order/minus_1.png' style='width : 20px ; height : 20px ; cursor : pointer' onclick = 'del_row_probable_soln("+(parseInt(id,10)+1)+");'/></td>"
                    +  "</tr>");

                return (parseInt(id,10)+1) ;


            }

            var del_row_probable_soln = function(id){

                //alert(id);
                $('#tr_probable_soln_'+id).remove();
                return true ;
            }

            var get_dtls_probable_soln = function(){
                var json_probable_soln = [];
                var iRow = 0 ;
                var iCol = 0 ;
                $('#tab_probable_soln tr').each(function(index,element){
                    if( parseInt($(this).attr('id').substring(17),10) > 0 ){
                        iRow++;
                        $(element).children().each(function(index2,element2){
                            //alert($(element2).get(0).tagName)
                            if( index2 == 0 ){
                                sProbable_soln = $(element2).find('input').val();
                            }

                        });

                        json_probable_soln.push({
                            iRow : iRow,
                            sProbable_soln : sProbable_soln
                        });
                        //alert($('element > td > select').val());
                        /*$("element").find('text').each(function(index2,element2){
                              alert();
                          });*/
                    }
                });

                alert(JSON.stringify(json_probable_soln));
                //alert(_trackJs.serialize(json_probable_soln));

                return true ;
 
            }

            var chkConsider_for_best_soln = function(){

                var iCnt = 0 ;
                if( $('input[name="sValidate_thru_experiment"]')[0].checked == true ){
                    iCnt++ ;
                }
                if( $('input[name="sEasier_to_implement"]')[0].checked == true ){
                    iCnt++ ;
                }
                if( $('input[name="sLow_cost"]')[0].checked == true ){
                    iCnt++ ;
                }
                if( $('input[name="sMin_conflict_oth_interest"]')[0].checked == true ){
                    iCnt++ ;
                }
                if( $('input[name="sFavour_impact_ehs"]')[0].checked == true ){
                    iCnt++ ;
                }
                if( $('input[name="sOther_soln"]')[0].checked == true ){
                    iCnt++ ;
                }
                
                if( iCnt == 0 ){
                    alert('Please check atleast one from Considerations for best solutions !');
                    return false ;
                }

                return true ;
            }

            var chkOther_soln_val = function(){

                if( $('#sOther_soln_val').length == 0 ){//Doesn't exist
                    return true ;
                }

                if( $('#sOther_soln_val').val() == null || $('#sOther_soln_val').val() == '' ){
                    alert('What prompted you to select the final solution ?');
                    $('#sOther_soln_val').focus();
                    return false ;
                }

                return true ;
            }

            var chkOther_soln_val_none = function(){

                if( $('#sOther_soln_val_none').length == 0 ){
                    return true ;
                }

                if( myTrim($('#sOther_soln_val_none').val()) == '' ){
                    alert('What prompted you to select the final solution ? Enter some text.');
                    $('#sOther_soln_val_none').focus();
                    $('#sOther_soln_val_none').select();
                    return false ;
                }

                return true ;
            }

            var chkInnovative = function(){

                if( $("input[name='sInnovative_place']:checked").val() == undefined && $('input[name="sInnovative_none"]')[0].checked == false ){
                    alert('Please select a value from Innovative section !');
                    return false ;
                }

                return true ;

            }

            var chkUniqueness = function(){

                if( $("input[name='sUniqueness']:checked").val() == undefined ){
                    alert('Please select a value from Uniqueness section !');
                    return false ;
                }

                return true ;

            }

            var chkScope_of_replicability = function(){
                if( $("input[name='sScope_of_replicability']:checked").val() == undefined ){
                    alert('Please specify Scope of Replicability ?');
                    return false ;
                }

                return true ;
            }

            var chkFinally_implemented_soln = function(){

                /*if( myTrim(f1.sFinally_implemented_soln.value) == '' ){
                    alert('Finally implemented Solution field can not be left blank/only space !');
                    f1.sFinally_implemented_soln.focus();
                    f1.sFinally_implemented_soln.select();
                    return false ;
                }
                var html1 = $('#div_countdown_finally_implemented_soln').html();
                var index1 = html1.indexOf('Remaining');
                var index2 = html1.indexOf('chars');
                var no_of_char = myTrim(html1.substring(index1+9,index2)); 
                
                if( parseInt(no_of_char,10) < 0 ){
                    alert('You have entered more than maximum allowable characters(100) for Finally implemented Solution field !');
                    $('#sFinally_implemented_soln').focus();
                    $('#sFinally_implemented_soln').select();
                    return false;
                }*/

                if( $("input[name='hFinally_implemented_soln']:checked").val() == undefined ){
                    alert('Please specify the Finally Implemented Solution !');
                    return false ;
                }

                return true ;

            }

            var clkFinally_implemented_soln = function(obj){

                $parent = $(obj).parent();

                $('#tab_probable_soln tr').each(function(index,element){
                    if( parseInt($(this).attr('id').substring(17),10) > 0 ){
                        $(element).children().each(function(index2,element2){
                            //alert($(element2).get(0).tagName)
                            if( index2 == 1 ){
                                if( !$parent.is($(element2)) ){
                                    $(element2).html("<input type='radio' name='hFinally_implemented_soln' value=\"\" onclick='clkFinally_implemented_soln(this)'/>");
                                }else{
                                    $(element2).html("<input type='radio' name='hFinally_implemented_soln' value=\"\" checked onclick='clkFinally_implemented_soln(this)'/>Date of implementation <input type='text' name='sDate_of_implementation' id='sDate_of_implementation' size='8' onclick='sel_date_cls(\"f1.sDate_of_implementation\",\"js/\")' value=''/>");
                                    $('#sDate_of_implementation').val($('#hDate_of_implementation').val());
                                }
                            }

                        });

                        /*json_probable_soln.push({
                            iRow : iRow,
                            sProbable_soln : sProbable_soln
                        });*/
                        //alert($('element > td > select').val());
                        /*$("element").find('text').each(function(index2,element2){
                              alert();
                          });*/
                    }
                });

                //$(obj).after('Date of implementation <input type="text" name="sDate_of_implementation" id="sDate_of_implementation" size="8" onclick="sel_date_cls(\'f1.sDate_of_implementation\',\'js/\')" value=""/>')
                return true ;
            }

            var chkDate_of_implementation = function(){

                if( myTrim(f1.sDate_of_implementation.value) == '' ){
                    alert('Date of implementation field can not be left blank !');
                    f1.sDate_of_implementation.focus();
                    f1.sDate_of_implementation.select();
                    return false ;
                }

                return true ;

            }

            var chkPicture_improvement = function(){

                if( f1.sNoFl_2.value == 0 ){
                    alert('Please upload atleast one Picture showing application of solution for improvement !')
                    return false ;
                }
                return true ;
            }

            var chkAft_picture = function(){
                if( f1.sAft_picture.value == '' ){
                    alert('Picture showing application of solution for improvement to be considered for future.');
                    f1.sAft_picture.focus();
                    return false ;
                }
                return true ;
            }

            var validate_form_block4 = function(){

                document.f1.hStatus_block4.value = '0';

                if( chkProbable_soln() ){}
                else{
                    document.f1.hStatus_block4.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkFinally_implemented_soln() ){}
                else{
                    document.f1.hStatus_block4.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkDate_of_implementation() ){}
                else{
                    document.f1.hStatus_block4.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkConsider_for_best_soln() ){}
                else{
                    document.f1.hStatus_block4.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkOther_soln_val() ){}
                else{
                    document.f1.hStatus_block4.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkOther_soln_val_none() ){}
                else{
                    document.f1.hStatus_block4.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkInnovative() ){}
                else{
                    document.f1.hStatus_block4.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkUniqueness() ){}
                else{
                    document.f1.hStatus_block4.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkScope_of_replicability() ){}
                else{
                    document.f1.hStatus_block4.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkPicture_improvement() ){}
                else{
                    document.f1.hStatus_block4.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkAft_picture() ){}
                else{
                    document.f1.hStatus_block4.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                document.f1.hStatus_block4.value = '1';

                if( f1.hValidation_typ.value == 'all' ){
                    validate_form_block5();
                }else{
                    alert('Validation Successful for Block D. Solution finding and implementation');
                }

                return true ;
            }

            var clkOther_soln = function(){

                $('#td_other_soln').remove();
                $('#sConsider_for_best_soln').attr('colspan',3);

                if( $('input[name="sOther_soln"]')[0].checked == true ){
                    $('input[name="sValidate_thru_experiment"]')[0].checked = false;
                    $('input[name="sValidate_thru_experiment"]')[0].disabled = true;
                    $('input[name="sEasier_to_implement"]')[0].checked = false;
                    $('input[name="sEasier_to_implement"]')[0].disabled = true;
                    $('input[name="sLow_cost"]')[0].checked = false;
                    $('input[name="sLow_cost"]')[0].disabled = true;
                    $('input[name="sMin_conflict_oth_interest"]')[0].checked = false;
                    $('input[name="sMin_conflict_oth_interest"]')[0].disabled = true;
                    $('input[name="sFavour_impact_ehs"]')[0].checked = false;
                    $('input[name="sFavour_impact_ehs"]')[0].disabled = true;

                    $('#sConsider_for_best_soln').after('<td id="td_other_soln" valign="top" colspan="2">'
                        +      '<span>What prompted you to select the final solution ?</span>'
                        +      '<select name="sOther_soln_val" id="sOther_soln_val" onchange="chngOther_soln_val();">'
                        +      '<option value="">Select'
                        +      '<option value="1">Favourable Impact on Customer'
                        +      '<option value="2">Impact of bottomline'
                        +      '<option value="3">Favourable Impact on Brand'
                        +      '<option value="4">None of the above'
                        +      '</select>');
                    $('#sConsider_for_best_soln').attr('colspan',1);
                    //$('#sOther_soln_val').val($('#hOther_soln_val').val());
                    document.getElementById("sOther_soln_val").value = $('#hOther_soln_val').val();
                    chngOther_soln_val();
                }else{
                    $('input[name="sValidate_thru_experiment"]')[0].disabled = false;
                    $('input[name="sEasier_to_implement"]')[0].disabled = false;
                    $('input[name="sLow_cost"]')[0].disabled = false;
                    $('input[name="sMin_conflict_oth_interest"]')[0].disabled = false;
                    $('input[name="sFavour_impact_ehs"]')[0].disabled = false;
                }

                return true ;

            }
              
            var chngOther_soln_val = function(){
                $('#spanOther_soln_val_none').remove();
                if( $('#sOther_soln_val').val() == '4' ){
                    $('#sOther_soln_val').after('<span id="spanOther_soln_val_none">Please Specify<br/><input type="text" name="sOther_soln_val_none" id="sOther_soln_val_none" size="50" maxlength="50"/></span>');
                    $('#sOther_soln_val_none').val($('#hOther_soln_val_none').val());
                }
                return true ;
            }

            var clkInnovative_none = function(){

                if( $('input[name="sInnovative_none"]')[0].checked == true ){
                    $('input[name="sInnovative_place"]')[0].checked = false;
                    $('input[name="sInnovative_place"]')[0].disabled = true;
                    $('input[name="sInnovative_place"]')[1].checked = false;
                    $('input[name="sInnovative_place"]')[1].disabled = true;
                    $('input[name="sInnovative_place"]')[2].checked = false;
                    $('input[name="sInnovative_place"]')[2].disabled = true;
                }else{
                    $('input[name="sInnovative_place"]')[0].disabled = false;
                    $('input[name="sInnovative_place"]')[1].disabled = false;
                    $('input[name="sInnovative_place"]')[2].disabled = false;
                }

                return true ;

            }

            /*--------------------------------------------------------Validation of Block - 4 ---------------------------------------------------------------------------*/

            /*--------------------------------------------------------Validation of Block - 5 ---------------------------------------------------------------------------*/

            var chkPrfmnce = function(){

                var id = 0 ;
                $('#tab_prfmnce tr').each(function(index,element){
                    if( $(this).attr('id') != undefined && $(this).attr('id') != 'tr_prfmnce' && $(this).attr('id').substring(0,10) == 'tr_prfmnce' ){
                        id = $(this).attr('id').substring(11);
                    }
                });
	
                if( id == 0 ){
                    alert('Please Mention atleast one Performance of parameters & Unit of Measures !')
                    return false ;
                }
                var bFlag = 1 ;
                $('#tab_prfmnce tr').each(function(index,element){
                    if( $(this).attr('id') != undefined && $(this).attr('id') != 'tr_prfmnce' && $(this).attr('id').substring(0,10) == 'tr_prfmnce' ){
                        $(element).children().each(function(index2,element2){
                            //alert($(element2).get(0).tagName)
                            if( index2 == 0 ){
                                if( $(element2).find('select').val() == '' ){
                                    alert('Please select a Item !');
                                    $(element2).find('select').focus();
                                    bFlag = 0 ;
                                    return false;
                                }
                            }else if( index2 == 1 ){
                                if( myTrim($(element2).find('input').val()) == '' ){
                                    alert('Please input some Improvement Parameter !');
                                    $(element2).find('input').focus();
                                    $(element2).find('input').select();
                                    bFlag = 0 ;
                                    return false;
                                }
                            }else if( index2 == 2 ){
                                if( myTrim($(element2).find('input').val()) == '' ){
                                    alert('Please input an Unit of Measurement !');
                                    $(element2).find('input').focus();
                                    $(element2).find('input').select();
                                    bFlag = 0 ;
                                    return false;
                                }
                            }/*else if( index2 == 3 ){
                                if( myTrim($(element2).find('input').val()) == '' ){
                                    alert('Please input Before field !');
                                    $(element2).find('input').focus();
                                    $(element2).find('input').select();
                                    bFlag = 0 ;
                                    return false;
                                }
                            }*/else if( index2 == 4 ){
                                if( myTrim($(element2).find('input').val()) == '' ){
                                    alert('Please input After field !');
                                    $(element2).find('input').focus();
                                    $(element2).find('input').select();
                                    bFlag = 0 ;
                                    return false;
                                }
                            }

                        });
                        if(bFlag == 0)return false;
                    }
                });

                if( bFlag == 0 )return false;

                return true ;
            }

            var add_row_prfmnce = function(){

                var id = 0 ;
                $('#tab_prfmnce tr').each(function(index,element){
                    if( $(this).attr('id') != undefined && $(this).attr('id') != 'tr_prfmnce' && $(this).attr('id').substring(0,10) == 'tr_prfmnce' ){
                        id = $(this).attr('id').substring(11);
                    }
                });//alert(id)

                if( id == 0 ){

                    $('#tr_prfmnce').after("<tr style='text-align: left' id='tr_prfmnce_1'>"
                        +  "<td>"
                        +  "<select name='sPrfmnce_param_item' id='sPrfmnce_param_item'>"
                        +  "<option value='1'>Resource Optimisation</option>"
                        +  "<option value='2'>Cycle Time Saving</option>"
                        +  "<option value='3'>Loss Reduction</option>"
                        +  "<option value='4'>Environment(incl Green)</option>"
                        +  "<option value='5'>Safety Environment</option>"
                        +  "<option value='6'>Health improvement</option>"
                        +  "</select>"
                        +  "</td>"
                        +  "<td><input type='text' maxlength='50'/></td>"
                        +  "<td><input type='text' maxlength='30' /></td>"
                        +  "<td><input type='text' maxlength='30' /></td>"
                        +  "<td><input type='text' maxlength='30' /></td>"
                        +  "<td><img name='' src='Pics/Order/minus_1.png' style='width : 20px ; height : 20px ; cursor : pointer' onclick = 'del_row_prfmnce("+(parseInt(id,10)+1)+");'/></td>"
                        +  "</tr>");

                }else{

                    $('#tr_prfmnce_'+id).after("<tr style='text-align: left' id='tr_prfmnce_"+(parseInt(id,10)+1)+"'>"
                        +  "<td>"
                        +  "<select name='sPrfmnce_param_item' id='sPrfmnce_param_item'>"
                        +  "<option value='1'>Resource Optimisation</option>"
                        +  "<option value='2'>Cycle Time Saving</option>"
                        +  "<option value='3'>Loss Reduction</option>"
                        +  "<option value='4'>Environment(incl Green)</option>"
                        +  "<option value='5'>Safety Environment</option>"
                        +  "<option value='6'>Health improvement</option>"
                        +  "</select>"
                        +  "</td>"
                        +  "<td><input type='text' /></td>"
                        +  "<td><input type='text' /></td>"
                        +  "<td><input type='text' /></td>"
                        +  "<td><input type='text' /></td>"
                        +  "<td><img name='' src='Pics/Order/minus_1.png' style='width : 20px ; height : 20px ; cursor : pointer' onclick = 'del_row_prfmnce("+(parseInt(id,10)+1)+");'/></td>"
                        +  "</tr>");

                }

                return (parseInt(id,10)+1) ;


            }

            var del_row_prfmnce = function(id){

                //alert(id);
                $('#tr_prfmnce_'+id).remove();
                return true ;
            }

            var get_dtls = function(){
                var json_prfmnce = [];
                var iRow = 0 ;
                var iCol = 0 ;
                $('#tab_prfmnce tr').each(function(index,element){
                    if( $(this).attr('id') != 'tr_prfmnce' && $(this).attr('id') != 'tr_benefit_improve_continue' ){
                        iRow++;
                          
                        $(element).children().each(function(index2,element2){
                            //alert($(element2).get(0).tagName)
                            if( index2 == 0 ){
                                sItem = $(element2).find('select').val();
                            }else if( index2 == 1 ){
                                sImprove_param = $(element2).find('input').val();
                            }else if( index2 == 2 ){
                                sUom = $(element2).find('input').val();
                            }else if( index2 == 3 ){
                                sBefore = $(element2).find('input').val();
                            }else if( index2 == 4 ){
                                sAfter = $(element2).find('input').val();
                            }

                        });

                        json_prfmnce.push({
                            iRow : iRow,
                            sItem : sItem,
                            sImprove_param : sImprove_param,
                            sUom : sUom,
                            sBefore : sBefore,
                            sAfter : sAfter
                        });
                        //alert($('element > td > select').val());
                        /*$("element").find('text').each(function(index2,element2){
                              alert();
                          });*/
                    }
                });

                alert(JSON.stringify(json_prfmnce));
                //alert(_trackJs.serialize(json_prfmnce));

                return true ;
 
            }

            var chkBenefit_of_improve_continue = function(){
                if( $("input[name='sBenefit_of_improve_continue']:checked").val() == undefined ){
                    alert('Benefits of Improvement still continuing ? Please specify !');
                    return false ;
                }

                return true ;
            }

            var clkBenefit_of_improve_continue = function(){

                $('#spanCost_savings_investment').remove();
                $('#spanSaving_potential').remove();
                $('#spanCost_of_investment_reqd').remove();
                $('#spanRoi_calculated').remove();
                $('#spanAttach_cost_sheet').remove();
                $('#tab_attach_cost_sheet').remove();
                $('#spanNet_savings').remove();

                if( $('input[name="sBenefit_of_improve_continue"]')[0].checked == true ){//Y

                    $('#spanBenefit_of_improve_continue').after("<span id='spanCost_savings_investment'><br/>Cost savings out of this investment(Till date)(INR) <input type='text' name='sCost_savings_investment' id='sCost_savings_investment' style='text-align : right' onkeyup='if(window.event.keyCode == 13){genAttach_cost_sheet();}'/></span>");
                    $('#spanCost_savings_investment').after("<span id='spanSaving_potential'><br/>Saving potential for the Financial Year(INR) " + " <input type='text' name='sSaving_potential' id='sSaving_potential' style='text-align : right' onkeyup='if(window.event.keyCode == 13){genAttach_cost_sheet();}'/></span>");
                    $('#spanSaving_potential').after("<span id='spanCost_of_investment_reqd'><br/>Have you incurred any cost (Cost of purchase/hiring) for this Kaizen ?  <input type='radio' name='sCost_of_investment_reqd' value='Y' onclick='clkCost_of_investment_reqd();'/> Y <input type='radio' name='sCost_of_investment_reqd' value='N' onclick='clkCost_of_investment_reqd();'/> N</span>");

                    $('#sCost_savings_investment').val($('#hCost_savings_investment').val());
                    $('#sSaving_potential').val($('#hSaving_potential').val());

                    if( f1.hCost_of_investment_reqd.value == 'Y' ){
                        $('input[name="sCost_of_investment_reqd"]')[0].checked = true ;
                    }else if( f1.hCost_of_investment_reqd.value == 'N' ){
                        $('input[name="sCost_of_investment_reqd"]')[1].checked = true ;
                    }
                    
                    clkCost_of_investment_reqd();
                    
                }else if( $('input[name="sBenefit_of_improve_continue"]')[1].checked == true  ){

                    $('#spanBenefit_of_improve_continue').after("<span id='spanCost_savings_investment'><br/>Cost savings out of this investment(Till date)(INR) <input type='text' name='sCost_savings_investment' id='sCost_savings_investment' style='text-align : right' onkeyup='if(window.event.keyCode == 13){genAttach_cost_sheet();}'/></span>");
                    $('#spanCost_savings_investment').after("<span id='spanNet_savings'><br/>Net savings achieved for this improvement(INR) <input type='text' name='sNet_savings' id='sNet_savings' style='text-align : right' onkeyup='if(window.event.keyCode == 13){genAttach_cost_sheet();}'/></span>");
                    $('#sCost_savings_investment').val($('#hCost_savings_investment').val());
                    $('#sNet_savings').val($('#hNet_savings').val());
                    genAttach_cost_sheet();
                }

                

                return true ;
            }

            var chkCost_of_investment_reqd = function(){
                if( $("input[name='sCost_of_investment_reqd']:checked").val() == undefined ){
                    alert('Cost of Investment (Cost of purchase/hiring) required ? Please specify !');
                    return false ;
                }

                return true ;
            }

            var clkCost_of_investment_reqd = function(){

                $('#spanRoi_calculated').remove();
                $('#spanAttach_cost_sheet').remove();
                $('#tab_attach_cost_sheet').remove();

                if( $('input[name="sCost_of_investment_reqd"]')[0].checked == true ){

                    $('#spanCost_of_investment_reqd').after("<span id='spanRoi_calculated'><br/>Return of Investment calculated ?  <input type='radio' name='sRoi_calculated' value='Y' onclick='clkRoi_calculated();'/> Y <input type='radio' name='sRoi_calculated' value='N' onclick='clkRoi_calculated();'/> N</span>");
                    //$('#spanRoi_calculated').after("<span id='spanAttach_cost_sheet'><br/>Attach Cost calculation sheet for Cost incurred, Cost saving(till date) & Return on investment</span>");

                    if( f1.hRoi_calculated.value == 'Y' ){
                        $('input[name="sRoi_calculated"]')[0].checked = true ;
                    }else if( f1.hRoi_calculated.value == 'N' ){
                        $('input[name="sRoi_calculated"]')[1].checked = true ;
                    }
                    clkRoi_calculated();

                }else if( $('input[name="sCost_of_investment_reqd"]')[1].checked == true ){
                    genAttach_cost_sheet();
                }

                return true ;

            }

            function chkCost_savings_investment(){

                if( f1.sCost_savings_investment.value == '' )return true ;
    
                if( !isAmt( document.getElementById('sCost_savings_investment') ) )return false;


                return true;
            }

            function chkSaving_potential(){

                if( f1.sSaving_potential.value == '' )return true ;
    
                if( !isAmt( document.getElementById('sSaving_potential') ) )return false;


                return true;
            }

            function chkNet_savings(){

                if( f1.sNet_savings.value == '' )return true ;
    
                if( !isAmt( document.getElementById('sNet_savings') ) )return false;


                return true;
            }

            var chkRoi_calculated = function(){
                if( $("input[name='sRoi_calculated']:checked").val() == undefined ){
                    alert('Return of Investment calculated ? Please specify !');
                    return false ;
                }

                return true ;
            }

            var clkRoi_calculated = function(){
                genAttach_cost_sheet();
            }

            var genAttach_cost_sheet = function(){

                $('#spanAttach_cost_sheet').remove();
                $('#tab_attach_cost_sheet').remove();

                var sStmt = '';
                var attach_cost_sheet_after = '';

                if( $('input[name="sBenefit_of_improve_continue"]')[0].checked == true ){//Y

                    if( chkCost_savings_investment() ){}
                    else return false ;

                    if( chkSaving_potential() ){}
                    else return false ;

                    if( chkCost_of_investment_reqd() ){}
                    else return false ;


                    if( parseFloat(0+f1.sCost_savings_investment.value) > 0.00 ){

                        if( parseFloat(0+f1.sSaving_potential.value) > 0.00 ){

                            if( $('input[name="sCost_of_investment_reqd"]')[0].checked == true ){

                                if( chkRoi_calculated() ){}
                                else return false ;

                                if( $('input[name="sRoi_calculated"]')[0].checked == true ){
                                    sStmt = 'Attach Cost calculation sheet for Cost savings, Saving Potential, Cost incurred & Return on investment'
                                    attach_cost_sheet_after = 'spanRoi_calculated';
                                }else if( $('input[name="sRoi_calculated"]')[1].checked == true ){
                                    sStmt = 'Attach Cost calculation sheet for Cost savings, Saving Potential & Cost incurred'
                                    attach_cost_sheet_after = 'spanRoi_calculated';
                                }

                            }else if( $('input[name="sCost_of_investment_reqd"]')[1].checked == true ){
                                sStmt = 'Attach Cost calculation sheet for Cost savings & Saving Potential'
                                attach_cost_sheet_after = 'spanCost_of_investment_reqd';
                            }

                        }else{

                            if( $('input[name="sCost_of_investment_reqd"]')[0].checked == true ){

                                if( chkRoi_calculated() ){}
                                else return false ;

                                if( $('input[name="sRoi_calculated"]')[0].checked == true ){
                                    sStmt = 'Attach Cost calculation sheet for Cost savings, Cost incurred & Return on investment'
                                    attach_cost_sheet_after = 'spanRoi_calculated';
                                }else if( $('input[name="sRoi_calculated"]')[1].checked == true ){
                                    sStmt = 'Attach Cost calculation sheet for Cost savings & Cost incurred'
                                    attach_cost_sheet_after = 'spanRoi_calculated';
                                }

                            }else if( $('input[name="sCost_of_investment_reqd"]')[1].checked == true ){
                                sStmt = 'Attach Cost calculation sheet for Cost savings'
                                attach_cost_sheet_after = 'spanCost_of_investment_reqd';
                            }

                        }

                    }else{

                        if( parseFloat(0+f1.sSaving_potential.value) > 0.00 ){

                            if( $('input[name="sCost_of_investment_reqd"]')[0].checked == true ){

                                if( chkRoi_calculated() ){}
                                else return false ;

                                if( $('input[name="sRoi_calculated"]')[0].checked == true ){
                                    sStmt = 'Attach Cost calculation sheet for Saving Potential, Cost incurred & Return on investment'
                                    attach_cost_sheet_after = 'spanRoi_calculated';
                                }else if( $('input[name="sRoi_calculated"]')[1].checked == true ){
                                    sStmt = 'Attach Cost calculation sheet for Saving Potential & Cost incurred'
                                    attach_cost_sheet_after = 'spanRoi_calculated';
                                }

                            }else if( $('input[name="sCost_of_investment_reqd"]')[1].checked == true ){
                                sStmt = 'Attach Cost calculation sheet for Saving Potential'
                                attach_cost_sheet_after = 'spanCost_of_investment_reqd';
                            }

                        }else{

                            if( $('input[name="sCost_of_investment_reqd"]')[0].checked == true ){

                                if( chkRoi_calculated() ){}
                                else return false ;

                                if( $('input[name="sRoi_calculated"]')[0].checked == true ){
                                    sStmt = 'Attach Cost calculation sheet for Cost incurred & Return on investment'
                                    attach_cost_sheet_after = 'spanRoi_calculated';
                                }else if( $('input[name="sRoi_calculated"]')[1].checked == true ){
                                    sStmt = 'Attach Cost calculation sheet for Cost incurred'
                                    attach_cost_sheet_after = 'spanRoi_calculated';
                                }

                            }

                        }

                    }                                                             

                }else if( $('input[name="sBenefit_of_improve_continue"]')[1].checked == true  ){

                    if( chkCost_savings_investment() ){}
                    else return false ;

                    if( chkNet_savings() ){}
                    else return false ;

                    if( parseFloat(0+f1.sCost_savings_investment.value) > 0.00 ){

                        if( parseFloat(0+f1.sNet_savings.value) > 0.00 ){
                            sStmt = 'Attach Cost calculation sheet for Cost savings & Net Savings'
                            attach_cost_sheet_after = 'spanNet_savings';
                        }else{
                            sStmt = 'Attach Cost calculation sheet for Cost savings'
                            attach_cost_sheet_after = 'spanNet_savings';
                        }

                    }else{
                        if( parseFloat(0+f1.sNet_savings.value) > 0.00 ){
                            sStmt = 'Attach Cost calculation sheet for Net Savings'
                            attach_cost_sheet_after = 'spanNet_savings';
                        }
                    }

                }

                //$('#'+attach_cost_sheet_after).after("<span id='spanAttach_cost_sheet'><br/>Attach Cost calculation sheet for Cost incurred, Cost saving(till date) & Return on investment</span>");

                $('#'+attach_cost_sheet_after).after('<span><table width="70%" id="tab_attach_cost_sheet">'
                    +       '<tr class="thdr" id="tr_attach_cost_sheet">'
                    +       '<td colspan="2">'+sStmt+'</td>'
                    +       '</tr>'
                    +       '<tr>'
                    +       '<td valign="top" width="20%">'
                    +       '<table class="table" id="tabFl_3">'
                    +       '<thead class="table_thead">'
                    +       '<tr class="table_thead_tr">'
                    +       '<th>Del<br>Mkr.</th>'
                    +       '<th>Uploaded&nbsp;File</th>'
                    +       '</tr>'
                    +       '</thead>'
                    +       '<tbody>'
                    +       '</tbody>'
                    +       '</table>'
                    +       '<br/>'
                    +       '<center>'
                    +       '<div id="divDelFl_3" style="width: 20px; background : #000040; display:none">'
                    +       '<input type="button" value="Delete File" name="butnDelFl_3" style="background-color : #ffffff" onclick="delFl(\'cost\');">'
                    +       '</div>'
                    +       '</center>'
                    +       '</td>'
                    +       '<td valign="top" width="30%">'
                    +       '<iframe id ="iFrameUpldFl_3" name ="iFrameUpldFl_3" src="ipicms_upldFl.jsp?sContestId='+f1.sContestId.value+'&sIpAddr='+f1.sIpAddr.value+'&sTyp=cost" height="140px" width="350px" frameborder="0">'
                    +       '</iframe>'
                    +       '</td>'
                    +       '</tr>'
                    +       '</table></span>');

                return true ;

            }

            var validate_form_block5 = function(){

                document.f1.hStatus_block5.value = '0';

                if( chkPrfmnce() ){}
                else{
                    document.f1.hStatus_block5.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( chkBenefit_of_improve_continue() ){}
                else{
                    document.f1.hStatus_block5.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                if( $('input[name="sBenefit_of_improve_continue"]')[0].checked == true ){

                    if( chkCost_savings_investment() ){}
                    else return false ;

                    if( chkSaving_potential() ){}
                    else return false ;

                    if( chkCost_of_investment_reqd() ){}
                    else{
                        document.f1.hStatus_block5.value = '0';
                        f1.hValidation_typ.value = '';
                        return false ;
                    }

                    if( $('input[name="sCost_of_investment_reqd"]')[0].checked == true ){
                        if( chkRoi_calculated() ){}
                        else{
                            document.f1.hStatus_block5.value = '0';
                            f1.hValidation_typ.value = '';
                            return false ;
                        }
                    }
                }else if( $('input[name="sBenefit_of_improve_continue"]')[1].checked == true ){
                    if( chkCost_savings_investment() ){}
                    else return false ;

                    if( chkNet_savings() ){}
                    else return false ;
                }

                genAttach_cost_sheet();

                document.f1.hStatus_block5.value = '1';

                if( f1.hValidation_typ.value == 'all' ){
                    validate_form_block6();
                }else{
                    alert('Validation Successful for Block E. Results achieved (Due to this improvement)');
                }


                return true ;
            }
           

            /*--------------------------------------------------------Validation of Block - 5 ---------------------------------------------------------------------------*/

            /*--------------------------------------------------------Validation of Block - 6 ---------------------------------------------------------------------------*/

            var chkTitle = function(){

                if( myTrim(f1.sTitle.value) == '' ){
                    alert('Title field can not be left blank/only space !');
                    f1.sTitle.focus();
                    f1.sTitle.select();
                    return false ;
                }
                var html1 = $('#div_countdown_title').html();
                var index1 = html1.indexOf('Remaining');
                var index2 = html1.indexOf('chars');
                var no_of_char = myTrim(html1.substring(index1+9,index2)); 
                
                if( parseInt(no_of_char,10) < 0 ){
                    alert('You have entered more than maximum allowable characters(135) for Title field !');
                    $('#sTitle').focus();
                    $('#sTitle').select();
                    return false;
                }

                return true ;
            }

            var validate_form_block6 = function(){

                document.f1.hStatus_block6.value = '0';

                if( chkTitle() ){}
                else{
                    document.f1.hStatus_block6.value = '0';
                    f1.hValidation_typ.value = '';
                    return false ;
                }

                document.f1.hStatus_block6.value = '1';

                if( f1.hValidation_typ.value == 'all' ){
                    if(chkSStDt() && chkSEndDt() && chkSStDtEndDt() && chkSContestMnthYr()){
                    }else{
                        f1.hValidation_typ.value = '';
                        return false;
                    }
                    if( f1.sContestId.value == '' ){
                        f1.sCallNm.value="insIpicms";
                    }else{
                        f1.sCallNm.value="updIpicms";
                    }
                    f1.sClick_btn_name.value = 'edit_btn';
                    submit_form();
                }else{
                    alert('Validation Successful for Block F. Title for the Kaizen');
                }

            }

            /*--------------------------------------------------------Validation of Block - 6 ---------------------------------------------------------------------------*/


            function showMsg(){

                if(sMsg.value != ''){

                    alert(sMsg.value);
                }
                return true;
            }


            function getPicFlNms(sTyp){

                var iTabNo ;
                var sTypTmp;

                if( sTyp != 'all' ){

                    if(sTyp == 'bef'){
                        iTabNo = 1;
                    }else if(sTyp == 'aft'){
                        iTabNo = 2;
                    }else if(sTyp == 'cost'){
                        iTabNo = 3;
                    }else if(sTyp == 'cause'){
                        iTabNo = 4;
                        document.getElementById("sNoFl_" + iTabNo + '_w').value = 0 ;
                        document.getElementById("sNoFl_" + iTabNo + '_p').value = 0 ;
                        document.getElementById("sNoFl_" + iTabNo + '_f').value = 0 ;
                        document.getElementById("sNoFl_" + iTabNo + '_wp').value = 0 ;
                        document.getElementById("sNoFl_" + iTabNo + '_wf').value = 0 ;
                        document.getElementById("sNoFl_" + iTabNo + '_pf').value = 0 ;
                        document.getElementById("sNoFl_" + iTabNo + '_wpf').value = 0 ;
                    }

                    tab = document.getElementById("tabFl_" + iTabNo);

                    for(i = tab.rows.length - 1 ; i >= 1 ; i--){
                        tab.deleteRow(i);
                    }

                    document.getElementById("sNoFl_" + iTabNo).value = 0 ;

                }else{

                    for( var j = 1 ; j <= 4 ; j++ ){
                        if( $("#tabFl_" + iTabNo).length != 0 ){
                            iTabNo = j;

                            tab = document.getElementById("tabFl_" + iTabNo);

                            for(i = tab.rows.length - 1 ; i >= 1 ; i--){
                                tab.deleteRow(i);
                            }

                            document.getElementById("sNoFl_" + iTabNo).value = 0 ;

                        }
                    }
                    iTabNo = 4 ;
                    document.getElementById("sNoFl_" + iTabNo + '_w').value = 0 ;
                    document.getElementById("sNoFl_" + iTabNo + '_p').value = 0 ;
                    document.getElementById("sNoFl_" + iTabNo + '_f').value = 0 ;
                    document.getElementById("sNoFl_" + iTabNo + '_wp').value = 0 ;
                    document.getElementById("sNoFl_" + iTabNo + '_wf').value = 0 ;
                    document.getElementById("sNoFl_" + iTabNo + '_pf').value = 0 ;
                    document.getElementById("sNoFl_" + iTabNo + '_wpf').value = 0 ;
                }

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

                        if( sTyp != 'all' ){

                            //myval = PicFlXML.responseXML.getElementsByTagName("IPICMSPIC_"+sTyp);
                            //alert(f1.sNoFl.value);
                            //alert(myval.length)

                            if( sTyp == 'cause' ){

                                var sSub_typ = ['w','p','f','wp','wf','pf','wpf','n'];

                                for( j = 0 ; j < sSub_typ.length ; j++ ){
                                    myval = PicFlXML.responseXML.getElementsByTagName("IPICMSPIC_"+sTyp+"_"+sSub_typ[j]);

                                    for(var i = 1 ; i <= myval.length ; i++){
                                        var cell = myval[i-1].childNodes[0].nodeValue;
                                        var cell1 = cell.substring(0,cell.indexOf("|"));
                                        var cell2 = cell.substring(cell.indexOf("|")+1);
                                        //alert(cell);
                                        document.getElementById("sNoFl_"+iTabNo).value = parseInt(document.getElementById("sNoFl_"+iTabNo).value,10) + 1;                                        
                                        document.getElementById("sNoFl_"+iTabNo+"_"+sSub_typ[j]).value = parseInt(document.getElementById("sNoFl_"+iTabNo+"_"+sSub_typ[j]).value,10) + 1;
                                        tr = tab.insertRow(parseInt(document.getElementById("sNoFl_"+iTabNo).value));
                                        td = tr.insertCell(tr.cells.length);
                                        td.className = 'table_tbody_tr_td'
                                        td.innerHTML = "<input type = 'checkbox' name='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' id='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' size='10' onclick='visDivDelFl(this.id)'/>"

                                        td = tr.insertCell(tr.cells.length);
                                        td.className = 'table_tbody_tr_td'
                                        //td.innerHTML = "<input type = 'text' name='sFlNm" + "_" + document.getElementById("sNoFl").value + "' id='sFlNm" + "_" + document.getElementById("sNoFl").value + "' size='35' value='" + cell + "' onclick='showFl(this.id)' style='cursor : pointer' />"
                                        //td.innerHTML = "<a id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_"+iTabNo).value + "' href='http://localhost:8080/genorbl/IpicmsUpldPdf/" + cell2 + "' target='_blank'>"+cell1+"</a>";
                                        td.innerHTML = "<a id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_"+iTabNo).value + "' href='http://itweb:54844/genorbl/IpicmsUpldPdf/" + cell2 + "' target='_blank'>"+cell1+"</a>";
                                        //td.innerHTML = "<a id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_"+iTabNo).value + "' href='http://10.50.82.60:8080/genorbl/IpicmsUpldPdf/" + cell2 + "' target='_blank'>"+cell1+"</a>";

                                    }//for


                                }//for

                            }else{//sTyp != cause
                                myval = PicFlXML.responseXML.getElementsByTagName("IPICMSPIC_"+sTyp);
                                if( sTyp == 'bef' ){
                                    if( myval.length <= 1 ){
                                        $('#sBef_picture').children('option').remove();
                                    }else{
                                        //$('#sBef_picture').children('option:not(:first)').remove();
                                        $('#sBef_picture').children('option').remove();
                                        $("#sBef_picture").append('<option value="">Select</option>');
                                    }
                                }else if( sTyp == 'aft' ){
                                    if( myval.length <= 1 ){
                                        $('#sAft_picture').children('option').remove();
                                    }else{
                                        //$('#sBef_picture').children('option:not(:first)').remove();
                                        $('#sAft_picture').children('option').remove();
                                        $("#sAft_picture").append('<option value="">Select</option>');
                                    }
                                }
                                for(var i = 1 ; i <= myval.length ; i++){
                                    var cell = myval[i-1].childNodes[0].nodeValue;
                                    var cell1 = cell.substring(0,cell.indexOf("|"));
                                    var cell2 = cell.substring(cell.indexOf("|")+1);
                                    //alert(cell);
                                    document.getElementById("sNoFl_"+iTabNo).value = parseInt(document.getElementById("sNoFl_"+iTabNo).value,10) + 1;
                                    tr = tab.insertRow(parseInt(document.getElementById("sNoFl_"+iTabNo).value));
                                    td = tr.insertCell(tr.cells.length);
                                    td.className = 'table_tbody_tr_td'
                                    td.innerHTML = "<input type = 'checkbox' name='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' id='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' size='10' onclick='visDivDelFl(this.id)'/>"

                                    td = tr.insertCell(tr.cells.length);
                                    td.className = 'table_tbody_tr_td'
                                    //td.innerHTML = "<input type = 'text' name='sFlNm" + "_" + document.getElementById("sNoFl").value + "' id='sFlNm" + "_" + document.getElementById("sNoFl").value + "' size='35' value='" + cell + "' onclick='showFl(this.id)' style='cursor : pointer' />"
                                    //td.innerHTML = "<a id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_"+iTabNo).value + "' href='http://localhost:8080/genorbl/IpicmsUpldPdf/" + cell2 + "' target='_blank'>"+cell1+"</a>";
                                    td.innerHTML = "<a id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_"+iTabNo).value + "' href='http://itweb:54844/genorbl/IpicmsUpldPdf/" + cell2 + "' target='_blank'>"+cell1+"</a>";
                                    //td.innerHTML = "<a id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_"+iTabNo).value + "' href='http://10.50.82.60:8080/genorbl/IpicmsUpldPdf/" + cell2 + "' target='_blank'>"+cell1+"</a>";

                                    if( sTyp == 'bef' ){
                                        $("#sBef_picture").append('<option value="'+cell2+'">'+cell1+'</option>');
                                    }else if( sTyp == 'aft' ){
                                        $("#sAft_picture").append('<option value="'+cell2+'">'+cell1+'</option>');
                                    }

                                }

                                if( sTyp == 'bef' ){
                                    if( f1.sContestId.value != ''){
                                        if( myval.length > 1 ){
                                            $('#sBef_picture').val($('#hBef_picture').val());
                                        }
                                    }
                                }else if( sTyp == 'aft' ){
                                    if( f1.sContestId.value != ''){
                                        if( myval.length > 1 ){
                                            $('#sAft_picture').val($('#hAft_picture').val());
                                        }
                                    }
                                }


                            }//if-else

                        }else{

                            //$('#sBef_picture').children('option:not(:first)').remove();
                            //$('#sAft_picture').children('option:not(:first)').remove();

                            for( var j = 1 ; j <= 4 ; j++ ){
                                iTabNo = j ;

                                if( iTabNo == 1 ){
                                    sTypTmp = 'bef';
                                }else if( iTabNo == 2 ){
                                    sTypTmp = 'aft';
                                }else if( iTabNo == 3 ){
                                    sTypTmp = 'cost';
                                }else if( iTabNo == 4 ){
                                    sTypTmp = 'cause';
                                }
                                tab = document.getElementById("tabFl_" + iTabNo);

                                if( $("#tabFl_" + iTabNo).length != 0 ){

                                    if( sTypTmp == 'cause' ){

                                        var sSub_typ = ['w','p','f','wp','wf','pf','wpf','n'];

                                        for( j = 0 ; j < sSub_typ.length ; j++ ){
                                            myval = PicFlXML.responseXML.getElementsByTagName("IPICMSPIC_"+sTypTmp+"_"+sSub_typ[j]);

                                            for(var i = 1 ; i <= myval.length ; i++){
                                                var cell = myval[i-1].childNodes[0].nodeValue;
                                                var cell1 = cell.substring(0,cell.indexOf("|"));
                                                var cell2 = cell.substring(cell.indexOf("|")+1);
                                                //alert(cell);
                                                document.getElementById("sNoFl_"+iTabNo).value = parseInt(document.getElementById("sNoFl_"+iTabNo).value,10) + 1;
                                                document.getElementById("sNoFl_"+iTabNo+"_"+sSub_typ[j]).value = parseInt(document.getElementById("sNoFl_"+iTabNo+"_"+sSub_typ[j]).value,10) + 1;
                                                tr = tab.insertRow(parseInt(document.getElementById("sNoFl_"+iTabNo).value));
                                                td = tr.insertCell(tr.cells.length);
                                                td.className = 'table_tbody_tr_td'
                                                td.innerHTML = "<input type = 'checkbox' name='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' id='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' size='10' onclick='visDivDelFl(this.id)'/>"

                                                td = tr.insertCell(tr.cells.length);
                                                td.className = 'table_tbody_tr_td'
                                                //td.innerHTML = "<input type = 'text' name='sFlNm" + "_" + document.getElementById("sNoFl").value + "' id='sFlNm" + "_" + document.getElementById("sNoFl").value + "' size='35' value='" + cell + "' onclick='showFl(this.id)' style='cursor : pointer' />"
                                                //td.innerHTML = "<a id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_"+iTabNo).value + "' href='http://localhost:8080/genorbl/IpicmsUpldPdf/" + cell2 + "' target='_blank'>"+cell1+"</a>";
                                                td.innerHTML = "<a id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_"+iTabNo).value + "' href='http://itweb:54844/genorbl/IpicmsUpldPdf/" + cell2 + "' target='_blank'>"+cell1+"</a>";
                                                //td.innerHTML = "<a id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_"+iTabNo).value + "' href='http://10.50.82.60:8080/genorbl/IpicmsUpldPdf/" + cell2 + "' target='_blank'>"+cell1+"</a>";

                                            }//for


                                        }//for

                                    }else{//sTypTmp != cause
                                        myval = PicFlXML.responseXML.getElementsByTagName("IPICMSPIC_"+sTypTmp);
                                        if( sTypTmp == 'bef' ){
                                            if( myval.length <= 1 ){
                                                $('#sBef_picture').children('option').remove();
                                            }else{
                                                //$('#sBef_picture').children('option:not(:first)').remove();
                                                $('#sBef_picture').children('option').remove();
                                                $("#sBef_picture").append('<option value="">Select</option>');
                                            }
                                        }else if( sTypTmp == 'aft' ){
                                            if( myval.length <= 1 ){
                                                $('#sAft_picture').children('option').remove();
                                            }else{
                                                //$('#sBef_picture').children('option:not(:first)').remove();
                                                $('#sAft_picture').children('option').remove();
                                                $("#sAft_picture").append('<option value="">Select</option>');
                                            }
                                        }
                                        for(var i = 1 ; i <= myval.length ; i++){
                                            var cell = myval[i-1].childNodes[0].nodeValue;
                                            var cell1 = cell.substring(0,cell.indexOf("|"));
                                            var cell2 = cell.substring(cell.indexOf("|")+1);
                                            //alert(cell);
                                            document.getElementById("sNoFl_"+iTabNo).value = parseInt(document.getElementById("sNoFl_"+iTabNo).value,10) + 1;
                                            tr = tab.insertRow(parseInt(document.getElementById("sNoFl_"+iTabNo).value));
                                            td = tr.insertCell(tr.cells.length);
                                            td.className = 'table_tbody_tr_td'
                                            td.innerHTML = "<input type = 'checkbox' name='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' id='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' size='10' onclick='visDivDelFl(this.id)'/>"

                                            td = tr.insertCell(tr.cells.length);
                                            td.className = 'table_tbody_tr_td'
                                            //td.innerHTML = "<input type = 'text' name='sFlNm" + "_" + document.getElementById("sNoFl").value + "' id='sFlNm" + "_" + document.getElementById("sNoFl").value + "' size='35' value='" + cell + "' onclick='showFl(this.id)' style='cursor : pointer' />"
                                            //td.innerHTML = "<a id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_"+iTabNo).value + "' href='http://localhost:8080/genorbl/IpicmsUpldPdf/" + cell2 + "' target='_blank'>"+cell1+"</a>";
                                            td.innerHTML = "<a id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_"+iTabNo).value + "' href='http://itweb:54844/genorbl/IpicmsUpldPdf/" + cell2 + "' target='_blank'>"+cell1+"</a>";
                                            //td.innerHTML = "<a id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_"+iTabNo).value + "' href='http://10.50.82.60:8080/genorbl/IpicmsUpldPdf/" + cell2 + "' target='_blank'>"+cell1+"</a>";
                                            if( sTypTmp == 'bef' ){
                                                $("#sBef_picture").append('<option value="'+cell2+'">'+cell1+'</option>');
                                            }else if( sTypTmp == 'aft' ){
                                                $("#sAft_picture").append('<option value="'+cell2+'">'+cell1+'</option>');
                                            }

                                        }//for

                                        if( sTypTmp == 'bef' ){
                                            if( f1.sContestId.value != ''){
                                                if( myval.length > 1 ){
                                                    $('#sBef_picture').val($('#hBef_picture').val());
                                                }
                                            }
                                        }else if( sTypTmp == 'aft' ){
                                            if( f1.sContestId.value != ''){
                                                if( myval.length > 1 ){
                                                    $('#sAft_picture').val($('#hAft_picture').val());
                                                }
                                            }
                                        }

                                    }//if-else

                                }//if

                            }//for

                            butnDisplay();
                            if(f1.sMode.value == 'N')menuDisplay();

                            if(f1.sContestId.value == ''){lock_controls(0);someFldReadOnly();}else{lock_controls(1);}
                            if(f1.sContestId.value == ''){lock_controls_draft(0);someFldReadOnly();}else{lock_controls_draft(1);}

                        }//if-else
                        //document.getElementById("sBef_picture").value = $('#hBef_picture').val();
                        //document.getElementById("sAft_picture").value = $('#hAft_picture').val();
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
                }else if(sTyp == 'cost'){
                    iTabNo = 3;
                }else if(sTyp == 'cause'){
                    iTabNo = 4;
                }


                document.getElementById("iFrameUpldFl_" + iTabNo).src = 'ipicms_upldFl.jsp?sContestId='+f1.sContestId.value+'&sIpAddr='+f1.sIpAddr.value + "&sTyp=" + sTyp;
                if(sUpldMkr == '1'){
                    alert('File ' + sFlNm + ' Uploaded Sucessfully');
                
                    /*document.getElementById("sNoFl_" + iTabNo).value = parseInt('0'+document.getElementById("sNoFl_" + iTabNo).value,10) + 1;
                    tab = document.getElementById("tabFl_" + iTabNo);

                    tr = tab.insertRow(document.getElementById("sNoFl_" + iTabNo).value);


                    td = tr.insertCell(tr.cells.length);
                    td.className = 'table_tbody_tr_td'
                    td.innerHTML = "<input type = 'checkbox' name='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' id='sChkFl_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' size='10' onclick='visDivDelFl(this.id)'/>"

                    td = tr.insertCell(tr.cells.length);
                    td.className = 'table_tbody_tr_td'
                    td.innerHTML = "<input type = 'text' name='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' id='sFlNm_" + iTabNo + "_" + document.getElementById("sNoFl_" + iTabNo).value + "' size='15' value='" + sFlNm + "' onclick='showPdf(this.id)'/>"
                     */
                    getPicFlNms(sTyp);
                
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
                }else if(sTyp == 'cost'){
                    iTabNo = 3;
                }else if(sTyp == 'cause'){
                    iTabNo = 4;
                }

                sLstFlNm = '';
                for(i = 1 ; i <= parseInt(document.getElementById("sNoFl_" + iTabNo).value) ; i++)
                    if(document.getElementById('sChkFl_'+iTabNo+'_'+i).checked == 1){
                        //sLstFlNm = sLstFlNm + $('#sFlNm_'+iTabNo+'_'+i).attr('href').substring(44) + '|' ;
                        sLstFlNm = sLstFlNm + $('#sFlNm_'+iTabNo+'_'+i).attr('href').substring(41) + '|' ;
                        //sLstFlNm = sLstFlNm + $('#sFlNm_'+iTabNo+'_'+i).attr('href').substring(46) + '|' ;
                        //sLstFlNm = sLstFlNm + $('#sFlNm_'+iTabNo+'_'+i).attr('href').substring(44).replace(/!/g,'%21').replace(/#/g,'%23').replace(/$/g,'%24').replace(/&/g,'%26').replace(/'/g,'%27').replace(/(/g,'%28').replace(/)/g,'%29').replace(/*/g,'%2A').replace(/+/g,'%2B').replace(/,/g,'%2C').replace(/\//g,'%2F').replace(/:/g,'%3A').replace(/;/g,'%3B').replace(/=/g,'%3D').replace(/?/g,'%3F').replace(/@/g,'%40').replace(/[/g,'%5B').replace(/]/g,'%5D') + '|' ;
                    }

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
                else if(iTabNo == 3)sTyp = 'cost'
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

            function isAmt(obj){
                var amount = obj.value ;
                var name = obj.name ;

                if(amount == ""){
                    alert("Field can not be left blank !") ;
                    obj.focus() ;
                    obj.select() ;
                    return false ;
                }

                if(amount == "."){
                    alert("Please enter numeric value") ;
                    obj.focus() ;
                    obj.select() ;
                    return false ;
                }
                var myRegExp = /[^\d\.]/g ;
                var i = amount.search(myRegExp) ;
                if(i != -1){
                    alert("Please enter numeric value") ;
                    obj.focus() ;
                    obj.select() ;
                    return false ;
                }
                myRegExp = /\./g ;
                var array = amount.match(myRegExp) ;
                if( array != null && array.length > 1){
                    alert("Please enter numeric value") ;
                    obj.focus() ;
                    obj.select() ;
                    return false ;
                }
                var float_amount = parseFloat(amount) ;

                if( float_amount > 9999999999.99){
                    alert("Amount can not be larger than 999999.99") ;
                    obj.focus() ;
                    obj.select() ;
                    return false ;
                }

                obj.value = float_amount.toFixed(2) ;

                return true ;
            }
           
            var JSON = JSON || {};

            // implement JSON.stringify serialization
            JSON.stringify = JSON.stringify || function (obj) {

                var t = typeof (obj);
                if (t != "object" || obj === null) {

                    // simple data type
                    if (t == "string") obj = '"'+obj+'"';
                    return String(obj);

                }
                else {

                    // recurse array or object
                    var n, v, json = [], arr = (obj && obj.constructor == Array);

                    for (n in obj) {
                        v = obj[n]; t = typeof(v);

                        if (t == "string") v = '"'+v+'"';
                        else if (t == "object" && v !== null) v = JSON.stringify(v);

                        json.push((arr ? "" : '"' + n + '":') + String(v));
                    }

                    return (arr ? "[" : "{") + String(json) + (arr ? "]" : "}");
                }
            };

            // implement JSON.parse de-serialization
            JSON.parse = JSON.parse || function (str) {
                if (str === "") str = '""';
                eval("var p=" + str + ";");
                return p;
            };

            function myTrim(x) {
                return x.replace(/^\s+|\s+$/gm,'');
            }


        </script>
    </head>
    <body class="" background="Pics/Order/lblue047.gif" onload="if(f1.sContestId.value == ''){preScript();}else{preScript();}">
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
                    String sCallNm = request.getParameter("sCallNm");

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

                    String sIdentified_by = new String();
                    String sSymptom = new String();
                    String sWho_face_problem = new String();
                    String sLocation_problem = new String();
                    String sImprove_input = new String();
                    String sImprove_methodology = new String();
                    String sImprove_loss_reduction = new String();
                    String sImprove_process_modification = new String();
                    String sPrimary_root_cause = new String();
                    String sWhy_why_analysis = new String();
                    String sPareto_analysis = new String();
                    String sFish_bone_diagram = new String();
                    String sNone_analysis = new String();
                    String sBef_picture = new String();

                    String sValidate_thru_experiment = new String();
                    String sEasier_to_implement = new String();
                    String sLow_cost = new String();
                    String sMin_conflict_oth_interest = new String();
                    String sFavour_impact_ehs = new String();
                    String sOther_soln = new String();
                    String sOther_soln_val = new String();
                    String sOther_soln_val_none = new String();
                    String sInnovative_place = new String();
                    String sInnovative_none = new String();
                    String sUniqueness = new String();
                    String sFinally_implemented_soln = new String();
                    String sDate_of_implementation = new String();
                    String sAft_picture = new String();
                    String sScope_of_replicability = new String();
                    String sBenefit_of_improve_continue = new String();
                    String sCost_savings_investment = new String();
                    String sSaving_potential = new String();
                    String sNet_savings = new String();
                    String sCost_of_investment_reqd = new String();
                    String sRoi_calculated = new String();
                    String sForm_no = new String();
                    String sRev_date = new String();


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

                    List lstIpicms = null;
                    List lstOffNm = null;
                    List lstEmpNm = null;
                    List lstVndrCoNm = null;
                    List lstSalute = null;
                    List lstCatgTyp = null;
                    List lstVndrDesg = null;
                    List lstContestantTyp = null;

                    JSONArray json_arr = new JSONArray();
                    JSONArray json_arr_probable_soln = new JSONArray();
                    JSONObject json_obj = null;


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

                    //String dirNm = new String("E:\\Projects\\GENORBL\\IpicmsUpldPdf\\");
                    String dirNm = new String("/san304/j2eegen/GENORBL/IpicmsUpldPdf/");
                    //String dirNm = new String("/ltora/oracle64/j2ee/GENORBL/IpicmsUpldPdf/");
                    //String dirNm = new String("F:\\My Documents\\Projects\\GENORBL\\IpicmsUpldPdf\\");

                    File dir = new File(dirNm);
                    File[] flChildren = dir.listFiles();

                    for (int i = 0; i < flChildren.length; i++) {

                        if (flChildren[i].isFile() && flChildren[i].getName().startsWith(sIpAddr + "_")) {

                            flChildren[i].delete();

                        }

                    }

                    if (sContestId.equals("")) {
                        lstIpicms = null;
                        rows = null;
                        iterateOuter = null;
                        iterateInner = null;
                        lstIpicms = hRemote.getForm_info();
                        iterateOuter = lstIpicms.iterator();
                        while (iterateOuter.hasNext()) {
                            rows = (List) iterateOuter.next();

                            iterateInner = rows.iterator();
                            while (iterateInner.hasNext()) {

                                sForm_no = ((String) iterateInner.next()).trim();
                                sRev_date = ((String) iterateInner.next()).trim();
                            }
                        }
                    } else {
                        //System.out.println("111");
                        lstIpicms = null;
                        rows = null;
                        iterateOuter = null;
                        iterateInner = null;

                        lstIpicms = hRemote.getIpicmsMst(sContestId);

                        iterateOuter = lstIpicms.iterator();

                        while (iterateOuter.hasNext()) {
                            rows = (List) iterateOuter.next();

                            iterateInner = rows.iterator();

                            while (iterateInner.hasNext()) {
                                //System.out.println("222");
                                sContestIdFul = ((String) iterateInner.next()).trim();
                                sForm_no = ((String) iterateInner.next()).trim();
                                sRev_date = ((String) iterateInner.next()).trim();

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
                                //System.out.println("333");

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
                                //System.out.println("444");

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
                                //System.out.println("555");

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

                                sIdentified_by = ((String) iterateInner.next()).trim();
                                sSymptom = ((String) iterateInner.next()).trim();
                                sWho_face_problem = ((String) iterateInner.next()).trim();
                                sLocation_problem = ((String) iterateInner.next()).trim();
                                sImprove_input = ((String) iterateInner.next()).trim();
                                sImprove_methodology = ((String) iterateInner.next()).trim();
                                sImprove_loss_reduction = ((String) iterateInner.next()).trim();
                                sImprove_process_modification = ((String) iterateInner.next()).trim();
                                sPrimary_root_cause = ((String) iterateInner.next()).trim();
                                sWhy_why_analysis = ((String) iterateInner.next()).trim();
                                sPareto_analysis = ((String) iterateInner.next()).trim();
                                sFish_bone_diagram = ((String) iterateInner.next()).trim();
                                iterateInner.next();
                                iterateInner.next();
                                sNone_analysis = ((String) iterateInner.next()).trim();
                                iterateInner.next();
                                sBef_picture = ((String) iterateInner.next()).trim();


                                sValidate_thru_experiment = ((String) iterateInner.next()).trim();
                                sEasier_to_implement = ((String) iterateInner.next()).trim();
                                sLow_cost = ((String) iterateInner.next()).trim();
                                sMin_conflict_oth_interest = ((String) iterateInner.next()).trim();
                                sFavour_impact_ehs = ((String) iterateInner.next()).trim();
                                sOther_soln = ((String) iterateInner.next()).trim();
                                sOther_soln_val = ((String) iterateInner.next()).trim();
                                sOther_soln_val_none = ((String) iterateInner.next()).trim();
                                sInnovative_place = ((String) iterateInner.next()).trim();
                                iterateInner.next();
                                iterateInner.next();
                                iterateInner.next();
                                sInnovative_none = ((String) iterateInner.next()).trim();
                                sUniqueness = ((String) iterateInner.next()).trim();
                                iterateInner.next();
                                iterateInner.next();
                                iterateInner.next();
                                iterateInner.next();
                                sFinally_implemented_soln = ((String) iterateInner.next()).trim();
                                sDate_of_implementation = ((String) iterateInner.next()).trim();
                                sAft_picture = ((String) iterateInner.next()).trim();
                                sScope_of_replicability = ((String) iterateInner.next()).trim();
                                iterateInner.next();
                                iterateInner.next();
                                iterateInner.next();
                                sBenefit_of_improve_continue = ((String) iterateInner.next()).trim();
                                sCost_savings_investment = ((String) iterateInner.next()).trim();
                                sSaving_potential = ((String) iterateInner.next()).trim();
                                sNet_savings = ((String) iterateInner.next()).trim();
                                sCost_of_investment_reqd = ((String) iterateInner.next()).trim();
                                iterateInner.next();
                                sRoi_calculated = ((String) iterateInner.next()).trim();

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

                        List lstIpicmsPrfmnce = null;
                        rows = null;
                        iterateOuter = null;
                        iterateInner = null;
                        i = 0;

                        lstIpicmsPrfmnce = hRemote.getIpicmsPrfmnce(sContestId);

                        iterateOuter = lstIpicmsPrfmnce.iterator();

                        while (iterateOuter.hasNext()) {
                            i++;
                            json_obj = new JSONObject();
                            rows = (List) iterateOuter.next();

                            iterateInner = rows.iterator();

                            while (iterateInner.hasNext()) {
                                json_obj.put("sItem", (String) iterateInner.next());
                                json_obj.put("sImprove_param", (String) iterateInner.next());
                                json_obj.put("sUom", (String) iterateInner.next());
                                json_obj.put("sBefore", (String) iterateInner.next());
                                json_obj.put("sAfter", (String) iterateInner.next());
                            }
                            json_arr.add(json_obj);

                        }

                        List lstIpicmsProbable_soln = null;
                        rows = null;
                        iterateOuter = null;
                        iterateInner = null;
                        i = 0;

                        lstIpicmsProbable_soln = hRemote.getIpicmsProbable_soln(sContestId);

                        iterateOuter = lstIpicmsProbable_soln.iterator();

                        while (iterateOuter.hasNext()) {
                            i++;
                            json_obj = new JSONObject();
                            rows = (List) iterateOuter.next();

                            iterateInner = rows.iterator();

                            while (iterateInner.hasNext()) {
                                json_obj.put("sProbable_soln", (String) iterateInner.next());
                            }
                            json_arr_probable_soln.add(json_obj);

                        }

                    }

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
            <table width="60%">
                <tr>
                    <td style="background-color : mediumblue">
                        <b><font face="Times New Roman" size="5" color="#ffffff">KAIZEN&nbsp;&nbsp;&nbsp;CONTEST&nbsp;&nbsp;&nbsp;FORM&nbsp;&nbsp;&nbsp;ENTRY&nbsp;&nbsp;&nbsp;SCREEN</font></b>
                    </td>
                    <td style="background-color : mediumblue">
                        <b><font face="Times New Roman" size="4" color="#ffffff">Form No. <%= sForm_no%><br/>Rev. <%= sRev_date%></font></b>
                    </td>
                </tr>
            </table>

            <fieldset>
                <!--center><legend><b><font face="Times New Roman" size="5" color="#ffffff">KAIGEN&nbsp;&nbsp;&nbsp;CONTEST&nbsp;&nbsp;&nbsp;FORM&nbsp;&nbsp;&nbsp;ENTRY&nbsp;&nbsp;&nbsp;SCREEN</font></b></b></legend></center-->
                <form method="post" action="IpicmsProcessServlet" name="f1" onsubmit="return validate()" >
                    <input type="hidden" name="sCallNm" value="<%= sCallNm%>">
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

                    <input type="hidden" name="sNoFl_1" id="sNoFl_1" value="0" />
                    <input type="hidden" name="sNoFl_2" id="sNoFl_2" value="0" />
                    <input type="hidden" name="sNoFl_3" id="sNoFl_3" value="0" />
                    <input type="hidden" name="sNoFl_4" id="sNoFl_4" value="0" />
                    <input type="hidden" name="sNoFl_4_w" id="sNoFl_4_w" value="0" />
                    <input type="hidden" name="sNoFl_4_p" id="sNoFl_4_p" value="0" />
                    <input type="hidden" name="sNoFl_4_f" id="sNoFl_4_f" value="0" />
                    <input type="hidden" name="sNoFl_4_wp" id="sNoFl_4_wp" value="0" />
                    <input type="hidden" name="sNoFl_4_wf" id="sNoFl_4_wf" value="0" />
                    <input type="hidden" name="sNoFl_4_pf" id="sNoFl_4_pf" value="0" />
                    <input type="hidden" name="sNoFl_4_wpf" id="sNoFl_4_wpf" value="0" />
                    <input type="hidden" name="sNoFl_4_n" id="sNoFl_4_n" value="0" />
                    <input type="hidden" name="sIpAddr" value="<%= sIpAddr%>" />

                    <input type="hidden" name="sCatgTypTmp" value="<%= sCatgTyp%>" />
                    <input type="hidden" name="sSysDt" value="<%= sSysDt%>" />
                    <input type="hidden" name="sJson_prfmnce" value="" />
                    <input type="hidden" name="sJson_prfmnce_get" value="" />
                    <input type="hidden" name="iPrfmnce_cnt" value="0" />

                    <input type="hidden" name="hIdentified_by" value="<%= sIdentified_by%>" />
                    <input type="hidden" name="hImprove_input" value="<%= sImprove_input%>" />
                    <input type="hidden" name="hImprove_methodology" value="<%= sImprove_methodology%>" />
                    <input type="hidden" name="hImprove_loss_reduction" value="<%= sImprove_loss_reduction%>" />
                    <input type="hidden" name="hImprove_process_modification" value="<%= sImprove_process_modification%>" />
                    <input type="hidden" name="hWhy_why_analysis" value="<%= sWhy_why_analysis%>" />
                    <input type="hidden" name="hPareto_analysis" value="<%= sPareto_analysis%>" />
                    <input type="hidden" name="hFish_bone_diagram" value="<%= sFish_bone_diagram%>" />
                    <input type="hidden" name="hNone_analysis" value="<%= sNone_analysis%>" />
                    <input type="hidden" name="hBef_picture" id="hBef_picture" value="<%= sBef_picture%>" />
                    <input type="hidden" name="hValidate_thru_experiment" id="hValidate_thru_experiment" value="<%= sValidate_thru_experiment%>" />
                    <input type="hidden" name="hEasier_to_implement" id="hEasier_to_implement" value="<%= sEasier_to_implement%>" />
                    <input type="hidden" name="hLow_cost" id="hLow_cost" value="<%= sLow_cost%>" />
                    <input type="hidden" name="hMin_conflict_oth_interest" id="hMin_conflict_oth_interest" value="<%= sMin_conflict_oth_interest%>" />
                    <input type="hidden" name="hFavour_impact_ehs" id="hFavour_impact_ehs" value="<%= sFavour_impact_ehs%>" />
                    <input type="hidden" name="hOther_soln" id="hOther_soln" value="<%= sOther_soln%>" />
                    <input type="hidden" name="hOther_soln_val" id="hOther_soln_val" value="<%= sOther_soln_val%>" />
                    <input type="hidden" name="hOther_soln_val_none" id="hOther_soln_val_none" value="<%= sOther_soln_val_none%>" />
                    <input type="hidden" name="hInnovative_place" id="hInnovative_place" value="<%= sInnovative_place%>" />
                    <input type="hidden" name="hInnovative_none" id="hInnovative_none" value="<%= sInnovative_none%>" />
                    <input type="hidden" name="hUniqueness" id="hUniqueness" value="<%= sUniqueness%>" />
                    <input type="hidden" name="hAft_picture" id="hAft_picture" value="<%= sAft_picture%>" />
                    <input type="hidden" name="hScope_of_replicability" id="hScope_of_replicability" value="<%= sScope_of_replicability%>" />
                    <input type="hidden" name="hBenefit_of_improve_continue" id="hBenefit_of_improve_continue" value="<%= sBenefit_of_improve_continue%>" />
                    <input type="hidden" name="hCost_savings_investment" id="hCost_savings_investment" value="<%= sCost_savings_investment%>" />
                    <input type="hidden" name="hSaving_potential" id="hSaving_potential" value="<%= sSaving_potential%>" />
                    <input type="hidden" name="hNet_savings" id="hNet_savings" value="<%= sNet_savings%>" />
                    <input type="hidden" name="hCost_of_investment_reqd" id="hCost_of_investment_reqd" value="<%= sCost_of_investment_reqd%>" />
                    <input type="hidden" name="hRoi_calculated" id="hRoi_calculated" value="<%= sRoi_calculated%>" />
                    <input type="hidden" name="sJson_probable_soln" value="" /> 
                    <input type="hidden" name="hDate_of_implementation" id="hDate_of_implementation" value="<%=sDate_of_implementation%>" /> 
                    <input type="hidden" name="sFinally_implemented_soln" value="<%=sFinally_implemented_soln%>" />                  

                    <input type="hidden" name="hStatus_block1" value="0" />
                    <input type="hidden" name="hStatus_block2" value="0" />
                    <input type="hidden" name="hStatus_block3_1" id="hStatus_block3_1" value="0" />
                    <input type="hidden" name="hStatus_block3_2" id="hStatus_block3_2" value="0" />
                    <input type="hidden" name="hStatus_block3_3" id="hStatus_block3_3" value="0" />
                    <input type="hidden" name="hStatus_block4" value="0" />
                    <input type="hidden" name="hStatus_block5" value="0" />
                    <input type="hidden" name="hStatus_block6" value="0" />  
                    <input type="hidden" name="hValidation_typ" value="" />

                    <input type="hidden" name="sForm_no" value="<%= sForm_no%>" />
                    <input type="hidden" name="sRev_date" value="<%= sRev_date%>" /> 
                    <input type="hidden" name="sClick_btn_name" value="" />   

                    <div id="div_block1">           

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
                        </table><br/><br/>
                        <table class="tab2" width="100%">
                            <tr class="thdr" style="background-color : #ffcc66">
                                <td colspan="6">A. Details of Applicant(s)</td>
                            </tr>
                            <tr class="thdr">
                                <td class="tab2c1" style="width : 10%"><b>Serial No</b></td>
                                <td class="tab2c2" style="width : 20%"><b>Name(s)</b></td>
                                <td class="tab2c1" style="width : 10%"><b>Code</b></td>
                                <td class="tab2c2" style="width : 20%"><b>Designation</b></td>
                                <td class="tab2c2" style="width : 20%"><b>Dept/Company</b></td>
                                <td class="tab2c2" style="width : 20%"><b>Identification of the problem / symptom</b></td>
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
                                <td rowspan="5" align="left">
                                    <input type="radio" name="sIdentified_by" value="S" onclick="">By&nbsp;Self&nbsp;<br/><br/><input type="radio" name="sIdentified_by" value="O" onclick="">From&nbsp;Others
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
                    </div>
                    <input type="button" value='validate' onclick='validate_form_block1();'>
                    <br/><br/>
                    <table class="tab3" width="100%">
                        <tr class="thdr" style="background-color : #ffcc66">
                            <td colspan="3">B. Diagnosis of Symptom / Pain / Problem</td>
                        </tr>
                        <tr class="thdr" style="text-align: left;">
                            <td width="33%">B1. What is the symptom / pain?</td>
                            <td width="33%">B2. Who is/ are facing the problem ?</td>
                            <td width="34%">B3. Location of the problem or symptom? Site / machine / process</td>
                        </tr>
                        <tr>
                            <td><textarea name="sSymptom" id="sSymptom" rows="3" cols="15" onkeyup="chkSymptom();"><%= sSymptom%></textarea><div id='div_countdown_symptom' style='background-color : red ; color : #ffffff ; width : 150px'></div></td>
                            <td><textarea name="sWho_face_problem" id="sWho_face_problem" rows="3" cols="15" onkeyup="chkWho_face_problem();"><%= sWho_face_problem%></textarea><div id='div_countdown_who_face_problem' style='background-color : red ; color : #ffffff ; width : 150px'></div></td>
                            <td><textarea name="sLocation_problem" id="sLocation_problem" rows="3" cols="15" onkeyup="chkLocation_problem();"><%= sLocation_problem%></textarea><div id='div_countdown_location_problem' style='background-color : red ; color : #ffffff ; width : 150px'></div></td>
                        </tr>
                    </table>
                    <input type="button" value='validate' onclick='validate_form_block2();'>
                    <br/><br/>
                    <table class="tab3" width="100%">
                        <tr class="thdr" style="background-color : #ffcc66">
                            <td colspan="2">C. From Symptom to finding of root cause</td>
                        </tr>
                        <tr class="thdr" style="text-align: left;">
                            <td width="100%" colspan="2">C1. Improvement aimed at</td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: left;"><input type="checkbox" name="sImprove_input" /> Improvement of input(raw materials / man)&nbsp;&nbsp;
                                <input type="checkbox" name="sImprove_methodology" /> Improvement of methodology&nbsp;&nbsp;
                                <input type="checkbox" name="sImprove_loss_reduction" /> Loss reduction (man / materials)&nbsp;&nbsp;
                                <input type="checkbox" name="sImprove_process_modification" /> Process Step Modification / simplification</td>
                        </tr>
                        <tr style="text-align: left;">
                            <td class="thdr" width="65%" style="text-align: left;">C2. Mention in brief the Primary Root cause as identified to solve the problem</td>
                            <td class="thdr" width="35%" style="text-align: left;">C5. Picture/ diagram to show problem area</td>
                        </tr>
                        <tr>
                            <td><textarea name="sPrimary_root_cause" id='sPrimary_root_cause' rows="3" onkeyup="chkPrimary_root_cause();"><%= sPrimary_root_cause%></textarea><div id='div_countdown_primary_root_cause' style='background-color : red ; color : #ffffff ; width : 150px'></div></td>
                            <td rowspan="5">
                                <table border="0">
                                    <tr>
                                        <td colspan="2" style="border : 0pt solid black">
                                            <table width="70%">
                                                <!--tr class="thdr">
                                                    <td colspan="2">Sketch / Picture of Initial Condition (Before)</td>
                                                </tr-->
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
                                                </tr>
                                            </table>

                                        </td>
                                    </tr>
                                    <tr><td colspan="2" style="border : 0pt solid black">&nbsp;</td></tr>
                                    <tr>
                                        <td style="border : 0pt solid black ; background-color : #33ccff ; text-align : left" colspan="2">C6. Which Picture to be considered for future ? </td>
                                    </tr>
                                    <tr>
                                        <td style="border : 0pt solid black" colspan="2">                                        
                                            <select name='sBef_picture' id='sBef_picture'><option value=''>Select</option></select>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                        <tr class="thdr" style="text-align: left;">
                            <td>C3. Analysis to arrive at root cause(one or more)</td>
                        </tr>
                        <tr>
                            <td width="64%" style="text-align: left"><input type="checkbox" name="sWhy_why_analysis" /> Why Why Analysis&nbsp;&nbsp;
                                <input type="checkbox" name="sPareto_analysis" /> Pareto Analysis&nbsp;&nbsp;
                                <input type="checkbox" name="sFish_bone_diagram" /> Fish Bone Diagram&nbsp;&nbsp;
                                <input type="checkbox" name="sNone_analysis" onclick="clkNone_analysis();"/> None of these</td>
                        </tr>
                        <tr class="thdr" style="text-align: left;">
                            <td>C4. Attach Analysis document separately (if available) for root cause validation</td>
                        </tr>
                        <tr>
                            <td text-align="left">
                                <table width="70%">
                                    <!--tr class="thdr">
                                        <td colspan="2">Sketch / Picture of Initial Condition (Before)</td>
                                    </tr-->
                                    <tr>

                                        <td valign="top" width="20%">
                                            <table class="table" id="tabFl_4">
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
                                                <div id="divDelFl_4" style="width: 20px; background : #000040; display:none">
                                                    <input type="button" value="Delete File" name="butnDelFl_4" style="background-color : #ffffff" onclick="delFl('cause');">
                                                </div>
                                            </center>
                                        </td>
                                        <td valign="top" width="30%">
                                            <iframe id ="iFrameUpldFl_4" name ="iFrameUpldFl_4" src="ipicms_upldFl.jsp?sContestId=<%= sContestId%>&sIpAddr=<%= sIpAddr%>&sTyp=cause" height="140px" width="350px" frameborder="0">

                                            </iframe>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <input type="button" value='validate' onclick='validate_form_block3();'>
                    <br/><br/>
                    <table class="tab3" width="100%">
                        <tr class="thdr" style="background-color : #ffcc66">
                            <td colspan="4">D. Solution finding and implementation</td>
                        </tr>
                        <tr class="thdr" style="text-align: left">
                            <td colspan="3">D1. Probable solutions that were thought of&nbsp;&nbsp;<input type="button" value="Add Row" name="add_row_btn_probable_soln" style="width : 100px ;background-color : #ffffff" onclick="add_row_probable_soln();">&nbsp;&nbsp;<!--input type="button" value="Get Details" name="get_dtls_btn_probable_soln" style="width : 100px ;background-color : #ffffff" onclick="get_dtls_probable_soln();"--></td>
                            <td width="35%">D2. Picture showing application of solution for improvement</td>
                        </tr>
                        <tr style="text-align: left">
                            <td colspan="3">
                                <table class="tab3" width="100%" id="tab_probable_soln">
                                    <tr style="text-align: left" id="tr_probable_soln_0">
                                        <td class="thdr" width="50%">Probable Solution</td>
                                        <td class="thdr" width="40%">Finally implemented Solution</td>
                                        <td class="thdr" width="10%">Del Row</td>
                                    </tr>
                                </table>
                            </td>                            
                            <td rowspan="5">
                                <table width="70%">
                                    <!--tr class="thdr">
                                        <td colspan="2">Sketch / Picture of Improved Condition (After)</td>
                                    </tr-->
                                    <tr>

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
                                    <tr><td colspan="2" style="border : 0pt solid black">&nbsp;</td></tr>
                                    <tr>
                                        <td style="border : 0pt solid black ; background-color : #33ccff ; text-align : left" colspan="2">D3. Which Picture to be considered for future ? </td>
                                    </tr>
                                    <tr>
                                        <td style="border : 0pt solid black" colspan="2">                                        
                                            <select name='sAft_picture' id='sAft_picture'><option value=''>Select</option></select>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr class="thdr" style="text-align: left">
                            <td colspan="3">D4. Considerations for best solution</td>
                        </tr>
                        <tr>
                            <td align="left" id='sConsider_for_best_soln' colspan="3">
                                <input type="checkbox" name="sValidate_thru_experiment" id="sValidate_thru_experiment"/> Validate through experiment<br/>
                                <input type="checkbox" name="sEasier_to_implement" id="sEasier_to_implement"/> Easier to implement<br/>
                                <input type="checkbox" name="sLow_cost" id="sLow_cost"/> No/ Low Cost<br/>
                                <input type="checkbox" name="sMin_conflict_oth_interest" id="sMin_conflict_oth_interest"/> Minimum conflict on other interest<br/>
                                <input type="checkbox" name="sFavour_impact_ehs" id="sFavour_impact_ehs"/> Favourable impact on EHS<br/>
                                <input type="checkbox" name="sOther_soln" id="sOther_soln" onclick="clkOther_soln();"/> Other than above
                            </td> 
                            <!--td align="left" id='sOther_soln' style="border : 0">
                            </td--> 
                        </tr>
                        <tr class="thdr" style="text-align: left">
                            <td width="33%">D5. Innovativeness</td>
                            <td width="33%">D6. Uniqueness</td>
                            <td width="34%">D7. Scope of Replicability</td>
                        </tr>
                        <tr>
                            <td align="left" valign="top">
                                <input type="radio" name="sInnovative_place" value="1" onclick="">First Time at my workplace<br/>
                                <input type="radio" name="sInnovative_place" value="2" onclick="">First Time in CESC<br/>
                                <input type="radio" name="sInnovative_place" value="3" onclick="">First Time in Industry<br/>
                                <input type="checkbox" name="sInnovative_none" id="sInnovative_none" onclick="clkInnovative_none();"/> None of the above but improvement done
                            </td>
                            <td align="left" valign="top">
                                <input type="radio" name="sUniqueness" value="1" onclick="">Replicated from elsewhere in CESC<br/>
                                <input type="radio" name="sUniqueness" value="2" onclick="">Replicated from other industry<br/>
                                <input type="radio" name="sUniqueness" value="3" onclick="">Completely new idea for solution<br/>
                            </td>
                            <td align="left" valign="top">
                                <input type="radio" name="sScope_of_replicability" value="1" onclick="">Within Same Function<br/>
                                <input type="radio" name="sScope_of_replicability" value="2" onclick="">In other areas in CESC<br/>
                                <input type="radio" name="sScope_of_replicability" value="3" onclick="">Across Power Industry<br/>
                                <input type="radio" name="sScope_of_replicability" value="4" onclick="">None of the above
                            </td>
                        </tr>
                    </table>
                    <input type="button" value='validate' onclick='validate_form_block4();'>
                    <br/><br/>
                    <table class="tab3" width="100%" id="tab_prfmnce">
                        <tr class="thdr" style="background-color : #ffcc66">
                            <td colspan="6">E. Results achieved (Due to this improvement)<br/><br/>(Mention Performance Parameters & Unit of Maasures[UOM])&nbsp;&nbsp;<input type="button" value="Add Row" name="add_row_btn" style="width : 100px ;background-color : #ffffff" onclick="add_row_prfmnce();">&nbsp;&nbsp;<!--input type="button" value="Get Details" name="add_row_btn" style="width : 100px ;background-color : #ffffff" onclick="get_dtls();"--></td>
                        </tr>
                        <tr style="text-align: left" id="tr_prfmnce">
                            <td class="thdr" width="20%">Item</td>
                            <td class="thdr" width="20%">Improvement Parameter</td>
                            <td class="thdr" width="10%">UOM</td>
                            <td class="thdr" width="20%">Before</td>
                            <td class="thdr" width="20%">After</td>
                            <td class="thdr" width="10%">Del Row</td>
                        </tr>
                        <tr style="text-align: left" id="tr_benefit_of_improve_continue">
                            <td colspan="6">
                                <span id="spanBenefit_of_improve_continue">Benefits of Improvement still continuing ? <input type="radio" name="sBenefit_of_improve_continue" value="Y" onclick="clkBenefit_of_improve_continue();">Y&nbsp;<input type="radio" name="sBenefit_of_improve_continue" value="N" onclick="clkBenefit_of_improve_continue();">N</span>
                            </td>
                        </tr>
                    </table>
                    <input type="button" value='validate' onclick='validate_form_block5();'>
                    <br/><br/>
                    <table class="tab3" width="100%" id="tab_prfmnce">
                        <tr class="thdr" style="background-color : #ffcc66">
                            <td colspan="3">F. Title of the kaizen</td>
                        </tr>
                        <tr style="text-align: left">
                            <td width="20%">
                                <b>Appropriate title for this improvement</b><br/>(within 45 to 135 characters)<br/>(Start with a Verb or Adverb)
                            </td>
                            <td width="60%" style="text-align: center"><textarea name="sTitle" id="sTitle" rows="3" cols="15" onkeyup="chkTitle();"><%= sTitle%></textarea><div id='div_countdown_title' style='background-color : red ; color : #ffffff ; width : 150px'></div>
                            </td>
                            <td width="20%">
                                <b>The title should be indicative of</b><br/>  -Improvement characteristics<br/>  -Area/location of improvement<br/>  -Impact of improvement(Benefit)
                            </td>
                        </tr>
                    </table>
                    <!--table class="tab3" width="80%">
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
                    </table-->
                    <input type="button" value='validate' onclick='validate_form_block6();'>
                    <br/><br/>
                    <input type="hidden" name="before" /><input type="hidden" name="after" />
                    <table class="tab5" width="80%">
                        <tr class="thdr" style="background-color : #ffcc66">
                            <td colspan="4">G. Validation by Manager / Kaizen Coordinator</td>
                        </tr>
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
                                    <div id="divButnEdit_draft" style="width: 100px; background: #000040;display : none">
                                        <input type="button" value="Edit Draft" name="edit_btn_draft" style="width : 100px ;background-color : #ffffff" onclick="edit_onclick_draft();if(this.value == 'Save Draft'){animatedcollapse.hide('divButnConfirm');}else{animatedcollapse.show('divButnConfirm');}">
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
                                <td>
                                    <div id="divButnPrint" style="width: 100px; background: #000040;display : none">
                                        <input type="button" value=" Print" name="butnPrint" style="background-color : #ffffff" onclick="window.open('ipicms_showFlIframe.jsp?sContest_id='+f1.sContestId.value,'_blank')">
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

        <!-- Modal -->
        <div class = "modal fade" id = "myModal" tabindex = "-1" role = "dialog" aria-labelledby = "myModalLabel" aria-hidden = "true"  style="width: 680px">

            <div class = "modal-dialog" style="width: 680px">
                <div class = "modal-content" style="width: 680px">
                    <div class = "modal-header" style="width: 640px">
                        <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" onclick="set_status_block(3,2,0);">
                            X
                        </button>

                        <h4 class = "modal-title" id = "myModalLabel">
                            Confirmation
                        </h4>
                    </div>

                    <div class = "modal-body" style="width: 640px">
                        There is no picure/diagram uploaded to show problem area. Are you sure?
                    </div>

                    <div class = "modal-footer" style="width: 640px">
                        <!--button type = "button" class = "btn btn-default" data-dismiss = "modal" onclick="set_status_block(3,2,0);">
                            Close
                        </button-->

                        <button type = "button" id="btnOk" class = "btn btn-primary" data-dismiss = "modal" onclick="$('#myModal').modal('hide');set_status_block(3,2,1);">
                            Yes
                        </button>
                        <button type = "button" id="btnOk" class = "btn btn-primary" data-dismiss = "modal" onclick="set_status_block(3,2,0);">
                            No
                        </button>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->

        </div><!-- /.modal -->

        <!-- Modal -->
        <div class = "modal fade" id = "file_upld_cause_modal" tabindex = "-1" role = "dialog" aria-labelledby = "file_upld_cause_modalLabel" aria-hidden = "true"  style="width: 680px">

            <div class = "modal-dialog" style="width: 680px">
                <div class = "modal-content" style="width: 680px">
                    <div class = "modal-header" style="width: 640px">
                        <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" onclick="$('#file_upld_cause_modal').modal('hide');">
                            X
                        </button>

                        <h4 class = "modal-title" id = "myModalLabel">
                            Confirmation
                        </h4>
                    </div>

                    <div class = "modal-body" style="width: 640px">
                        <table width="640px">
                            <tr>
                                <td id='td_file_upld_cause'>

                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class = "modal-footer" style="width: 640px">
                        <!--button type = "button" class = "btn btn-default" data-dismiss = "modal" onclick="$('#file_upld_cause_modal').modal('hide');">
                            Close
                        </button-->

                        <button type = "button" id="btnOk" class = "btn btn-primary" data-dismiss = "modal" onclick="$('#file_upld_cause_modal').modal('hide');file_upld_cause();">
                            Yes
                        </button>
                        <button type = "button" id="btnOk" class = "btn btn-primary" data-dismiss = "modal" onclick="$('#file_upld_cause_modal').modal('hide');">
                            No
                        </button>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->

        </div><!-- /.modal -->

        <div id="dialog" title="" style="display : none">
            <p>
                <span class="ui-icon ui-icon-alert" style="float : left ; margin : 0 7px 20px 0;"></span>
                <span id="spanDialog">&nbsp;</span>
            </p>
        </div>

        <script>
    animatedcollapse.addDiv('divCatgTyp', 'optional_attribute_string')
    animatedcollapse.addDiv('divCancel', 'optional_attribute_string')
    animatedcollapse.addDiv('divSendBack', 'optional_attribute_string')
    animatedcollapse.addDiv('divButnEdit', 'optional_attribute_string')
    animatedcollapse.addDiv('divButnEdit_draft', 'optional_attribute_string')
    animatedcollapse.addDiv('divButnSendBack', 'optional_attribute_string')
    animatedcollapse.addDiv('divButnConfirm', 'optional_attribute_string')
    animatedcollapse.addDiv('divButnReject', 'optional_attribute_string')
    animatedcollapse.addDiv('divButnCancel', 'optional_attribute_string')
    animatedcollapse.addDiv('divButnPrint', 'optional_attribute_string')


           
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

    f1.sJson_probable_soln.value = '<%= json_arr_probable_soln.toString()%>'
    f1.sJson_prfmnce_get.value = '<%= json_arr.toString()%>'
    
            

            


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