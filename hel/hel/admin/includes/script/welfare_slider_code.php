<?php
$message		= '';
$type= $_GET['type'];
ini_set("welfare_banner_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_welfare_slider']) && $_REQUEST['save_welfare_slider']=="Save"){
	
if(!empty($_FILES['welfare_banner_image']['name']))
	{
 
		$image_name=time().$_FILES['welfare_banner_image']['name'];
		$image_type=$_FILES['welfare_banner_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['welfare_banner_image']['size'];
		$temp_name=$_FILES['welfare_banner_image']['tmp_name'];
		$dir="slider/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}
	
	
	
	
	$add_welfare_slider_sql="insert ignore into tbl_welfare_banner set       
	
	
	welfare_banner_desc='".mysqli_real_escape_string($conn,$_REQUEST['welfare_banner_desc'])."', 
	    	
	     
	welfare_banner_image='".$image_name."'";
			
	$add_welfare_slider_exe=mysqli_query($conn,$add_welfare_slider_sql) or die(mysqli_error($conn));
if($add_welfare_slider_exe){
$welfare_slidermsg.= showMessage("Slider has been added successfully",'success');		
}

else
{
		$welfare_slidermsg .= showMessage('There is an item with same name.','error');
}	
			 						
}

if(isset($_REQUEST['edit_welfare_slider']) && $_REQUEST['edit_welfare_slider']=="Update"){
	
	$edit_welfare_banner_sql1="update ignore tbl_welfare_banner set
			
	   		welfare_banner_desc='".mysqli_real_escape_string($conn,$_REQUEST['welfare_banner_desc'])."'
	   		where welfare_banner_id ='".$_REQUEST['welfare_banner_id']."'";
			$edit_welfare_banner_exe1=mysqli_query($conn,$edit_welfare_banner_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['welfare_banner_image']['name']))
			{

			$image_name=time().$_FILES['welfare_banner_image']['name'];
			$image_type=$_FILES['welfare_banner_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['welfare_banner_image']['size'];
			$temp_name=$_FILES['welfare_banner_image']['tmp_name'];
			$dir="slider/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_welfare_banner_sql="update ignore tbl_welfare_banner set 
			welfare_banner_image ='".$image_name."'
			where welfare_banner_id='".$_REQUEST['welfare_banner_id']."'";
			mysqli_query($conn,$edit_welfare_banner_sql)  or die(mysqli_error($conn));	

			}
			
			
		

if($edit_welfare_banner_exe1){
$welfare_slidermsg.= showMessage("Slider has been updated successfully",'success');		
}

else
{
	$welfare_slidermsg .= showMessage('There is an item with same name.','error');
}
}

$action  = $_REQUEST['actnwelfare_banner'];
$welfare_banner_id = $_REQUEST['welfare_banner_id'];
if($action == 'dellwelfare_banner' && !empty($welfare_banner_id)){
$Delwelfare_bannerSql = 'DELETE FROM tbl_welfare_banner WHERE welfare_banner_id  = "'.$welfare_banner_id.'"';
$Delwelfare_bannerQuery = g_db_query($Delwelfare_bannerSql);
if($Delwelfare_bannerQuery){
$welfare_slidermsg.= showMessage('The Banner Has Been deleted','success');
}
}
?>