<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_ash_stock']) && $_REQUEST['save_ash_stock']=="Save"){
	

if(!empty($_FILES['ash_stock_file']['name']))
	{

		$image_name=time().$_FILES['ash_stock_file']['name'];
		$image_type=$_FILES['ash_stock_file']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['ash_stock_file']['size'];
		$temp_name=$_FILES['ash_stock_file']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
       
	}
	

	$add_ash_stock_sql="insert ignore into  tbl_ash_stock set       
	fly_ash_closing_stock ='".mysqli_real_escape_string($conn,$_REQUEST['fly_ash_closing_stock'])."',
	bottom_ash_closing_stock ='".mysqli_real_escape_string($conn,$_REQUEST['bottom_ash_closing_stock'])."',
	ash_stock_desc ='".mysqli_real_escape_string($conn,$_REQUEST['ash_stock_desc'])."',
	ash_stock_date ='".mysqli_real_escape_string($conn,$_REQUEST['ash_stock_date'])."',
	upload_date ='".date('Y-m-d')."',
	ash_stock_file='".$image_name."'";
            
           //die(); 
$add_ash_stock_exe=mysqli_query($conn,$add_ash_stock_sql) or die(mysqli_error($conn));
if($add_ash_stock_exe){
$ash_stockmsg.= showMessage("ash stock has been added successfully",'success');		
}			 						
}


if(isset($_REQUEST['edit_ash_stock']) && $_REQUEST['edit_ash_stock']=="Update"){
				
			
			if(!empty($_FILES['ash_stock_file']['name']))
			{

			$image_name=time().$_FILES['ash_stock_file']['name'];
			$image_type=$_FILES['ash_stock_file']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['ash_stock_file']['size'];
			$temp_name=$_FILES['ash_stock_file']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			 $edit_ash_stock_sql="update ignore tbl_ash_stock set 
			ash_stock_file ='".$image_name."'
			where ash_stock_id='".$_REQUEST['ash_stock_id']."'";
			$edit_ash_stock_exe1=mysqli_query($conn,$edit_ash_stock_sql)  or die(mysqli_error($conn));	

			}
			$edit_ash_stock_sql="update ignore tbl_ash_stock set 
			fly_ash_closing_stock ='".mysqli_real_escape_string($conn,$_REQUEST['fly_ash_closing_stock'])."',
			bottom_ash_closing_stock ='".mysqli_real_escape_string($conn,$_REQUEST['bottom_ash_closing_stock'])."',
			ash_stock_desc ='".mysqli_real_escape_string($conn,$_REQUEST['ash_stock_desc'])."',
			ash_stock_date ='".mysqli_real_escape_string($conn,$_REQUEST['ash_stock_date'])."'
			where ash_stock_id='".$_REQUEST['ash_stock_id']."'";
			$edit_ash_stock_exe1=mysqli_query($conn,$edit_ash_stock_sql)  or die(mysqli_error($conn));	

if($edit_ash_stock_exe1){
$ash_stockmsg.= showMessage("ash stock has been updated successfully",'success');		
}
}



$action  = $_REQUEST['actnash_stock'];
$ash_stock_id = $_REQUEST['ash_stock_id'];
if($action == 'dellash_stock' && !empty($ash_stock_id))
{
$Delash_stockSql = 'DELETE FROM tbl_ash_stock WHERE ash_stock_id  = "'.$ash_stock_id.'"';
$Delash_stockQuery = g_db_query($Delash_stockSql);

if($Delash_stockQuery){
$ash_stockmsg.= showMessage('The ash stock Has Been Deleted','success');
}
}






?>