<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_schedule_doc']) && $_REQUEST['save_schedule_doc']=="Save"){
	

if(!empty($_FILES['schedule_doc_file']['name']))
	{

		$image_name=time().$_FILES['schedule_doc_file']['name'];
		$image_type=$_FILES['schedule_doc_file']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['schedule_doc_file']['size'];
		$temp_name=$_FILES['schedule_doc_file']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
       
	}
	

	$add_schedule_doc_sql="insert ignore into  tbl_schedule_doc set       
	schedule_doc_title ='".mysqli_real_escape_string($conn,$_REQUEST['schedule_doc_title'])."',
	schedule_doc_desc ='".mysqli_real_escape_string($conn,$_REQUEST['schedule_doc_desc'])."',
	report_date ='".mysqli_real_escape_string($conn,$_REQUEST['report_date'])."',
	upload_date ='".date('Y-m-d')."',
	schedule_doc_file='".$image_name."'";
            
           //die(); 
$add_schedule_doc_exe=mysqli_query($conn,$add_schedule_doc_sql) or die(mysqli_error($conn));
if($add_schedule_doc_exe){
$schedule_docmsg.= showMessage("schedule doc has been added successfully",'success');		
}			 						
}


if(isset($_REQUEST['edit_schedule_doc']) && $_REQUEST['edit_schedule_doc']=="Update"){
				
			
			if(!empty($_FILES['schedule_doc_file']['name']))
			{

			$image_name=time().$_FILES['schedule_doc_file']['name'];
			$image_type=$_FILES['schedule_doc_file']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['schedule_doc_file']['size'];
			$temp_name=$_FILES['schedule_doc_file']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			 $edit_schedule_doc_sql="update ignore tbl_schedule_doc set 
			schedule_doc_file ='".$image_name."'
			where schedule_doc_id='".$_REQUEST['schedule_doc_id']."'";
			$edit_schedule_doc_exe1=mysqli_query($conn,$edit_schedule_doc_sql)  or die(mysqli_error($conn));	

			}
			$edit_schedule_doc_sql="update ignore tbl_schedule_doc set 
			schedule_doc_title ='".mysqli_real_escape_string($conn,$_REQUEST['schedule_doc_title'])."',
			schedule_doc_desc ='".mysqli_real_escape_string($conn,$_REQUEST['schedule_doc_desc'])."',
			report_date ='".mysqli_real_escape_string($conn,$_REQUEST['report_date'])."'
			where schedule_doc_id='".$_REQUEST['schedule_doc_id']."'";
			$edit_schedule_doc_exe1=mysqli_query($conn,$edit_schedule_doc_sql)  or die(mysqli_error($conn));	

if($edit_schedule_doc_exe1){
$schedule_docmsg.= showMessage("schedule doc has been updated successfully",'success');		
}
}



$action  = $_REQUEST['actnschedule_doc'];
$schedule_doc_id = $_REQUEST['schedule_doc_id'];
if($action == 'dellschedule_doc' && !empty($schedule_doc_id))
{
$Delschedule_docSql = 'DELETE FROM tbl_schedule_doc WHERE schedule_doc_id  = "'.$schedule_doc_id.'"';
$Delschedule_docQuery = g_db_query($Delschedule_docSql);

if($Delschedule_docQuery){
$schedule_docmsg.= showMessage('The schedule doc Has Been Deleted','success');
}
}






?>