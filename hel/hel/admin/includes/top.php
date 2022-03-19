<?php
include 'define.php';
/* write Current Executing File */

$PHP_SELF = (isset($_SERVER['PHP_SELF'])? $_SERVER['PHP_SELF']:$_SERVER['SCRIPT_NAME']);

/** -------------------------------*
/* Just including Database  class */
/* Create mysqli object*
* --------------------------------**/
require 'functions/database.php';
$conn=g_db_connect() or die('Unable to connect to database server!');
//require 'classes/class.MysqliDatabase.php';
//$db=MysqliDatabase::singleton() or die(" Internal Error");
//var_dump($db);
/* Just including genaral Functions */

require 'functions/function.php';

/* Just including sessions Functions */

include 'functions/sessions.php';

/* Php Validation Class*/

require 'classes/validate.class.php';

/* Pagination Class*/

require 'classes/queryList.php';

/* Mail class*/

require 'classes/class.phpmailer.php';

/* Session Name and Session Save Path  */

include 'functions/thumb_function.php';

function_session_name('pro');
function_session_save_path();
/*
if (function_exists('session_set_cookie_params')) {
    session_set_cookie_params(0, '/admin/');
  } elseif (function_exists('ini_set')) {
    ini_set('session.cookie_lifetime', '0');
    ini_set('session.cookie_path', '/admin/');
  }*/
function_session_start();
//session_start();
$request_type='NONSSL';
$session_started = false;
  
   if ( ($session_started == true) && function_exists('ini_get') && (ini_get('register_globals') == false) ) {
    extract($_SESSION, EXTR_OVERWRITE+EXTR_REFS);
  }
$current_page = basename($PHP_SELF);
if(!check_session('admin'))
 {
	 $redirect=false;
	 $current_page= basename($PHP_SELF);
	if($current_page!='login.php')
		{
		if(!check_session('redirect_origin')) {
			function_session_register('redirect_origin');
			$redirect_origin=array('page'=>$current_page,'get'=>$_GET);
		}
		$redirect=true;
		}
		if($redirect==true)
	 {
			redirect(href_link('login.php'));
    
		}
		unset($redirect);
 }

//print_r($_SESSION);
//echo session_name();echo session_id();


 $get_admin_sql="select * from tbl_administrator where id='".$_SESSION['admin']['id']."'";
				$get_admin_rs=mysqli_query($conn,$get_admin_sql);
				$get_admin_row=mysqli_fetch_array($get_admin_rs);


/*************** Page Title ********************/

if($_GET['type'] == 'home') 	  define('P_TITLE','Home Contant');
if($_GET['type'] == 'company') 	  define('P_TITLE','Company Contant');
if($_GET['type'] == 'whyus')   define('P_TITLE','Why Us Contant');


if($_GET['type'] == 'contactus')  define('P_TITLE','Contact Us Contant');
if($_GET['type'] == 'aboutus') 	  define('P_TITLE','About Us Contant');
if($_GET['type'] == 'faq') 	      define('P_TITLE','FAQ Contant');
if($_GET['type'] == 'mailing') 	      define('P_TITLE','Mialing Contant');
if($_GET['type'] == 'serviceareas')  define('P_TITLE','Service Areas Contant');
if($_GET['type'] == 'privacypolicy')	  define('P_TITLE','Privacy Policy Content');

/*Function Show Massege with Different Style (Start)*/

function showMessage($string = '', $type = ''){
	$message_array = array(
							'success' => '<div class="success" style="margin:2px;padding:3px;"><span style="margin-left:30px;">'.$string.'</span></div>',
							'warning' => '<div class="warning" style="margin:2px;padding:3px;"><span style="margin-left:30px;">'.$string.'</span></div>',
							'error'   => '<div class="error" style="margin:2px;padding:3px;"><span style="margin-left:30px;">'.$string.'</span></div>'
						  );
	return $message_array[$type];
}

function alias($challenge){
	$alias = str_replace(' ', '-', $challenge);
	$alias = str_replace('@', '-', $alias);
	$alias = str_replace('®', '-', $alias);
	$alias = str_replace('&', '', $alias);
	$alias = str_replace('(', '', $alias);
	$alias = str_replace(')', '', $alias);
	$alias = str_replace(',', '', $alias);
	$alias = str_replace("'", '', $alias);
	$alias = str_replace('"', '', $alias);
	$alias = str_replace('?', '', $alias);
	$alias = str_replace(':', '-', $alias);
	$alias = str_replace('.', '-', $alias);
	$alias = preg_replace('/[^a-z0-9\s]/i', '-', $alias);
	return $alias;
}
function convert_smart_quotes($string) 
{ 
    $search = array(chr(145), 
                    chr(146), 
                    chr(147), 
                    chr(148), 
                    chr(151)); 

    $replace = array("'", 
                     "'", 
                     '"', 
                     '"', 
                     '-'); 

    return str_replace($search, $replace, $string); 
}

