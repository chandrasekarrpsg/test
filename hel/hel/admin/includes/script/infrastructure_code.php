<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_infrastructure']) && $_REQUEST['save_infrastructure']=="Save"){
if(!empty($_FILES['infrastructure_image']['name']))
	{

		$image_name=time().$_FILES['infrastructure_image']['name'];
		$image_type=$_FILES['infrastructure_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['infrastructure_image']['size'];
		$temp_name=$_FILES['infrastructure_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}
	
	if(!empty($_FILES['infrastructure_image_webp']['name']))
	{

		$wimage_name=time().$_FILES['infrastructure_image_webp']['name'];
		$image_type=$_FILES['infrastructure_image_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['infrastructure_image_webp']['size'];
		$temp_name=$_FILES['infrastructure_image_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$wimage_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$wimage_name = 'noimage.webp';

	}

	 $add_infrastructure_sql="insert ignore into tbl_infrastructure set     
	infrastructure_title='".mysqli_real_escape_string($conn,$_REQUEST['infrastructure_title'])."',  
	infrastructure_desc='".mysqli_real_escape_string($conn,$_REQUEST['infrastructure_desc'])."', 
	infrastructure_image='".$image_name."',
	infrastructure_image_webp='".$wimage_name."'";
			
	$add_infrastructure_exe=mysqli_query($conn,$add_infrastructure_sql) or die(mysqli_error($conn));
if($add_infrastructure_exe){
$infrastructuremsg.= showMessage("Infrastructure has been added successfully",'success');		
}
			 						
}

if(isset($_REQUEST['edit_infrastructure']) && $_REQUEST['edit_infrastructure']=="Update"){
$edit_infrastructure_sql1="update ignore tbl_infrastructure set     
	infrastructure_title='".mysqli_real_escape_string($conn,$_REQUEST['infrastructure_title'])."',  
	infrastructure_desc='".mysqli_real_escape_string($conn,$_REQUEST['infrastructure_desc'])."'			
            where infrastructure_id ='".$_REQUEST['infrastructure_id']."'";
			$edit_infrastructure_exe1=mysqli_query($conn,$edit_infrastructure_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['infrastructure_image']['name']))
			{

			$image_name=time().$_FILES['infrastructure_image']['name'];
			$image_type=$_FILES['infrastructure_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['infrastructure_image']['size'];
			$temp_name=$_FILES['infrastructure_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_infrastructure_sql="update ignore tbl_infrastructure set 
			infrastructure_image ='".$image_name."'
			where infrastructure_id='".$_REQUEST['infrastructure_id']."'";
			mysqli_query($conn,$edit_infrastructure_sql)  or die(mysqli_error($conn));	

			}
			
			if(!empty($_FILES['infrastructure_image_webp']['name']))
			{

			$image_name=time().$_FILES['infrastructure_image_webp']['name'];
			$image_type=$_FILES['infrastructure_image_webp']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['infrastructure_image_webp']['size'];
			$temp_name=$_FILES['infrastructure_image_webp']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_infrastructure_sql="update ignore tbl_infrastructure set 
			infrastructure_image_webp ='".$image_name."'
			where infrastructure_id='".$_REQUEST['infrastructure_id']."'";
			mysqli_query($conn,$edit_infrastructure_sql)  or die(mysqli_error($conn));	

			}
			
		

if($edit_infrastructure_exe1){
$infrastructuremsg.= showMessage("Infrastructure has been updated successfully",'success');		
}
}

$action  = $_REQUEST['actninfrastructure'];
$infrastructure_id = $_REQUEST['infrastructure_id'];
if($action == 'dellinfrastructure' && !empty($infrastructure_id)){
$DelinfrastructureSql = 'DELETE FROM tbl_infrastructure WHERE infrastructure_id  = "'.$infrastructure_id.'"';
$DelinfrastructureQuery = g_db_query($DelinfrastructureSql);
if($DelinfrastructureQuery){
$infrastructuremsg.= showMessage('The Infrastructure Has Been Deleted','success');
}
}
?>