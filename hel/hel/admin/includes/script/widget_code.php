<?php
$message		= '';
$type= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['edit_widget']) && $_REQUEST['edit_widget']=="Update"){
	$edit_widget_sql1="update ignore tbl_widget set
	widget_copyright='".mysqli_real_escape_string($conn,$_REQUEST['widget_copyright'])."',
	widget_admin_email='".mysqli_real_escape_string($conn,$_REQUEST['widget_admin_email'])."',
	foot_content='".mysqli_real_escape_string($conn,$_REQUEST['foot_content'])."',
	 widget_size_guide='".mysqli_real_escape_string($conn,$_REQUEST['widget_design_by'])."',
	 widget_lookbook='".mysqli_real_escape_string($conn,$_REQUEST['widget_lookbook'])."',
	 widget_fashion_enquiry='".mysqli_real_escape_string($conn,$_REQUEST['widget_fashion_enquiry'])."',
	 
	  feature_title='".mysqli_real_escape_string($conn,$_REQUEST['feature_title'])."',
	 feature_desc='".mysqli_real_escape_string($conn,$_REQUEST['feature_desc'])."',
	 rate2='".mysqli_real_escape_string($conn,$_REQUEST['rate2'])."',
	 rate_title3='".mysqli_real_escape_string($conn,$_REQUEST['rate_title3'])."',
	 rate_title2='".mysqli_real_escape_string($conn,$_REQUEST['rate_title2'])."',
	 rate='".mysqli_real_escape_string($conn,$_REQUEST['rate'])."',
	 rate_title1='".mysqli_real_escape_string($conn,$_REQUEST['rate_title1'])."',
	 rate_title='".mysqli_real_escape_string($conn,$_REQUEST['rate_title'])."',
	 
	 widget_welcome='".mysqli_real_escape_string($conn,$_REQUEST['widget_welcome'])."',
	 widget_developer_site='".mysqli_real_escape_string($conn,$_REQUEST['widget_developer_site'])."'
	where widget_id =1";
	
	$edit_widget_exe1=mysqli_query($conn,$edit_widget_sql1)  or die(mysqli_error($conn));	
			
		
				if(!empty($_FILES['rate_image']['name']))
			{

			$image_name1=time().'_'.$_FILES['rate_image']['name'];
			$image_type1=$_FILES['rate_image']['type'];
			$type1=explode("/","$image_type");
			$image_size1=$_FILES['rate_image']['size'];
			$temp_name1=$_FILES['rate_image']['tmp_name'];
			$dir1="post_img/";
			$uploadimage1=$dir1.$image_name1;
			$upload1=move_uploaded_file($temp_name1,$uploadimage1);
			
			$edit_cat_sql2="update ignore tbl_widget set 
			rate_image ='".$image_name1."'
			where widget_id =1";
			$edit_cat_rest2=mysqli_query($conn,$edit_cat_sql2)  or die(mysqli_error($conn));
			}
			
				if(!empty($_FILES['rate_image1']['name']))
			{

			$image_name1=time().'_'.$_FILES['rate_image1']['name'];
			$image_type1=$_FILES['rate_image1']['type'];
			$type1=explode("/","$image_type");
			$image_size1=$_FILES['rate_image1']['size'];
			$temp_name1=$_FILES['rate_image1']['tmp_name'];
			$dir1="post_img/";
			$uploadimage1=$dir1.$image_name1;
			$upload1=move_uploaded_file($temp_name1,$uploadimage1);
			
			$edit_cat_sql2="update ignore tbl_widget set 
			rate_image1 ='".$image_name1."'
			where widget_id =1";
			$edit_cat_rest2=mysqli_query($conn,$edit_cat_sql2)  or die(mysqli_error($conn));
			}
			
		

if($edit_widget_exe1){
$widgetmsg.= showMessage("widget has been updated successfully",'success');		
}
}

?>