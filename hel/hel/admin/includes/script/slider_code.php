<?php
$message		= '';
$type= $_GET['type'];
ini_set("banner_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_slider']) && $_REQUEST['save_slider']=="Save"){
	
if(!empty($_FILES['banner_image']['name']))
	{
 
		$image_name=time().$_FILES['banner_image']['name'];
		$image_type=$_FILES['banner_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['banner_image']['size'];
		$temp_name=$_FILES['banner_image']['tmp_name'];
		$dir="slider/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}
	
	
	if(!empty($_FILES['banner_logo']['name']))
	{
 
		$mobimage_name=time().$_FILES['banner_logo']['name'];
		$image_type=$_FILES['banner_logo']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['banner_logo']['size'];
		$temp_name=$_FILES['banner_logo']['tmp_name'];
		$dir="slider/";
		$uploadimage=$dir.$mobimage_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$mobimage_name = 'noimage.jpg';

	}
	
	
	$add_slider_sql="insert ignore into tbl_banner set       
	banner_title='".mysqli_real_escape_string($conn,$_REQUEST['banner_title'])."',
	
	banner_desc='".mysqli_real_escape_string($conn,$_REQUEST['banner_desc'])."', 
	    	banner_cont1='".mysqli_real_escape_string($conn,$_REQUEST['banner_cont1'])."', 
	    	banner_link='".mysqli_real_escape_string($conn,$_REQUEST['banner_link'])."', 
	     
	banner_image='".$image_name."',
	banner_image_webp='".$mobimage_name."',
	banner_bg_image='".$bgimage_name."'";
			
	$add_slider_exe=mysqli_query($conn,$add_slider_sql) or die(mysqli_error($conn));
if($add_slider_exe){
$slidermsg.= showMessage("Slider has been added successfully",'success');		
}

else
{
		$slidermsg .= showMessage('There is an item with same name.','error');
}	
			 						
}

if(isset($_REQUEST['edit_slider']) && $_REQUEST['edit_slider']=="Update"){
	
	$edit_banner_sql1="update ignore tbl_banner set
			banner_title='".mysqli_real_escape_string($conn,$_REQUEST['banner_title'])."', 
			
				banner_cont1='".mysqli_real_escape_string($conn,$_REQUEST['banner_cont1'])."', 
				banner_link='".mysqli_real_escape_string($conn,$_REQUEST['banner_link'])."', 	 
	   		banner_desc='".mysqli_real_escape_string($conn,$_REQUEST['banner_desc'])."'
	   		where banner_id ='".$_REQUEST['banner_id']."'";
			$edit_banner_exe1=mysqli_query($conn,$edit_banner_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['banner_image']['name']))
			{

			$image_name=time().$_FILES['banner_image']['name'];
			$image_type=$_FILES['banner_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['banner_image']['size'];
			$temp_name=$_FILES['banner_image']['tmp_name'];
			$dir="slider/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_banner_sql="update ignore tbl_banner set 
			banner_image ='".$image_name."'
			where banner_id='".$_REQUEST['banner_id']."'";
			mysqli_query($conn,$edit_banner_sql)  or die(mysqli_error($conn));	

			}
			
			if(!empty($_FILES['banner_logo']['name']))
			{

			$image_name2=time().$_FILES['banner_logo']['name'];
			$image_type=$_FILES['banner_logo']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['banner_logo']['size'];
			$temp_name=$_FILES['banner_logo']['tmp_name'];
			$dir="slider/";
			$uploadimage=$dir.$image_name2;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_banner_sql="update ignore tbl_banner set 
			banner_image_webp ='".$image_name2."'
			where banner_id='".$_REQUEST['banner_id']."'";
			mysqli_query($conn,$edit_banner_sql)  or die(mysqli_error($conn));	

			}
			
		

if($edit_banner_exe1){
$slidermsg.= showMessage("Slider has been updated successfully",'success');		
}

else
{
	$slidermsg .= showMessage('There is an item with same name.','error');
}
}

$action  = $_REQUEST['actnbanner'];
$banner_id = $_REQUEST['banner_id'];
if($action == 'dellbanner' && !empty($banner_id)){
$DelbannerSql = 'DELETE FROM tbl_banner WHERE banner_id  = "'.$banner_id.'"';
$DelbannerQuery = g_db_query($DelbannerSql);
if($DelbannerQuery){
$slidermsg.= showMessage('The Banner Has Been deleted','success');
}
}
?>