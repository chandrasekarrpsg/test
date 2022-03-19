<?php
if(isset($_REQUEST['page_content']) && $_REQUEST['page_content']=='Submit'){

$cmsmessage		= '';
	
	 $pageUpdSql = "update ignore tbl_pagecontent set
					meta_title='".mysqli_real_escape_string($conn,$_REQUEST['meta_title'])."', 
					meta_keyword='".mysqli_real_escape_string($conn,$_REQUEST['meta_keyword'])."', 
					meta_desc='".mysqli_real_escape_string($conn,$_REQUEST['meta_desc'])."', 
					heading='".mysqli_real_escape_string($conn,$_REQUEST['heading'])."',  
					content='".mysqli_real_escape_string($conn,$_REQUEST['page_desc'])."',
					
					feature_link='".mysqli_real_escape_string($conn,$_REQUEST['feature_link'])."',
					feature_link1='".mysqli_real_escape_string($conn,$_REQUEST['feature_link1'])."',
					feature_desc1='".mysqli_real_escape_string($conn,$_REQUEST['feature_desc1'])."', 
					feature_desc='".mysqli_real_escape_string($conn,$_REQUEST['feature_desc'])."',
					
					
					add_cont1='".mysqli_real_escape_string($conn,$_REQUEST['add_cont1'])."', 
					add_cont2='".mysqli_real_escape_string($conn,$_REQUEST['add_cont2'])."',  
					add_cont3='".mysqli_real_escape_string($conn,$_REQUEST['add_cont3'])."', 
					add_cont4='".mysqli_real_escape_string($conn,$_REQUEST['add_cont4'])."', 
					add_cont5='".mysqli_real_escape_string($conn,$_REQUEST['add_cont5'])."', 
					add_cont6='".mysqli_real_escape_string($conn,$_REQUEST['add_cont6'])."', 
					add_cont7='".mysqli_real_escape_string($conn,$_REQUEST['add_cont7'])."', 
					add_cont8='".mysqli_real_escape_string($conn,$_REQUEST['add_cont8'])."', 
					add_cont9='".mysqli_real_escape_string($conn,$_REQUEST['add_cont9'])."', 
					add_cont10='".mysqli_real_escape_string($conn,$_REQUEST['add_cont10'])."', 
					
					banner_heading='".mysqli_real_escape_string($conn,$_REQUEST['banner_heading'])."' 
					where id='".$_REQUEST['pgid']."'";
	
	$pageUpdExe = mysqli_query($conn,$pageUpdSql) or die(mysqli_error($conn));
	//die();				 
	
	
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
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					banner_image='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
				
	
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
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					page_image='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	if(!empty($_FILES['banner_image_webp']['name']))
	{
		$image_name=time()."_".$_FILES['banner_image_webp']['name'];
		$image_type=$_FILES['banner_image_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['banner_image_webp']['size'];
		$temp_name=$_FILES['banner_image_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					banner_image_webp='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
		
		
	
	if(!empty($_FILES['brochure_pdf']['name']))
	{
		$image_name=time()."_".$_FILES['brochure_pdf']['name'];
		$image_type=$_FILES['brochure_pdf']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['brochure_pdf']['size'];
		$temp_name=$_FILES['brochure_pdf']['tmp_name'];
		$dir="pdf_folder/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					brochure_pdf='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
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
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
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
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					video_mp4='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	
	if(!empty($_FILES['video_webm']['name']))
	{
		$image_name=time()."_".$_FILES['video_webm']['name'];
		$image_type=$_FILES['video_webm']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['video_webm']['size'];
		$temp_name=$_FILES['video_webm']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					video_webm='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
			
		
		
			
	
	
	
			if(!empty($_FILES['back_image']['name']))
	{
		$image_name=time()."_".$_FILES['back_image']['name'];
		$image_type=$_FILES['back_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['back_image']['size'];
		$temp_name=$_FILES['back_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					back_image='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
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

		$pageUpdSql1 = "update ignore tbl_pagecontent set 

					banner_image='".$image_name."' where id='".$_REQUEST['pgid']."'";

		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));

	}

	
	
	
	
	
	
	if(!empty($_FILES['feature_image']['name']))
	{

		$image_name=time()."_".$_FILES['feature_image']['name'];
		$image_type=$_FILES['feature_image']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['feature_image']['size'];
		$temp_name=$_FILES['feature_image']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					feature_image='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	
	if(!empty($_FILES['feature_image_webp']['name']))
	{

		$image_name=time()."_".$_FILES['feature_image_webp']['name'];
		$image_type=$_FILES['feature_image_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['feature_image_webp']['size'];
		$temp_name=$_FILES['feature_image_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					feature_image_webp='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	
		if(!empty($_FILES['feature_image1']['name']))
	{

		$image_name=time()."_".$_FILES['feature_image1']['name'];
		$image_type=$_FILES['feature_image1']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['feature_image1']['size'];
		$temp_name=$_FILES['feature_image1']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					feature_image1='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	if(!empty($_FILES['feature_image1_webp']['name']))
	{

		$image_name=time()."_".$_FILES['feature_image1_webp']['name'];
		$image_type=$_FILES['feature_image1_webp']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['feature_image1_webp']['size'];
		$temp_name=$_FILES['feature_image1_webp']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					feature_image1_webp='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
		
		
		if(!empty($_FILES['feature_logo']['name']))

	{



		$image_name=time()."_".$_FILES['feature_logo']['name'];

		$image_type=$_FILES['feature_logo']['type'];

		$type=explode("/","$image_type");

		$image_size=$_FILES['feature_logo']['size'];

		$temp_name=$_FILES['feature_logo']['tmp_name'];

		$dir="post_img/";

		$uploadimage=$dir.$image_name;

		$upload=move_uploaded_file($temp_name,$uploadimage);

		$pageUpdSql1 = "update ignore tbl_pagecontent set 

					feature_logo='".$image_name."' where id='".$_REQUEST['pgid']."'";

		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));

	}

		
		
		
	if(!empty($_FILES['feature_logo1']['name']))
	{

		$image_name=time()."_".$_FILES['feature_logo1']['name'];
		$image_type=$_FILES['feature_logo1']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['feature_logo1']['size'];
		$temp_name=$_FILES['feature_logo1']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					feature_logo1='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	if(!empty($_FILES['add_img1']['name']))
	{

		$image_name=time()."_".$_FILES['add_img1']['name'];
		$image_type=$_FILES['add_img1']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['add_img1']['size'];
		$temp_name=$_FILES['add_img1']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					add_img1='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	if(!empty($_FILES['add_img2']['name']))
	{

		$image_name=time()."_".$_FILES['add_img2']['name'];
		$image_type=$_FILES['add_img2']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['add_img2']['size'];
		$temp_name=$_FILES['add_img2']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					add_img2='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	if(!empty($_FILES['add_img3']['name']))
	{

		$image_name=time()."_".$_FILES['add_img3']['name'];
		$image_type=$_FILES['add_img3']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['add_img3']['size'];
		$temp_name=$_FILES['add_img3']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					add_img3='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	if(!empty($_FILES['add_img4']['name']))
	{

		$image_name=time()."_".$_FILES['add_img4']['name'];
		$image_type=$_FILES['add_img4']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['add_img4']['size'];
		$temp_name=$_FILES['add_img4']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					add_img4='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	if(!empty($_FILES['add_img5']['name']))
	{

		$image_name=time()."_".$_FILES['add_img5']['name'];
		$image_type=$_FILES['add_img5']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['add_img5']['size'];
		$temp_name=$_FILES['add_img5']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					add_img5='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	if(!empty($_FILES['add_img6']['name']))
	{

		$image_name=time()."_".$_FILES['add_img6']['name'];
		$image_type=$_FILES['add_img6']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['add_img6']['size'];
		$temp_name=$_FILES['add_img6']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					add_img6='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
	if(!empty($_FILES['add_img7']['name']))
	{

		$image_name=time()."_".$_FILES['add_img7']['name'];
		$image_type=$_FILES['add_img7']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['add_img7']['size'];
		$temp_name=$_FILES['add_img7']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					add_img7='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	if(!empty($_FILES['add_img8']['name']))
	{

		$image_name=time()."_".$_FILES['add_img8']['name'];
		$image_type=$_FILES['add_img8']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['add_img8']['size'];
		$temp_name=$_FILES['add_img8']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					add_img8='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	if(!empty($_FILES['add_img9']['name']))
	{

		$image_name=time()."_".$_FILES['add_img9']['name'];
		$image_type=$_FILES['add_img9']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['add_img9']['size'];
		$temp_name=$_FILES['add_img9']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					add_img9='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	if(!empty($_FILES['add_img10']['name']))
	{

		$image_name=time()."_".$_FILES['add_img10']['name'];
		$image_type=$_FILES['add_img10']['type'];
		$type=explode("/","$image_type");
		$image_size=$_FILES['add_img10']['size'];
		$temp_name=$_FILES['add_img10']['tmp_name'];
		$dir="post_img/";
		$uploadimage=$dir.$image_name;
		$upload=move_uploaded_file($temp_name,$uploadimage);
		$pageUpdSql1 = "update ignore tbl_pagecontent set 
					add_img10='".$image_name."' where id='".$_REQUEST['pgid']."'";
		$pageUpdExe = mysqli_query($conn,$pageUpdSql1) or die(mysqli_error($conn));
	}
	
		
		
		
		
		// $reccount1=$_REQUEST['reccount1'];
		// for($i=1; $i<=$reccount1; $i++)
		// {
// 			
		// $pageeditSql="update tbl_cms_details set
					// page_id='".$_REQUEST['pgid']."', 
					// page_heading='".mysqli_real_escape_string($conn,$_REQUEST['additionallebel'.$i])."', 
					// page_details='".mysqli_real_escape_string($conn,$_REQUEST['additionalcontent'.$i])."'
					// where cms_id='".mysqli_real_escape_string($conn,$_REQUEST['cms_id'.$i])."'
					// ";
					// $pageeditRs=mysqli_query($conn,$pageeditSql);
// 			
		// }	
// 		
		// $fieldcount=$_REQUEST['hiddencount'];
// 		
// 		
		// for($i=1; $i<$fieldcount; $i++){
// 						
// 						
					// if($_REQUEST['addlebel'.$i]!='')
					// {
					// $pageaddSql="insert into tbl_cms_details set
					// page_id='".$_REQUEST['pgid']."', 
					// page_heading='".mysqli_real_escape_string($conn,$_REQUEST['addlebel'.$i])."', 
					// page_details='".mysqli_real_escape_string($conn,$_REQUEST['addcontent'.$i])."'
					// ";
					// mysqli_query($conn,$pageaddSql);
					// }
		// }
		
		if($pageUpdExe){
		$cmsmessage = showMessage("Page Content Updated Successfully.",'success');
		}else{
		$cmsmessage = showMessage("Server Problem! Try after some time",'error');
		}

}
?>