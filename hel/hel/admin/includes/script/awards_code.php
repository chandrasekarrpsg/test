<?php
$message		= '';
$type= $_GET['type'];
ini_set("awards_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_awards']) && $_REQUEST['save_awards']=="Save"){

	
$ser_alias = alias(strtolower($_REQUEST['awards_title']));	
	$ser_sql="select * from tbl_awards where alise='".$ser_alias."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
	
if(!empty($_FILES['awards_image']['name']))
	{

		$image_name=time().$_FILES['awards_image']['name'];
		$image_type=$_FILES['awards_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['awards_image']['size'];
		$temp_name=$_FILES['awards_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}

	
if(!empty($_FILES['awards_image_webp']['name']))
	{

		$bimage_name=time().$_FILES['awards_image_webp']['name'];
		$image_type=$_FILES['awards_image_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['awards_image_webp']['size'];
		$temp_name=$_FILES['awards_image_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$bimage_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$bimage_name = 'noimage.webp';

	}


	$add_awards_sql="insert ignore into tbl_awards set  
	 meta_title  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
	  meta_keyword  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
	   meta_desc  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',        
	awards_title='".mysqli_real_escape_string($conn,$_REQUEST['awards_title'])."',
	alise='".$ser_alias."',  
	awards_srt_desc ='".mysqli_real_escape_string($conn,$_REQUEST['awards_srt_desc'])."',
	   awards_desc='".mysqli_real_escape_string($conn,$_REQUEST['awards_desc'])."', 
	   
	   show_home   	='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."', 
	   awards_date='".mysqli_real_escape_string($conn,$_REQUEST['awards_date'])."',
	   awards_image_webp ='".$bimage_name."',
			awards_image='".$image_name."'";
			
	$add_awards_exe=mysqli_query($conn,$add_awards_sql) or die(mysqli_error($conn));
if($add_awards_exe){
$awardsmsg.= showMessage("awards has been added successfully",'success');		
}
}
else
{
		$awardsmsg .= showMessage('There is an item with same name.','error');
}	
			 						
}

if(isset($_REQUEST['edit_awards']) && $_REQUEST['edit_awards']=="Update"){
	
	$ser_alias = alias(strtolower($_REQUEST['awards_title']));	
	$ser_sql="select * from tbl_awards where alise='".$ser_alias."' and awards_id!='".$_REQUEST['awards_id']."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
$edit_awards_sql1="update ignore tbl_awards set
 meta_title  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
	  meta_keyword  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
	   meta_desc  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',   
awards_title='".mysqli_real_escape_string($conn,$_REQUEST['awards_title'])."',
	alise='".$ser_alias."',  
	awards_srt_desc ='".mysqli_real_escape_string($conn,$_REQUEST['awards_srt_desc'])."',
	   awards_desc='".mysqli_real_escape_string($conn,$_REQUEST['awards_desc'])."',
	    awards_date='".mysqli_real_escape_string($conn,$_REQUEST['awards_date'])."',
	   show_home   	='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."'   			
            where awards_id ='".$_REQUEST['awards_id']."'";
			$edit_awards_exe1=mysqli_query($conn,$edit_awards_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['awards_image']['name']))
			{

			$image_name=time().$_FILES['awards_image']['name'];
			$image_type=$_FILES['awards_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['awards_image']['size'];
			$temp_name=$_FILES['awards_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_awards_sql="update ignore tbl_awards set 
			awards_image ='".$image_name."'
			where awards_id='".$_REQUEST['awards_id']."'";
			mysqli_query($conn,$edit_awards_sql)  or die(mysqli_error($conn));	

			}
			
			
			
			if(!empty($_FILES['awards_image_webp']['name']))
			{

			$image_name=time().$_FILES['awards_image_webp']['name'];
			$image_type=$_FILES['awards_image_webp']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['awards_image_webp']['size'];
			$temp_name=$_FILES['awards_image_webp']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_awards_sql="update ignore tbl_awards set 
			awards_image_webp ='".$image_name."'
			where awards_id='".$_REQUEST['awards_id']."'";
			mysqli_query($conn,$edit_awards_sql)  or die(mysqli_error($conn));	

			}
		

if($edit_awards_exe1){
$awardsmsg.= showMessage("awards has been updated successfully",'success');		
}
}
else
{
	$awardsmsg .= showMessage('There is an item with same name.','error');
}
}

$action  = $_REQUEST['actnawards'];
$awards_id = $_REQUEST['awards_id'];
if($action == 'dellawards' && !empty($awards_id)){
$DelawardsSql = 'DELETE FROM tbl_awards WHERE awards_id  = "'.$awards_id.'"';
$DelawardsQuery = g_db_query($DelawardsSql);
if($DelawardsQuery){
$awardsmsg.= showMessage('The awards Has Been Deleted','success');
}
}
?>