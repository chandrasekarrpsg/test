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

if(isset($_REQUEST['save_cate']) && $_REQUEST['save_cate'] == 'Save'){

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
	}
	else
	{}
	
	if(!empty($_FILES['mob_banner_image']['name']))
	{
		$mimage_name1=time().'_'.$_FILES['mob_banner_image']['name'];
		$image_type1=$_FILES['mob_banner_image']['type'];
		$type1=explode("/","$image_type");
		$image_size1=$_FILES['mob_banner_image']['size'];
		$temp_name1=$_FILES['mob_banner_image']['tmp_name'];
		$dir1="post_img/";
		$uploadimage1=$dir1.$mimage_name1;
		$upload1=move_uploaded_file($temp_name1,$uploadimage1);
	}
	else
	{}
	
	if(!empty($_FILES['menu_image']['name']))
	{
		$image_name2=time().'_'.$_FILES['menu_image']['name'];
		$image_type2=$_FILES['menu_image']['type'];
		$type2=explode("/","$image_type");
		$image_size2=$_FILES['menu_image']['size'];
		$temp_name2=$_FILES['menu_image']['tmp_name'];
		$dir2="post_img/";
		$uploadimage2=$dir2.$image_name2;
		$upload2=move_uploaded_file($temp_name2,$uploadimage2);
	}
	else
	{}
	
		
	$new_category = strtolower($_REQUEST['new_category']);
	 $ser_alias = alias($new_category);	
	
	if(empty($new_category)){ 
		$message1 .= showMessage('Enter New Category','error');
	}else{
		$duplicate_sql 	 = 'SELECT category_name FROM '.TABLE_PREFIX.'category WHERE alise = "'.$ser_alias.'"';
		$duplicate_query = g_db_query($duplicate_sql);
		if($duplicate_query){
			$duplicate_count = g_db_num_rows($duplicate_query);
			if($duplicate_count == 1){
				$message1 .= showMessage('Category Already Exists','warning');
			}else{
				$sql = "insert ignore into tbl_category set    
		 category_name='".mysqli_real_escape_string($conn,$_REQUEST['new_category'])."', 
		 alise='".$ser_alias."', 
		  menu_image_cont1='".mysqli_real_escape_string($conn,$_REQUEST['menu_image_cont1'])."', 
		    menu_image_cont='".mysqli_real_escape_string($conn,$_REQUEST['menu_image_cont'])."', 
		 banner_image='".$image_name1."',
		  mob_banner_image='".$mimage_name1."',
		category_image='".$image_name."',
		menu_image='".$image_name2."'";
				$query = g_db_query($sql);
				if($query){
					$catmessage1 .= showMessage('Category Entered Successfuly','success');
				}else{
					$catmessage1 .= showMessage("Query Cann't be Executated",'error');
				}
			}
		}else{
			$catmessage1 .= showMessage("Query Cann't be Executated",'error');
		}
	}
		
}else{
	if(isset($_REQUEST['save_cat_cancel']) && $_REQUEST['save_cat_cancel'] == 'Cancel'){
		header('location:category.php?type=listcat&lp=ac&'.session_name().'='.session_id());
	}
}




/***************************  Modify(Edit) an existing Category  *******************************************/

if(isset($_REQUEST['edit_cate']) && $_REQUEST['edit_cate'] == 'Update'){
				
	$edit_category = strtolower($_REQUEST['edit_category']);;
	$ser_alias = alias($edit_category);	
	
	$duplicate_sql 	 = 'SELECT category_name FROM '.TABLE_PREFIX.'category WHERE alise = "'.$ser_alias.'" and category_id!="'.$_REQUEST['edit_category_id'].'"';
		$duplicate_query = g_db_query($duplicate_sql);
		if($duplicate_query){
			$duplicate_count = g_db_num_rows($duplicate_query);
			if($duplicate_count == 1){
				$message1 .= showMessage('Category Already Exists','warning');
			}else{
	
			$edit_cat_sql="update ignore tbl_category set
							category_name='".mysqli_real_escape_string($conn,$_REQUEST['edit_category'])."',
							meta_title='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."',
							meta_keyword='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."',
							meta_desc='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',
							 menu_image_cont1='".mysqli_real_escape_string($conn,$_REQUEST['menu_image_cont1'])."', 
		    menu_image_cont='".mysqli_real_escape_string($conn,$_REQUEST['menu_image_cont'])."', 
							image_cont='".mysqli_real_escape_string($conn,$_REQUEST['image_cont'])."',
							image_cont1='".mysqli_real_escape_string($conn,$_REQUEST['image_cont1'])."',
							 alise='".$ser_alias."'
         				
            				where category_id ='".$_REQUEST['edit_category_id']."'";
			$edit_cat_rest = mysqli_query($conn,$edit_cat_sql);	
		
			
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
			
			$edit_cat_sql2="update ignore tbl_category set 
			banner_image ='".$image_name1."'
			where category_id='".$_REQUEST['edit_category_id']."'";
			$edit_cat_rest2=mysqli_query($conn,$edit_cat_sql2)  or die(mysqli_error($conn));
			}
			
			
			
			
			if(!empty($_FILES['menu_image']['name']))
			{

			$image_name2=time().'_'.$_FILES['menu_image']['name'];
			$image_type2=$_FILES['menu_image']['type'];
			$type2=explode("/","$image_type");
			$image_size2=$_FILES['menu_image']['size'];
			$temp_name2=$_FILES['menu_image']['tmp_name'];
			$dir2="post_img/";
			$uploadimage2=$dir2.$image_name2;
			$upload2=move_uploaded_file($temp_name2,$uploadimage2);
			
			$edit_cat_sql3="update ignore tbl_category set 
			menu_image ='".$image_name2."'
			where category_id='".$_REQUEST['edit_category_id']."'";
			$edit_cat_rest3=mysqli_query($conn,$edit_cat_sql3)  or die(mysqli_error($conn));
			}
			
			
			if($edit_cat_rest){
			$catmessage1.= showMessage("Category has been updated successfully",'success');		
			}
			
			}
		}
}




/***************************  Modify(Delete) an existing Category  *****************************************/

$action  = $_REQUEST['actn'];
$categoryid = $_REQUEST['cid'];
if($action == 'del'){
	$DelCatSql = 'DELETE FROM '.TABLE_PREFIX.'category WHERE category_id = "'.$categoryid.'"';
	$DelCatSql2 = 'DELETE FROM tbl_subcategory WHERE cat_id = "'.$scategoryid.'"';
	$DelCatQuery2 =mysqli_query($conn,$DelCatSql2);
	$DelCatSql3 = 'DELETE FROM tbl_subsubcategory WHERE cat_id = "'.$categoryid.'"';
	$DelCatQuery3 =mysqli_query($conn,$DelCatSql3);
	$DelCatQuery = g_db_query($DelCatSql);
	if($DelCatQuery){
		$catmessage1 .= showMessage('Category Has Been Deleted Successfuly','success');
		
		
	}else{
		$catmessage1 .= showMessage('Query Cannot Be Run','error');
	}
}

?>