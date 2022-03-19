<?php
$message		= '';
$type= $_GET['type'];
ini_set("job_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );
	
if(isset($_REQUEST['save_job']) && $_REQUEST['save_job']=="Save"){


	$add_job_sql="insert ignore into tbl_job set 
	job_post_date='".date('Y-m-d')."',
	job_title='".mysqli_real_escape_string($conn,$_REQUEST['job_title'])."',
	exp_required ='".mysqli_real_escape_string($conn,$_REQUEST['exp_required'])."',  
	   job_location='".mysqli_real_escape_string($conn,$_REQUEST['job_location'])."',
	   job_industry ='".mysqli_real_escape_string($conn,$_REQUEST['job_industry'])."',  
	   job_specification ='".mysqli_real_escape_string($conn,$_REQUEST['job_specification'])."',  
	   job_level ='".mysqli_real_escape_string($conn,$_REQUEST['job_level'])."', 
	   job_function ='".mysqli_real_escape_string($conn,$_REQUEST['job_function'])."',  
	   employment_type ='".mysqli_real_escape_string($conn,$_REQUEST['employment_type'])."',
	   job_status='".mysqli_real_escape_string($conn,$_REQUEST['job_status'])."'";
			
	$add_job_exe=mysqli_query($conn,$add_job_sql) or die(mysqli_error($conn));
if($add_job_exe){
	
	
$jobmsg.= showMessage("Job Post has been added successfully",'success');		
}
	
			 						
}

if(isset($_REQUEST['edit_job']) && $_REQUEST['edit_job']=="Update"){
	$date=date('Y-m-d',strtotime($_REQUEST['job_date']));
	$ser_alias = alias(strtolower($_REQUEST['job_title']));	
	
 $edit_job_sql1="update ignore tbl_job set
		job_title='".mysqli_real_escape_string($conn,$_REQUEST['job_title'])."',
	exp_required ='".mysqli_real_escape_string($conn,$_REQUEST['exp_required'])."',  
	   job_location='".mysqli_real_escape_string($conn,$_REQUEST['job_location'])."',
	    job_industry ='".mysqli_real_escape_string($conn,$_REQUEST['job_industry'])."',  
	   job_specification ='".mysqli_real_escape_string($conn,$_REQUEST['job_specification'])."',  
	   job_level ='".mysqli_real_escape_string($conn,$_REQUEST['job_level'])."', 
	   job_function ='".mysqli_real_escape_string($conn,$_REQUEST['job_function'])."',  
	   employment_type ='".mysqli_real_escape_string($conn,$_REQUEST['employment_type'])."',
	   job_status='".mysqli_real_escape_string($conn,$_REQUEST['job_status'])."'  			
            where job_id ='".$_REQUEST['job_id']."'";
			$edit_job_exe1=mysqli_query($conn,$edit_job_sql1)  or die(mysqli_error($conn));	

if($edit_job_exe1){
$jobmsg.= showMessage("Job Post has been updated successfully",'success');		
}

}

$action  = $_REQUEST['actnjob'];
$job_id = $_REQUEST['job_id'];
if($action == 'delljob' && !empty($job_id)){
$DeljobSql = 'DELETE FROM tbl_job WHERE job_id  = "'.$job_id.'"';
$DeljobQuery = g_db_query($DeljobSql);
if($DeljobQuery){
$jobmsg.= showMessage('The Job Post Has Been Deleted','success');
}
}
?>