function converttowebp($source,$dir) 
{
	$file_name_arr=explode(".",$source);
	$file_name=$file_name_arr[0];
	$file_name_webp=$file_name.".webp";
	$output=$dir.$file_name_webp;	
	
	$image = imagecreatefromstring(file_get_contents($dir.$source));
	ob_start();
	imagejpeg($image,NULL,100);
	$cont = ob_get_contents();
	ob_end_clean();
	imagedestroy($image);
	$content = imagecreatefromstring($cont);
	imagewebp($content,$output);
	imagedestroy($content);
	return $file_name_webp;
}






function remove_space($string){
	$alias = str_replace(' ', '-', $string);
	
	$alias = str_replace('®', '-', $alias);
	$alias = str_replace('&', '-', $alias);
	$alias = str_replace('(', '-', $alias);
	$alias = str_replace(')', '-', $alias);
	$alias = str_replace(',', '-', $alias);
	$alias = str_replace("'", '-', $alias);
	$alias = str_replace('"', '-', $alias);
	$alias = str_replace('?', '-', $alias);
	$alias = str_replace(':', '-', $alias);
	$alias = str_replace('/', '-', $alias);
	return $alias;
}


function get_string_between($string, $start, $end){
    $string = ' ' . $string;
    $ini = strpos($string, $start);
    if ($ini == 0) return '';
    $ini += strlen($start);
    $len = strpos($string, $end, $ini) - $ini;
    return substr($string, $ini, $len);
}
function get_template()
{
	if ($handle = opendir('../')) 
	{
	$file_name=array();
	 $pattern = "/\Template Name\b/i";	
    while (($entry = readdir($handle))!==false) {

        if ($entry != "." && $entry != "..") 
        {
        	
			$temp = explode(".", $entry);
			$extension = end($temp);
			if ($extension=="php")
	  		{
	           
				$fh = fopen('../'.$entry, 'r') or die($php_errormsg);
				while (!feof($fh)) 
				{
				    $line = fgets($fh, 4096);
				    if (preg_match($pattern, $line)) 
				    	{
								
				    	  	$line=get_string_between(trim($line), "/*","*/");
							$line_arr= explode(":",$line);
							
				    	  $file_name[$entry]=trim($line_arr[1]);
						}
				}
				fclose($fh);	
					
	
	           
			}	
        }
    }
	closedir($handle);
	return $file_name;
	}
}

/*Function Show Massege with Different Style (End)*/

/*All Script Included Here*/

require_once 'script/login_code.php';
require_once 'script/post_code.php';
require_once 'script/site_feature_code.php';
require_once 'script/about_code.php';
require_once 'script/change_pass_code.php';
require_once 'script/contact_code.php';
require_once 'script/cmspage_code.php';
require_once 'script/award_code.php';
require_once 'script/widget_code.php';
require_once 'script/banner_code.php';
require_once 'script/client_code.php';
require_once 'script/testimonial_code.php';
require_once 'script/course_code.php';
require_once 'script/userdetails_code.php';
require_once 'script/category_code.php';
require_once 'script/product_code.php';
require_once 'script/social_code.php';
require_once 'script/infrastructure_code.php';
require_once 'script/color_code.php';
require_once 'script/coupon_code.php';
require_once 'script/order_code.php';
require_once 'script/gallery_code.php';
require_once 'script/home_gallery_code.php';
require_once 'script/slider_code.php';
require_once 'script/logo_code.php';
require_once 'script/prod_enquiry_code.php';
require_once 'script/newsletter_code.php';
require_once 'script/subcategory_code.php';
require_once 'script/subsubcategory_code.php';
require_once 'script/team_code.php';
require_once 'script/topper_code.php';
require_once 'script/faculty_code.php';
require_once 'script/service_code.php';
require_once 'script/gallery_category_code.php';
require_once 'script/schedule_doc_code.php';
require_once 'script/page_code.php';
require_once 'script/acf_code.php';
require_once 'script/tariff_category_code.php';
require_once 'script/tariff_code.php';
require_once 'script/ash_stock_code.php';
require_once 'script/tender_code.php';
require_once 'script/ec_compliance_code.php';
require_once 'script/job_code.php';
require_once 'script/job_application_code.php';
require_once 'script/internship_code.php';
require_once 'script/internship_application_code.php';
require_once 'script/awards_code.php';
require_once 'script/environmental_management_code.php';
require_once 'script/esg_code.php';
require_once 'script/welfare_slider_code.php';
require_once 'script/asset_management_code.php';
require_once 'script/csr_page_code.php';
require_once 'script/department_code.php';
require_once 'script/role_code.php';
$type = $_GET['type'];?>