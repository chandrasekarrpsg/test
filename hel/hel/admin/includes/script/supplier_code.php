<?php
$message		= '';
$type= $_GET['type'];
ini_set("supplier_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_supplier']) && $_REQUEST['save_supplier']=="Save"){
	

if(!empty($_FILES['supplier_image']['name']))
	{

		$image_name=time().$_FILES['supplier_image']['name'];
		$image_type=$_FILES['supplier_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['supplier_image']['size'];
		$temp_name=$_FILES['supplier_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
       
	}
	else
	{

		$image_name = 'noimage.jpg';

	}
	
	
	if(!empty($_FILES['logo_image']['name']))
	{

		$limage_name=time().$_FILES['logo_image']['name'];
		$image_type=$_FILES['logo_image']['type'];
		$type=explode("/","$limage_type");
		$image_size=$_FILES['logo_image']['size'];
		$temp_name=$_FILES['logo_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
       
	}
	else
	{

		$image_name = 'noimage.jpg';

	}
	
	

	$add_supplier_sql="insert ignore into tbl_supplier set       
	short_desc ='".mysqli_real_escape_string($conn,$_REQUEST['short_desc'])."',
	show_home_page='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."',
			supplier_image='".$image_name."',
			logo_image='".$limage_name."'";
            
           //die(); 
$add_supplier_exe=mysqli_query($conn,$add_supplier_sql) or die(mysqli_error($conn));
if($add_supplier_exe){
$suppliermsg.= showMessage("supplier has been added successfully",'success');		
}			 						
}

//$lsat_id = mysqli_insert_id();


// $color_arr=explode(",",mysqli_real_escape_string($conn,$_REQUEST['supplier_color']));
// $size_arr=explode(",",mysqli_real_escape_string($conn,$_REQUEST['supplier_size']));
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
					// if($_REQUEST['supplier_color'.$i]!='')
					// {
					// $get_color_sql="select * from tbl_color where color_id='".$_REQUEST['supplier_color'.$i]."'";
					// $get_color_rs=mysqli_query($conn,$get_color_sql);	
					// $get_color_row=mysqli_fetch_array($get_color_rs);
// 						
					// $pageaddSql="insert into tbl_prod_col set
					// prod_id='".$lsat_id."', 
					// color_id='".mysqli_real_escape_string($conn,$_REQUEST['supplier_color'.$i])."', 
					// col='".$get_color_row['color_code']."' 
// 					
					// ";
					// mysqli_query($conn,$pageaddSql);
// 					
					





if(isset($_REQUEST['edit_supplier']) && $_REQUEST['edit_supplier']=="Update"){
				
			
			if(!empty($_FILES['supplier_image']['name']))
			{

			$image_name=time().$_FILES['supplier_image']['name'];
			$image_type=$_FILES['supplier_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['supplier_image']['size'];
			$temp_name=$_FILES['supplier_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_supplier_sql="update ignore tbl_supplier set 
			supplier_image ='".$image_name."'
			where supplier_id='".$_REQUEST['supplier_id']."'";
			$edit_supplier_exe1=mysqli_query($conn,$edit_supplier_sql)  or die(mysqli_error($conn));	

			}
							
							if(!empty($_FILES['logo_image']['name']))
					{
				
						$limage_name=time().$_FILES['logo_image']['name'];
						$image_type=$_FILES['logo_image']['type'];
						$type=explode("/","$limage_type");
						$image_size=$_FILES['logo_image']['size'];
						$temp_name=$_FILES['logo_image']['tmp_name'];
						$dir="post_img/";
						$uploadimage=$dir.$limage_name;
						$upload=move_uploaded_file($temp_name,$uploadimage);
				       $edit_supplier_sql="update ignore tbl_supplier set 
						logo_image ='".$limage_name."'
						where supplier_id='".$_REQUEST['supplier_id']."'";
						$edit_supplier_exe1=mysqli_query($conn,$edit_supplier_sql)  or die(mysqli_error($conn));	
					}
				
			
			
			
			$edit_supplier_sql="update ignore tbl_supplier set 
			short_desc ='".mysqli_real_escape_string($conn,$_REQUEST['short_desc'])."',
			show_home_page='".mysqli_real_escape_string($conn,$_REQUEST['show_home'])."'
			where supplier_id='".$_REQUEST['supplier_id']."'";
			$edit_supplier_exe1=mysqli_query($conn,$edit_supplier_sql)  or die(mysqli_error($conn));	

if($edit_supplier_exe1){
$suppliermsg.= showMessage("supplier has been updated successfully",'success');		
}
}



$action  = $_REQUEST['actnsupplier'];
$supplier_id = $_REQUEST['supplier_id'];
if($action == 'dellsupplier' && !empty($supplier_id))
{
$DelsupplierSql = 'DELETE FROM tbl_supplier WHERE supplier_id  = "'.$supplier_id.'"';
$DelsupplierQuery = g_db_query($DelsupplierSql);

if($DelsupplierQuery){
$suppliermsg.= showMessage('The supplier Has Been Deleted','success');
}
}






?>