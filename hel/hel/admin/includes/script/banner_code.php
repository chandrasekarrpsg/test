<?php
$message		= '';
$type= $_GET['type'];
ini_set("banner_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_banner']) && $_REQUEST['save_banner']=="Save"){
	

if(!empty($_FILES['banner_image']['name']))
	{

		$image_name=time().$_FILES['banner_image']['name'];
		$image_type=$_FILES['banner_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['banner_image']['size'];
		$temp_name=$_FILES['banner_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
       
	}
	else
	{

		$image_name = 'noimage.jpg';

	}

	$add_banner_sql="insert ignore into  tbl_home_banner set       
	ban_title ='".mysqli_real_escape_string($conn,$_REQUEST['banner_title'])."',
			ban_image='".$image_name."'";
            
           //die(); 
$add_banner_exe=mysqli_query($conn,$add_banner_sql) or die(mysqli_error($conn));
if($add_banner_exe){
$bannermsg.= showMessage("Banner has been added successfully",'success');		
}			 						
}

//$lsat_id = mysqli_insert_id();


// $color_arr=explode(",",mysqli_real_escape_string($conn,$_REQUEST['banner_color']));
// $size_arr=explode(",",mysqli_real_escape_string($conn,$_REQUEST['banner_size']));
// foreach($color_arr as $col)
// {
// $add_prod_col_sql="insert into tbl_prod_col set col='".$col."',
// prod_id='".$lsat_id."'";
// $add_prod_col_rs=mysqli_query($conn,$add_prod_col_sql);
// }


// $fieldcount=$_REQUEST['hiddencount'];
// 		
// 		
		// for($i=1; $i<$fieldcount; $i++){
// 						
// 						
					// if($_REQUEST['banner_color'.$i]!='')
					// {
					// $get_color_sql="select * from tbl_color where color_id='".$_REQUEST['banner_color'.$i]."'";
					// $get_color_rs=mysqli_query($conn,$get_color_sql);	
					// $get_color_row=mysqli_fetch_array($get_color_rs);
// 						
					// $pageaddSql="insert into tbl_prod_col set
					// prod_id='".$lsat_id."', 
					// color_id='".mysqli_real_escape_string($conn,$_REQUEST['banner_color'.$i])."', 
					// col='".$get_color_row['color_code']."' 
// 					
					// ";
					// mysqli_query($conn,$pageaddSql);
// 					
					





if(isset($_REQUEST['edit_banner']) && $_REQUEST['edit_banner']=="Update"){
				
			
			if(!empty($_FILES['banner_image']['name']))
			{

			$image_name=time().$_FILES['banner_image']['name'];
			$image_type=$_FILES['banner_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['banner_image']['size'];
			$temp_name=$_FILES['banner_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_banner_sql="update ignore tbl_home_banner set 
			banner_image ='".$image_name."'
			where banner_id='".$_REQUEST['banner_id']."'";
			$edit_banner_exe1=mysqli_query($conn,$edit_banner_sql)  or die(mysqli_error($conn));	

			}
			$edit_banner_sql="update ignore tbl_home_banner set 
			ban_title ='".mysqli_real_escape_string($conn,$_REQUEST['banner_title'])."'
			where ban_id='".$_REQUEST['banner_id']."'";
			$edit_banner_exe1=mysqli_query($conn,$edit_banner_sql)  or die(mysqli_error($conn));	

if($edit_banner_exe1){
$bannermsg.= showMessage("Banner has been updated successfully",'success');		
}
}



$action  = $_REQUEST['actnbanner'];
$banner_id = $_REQUEST['banner_id'];
if($action == 'dellbanner' && !empty($banner_id))
{
$DelbannerSql = 'DELETE FROM tbl_home_banner WHERE ban_id  = "'.$banner_id.'"';
$DelbannerQuery = g_db_query($DelbannerSql);

if($DelbannerQuery){
$bannermsg.= showMessage('The Banner Has Been Deleted','success');
}
}






?>