<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_post']) && $_REQUEST['save_post']=="Save"){

	
$ser_alias = alias(strtolower($_REQUEST['post_title']));	
	$ser_sql="select * from tbl_post where alise='".$ser_alias."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
	
if(!empty($_FILES['post_image']['name']))
	{

		$image_name=time().$_FILES['post_image']['name'];
		$image_type=$_FILES['post_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['post_image']['size'];
		$temp_name=$_FILES['post_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}

	
if(!empty($_FILES['post_image_webp']['name']))
	{

		$bimage_name=time().$_FILES['post_image_webp']['name'];
		$image_type=$_FILES['post_image_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['post_image_webp']['size'];
		$temp_name=$_FILES['post_image_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$bimage_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$bimage_name = 'noimage.webp';

	}


	$add_post_sql="insert ignore into tbl_post set  
	 meta_title  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
	  meta_keyword  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
	   meta_desc  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',        
	post_title='".mysqli_real_escape_string($conn,$_REQUEST['post_title'])."',
	alise='".$ser_alias."',  
	post_srt_desc ='".mysqli_real_escape_string($conn,$_REQUEST['post_srt_desc'])."',
	   post_desc='".mysqli_real_escape_string($conn,$_REQUEST['post_desc'])."', 
	   
	   show_home   	='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."', 
	   post_date='".mysqli_real_escape_string($conn,$_REQUEST['post_date'])."',
	   post_image_webp ='".$bimage_name."',
			post_image='".$image_name."'";
			
	$add_post_exe=mysqli_query($conn,$add_post_sql) or die(mysqli_error($conn));
if($add_post_exe){
$postmsg.= showMessage("News has been added successfully",'success');		
}
}
else
{
		$postmsg .= showMessage('There is an item with same name.','error');
}	
			 						
}

if(isset($_REQUEST['edit_post']) && $_REQUEST['edit_post']=="Update"){
	
	$ser_alias = alias(strtolower($_REQUEST['post_title']));	
	$ser_sql="select * from tbl_post where alise='".$ser_alias."' and post_id!='".$_REQUEST['post_id']."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
$edit_post_sql1="update ignore tbl_post set
 meta_title  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
	  meta_keyword  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
	   meta_desc  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',   
post_title='".mysqli_real_escape_string($conn,$_REQUEST['post_title'])."',
	alise='".$ser_alias."',  
	post_srt_desc ='".mysqli_real_escape_string($conn,$_REQUEST['post_srt_desc'])."',
	   post_desc='".mysqli_real_escape_string($conn,$_REQUEST['post_desc'])."',
	    post_date='".mysqli_real_escape_string($conn,$_REQUEST['post_date'])."',
	   show_home   	='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."'   			
            where post_id ='".$_REQUEST['post_id']."'";
			$edit_post_exe1=mysqli_query($conn,$edit_post_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['post_image']['name']))
			{

			$image_name=time().$_FILES['post_image']['name'];
			$image_type=$_FILES['post_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['post_image']['size'];
			$temp_name=$_FILES['post_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_post_sql="update ignore tbl_post set 
			post_image ='".$image_name."'
			where post_id='".$_REQUEST['post_id']."'";
			mysqli_query($conn,$edit_post_sql)  or die(mysqli_error($conn));	

			}
			
			
			
			if(!empty($_FILES['post_image_webp']['name']))
			{

			$image_name=time().$_FILES['post_image_webp']['name'];
			$image_type=$_FILES['post_image_webp']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['post_image_webp']['size'];
			$temp_name=$_FILES['post_image_webp']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_post_sql="update ignore tbl_post set 
			post_image_webp ='".$image_name."'
			where post_id='".$_REQUEST['post_id']."'";
			mysqli_query($conn,$edit_post_sql)  or die(mysqli_error($conn));	

			}
		

if($edit_post_exe1){
$postmsg.= showMessage("News has been updated successfully",'success');		
}
}
else
{
	$postmsg .= showMessage('There is an item with same name.','error');
}
}

$action  = $_REQUEST['actnpost'];
$post_id = $_REQUEST['post_id'];
if($action == 'dellpost' && !empty($post_id)){
$DelpostSql = 'DELETE FROM tbl_post WHERE post_id  = "'.$post_id.'"';
$DelpostQuery = g_db_query($DelpostSql);
if($DelpostQuery){
$postmsg.= showMessage('The News Has Been Deleted','success');
}
}
?>