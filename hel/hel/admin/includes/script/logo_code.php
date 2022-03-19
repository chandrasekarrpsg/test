<?php
$message		= '';
$type= $_GET['type'];
ini_set("logo_max_size", "10M");
ini_set("upload_max_filesize", "128M");
ini_set("max_input_time", "300");
ini_set("max_execution_time", "300");
ini_set("memory_limit", -1 );

if(isset($_REQUEST['save_logo']) && $_REQUEST['save_logo']=="Save"){
	

if(!empty($_FILES['logo_image']['name']))
	{

		$image_name=time().$_FILES['logo_image']['name'];
		$image_type=$_FILES['logo_image']['type'];
		$type=explode("/","$image_type");
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

	$add_logo_sql="insert ignore into tbl_logo set       
	
			logo_image='".$image_name."'";
            
           //die(); 
$add_logo_exe=mysqli_query($conn,$add_logo_sql) or die(mysqli_error($conn));

//$lsat_id = mysqli_insert_id();


// $color_arr=explode(",",mysqli_real_escape_string($conn,$_REQUEST['logo_color']));
// $size_arr=explode(",",mysqli_real_escape_string($conn,$_REQUEST['logo_size']));
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
					// if($_REQUEST['logo_color'.$i]!='')
					// {
					// $get_color_sql="select * from tbl_color where color_id='".$_REQUEST['logo_color'.$i]."'";
					// $get_color_rs=mysqli_query($conn,$get_color_sql);	
					// $get_color_row=mysqli_fetch_array($get_color_rs);
// 						
					// $pageaddSql="insert into tbl_prod_col set
					// prod_id='".$lsat_id."', 
					// color_id='".mysqli_real_escape_string($conn,$_REQUEST['logo_color'.$i])."', 
					// col='".$get_color_row['color_code']."' 
// 					
					// ";
					// mysqli_query($conn,$pageaddSql);
// 					
					



if($add_logo_exe){
$logomsg.= showMessage("Logo has been added successfully",'success');		
}

else
{
		$logomsg .= showMessage('There is an item with same name.','error');
}	
			 						
}

if(isset($_REQUEST['edit_logo']) && $_REQUEST['edit_logo']=="Update"){
				
			
			if(!empty($_FILES['logo_image']['name']))
			{

			$image_name=time().$_FILES['logo_image']['name'];
			$image_type=$_FILES['logo_image']['type'];
			$type=explode("/","$image_type");
			$image_size=$_FILES['logo_image']['size'];
			$temp_name=$_FILES['logo_image']['tmp_name'];
			$dir="post_img/";
			$uploadimage=$dir.$image_name;
			$upload=move_uploaded_file($temp_name,$uploadimage);
			$edit_logo_sql="update ignore tbl_logo set 
			logo_image ='".$image_name."'
			where logo_id='".$_REQUEST['logo_id']."'";
			$edit_logo_exe1=mysqli_query($conn,$edit_logo_sql)  or die(mysqli_error($conn));	

			}
			

if($edit_logo_exe1){
$logomsg.= showMessage("Logo has been updated successfully",'success');		
}

else
{
	$logomsg .= showMessage('There is an item with same name.','error');
}
}




$action  = $_REQUEST['actnlogo'];
$logo_id = $_REQUEST['logo_id'];
if($action == 'delllogo' && !empty($logo_id))
{
$DellogoSql = 'DELETE FROM tbl_logo WHERE logo_id  = "'.$logo_id.'"';
$DellogoQuery = g_db_query($DellogoSql);

if($DellogoQuery){
$logomsg.= showMessage('The Logo Has Been Deleted','success');
}
}






?>