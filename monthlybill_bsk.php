 <?php

 if(strlen(trim(@$_POST['6_letters_code'])) == 0)
 {
?>
         <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Sorry</FONT>
                        <BR>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Retry</FONT>
                        <BR><BR>
        </CENTER>

<?php
        exit();
 }

 if(@$_SESSION['6_letters_code'] != @$_POST['6_letters_code'])
 {
?>
         <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Sorry, the captha does not match.</FONT>
                        <BR>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Please try again.</FONT>
                        <BR><BR>
        </CENTER>

<?php
        exit();
 } */

 //Required files included

$gateway_redirect_flag = 0;
function decrypto($enctxt, $tckt)
{
    $arr = array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j');
    $arr2 = array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
    $today = date("Ymd");
        //$today = '20220203 ';
        $string2 = "";
    $string1 = "";
        $mobenc = substr($enctxt, 0, 10);
    $dthash = substr($enctxt, 10, strlen($enctxt));

    for ($i = 0; $i < strlen($mobenc); $i++) {
        $string2 .= chr(ord($mobenc[$i]) - 3);
    }

    for ($i = 0; $i < strlen($string2); $i++) {
        $string1 .= $arr2[array_search($string2[$i], $arr)];
    }

    if (md5($string1 . $tckt . $today) != $dthash) { // date not matched
        return "INVALID";
    }

    return $string1;
}

function check_special_char($input_str)
{
        $input_str = str_replace('"','',$input_str);
        $input_str = str_replace("'","",$input_str);
        return $input_str;
}

//PHP function defined to compute the consumer id check digit
function consumer_id_cdg($pvc_val)
{
        $vnm_mul = 0;
        $vnm_rem = 0;
        $vnm_factor = 0;
        $vcr_char = "";

        $greg_current_sys_date = @date('Y-m-d');

        $vint_length = strlen($pvc_val);
        $vnm_factor = $vint_length;

        //For loop starts
        for($i=0;$i<$vint_length;$i++)
        {
                $vch_char = substr($pvc_val,$i,1);
                $vnm_mul = $vnm_mul + intval($vch_char) * $vnm_factor;
                $vnm_factor = $vnm_factor - 1;
        }// end of for loop

        $vnm_rem = $vnm_mul % 11;

        if($vnm_rem > 1)
        {
                $vint_chk_dgt = 11 - $vnm_rem;
        }
        else
        {
                $vint_chk_dgt = $vnm_rem;
        }

        return $vint_chk_dgt;
}

$enctxt = $_POST['UserId'];
$tckt = $_POST['TicktNo'];

$check_tckt = intval(only_numeric_control($tckt));
//Check user input
if($check_tckt > 0)
{
        ?><CENTER><FONT FACE=VERDANA SIZE=3 COLOR=RED><B>Sorry, incorrect input parameters. You cannot proceed.</B></FONT></CENTER><?php
        exit();
}

$check_custid = intval(only_numeric_control(trim($_POST['consid'])));
if($check_custid > 0)
{
        ?><CENTER><FONT FACE=VERDANA SIZE=3 COLOR=RED><B>Sorry, incorrect input parameters. You cannot proceed.</B></FONT></CENTER><?php
        exit();
}

//Check user input
 if($check_tckt > 0)
{
        ?><CENTER><FONT FACE=VERDANA SIZE=3 COLOR=RED><B>Sorry, incorrect input parameters. You cannot proceed.</B></FONT></CENTER><?php
        exit();
}

//Checking for values in variables. Allow to proceed only if both values exist.
if(strlen($enctxt) >0 && strlen($tckt) >0 )
{
        $enctxt = $_POST['UserId'];
        $tckt = $_POST['TicktNo'];
}
else
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Unauthorised access.</FONT>
        </CENTER>
<?php
        exit();
}

