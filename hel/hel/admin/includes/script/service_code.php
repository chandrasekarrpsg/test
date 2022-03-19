<?php
$message		= '';
$type= $_GET['type'];
ini_set("service_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_service']) && $_REQUEST['save_service']=="Save"){

	
$ser_alias = alias(strtolower($_REQUEST['service_title']));	
	$ser_sql="select * from tbl_service where alise='".$ser_alias."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{
		
if(!empty($_FILES['service_icon']['name']))
	{

		$image_name1=time().$_FILES['service_icon']['name'];
		$image_type=$_FILES['service_icon']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['service_icon']['size'];
		$temp_name=$_FILES['service_icon']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name1;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name1 = 'noimage.jpg';

	}		
			
	
if(!empty($_FILES['service_image']['name']))
	{

		$image_name2=time().$_FILES['service_image']['name'];
		$image_type=$_FILES['service_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['service_image']['size'];
		$temp_name=$_FILES['service_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name2;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$image_name2 = 'noimage.jpg';

	}

	
if(!empty($_FILES['service_image_webp']['name']))
	{

		$bimage_name=time().$_FILES['service_image_webp']['name'];
		$image_type=$_FILES['service_image_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['service_image_webp']['size'];
		$temp_name=$_FILES['service_image_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$bimage_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$bimage_name = 'noimage.jpg';

	}
	
	
	if(!empty($_FILES['service_image2']['name']))
	{

		$oimage_name2=time().$_FILES['service_image2']['name'];
		$image_type=$_FILES['service_image2']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['service_image2']['size'];
		$temp_name=$_FILES['service_image2']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$oimage_name2;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$oimage_name2 = 'noimage.jpg';

	}

	
if(!empty($_FILES['service_image2_webp']['name']))
	{

		$obimage_name=time().$_FILES['service_image2_webp']['name'];
		$image_type=$_FILES['service_image2_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['service_image2_webp']['size'];
		$temp_name=$_FILES['service_image2_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$obimage_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);

	}
	else
	{

		$obimage_name = 'noimage.jpg';

	}


	$add_service_sql="insert ignore into tbl_service set  
	 meta_title  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
	  meta_keyword  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
	   meta_desc  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',        
	service_title='".mysqli_real_escape_string($conn,$_REQUEST['service_title'])."',
	alise='".$ser_alias."',  
	service_srt_desc ='".mysqli_real_escape_string($conn,$_REQUEST['service_srt_desc'])."',
	   service_desc='".mysqli_real_escape_string($conn,$_REQUEST['service_desc'])."', 
	     service_desc2='".mysqli_real_escape_string($conn,$_REQUEST['service_desc2'])."',
	   show_home   	='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."', 
	    featured_service   	='".mysqli_real_escape_string($conn,$_REQUEST['featured_service'])."', 
	     other_state_service   	='".mysqli_real_escape_string($conn,$_REQUEST['other_state_service'])."', 
	   service_date='".date('Y-m-d')."',
	   service_icon='".$image_name1."',
		service_image='".$image_name2."',
		service_image_webp='".$bimage_name."',
		service_image2='".$oimage_name2."',
		service_image2_webp='".$obimage_name."'
		";
			
	$add_service_exe=mysqli_query($conn,$add_service_sql) or die(mysqli_error($conn));
if($add_service_exe){
$servicemsg.= showMessage("Service has been added successfully",'success');		
}
}
else
{
		$servicemsg .= showMessage('There is an item with same name.','error');
}	
			 						
}

if(isset($_REQUEST['edit_service']) && $_REQUEST['edit_service']=="Update"){
	
	$ser_alias = alias(strtolower($_REQUEST['service_title']));	
	$ser_sql="select * from tbl_service where alise='".$ser_alias."' and service_id!='".$_REQUEST['service_id']."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
$edit_service_sql1="update ignore tbl_service set
 meta_title  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
	  meta_keyword  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
	   meta_desc  ='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',   
service_title='".mysqli_real_escape_string($conn,$_REQUEST['service_title'])."',
	alise='".$ser_alias."',  
	service_srt_desc ='".mysqli_real_escape_string($conn,$_REQUEST['service_srt_desc'])."',
	   service_desc='".mysqli_real_escape_string($conn,$_REQUEST['service_desc'])."',
	    service_desc2='".mysqli_real_escape_string($conn,$_REQUEST['service_desc2'])."',
	   show_home   	='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."',
	   featured_service   	='".mysqli_real_escape_string($conn,$_REQUEST['featured_service'])."', 
	     other_state_service   	='".mysqli_real_escape_string($conn,$_REQUEST['other_state_service'])."'   			
            where service_id ='".$_REQUEST['service_id']."'";
			$edit_service_exe1=mysqli_query($conn,$edit_service_sql1)  or die(mysqli_error($conn));	
			
			
			if(!empty($_FILES['service_icon']['name']))
			{

			$image_name=time().$_FILES['service_icon']['name'];
			$image_type=$_FILES['service_icon']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['service_icon']['size'];
			$temp_name=$_FILES['service_icon']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_service_sql="update ignore tbl_service set 
			service_icon ='".$image_name."'
			where service_id='".$_REQUEST['service_id']."'";
			mysqli_query($conn,$edit_service_sql)  or die(mysqli_error($conn));	

			}
			
			
			if(!empty($_FILES['service_image']['name']))
			{

			$image_name=time().$_FILES['service_image']['name'];
			$image_type=$_FILES['service_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['service_image']['size'];
			$temp_name=$_FILES['service_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_service_sql="update ignore tbl_service set 
			service_image ='".$image_name."'
			where service_id='".$_REQUEST['service_id']."'";
			mysqli_query($conn,$edit_service_sql)  or die(mysqli_error($conn));	

			}
			
			
			
			if(!empty($_FILES['service_image_webp']['name']))
			{

			$image_name=time().$_FILES['service_image_webp']['name'];
			$image_type=$_FILES['service_image_webp']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['service_image_webp']['size'];
			$temp_name=$_FILES['service_image_webp']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_service_sql="update ignore tbl_service set 
			service_image_webp ='".$image_name."'
			where service_id='".$_REQUEST['service_id']."'";
			mysqli_query($conn,$edit_service_sql)  or die(mysqli_error($conn));	

			}
			
			if(!empty($_FILES['service_image2']['name']))
			{

			$image_name=time().$_FILES['service_image2']['name'];
			$image_type=$_FILES['service_image2']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['service_image2']['size'];
			$temp_name=$_FILES['service_image2']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_service_sql="update ignore tbl_service set 
			service_image2 ='".$image_name."'
			where service_id='".$_REQUEST['service_id']."'";
			mysqli_query($conn,$edit_service_sql)  or die(mysqli_error($conn));	

			}
			
			
			
			if(!empty($_FILES['service_image2_webp']['name']))
			{

			$image_name=time().$_FILES['service_image2_webp']['name'];
			$image_type=$_FILES['service_image2_webp']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['service_image2_webp']['size'];
			$temp_name=$_FILES['service_image2_webp']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_service_sql="update ignore tbl_service set 
			service_image2_webp ='".$image_name."'
			where service_id='".$_REQUEST['service_id']."'";
			mysqli_query($conn,$edit_service_sql)  or die(mysqli_error($conn));	

			}
		

if($edit_service_exe1){
$servicemsg.= showMessage("Service has been updated successfully",'success');		
}
}
else
{
	$servicemsg .= showMessage('There is an item with same name.','error');
}
}

$action  = $_REQUEST['actnservice'];
$service_id = $_REQUEST['service_id'];
if($action == 'dellservice' && !empty($service_id)){
$DelserviceSql = 'DELETE FROM tbl_service WHERE service_id  = "'.$service_id.'"';
$DelserviceQuery = g_db_query($DelserviceSql);
if($DelserviceQuery){
$servicemsg.= showMessage('The Service Has Been Deleted','success');
}
}
?>