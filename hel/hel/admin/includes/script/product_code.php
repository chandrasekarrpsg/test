<?php
$message		= '';
$type= $_GET['type'];
ini_set("product_max_size", "100M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_product']) && $_REQUEST['save_product']=="Save"){
	
	$product_title=strtolower($_REQUEST['product_title']);
	
$ser_alias = alias($product_title);	
	
	$cat_id=$_REQUEST['cat_id'];
	
	$ser_sql="select * from tbl_product where alise='".$ser_alias."' and cat_id='".$cat_id."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
	
if(!empty($_FILES['product_image']['name']))
	{

		$image_name=time().$_FILES['product_image']['name'];
		$image_type=$_FILES['product_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['product_image']['size'];
		$temp_name=$_FILES['product_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		//createThumbnail($image_name,284); 

	}
	else
	{

		$fimage_name = 'noimage.jpg';

	}
	if(!empty($_FILES['featured_image']['name']))
	{

		$fimage_name=time().$_FILES['featured_image']['name'];
		$fimage_type=$_FILES['featured_image']['type'];
		$ftype=explode("/","$fimage_type");
		$fimage_size=$_FILES['featured_image']['size'];
		$ftemp_name=$_FILES['featured_image']['tmp_name'];
		$fdir="post_img/";
		$fuploadimage=$fdir.$fimage_name;
		$fupload=move_uploaded_file($ftemp_name,$fuploadimage);

	}
	else
	{

		$fimage_name = 'noimage.jpg';

	}



if(!empty($_FILES['zoom_image']['name']))
	{

		$zimage_name=time().$_FILES['zoom_image']['name'];
		$fimage_type=$_FILES['zoom_image']['type'];
		$ftype=explode("/","$fimage_type");
		$fimage_size=$_FILES['zoom_image']['size'];
		$ftemp_name=$_FILES['zoom_image']['tmp_name'];
		$fdir="post_img/";
		$fuploadimage=$fdir.$zimage_name;
		$fupload=move_uploaded_file($ftemp_name,$fuploadimage);

	}
	else
	{

		$fimage_name = 'noimage.jpg';

	}



	$add_product_sql="insert ignore into tbl_product set   
	 meta_title='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."',
 meta_keyword='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."',
 meta_desc='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',    
	cat_id='".mysqli_real_escape_string($conn,$_REQUEST['cat_id'])."',
	sub_cat_id='".mysqli_real_escape_string($conn,$_REQUEST['subcategory_id'])."',
	sub_sub_cat_id='".mysqli_real_escape_string($conn,$_REQUEST['subsubcategory_id'])."',
	product_title='".mysqli_real_escape_string($conn,$_REQUEST['product_title'])."',
	product_code='".mysqli_real_escape_string($conn,$_REQUEST['product_code'])."', 
	alise='".$ser_alias."',  
	   featuerd_cont='".mysqli_real_escape_string($conn,$_REQUEST['featuerd_cont'])."',     	
		 product_price='".mysqli_real_escape_string($conn,$_REQUEST['product_price'])."',
		   product_stock='".mysqli_real_escape_string($conn,$_REQUEST['product_stock'])."',
		    product_srt_desc='".mysqli_real_escape_string($conn,$_REQUEST['product_srt_desc'])."',
		product_overview='".mysqli_real_escape_string($conn,$_REQUEST['product_overview'])."',
		  product_discount_price='".mysqli_real_escape_string($conn,$_REQUEST['product_discount_price'])."',
		   product_featured='".mysqli_real_escape_string($conn,$_REQUEST['product_featured'])."',
		   product_new_arrive='".mysqli_real_escape_string($conn,$_REQUEST['product_new_arrive'])."',
		   product_recent='".mysqli_real_escape_string($conn,$_REQUEST['product_recent'])."',  
			product_image='".$image_name."',
			zoom_image='".$zimage_name."',
			featured_image='".$fimage_name."'";
            
           //die(); 
$add_product_exe=mysqli_query($conn,$add_product_sql) or die(mysqli_error($conn));

if($add_product_exe){
	$last_id=mysqli_insert_id($conn);
	
		 $total_image=count($_FILES['image_gallery']['name']);
		//echo $total_image;
		for($i=0;$i<$total_image;$i++)
		{
			if(!empty($_FILES['image_gallery']['name'][$i]))
			{
				$image_name=time().$_FILES['image_gallery']['name'][$i];
				$image_type=$_FILES['image_gallery']['type'][$i];
				$type=explode("/","$image_type");
				$image_size=$_FILES['image_gallery']['size'][$i];
				$temp_name=$_FILES['image_gallery']['tmp_name'][$i];
				$dir="post_img/";
				$uploadimage=$dir.$image_name;
				$upload=move_uploaded_file($temp_name,$uploadimage);
				
			
				 $sql="insert ignore into tbl_product_gallery set
				product_id='".mysqli_real_escape_string($conn,$last_id)."',
				image_gallery='".$image_name."'";
				$run=mysqli_query($conn,$sql);
		
			}
		}
		}
		
if($add_product_exe){
$productmsg.= showMessage("Product has been added successfully",'success');		
}
}
else
{
		$productmsg .= showMessage('There is an item with same name.','error');
}	
			 						
}

if(isset($_REQUEST['edit_product']) && $_REQUEST['edit_product']=="Update"){
	
	$product_title=strtolower($_REQUEST['product_title']);
	$ser_alias = alias($product_title);	
	$ser_sql="select * from tbl_product where alise='".$ser_alias."' and product_id!='".$_REQUEST['product_id']."' and cat_id='".$_REQUEST['cat_id']."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
$edit_product_sql1="update ignore tbl_product set
 meta_title='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."',
 meta_keyword='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."',
 meta_desc='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."',
cat_id='".mysqli_real_escape_string($conn,$_REQUEST['cat_id'])."',
sub_cat_id='".mysqli_real_escape_string($conn,$_REQUEST['sub_category'])."',
sub_sub_cat_id='".mysqli_real_escape_string($conn,$_REQUEST['subsubcategory_id'])."',
	product_title='".mysqli_real_escape_string($conn,$_REQUEST['product_title'])."', 
	product_code='".mysqli_real_escape_string($conn,$_REQUEST['product_code'])."', 
	alise='".$ser_alias."',		 
	   featuerd_cont='".mysqli_real_escape_string($conn,$_REQUEST['featuerd_cont'])."',	
	   product_price='".mysqli_real_escape_string($conn,$_REQUEST['product_price'])."',
	    product_stock='".mysqli_real_escape_string($conn,$_REQUEST['product_stock'])."',
	   product_srt_desc='".mysqli_real_escape_string($conn,$_REQUEST['product_srt_desc'])."',
	   product_overview='".mysqli_real_escape_string($conn,$_REQUEST['product_overview'])."',
	    product_featured='".mysqli_real_escape_string($conn,$_REQUEST['product_featured'])."',
	       product_new_arrive='".mysqli_real_escape_string($conn,$_REQUEST['product_new_arrive'])."',
	    product_recent='".mysqli_real_escape_string($conn,$_REQUEST['product_recent'])."',
		  product_discount_price='".mysqli_real_escape_string($conn,$_REQUEST['product_discount_price'])."'			
            where product_id ='".$_REQUEST['product_id']."'";
			$edit_product_exe1=mysqli_query($conn,$edit_product_sql1)  or die(mysqli_error($conn));	
			

			
			
			if(!empty($_FILES['product_image']['name']))
			{

			$image_name=time().$_FILES['product_image']['name'];
			$image_type=$_FILES['product_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['product_image']['size'];
			$temp_name=$_FILES['product_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			//createThumbnail($image_name,284); 
			$edit_product_sql="update ignore tbl_product set 
			product_image ='".$image_name."'
			where product_id='".$_REQUEST['product_id']."'";
			mysqli_query($conn,$edit_product_sql)  or die(mysqli_error($conn));	

			}
			
			
			if(!empty($_FILES['featured_image']['name']))
	{

		$fimage_name=time().$_FILES['featured_image']['name'];
		$fimage_type=$_FILES['featured_image']['type'];
		$ftype=explode("/","$fimage_type");
		$fimage_size=$_FILES['featured_image']['size'];
		$ftemp_name=$_FILES['featured_image']['tmp_name'];
		$fdir="post_img/";
		$fuploadimage=$fdir.$fimage_name;
		$fupload=move_uploaded_file($ftemp_name,$fuploadimage);
		$edit_product_sql="update ignore tbl_product set 
		featured_image='".$fimage_name."'
		where product_id='".$_REQUEST['product_id']."'";
		mysqli_query($conn,$edit_product_sql)  or die(mysqli_error($conn));

	}
	
	
	
			if(!empty($_FILES['zoom_image']['name']))
	{

		$zimage_name=time().$_FILES['zoom_image']['name'];
		$fimage_type=$_FILES['zoom_image']['type'];
		$ftype=explode("/","$fimage_type");
		$fimage_size=$_FILES['zoom_image']['size'];
		$ftemp_name=$_FILES['zoom_image']['tmp_name'];
		$fdir="post_img/";
		$fuploadimage=$fdir.$zimage_name;
		$fupload=move_uploaded_file($ftemp_name,$fuploadimage);
		$edit_product_sql="update ignore tbl_product set 
		zoom_image='".$zimage_name."'
		where product_id='".$_REQUEST['product_id']."'";
		mysqli_query($conn,$edit_product_sql)  or die(mysqli_error($conn));

	}
	
	
 $total_image=count($_FILES['image_gallery']['name']);
		
		//echo $total_image;
		for($i=0;$i<$total_image;$i++)
		{
			if(!empty($_FILES['image_gallery']['name'][$i]))
	{
		$image_name=time().$_FILES['image_gallery']['name'][$i];
		$image_type=$_FILES['image_gallery']['type'][$i];
		$type=explode("/","$image_type");
		$image_size=$_FILES['image_gallery']['size'][$i];
		$temp_name=$_FILES['image_gallery']['tmp_name'][$i];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		
		
	
			$sql="insert ignore into tbl_product_gallery set
			product_id='".$_REQUEST['product_id']."',
			image_gallery='".$image_name."'";
			$run=mysqli_query($conn,$sql);
			
		
	}
  }






if($edit_product_exe1){
$productmsg.= showMessage("Product has been updated successfully",'success');		
}
}
else
{
	$productmsg .= showMessage('There is an item with same name.','error');
}
}


if(isset($_REQUEST['edit_gallery']) && $_REQUEST['edit_gallery']=='Update')
	{
		
	   $totalimage=count($_FILES['img_gallery']['name']);
		
		 for($i=0;$i<$totalimage;$i++)
		{
			if(!empty($_FILES['img_gallery']['name'][$i]))
			{
              
			$file_name=time().$_FILES['img_gallery']['name'][$i];
			$file_type=$_FILES['img_gallery']['type'][$i];
			$type=explode("/","$file_type");
			$image_size=$_FILES['img_gallery']['size'][$i];
			$temp_name=$_FILES['img_gallery']['tmp_name'][$i];
			$dir="post_img/";
			$uploadfile=$dir.$file_name;
			$upload=move_uploaded_file($temp_name,$uploadfile);
		    $gal_sql="update ignore tbl_product_gallery set
		     image_gallery='".$file_name."'
		   where product_gallery_id='".$_REQUEST['product_gallery_id'][$i]."'";
		$gal_run=mysqli_query($conn,$gal_sql);
			}		
		}
		if($gal_run){
			$postmsg.= showMessage('The image gallery Has Been updated','success');
			
		}
			
	}



 $action  = $_REQUEST['actn_product_gallery'];
 $gallery_id = $_REQUEST['product_gallery_id'];


if($action == 'del_product_gallery' && !empty($gallery_id))
{
 $del_gallery_Sql = 'DELETE FROM tbl_product_gallery WHERE product_gallery_id  = "'.$gallery_id.'"';
$del_gallery_Query = mysqli_query($conn,$del_gallery_Sql);
if($del_gallery_Query){
$post_msg.= showMessage('The image gallery Has Been Deleted','success');
}
}


$action  = $_REQUEST['actnproduct'];
$product_id = $_REQUEST['product_id'];
if($action == 'dellproduct' && !empty($product_id))
{
$DelproductSql = 'DELETE FROM tbl_product WHERE product_id  = "'.$product_id.'"';
$DelproductQuery = g_db_query($DelproductSql);

$DelprodSql11 = 'DELETE FROM  tbl_prod_col WHERE prod_id = "'.$product_id.'"';
$DelprodQuery11 = g_db_query($DelprodSql11);

$DelprodSql11 = 'DELETE FROM tbl_prod_img WHERE prod_id = "'.$product_id.'"';
$DelprodQuery11 = g_db_query($DelprodSql11);

$DelprodSql11 = 'DELETE FROM tbl_prod_size WHERE prod_id = "'.$product_id.'"';
$DelprodQuery11 = g_db_query($DelprodSql11);


if($DelproductQuery){
$productmsg.= showMessage('The Project Has Been Deleted','success');
}

}


?>