//Checking for duplicate ticket number
$ecptout=decrypto($enctxt, $tckt);
$decryt_str = $ecptout;
$enqdate = date("Y-m-d");
$enqtime = date("H:i:s");
$encryp_str = $enctxt;
$ticket_no = $tckt;
$customer_id = trim($_POST['consid']);
$original_consumer_id_cdg = substr($customer_id,10,1);
$customer_id_len = strlen($customer_id);
$it_cons_id = intval(substr($customer_id,0,10));
$map_cons_id = $it_cons_id;
$statement = $connection_pdo->prepare($str_pck_all_txn);
$statement->bindParam(1, $tckt, PDO::PARAM_STR);
$statement->execute();
$count_txn_rows = count($statement->fetchAll(PDO::FETCH_ASSOC));
$statement = null;

//To be uncommented at the time of going live
/* if($count_txn_rows > 0)
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Ticker number already exists.</FONT>
        </CENTER>

<?php
        exit();
} */

if($customer_id_len != 11)
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Customer ID is not valid.</FONT>
        </CENTER>

<?php
        exit();
}

$jsonora = file_get_contents('http://itwebscn1z2:8037/ciswspmnt/ws_get_server_status.jsp');
$jsonora = utf8_encode($jsonora);
$dataora = json_decode($jsonora);
$serverstat = $dataora->STATUS;

if($serverstat != 'Server available')
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Sorry, our services are temporarily unavailable. Normal services will resume shortly.</FONT>
        </CENTER>

        <?php
        exit();
}

$prov_bill_flag = "0";
$instl_bill_flag = 0;
$tds_flag = 0;
$erndnet_flag = 0;

//Web service called to fetch the consumer details
$params1 = array(
        "cons_id" => $map_cons_id
);

$curlop1 = httpcurlpost("http://itwebscn1z2:8037/ciswspmnt/ws_bill_information_1_tds.jsp",$params1);
$json1 = $curlop1;
$json1 = utf8_encode($json1);
$data1 = json_decode($json1);
$data_con_array = $data1->BILLINFORMATION1;
$data_con_status = $data1->STATUS;
$data_con_tds_status = $data1->TDSINFORMATION;

if($data_con_tds_status == 1)
{
        $tds_flag = 1;
}

