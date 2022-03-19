<?php
$message		= '';
$type= $_GET['type'];
ini_set("esg_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_esg']) && $_REQUEST['save_esg']=="Save"){

	
$ser_alias = alias(strtolower($_REQUEST['esg_title']));	
	$ser_sql="select * from tbl_esg where alise='".$ser_alias."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
	
if(!empty($_FILES['esg_image']['name']))
	{

		$image_name=time().$_FILES['esg_image']['name'];
		$image_type=$_FILES['esg_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['esg_image']['size'];
		$temp_name=$_FILES['esg_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}

	
if(!empty($_FILES['esg_image_webp']['name']))
	{

		$bimage_name=time().$_FILES['esg_image_webp']['name'];
		$image_type=$_FILES['esg_image_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['esg_image_webp']['size'];
		$temp_name=$_FILES['esg_image_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$bimage_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$bimage_name = 'noimage.webp';

	}


	$add_esg_sql="insert ignore into tbl_esg set  
	 meta_title  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
	  meta_keyword  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
	   meta_desc  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',        
	esg_title='".mysqli_real_escape_string($conn,$_REQUEST['esg_title'])."',
	alise='".$ser_alias."',  
	esg_srt_desc ='".mysqli_real_escape_string($conn,$_REQUEST['esg_srt_desc'])."',
	   esg_desc='".mysqli_real_escape_string($conn,$_REQUEST['esg_desc'])."', 
	   esg_link   	='".mysqli_real_escape_string($conn,$_REQUEST['esg_link'])."', 
	   show_home   	='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."', 
	   esg_date='".mysqli_real_escape_string($conn,$_REQUEST['esg_date'])."',
	   esg_image_webp ='".$bimage_name."',
			esg_image='".$image_name."'";
			
	$add_esg_exe=mysqli_query($conn,$add_esg_sql) or die(mysqli_error($conn));
if($add_esg_exe){
$esgmsg.= showMessage("ESG has been added successfully",'success');		
}
}
else
{
		$esgmsg .= showMessage('There is an item with same name.','error');
}	
			 						
}

if(isset($_REQUEST['edit_esg']) && $_REQUEST['edit_esg']=="Update"){
	
	$ser_alias = alias(strtolower($_REQUEST['esg_title']));	
	$ser_sql="select * from tbl_esg where alise='".$ser_alias."' and esg_id!='".$_REQUEST['esg_id']."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
$edit_esg_sql1="update ignore tbl_esg set
 meta_title  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
	  meta_keyword  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
	   meta_desc  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',   
esg_title='".mysqli_real_escape_string($conn,$_REQUEST['esg_title'])."',
	alise='".$ser_alias."',  
	esg_srt_desc ='".mysqli_real_escape_string($conn,$_REQUEST['esg_srt_desc'])."',
	   esg_desc='".mysqli_real_escape_string($conn,$_REQUEST['esg_desc'])."',
	    esg_date='".mysqli_real_escape_string($conn,$_REQUEST['esg_date'])."',
	       esg_link   	='".mysqli_real_escape_string($conn,$_REQUEST['esg_link'])."', 
	   show_home   	='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."'   			
            where esg_id ='".$_REQUEST['esg_id']."'";
			$edit_esg_exe1=mysqli_query($conn,$edit_esg_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['esg_image']['name']))
			{

			$image_name=time().$_FILES['esg_image']['name'];
			$image_type=$_FILES['esg_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['esg_image']['size'];
			$temp_name=$_FILES['esg_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_esg_sql="update ignore tbl_esg set 
			esg_image ='".$image_name."'
			where esg_id='".$_REQUEST['esg_id']."'";
			mysqli_query($conn,$edit_esg_sql)  or die(mysqli_error($conn));	

			}
			
			
			
			if(!empty($_FILES['esg_image_webp']['name']))
			{

			$image_name=time().$_FILES['esg_image_webp']['name'];
			$image_type=$_FILES['esg_image_webp']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['esg_image_webp']['size'];
			$temp_name=$_FILES['esg_image_webp']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_esg_sql="update ignore tbl_esg set 
			esg_image_webp ='".$image_name."'
			where esg_id='".$_REQUEST['esg_id']."'";
			mysqli_query($conn,$edit_esg_sql)  or die(mysqli_error($conn));	

			}
		

if($edit_esg_exe1){
$esgmsg.= showMessage("ESG has been updated successfully",'success');		
}
}
else
{
	$esgmsg .= showMessage('There is an item with same name.','error');
}
}

$action  = $_REQUEST['actnesg'];
$esg_id = $_REQUEST['esg_id'];
if($action == 'dellesg' && !empty($esg_id)){
$DelesgSql = 'DELETE FROM tbl_esg WHERE esg_id  = "'.$esg_id.'"';
$DelesgQuery = g_db_query($DelesgSql);
if($DelesgQuery){
$esgmsg.= showMessage('The ESG Has Been Deleted','success');
}
}
?>