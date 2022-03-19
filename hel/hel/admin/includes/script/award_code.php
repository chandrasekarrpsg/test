<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_award']) && $_REQUEST['save_award']=="Save"){
	

if(!empty($_FILES['head_award_image']['name']))
	{

		$image_name=time().$_FILES['head_award_image']['name'];
		$image_type=$_FILES['head_award_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['head_award_image']['size'];
		$temp_name=$_FILES['head_award_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}



if(!empty($_FILES['foot_award_image']['name']))
	{

		$fimage_name=time().$_FILES['foot_award_image']['name'];
		$image_type=$_FILES['foot_award_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['foot_award_image']['size'];
		$temp_name=$_FILES['foot_award_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$fimage_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}

	$add_award_sql="insert ignore into tbl_award set 
head_award_image='".$image_name."',
foot_award_image='".$fimage_name."'";
			
	$add_award_exe=mysqli_query($conn,$add_award_sql) or die(mysqli_error($conn));
if($add_award_exe){
$awardmsg.= showMessage("Award has been added successfully",'success');		
}
}
	
			 						


if(isset($_REQUEST['edit_award']) && $_REQUEST['edit_award']=="Update"){
	
			
			
			if(!empty($_FILES['head_award_image']['name']))
			{

			$image_name=time().$_FILES['head_award_image']['name'];
			$image_type=$_FILES['head_award_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['head_award_image']['size'];
			$temp_name=$_FILES['head_award_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_award_sql="update ignore tbl_award set 
			head_award_image ='".$image_name."'
			where award_id='".$_REQUEST['award_id']."'";
			mysqli_query($conn,$edit_award_sql)  or die(mysqli_error($conn));	

			}
			
				if(!empty($_FILES['foot_award_image']['name']))
			{

			$fimage_name=time().$_FILES['foot_award_image']['name'];
			$image_type=$_FILES['foot_award_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['foot_award_image']['size'];
			$temp_name=$_FILES['foot_award_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$fimage_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_award_sql="update ignore tbl_award set 
			foot_award_image ='".$fimage_name."'
			where award_id='".$_REQUEST['award_id']."'";
			mysqli_query($conn,$edit_award_sql)  or die(mysqli_error($conn));	

			}
			
			
		

if($edit_award_exe1){
$awardmsg.= showMessage("Award has been updated successfully",'success');		
}
}


$award_id = $_REQUEST['award_id'];

if($_REQUEST['actnaward'] == 'dellaward' && !empty($award_id)){
$DelawardSql = 'DELETE FROM tbl_award WHERE award_id  = "'.$award_id.'"';
$DelawardQuery = g_db_query($DelawardSql);
if($DelawardQuery){
$awardmsg.= showMessage('The Award Has Been Deleted','success');
}
}
?>