//For loop starts
foreach ($data1->BILLINFORMATION1 as $condtl)
{
        $ora_consid = $map_cons_id;

        $ora_consno = $condtl->CONS_NUM;
      $ora_consno_cdg = $condtl->CHK_DGT;
        $ora_consno_with_cdg = $ora_consno.$ora_consno_cdg;

        $n_nam1db = $condtl->ADDR_ONE;
        $n_nam2db = $condtl->ADDR_TWO;
        $n_nam3db = $condtl->ADDR_THREE;
        $n_nam4db = $condtl->ADDR_FOUR;
        $n_nam5db = $condtl->ADDR_FIVE;
        $n_nam6db = $condtl->ADDR_SIX;

        $n_nam1_db = trim($n_nam1db);
        $n_nam2_db = trim($n_nam2db);
        $n_nam3_db = trim($n_nam3db);
        $n_nam4_db = trim($n_nam4db);
        $n_nam5_db = trim($n_nam5db);
        $n_nam6_db = trim($n_nam6db);

        $n_nam1_db = str_replace("'","",$n_nam1_db);
        $n_nam2_db = str_replace("'","",$n_nam2_db);
        $n_nam3_db = str_replace("'","",$n_nam3_db);
        $n_nam4_db = str_replace("'","",$n_nam4_db);
        $n_nam5_db = str_replace("'","",$n_nam5_db);
        $n_nam6_db = str_replace("'","",$n_nam6_db);

        $oranetpay = $condtl->E_RND_NET;
        $ora_net_pay = trim($oranetpay);

        $oragrosspay = $condtl->RND_GRS;
        $ora_gross_pay = trim($oragrosspay);

        $barflag = $condtl->BAR_CD_IND;
        $bar_flag = trim($barflag);

        $noticeflag = $condtl->BL_MKR;
        $notice_flag = trim($noticeflag);

        $rebate = $condtl->RBT_AMT;

        $oranetpayworeb = $condtl->RND_NET;
        $ora_net_pay_wo_reb = trim($oranetpayworeb);

        $ora_consno_acmmyy = $condtl->MMYY;
        $ora_consno_acmmyy_cdg = $condtl->MMYYCD;

        $ora_consno_acmmyy_wcdg = $ora_consno_acmmyy.$ora_consno_acmmyy_cdg;

        $oraduedt = $condtl->DUE_DT;
        $ora_duedt = trim($oraduedt);

        //************************************************************

        $oacmm = substr($ora_consno_acmmyy,0,2);
        $oacyy = "20".substr($ora_consno_acmmyy,2,2);
        $ws_acmmyy = $oacyy.$oacmm;

        if($ws_acmmyy >= $_diffdt)
        {
                $date_explode = explode("-", $ora_duedt);
                $day_o_dudt_ernd = $date_explode[0];
                $month_o_dudt_ernd = $date_explode[1];
                $year_o_dudt_ernd = $date_explode[2];

                $format_dt_o_dudt_ernd = $month_o_dudt_ernd."/".$day_o_dudt_ernd."/".$year_o_dudt_ernd;
                $disp_o_dudt_ernd=@date('d/m/Y',strtotime($format_dt_o_dudt_ernd));
                $greg_disp_o_dudt_ernd=@date('Y-m-d',strtotime($format_dt_o_dudt_ernd));
                $statement = $connection_pdo->prepare($str_pick_date_diff_ernd);
                $statement->bindParam(1, $greg_current_sys_date, PDO::PARAM_STR);
                $statement->bindParam(2, $greg_disp_o_dudt_ernd, PDO::PARAM_STR);
                $statement->execute();
                $row_dat_diff_ernd = $statement->fetch();
                $date_difference_ernd = $row_dat_diff_ernd['dt_diff_ernd'];

                //Within due date
                if($date_difference_ernd <= 0)
                {
                        //E RND NET <= 0
                        if($ora_net_pay <= 0)
                        {
                                //Calling the web service
                                $jsonora = file_get_contents("http://itwebscn1z2:8013/cisws/ws_amt_aft_adv_pmnt_tds.jsp?custid=".$customer_id."&bccd=".$ws_acmmyy);
                                $jsonora = utf8_encode($jsonora);
                                $dataora = json_decode($jsonora);
                                $amtval = $dataora->VAL;
                                $statusval = $dataora->STATUS;
                                $tdsval = $dataora->TDSINFORMATION;

                                if($amtval != "ERROR" && $statusval == "OK")
                                {
                                        $ora_net_pay = $amtval;
                                }
                                else
                                {
                                        $erndnet_flag = 1;
                                }

                        }// end if - ora net pay

                }// end if - due date

        }// end if - ws_acmmyy


        //************************************************************

        $ora_grc_dt =  $condtl->GRC_DT;

        @$provpaygross = $condtl->PROV_PAYABLE_GROSS;
        @$prov_pay_gross = trim($provpaygross);
        @$provpayenet = $condtl->PROV_PAYABLE_E_NET;
        @$prov_pay_enet = trim($provpayenet);

        @$nnum_of_instl = $condtl->NUM_OF_INSTL;
        @$n_num_of_instl = trim($nnum_of_instl);

        @$ninitial_pmntamt = $condtl->INITIAL_PMNT_AMT;
        @$n_initial_pmnt_amt = trim($ninitial_pmntamt);

        //If provisional bill
        if(floatval($prov_pay_gross) > 0 && floatval($prov_pay_enet) > 0)
        {
                $ora_gross_pay = $prov_pay_gross;
                $ora_net_pay = $prov_pay_enet;
                $prov_bill_flag = "1";
        }

        //If installment bill
        if(strlen($n_num_of_instl) > 0 && strlen($n_initial_pmnt_amt) > 0)
        {
                $ora_net_pay = $n_initial_pmnt_amt;
                $instl_bill_flag = 1;
        }

}// End of for loop

//Setting up a static flag
$progress_flag = 1;
$count_abate = 0;

