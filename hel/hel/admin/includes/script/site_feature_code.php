<?php
$message		= '';
$type= $_GET['type'];
ini_set("site_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['edit_site']) && $_REQUEST['edit_site']=="Save"){
	
	
	
$edit_site_sql1="update ignore tbl_site_feature set
	site_title='".mysqli_real_escape_string($conn,$_REQUEST['site_title'])."', 
	site_value='".mysqli_real_escape_string($conn,$_REQUEST['site_value'])."', 
	   site_desc='".mysqli_real_escape_string($conn,$_REQUEST['site_desc'])."'
	  			
            where site_id ='".$_REQUEST['site_id']."'";
			$edit_site_exe1=   mysqli_query($conn,$edit_site_sql1)  or die(mysqli_error($conn));
			
	if(!empty($_FILES['site_image']['name']))
	{
 
		$image_name=time().$_FILES['site_image']['name'];
		$image_type=$_FILES['site_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['site_image']['size'];
		$temp_name=$_FILES['site_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		
		$edit_site_sql2="update ignore tbl_site_feature set
		 site_image='$image_name'
	  			
            where site_id ='".$_REQUEST['site_id']."'";
           mysqli_query($conn,$edit_site_sql2)  or die(mysqli_error($conn));

	}
	else
	{

		$image_name = 'noimage.jpg';

	}
	
			
		

if($edit_site_exe1){
$sitemsg.= showMessage("site has been updated successfully",'success');		
}
}


?>