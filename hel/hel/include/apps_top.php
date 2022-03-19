<?php
session_start();
require 'admin/includes/define.php';
//$PHP_SELF = (isset($_SERVER['PHP_SELF'])? $_SERVER['PHP_SELF']:$_SERVER['SCRIPT_NAME']);
require  'admin/includes/functions/database.php';
$conn=g_db_connect() or die('Unable to connect to database server!');
require 'admin/includes/functions/sessions.php';
require 'admin/includes/functions/function.php';
require 'admin/includes/classes/class.imguploader.php';
//date_default_timezone_set('Asia/Calcutta');
/*require 'functions/function.php';
require 'functions/bkp__function.php';*/
$img = new Uploader;
//require 'script/login_timer_code.php';

function currencyConverter($from_Currency,$to_Currency,$amount) {
$from_Currency = urlencode($from_Currency);
$to_Currency = urlencode($to_Currency);
$encode_amount = $amount;
$get = file_get_contents("https://www.google.com/finance/converter?a=$encode_amount&from=$from_Currency&to=$to_Currency");
$get = explode("<span class=bld>",$get);
$get = explode("</span>",$get[1]);
$converted_currency = preg_replace("/[^0-9\.]/", null, $get[0]);
return round($converted_currency,2);
}


require_once 'script/newsletter_code.php';
// require_once 'script/myaccount_code.php';
// require_once 'script/changepassword_code.php';

//require_once 'script/message_code.php';
//require_once 'script/call_back_code.php';
?>