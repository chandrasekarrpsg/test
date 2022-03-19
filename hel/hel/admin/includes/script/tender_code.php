<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_tender']) && $_REQUEST['save_tender']=="Save"){
	

if(!empty($_FILES['tender_file']['name']))
	{

		$image_name=time().$_FILES['tender_file']['name'];
		$image_type=$_FILES['tender_file']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['tender_file']['size'];
		$temp_name=$_FILES['tender_file']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
       
	}
	

	$add_tender_sql="insert ignore into  tbl_tender set       
	tender_title ='".mysqli_real_escape_string($conn,$_REQUEST['tender_title'])."',
	tender_desc ='".mysqli_real_escape_string($conn,$_REQUEST['tender_desc'])."',
	tender_date ='".mysqli_real_escape_string($conn,$_REQUEST['tender_date'])."',
	tender_date2 ='".mysqli_real_escape_string($conn,$_REQUEST['tender_date2'])."',
	upload_date ='".date('Y-m-d')."',
	tender_file='".$image_name."'";
            
           //die(); 
$add_tender_exe=mysqli_query($conn,$add_tender_sql) or die(mysqli_error($conn));
if($add_tender_exe){
$tendermsg.= showMessage("tender has been added successfully",'success');		
}			 						
}


if(isset($_REQUEST['edit_tender']) && $_REQUEST['edit_tender']=="Update"){
				
			
			if(!empty($_FILES['tender_file']['name']))
			{

			$image_name=time().$_FILES['tender_file']['name'];
			$image_type=$_FILES['tender_file']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['tender_file']['size'];
			$temp_name=$_FILES['tender_file']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			 $edit_tender_sql="update ignore tbl_tender set 
			tender_file ='".$image_name."'
			where tender_id='".$_REQUEST['tender_id']."'";
			$edit_tender_exe1=mysqli_query($conn,$edit_tender_sql)  or die(mysqli_error($conn));	

			}
			$edit_tender_sql="update ignore tbl_tender set 
			tender_title ='".mysqli_real_escape_string($conn,$_REQUEST['tender_title'])."',
		
			tender_desc ='".mysqli_real_escape_string($conn,$_REQUEST['tender_desc'])."',
			tender_date ='".mysqli_real_escape_string($conn,$_REQUEST['tender_date'])."',
			tender_date2 ='".mysqli_real_escape_string($conn,$_REQUEST['tender_date2'])."'
			where tender_id='".$_REQUEST['tender_id']."'";
			$edit_tender_exe1=mysqli_query($conn,$edit_tender_sql)  or die(mysqli_error($conn));	

if($edit_tender_exe1){
$tendermsg.= showMessage("tender has been updated successfully",'success');		
}
}



$action  = $_REQUEST['actntender'];
$tender_id = $_REQUEST['tender_id'];
if($action == 'delltender' && !empty($tender_id))
{
$DeltenderSql = 'DELETE FROM tbl_tender WHERE tender_id  = "'.$tender_id.'"';
$DeltenderQuery = g_db_query($DeltenderSql);

if($DeltenderQuery){
$tendermsg.= showMessage('The tender Has Been Deleted','success');
}
}






?>