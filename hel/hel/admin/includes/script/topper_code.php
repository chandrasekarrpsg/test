<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_topper']) && $_REQUEST['save_topper']=="Save"){
if(!empty($_FILES['topper_image']['name']))
	{

		$image_name=time().$_FILES['topper_image']['name'];
		$image_type=$_FILES['topper_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['topper_image']['size'];
		$temp_name=$_FILES['topper_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}
	
	
	
	if(!empty($_FILES['topper_image_webp']['name']))
	{

		$image_name=time().$_FILES['topper_image_webp']['name'];
		$image_type=$_FILES['topper_image_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['topper_image_webp']['size'];
		$temp_name=$_FILES['topper_image_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}

	 $add_topper_sql="insert ignore into tbl_topper set     
	topper_title='".mysqli_real_escape_string($conn,$_REQUEST['topper_title'])."',  
	topper_details='".mysqli_real_escape_string($conn,$_REQUEST['topper_details'])."', 
			topper_image='".$image_name."'";
			
	$add_topper_exe=mysqli_query($conn,$add_topper_sql) or die(mysqli_error($conn));
if($add_topper_exe){
$toppermsg.= showMessage("topper has been added successfully",'success');		
}
			 						
}

if(isset($_REQUEST['edit_topper']) && $_REQUEST['edit_topper']=="Update"){
$edit_topper_sql1="update ignore tbl_topper set
topper_title='".mysqli_real_escape_string($conn,$_REQUEST['topper_title'])."',  
topper_details='".mysqli_real_escape_string($conn,$_REQUEST['topper_details'])."' 				
            where topper_id ='".$_REQUEST['topper_id']."'";
			$edit_topper_exe1=mysqli_query($conn,$edit_topper_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['topper_image']['name']))
			{

			$image_name=time().$_FILES['topper_image']['name'];
			$image_type=$_FILES['topper_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['topper_image']['size'];
			$temp_name=$_FILES['topper_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_topper_sql="update ignore tbl_topper set 
			topper_image ='".$image_name."'
			where topper_id='".$_REQUEST['topper_id']."'";
			mysqli_query($conn,$edit_topper_sql)  or die(mysqli_error($conn));	

			}
			
			
			if(!empty($_FILES['topper_image_webp']['name']))
			{

			$image_name=time().$_FILES['topper_image_webp']['name'];
			$image_type=$_FILES['topper_image_webp']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['topper_image_webp']['size'];
			$temp_name=$_FILES['topper_image_webp']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_topper_sql="update ignore tbl_topper set 
			topper_image_webp ='".$image_name."'
			where topper_id='".$_REQUEST['topper_id']."'";
			mysqli_query($conn,$edit_topper_sql)  or die(mysqli_error($conn));	

			}
			
		

if($edit_topper_exe1){
$toppermsg.= showMessage("topper has been updated successfully",'success');		
}
}

$action  = $_REQUEST['actntopper'];
$topper_id = $_REQUEST['topper_id'];
if($action == 'delltopper' && !empty($topper_id)){
$DeltopperSql = 'DELETE FROM tbl_topper WHERE topper_id  = "'.$topper_id.'"';
$DeltopperQuery = g_db_query($DeltopperSql);
if($DeltopperQuery){
$toppermsg.= showMessage('The topper Has Been Deleted','success');
}
}
?>