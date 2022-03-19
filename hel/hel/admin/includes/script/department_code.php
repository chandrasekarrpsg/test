<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_department']) && $_REQUEST['save_department']=="Save"){
	


	

	$add_department_sql="insert ignore into  tbl_department set       
	department_name ='".mysqli_real_escape_string($conn,$_REQUEST['department_name'])."'";
            
           //die(); 
$add_department_exe=mysqli_query($conn,$add_department_sql) or die(mysqli_error($conn));
if($add_department_exe){
$departmentmsg.= showMessage("department has been added successfully",'success');		
}			 						
}


if(isset($_REQUEST['edit_department']) && $_REQUEST['edit_department']=="Update"){
				
			
			
			$edit_department_sql="update ignore tbl_department set 
			department_name ='".mysqli_real_escape_string($conn,$_REQUEST['department_name'])."'
			where department_id='".$_REQUEST['department_id']."'";
			$edit_department_exe1=mysqli_query($conn,$edit_department_sql)  or die(mysqli_error($conn));	

if($edit_department_exe1){
$departmentmsg.= showMessage("department has been updated successfully",'success');		
}
}



$action  = $_REQUEST['actndepartment'];
$department_id = $_REQUEST['department_id'];
if($action == 'delldepartment' && !empty($department_id))
{
$DeldepartmentSql = 'DELETE FROM tbl_department WHERE department_id  = "'.$department_id.'"';
$DeldepartmentQuery = g_db_query($DeldepartmentSql);

if($DeldepartmentQuery){
$departmentmsg.= showMessage('The department Has Been Deleted','success');
}
}






?>