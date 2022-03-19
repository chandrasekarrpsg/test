<?php
//session_start();
define('SESSION_BLOCK_SPIDERS',true);
//define('STORE_SESSIONS','mysql');
//define('SESSION_WRITE_DIRECTORY','mysql');
define('SESSION_CHECK_USER_AGENT',false);
define('SESSION_CHECK_IP_ADDRESS',false);
define('STORE_SESSIONS','mysql');
define('SESSION_WRITE_DIRECTORY','');
define('SESSION_FORCE_COOKIE_USE',false);
define('ENABLE_SSL','False');
define('TEXT_FIELD_REQUIRED', '&nbsp;<span class="fieldRequired">* Required</span>');
define('DATE_FORMAT_SHORT', '%m/%d/%Y');
define('DATE_FORMAT_LONG', '%A %d %B, %Y');
define('DATE_FORMAT', 'm/d/Y');
define('DATE_TIME_FORMAT', DATE_FORMAT_SHORT . ' %H:%M:%S');
define('SITE_URL', 'https://heltest.cesc.co.in/');
/* DATABASE INFORMATION*/
//if($_SERVER['HTTP_HOST'] == 'localhost'):
/***************FOR LOCAL****************/
define('DB_SERVER','access.cesc.co.in');
define('DB_SERVER_USERNAME','heldev');
define('DB_SERVER_PASSWORD','heldev');
define('DB_DATABASE','heldev');
define('USE_PCONNECT',false);
/***************FOR LOCAL****************/
/*else:*/
/***************FOR SERVER****************/
/*define('DB_SERVER','localhost');
define('DB_SERVER_USERNAME','nextscre_kaos');
define('DB_SERVER_PASSWORD','3Gmfxe79(X6D');
define('DB_DATABASE','nextscre_kaosforu');*/
/***************FOR SERVER****************/
/*endif;*/


define('STORE_DB_TRANSACTIONS','false');
define('STORE_PAGE_PARSE_TIME_LOG','');
define('TABLE_PREFIX','tbl_');
/* Error Reporting*/
error_reporting(E_ALL^E_NOTICE);


ini_set("post_max_size", "150M");
ini_set("upload_max_filesize", "150M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );	
