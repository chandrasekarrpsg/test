<?php
$gallerymsg		= '';
$type			= $_GET['type'];
ini_set("post_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );
/***************************  Create a New home_gallery Image******************************************************/

if(isset($_REQUEST['save_home_gallery']) && $_REQUEST['save_home_gallery'] == 'Save'){
	$home_gallery_name = $_REQUEST['home_gallery_name'];

		$_FILES['home_gallery_image']['name'];
		if(!empty($_FILES['home_gallery_image']['name']))
		{
	
			$image_name=time().$_FILES['home_gallery_image']['name'];
			$image_type=$_FILES['home_gallery_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['home_gallery_image']['size'];
			$temp_name=$_FILES['home_gallery_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			
		}	
			
			
		$addCatSql = "insert ignore into tbl_home_gallery set
		
		home_gallery_name='".htmlspecialchars(stripslashes($home_gallery_name),ENT_QUOTES)."',
		home_gallery_desc='".htmlspecialchars(stripslashes($_REQUEST['home_gallery_desc']),ENT_QUOTES)."',
		position='".htmlspecialchars(stripslashes($_REQUEST['position']),ENT_QUOTES)."',
		home_gallery_image='".$image_name."'";
		$addCatExe = mysqli_query($conn,$addCatSql);
        
       $last_inserted_id = mysqli_insert_id($conn);  
        
      
		if($addCatExe){
			$gallerymsg = "Home gallery Image Entered Successfuly";
			$msgtype = "success";
		}else{
			$gallerymsg = "Query Cann't be Executed";
			$msgtype = "error";
		}
		$gallerymsg .= showMessage($gallerymsg);
        
        
        
        
		

	
}

/***************************  Modify(Edit) an existing home_gallery Image  *******************************************/

if(isset($_REQUEST['edit_home_gallery']) && $_REQUEST['edit_home_gallery'] == 'Update'){
	$home_gallery_name = $_REQUEST['home_gallery_name'];
	$edit_home_gallery_id = $_REQUEST['home_gallery_id'];
	
	
		$_FILES['home_gallery_image']['name'];
		if(!empty($_FILES['home_gallery_image']['name']))
		{
	
			$image_name=time().$_FILES['home_gallery_image']['name'];
			$image_type=$_FILES['home_gallery_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['home_gallery_image']['size'];
			$temp_name=$_FILES['home_gallery_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$pageUpdSql1 = "update ignore tbl_home_gallery set 
					home_gallery_image='".$image_name."' where home_gallery_id='".$edit_home_gallery_id."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error());
			
		}
		$updCatSql = "update ignore tbl_home_gallery set 
		
		home_gallery_name='".htmlspecialchars(stripslashes($home_gallery_name),ENT_QUOTES)."',
		home_gallery_desc='".htmlspecialchars(stripslashes($_REQUEST['home_gallery_desc']),ENT_QUOTES)."',
		position='".htmlspecialchars(stripslashes($_REQUEST['position']),ENT_QUOTES)."'
		
		where home_gallery_id='".$edit_home_gallery_id."'";
		$updCatExe = mysqli_query($conn,$updCatSql);
        
        //$last_inserted_id = mysqli_insert_id();  
        
		

		if($updCatExe){
			$gallerymsg = "Home gallery Image Updated Successfuly";
			$msgtype = "success";
		}else{
			$gallerymsg = "Query Cann't be Executed";
			$msgtype = "error";
		}
		$gallerymsg .= showMessage($gallerymsg);
        
       

       
}


/***************************  Modify(Delete) an existing home_gallery Image  *****************************************/

$actn_home_gallery  = $_REQUEST['actnhome_gallery'];
$categoryid = $_REQUEST['home_gallery_id'];
if($actn_home_gallery == 'dellhome_gallery'){
	
	$delCatSql = "delete from tbl_home_gallery where home_gallery_id='".$categoryid."'";
		$delCatExe = mysqli_query($conn,$delCatSql);
		if($delCatExe){
			$gallerymsg = "Home gallery Image Delete Successfuly";
			$msgtype = "success";
		}else{
			$gallerymsg = "Query Cann't be Executated";
			$msgtype = "error";
		}
	$gallerymsg .= showMessage($gallerymsg);

}















?>