//Checking for abate case only for non provisional bills
if($prov_bill_flag == 0)
{
        //Picking count of VW_RVSD_BILL_ONLINE
        $url="http://itwebscn1z2:8037/ciswspmnt/ws_cons_view_cnt_tds.jsp";
        $params = array(
                "cons_id" => $map_cons_id,
                "abt_bccd" => $ora_consno_acmmyy
        );

        $curlop = httpcurlpost($url,$params);
        $json2 = $curlop;
        $json2 = utf8_encode($json2);
        $data2 = json_decode($json2);
        $data_consview_array = $data2->CONSVIEWCOUNT;
        $data_consview_status = $data2->STATUS;
        $data_consview_tds = $data2->TDSINFORMATION;

        if($data_consview_status == "OK")
        {
                foreach ($data2->CONSVIEWCOUNT as $revcount)
                {
                        $count_abate = $revcount->CONS_VIEW_COUNT;

                }//End of for loop
        }
        else
        {
                $progress_flag = 0;
        }

}// End if - prov bill flag = 0

//If abate case
if($count_abate > 0)
{
        //Picking the revised bill details
        $url="http://itwebscn1z1:8037/ciswspmnt/ws_online_rvsd_bill_tds.jsp";
        $params = array(
                "cons_id" => $map_cons_id,
                "abt_bccd" => $ora_consno_acmmyy
        );
        $curlop = httpcurlpost($url,$params);
        $json3 = $curlop;
        $json3 = utf8_encode($json3);
        $data3 = json_decode($json3);
        $data_revised_array = $data3->ONLINERVSDBILL;
        $data_revised_status = $data3->STATUS;
        $data_revised_tds = $data3->TDSINFORMATION;

        if($data_revised_status == "OK")
        {
                foreach ($data3->ONLINERVSDBILL as $revbilldtl)
                {
                        $oranetpayworeb = $revbilldtl->RND_NET;
                        $ora_net_pay = trim($oranetpayworeb);

                        $oragrosspay = $revbilldtl->RND_GRS;
                        $ora_gross_pay = trim($oragrosspay);

                        $oraduedt = $revbilldtl->DUE_DT;
                        $ora_duedt = trim($oraduedt);


                }//End of for loop
        }
        else
        {
                $progress_flag = 0;
        }

}// end if - count abate

//Computing the consumer id check digit
$ora_cons_id_compute_cdg = consumer_id_cdg($ora_consid);

$str_month = substr($ora_consno_acmmyy,0,2);

$str_year = substr($ora_consno_acmmyy,2,2);
$str_year_ql_pmnt = "20".substr($ora_consno_acmmyy,2,2);

//Checking IT end for payments made

//Flag value initialised
$payment_made_flag = 0;
$it_payamount_dtl = "";

//Calling web service to fetch the payment details from QL_PMNT_DTL
$params2 = array(
        "cons_id" => $ora_consid,
        "pmnt_mm" => $str_month,
        "pmnt_yy" => $str_year_ql_pmnt
);

$curlop2 = httpcurlpost("http://itwebscn1z2:8037/ciswspmnt/ws_pmnt_info_tds.jsp",$params2);
$json2 = $curlop2;
$json2 = utf8_encode($json2);
$data2 = json_decode($json2);
$data_pmntinfo_array = $data2->PMNTDTLINFO;
$data_pmntinfo_status = $data2->STATUS;
$data_pmntinfo_tdsinfo = $data2->TDSINFORMATION;

foreach ($data2->PMNTDTLINFO as $qlpmntdtl)
{
        $it_payamount_dtl = $qlpmntdtl->pmnt_amt;
        $it_paydate_dtl = $qlpmntdtl->pmnt_dt;
}

if(strlen($it_payamount_dtl) > 0 && strlen($it_paydate_dtl) > 0)
{
        $payment_made_flag = 1;
}

