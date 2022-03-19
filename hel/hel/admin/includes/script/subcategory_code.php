<?php
$message		= '';
$type			= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );
//print phpinfo();
//print ini_get('upload_max_filesize');
/***************************  Create a New Caterory  ******************************************************/

if(isset($_REQUEST['save_subcate']) && $_REQUEST['save_subcate'] == 'Save'){
	$new_category = $_REQUEST['new_category'];
	$cat_id = $_REQUEST['category_id'];
	if(!empty($_FILES['category_image']['name']))
	{
		$image_name=time().'_'.$_FILES['category_image']['name'];
		$image_type=$_FILES['category_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['category_image']['size'];
		$temp_name=$_FILES['category_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
	}
	else
	{}
	
	
	if(!empty($_FILES['featured_cat_image']['name']))
	{
		$image_name1=time().'_'.$_FILES['featured_cat_image']['name'];
		$image_type1=$_FILES['featured_cat_image']['type'];
		$type1=explode("/","$image_type");
		$image_size1=$_FILES['featured_cat_image']['size'];
		$temp_name1=$_FILES['featured_cat_image']['tmp_name'];
		$dir1="post_img/";
		$uploadimage1=$dir1.$image_name1;
		$upload1=move_uploaded_file($temp_name1,$uploadimage1);
	}
	else
	{}
	
	if(!empty($_FILES['banner_image']['name']))
	{
		$image_name2=time().'_'.$_FILES['banner_image']['name'];
		$image_type1=$_FILES['banner_image']['type'];
		$type1=explode("/","$image_type");
		$image_size1=$_FILES['banner_image']['size'];
		$temp_name1=$_FILES['banner_image']['tmp_name'];
		$dir1="post_img/";
		$uploadimage1=$dir1.$image_name2;
		$upload1=move_uploaded_file($temp_name1,$uploadimage1);
	}
	else
	{}
	
	
	
	if(empty($new_category)){
		$catmessage2 .= showMessage('Enter New Category','error');
	}else{
		$duplicate_sql 	 = 'SELECT sub_cat_name FROM '.TABLE_PREFIX.'subcategory WHERE sub_cat_name = "'.$new_category.'" and cat_id="'.$cat_id.'"';
		$duplicate_query = g_db_query($duplicate_sql);
		if($duplicate_query){
			$duplicate_count = g_db_num_rows($duplicate_query);
			if($duplicate_count == 1){
				$catmessage2 .= showMessage('Sub Category Already Exists','warning');
			}else{
				$sql = "insert ignore into tbl_subcategory set    
		 sub_cat_name='".mysqli_real_escape_string($conn,$_REQUEST['new_category'])."', 
		 cat_id='".mysqli_real_escape_string($conn,$_REQUEST['category_id'])."', 
		 featured_cat_image='".$image_name1."',
		 featured_subcat='".mysqli_real_escape_string($conn,$_REQUEST['featured_subcat'])."', 
		 sub_cat_image='".$image_name."',
		 banner_image='".$image_name2."'";
				$query = g_db_query($sql);
				if($query){
					$catmessage2 .= showMessage('Sub Category Entered Successfuly','success');
				}else{
					$catmessage2 .= showMessage("Query Cann't be Executated",'error');
				}
			}
		}else{
			$catmessage2 .= showMessage("Query Cann't be Executated",'error');
		}
	}
		
}else{
	if(isset($_REQUEST['save_cat_cancel']) && $_REQUEST['save_cat_cancel'] == 'Cancel'){
		header('location:category.php?type=listcat&lp=ac&'.session_name().'='.session_id());
	}
}




/***************************  Modify(Edit) an existing Category  *******************************************/

if(isset($_REQUEST['edit_subcate']) && $_REQUEST['edit_subcate'] == 'Save'){
		
	$edit_category = $_REQUEST['edit_category'];
	$cat_id = $_REQUEST['category_id'];
	
	
	if(empty($edit_category)){
		$catmessage2 .= showMessage('Enter New Category','error');
	}else{
		$duplicate_sql 	 = 'SELECT * FROM '.TABLE_PREFIX.'subcategory WHERE sub_cat_name = "'.$edit_category.'" and cat_id="'.$cat_id.'" and sub_cat_id!="'.$_REQUEST['edit_category_id'].'"';
		$duplicate_query = g_db_query($duplicate_sql);
		if($duplicate_query){
			$duplicate_count = g_db_num_rows($duplicate_query);
			if($duplicate_count == 1){
				$catmessage2 .= showMessage('Sub Category Already Exists','warning');
			}else{
			$edit_cat_sql="update ignore tbl_subcategory set
							sub_cat_name='".mysqli_real_escape_string($conn,$_REQUEST['edit_category'])."',
							 featured_subcat='".mysqli_real_escape_string($conn,$_REQUEST['featured_subcat'])."',
							cat_id='".mysqli_real_escape_string($conn,$_REQUEST['category_id'])."'
         				
            				where sub_cat_id ='".$_REQUEST['edit_category_id']."'";
			$edit_cat_rest = mysqli_query($conn,$edit_cat_sql);	
			if(!empty($_FILES['category_image']['name']))
			{

			$image_name=time().'_'.$_FILES['category_image']['name'];
			$image_type=$_FILES['category_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['category_image']['size'];
			$temp_name=$_FILES['category_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			
			$edit_cat_sql1="update ignore tbl_subcategory set 
			sub_cat_image ='".$image_name."'
			where sub_cat_id='".$_REQUEST['edit_category_id']."'";
			//echo $edit_image_sql;
			//$edit_image_exe = mysqli_query($conn,$edit_image_sql)  or die(mysqli_error($conn));	
			$edit_cat_rest1=mysqli_query($conn,$edit_cat_sql1)  or die(mysqli_error($conn));
			}
			
			
			if(!empty($_FILES['featured_cat_image']['name']))
			{

			$image_name1=time().'_'.$_FILES['featured_cat_image']['name'];
			$image_type1=$_FILES['featured_cat_image']['type'];
			$type1=explode("/","$image_type");
			$image_size1=$_FILES['featured_cat_image']['size'];
			$temp_name1=$_FILES['featured_cat_image']['tmp_name'];
			$dir1="post_img/";
			$uploadimage1=$dir1.$image_name1;
			$upload1=move_uploaded_file($temp_name1,$uploadimage1);
			
			$edit_cat_sql2="update ignore tbl_subcategory set 
			featured_cat_image ='".$image_name1."'
			where sub_cat_id='".$_REQUEST['edit_category_id']."'";
			$edit_cat_rest2=mysqli_query($conn,$edit_cat_sql2)  or die(mysqli_error($conn));
			}
			
				if(!empty($_FILES['banner_image']['name']))
			{

			$image_name1=time().'_'.$_FILES['banner_image']['name'];
			$image_type1=$_FILES['banner_image']['type'];
			$type1=explode("/","$image_type");
			$image_size1=$_FILES['banner_image']['size'];
			$temp_name1=$_FILES['banner_image']['tmp_name'];
			$dir1="post_img/";
			$uploadimage1=$dir1.$image_name1;
			$upload1=move_uploaded_file($temp_name1,$uploadimage1);
			
			$edit_cat_sql2="update ignore tbl_subcategory set 
			banner_image ='".$image_name1."'
			where sub_cat_id='".$_REQUEST['edit_category_id']."'";
			$edit_cat_rest2=mysqli_query($conn,$edit_cat_sql2)  or die(mysqli_error($conn));
			}
			
			
			
			}
			if($edit_cat_rest){
			$catmessage2.= showMessage("Sub Category has been updated successfully",'success');		
			}
			
			}
			}
}



/***************************  Modify(Delete) an existing Category  *****************************************/

$action  = $_REQUEST['actn'];
$scategoryid = $_REQUEST['scid'];
if($action == 'del'){
	$DelCatSql = 'DELETE FROM '.TABLE_PREFIX.'subcategory WHERE sub_cat_id = "'.$scategoryid.'"';
	$DelCatSql3 = 'DELETE FROM tbl_subsubcategory WHERE sub_cat_id = "'.$scategoryid.'"';
	$DelCatQuery3 =mysqli_query($conn,$DelCatSql3);
	$DelCatQuery = g_db_query($DelCatSql);
	if($DelCatQuery){
		$catmessage2 .= showMessage('Sub Category Has Been Deleted Successfuly','success');
		
	}else{
		$catmessage2 .= showMessage('Query Cannot Be Run','error');
	}
}

?>