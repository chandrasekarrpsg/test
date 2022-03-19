<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_color']) && $_REQUEST['save_color']=="Save"){
if(!empty($_FILES['color_image']['name']))
	{

		$image_name=time().$_FILES['color_image']['name'];
		$image_type=$_FILES['color_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['color_image']['size'];
		$temp_name=$_FILES['color_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}

	 $add_color_sql="insert ignore into tbl_color set     
	color_title='".mysqli_real_escape_string($conn,$_REQUEST['color_title'])."',  
	color_code='".mysqli_real_escape_string($conn,$_REQUEST['color_code'])."', 
			color_image='".$image_name."'";
			
	$add_color_exe=mysqli_query($conn,$add_color_sql) or die(mysqli_error($conn));
if($add_color_exe){
$colormsg.= showMessage("color has been added successfully",'success');		
}
			 						
}

if(isset($_REQUEST['edit_color']) && $_REQUEST['edit_color']=="Update"){
$edit_color_sql1="update ignore tbl_color set
color_title='".mysqli_real_escape_string($conn,$_REQUEST['color_title'])."', 
color_code='".mysqli_real_escape_string($conn,$_REQUEST['color_code'])."' 				
            where color_id ='".$_REQUEST['color_id']."'";
			$edit_color_exe1=mysqli_query($conn,$edit_color_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['color_image']['name']))
			{

			$image_name=time().$_FILES['color_image']['name'];
			$image_type=$_FILES['color_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['color_image']['size'];
			$temp_name=$_FILES['color_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_color_sql="update ignore tbl_color set 
			color_image ='".$image_name."'
			where color_id='".$_REQUEST['color_id']."'";
			mysqli_query($conn,$edit_color_sql)  or die(mysqli_error($conn));	

			}
			
		

if($edit_color_exe1){
$colormsg.= showMessage("color has been updated successfully",'success');		
}
}

$action  = $_REQUEST['actncolor'];
$color_id = $_REQUEST['color_id'];
if($action == 'dellcolor' && !empty($color_id)){
$DelcolorSql = 'DELETE FROM tbl_color WHERE color_id  = "'.$color_id.'"';
$DelcolorQuery = g_db_query($DelcolorSql);
if($DelcolorQuery){
$colormsg.= showMessage('The color Has Been Deleted','success');
}
}
?>