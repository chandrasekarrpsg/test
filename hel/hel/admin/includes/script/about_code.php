<?php
$message		= '';
$type= $_GET['type'];
ini_set("about_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_about']) && $_REQUEST['save_about']=="Save"){
	
	
if(!empty($_FILES['about_image']['name']))
	{

		$image_name=time().$_FILES['about_image']['name'];
		$image_type=$_FILES['about_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['about_image']['size'];
		$temp_name=$_FILES['about_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}

	$add_about_sql="insert ignore into tbl_about_slider set       
	about_title='".mysqli_real_escape_string($conn,$_REQUEST['about_title'])."',
	about_video='".mysqli_real_escape_string($conn,$_REQUEST['about_video'])."',
	   short_desc='".mysqli_real_escape_string($conn,$_REQUEST['about_desc'])."',	
			about_image='".$image_name."'";
			
	$add_about_exe=mysqli_query($conn,$add_about_sql) or die(mysqli_error($conn));
if($add_about_exe){
$aboutmsg.= showMessage("Home Video has been added successfully",'success');		
}
}

if(isset($_REQUEST['edit_about']) && $_REQUEST['edit_about']=="Update"){

$edit_about_sql1="update ignore tbl_about_slider set
	about_title='".mysqli_real_escape_string($conn,$_REQUEST['about_title'])."', 
	about_video='".mysqli_real_escape_string($conn,$_REQUEST['about_video'])."',
	   short_desc='".mysqli_real_escape_string($conn,$_REQUEST['about_desc'])."'	
            where about_id ='".$_REQUEST['about_id']."'";
			$edit_about_exe1=mysqli_query($conn,$edit_about_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['about_image']['name']))
			{

			$image_name=time().$_FILES['about_image']['name'];
			$image_type=$_FILES['about_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['about_image']['size'];
			$temp_name=$_FILES['about_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_about_sql="update ignore tbl_about_slider set 
			about_image ='".$image_name."'
			where about_id='".$_REQUEST['about_id']."'";
			mysqli_query($conn,$edit_about_sql)  or die(mysqli_error($conn));	

			}
			
		

if($edit_about_exe1){
$aboutmsg.= showMessage("Home Video has been updated successfully",'success');		
}
}


$action  = $_REQUEST['actnabout'];
$about_id = $_REQUEST['about_id'];
if($action == 'dellabout' && !empty($about_id)){
$DelaboutSql = 'DELETE FROM tbl_about_slider WHERE about_id  = "'.$about_id.'"';
$DelaboutQuery = g_db_query($DelaboutSql);
if($DelaboutQuery){
$aboutmsg.= showMessage('The Home Video Has Been Deleted','success');
}
}
?>