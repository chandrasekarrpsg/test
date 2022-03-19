<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_team']) && $_REQUEST['save_team']=="Save"){
if(!empty($_FILES['team_image']['name']))
	{

		$image_name=time().$_FILES['team_image']['name'];
		$image_type=$_FILES['team_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['team_image']['size'];
		$temp_name=$_FILES['team_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name = 'noimage.jpg';

	}
	
	
	if(!empty($_FILES['team_image2']['name']))
	{

		$image_name2=time().$_FILES['team_image2']['name'];
		$image_type=$_FILES['team_image2']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['team_image2']['size'];
		$temp_name=$_FILES['team_image2']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name2;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name2 = 'noimage.jpg';

	}
	

	 $add_team_sql="insert ignore into tbl_team set     
	team_title='".mysqli_real_escape_string($conn,$_REQUEST['team_title'])."',  
	team_desg='".mysqli_real_escape_string($conn,$_REQUEST['team_desg'])."',
	team_link='".mysqli_real_escape_string($conn,$_REQUEST['team_link'])."', 
	team_link2='".mysqli_real_escape_string($conn,$_REQUEST['team_link2'])."', 
		team_image2='".$image_name2."',
			team_image='".$image_name."'";
			
	$add_team_exe=mysqli_query($conn,$add_team_sql) or die(mysqli_error($conn));
if($add_team_exe){
$teammsg.= showMessage("Board of Directors has been added successfully",'success');		
}
			 						
}

if(isset($_REQUEST['edit_team']) && $_REQUEST['edit_team']=="Update"){
$edit_team_sql1="update ignore tbl_team set
team_title='".mysqli_real_escape_string($conn,$_REQUEST['team_title'])."',
team_desg='".mysqli_real_escape_string($conn,$_REQUEST['team_desg'])."',
team_link='".mysqli_real_escape_string($conn,$_REQUEST['team_link'])."', 
team_link2='".mysqli_real_escape_string($conn,$_REQUEST['team_link2'])."'  				
            where team_id ='".$_REQUEST['team_id']."'";
			$edit_team_exe1=mysqli_query($conn,$edit_team_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['team_image']['name']))
			{

			$image_name=time().$_FILES['team_image']['name'];
			$image_type=$_FILES['team_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['team_image']['size'];
			$temp_name=$_FILES['team_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_team_sql="update ignore tbl_team set 
			team_image ='".$image_name."'
			where team_id='".$_REQUEST['team_id']."'";
			mysqli_query($conn,$edit_team_sql)  or die(mysqli_error($conn));	

			}
			
			if(!empty($_FILES['team_image2']['name']))
			{

			$image_name=time().$_FILES['team_image2']['name'];
			$image_type=$_FILES['team_image2']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['team_image2']['size'];
			$temp_name=$_FILES['team_image2']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_team_sql="update ignore tbl_team set 
			team_image2 ='".$image_name."'
			where team_id='".$_REQUEST['team_id']."'";
			mysqli_query($conn,$edit_team_sql)  or die(mysqli_error($conn));	

			}
			
		

if($edit_team_exe1){
$teammsg.= showMessage("Board of Directors has been updated successfully",'success');		
}
}

$action  = $_REQUEST['actnteam'];
$team_id = $_REQUEST['team_id'];
if($action == 'dellteam' && !empty($team_id)){
$DelteamSql = 'DELETE FROM tbl_team WHERE team_id  = "'.$team_id.'"';
$DelteamQuery = g_db_query($DelteamSql);
if($DelteamQuery){
$teammsg.= showMessage('The Board of Directors Has Been Deleted','success');
}
}
?>