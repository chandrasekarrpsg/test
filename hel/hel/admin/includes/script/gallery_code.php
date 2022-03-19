<?php
$gallerymsg1		= '';
$type			= $_GET['type'];
ini_set("post_max_size", "200M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );
ini_set("max_file_uploads", "600" );


/***************************  Create a New Gallery Image******************************************************/

if(isset($_REQUEST['save_gallery']) && $_REQUEST['save_gallery'] == 'Save'){
	$gallery_name = $_REQUEST['gallery_name'];

		$_FILES['gallery_image']['name'];
		if(!empty($_FILES['gallery_image']['name']))
		{
	
			$image_name=time().$_FILES['gallery_image']['name'];
			$image_type=$_FILES['gallery_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['gallery_image']['size'];
			$temp_name=$_FILES['gallery_image']['tmp_name'];
			
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			
		}	
			
			
		$addCatSql = "insert ignore into tbl_gallery set
		service_id='".htmlspecialchars(stripslashes($_REQUEST['service_id']),ENT_QUOTES)."',
		gallery_name='".htmlspecialchars(stripslashes($gallery_name),ENT_QUOTES)."',
		gallery_srt_desc='".htmlspecialchars(stripslashes($_REQUEST['gallery_srt_desc']),ENT_QUOTES)."',
		gallery_year='".htmlspecialchars(stripslashes($_REQUEST['gallery_year']),ENT_QUOTES)."',
		gallery_image='".$image_name."',
		post_date='".date('Y-m-d')."'";
		$addCatExe = mysqli_query($conn,$addCatSql);
        
       $last_inserted_id = mysqli_insert_id($conn);  
	   
	   
	  
			//echo"<pre>";
			
			// print_r($_FILES['gallery_mulimag']);
			// echo"</pre>";
			// die();
			 $a=$_FILES['gallery_mulimage']['name'];
		echo $len=count($a);
		for($i=0; $i<$len; $i++)
		{
			
			$dir="post_img/";
			if(!empty($_FILES['gallery_mulimage']['name'][$i]))
			{
			
				
	  				
					$sponsor_image=$_FILES['gallery_mulimage']['name'][$i];
					$temp_name=$_FILES['gallery_mulimage']['tmp_name'][$i];
					$upload_sponsor_image=$dir.$sponsor_image;
					$upload=move_uploaded_file($temp_name,$upload_sponsor_image);
					
				  $add_spon_sql="insert ignore into tbl_gallery_image set
	           		parent_gal_id='".$last_inserted_id."',
					mul_gal_image='".$_FILES['gallery_mulimage']['name'][$i]."'" ; 
							
					$add_spon_exe=mysqli_query($conn,$add_spon_sql);
				
			}
		}
		
       
      
		if($addCatExe){
			$gallerymsg1 = "Gallery Image Entered Successfuly";
			$msgtype = "success";
		}else{
			$gallerymsg1 = "Query Cann't be Executed";
			$msgtype = "error";
		}
		$gallerymsg1 .= showMessage($gallerymsg1,$msgtype);
        
        
        
        
		

	
}

/***************************  Modify(Edit) an existing Gallery Image  *******************************************/

if(isset($_REQUEST['edit_gallery']) && $_REQUEST['edit_gallery'] == 'Update'){
	$gallery_name = $_REQUEST['gallery_name'];
	$edit_gallery_id = $_REQUEST['gallery_id'];
	
	
		$_FILES['gallery_image']['name'];
		if(!empty($_FILES['gallery_image']['name']))
		{
	
			$image_name=time().$_FILES['gallery_image']['name'];
			$image_type=$_FILES['gallery_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['gallery_image']['size'];
			$temp_name=$_FILES['gallery_image']['tmp_name'];
			
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$pageUpdSql1 = "update ignore tbl_gallery set 
					gallery_image='".$image_name."' where gallery_id='".$edit_gallery_id."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error());
			
		}
		$updCatSql = "update ignore tbl_gallery set 
		service_id='".htmlspecialchars(stripslashes($_REQUEST['service_id']),ENT_QUOTES)."',
		gallery_name='".htmlspecialchars(stripslashes($gallery_name),ENT_QUOTES)."',
		gallery_srt_desc='".htmlspecialchars(stripslashes($_REQUEST['gallery_srt_desc']),ENT_QUOTES)."',
		gallery_year='".htmlspecialchars(stripslashes($_REQUEST['gallery_year']),ENT_QUOTES)."',
		post_date='".date('Y-m-d')."'
		
		where gallery_id='".$edit_gallery_id."'";
		$updCatExe = mysqli_query($conn,$updCatSql);
        
        //$last_inserted_id = mysqli_insert_id();  
        
		$a=$_FILES['gallery_mulimage']['name'];
		 $len=count($a);
		for($i=0; $i<$len; $i++)
		{
			
			$dir="post_img/";
			if(!empty($_FILES['gallery_mulimage']['name'][$i]))
			{
			
				
	  				
					$sponsor_image=$_FILES['gallery_mulimage']['name'][$i];
					$temp_name=$_FILES['gallery_mulimage']['tmp_name'][$i];
					$upload_sponsor_image=$dir.$sponsor_image;
					$upload=move_uploaded_file($temp_name,$upload_sponsor_image);
					
				  $add_spon_sql="insert ignore into tbl_gallery_image set
	           		parent_gal_id='".$edit_gallery_id."',
					mul_gal_image='".$_FILES['gallery_mulimage']['name'][$i]."'" ; 
							
					$add_spon_exe=mysqli_query($conn,$add_spon_sql);
				
			}
		}



       
        $gallerymsg1 .= showMessage($gallerymsg1,$msgtype);
}


/***************************  Modify(Delete) an existing Gallery Image  *****************************************/

$actn_gallery  = $_REQUEST['actngallery'];
$categoryid = $_REQUEST['gallery_id'];
if($actn_gallery == 'dellgallery'){
	
	$delCatSql = "delete from tbl_gallery where gallery_id='".$categoryid."'";
		$delCatExe = mysqli_query($conn,$delCatSql);
		
		$delCatSql = "delete from tbl_gallery_image where parent_gal_id='".$categoryid."'";
		$delCatExe = mysqli_query($conn,$delCatSql);
		if($delCatExe){
			$gallerymsg1 = "Gallery Image Delete Successfuly";
			$msgtype = "success";
		}else{
			$gallerymsg1 = "Query Cann't be Executated";
			$msgtype = "error";
		}
	$gallerymsg1 .= showMessage($gallerymsg1,$msgtype);

}



// Edit Multiple gallery image
if(isset($_REQUEST['edit_gallery_image']) && $_REQUEST['edit_gallery_image'] == 'Update'){
    
    if(!empty($_FILES['mul_gal_image']['name']))
    {

        $mulimage_name=time().$_FILES['mul_gal_image']['name'];
        $image_type=$_FILES['mul_gal_image']['type'];
        $type=explode("/","$image_type");
        $image_size=$_FILES['mul_gal_image']['size'];
        $temp_name=$_FILES['mul_gal_image']['tmp_name'];
		
        $dir="post_img/";
        $uploadimage=$dir.$mulimage_name;
        $upload=move_uploaded_file($temp_name,$uploadimage);
        echo $mulgalUpdSql1 = "update ignore tbl_gallery_image set 
                mul_gal_image='".$mulimage_name."' where mul_gal_id='".$_REQUEST['mul_gal_id']."'";
        $mulgalUpdExe = mysqli_query($conn,$mulgalUpdSql1) or die(mysqli_error());
        
        if($mulgalUpdExe){
            $gallerymsg1 .= showMessage('Gallery Image Updated Successfully','success');
        }else{
            $gallerymsg1 .= showMessage('An error occurred while updating...','error');
        }
        
    }
    
}

// DELETE CODE FOR MULTIPLE GALLERY IMAGE

$actnmultiplegallery  = $_REQUEST['actnmultiplegallery'];
$mulgalid = $_REQUEST['mul_gal_id'];
if($actnmultiplegallery == 'dellmultiplegallery'){
    
    $delCatSql = "delete from tbl_gallery_image where mul_gal_id='".$mulgalid."'";
        $delCatExe = mysqli_query($conn,$delCatSql);
        if($delCatExe){
            $gallerymsg1 = "Gallery Image Deleted Successfully";
            $msgtype = "success";
        }else{
            $gallerymsg1 = "Query Can't be Executed";
            $msgtype = "error";
        }
    $gallerymsg1 = showMessage($gallerymsg1,$msgtype);

}










if(isset($_REQUEST['save_video_gallery']) && $_REQUEST['save_video_gallery'] == 'Save'){
	$gallery_name = $_REQUEST['gallery_name'];

		$_FILES['gallery_image']['name'];
		if(!empty($_FILES['gallery_image']['name']))
		{
	
			$image_name=time().$_FILES['gallery_image']['name'];
			$image_type=$_FILES['gallery_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['gallery_image']['size'];
			$temp_name=$_FILES['gallery_image']['tmp_name'];
			
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			
		}	
			
			
		$addCatSql = "insert ignore into tbl_video_gallery set
		
		gallery_name='".htmlspecialchars(stripslashes($gallery_name),ENT_QUOTES)."',
		gallery_link='".htmlspecialchars(stripslashes($_REQUEST['gallery_link']),ENT_QUOTES)."',
		gallery_year='".htmlspecialchars(stripslashes($_REQUEST['gallery_year']),ENT_QUOTES)."',
		gallery_image='".$image_name."',
		post_date='".date('Y-m-d')."'";
		$addCatExe = mysqli_query($conn,$addCatSql);
        
       $last_inserted_id = mysqli_insert_id($conn);  
        
      
		if($addCatExe){
			$gallerymsg1 = "Video Gallery Entered Successfuly";
			$msgtype = "success";
		}else{
			$gallerymsg1 = "Query Cann't be Executed";
			$msgtype = "error";
		}
		$gallerymsg1 .= showMessage($gallerymsg1,$msgtype);
        
        
        
        
		

	
}

if(isset($_REQUEST['edit_video_gallery']) && $_REQUEST['edit_video_gallery'] == 'Update'){
	$gallery_name = $_REQUEST['gallery_name'];
	$edit_gallery_id = $_REQUEST['gallery_id'];
	
	
		$_FILES['gallery_image']['name'];
		if(!empty($_FILES['gallery_image']['name']))
		{
	
			$image_name=time().$_FILES['gallery_image']['name'];
			$image_type=$_FILES['gallery_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['gallery_image']['size'];
			$temp_name=$_FILES['gallery_image']['tmp_name'];
			
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$pageUpdSql1 = "update ignore tbl_video_gallery set 
					gallery_image='".$image_name."' where gallery_id='".$edit_gallery_id."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error());
			
		}
		 $updCatSql = "update ignore tbl_video_gallery set 
		
		gallery_name='".htmlspecialchars(stripslashes($gallery_name),ENT_QUOTES)."',
		gallery_link='".htmlspecialchars(stripslashes($_REQUEST['gallery_link']),ENT_QUOTES)."',
		gallery_year='".htmlspecialchars(stripslashes($_REQUEST['gallery_year']),ENT_QUOTES)."',
		post_date='".date('Y-m-d')."'
		
		where gallery_id='".$edit_gallery_id."'";
		$updCatExe = mysqli_query($conn,$updCatSql);
        
        //$last_inserted_id = mysqli_insert_id();  
        
		



       if($addCatExe){
			$gallerymsg1 = "Video Gallery update Successfuly";
			$msgtype = "success";
		}else{
			$gallerymsg1 = "Query Cann't be Executed";
			$msgtype = "error";
		}
        $gallerymsg1 .= showMessage($gallerymsg1,$msgtype);
}


$actn_gallery  = $_REQUEST['actnvideo_gallery'];
$categoryid = $_REQUEST['gallery_id'];
if($actn_gallery == 'dellvideo_gallery'){
	
	$delCatSql = "delete from tbl_video_gallery where gallery_id='".$categoryid."'";
		$delCatExe = mysqli_query($conn,$delCatSql);
		if($delCatExe){
			$gallerymsg1 = "Gallery video Delete Successfuly";
			$msgtype = "success";
		}else{
			$gallerymsg1 = "Query Cann't be Executated";
			$msgtype = "error";
		}
	$gallerymsg1 .= showMessage($gallerymsg1,$msgtype);
}
?>