<?php
if(isset($_REQUEST['save_page']) && $_REQUEST['save_page']=='Submit')
{
		
		
		if(!empty($_FILES['page_image']['name']))
	{

		$image_name=time()."_".$_FILES['page_image']['name'];
		$image_type=$_FILES['page_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['page_image']['size'];
		$temp_name=$_FILES['page_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		
	}
	if(!empty($_FILES['banner_image']['name']))
	{

		$banner_image_name=time()."_".$_FILES['banner_image']['name'];
		$image_type=$_FILES['banner_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['banner_image']['size'];
		$temp_name=$_FILES['banner_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$banner_image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		
	}
	
	
		
	$pageUpdSql = "insert ignore into tbl_page set
					acf_template ='".mysqli_real_escape_string($conn,$_REQUEST['acf_template'])."',
					parent_page ='".mysqli_real_escape_string($conn,$_REQUEST['parent_page'])."',
					meta_title='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
					meta_keyword='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
					meta_desc='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."', 
					page_name='".mysqli_real_escape_string($conn,$_REQUEST['page_name'])."',
					banner_heading='".mysqli_real_escape_string($conn,$_REQUEST['banner_heading'])."',
					content='".mysqli_real_escape_string($conn,$_REQUEST['page_desc'])."',
					banner_image='".$banner_image_name."',
					page_image='".$image_name."'
					";
	
	$pageUpdExe = mysqli_query($conn,$pageUpdSql) or die(mysqli_error($conn));
	$last_id=mysqli_insert_id($conn);		
	
	
	
	
	foreach ($_REQUEST['acf_field_id'] as $acf_field_id) 
	{
		
	
		if($_REQUEST['acf_type'][$acf_field_id]=='Image' || $_REQUEST['acf_type'][$acf_field_id]=='File')	
		{
			
			 $_FILES['acf']['name'][$acf_field_id];
			
			if(!empty($_FILES['acf']['name'][$acf_field_id]))
			{
	
			$image_name=time()."_".$_FILES['acf']['name'][$acf_field_id];
			$image_type=$_FILES['acf']['type'][$acf_field_id];
			$type=explode("/","$image_type");
			$image_size=$_FILES['acf']['size'][$acf_field_id];
			$temp_name=$_FILES['acf']['tmp_name'][$acf_field_id];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$_REQUEST['acf'][$acf_field_id]=$image_name;
			}
			
			
		}
		
			
		
			
		 $inser_page_acf_sql="insert ignore into tbl_page_meta set
		 	page_id ='".$last_id."',
		 	acf_id ='".$_REQUEST['acf_id'][$acf_field_id]."',
		 	acf_field_id ='".$acf_field_id."',
		 	meta_key ='".$_REQUEST['acf_key'][$acf_field_id]."',
		 	meta_value  ='".$_REQUEST['acf'][$acf_field_id]."'
		";	
		$inser_page_acf_rs=mysqli_query($conn,$inser_page_acf_sql);
	}	 
					
	
	// foreach ($_REQUEST['acf'] as $acf_key=>$acf_value) 
	// {
		// $inser_page_acf_sql="insert into tbl_page_meta set
		 	// page_id ='".$last_id."',
		 	// acf_id ='".$_REQUEST['acf_id'][$acf_key]."',
		 	// acf_field_id ='".$acf_key."',
		 	// meta_key ='".$_REQUEST['acf_key'][$acf_key]."',
		 	// meta_value  ='".$_REQUEST['acf'][$acf_key]."'
		// ";	
		// $inser_page_acf_rs=mysqli_query($conn,$inser_page_acf_sql);
	// }
	
	
	
	
		
		
		
		if($pageUpdExe){
		$cmsmessage = showMessage("Page Content Added Successfully.",'success');
		}else{
		$cmsmessage = showMessage("Server Problem! Try after some time",'error');
		}
	
	
}

if(isset($_REQUEST['edit_page']) && $_REQUEST['edit_page']=='Submit'){
	
	$pageUpdSql = "update ignore tbl_page set
					acf_template ='".mysqli_real_escape_string($conn,$_REQUEST['acf_template'])."',
					parent_page ='".mysqli_real_escape_string($conn,$_REQUEST['parent_page'])."',
					meta_title='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
					meta_keyword='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
					meta_desc='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."', 
					page_name='".mysqli_real_escape_string($conn,$_REQUEST['page_name'])."',
					
					banner_heading='".mysqli_real_escape_string($conn,$_REQUEST['banner_heading'])."',
					content='".mysqli_real_escape_string($conn,$_REQUEST['page_desc'])."'
				
					where id='".$_REQUEST['pgid']."'";
	
	$pageUpdExe = mysqli_query($conn,$pageUpdSql) or die(mysqli_error($conn));
	//die();				 
	
	
		if(!empty($_FILES['page_image']['name']))
		{

		$image_name=time()."_".$_FILES['page_image']['name'];
		$image_type=$_FILES['page_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['page_image']['size'];
		$temp_name=$_FILES['page_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_page set 
					page_image='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
		}
		
		if(!empty($_FILES['banner_image']['name']))
	{
		$image_name=time()."_".$_FILES['banner_image']['name'];
		$image_type=$_FILES['banner_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['banner_image']['size'];
		$temp_name=$_FILES['banner_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_page set 
					banner_image='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	
	$delete_page_acf_sql="delete from tbl_page_meta where page_id ='".$_REQUEST['pgid']."'";
	$delete_page_acf_rs=mysqli_query($conn,$delete_page_acf_sql);
	
	
		
	foreach ($_REQUEST['acf_field_id'] as $acf_field_id) 
	{
		
	
		if($_REQUEST['acf_type'][$acf_field_id]=='Image' || $_REQUEST['acf_type'][$acf_field_id]=='File')	
		{
			
			
			
			if(!empty($_FILES['acf']['name'][$acf_field_id]))
			{
	
			$image_name=time()."_".$_FILES['acf']['name'][$acf_field_id];
			$image_type=$_FILES['acf']['type'][$acf_field_id];
			$type=explode("/","$image_type");
			$image_size=$_FILES['acf']['size'][$acf_field_id];
			$temp_name=$_FILES['acf']['tmp_name'][$acf_field_id];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$_REQUEST['acf'][$acf_field_id]=$image_name;
			}
			
			
		}
		else if($_REQUEST['acf_type'][$acf_field_id]=='Gallery')	
		{
			
			 $_FILES['acf']['name'][$acf_field_id];
			
			if(!empty($_FILES['acf']['name'][$acf_field_id]))
			{
	
			$image_name=time()."_".$_FILES['acf']['name'][$acf_field_id];
			$image_type=$_FILES['acf']['type'][$acf_field_id];
			$type=explode("/","$image_type");
			$image_size=$_FILES['acf']['size'][$acf_field_id];
			$temp_name=$_FILES['acf']['tmp_name'][$acf_field_id];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$_REQUEST['acf'][$acf_field_id]=$image_name;
			}
			
			
		}
			
		
			
		 echo $inser_page_acf_sql="insert ignore into tbl_page_meta set
		 	page_id ='".$_REQUEST['pgid']."',
		 	acf_id ='".$_REQUEST['acf_id'][$acf_field_id]."',
		 	acf_field_id ='".$acf_field_id."',
		 	meta_key ='".$_REQUEST['acf_key'][$acf_field_id]."',
		 	meta_value  ='".$_REQUEST['acf'][$acf_field_id]."'
		";	
		$inser_page_acf_rs=mysqli_query($conn,$inser_page_acf_sql);
	}
	
		
		
	
		
		if($pageUpdExe){
		$cmsmessage = showMessage("Page Content Updated Successfully.",'success');
		}else{
		$cmsmessage = showMessage("Server Problem! Try after some time",'error');
		}

}



$action  = $_REQUEST['actnpage'];	
$page_id = $_REQUEST['page_id'];		
if($action == 'dellpage'){
	
$del_att_sql ="delete from tbl_page where id = '".$page_id."'";	
$del_att_exe = mysqli_query($conn,$del_att_sql);	

$del_att_sql ="delete from tbl_page_meta where page_id = '".$page_id."'";	
$del_att_exe = mysqli_query($conn,$del_att_sql);	



if($del_att_sql)
{
      $cmsmessage.= showMessage("Page Has Been Deleted Successfuly",'success');
	}
	else
	{
      $cmsmessage.= showMessage('Query Cannot Be Run','error');	
}
}
?>