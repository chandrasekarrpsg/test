<?php
$message		= '';
$type= $_GET['type'];
ini_set("testimonial_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_testimonial']) && $_REQUEST['save_testimonial']=="Save"){
	
$ser_alias = alias($_REQUEST['testimonial_title']);	
	$ser_sql="select * from tbl_testimonial where alise='".$ser_alias."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
	
if(!empty($_FILES['testimonial_image']['name']))
	{

		$image_name=time().$_FILES['testimonial_image']['name'];
		$image_type=$_FILES['testimonial_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['testimonial_image']['size'];
		$temp_name=$_FILES['testimonial_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}

	$add_testimonial_sql="insert ignore into tbl_testimonial set       
	testimonial_date='".mysqli_real_escape_string($conn,$_REQUEST['testimonial_date'])."', 
	testimonial_title='".mysqli_real_escape_string($conn,$_REQUEST['testimonial_title'])."',
	alise='".$ser_alias."',  
	   testimonial_desc='".mysqli_real_escape_string($conn,$_REQUEST['testimonial_desc'])."',     	
		 testimonial_desg='".mysqli_real_escape_string($conn,$_REQUEST['testimonial_desg'])."',
			testimonial_image='".$image_name."'";
			
	$add_testimonial_exe=mysqli_query($conn,$add_testimonial_sql) or die(mysqli_error($conn));
if($add_testimonial_exe){
$testimonialmsg.= showMessage("Testimonial has been added successfully",'success');		
}
}
else
{
		$testimonialmsg .= showMessage('There is an item with same name.','error');
}	
			 						
}

if(isset($_REQUEST['edit_testimonial']) && $_REQUEST['edit_testimonial']=="Update"){
	
	$ser_alias = alias($_REQUEST['testimonial_title']);	
	$ser_sql="select * from tbl_testimonial where alise='".$ser_alias."' and testimonial_id!='".$_REQUEST['testimonial_id']."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
 $edit_testimonial_sql1="update ignore tbl_testimonial set
testimonial_date='".mysqli_real_escape_string($conn,$_REQUEST['testimonial_date'])."', 
	testimonial_title='".mysqli_real_escape_string($conn,$_REQUEST['testimonial_title'])."', 
	alise='".$ser_alias."',		 
	   testimonial_desc='".mysqli_real_escape_string($conn,$_REQUEST['testimonial_desc'])."',	
	   testimonial_desg='".mysqli_real_escape_string($conn,$_REQUEST['testimonial_desg'])."'				
            where testimonial_id ='".$_REQUEST['testimonial_id']."'";
			$edit_testimonial_exe1=mysqli_query($conn,$edit_testimonial_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['testimonial_image']['name']))
			{

			$image_name=time().$_FILES['testimonial_image']['name'];
			$image_type=$_FILES['testimonial_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['testimonial_image']['size'];
			$temp_name=$_FILES['testimonial_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_testimonial_sql="update ignore tbl_testimonial set 
			testimonial_image ='".$image_name."'
			where testimonial_id='".$_REQUEST['testimonial_id']."'";
			mysqli_query($conn,$edit_testimonial_sql)  or die(mysqli_error($conn));	

			}
			
		

if($edit_testimonial_exe1){
$testimonialmsg.= showMessage("Testimonial has been updated successfully",'success');		
}
}
else
{
	$testimonialmsg .= showMessage('There is an item with same name.','error');
}
}

$action  = $_REQUEST['actntestimonial'];
$testimonial_id = $_REQUEST['testimonial_id'];
if($action == 'delltestimonial' && !empty($testimonial_id)){
$DeltestimonialSql = 'DELETE FROM tbl_testimonial WHERE testimonial_id  = "'.$testimonial_id.'"';
$DeltestimonialQuery = g_db_query($DeltestimonialSql);
if($DeltestimonialQuery){
$testimonialmsg.= showMessage('The Testimonial Has Been Deleted','success');
}
}
?>