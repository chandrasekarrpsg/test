<?php
$message		= '';
$type= $_GET['type'];
ini_set("environmental_management_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_environmental_management']) && $_REQUEST['save_environmental_management']=="Save"){

	
$ser_alias = alias(strtolower($_REQUEST['environmental_management_title']));	
	$ser_sql="select * from tbl_environmental_management where alise='".$ser_alias."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
	
if(!empty($_FILES['environmental_management_image']['name']))
	{

		$image_name=time().$_FILES['environmental_management_image']['name'];
		$image_type=$_FILES['environmental_management_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['environmental_management_image']['size'];
		$temp_name=$_FILES['environmental_management_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}

	
if(!empty($_FILES['environmental_management_image_webp']['name']))
	{

		$bimage_name=time().$_FILES['environmental_management_image_webp']['name'];
		$image_type=$_FILES['environmental_management_image_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['environmental_management_image_webp']['size'];
		$temp_name=$_FILES['environmental_management_image_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$bimage_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$bimage_name = 'noimage.webp';

	}


	$add_environmental_management_sql="insert ignore into tbl_environmental_management set  
	 meta_title  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
	  meta_keyword  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
	   meta_desc  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',        
	environmental_management_title='".mysqli_real_escape_string($conn,$_REQUEST['environmental_management_title'])."',
	alise='".$ser_alias."',  
	environmental_management_srt_desc ='".mysqli_real_escape_string($conn,$_REQUEST['environmental_management_srt_desc'])."',
	   environmental_management_desc='".mysqli_real_escape_string($conn,$_REQUEST['environmental_management_desc'])."', 
	   environmental_management_link   	='".mysqli_real_escape_string($conn,$_REQUEST['environmental_management_link'])."', 
	   show_home   	='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."', 
	   environmental_management_date='".mysqli_real_escape_string($conn,$_REQUEST['environmental_management_date'])."',
	   environmental_management_image_webp ='".$bimage_name."',
			environmental_management_image='".$image_name."'";
			
	$add_environmental_management_exe=mysqli_query($conn,$add_environmental_management_sql) or die(mysqli_error($conn));
if($add_environmental_management_exe){
$environmental_managementmsg.= showMessage("Environmental Management has been added successfully",'success');		
}
}
else
{
		$environmental_managementmsg .= showMessage('There is an item with same name.','error');
}	
			 						
}

if(isset($_REQUEST['edit_environmental_management']) && $_REQUEST['edit_environmental_management']=="Update"){
	
	$ser_alias = alias(strtolower($_REQUEST['environmental_management_title']));	
	$ser_sql="select * from tbl_environmental_management where alise='".$ser_alias."' and environmental_management_id!='".$_REQUEST['environmental_management_id']."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
$edit_environmental_management_sql1="update ignore tbl_environmental_management set
 meta_title  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
	  meta_keyword  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
	   meta_desc  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',   
environmental_management_title='".mysqli_real_escape_string($conn,$_REQUEST['environmental_management_title'])."',
	alise='".$ser_alias."',  
	environmental_management_srt_desc ='".mysqli_real_escape_string($conn,$_REQUEST['environmental_management_srt_desc'])."',
	   environmental_management_desc='".mysqli_real_escape_string($conn,$_REQUEST['environmental_management_desc'])."',
	    environmental_management_date='".mysqli_real_escape_string($conn,$_REQUEST['environmental_management_date'])."',
	       environmental_management_link   	='".mysqli_real_escape_string($conn,$_REQUEST['environmental_management_link'])."', 
	   show_home   	='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."'   			
            where environmental_management_id ='".$_REQUEST['environmental_management_id']."'";
			$edit_environmental_management_exe1=mysqli_query($conn,$edit_environmental_management_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['environmental_management_image']['name']))
			{

			$image_name=time().$_FILES['environmental_management_image']['name'];
			$image_type=$_FILES['environmental_management_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['environmental_management_image']['size'];
			$temp_name=$_FILES['environmental_management_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_environmental_management_sql="update ignore tbl_environmental_management set 
			environmental_management_image ='".$image_name."'
			where environmental_management_id='".$_REQUEST['environmental_management_id']."'";
			mysqli_query($conn,$edit_environmental_management_sql)  or die(mysqli_error($conn));	

			}
			
			
			
			if(!empty($_FILES['environmental_management_image_webp']['name']))
			{

			$image_name=time().$_FILES['environmental_management_image_webp']['name'];
			$image_type=$_FILES['environmental_management_image_webp']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['environmental_management_image_webp']['size'];
			$temp_name=$_FILES['environmental_management_image_webp']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_environmental_management_sql="update ignore tbl_environmental_management set 
			environmental_management_image_webp ='".$image_name."'
			where environmental_management_id='".$_REQUEST['environmental_management_id']."'";
			mysqli_query($conn,$edit_environmental_management_sql)  or die(mysqli_error($conn));	

			}
		

if($edit_environmental_management_exe1){
$environmental_managementmsg.= showMessage("Environmental Management has been updated successfully",'success');		
}
}
else
{
	$environmental_managementmsg .= showMessage('There is an item with same name.','error');
}
}

$action  = $_REQUEST['actnenvironmental_management'];
$environmental_management_id = $_REQUEST['environmental_management_id'];
if($action == 'dellenvironmental_management' && !empty($environmental_management_id)){
$Delenvironmental_managementSql = 'DELETE FROM tbl_environmental_management WHERE environmental_management_id  = "'.$environmental_management_id.'"';
$Delenvironmental_managementQuery = g_db_query($Delenvironmental_managementSql);
if($Delenvironmental_managementQuery){
$environmental_managementmsg.= showMessage('The Environmental Management Has Been Deleted','success');
}
}
?>