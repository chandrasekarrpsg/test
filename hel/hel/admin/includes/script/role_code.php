<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_role']) && $_REQUEST['save_role']=="Save"){
	


	

	$add_role_sql="insert ignore into  tbl_role set       
	role_name ='".mysqli_real_escape_string($conn,$_REQUEST['role_name'])."'";
            
           //die(); 
$add_role_exe=mysqli_query($conn,$add_role_sql) or die(mysqli_error($conn));
if($add_role_exe){
$rolemsg.= showMessage("role has been added successfully",'success');		
}			 						
}


if(isset($_REQUEST['edit_role']) && $_REQUEST['edit_role']=="Update"){
				
			
			
			$edit_role_sql="update ignore tbl_role set 
			role_name ='".mysqli_real_escape_string($conn,$_REQUEST['role_name'])."'
			where role_id='".$_REQUEST['role_id']."'";
			$edit_role_exe1=mysqli_query($conn,$edit_role_sql)  or die(mysqli_error($conn));	

if($edit_role_exe1){
$rolemsg.= showMessage("role has been updated successfully",'success');		
}
}



$action  = $_REQUEST['actnrole'];
$role_id = $_REQUEST['role_id'];
if($action == 'dellrole' && !empty($role_id))
{
$DelroleSql = 'DELETE FROM tbl_role WHERE role_id  = "'.$role_id.'"';
$DelroleQuery = g_db_query($DelroleSql);

if($DelroleQuery){
$rolemsg.= showMessage('The role Has Been Deleted','success');
}
}






?>