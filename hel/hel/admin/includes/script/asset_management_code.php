<?php
$message		= '';
$type= $_GET['type'];
ini_set("asset_management_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_asset_management']) && $_REQUEST['save_asset_management']=="Save"){
	
if(!empty($_FILES['asset_management_image']['name']))
	{
 
		$image_name=time().$_FILES['asset_management_image']['name'];
		$image_type=$_FILES['asset_management_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['asset_management_image']['size'];
		$temp_name=$_FILES['asset_management_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}
	
	
	
	
	$add_asset_management_sql="insert ignore into tbl_asset_management set       
	asset_management_title='".mysqli_real_escape_string($conn,$_REQUEST['asset_management_title'])."',
	
	asset_management_desc='".mysqli_real_escape_string($conn,$_REQUEST['asset_management_desc'])."', 
	    	asset_management_cont1='".mysqli_real_escape_string($conn,$_REQUEST['asset_management_cont1'])."', 
	    	asset_management_link='".mysqli_real_escape_string($conn,$_REQUEST['asset_management_link'])."', 
	     
	asset_management_image='".$image_name."'";
			
	$add_asset_management_exe=mysqli_query($conn,$add_asset_management_sql) or die(mysqli_error($conn));
if($add_asset_management_exe){
$asset_managementmsg.= showMessage("Asset Management has been added successfully",'success');		
}

else
{
		$asset_managementmsg .= showMessage('There is an item with same name.','error');
}	
			 						
}

if(isset($_REQUEST['edit_asset_management']) && $_REQUEST['edit_asset_management']=="Update"){
	
	$edit_asset_management_sql1="update ignore tbl_asset_management set
			asset_management_title='".mysqli_real_escape_string($conn,$_REQUEST['asset_management_title'])."', 
			
				asset_management_cont1='".mysqli_real_escape_string($conn,$_REQUEST['asset_management_cont1'])."', 
				asset_management_link='".mysqli_real_escape_string($conn,$_REQUEST['asset_management_link'])."', 	 
	   		asset_management_desc='".mysqli_real_escape_string($conn,$_REQUEST['asset_management_desc'])."'
	   		where asset_management_id ='".$_REQUEST['asset_management_id']."'";
			$edit_asset_management_exe1=mysqli_query($conn,$edit_asset_management_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['asset_management_image']['name']))
			{

			$image_name=time().$_FILES['asset_management_image']['name'];
			$image_type=$_FILES['asset_management_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['asset_management_image']['size'];
			$temp_name=$_FILES['asset_management_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_asset_management_sql="update ignore tbl_asset_management set 
			asset_management_image ='".$image_name."'
			where asset_management_id='".$_REQUEST['asset_management_id']."'";
			mysqli_query($conn,$edit_asset_management_sql)  or die(mysqli_error($conn));	

			}
			
			
		

if($edit_asset_management_exe1){
$asset_managementmsg.= showMessage("Asset Management has been updated successfully",'success');		
}

else
{
	$asset_managementmsg .= showMessage('There is an item with same name.','error');
}
}

$action  = $_REQUEST['actnasset_management'];
$asset_management_id = $_REQUEST['asset_management_id'];
if($action == 'dellasset_management' && !empty($asset_management_id)){
$Delasset_managementSql = 'DELETE FROM tbl_asset_management WHERE asset_management_id  = "'.$asset_management_id.'"';
$Delasset_managementQuery = g_db_query($Delasset_managementSql);
if($Delasset_managementQuery){
$asset_managementmsg.= showMessage('The Asset Management Has Been deleted','success');
}
}
?>