<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );
	
if(isset($_REQUEST['save_internship']) && $_REQUEST['save_internship']=="Save"){


	$add_internship_sql="insert ignore into tbl_internship set 
	internship_post_date='".date('Y-m-d')."',
	internship_title='".mysqli_real_escape_string($conn,$_REQUEST['internship_title'])."',
	
	   internship_status='".mysqli_real_escape_string($conn,$_REQUEST['internship_status'])."'";
			
	$add_internship_exe=mysqli_query($conn,$add_internship_sql) or die(mysqli_error($conn));
if($add_internship_exe){
	
	
$internshipmsg.= showMessage("Internship Post has been added successfully",'success');		
}
	
			 						
}

if(isset($_REQUEST['edit_internship']) && $_REQUEST['edit_internship']=="Update"){
	$date=date('Y-m-d',strtotime($_REQUEST['internship_date']));
	$ser_alias = alias(strtolower($_REQUEST['internship_title']));	
	
 $edit_internship_sql1="update ignore tbl_internship set
		internship_title='".mysqli_real_escape_string($conn,$_REQUEST['internship_title'])."',
	
	   internship_status='".mysqli_real_escape_string($conn,$_REQUEST['internship_status'])."'  			
            where internship_id ='".$_REQUEST['internship_id']."'";
			$edit_internship_exe1=mysqli_query($conn,$edit_internship_sql1)  or die(mysqli_error($conn));	

if($edit_internship_exe1){
$internshipmsg.= showMessage("Internship Post has been updated successfully",'success');		
}

}

$action  = $_REQUEST['actninternship'];
$internship_id = $_REQUEST['internship_id'];
if($action == 'dellinternship' && !empty($internship_id)){
$DelinternshipSql = 'DELETE FROM tbl_internship WHERE internship_id  = "'.$internship_id.'"';
$DelinternshipQuery = g_db_query($DelinternshipSql);
if($DelinternshipQuery){
$internshipmsg.= showMessage('The Internship Post Has Been Deleted','success');
}
}
?>