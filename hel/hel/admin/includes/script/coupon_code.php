<?php
$message		= '';
$type			= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );
//print phpinfo();
//print ini_get('upload_max_filesize');
/***************************  Create a New Bus Code ******************************************************/
if(isset($_REQUEST['save_coupon']) && $_REQUEST['save_coupon'] == 'Save'){
	
		$st_date = explode("-",$_REQUEST['cupon_st_dt']);
								$dt = $st_date[0];
								$month = $st_date[1];
								$year = $st_date[2];
								$st_date = $year."-".$month."-".$dt;
		$end_date = explode("-",$_REQUEST['cupon_end_dt']);
								$dt1 = $end_date[0];
								$month1 = $end_date[1];
								$year1 = $end_date[2];
								$end_date = $year1."-".$month1."-".$dt1;
						
		$save_coupon_sql="insert ignore into tbl_coupon set 
		cupon_type='".htmlspecialchars(stripslashes($_REQUEST['cupon_type']),ENT_QUOTES)."',		
		coupon_code='".htmlspecialchars(stripslashes($_REQUEST['coupon_code']),ENT_QUOTES)."',
		cupon_st_dt='".$_REQUEST['cupon_st_dt']."',
		cupon_end_dt='".$_REQUEST['cupon_end_dt']."',
		cupon_discount='".$_REQUEST['cupon_discount']."'";
		
		$save_coupon_rs=mysqli_query($conn,$save_coupon_sql);
		$last_id=mysqli_insert_id($conn);
		
		
		
		
		
		if($save_coupon_rs){
			$couponmessages .= showMessage('Coupon Added Successfully','success');
		}
	}

	/***************************  edit bus code  ******************************************************/
if(isset($_REQUEST['edit_coupon']) && $_REQUEST['edit_coupon'] == 'Save'){
	
		$st_date = explode("-",$_REQUEST['cupon_st_dt']);
								$dt = $st_date[0];
								$month = $st_date[1];
								$year = $st_date[2];
								$st_date = $year."-".$month."-".$dt;
		$end_date = explode("-",$_REQUEST['cupon_end_dt']);
								$dt1 = $end_date[0];
								$month1 = $end_date[1];
								$year1 = $end_date[2];
								$end_date = $year1."-".$month1."-".$dt1;
	
		$edit_coupon_sql="update ignore tbl_coupon set 
		coupon_code='".$_REQUEST['coupon_code']."',
		cupon_type='".htmlspecialchars(stripslashes($_REQUEST['cupon_type']),ENT_QUOTES)."',		
		cupon_st_dt='".$_REQUEST['cupon_st_dt']."',
		cupon_end_dt='".$_REQUEST['cupon_end_dt']."',
		cupon_discount='".$_REQUEST['cupon_discount']."'
		
		where id='".$_REQUEST['id']."'";
		$edit_coupon_rs=mysqli_query($conn,$edit_coupon_sql);
		
	
		
		
		
		if($edit_coupon_rs){
			$couponmessages .= showMessage('Coupon Details Edited Successfully','success');
		}
	}
	/***************************  delete code  ******************************************************/
$action  = $_REQUEST['actncoupon'];
$id = $_REQUEST['coupon_id'];
if($action == 'delcoupon'){
	$delcouponsql = 'DELETE FROM tbl_coupon WHERE id = "'.$id.'"';
	$delcouponexe = mysqli_query($conn,$delcouponsql);
	if($delcouponexe){
		$couponmessages .= showMessage('Coupon Has Been Deleted Successfully','success');
	}
}
	
?>