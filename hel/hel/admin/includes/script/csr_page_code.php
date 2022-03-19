<?php
if(isset($_REQUEST['save_csr_page']) && $_REQUEST['save_csr_page']=='Submit')
{
	$ser_alias = alias(strtolower($_REQUEST['page_name']));	
	$ser_sql="select * from tbl_csr_page where alise='".$ser_alias."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{		
		
		if(!empty($_FILES['page_image']['name']))
	{

		$image_name=time()."_".$_FILES['page_image']['name'];
		$image_type=$_FILES['page_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['page_image']['size'];
		$temp_name=$_FILES['page_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		
	}
	if(!empty($_FILES['banner_image']['name']))
	{

		$banner_image_name=time()."_".$_FILES['banner_image']['name'];
		$image_type=$_FILES['banner_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['banner_image']['size'];
		$temp_name=$_FILES['banner_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$banner_image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		
	}
	
	if(!empty($_FILES['video_image']['name']))
	{
		$video_image_name=time()."_".$_FILES['video_image']['name'];
		$image_type=$_FILES['video_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['video_image']['size'];
		$temp_name=$_FILES['video_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$video_image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		
	}
	
	
	if(!empty($_FILES['video_mp4']['name']))
	{
		$video_mp4_name=time()."_".$_FILES['video_mp4']['name'];
		$image_type=$_FILES['video_mp4']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['video_mp4']['size'];
		$temp_name=$_FILES['video_mp4']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$video_mp4_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		
	}
	
	
	
		
	$csr_pageUpdSql = "insert ignore into tbl_csr_page set
					alise='".$ser_alias."',
					acf_template ='".mysqli_real_escape_string($conn,$_REQUEST['acf_template'])."',
					parent_page ='".mysqli_real_escape_string($conn,$_REQUEST['parent_page'])."',
					meta_title='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
					meta_keyword='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
					meta_desc='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."', 
					page_name='".mysqli_real_escape_string($conn,$_REQUEST['page_name'])."',
					banner_heading='".mysqli_real_escape_string($conn,$_REQUEST['banner_heading'])."',
					content='".mysqli_real_escape_string($conn,$_REQUEST['page_desc'])."',
					video_image='".$video_image_name."',
					video_mp4='".$video_mp4_name."',
					banner_image='".$banner_image_name."',
					page_image='".$image_name."'
					";
	
	$csr_pageUpdExe = mysqli_query($conn,$csr_pageUpdSql) or die(mysqli_error($conn));
	$last_id=mysqli_insert_id($conn);		
	
	
	
		$fieldcount=$_REQUEST['hiddencount'];
		
		$row_ctr=1;
		for($i=1; $i<$fieldcount; $i++){
						
						
					if($_FILES['addimage'.$i]['name']!='' || $_REQUEST['addcontent'.$i]!='')
					{
					
						
						if(!empty($_FILES['addimage'.$i]['name']))
						{
					
							$image_name=time()."_".$_FILES['addimage'.$i]['name'];
							$image_type=$_FILES['addimage'.$i]['type'];
							$type=explode("/","$image_type");
							$image_size=$_FILES['addimage'.$i]['size'];
							$temp_name=$_FILES['addimage'.$i]['tmp_name'];
							$dir="post_img/";
							$uploadimage=$dir.$image_name;
							$upload=move_uploaded_file($temp_name,$uploadimage);
							
						}
						
						
						$pageaddSql="insert ignore into tbl_csr_details set
						page_id='".$last_id."', 
						page_heading='".mysqli_real_escape_string($conn,$_REQUEST['addlebel'.$i])."', 
						page_image='".$image_name."', 
						row_id='".$row_ctr."', 
						page_details='".mysqli_real_escape_string($conn,$_REQUEST['addcontent'.$i])."'
						";
						mysqli_query($conn,$pageaddSql);
						$row_ctr++;
				}	
					
		}
		
		
		if($csr_pageUpdExe){
		$cmsmessage = showMessage("Page Content Added Successfully.",'success');
		}else{
		$cmsmessage = showMessage("Server Problem! Try after some time",'error');
		}
	
	}
else
{
		$cmsmessage .= showMessage('There is an item with same name.','error');
}	
	
}

if(isset($_REQUEST['edit_csr_page']) && $_REQUEST['edit_csr_page']=='Submit'){
	
	
	$ser_alias = alias(strtolower($_REQUEST['page_name']));	
	$ser_sql="select * from tbl_csr_page where alise='".$ser_alias."' and id!='".$_REQUEST['pgid']."'";
	$ser_res=mysqli_query($conn,$ser_sql);
	$ser_row=mysqli_fetch_array($ser_res);
	$ser_num=mysqli_num_rows($ser_res);
	if($ser_num<1)
	{	
	
	$csr_pageUpdSql = "update ignore tbl_csr_page set
					alise='".$ser_alias."',
					acf_template ='".mysqli_real_escape_string($conn,$_REQUEST['acf_template'])."',
					parent_page ='".mysqli_real_escape_string($conn,$_REQUEST['parent_page'])."',
					meta_title='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
					meta_keyword='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
					meta_desc='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."', 
					page_name='".mysqli_real_escape_string($conn,$_REQUEST['page_name'])."',
					active='1',
					banner_heading='".mysqli_real_escape_string($conn,$_REQUEST['banner_heading'])."',
					content='".mysqli_real_escape_string($conn,$_REQUEST['page_desc'])."'
				
					where id='".$_REQUEST['pgid']."'";
	
	$csr_pageUpdExe = mysqli_query($conn,$csr_pageUpdSql) or die(mysqli_error($conn));
	//die();				 
	
	
		if(!empty($_FILES['page_image']['name']))
		{

		$image_name=time()."_".$_FILES['page_image']['name'];
		$image_type=$_FILES['page_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['page_image']['size'];
		$temp_name=$_FILES['page_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$csr_pageUpdSql1 = "update ignore tbl_csr_page set 
					page_image='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$csr_pageUpdExe = mysqli_query($conn,$csr_pageUpdSql1) or die(mysqli_error($conn));
		}
		
		if(!empty($_FILES['banner_image']['name']))
	{
		$image_name=time()."_".$_FILES['banner_image']['name'];
		$image_type=$_FILES['banner_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['banner_image']['size'];
		$temp_name=$_FILES['banner_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$csr_pageUpdSql1 = "update ignore tbl_csr_page set 
					banner_image='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$csr_pageUpdExe = mysqli_query($conn,$csr_pageUpdSql1) or die(mysqli_error($conn));
	}
	
	if(!empty($_FILES['video_image']['name']))
	{
		$image_name=time()."_".$_FILES['video_image']['name'];
		$image_type=$_FILES['video_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['video_image']['size'];
		$temp_name=$_FILES['video_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		 $pageUpdSql1 = "update ignore tbl_csr_page set 
					video_image='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	
	if(!empty($_FILES['video_mp4']['name']))
	{
		$image_name=time()."_".$_FILES['video_mp4']['name'];
		$image_type=$_FILES['video_mp4']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['video_mp4']['size'];
		$temp_name=$_FILES['video_mp4']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		 $pageUpdSql1 = "update ignore tbl_csr_page set 
					video_mp4='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	
	
	
		 $reccount1=$_REQUEST['reccount1'];
		for($i=1; $i<=$reccount1; $i++)
		{
			if($_FILES['additionalimage'.$i]['name']!='' || $_REQUEST['additionalcontent'.$i]!='')
			{
				
				if(!empty($_FILES['additionalimage'.$i]['name']))
				{
			
					$image_name=time()."_".$_FILES['additionalimage'.$i]['name'];
					$image_type=$_FILES['additionalimage'.$i]['type'];
					$type=explode("/","$image_type");
					$image_size=$_FILES['additionalimage'.$i]['size'];
					$temp_name=$_FILES['additionalimage'.$i]['tmp_name'];
					$dir="post_img/";
					$uploadimage=$dir.$image_name;
					$upload=move_uploaded_file($temp_name,$uploadimage);
					
					 $csr_pageUpdSql1 = "update ignore tbl_csr_details set 
								page_image='".$image_name."' where id='".$_REQUEST['id'.$i]."'";
					$csr_pageUpdExe = mysqli_query($conn,$csr_pageUpdSql1) or die(mysqli_error($conn));
					
				}
			
			
			
					  $pageeditSql="update ignore tbl_csr_details set
					page_id='".$_REQUEST['pgid']."', 
					page_heading='".mysqli_real_escape_string($conn,$_REQUEST['additionallebel'.$i])."', 
					page_details='".mysqli_real_escape_string($conn,$_REQUEST['additionalcontent'.$i])."',
					row_id='".$i."' 
					where id='".mysqli_real_escape_string($conn,$_REQUEST['id'.$i])."'
					";
					$pageeditRs=mysqli_query($conn,$pageeditSql);
			}
		}	
		
		$fieldcount=$_REQUEST['hiddencount'];
		$row_ctr=$reccount1+1;
		
		for($i=1; $i<$fieldcount; $i++){
						
						
				if($_FILES['addimage'.$i]['name']!='' || $_REQUEST['addcontent'.$i]!='')
				{
						
						
						if(!empty($_FILES['addimage'.$i]['name']))
						{
					
							$image_name=time()."_".$_FILES['addimage'.$i]['name'];
							$image_type=$_FILES['addimage'.$i]['type'];
							$type=explode("/","$image_type");
							$image_size=$_FILES['addimage'.$i]['size'];
							$temp_name=$_FILES['addimage'.$i]['tmp_name'];
							$dir="post_img/";
							$uploadimage=$dir.$image_name;
							$upload=move_uploaded_file($temp_name,$uploadimage);
							
							
							
						}
						
						
						$pageaddSql="insert ignore into tbl_csr_details set
						page_id='".$_REQUEST['pgid']."', 
						page_heading='".mysqli_real_escape_string($conn,$_REQUEST['addlebel'.$i])."', 
						page_image='".$image_name."', 
						row_id='".$row_ctr."', 
						page_details='".mysqli_real_escape_string($conn,$_REQUEST['addcontent'.$i])."'
						";
						mysqli_query($conn,$pageaddSql);
						$row_ctr++;
				}	
					
		}
	
	
		
		if($csr_pageUpdExe){
		$cmsmessage = showMessage("Page Content Updated Successfully.",'success');
		}else{
		$cmsmessage = showMessage("Server Problem! Try after some time",'error');
		}
		
		}
else
{
	$cmsmessage .= showMessage('There is an item with same name.','error');
}

}



$action  = $_REQUEST['actncsr_page'];	
$csr_page_id = $_REQUEST['csr_page_id'];		
if($action == 'dellcsr_page'){
	
$del_att_sql ="delete from tbl_csr_page where id = '".$csr_page_id."'";	
$del_att_exe = mysqli_query($conn,$del_att_sql);	

$del_att_sql ="delete from tbl_csr_details where page_id = '".$csr_page_id."'";	
$del_att_exe = mysqli_query($conn,$del_att_sql);	


if($del_att_sql)
{
      $cmsmessage.= showMessage("Page Has Been Deleted Successfuly",'success');
	}
	else
	{
      $cmsmessage.= showMessage('Query Cannot Be Run','error');	
}
}
?>