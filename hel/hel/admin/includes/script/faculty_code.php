<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_faculty']) && $_REQUEST['save_faculty']=="Save"){
if(!empty($_FILES['faculty_image']['name']))
	{

		$image_name=time().$_FILES['faculty_image']['name'];
		$image_type=$_FILES['faculty_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['faculty_image']['size'];
		$temp_name=$_FILES['faculty_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}
	
	
	
	if(!empty($_FILES['faculty_image_webp']['name']))
	{

		$image_name=time().$_FILES['faculty_image_webp']['name'];
		$image_type=$_FILES['faculty_image_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['faculty_image_webp']['size'];
		$temp_name=$_FILES['faculty_image_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}

	 $add_faculty_sql="insert ignore into tbl_faculty set     
	faculty_title='".mysqli_real_escape_string($conn,$_REQUEST['faculty_title'])."',  
	faculty_details='".mysqli_real_escape_string($conn,$_REQUEST['faculty_details'])."', 
			faculty_image='".$image_name."'";
			
	$add_faculty_exe=mysqli_query($conn,$add_faculty_sql) or die(mysqli_error($conn));
if($add_faculty_exe){
$facultymsg.= showMessage("faculty has been added successfully",'success');		
}
			 						
}

if(isset($_REQUEST['edit_faculty']) && $_REQUEST['edit_faculty']=="Update"){
$edit_faculty_sql1="update ignore tbl_faculty set
faculty_title='".mysqli_real_escape_string($conn,$_REQUEST['faculty_title'])."',  
faculty_details='".mysqli_real_escape_string($conn,$_REQUEST['faculty_details'])."' 				
            where faculty_id ='".$_REQUEST['faculty_id']."'";
			$edit_faculty_exe1=mysqli_query($conn,$edit_faculty_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['faculty_image']['name']))
			{

			$image_name=time().$_FILES['faculty_image']['name'];
			$image_type=$_FILES['faculty_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['faculty_image']['size'];
			$temp_name=$_FILES['faculty_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_faculty_sql="update ignore tbl_faculty set 
			faculty_image ='".$image_name."'
			where faculty_id='".$_REQUEST['faculty_id']."'";
			mysqli_query($conn,$edit_faculty_sql)  or die(mysqli_error($conn));	

			}
			
			
			if(!empty($_FILES['faculty_image_webp']['name']))
			{

			$image_name=time().$_FILES['faculty_image_webp']['name'];
			$image_type=$_FILES['faculty_image_webp']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['faculty_image_webp']['size'];
			$temp_name=$_FILES['faculty_image_webp']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_faculty_sql="update ignore tbl_faculty set 
			faculty_image_webp ='".$image_name."'
			where faculty_id='".$_REQUEST['faculty_id']."'";
			mysqli_query($conn,$edit_faculty_sql)  or die(mysqli_error($conn));	

			}
			
		

if($edit_faculty_exe1){
$facultymsg.= showMessage("faculty has been updated successfully",'success');		
}
}

$action  = $_REQUEST['actnfaculty'];
$faculty_id = $_REQUEST['faculty_id'];
if($action == 'dellfaculty' && !empty($faculty_id)){
$DelfacultySql = 'DELETE FROM tbl_faculty WHERE faculty_id  = "'.$faculty_id.'"';
$DelfacultyQuery = g_db_query($DelfacultySql);
if($DelfacultyQuery){
$facultymsg.= showMessage('The faculty Has Been Deleted','success');
}
}
?>