//If no records are retrieved from above
if($payment_made_flag == 0)
{
        $it_payamount = 0;
        $it_paydate = "";

        //Calling web service to fetch the payment details from QL_PAYONLINE
        $params3 = array(
        "cons_num" => $ora_consno,
        "pmnt_mm" => $str_month,
        "pmnt_yy" => $str_year
        );
        $params3 = array(
        "cons_num" => $ora_consno,
        "pmnt_mm" => $str_month,
        "pmnt_yy" => $str_year
        );

        $curlop3 = httpcurlpost("http://itwebscn1z2:8037/ciswspmnt/ws_online_pmnt_info_tds.jsp",$params3);
        $json3 = $curlop3;
        $json3 = utf8_encode($json3);
        $data3 = json_decode($json3);
        $data_pmntonlineinfo_array = $data3->ONLINEPMNTINFO;
        $data_pmntonlineinfo_status = $data3->STATUS;
        $data_pmntonlineinfo_tdsinfo = $data3->TDSINFORMATION;

        foreach ($data3->ONLINEPMNTINFO as $qlpayonline)
        {
                $it_payamount = isset($qlpayonline->pmnt_amt) ? $qlpayonline->pmnt_amt : '';
                $it_paydate = isset($qlpayonline->pmnt_dt) ? $qlpayonline->pmnt_dt : '';
        }

        if(strlen($it_payamount) > 0 && strlen($it_paydate) > 0)
        {
                $payment_made_flag = 1;
        }
}


$statement = null;

if($data_con_status != "OK")
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Cannot proceed with payment.</FONT>
        </CENTER>
<?
        exit();
}
elseif($data_pmntinfo_status != "OK")
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Cannot proceed with payment.</FONT>
        </CENTER>
<?php
        exit();
}
elseif($progress_flag == 0)
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Cannot proceed with payment.</FONT>
        </CENTER>
<?php
        exit();
}
/* elseif($payment_made_flag == 1)
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Payment already exist.</FONT>
        </CENTER>
<?php
        exit();
} */
elseif($erndnet_flag == 1)
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Cannot proceed with payment.</FONT>
        </CENTER>
<?php
        exit();
}
/* elseif($count_payment_exist > 0)
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Payment already exist.</FONT>
        </CENTER>
<?php
        exit();
} */
elseif($customer_id_len != 11)
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Cannot proceed with payment.</FONT>
        </CENTER>
<?php
        exit();
}
elseif(strlen($ora_consno) != 10)
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Your Current Month's Billing Data is being refreshed, and normal services shall resume shortly. Regret any inconvenience caused.</FONT>
        </CENTER>

<?php
        exit();
}
elseif($original_consumer_id_cdg != $ora_cons_id_compute_cdg)
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Cannot proceed with payment.</FONT>
        </CENTER>
<?php
        exit();
}
elseif($bar_flag == "N")
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Payment not allowed.</FONT>
        </CENTER>
