<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_client']) && $_REQUEST['save_client']=="Save"){
if(!empty($_FILES['client_image']['name']))
	{

		$image_name=time().$_FILES['client_image']['name'];
		$image_type=$_FILES['client_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['client_image']['size'];
		$temp_name=$_FILES['client_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}

	 $add_client_sql="insert ignore into tbl_client set     
	client_title='".mysqli_real_escape_string($conn,$_REQUEST['client_title'])."',  
	client_link='".mysqli_real_escape_string($conn,$_REQUEST['client_link'])."', 
			client_image='".$image_name."'";
			
	$add_client_exe=mysqli_query($conn,$add_client_sql) or die(mysqli_error($conn));
if($add_client_exe){
$clientmsg.= showMessage("client has been added successfully",'success');		
}
			 						
}

if(isset($_REQUEST['edit_client']) && $_REQUEST['edit_client']=="Update"){
$edit_client_sql1="update ignore tbl_client set
client_title='".mysqli_real_escape_string($conn,$_REQUEST['client_title'])."', 
client_link='".mysqli_real_escape_string($conn,$_REQUEST['client_link'])."' 				
            where client_id ='".$_REQUEST['client_id']."'";
			$edit_client_exe1=mysqli_query($conn,$edit_client_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['client_image']['name']))
			{

			$image_name=time().$_FILES['client_image']['name'];
			$image_type=$_FILES['client_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['client_image']['size'];
			$temp_name=$_FILES['client_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_client_sql="update ignore tbl_client set 
			client_image ='".$image_name."'
			where client_id='".$_REQUEST['client_id']."'";
			mysqli_query($conn,$edit_client_sql)  or die(mysqli_error($conn));	

			}
			
		

if($edit_client_exe1){
$clientmsg.= showMessage("client has been updated successfully",'success');		
}
}

$action  = $_REQUEST['actnclient'];
$client_id = $_REQUEST['client_id'];
if($action == 'dellclient' && !empty($client_id)){
$DelclientSql = 'DELETE FROM tbl_client WHERE client_id  = "'.$client_id.'"';
$DelclientQuery = g_db_query($DelclientSql);
if($DelclientQuery){
$clientmsg.= showMessage('The client Has Been Deleted','success');
}
}
?>