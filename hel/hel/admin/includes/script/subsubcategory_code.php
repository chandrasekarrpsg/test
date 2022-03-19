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

if(isset($_REQUEST['save_subsubcate']) && $_REQUEST['save_subsubcate'] == 'Save'){
	$new_category = $_REQUEST['new_category'];
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
	
	if(empty($new_category)){
		$message1 .= showMessage('Enter New Category','error');
	}else{
		$duplicate_sql 	 = 'SELECT sub_sub_cat_name FROM '.TABLE_PREFIX.'subsubcategory WHERE sub_sub_cat_name = "'.$new_category.'"';
		$duplicate_query = g_db_query($duplicate_sql);
		if($duplicate_query){
			$duplicate_count = g_db_num_rows($duplicate_query);
			if($duplicate_count == 1){
				$message1 .= showMessage('Sub Sub Category Already Exists','warning');
			}else{
				$sql = "insert ignore into tbl_subsubcategory set    
		 sub_sub_cat_name='".htmlspecialchars(stripslashes($_REQUEST['new_category']),ENT_QUOTES)."', 
		 cat_id='".mysqli_real_escape_string($conn,$_REQUEST['category_id'])."', 
		 sub_cat_id='".mysqli_real_escape_string($conn,$_REQUEST['subcategory_id'])."', 
		 banner_image='".$banner_image."',
		 sub_sub_cat_image='".$image_name."',
		menu_image='".$image_name2."'";
				$query = g_db_query($sql);
				if($query){
					$catmessage3 .= showMessage('Category Entered Successfuly','success');
				}else{
					$catmessage3 .= showMessage("Query Cann't be Executated",'error');
				}
			}
		}else{
			$catmessage3 .= showMessage("Query Cann't be Executated",'error');
		}
	}
		
}else{
	if(isset($_REQUEST['save_cat_cancel']) && $_REQUEST['save_cat_cancel'] == 'Cancel'){
		header('location:subsubcategory.php?type=listsubsubcat&lp=ac&'.session_name().'='.session_id());
	}
}




/***************************  Modify(Edit) an existing Category  *******************************************/

if(isset($_REQUEST['edit_subsubcate']) && $_REQUEST['edit_subsubcate'] == 'Save'){
				

			$edit_cat_sql="update ignore tbl_subsubcategory set
							sub_sub_cat_name='".htmlspecialchars(stripslashes($_REQUEST['edit_category']),ENT_QUOTES)."',
							sub_sub_cat_desc='".htmlspecialchars(stripslashes($_REQUEST['sub_sub_cat_desc']),ENT_QUOTES)."',
							 cat_id='".mysqli_real_escape_string($conn,$_REQUEST['category_id'])."', 
							 sub_cat_id='".mysqli_real_escape_string($conn,$_REQUEST['subcategory_id'])."'
					         				
            				where sub_sub_cat_id ='".$_REQUEST['edit_category_id']."'";
                            
                            
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
			
			$edit_cat_sql1="update ignore tbl_subsubcategory set 
			sub_sub_cat_image ='".$image_name."'
			where sub_sub_cat_id='".$_REQUEST['edit_category_id']."'";
			echo $edit_cat_sql1;
			//$edit_image_exe = mysqli_query($conn,$edit_image_sql)  or die(mysqli_error($conn));	
			$edit_cat_rest1=mysqli_query($conn,$edit_cat_sql1)  or die(mysqli_error($conn));
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
			
			$edit_cat_sql2="update ignore tbl_subsubcategory set 
			banner_image ='".$image_name1."'
			where sub_sub_cat_id='".$_REQUEST['edit_category_id']."'";
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
			
			$edit_cat_sql3="update ignore tbl_subsubcategory set 
			menu_image ='".$image_name2."'
			where sub_sub_cat_id='".$_REQUEST['edit_category_id']."'";
			$edit_cat_rest3=mysqli_query($conn,$edit_cat_sql3)  or die(mysqli_error($conn));
			}
			
			
			if($edit_cat_rest){
			$catmessage3.= showMessage("Category has been updated successfully",'success');		
			}
			
			}




/***************************  Modify(Delete) an existing Category  *****************************************/

$action  = $_REQUEST['actn'];
$sscategoryid = $_REQUEST['sscid'];
if($action == 'del'){
	$DelCatSql = 'DELETE FROM '.TABLE_PREFIX.'subsubcategory WHERE sub_sub_cat_id = "'.$sscategoryid.'"';
	$DelCatQuery = g_db_query($DelCatSql);
	if($DelCatQuery){
		$catmessage3 .= showMessage('Sub Sub Category Has Been Deleted Successfuly','success');
		
	}else{
		$catmessage3 .= showMessage('Query Cannot Be Run','error');
	}
}

?>