<?php
        exit();
}
elseif($ora_net_pay <= 0)
{
?>
        <CENTER>
                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Payment not allowed.</FONT>
        </CENTER>
<?php
        exit();
}
else
{
        if($ora_duedt != "")
        {
                //Due date validation
                $dateexplode = explode("-", $ora_duedt);
                $day_o_dudt = $dateexplode[0];
                $month_o_dudt = $dateexplode[1];
                $year_o_dudt = $dateexplode[2];

                $format_dt_o_dudt = $month_o_dudt."/".$day_o_dudt."/".$year_o_dudt;
                $disp_o_dudt=@date('d/m/Y',strtotime($format_dt_o_dudt));
                $greg_disp_o_dudt=@date('Y-m-d',strtotime($format_dt_o_dudt));

                if(strlen($disp_o_dudt) > 0)
                {
                        $dateexplode_1 = explode("/", $disp_o_dudt);
                        $ddt_day = $dateexplode_1[0];
                        $ddt_month = $dateexplode_1[1];
                        $ddt_year = $dateexplode_1[2];

                        $db_due_date = $ddt_year."-".$ddt_month."-".$ddt_day;
                }
                else
 {
                        $ddt_year = "0000";
                        $ddt_month = "00";
                        $ddt_day = "00";
                        $db_due_date = $ddt_year."-".$ddt_month."-".$ddt_day;
                }

                $ora_acc_mmyy_order = $ora_consno_acmmyy;
                $ora_type_marker = 1;

                $rpaynet = intval($ora_net_pay);
                $rpaygross = intval($ora_gross_pay);
                $o_acmm=substr($ora_consno_acmmyy,0,2);
                $oc_yy=substr($ora_consno_acmmyy,2,2);
                $str_last = $o_acmm . $oc_yy . $ora_consno_acmmyy_cdg;
                $padn_pgrs=str_pad($rpaygross, 7, "0", STR_PAD_LEFT);
                $padn_pnet=str_pad($rpaynet, 7, "0", STR_PAD_LEFT);
                $ora_re_dt = substr($ora_grc_dt,-2).substr($ora_grc_dt,5,2).substr($ora_grc_dt,2,2);

                if($count_abate > 0)
                {
                        $count_rebate_delimiter = substr_count($rebate, '.');
                        if($count_rebate_delimiter > 0)
                        {
                                $new_rpaynet = $rpaynet - $rebate;

                                $exp_reb = explode(".", $new_rpaynet);
                                $calc_rebate_first = $exp_reb[0];
                                $calc_rebate_second = $exp_reb[1];
                                $amt_payble = $calc_rebate_first;
                                $rpaynet = $amt_payble;
                                $padn_pnet = str_pad($rpaynet,7,"0",STR_PAD_LEFT);
                        }
                        else
                        {
                                $amt_payble = $rpaynet - $rebate;
                                $rpaynet = $amt_payble;
                                $padn_pnet=str_pad($rpaynet,7,"0",STR_PAD_LEFT);
                        }
                }

                if($instl_bill_flag == 1)
                {
                        $amt_payble = $n_initial_pmnt_amt;
                        $rpaynet = $amt_payble;
                }

                if($notice_flag == "N")

                        $nums = "Y" . $ora_consno_with_cdg . $padn_pgrs . $padn_pnet . $ora_re_dt . $str_last;
                        $stub_code = "Y";
                }
                else
                {
                        $nums = "Z" . $ora_consno_with_cdg . $padn_pgrs . $padn_pnet . $ora_re_dt . $str_last;
                        $stub_code = "Z";
                }

                //Incase the length of the nums field is more than 40
                if(strlen($nums) > 40)
                {
                        $truncated_nums = substr($nums,0,40);
                }
                else
                {
                        $truncated_nums = $nums;
                }

                //Current day attributes
                $db_current_day = @date('d');
                $db_current_month = @date('m');
                $db_current_year = @date('y');
                $db_hr = @date('H');
                $db_min = @date('i');

                $amt_payble = $rpaynet;
                $final_proceed_flag = 1;

                if($tds_flag == 1)
                {
                        //Check whetherTDS amount is available for the retrieved ACMMYY
                        $params_tdsinfo = array(
                                "cons_id" => $ora_consid,
                                "bc_cd" => $ws_acmmyy
                        );

                        $curlop_tdsinfo = httpcurlpost("http://itwebscn1z1:8013/cisws/ws_fetch_tds_dtl_lt.jsp",$params_tdsinfo);
                        $json_tdsinfo = $curlop_tdsinfo;
                        $json_tdsinfo = utf8_encode($json_tdsinfo);
                        $data_tdsinfo = json_decode($json_tdsinfo);
                        $data_tdsinfo_tds_array = $data_tdsinfo->TDSDATA;
                        $data_tdsinfo_tds_status = $data_tdsinfo->STATUS;
                        $data_tdsinfo_tdsinfo = $data_tdsinfo->TDSINFORMATION;

                        if($data_tdsinfo_tds_status == "OK")
                        {
                                if($data_tdsinfo_tds_array == "NO_DATA")
                                {
                                        $tds_flag = 0;
                                }
                                else
                                {
                                        foreach ($data_tdsinfo->TDSDATA as $tdsdtl)
                                        {
                                                $tds_amt = $tdsdtl->tds_amt;
                                        }

                                        if($tds_amt > 0)


                                                $initial_amt_payable = $amt_payble;
                                                $amt_tds_payble_pass = $tds_amt;

                                                if($amt_tds_payble_pass > $initial_amt_payable)
                                                {
                                                        $final_proceed_flag = 2;
                                                }
                                                else
                                                {
                                                        $final_amt_payble = $amt_payble - $amt_tds_payble_pass;
                                                        $amt_payble = $final_amt_payble;
                                                }

                                                if($amt_payble == 0)
                                                {
                                                        $final_proceed_flag = 3;
                                                }
                                        }
                                        else
                                        {
                                                $tds_flag = 0;
                                        }
                                }

                        }
                        else
                        {
                                $final_proceed_flag = 0;
                        }

                }

                if($final_proceed_flag == 0)
                {
                ?>
                                <CENTER>
                                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Cannot proceed with payment.</FONT>
                                </CENTER>

                <?php
                        exit();
                }
                elseif($final_proceed_flag == 2)
                {
                ?>
                                <CENTER>
                                        <FONT FACE=VERDANA SIZE=2 COLOR=RED>Cannot proceed with payment.</FONT>
                                </CENTER>

                <?php
                        exit();
		?>
                }

        class PHP_AES_Cipher {
        private static $OPENSSL_CIPHER_NAME = "AES-128-CBC"; //Name of OpenSSL Cipher
        private static $CIPHER_KEY_LEN = 16; //128 bits

        static function encrypt($key, $iv, $data) {
        if (strlen($key) < PHP_AES_Cipher::$CIPHER_KEY_LEN) {
                        $key = str_pad("$key", PHP_AES_Cipher::$CIPHER_KEY_LEN, "0"); //0 pad to len 16
                } else if (strlen($key) > PHP_AES_Cipher::$CIPHER_KEY_LEN) {
                        $key = $key;
                }

        $encodedEncryptedData = base64_encode(openssl_encrypt($data, PHP_AES_Cipher::$OPENSSL_CIPHER_NAME, $key, OPENSSL_RAW_DATA, $iv));
                $encryptedPayload = $encodedEncryptedData;

        return $encryptedPayload;

        }

        static function decrypt($key, $iv, $data) {
                if (strlen($key) < PHP_AES_Cipher::$CIPHER_KEY_LEN) {
                        $key = str_pad("$key", PHP_AES_Cipher::$CIPHER_KEY_LEN, "0"); //0 pad to len 16
                } else if (strlen($key) > PHP_AES_Cipher::$CIPHER_KEY_LEN) {
                        $key = $key;
                }

        $decryptedData = openssl_decrypt(base64_decode($data), PHP_AES_Cipher::$OPENSSL_CIPHER_NAME, $key, OPENSSL_RAW_DATA, $iv);

                return $decryptedData;
        }
        }
        $key='A7C9F96EEE060ERT2A61F184F4F1B92F0566B9E61D98059729EAD3229F882E81C3A';
        $iv = substr($key, 0, 16);
        $EncryptTrans  = PHP_AES_Cipher::encrypt($key, $iv, $data);
        $Decryass PHP_AES_Cipher {
        private static $OPENSSL_CIPHER_NAME = "AES-128-CBC"; //Name of OpenSSL Cipher
        private static $CIPHER_KEY_LEN = 16; //128 bits

        static function encrypt($key, $iv, $data) {
        if (strlen($key) < PHP_AES_Cipher::$CIPHER_KEY_LEN) {
                        $key = str_pad("$key", PHP_AES_Cipher::$CIPHER_KEY_LEN, "0"); //0 pad to len 16
                } else if (strlen($key) > PHP_AES_Cipher::$CIPHER_KEY_LEN) {
                        $key = $key;
                }

        $encodedEncryptedData = base64_encode(openssl_encrypt($data, PHP_AES_Cipher::$OPENSSL_CIPHER_NAME, $key, OPENSSL_RAW_DATA, $iv));
                $encryptedPayload = $encodedEncryptedData;

        return $encryptedPayload;

        }

        static function decrypt($key, $iv, $data) {
                if (strlen($key) < PHP_AES_Cipher::$CIPHER_KEY_LEN) {
                        $key = str_pad("$key", PHP_AES_Cipher::$CIPHER_KEY_LEN, "0"); //0 pad to len 16
                } else if (strlen($key) > PHP_AES_Cipher::$CIPHER_KEY_LEN) {
                        $key = $key;
                }

        $decryptedData = openssl_decrypt(base64_decode($data), PHP_AES_Cipher::$OPENSSL_CIPHER_NAME, $key, OPENSSL_RAW_DATA, $iv);

                return $decryptedData;
        }
        }
ttTrans  = PHP_AES_Cipher::decrypt($key,$iv,$EncryptTrans);
<?php
}

