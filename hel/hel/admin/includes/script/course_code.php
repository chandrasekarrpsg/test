<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_course']) && $_REQUEST['save_course']=="Save"){
	
	$ser_alias = alias(strtolower($_REQUEST['course_title']));	
	$ser_sql="select * from tbl_course where alise='".$ser_alias."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{


	if(!empty($_FILES['course_image']['name']))
	{

		$image_name=time().$_FILES['course_image']['name'];
		$image_type=$_FILES['course_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['course_image']['size'];
		$temp_name=$_FILES['course_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}
	
		if(!empty($_FILES['course_image_webp']['name']))
	{

		$wimage_name=time().$_FILES['course_image_webp']['name'];
		$image_type=$_FILES['course_image_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['course_image_webp']['size'];
		$temp_name=$_FILES['course_image_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$wimage_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$wimage_name = 'noimage.jpg';

	}


	
	if(!empty($_FILES['banner_image']['name']))
	{

		$image_name2=time().$_FILES['banner_image']['name'];
		$image_type=$_FILES['banner_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['banner_image']['size'];
		$temp_name=$_FILES['banner_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name2;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name2 = 'noimage.jpg';

	}
	
		if(!empty($_FILES['banner_image_webp']['name']))
	{

		$image_name3=time().$_FILES['banner_image_webp']['name'];
		$image_type=$_FILES['banner_image_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['banner_image_webp']['size'];
		$temp_name=$_FILES['banner_image_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name3;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name3 = 'noimage.jpg';

	}
	
		if(!empty($_FILES['course_pdf']['name']))
	{

		$pdf_file=time().$_FILES['course_pdf']['name'];
		$image_type=$_FILES['course_pdf']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['course_pdf']['size'];
		$temp_name=$_FILES['course_pdf']['tmp_name'];
		$dir="pdf_folder/";
		$uploadimage=$dir.$pdf_file;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$pdf_file = 'nopdf.pdf';

	}
	
	
	  $add_course_sql="insert ignore into tbl_course set 
	 meta_title  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
	  meta_keyword  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
	   meta_desc  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',   
	course_title='".mysqli_real_escape_string($conn,$_REQUEST['course_title'])."', 
	course_full_title='".mysqli_real_escape_string($conn,$_REQUEST['course_full_title'])."',  
	short_desc='".mysqli_real_escape_string($conn,$_REQUEST['short_desc'])."', 
	banner_heading='".mysqli_real_escape_string($conn,$_REQUEST['banner_heading'])."',
	content='".mysqli_real_escape_string($conn,$_REQUEST['content'])."', 
	admission_cont='".mysqli_real_escape_string($conn,$_REQUEST['admission_cont'])."', 
	form_content='".mysqli_real_escape_string($conn,$_REQUEST['form_content'])."', 
	show_home='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."',
	alise ='".$ser_alias."',
	course_image='".$image_name."',
	course_image_webp='".$wimage_name."',
	banner_image='".$image_name2."',
	banner_image_webp='".$image_name3."',
	course_pdf='".$pdf_file."'";
			
	$add_course_exe=mysqli_query($conn,$add_course_sql) or die(mysqli_error($conn));
if($add_course_exe){
	$last_id=mysqli_insert_id($conn);
	
		
	if(!empty($_REQUEST['course_details_id'])){
	$variable=$_REQUEST['course_details_id'];

		
		foreach ($variable as $value) {
			
		 // print_r($_REQUEST['feature_package_name'.$value]);
		
			
		  $sql1="insert ignore into tbl_course_details set
			course_id='".$last_id."',
			course_details_title='".mysqli_real_escape_string($conn,$_REQUEST['course_details_title_'.$value])."',
			course_details_desc='".mysqli_real_escape_string($conn,$_REQUEST['course_details_desc'.$value])."'
			";
			$run1=mysqli_query($conn,$sql1);
					
			}
 		 }
$coursemsg.= showMessage("course has been added successfully",'success');		
}
}
else
{
		$coursemsg .= showMessage('There is an item with same name.','error');
}			 						
}

if(isset($_REQUEST['edit_course']) && $_REQUEST['edit_course']=="Update"){
	
	
	$ser_alias = alias(strtolower($_REQUEST['course_title']));	
	$ser_sql="select * from tbl_course where alise='".$ser_alias."' and course_id!='".$_REQUEST['course_id']."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{
$edit_course_sql1="update ignore tbl_course set 
	 meta_title  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
	  meta_keyword  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
	   meta_desc  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',   
	course_title='".mysqli_real_escape_string($conn,$_REQUEST['course_title'])."', 
	banner_heading='".mysqli_real_escape_string($conn,$_REQUEST['banner_heading'])."', 
	course_full_title='".mysqli_real_escape_string($conn,$_REQUEST['course_full_title'])."',  
	short_desc='".mysqli_real_escape_string($conn,$_REQUEST['short_desc'])."', 
	content='".mysqli_real_escape_string($conn,$_REQUEST['content'])."', 
	admission_cont='".mysqli_real_escape_string($conn,$_REQUEST['admission_cont'])."', 
	form_content='".mysqli_real_escape_string($conn,$_REQUEST['form_content'])."', 
	show_home='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."',
	alise ='".$ser_alias."'			
    where course_id ='".$_REQUEST['course_id']."'";
			$edit_course_exe1=mysqli_query($conn,$edit_course_sql1)  or die(mysqli_error($conn));	
			
			
				if(!empty($_FILES['banner_image']['name']))
			{

			$image_name=time().$_FILES['banner_image']['name'];
			$image_type=$_FILES['banner_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['banner_image']['size'];
			$temp_name=$_FILES['banner_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_course_sql="update ignore tbl_course set 
			banner_image ='".$image_name."'
			where course_id='".$_REQUEST['course_id']."'";
			mysqli_query($conn,$edit_course_sql)  or die(mysqli_error($conn));	

			}
			
				if(!empty($_FILES['banner_image_webp']['name']))
			{

			$image_name=time().$_FILES['banner_image_webp']['name'];
			$image_type=$_FILES['banner_image_webp']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['banner_image_webp']['size'];
			$temp_name=$_FILES['banner_image_webp']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_course_sql="update ignore tbl_course set 
			banner_image_webp ='".$image_name."'
			where course_id='".$_REQUEST['course_id']."'";
			mysqli_query($conn,$edit_course_sql)  or die(mysqli_error($conn));	

			}
			
				if(!empty($_FILES['course_image']['name']))
			{

			$image_name=time().$_FILES['course_image']['name'];
			$image_type=$_FILES['course_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['course_image']['size'];
			$temp_name=$_FILES['course_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_course_sql="update ignore tbl_course set 
			course_image ='".$image_name."'
			where course_id='".$_REQUEST['course_id']."'";
			mysqli_query($conn,$edit_course_sql)  or die(mysqli_error($conn));	

			}
			
				if(!empty($_FILES['course_image_webp']['name']))
			{

			$image_name=time().$_FILES['course_image_webp']['name'];
			$image_type=$_FILES['course_image_webp']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['course_image_webp']['size'];
			$temp_name=$_FILES['course_image_webp']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_course_sql="update ignore tbl_course set 
			course_image_webp ='".$image_name."'
			where course_id='".$_REQUEST['course_id']."'";
			mysqli_query($conn,$edit_course_sql)  or die(mysqli_error($conn));	

			}
				if(!empty($_FILES['course_pdf']['name']))
			{

			$image_name=time().$_FILES['course_pdf']['name'];
			$image_type=$_FILES['course_pdf']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['course_pdf']['size'];
			$temp_name=$_FILES['course_pdf']['tmp_name'];
			$dir="pdf_folder/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_course_sql="update ignore tbl_course set 
			course_pdf ='".$image_name."'
			where course_id='".$_REQUEST['course_id']."'";
			mysqli_query($conn,$edit_course_sql)  or die(mysqli_error($conn));	

			}
			
	if(!empty($_REQUEST['course_details_id'])){
	$variable2=$_REQUEST['course_details_id'];

		
		foreach ($variable2 as $val) {
			
		 // print_r($_REQUEST['feature_package_name'.$value]);
		
			
		  $sql1="insert ignore into tbl_course_details set
			course_id='".$_REQUEST['course_id']."',
			course_details_title='".mysqli_real_escape_string($conn,$_REQUEST['course_details_title_'.$val])."',
			course_details_desc='".mysqli_real_escape_string($conn,$_REQUEST['course_details_desc'.$val])."'
			";
			$run1=mysqli_query($conn,$sql1);
					
			}
 		 }
	
	if(!empty($_REQUEST['edit_course_details_id'])){
	 $variableedit=$_REQUEST['edit_course_details_id'];

		
		 
		foreach ($variableedit as $value) {
			
		   $sql2="update ignore tbl_course_details set
			course_id='".$_REQUEST['course_id']."',
			course_details_title='".mysqli_real_escape_string($conn,$_REQUEST['edit_course_details_title_'.$value])."',
			course_details_desc='".mysqli_real_escape_string($conn,$_REQUEST['edit_course_details_desc'.$value])."'
			where course_details_id='".$value."'";
			
			$run1=mysqli_query($conn,$sql2);
					
			}
 		 }

if($edit_course_exe1){
		

	
	
$coursemsg.= showMessage("course has been updated successfully",'success');		
}}
else
{
	$coursemsg .= showMessage('There is an item with same name.','error');
}
}

$action  = $_REQUEST['actncourse'];
$course_id = $_REQUEST['course_id'];
if($action == 'dellcourse' && !empty($course_id)){
$DelcourseSql = 'DELETE FROM tbl_course WHERE course_id  = "'.$course_id.'"';
$DelcourseQuery = g_db_query($DelcourseSql);
if($DelcourseQuery){
$coursemsg.= showMessage('The course Has Been Deleted','success');
}
}
?>