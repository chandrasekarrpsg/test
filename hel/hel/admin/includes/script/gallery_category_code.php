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

if(isset($_REQUEST['save_gal_cate']) && $_REQUEST['save_gal_cate'] == 'Save'){

	
		
	$new_gallery_category = strtolower($_REQUEST['new_gallery_category']);
	 $ser_alias = alias($new_gallery_category);	
	
	if(empty($new_gallery_category)){ 
		$gallerymsg1 .= showMessage('Enter New gallery category','error');
	}else{
		$duplicate_sql 	 = 'SELECT gallery_category_name FROM '.TABLE_PREFIX.'gallery_category WHERE alise = "'.$ser_alias.'"';
		$duplicate_query = g_db_query($duplicate_sql);
		if($duplicate_query){
			$duplicate_count = g_db_num_rows($duplicate_query);
			if($duplicate_count == 1){
				$gallerymsg1 .= showMessage('gallery category Already Exists','warning');
			}else{
							
		if(!empty($_FILES['category_image']['name']))
		{
	
			$image_name=time().$_FILES['category_image']['name'];
			$image_type=$_FILES['category_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['category_image']['size'];
			$temp_name=$_FILES['category_image']['tmp_name'];
			
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			
		}		
					
				
			$sql = "insert ignore into tbl_gallery_category set  
			category_image='".$image_name."',   
		 gallery_category_name='".mysqli_real_escape_string($conn,$_REQUEST['new_gallery_category'])."', 
		 alise='".$ser_alias."'
		";
				$query = g_db_query($sql);
				if($query){
					$gallerymsg1 .= showMessage('gallery category Entered Successfuly','success');
				}else{
					$gallerymsg1 .= showMessage("Query Cann't be Executated",'error');
				}
			}
		}else{
			$gallerymsg1 .= showMessage("Query Cann't be Executated",'error');
		}
	}
		
}else{
	if(isset($_REQUEST['save_cat_cancel']) && $_REQUEST['save_cat_cancel'] == 'Cancel'){
		header('location:gallery.php?type=listcat&lp=ac&'.session_name().'='.session_id());
	}
}




/***************************  Modify(Edit) an existing gallery  *******************************************/

if(isset($_REQUEST['edit_gal_cate']) && $_REQUEST['edit_gal_cate'] == 'Update'){
				
	$edit_gallery = strtolower($_REQUEST['edit_gallery_category']);;
	$ser_alias = alias($edit_gallery);	
	
	$duplicate_sql 	 = 'SELECT gallery_category_name FROM '.TABLE_PREFIX.'gallery_category WHERE alise = "'.$ser_alias.'" and gallery_category_id!="'.$_REQUEST['edit_gallery_category_id'].'"';
		$duplicate_query = g_db_query($duplicate_sql);
		if($duplicate_query){
			$duplicate_count = g_db_num_rows($duplicate_query);
			if($duplicate_count == 1){
				$gallerymsg1 .= showMessage('gallery Already Exists','warning');
			}else{
				
				
				
				if(!empty($_FILES['category_image']['name']))
		{
	
			$image_name=time().$_FILES['category_image']['name'];
			$image_type=$_FILES['category_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['category_image']['size'];
			$temp_name=$_FILES['category_image']['tmp_name'];
			
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$pageUpdSql1 = "update ignore  tbl_gallery_category set 
					category_image='".$image_name."' where gallery_category_id='".$_REQUEST['edit_gallery_category_id']."'";
			$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error());
			
		}
	
			 $edit_cat_sql="update ignore tbl_gallery_category set
							gallery_category_name='".mysqli_real_escape_string($conn,$_REQUEST['edit_gallery_category'])."',
							
							 alise='".$ser_alias."'
         				
            				where gallery_category_id ='".$_REQUEST['edit_gallery_category_id']."'";
			$edit_cat_rest = mysqli_query($conn,$edit_cat_sql);	
		
			
			
			
			if($edit_cat_rest){
			$gallerymsg1.= showMessage("gallery category has been updated successfully",'success');		
			}
			
			}
		}
}




/***************************  Modify(Delete) an existing gallery  *****************************************/

$action  = $_REQUEST['actngalcat'];
$gallerycatid = $_REQUEST['gcid'];
if($action == 'delgalcat'){
	$DelCatSql = 'DELETE FROM '.TABLE_PREFIX.'gallery_category WHERE gallery_category_id = "'.$gallerycatid.'"';
	$DelCatQuery = g_db_query($DelCatSql);
	if($DelCatQuery){
		$gallerymsg1 .= showMessage('gallery category Has Been Deleted Successfuly','success');
		
		
	}else{
		$gallerymsg1 .= showMessage('Query Cannot Be Run','error');
	}
}

?>