<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_ec_compliance']) && $_REQUEST['save_ec_compliance']=="Save"){
	

if(!empty($_FILES['first_half_file']['name']))
	{

		$first_half_file=time().$_FILES['first_half_file']['name'];
		$image_type=$_FILES['first_half_file']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['first_half_file']['size'];
		$temp_name=$_FILES['first_half_file']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$first_half_file;
		$upload=move_uploaded_file($temp_name,$uploadimage);
       
	}
	
	if(!empty($_FILES['second_half_file']['name']))
	{

		$second_half_file=time().$_FILES['second_half_file']['name'];
		$image_type=$_FILES['second_half_file']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['second_half_file']['size'];
		$temp_name=$_FILES['second_half_file']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$second_half_file;
		$upload=move_uploaded_file($temp_name,$uploadimage);
       
	}
	

	$add_ec_compliance_sql="insert ignore into  tbl_ec_compliance set       
	year_start ='".mysqli_real_escape_string($conn,$_REQUEST['year_start'])."',
	year_end ='".mysqli_real_escape_string($conn,$_REQUEST['year_end'])."',
	first_half_title ='".mysqli_real_escape_string($conn,$_REQUEST['first_half_title'])."',
	first_half_file ='".$first_half_file."',
	second_half_title ='".mysqli_real_escape_string($conn,$_REQUEST['second_half_title'])."',
	second_half_file ='".$second_half_file."',
	upload_date ='".date('Y-m-d')."'";
            
           //die(); 
$add_ec_compliance_exe=mysqli_query($conn,$add_ec_compliance_sql) or die(mysqli_error($conn));
if($add_ec_compliance_exe){
$ec_compliancemsg.= showMessage("ec compliance has been added successfully",'success');		
}			 						
}


if(isset($_REQUEST['edit_ec_compliance']) && $_REQUEST['edit_ec_compliance']=="Update"){
				
			
			if(!empty($_FILES['first_half_file']['name']))
			{

			$image_name=time().$_FILES['first_half_file']['name'];
			$image_type=$_FILES['first_half_file']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['first_half_file']['size'];
			$temp_name=$_FILES['first_half_file']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			 $edit_ec_compliance_sql="update ignore tbl_ec_compliance set 
			first_half_file ='".$image_name."'
			where ec_compliance_id='".$_REQUEST['ec_compliance_id']."'";
			$edit_ec_compliance_exe1=mysqli_query($conn,$edit_ec_compliance_sql)  or die(mysqli_error($conn));	

			}
			
			if(!empty($_FILES['second_half_file']['name']))
			{

			$image_name=time().$_FILES['second_half_file']['name'];
			$image_type=$_FILES['second_half_file']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['second_half_file']['size'];
			$temp_name=$_FILES['second_half_file']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			 $edit_ec_compliance_sql="update ignore tbl_ec_compliance set 
			second_half_file ='".$image_name."'
			where ec_compliance_id='".$_REQUEST['ec_compliance_id']."'";
			$edit_ec_compliance_exe1=mysqli_query($conn,$edit_ec_compliance_sql)  or die(mysqli_error($conn));	

			}
			
			
			$edit_ec_compliance_sql="update ignore tbl_ec_compliance set 
			year_start ='".mysqli_real_escape_string($conn,$_REQUEST['year_start'])."',
			year_end ='".mysqli_real_escape_string($conn,$_REQUEST['year_end'])."',
			first_half_title ='".mysqli_real_escape_string($conn,$_REQUEST['first_half_title'])."',
			
			second_half_title ='".mysqli_real_escape_string($conn,$_REQUEST['second_half_title'])."'
			
			where ec_compliance_id='".$_REQUEST['ec_compliance_id']."'";
			$edit_ec_compliance_exe1=mysqli_query($conn,$edit_ec_compliance_sql)  or die(mysqli_error($conn));	

if($edit_ec_compliance_exe1){
$ec_compliancemsg.= showMessage("ec compliance has been updated successfully",'success');		
}
}



$action  = $_REQUEST['actnec_compliance'];
$ec_compliance_id = $_REQUEST['ec_compliance_id'];
if($action == 'dellec_compliance' && !empty($ec_compliance_id))
{
$Delec_complianceSql = 'DELETE FROM tbl_ec_compliance WHERE ec_compliance_id  = "'.$ec_compliance_id.'"';
$Delec_complianceQuery = g_db_query($Delec_complianceSql);

if($Delec_complianceQuery){
$ec_compliancemsg.= showMessage('The ec compliance Has Been Deleted','success');
}
}






?>